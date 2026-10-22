# Memory-Ordering Bugs (ARM64 / POWER vs x86-64)

> **Status: unverified.** This is reference material supplied by the repo owner. The bug-tracker IDs, file names, line numbers and failure descriptions have not been checked against the primary sources. Confirm each against its linked tracker or mailing-list thread before relying on it, and rewrite any statement you cannot confirm.

## Hardware state diagrams

```text
HARDWARE STORE BUFFER & INVALIDATION QUEUE STATE (ARM64 / POWERPC vs x86-64)
+-----------------------------------------------------------------------------+
| CORE 0 (PRODUCER / NOTIFIER)          | CORE 1 (CONSUMER / WAITER)          |
| L1 Data Cache (0x1000): Payload = 42  | L1 Data Cache (0x1000): Payload = 0 |
| Store Buffer (0x1000):  [42 (Pending)]| Invalidation Queue: [0x1000 Queued] |
| Store Buffer (0x2000):  [Flag = 1]    | Register R1 (Flag): 1 (Visible Now) |
|                                       | Register R2 (Payload): 0 (Stale!)   |
+-----------------------------------------------------------------------------+

REFERENCE COUNT DECREMENT RACE (USE-AFTER-FREE AT 0x3000)
+-----------------------------------------------------------------------------+
| CORE 0 (DROP REF 2 -> 1)              | CORE 1 (DROP REF 1 -> 0 & DELETE)   |
| 0x3000 [Data: 999] <-- Delayed Write  | 0x3008 [Ref_Count: 1 -> 0] (Relaxed)|
| 0x3008 [Ref_Count: 2 -> 1] (Relaxed)  | Calls free(0x3000) BEFORE 999 lands |
+-----------------------------------------------------------------------------+
```

## Original problem statement

Synchronize shared memory across 2 CPU cores at addresses `0x1000` (Payload), `0x2000` (Flag), and `0x3008` (Reference Counter) without allowing Store-Buffer delays, Load-Load hardware reordering, or Store-Load reordering to expose uninitialized bytes (`0`), execute `free(0x3000)` before pending writes complete, or drop thread wakeups.

## Reconstructed bugs from C++ mailing lists, Bugzilla, and production repositories

1. **Omit** `#StoreLoad` barrier in atomic wait/notify state tracking (LLVM `libc++` Issue `#109290`, `__libcpp_contention_notify` in `atomic.cpp`):
   - **Step 1 (Waiter Core 1):** Write integer `1` into `contention_state` at address `0x2000` to register a sleeping thread, and read `platform_state` at address `0x1000` (value `10`).
   - **Step 2 (Notifier Core 0):** Execute `platform_state.fetch_add(1, std::memory_order_release)` at address `0x1000` (updating `10` to `11`), and immediately execute `contention_state.load(std::memory_order_seq_cst)` at address `0x2000`.
   - **Why it fails:** Because `memory_order_release` followed by a `memory_order_seq_cst` load is not a sequential-consistency store, the CPU holds the write `11` inside Core 0's local store buffer while executing the read of `0x2000` early (reading `0` waiters). Core 0 skips the `futex` wake call while Core 1 sees stale value `10` and sleeps forever (deadlock).

2. **Publish** pointer updates with `memory_order_relaxed` instead of `memory_order_release` (CPython Free-Threading Issue `#133980` / PR `#133988` in `Objects/object.c`, and Order-Matching-Engine `ReplicationProtocol` audit):
   - **Step 1 (Writer Core 0):** Write dictionary values `{1: 2}` into heap block `0x1000` (costing 100 nanoseconds to flush from store buffer) and write pointer `0x1000` into `_PyObject_ManagedDictPointer(obj)->dict` at `0x2000` without a release barrier.
   - **Step 2 (Reader Core 1):** Read `0x2000` using `FT_ATOMIC_LOAD_PTR_ACQUIRE`, obtain address `0x1000`, and dereference `0x1000`.
   - **Why it fails:** On x86-64, hardware Total Store Ordering (TSO) hides the bug because x86 stores cannot pass earlier stores. On ARM64, the CPU flushes address `0x2000` to L1 cache before `0x1000`, causing Core 1 to read uninitialized garbage (`0x0`) at `0x1000` and segfault.

3. **Decrement** reference counters using `memory_order_relaxed` or `memory_order_release` alone (`boost::atomic` / `std::shared_ptr` mailing list defect analysis):
   - **Step 1 (Core 0):** Write `999` into shared payload at `0x3000`, then decrement reference count at `0x3008` from `2` to `1` using `fetch_sub(1, std::memory_order_relaxed)`.
   - **Step 2 (Core 1):** Decrement reference count at `0x3008` from `1` to `0` using `fetch_sub(1, std::memory_order_relaxed)`, observe `0`, and immediately invoke `delete` on `0x3000`.
   - **Why it fails:** Without `memory_order_release` on Core 0's decrement and `memory_order_acquire` on Core 1's decrement (`std::memory_order_acq_rel`), Core 0's write of `999` to `0x3000` is reordered *after* Core 1 frees memory block `0x3000`, corrupting the heap allocator's free list.

4. **Pass** impossible memory models to pure stores or Compare-And-Swap failure paths (GCC Bugzilla `PR 124827` and Bloomberg `quantum` Issue `#160` in `quantum_task.h`):
   - **Step 1 (Developer Code):** Call `_status.store(value, std::memory_order_acq_rel)` at line 131 of `SuspensionGuard::set`, or call `x.compare_exchange_weak(y, 0, std::memory_order_relaxed, std::memory_order_release)`.
   - **Why it fails:** A pure `store` performs 0 reads, so `acquire` semantics are physically impossible; similarly, a failed `compare_exchange` performs 0 writes, so `memory_order_release` on the failure argument is undefined behavior in the C++ standard (silently accepted when GCC 16 pass `waccess2` failed to inspect `__tsan_atomic_compare_exchange` builtins under `-fsanitize=thread`).

5. **Wrap** SPSC ring buffer indices using modulo arithmetic before storing into the atomic variable (Facebook `folly::ProducerConsumerQueue` commit history and design notes in `ProducerConsumerQueue.h`):
   - **Step 1 (Producer Core 0):** Advance `localIndex` across a 1024-slot buffer, wrapping `1024 & 1023` back to `0` prior to storing into the atomic cursor, while Consumer Core 1 relies on a cached `remoteIndexCache` of `0`.
   - **Why it fails:** When indices wrap to `0` inside the stored atomic variable instead of increasing monotonically to `UINT64_MAX`, a full queue (`occupancy == 1024`, index `0`) and an empty queue (`occupancy == 0`, index `0`) become numerically identical (`consumer_.localIndex == producer_.localIndex`), causing the consumer's stale cache check to alias and overwrite unread slots.

6. **Rely** on `std::memory_order_consume` for dependency-ordered pointer chasing without hardware barriers (GCC Bugzilla `59448` & WG21 `N4215`):
   - **Step 1 (Producer Core 0):** Write `0x1234` to `Payload[0]` at `0x5000` and store `1` to flag `f` with `memory_order_release`.
   - **Step 2 (Consumer Core 1):** Load `f` with `memory_order_consume` and access `Payload[f - f]` (which algebraically cancels `f` to `Payload[0]`).
   - **Why it fails:** The compiler's optimizer simplifies `f - f` to `0`, severing the machine-register data dependency between the load of `f` and the load of `Payload[0]`. In GCC 4.9.2 (`gcc/config/aarch64/atomics.md`), `MEMMODEL_CONSUME` emitted a bare `ldr` instruction instead of an acquiring `ldar`, allowing the ARM64 CPU to read `Payload[0]` before `f` and return uninitialized value `0xbadf00d`.

7. **Spin** on a `memory_order_relaxed` loop expecting an `acquire` fence *before* the loop or on the *wrong* variable to synchronize payload data (StackOverflow / C++ Concurrency mailing list fence ordering trap):
   - **Step 1 (Core 0):** Write `x = true` (`relaxed`) at `0x1000`, then write `y = true` (`relaxed`) at `0x2000`.
   - **Step 2 (Core 1):** Spin on `while(!y.load(std::memory_order_relaxed))` at `0x2000`, and immediately read `x.load(std::memory_order_relaxed)` at `0x1000`.
   - **Why it fails:** Beginners assume `atomic` prevents reordering across *different* variables. `memory_order_relaxed` only guarantees coherence on a *single* memory address (`0x2000` alone). Without `std::atomic_thread_fence(std::memory_order_release)` between `x` and `y` on Core 0 and `std::atomic_thread_fence(std::memory_order_acquire)` *after* `y.load()` on Core 1, Core 1 speculatively loads `x = false` from `0x1000` before `y = true` arrives at `0x2000`, firing `assert(z != 0)`.

## Summary table of mailing-list and bug-tracker evidence

| Project / Bug Tracker ID | File / Component | Faulty Memory Order Used | Required Fix | Hardware Failure Mechanism |
| --- | --- | --- | --- | --- |
| **LLVM `libc++` `#109290`** | `atomic.cpp` (`__libcpp_contention_notify`) | `fetch_add(1, mo_release)` followed by `load(mo_seq_cst)` | `mo_seq_cst` on the RMW increment (or full `#StoreLoad` fence) | Store buffer delays visibility of increment while subsequent load executes early, missing waiting threads. |
| **CPython `#133980` / `#133988`** | `Objects/object.c` (`_PyObject_GetDictPtr`) | Non-atomic / unordered store paired with `LOAD_PTR_ACQUIRE` | `FT_ATOMIC_STORE_PTR_RELEASE` | Pointer address becomes visible in reader's L1 cache before pointed-to struct fields finish flushing from writer's store buffer. |
| **GCC Bugzilla `59448` / WG21 `N4215`** | `gcc/config/aarch64/atomics.md` (`get_memmodel`) | `std::memory_order_consume` | Promote `MEMMODEL_CONSUME` to `MEMMODEL_ACQUIRE` (`ldar`) | Compiler optimizes away `f - f` register dependency; ARM64 reorders bare `ldr` instructions and reads `0xbadf00d`. |
| **GCC Bugzilla `124827`** | `gimple-ssa-warn-access.cc` | `compare_exchange_weak(..., relaxed, release)` | Failure mode must be `relaxed` or `acquire` (no writes occur on failure) | Invalid C++ memory model; TSan transformed builtin early, suppressing compiler error in GCC 16. |
| **Bloomberg `quantum` `#160`** | `quantum/quantum_task.h` (Line 131) | `_status.store(val, memory_order_acq_rel)` | `_status.store(val, memory_order_release)` | Pure store has no read phase to attach an `acquire` barrier to; triggers `-Winvalid-memory-model`. |
| **Boost / `std::shared_ptr` Refcount** | Control block `fetch_sub` | `fetch_sub(1, memory_order_relaxed)` | `fetch_sub(1, memory_order_acq_rel)` (or `release` + conditional `acquire` fence) | Thread A's mutations to object payload reorder past Thread B's `delete` call, causing use-after-free. |
