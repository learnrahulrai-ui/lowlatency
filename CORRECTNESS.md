SOURCE STATUS UPDATE 2026-10-22 — READ FIRST
This file combines definitions, illustrative traces, derived error
hypotheses, and some measured-looking but UNSOURCED latency estimates.
The displayed numerical outcomes are PRE-EXISTING teaching examples, not
verified hardware benchmarks and not solutions to the coding assignments.
Do not infer that the atomics traces were observed on a real ARM or x86
machine unless an original report explicitly says so.
Nasdaq ITCH Add A (36 bytes) is an outbound accepted-order event, distinct
from an order-entry command and from a 32-byte custom in-memory object.
C++14 feed handling, HRT Book.py, and a price-time matching engine are
separate specifications. Sequentially consistent atomics do not imply a
universal full CPU pipeline flush. Source provenance and the 27-file
inventory are tracked in SOURCE_AUDIT.txt.
ONE ACTION: COPY a single input number from a selected question before
working through any further line. No implementation or coding solution here.
END SOURCE STATUS UPDATE

CORRECTNESS.md · bug catalogue for exercises/01…13 and memory-ordering/README.md · 0 fixes · 0 solutions · ✓ holds · ✗ breaks · ∴ therefore · → implies · ⚠ source not fetched during writing · FILL / CALCULATE / DRAW / DERIVE = work for reader, answer absent on purpose · rings widen outward, ring N+1 opens only after ring N holds ✓
FOLLOW-UP: VERIFY the first independently testable claim in the previous line against its cited original.

01. AXIOM A1 COUNT: 0 → 1 → 2 → …; adding 1 moves one step forward; every quantity in every exercise = count of shares, slots, bytes, cycles, or messages.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
02. AXIOM A2 BIT: bit ∈ {0,1}; 8 bits = 1 byte; 2×2×2×2×2×2×2×2 = 256 → byte holds {0…255}; 4 bytes = 32 bits → 2^32 = 4,294,967,296 values; 8 bytes = 64 bits → 2^64 = 18,446,744,073,709,551,616 values; signed 32-bit spends 1 bit on sign → max 2^31 − 1 = 2,147,483,647; signed 64-bit max 2^63 − 1 ≈ 9.22×10^18; a ÷ N = q rem r ⇔ a = q·N + r with 0 ≤ r < N; a mod N = r.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
03. AXIOM A2 HEX: 2^4 = 16 → 1 hex digit carries 4 bits → 2 hex digits = 1 byte; 0x1000 = 1×16^3 = 4096; 0x2000 = 2×4096 = 8192; 0x3000 = 3×4096 = 12288; 0x3008 = 12288 + 8 = 12296; 0x5000 = 5×4096 = 20480.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
04. AXIOM A3 MEMORY: memory = row of byte boxes; box number = address; write = put value into box; read (load) = copy value out of box; write = store; box 4096 written with 42 → every later read of box 4096 returns 42 until next write to box 4096.
FACT-CHECK 2026-10-22: CORRECTION: A later read is not guaranteed to return 42 after an unsynchronized concurrent write, a write through an alias, or an invalid access. The claim needs a single-thread/no-intervening-write premise.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
05. AXIOM A3 CORE: core = worker executing one instruction after another; register = box inside core holding one number, cost ≈ 1 cycle; laptop CPU = 4…16 cores; program order = order instructions appear in source text; thread = one program order, run by one core at any instant; compiler = program translating C++ text into core instructions; kernel = operating-system code choosing which thread runs on which core and when.
FACT-CHECK 2026-10-22: CORRECTION: Core count and register latency are machine-dependent; source program order is not an assertion that each source expression becomes one machine instruction.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
06. AXIOM A4 C++ STANDARD (eel.is/c++draft): text fixing what a compiled C++ program may and may not do; every statement tagged A4 traces to [intro.execution], [intro.races], [atomics.order], [atomics.types.operations], [thread.condition], [basic.lval].
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
07. AXIOM A5 CPU MANUALS: Intel SDM vol. 3 memory-ordering chapter (x86-64), Arm Architecture Reference Manual (ARM64), Power ISA (POWER); every hardware statement tagged A5 traces to one of three; latency figures tagged A5 = order of magnitude only.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
08. AXIOM A6 EXCHANGE SPECS: Nasdaq TotalView-ITCH 5.0 PDF (fetched ✓), Cboe Titanium Multicast PITCH spec (fetched ✓), FIX 4.4 spec (⚠); every offset, length, byte order tagged A6 ✓ was read from fetched text.
FACT-CHECK 2026-10-22: SOURCE STATUS: ITCH add/cancel/delete field positions were checked in the exchange PDF; the claimed blanket verification of every field in every cited exchange specification is not established by this audit.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
09. AXIOM A7 ASSIGNMENT TEXT: exercises/01…13 in repo; rule tagged A7 = rule exercise author decides; implementation silent on an A7 rule = ✗ by definition, whatever it outputs.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
10. DEFINITION CORRECT: program correct on input ⇔ output = output from executing every step by hand, one step at a time, in program order, against A7; one ✗ on one input ⇒ program ✗.
FACT-CHECK 2026-10-22: CORRECTION: Agreement with one hand-worked example cannot establish correctness for all inputs, concurrency interleavings, undefined behaviors, or a mistaken reference. Treat as a local test, not a proof.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
11. DEFINITION RING: R1 one user · one laptop · one input → R2 two inputs → R3 1000 inputs → R4 second user on same laptop → R5 third and fourth user → R6 second laptop → R7 one million operations, one user; R(N+1) opens only after R(N) ✓; R(N) ✗ carried into R(N+1) = same ✗ buried under more interleavings → cost of finding it multiplies.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
12. RING R1 · one core · one write · one read: core 0 writes 42 → box 4096; core 0 reads box 4096 → 42 = 42 ✓.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
13. PROBLEM: box 4096 sits in DRAM (main memory chip outside CPU); DRAM reply ≈ 100 ns (A5); clock 3 GHz = 3×10^9 cycles/s → 1 cycle = 1/3 ns → 100 ns = 300 cycles → core waiting on every write loses 300 cycles per write ✗ speed.
FACT-CHECK 2026-10-22: CORRECTION: A normal store need not wait for an entire DRAM access. The stated 300-cycle cost applies only to the assumed serialized stall model and is not a general property of writes.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
14. CACHE = copy of recently touched boxes beside core, reply ≈ 1 ns ≈ 3 cycles (A5); cache line = 64 neighbouring boxes moved as one unit (A5, x86-64 and common ARM64); 4096 ÷ 64 = 64 rem 0 → line 64 holds boxes 4096…4159; 8192 ÷ 64 = 128 rem 0 → line 128 holds 8192…8255 → 4096 and 8192 on different lines.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
15. STORE BUFFER = queue inside one core holding writes not yet placed into cache; core 0 drops "4096 ← 42" into queue → proceeds to next instruction without waiting; queue drains into cache later, at a time core 0 program never sees.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
16. CHECK R1: core 0 reads box 4096 while "4096 ← 42" still queued → core searches own store buffer before cache (store forwarding, A5) → 42 ✓ ∴ one core never observes its own write delay.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
17. RING R2 · one core · two writes · two reads: core 0 writes 4096 ← 42, 8192 ← 1, reads 8192 then 4096 → (1, 42) via forwarding ✓.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
18. RING R3 · one core · 1000 writes: store buffer holds tens of entries (A5) → full buffer → core stalls until drain → time grows, values unchanged ✓.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
19. A4 AS-IF RULE ([intro.execution]): compiler and CPU may reorder, merge, delete, hoist any memory step whose effect one thread cannot observe → every R1–R3 test passes under every reordering ∴ single-thread test suite = 0 bits of evidence about R4.
FACT-CHECK 2026-10-22: CORRECTION: The C++ as-if rule is bounded by observable behavior and memory-model requirements; neither arbitrary reordering nor the phrase 'zero bits of evidence' is a literal general theorem. https://eel.is/c++draft/intro.multithread
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
20. FAILURE F0 · ring jump: 1000-input single-thread suite ✓ → multi-thread build ships → reordering invisible at R3 becomes visible at R4 → ✗ appears once per 10^6…10^9 runs → crash report, 0 reproduction.
FACT-CHECK 2026-10-22: CORRECTION: The stated frequency 'once per 10^6…10^9 runs' is an invented illustrative range, not a sourced defect rate.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
21. RING R4 OPENS · core 1 joins on same laptop:
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.

```
CORE 0 (writer)                                  CORE 1 (reader)
program order:                                   program order:
  s1: box 4096 ← 42                                l1: r1 ← box 8192
  s2: box 8192 ← 1                                 l2: r2 ← box 4096
store buffer: [4096←42][8192←1]                  cache: 4096 = 0   8192 = 0
                        ↑ drain order decides what core 1 reads
possible pairs (r1, r2): (0,0)  (0,42)  (1,42)  (1,0)
```
FOLLOW-UP: DRAW one state transition described by the preceding example.

22. CALCULATE interleavings of {s1,s2} with {l1,l2}, each core's own order fixed: 4 time slots, core 0 takes 2 → slot pairs {1,2} {1,3} {1,4} {2,3} {2,4} {3,4} = 6 sequences; WRITE all 6; FILL (r1, r2) for each; FILL ✓/✗: one-step-at-a-time execution (line 10) produces (1,0).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
23. INVALIDATION QUEUE: core 0 writing box 4096 must tell core 1 "your copy of 4096 stale" = invalidate message; core 1 parks invalidate in queue, acknowledges at once, applies later; core 1 reading 4096 before applying → old 0 (McKenney, "Memory Barriers: a Hardware View for Software Hackers", 2010 ⚠).
FACT-CHECK 2026-10-22: CORRECTION: Treat the queue narrative as a conceptual weak-memory illustration, not a claim that all ARM64/POWER cores expose exactly this named physical queue.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
24. x86-64 (A5, total store order = TSO): store buffer drains first-in first-out → 4096←42 reaches cache before 8192←1; load not reordered with older load ∴ (1,0) forbidden on x86-64 hardware ✓.
FACT-CHECK 2026-10-22: CORRECTION: Even when hardware TSO forbids an outcome in a specific litmus test, a C++ data race is undefined behavior. Hardware-only prohibition does not make an unsynchronized C++ program correct.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
25. ARM64, POWER (A5): store buffer may drain out of order; loads may complete out of order; invalidate may wait in queue ∴ (1,0) permitted ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
26. A4 DATA RACE ([intro.races]): two threads touch one non-atomic box, ≥1 writes, 0 ordering between them → undefined behaviour (A4 places 0 requirements on output) → compiler may keep box 8192 in a register forever → core 1 loop never exits; "passes on x86-64" ≠ defined.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
27. ATOMIC (A4) = box where every read returns one whole written value, never half of two; each atomic box carries one modification order = one sequence of values every core agrees on (coherence).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
28. RELAXED (A4) = atomic read/write with coherence for one box only, 0 promise across two boxes ∴ s1, s2, l1, l2 all relaxed → (1,0) still permitted on ARM64 (lines 25, 27).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
29. RELEASE/ACQUIRE PAIR (A4 [atomics.order]): write W to box F tagged release; read R of box F tagged acquire; R returns value W wrote → every write before W in core 0 program order visible to every read after R in core 1; R returns older value → 0 promise; release with no acquire partner, or acquire with no release partner → 0 promise.
FACT-CHECK 2026-10-22: CORRECTION: The relation is a happens-before order for operations connected by synchronization (including the release sequence), not a blanket promise that every unrelated read on every core sees every write. https://eel.is/c++draft/intro.multithread
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
30. SEQ_CST (A4) = all seq_cst operations on all boxes fit one total order every core agrees on; read-modify-write (RMW) = read, change, write of one box as one atomic step, fetch_add = RMW adding a number, fetch_sub = RMW subtracting; ACQ_REL = RMW tagged release on its write half and acquire on its read half.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
31. STORE→LOAD REORDER: core writes box A (parked in store buffer), then reads box B from cache before A drains → read of B overtakes write of A; permitted on x86-64 (only reordering TSO permits, A5), ARM64, POWER.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
32. COMPARE-EXCHANGE (CAS, A4) = one atomic step: box equals expected → write new value, report success; box differs → copy box's current value into expected, report failure, write 0 bytes; LOCK = box letting one thread at a time through a code region; PRECONDITION = rule A4 requires of caller, violation → undefined behaviour (line 26).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
33. M1 · R4 · relaxed flag carries payload: core 0 writes 4096 ← 42 relaxed, 8192 ← 1 relaxed; core 1 spins (re-reads in a loop until value changes) on 8192 relaxed until 1, reads 4096 → expected 42 → actual 0 on ARM64/POWER (lines 25, 28) ✗; x86-64 hardware hides it (line 24), compiler reordering of relaxed steps still exposes it (line 19) ✗. PROBE: reviewer runs build on ARM64 host, 10^8 rounds, counts rounds with payload 0. EVIDENCE: memory-ordering/README.md claim 7 consistent with A4 ✓; "assert(z != 0)" source ⚠.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
34. M2 · R4 · pointer published before pointee written: core 0 fills record at 4096, stores pointer value 4096 into box 8192 as plain (non-atomic) or relaxed write; core 1 acquire-reads 8192 → 4096 → reads record fields → acquire on core 1 has no release partner on core 0 (line 29) → fields may read 0 ✗. EVIDENCE CORRECTED (fetched ✓): CPython issue #133980 "Some operations on managed dict are not safe from memory_order POV" (May 2025) → confirmed defect = plain store of dict pointer in PyObject_GenericSetDict, Objects/object.c, inside a lock-held region → fixed by PR #133988 (merged 2025-05-20), backport #134354; issue names 0 architectures and reports 0 observed segfaults (kernel killing a process for touching a box it does not own) → memory-ordering/README.md claim 2 "ARM64 segfault" ✗ unsupported by source.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
35. FUTEX WAIT/WAKE: spinning thread burns a core → thread asks kernel to sleep until box 4096 changes from 10; another thread asks kernel to wake sleepers on box 4096; wake with 0 sleepers = no-op; sleeper with 0 later wakes = sleeps forever.
FACT-CHECK 2026-10-22: CORRECTION: Futex wait checks a supplied expected value atomically at sleep entry; a properly rechecked predicate can prevent this invented unconditional missed-wakeup narrative.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
36. M3 · R4 · store→load lost wakeup: notifier writes 4096: 10 → 11 then reads waiter count at 8192; waiter writes 8192: 0 → 1 then reads 4096, sleeps if 10; each core's write parks in its store buffer, each later read overtakes it (line 31) → notifier reads 0 waiters → skips wake; waiter reads 10 → sleeps → expected wake → actual sleep forever ✗ deadlock; pair (0 waiters, 10) permitted on x86-64 too (store-buffering shape). EVIDENCE VERIFIED (fetched ✓): Linux include/linux/wait.h, waitqueue_active() comment: "without the explicit smp_mb() it's possible for the waitqueue_active() load to get hoisted over the @cond store such that we'll observe an empty wait list while the waiter might not observe @cond". EVIDENCE CORRECTED (fetched ✓): LLVM issue #109290 "[libc++] Incorrect memory order in atomic wait" → notifier platform_state.fetch_add(1, release) then contention_state.load(seq_cst), waiter contention_state.fetch_add(1, seq_cst) then platform wait; Herd7 (program enumerating every outcome A4 permits) found a lost-wakeup execution; reporter: "I don't think this is a problem in practice on x86 or ARM" → ✗ at A4 level, 0 hardware observations; root cause disputed in thread → claim 1 "CPU holds 11 in store buffer → deadlock" = model outcome, not observed failure.
FACT-CHECK 2026-10-22: CORRECTION: LLVM #109290's loss scenario was shown in an abstract model and explicitly not reported in practice on x86/ARM. The issue's author described model assumptions and uncertainty. https://github.com/llvm/llvm-project/issues/109290
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
37. ALLOCATOR = code handing out boxes; free = return boxes to allocator → allocator may hand same boxes to next request at once.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
38. M4 · R4 · refcount decrement: object payload box 12288, count box 12296 = 2; core 0 writes 12288 ← 999, decrements 12296: 2 → 1 relaxed; core 1 decrements 12296: 1 → 0 relaxed, sees 0, frees 12288…12296; allocator hands 12288 to new owner; core 0's 999 drains into 12288 after free → new owner's data overwritten ✗ use-after-free; core 1's last reads of payload may also see pre-999 value ✗. EVIDENCE VERIFIED (fetched ✓): Linux include/linux/refcount.h: "The decrements will provide release order, such that all the prior loads and stores will be issued before" and "The decrements dec_and_test() and sub_and_test() also provide acquire ordering on success" → kernel encodes both halves; Boost.Atomic reference-count usage example ⚠.
FACT-CHECK 2026-10-22: CORRECTION: The concrete claim that 999 overwrites allocator memory after free is an illustrative hypothesis requiring proof of reference ownership and allowed accesses; reference-count ordering alone does not establish that the stated schedule occurs.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
39. M5 · R1 · impossible order argument: store performs 0 reads → acquire half of acq_rel attaches to nothing; failed CAS performs 0 writes (line 32) → release on failure argument attaches to nothing; A4 makes both precondition violations → visible with one thread, one call. EVIDENCE VERIFIED (fetched ✓): GCC Bugzilla 124827 "[16 Regression] -Winvalid-memory-model -fsanitize=thread no longer shows warning about invalid model for __atomic_compare_exchange"; Bloomberg quantum issue #160 "GCC 12 warning: Invalid memory model" → quantum/quantum_task.h line 131, Task::SuspensionGuard::set(int), atomic store with memory_order_acq_rel, GCC 12.1 on macOS; closed "not planned" 2026-02-20.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
40. ADDRESS DEPENDENCY: read of box 8192 returns v; next read's address computed from v → ARM64, POWER cannot issue second read before first returns (A5) → order for free; Alpha ⚠ breaks even address dependencies.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
41. M6 · R4 · consume (A4: acquire restricted to reads whose address depends on value read): core 1 reads flag f with memory_order_consume, reads payload at address computed as base + (f − f); compiler folds f − f → 0 → address no longer computed from v → dependency gone (line 40) → CPU issues payload read early → stale payload ✗. EVIDENCE: GCC Bugzilla 59448 "Code generation doesn't respect C11 address-dependency" ✓ fetched (title); WG21 N4215 (2014), P0371 (2016, consume temporarily discouraged, implementations treat consume as acquire) ⚠; claim 6 details "GCC 4.9.2 emitted ldr not ldar", "0xbadf00d" ⚠ unverified.
FACT-CHECK 2026-10-22: CORRECTION: Most real compilers currently implement memory_order_consume as acquire; the dependency-breaking example remains a specification/compiler investigation, not proof that every compiler returns stale data. https://gcc.gnu.org/pipermail/gcc-bugs/2014-October/485661.html
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
42. RING BUFFER = N slots reused in a circle; SPSC = single producer, single consumer = exactly 1 thread writes, exactly 1 thread reads; write cursor counts writes, read cursor counts reads; occupancy = write cursor − read cursor; slot used = cursor mod N.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
43. M7 · R4 · cursor stored already wrapped mod N: occupancy N (full) and occupancy 0 (empty) both give write cursor = read cursor → one test, two meanings ✗; cached copy of far cursor + wrapped values → stale cache compares equal to wrong state ✗. EVIDENCE VERIFIED (fetched ✓): folly/ProducerConsumerQueue.h (main) comment: "with a wrapped cursor, a stale cache can alias to the wrong answer in either direction"; "fullness (occupancy == size) and emptiness (occupancy == 0) … with wrapped indices, both look like consumer_.localIndex == producer_.localIndex, which is why the classic version of this design capped usable capacity at size - 1"; rigtorp SPSCQueue.h: "capacity_++; // Needs one slack element" with cursors reset to 0 at capacity_ → 2 libraries, 2 different answers to 1 ambiguity; CORRECTION: claim 5 cites folly as a bug, source = design comment.
FACT-CHECK 2026-10-22: CORRECTION: Folly's actual queue stores wrapped positions safely with one reserved slot; the unconditional 'wrap = full/empty collision bug' assertion is false without specifying a broken fullness test. https://github.com/facebook/folly/blob/main/folly/ProducerConsumerQueue.h
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
44. M8 · R4 · check-then-act on atomic box: exposure = running sum of accepted order values; exposure box = 4,000, limit 5,000; thread 1 reads 4,000, adds 900 → 4,900 ≤ 5,000 ✓ → writes 4,900; thread 2 reads 4,000 between thread 1's read and write, adds 900 → writes 4,900 → expected 5,800 → actual 4,900 ✗; each step atomic, three-step sequence not atomic.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
45. LINKED LIST: node = boxes holding a value plus address of next node; head = box holding address of first node; pop = CAS head from first node's address to second node's address.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
46. M9 · R5 · ABA: thread 1 reads head = 4096, next = 8192, pauses; thread 2 pops 4096; thread 3 pops 8192, frees 8192; thread 2 pushes 4096 back, next = 12288; thread 1 resumes, CAS sees head 4096 = expected 4096 ✓ → writes head = 8192 → head names freed box ✗; equal value ≠ equal history; needs ≥ 3 actors → R5.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
47. M10 · R4 · seqlock torn read: writer keeps counter box: odd = mid-update, even = stable; writer updates two boxes (price box, quantity box); reader reads counter, copies both boxes, rereads counter, retries on change; hardware: retry catches torn pair (new price, old quantity) ✓; A4: concurrent plain read of boxes being written = data race (line 26) → undefined even when retried ✗. EVIDENCE ⚠: Linux include/linux/seqlock.h; Boehm, "Can Seqlocks Get Along With Programming Language Memory Models?", 2012.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
48. M11 · R4 · volatile: forces every access to touch memory; gives 0 atomicity, 0 inter-thread ordering (A4) → data race (line 26) remains undefined ✗.
FACT-CHECK 2026-10-22: CORRECTION: volatile is not a threading synchronization primitive, but 'forces every access to touch memory' overstates its semantics across compilers and devices.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
49. CONDITION VARIABLE = place where thread sleeps until another thread notifies.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
50. M12 · R4 · condition variable: A4 [thread.condition] permits spurious wakeup → wait returning ≠ condition true ✗ when not rechecked; condition changed without holding lock between waiter's check and waiter's sleep → notify lands before sleep → lost wakeup ✗ (line 36 shape).
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
51. M13 · R4 · weak CAS: A4 permits weak CAS to fail while box = expected; single-shot weak CAS read as "value changed" → wrong branch ✗; failed CAS overwrote expected with current value (line 32) → caller reusing expected as "old value" ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
52. M14 · R6 · second laptop, different architecture (lines 24, 25, 31):
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.

```
                         x86-64 (TSO)     ARM64     POWER
M1 relaxed payload       hidden by hw     ✗         ✗
M2 pointer publish       hidden by hw     ✗         ✗
M3 store→load wakeup     ✗                ✗         ✗
M4 refcount relaxed      hidden by hw     ✗         ✗
M6 consume folded        hidden by hw     ✗         ✗
"hidden by hw" ≠ correct: compiler reordering (line 19) and data-race UB (line 26) act on every column
```
FOLLOW-UP: DRAW one state transition described by the preceding example.

53. M15 · R7 · counter limits: 32-bit refcount after 2^32 = 4,294,967,296 increments → 0 → free while owners hold it ✗; Linux refcount_t saturates at REFCOUNT_SATURATED = INT_MIN/2 = −2^31 ÷ 2 = −1,073,741,824 "and will not move once there" ✓ fetched; 32-bit cursor at 10^7 messages/s → 4,294,967,296 ÷ 10^7 = 429.5 s ≈ 7.2 min → wraps inside first trading hour; 64-bit cursor → 1.8447×10^19 ÷ 10^7 = 1.8447×10^12 s ÷ 31,536,000 s/year ≈ 58,494 years ✓; 2^32 mod 3: 3 × 1,431,655,765 = 4,294,967,295 → remainder 1 ≠ 0 → slot = cursor mod 3 jumps at wrap ✗; 2^32 mod 1024 = 0 ✓.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
54. ORDER = request {side, price, quantity, id}; BUY = bid (pays ≤ price); SELL = ask (receives ≥ price); quantity = count of shares (A1).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
55. BOOK = two sorted lists of resting orders: bids high → low price, asks low → high price; best bid = first bid, best ask = first ask; price level = all resting orders at one price on one side.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
56. CROSS: incoming BUY price ≥ best ask, or incoming SELL price ≤ best bid → trade; trade quantity = min(incoming remaining, resting remaining); trade price = resting order's price (A7, convention ⚠ verify per exercise).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
57. PRICE-TIME PRIORITY: inside one price level, earlier arrival trades first (first in, first out).
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
58. IOC (immediate-or-cancel): remainder after crossing discarded, never rests; GFD (good-for-day): remainder rests until cancelled or day ends (A7 exercises/01).
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
59. INVARIANT I1 CONSERVATION: per order, quantity added = resting + filled + cancelled at every step; book-wide sums obey same equation.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
60. INVARIANT I2 UNCROSSED: after every event completes, best bid < best ask, or one side empty.
FACT-CHECK 2026-10-22: SCOPE: An uncrossed book after matching applies to a completed matching-engine cycle with permitted order types. Historic feed snapshots or deliberately crossed input may not satisfy it.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
61. INVARIANT I3 REJECTION: rejected input leaves book byte-identical to state before input.
FACT-CHECK 2026-10-22: CORRECTION: Rejection generally requires unchanged logical order state, not byte-identical process memory; error counters, logs and allocator state may change.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
62. RING R1 · one input · empty book: BUY GFD 1000 10 order1 → bids {1000: [order1 10]}, asks {} → I1: 10 = 10 + 0 + 0 ✓; I2: ask side empty ✓; I3 n/a ✓.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
63. B1 · R1 · binary fraction price: 1/10 has factor 5 in denominator, base 2 represents only denominators 2^k → 0.1 = 0.000110011001100… repeating → double (8-byte binary fraction format, IEEE 754 ⚠) stores 0.1000000000000000055511151231257827 → 0.1 + 0.2 = 0.30000000000000004 ≠ 0.3 → one decimal price lands on two price levels → priority and best price ✗; A6 ✓: ITCH "Prices are integer fields, supplied with an associated precision", Price(4) = 4 implied decimals; PITCH long price = 8-byte integer, 4 implied decimals; short price = 2-byte integer, 2 implied decimals. PROBE: reviewer feeds prices parsed from decimal text with 4 decimal places and prices reached by repeated addition.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
64. B2 · R1 · malformed input: quantity −5, quantity 0, price "10a0", unknown command, missing field → expected reject + I3 → actual parser half-applies (id inserted into index, then quantity parse fails) → id reserved → later legal order with same id rejected ✗ (I3).
FACT-CHECK 2026-10-22: SCOPE: Some event protocols use zero size to signal cancellation; the exercise-specific input rules must be quoted before zero is universally rejected.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
65. B3 · R1 · cancel unknown id: empty book, CANCEL order9 → expected reject or no-op per A7 → actual std::map (container sorted by key) operator[] lookup inserts a default entry when key missing (A4) → → ghost order of quantity 0 → PRINT shows a level ✗.
FACT-CHECK 2026-10-22: SCOPE: std::map::operator[] inserts when the key is absent, but code that never uses operator[] has no such insertion failure. This is a conditional test, not an observed bug.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
66. RING R2 · two inputs: BUY GFD 1000 10 order1, then SELL GFD 1000 15 order3 → CALCULATE trade quantity min(15, 10) = ___; trade price (line 56) = ___; resting bids = ___; resting asks = ___; I1 for order1 = ___, for order3 = ___ ✓/✗ FILL.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
67. B4 · R2 · trade price from incoming order: SELL 990 crossing resting BUY 1000 → trade printed at 990 instead of 1000 (line 56) → resting buyer receives price never displayed ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
68. B5 · R2 · IOC remainder rests (line 58) → book holds order spec says never rests → later order trades against ghost ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
69. B6 · R2 · duplicate id: order1 resting 10 @ 1000, BUY GFD 1001 5 order1 arrives → expected per A7 (reject) → actual id map overwritten → first order's 10 shares still in price list, unreachable by id → CANCEL order1 removes wrong entry → I1 ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
70. B7 · R2 · modify and priority: orderA then orderB resting at 1000; MODIFY orderA quantity up → A7 decides keep place or move behind orderB; implementation silently keeping place → shares arriving later trade first ✗ vs spec; ITCH Order Replace ✓ fetched: "All remaining shares from the original order are no longer accessible, and must be removed. The new order details are provided for the replacement, along with a new order reference number which will be used henceforth" → replaced order = new arrival; MODIFY changing price or side → A7; HRT question (earlier order at same price updated) → FILL from Book.py + reference output (exercises/03).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
71. B8 · R2 · iterator invalidation: iterator = handle naming one element of a container, erasing element voids handle (A4); matching loop walks a price level, erases fully filled order, advances voided iterator → reads freed node (line 37) ✗; 1 thread suffices.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
72. RING R3 · 1000 inputs: CALCULATE I1 book-wide after every event; first event k with mismatch = first ✗; DERIVE from I2 why best bid 1001 with best ask 1000 after an event completes ⇒ matching skipped ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
73. B9 · R3 · empty level kept: last order at 1001 fills → level 1001 stays with quantity 0 → best bid reported 1001 → midquote uses 1001 ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
74. B10 · R3 · walking levels: Akuna sample (exercises/01: BUY GFD 1000 10 order1, BUY GFD 1001 20 order2, SELL GFD 1000 15 order3) → CALCULATE which level trades first, quantity per trade, book after PRINT = ___ FILL; matching stopping after first level, or starting at worse price, ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
75. B11 · R3 · midquote: (best bid + best ask) ÷ 2 needs both sides; one side empty → expected "undefined" per A7 → actual 0, garbage, or 1000 ÷ 2 = 500 printed as a price ✗; integer prices (1000 + 1001) ÷ 2 = 1000 rem 1 → 1000.5 truncated to 1000 ✗ unless A7 says so.
FACT-CHECK 2026-10-22: CORRECTION: The preserved C++14 source specifies the textual output NAN when a midquote is undefined. Do not label its exact expected output only 'undefined'. https://github.com/olibre/Cpp14-OrderBook
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
76. B12 · R4 · two gateway threads (threads receiving client messages), one book: arrival order at book ≠ arrival order at gateways → time priority assigned by lock acquisition order → same input replayed → different trades ✗ determinism; book written by two threads without one owner → data race (line 26) ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
77. B13 · R5 · id reuse: order7 cancelled by client 1, client 3 submits new order7 → A7 decides reuse; client 1's late duplicate CANCEL order7 removes client 3's order ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
78. B14 · R6 · second laptop: PRINT iterates a hash container (keys placed by hash-function value, not by key order) → order depends on library implementation and hash seed → two laptops print one book in two line orders ✗ vs sorted output; float formatting differs across libraries ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
79. EVIDENCE R6 Knight Capital (SEC press release 2013-222 ✓ fetched): 2012-08-01, new code deployed incorrectly in a single order router; function unused since 2005 triggered; > 4 million orders in first 45 min while trying to fill 212 customer orders; > 397 million shares traded; loss > $460 million; Rule 15c3-5 (market access rule) violated; $12 million penalty; "eight servers, one not updated, repurposed Power Peg flag" = SEC order 34-70694 ⚠ (sec.gov returned 403); mechanism: machine 2 state ≠ machine 1 state → R6 never verified.
FACT-CHECK 2026-10-22: SOURCE LIMIT: The 2012 Knight Capital event is documented by SEC enforcement records, but the exact claims about individual router flags/servers must be confirmed against the original SEC order, not inferred from a summary alone.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
80. B15 · R7 · overflow: ITCH max price 200,000.0000 → raw integer 200,000 × 10^4 = 2,000,000,000 = 0x77359400 ✓ fetched → 2,000,000,000 < 2,147,483,647 ✓ fits signed 32-bit with 147,483,647 spare; notional = price × quantity → raw 2,000,000,000 × 1,000,000 shares = 2×10^15 > 4.29×10^9 ✗ 32-bit, < 9.22×10^18 ✓ 64-bit; 397,000,000 shares in 45 min (line 79) → 4,294,967,295 ÷ 397,000,000 ≈ 10.8 → unsigned 32-bit volume total wraps after 11 such bursts ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
81. WIRE MESSAGE = run of bytes; byte at offset 0 = type letter (A6); multi-byte number spread across neighbouring bytes; spec fixes offset and length of every field.
FACT-CHECK 2026-10-22: CORRECTION: The message type offset 0 is correct for ITCH message bodies; Cboe PITCH messages include a length byte before the type. Do not impose one protocol's layout on another.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
82. BYTE ORDER: 100 = 0x00000064; big-endian (most significant byte first) → bytes 00 00 00 64; little-endian (least significant first) → 64 00 00 00; x86-64 and ARM64 laptops run little-endian (A5).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
83. CALCULATE: bytes 00 00 00 64 read little-endian = 0x64000000 = 6×16^7 + 4×16^6 = 6×268,435,456 + 4×16,777,216 = 1,610,612,736 + 67,108,864 = 1,677,721,600 → expected 100 → actual 1,677,721,600 ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
84. A6 ITCH ✓ fetched: "All integer fields are big endian (network byte order)"; Add Order 'A' = type 0(1) · stock locate 1(2) · tracking 3(2) · timestamp 5(6) · order ref 11(8) · side 19(1) · shares 20(4) · stock 24(8) · price 32(4) → 32 + 4 = 36 bytes; Order Executed 'E' = ref 11(8) · executed shares 19(4) · match number 23(8) → 31 bytes; Order Cancel 'X' = ref 11(8) · cancelled shares 19(4) → 23 bytes; Order Delete 'D' = ref 11(8) → 19 bytes; Order Replace 'U' = original ref 11(8) · new ref 19(8) · shares 27(4) · price 31(4) → 35 bytes; timestamp = "Nanoseconds since midnight".
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
85. A6 PITCH ✓ fetched: "ordered using Little Endian convention (least significant byte first)"; 0x23 Order Executed (equities) = length 0(1) · type 1(1) · time offset 2(4) · order id 6(8) · executed qty 14(4) · execution id 18(8) → 26 bytes; 0x24 Executed at Price/Size = executed qty 14(4) · remaining qty 18(4) · execution id 22(8) · price 30(8) → 38 bytes; 0x2A Trade Long → 41 bytes; sequenced unit header 8 bytes = length(2) · count(1, 0 = heartbeat = message carrying 0 data, proving sender alive) · unit(1) · sequence of first message(4).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
86. D1 · R1 · host-order read: raw 4-byte copy of ITCH shares on little-endian laptop → line 83 ✗; same raw copy of PITCH quantity → ✓ → decoder passing every PITCH test = 0 evidence for ITCH.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
87. D2 · R1 · struct overlay: CPU loads 2-byte number fastest at even address, 4-byte at multiple of 4 (alignment, A5) → compiler inserts padding bytes before misaligned fields → struct {1-byte type, 2-byte locate, …} puts locate at offset 2, spec puts it at 1 → every later field shifted ✗; sizeof(struct) (byte count of struct, A4) ≠ 36 ✗; CALCULATE padded offset of every Add Order field under natural alignment: FILL.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
88. D3 · R1 · 6-byte timestamp: 0 native 6-byte integers; 24 × 3600 = 86,400 s × 10^9 = 8.64×10^13 ns max; 2^48 = 281,474,976,710,656 ≈ 2.81×10^14 > 8.64×10^13 ✓ fits 6 bytes; copied into 32-bit → 2^32 ns = 4.294967296 s → wraps every 4.29 s ✗; 8-byte read at offset 5 pulls 2 bytes of order ref (offsets 11, 12) into timestamp ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
89. D4 · R1 · misaligned cast: byte buffer at offset 11 reinterpreted as pointer to 8-byte integer → address not multiple of 8 → A4 undefined; some ARM cores fault on unaligned multi-byte loads (A5) ✗; reading bytes through pointer of unrelated type = strict-aliasing violation (A4 [basic.lval]) → optimizer reorders reads ✗.
FACT-CHECK 2026-10-22: CORRECTION: Reading a misaligned address as an integer pointer invokes additional alignment/lifetime/aliasing constraints; unaligned hardware loads and C++ undefined behavior are different questions.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
90. D5 · R1 · truncated or mismatched length: buffer holds 20 bytes, type 'A' needs 36 → 16 bytes read past end ✗; PITCH length byte 26 on type 0x24 (needs 38) → must reject ✗ if accepted; unknown type → skip by length field, never by guess ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
91. D6 · R2 · execute before add: feed joined mid-day; 'E' for ref never added → lookup default-creates entry with 0 shares → 0 − 25 unsigned 32-bit = 2^32 − 25 = 4,294,967,271 shares ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
92. D7 · R2 · replace: 'U' carries 0 side, 0 symbol; A6 ✓: "Firms should retain the side, stock symbol and MPID from the original Add Order message" → decoder defaulting side on new ref → sell order reappears as bid ✗; old ref left in map → phantom shares ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
93. D8 · R3 · shares conservation per ref: exercises/04 (ref 42: add 100, execute 25, cancel 35) → FILL remaining after each message; CHECK remaining = added − Σexecuted − Σcancelled ≥ 0 ✓/✗ per step; 'D' removes all remaining.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
94. D9 · R3 · PITCH trade: A6 ✓ "Trade messages … do not alter the book and can be ignored if messages are being used solely to build a book" → decoder subtracting 0x2A quantity from a visible order → book quantity < true ✗; traded volume includes 0x2A → book quantity and traded volume diverge by design → WRITE why (exercises/05).
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
95. D10 · R3 · PITCH 0x24: A6 ✓ "may also be sent in cases where the Executed Quantity is greater than the current booked size for Order Id"; remaining qty 0 → remove → decoder asserting executed ≤ booked aborts ✗; booked − executed unsigned wraps (line 91 arithmetic) ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
96. D11 · R3 · price scale: PITCH long ÷ 10,000, short ÷ 100 (line 63) → one shared divisor → short-format prices off by ×100 ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
97. D12 · R3 · units: PITCH sequence counts per unit (header field unit, line 85) → one global sequence tracker → false gap at every unit switch ✗ or real gap masked ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
98. D13 · R6 · big-endian second machine (POWER BE, s390x ⚠): raw-copy PITCH decoder ✓ on little-endian laptop → ✗ on big-endian host; raw-copy ITCH decoder ✗ on little-endian → ✓ on big-endian → each machine passes half of suite.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
99. D14 · R6 · historical ITCH file framing: BinaryFILE format prefixes each message with a length field (ITCHFTP.pdf ⚠, verify width) → decoder assuming 0 prefix misreads every message after first ✗.
FACT-CHECK 2026-10-22: SOURCE LIMIT: The BinaryFILE framing/length-prefix size must be taken directly from the ITCH historical-file document before any decoder assertions are marked verified.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
100. D15 · R7 · 8-byte day-unique order ref (A6 ✓) stored into 32-bit key → refs 2^32 apart collide ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
101. FIX MESSAGE = text fields "tag=value", each ended by byte 0x01 (SOH); 8 = version, 9 = BodyLength, 35 = message type (35=8 execution report), 38 = OrderQty, 14 = CumQty, 151 = LeavesQty, 39 = OrdStatus, 34 = MsgSeqNum, 43 = PossDupFlag, 17 = ExecID, 11 = ClOrdID (client order id), 10 = CheckSum last (FIX 4.4 ⚠).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
102. BodyLength(9) = byte count from first byte after SOH ending "9=" field through SOH before "10=" (⚠); CheckSum(10) = sum of every byte from message start through SOH before "10=", mod 256, written as 3 digits (⚠).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
103. X1 · R1 · display separator: '|' = byte 124, SOH = byte 1 → each separator differs by 123 → message with s separators → checksum differs by 123·s mod 256; 256 = 2^8, 123 odd → 123 holds 0 factors of 2 → 123·s divisible by 2^8 only when s divisible by 2^8 = 256 → checksum over display text ✗ for every message with s < 256; BodyLength unchanged (1 byte per separator either way) ✓ → length check passes, checksum fails → partial validation hides confusion.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
104. X2 · R1 · BodyLength boundaries: counting from "8=" or including "10=" field → every message rejected ✗, or validation never rejects ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
105. INVARIANT I4: CumQty + LeavesQty = OrderQty while order live; after cancel LeavesQty = 0 → CumQty ≤ OrderQty.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
106. RING R2 · exercises/06 (OrderQty 100, fill 30, fill 25, cancel request) → CALCULATE and FILL:
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.

```
event            CumQty(14)   LeavesQty(151)   OrdStatus(39)   I4 ✓/✗
new 100          ___          ___              ___             ___
fill 30          ___          ___              ___             ___
fill 25          ___          ___              ___             ___
cancel request   ___          ___              ___             ___
cancel ack       ___          ___              ___             ___
                 ↑ request ≠ ack: order live between rows 4 and 5
```
FOLLOW-UP: DRAW one state transition described by the preceding example.

107. X3 · R2 · cancel request treated as cancel: exchange may fill between request and acknowledgement → fill arriving after request discarded → position off by fill quantity ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
108. X4 · R3 · sequence gap: MsgSeqNum 40 → 43 → 41, 42 missing → expected resend request (message asking counterparty to send missing sequence numbers again, ⚠ spec) → actual 43 processed, fills inside 41, 42 lost ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
109. X5 · R3 · replay double count: resent message carries PossDupFlag = Y (⚠) → fill applied twice → CumQty 130 on OrderQty 100 → I4 ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
110. X6 · R6 · failover machine (second host taking over after first host dies): second host restarts MsgSeqNum at 1 while counterparty expects continuation → messages rejected or ignored → orders never acknowledged ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
111. LIMIT = max allowed value per order or per account; EXPOSURE = running sum of accepted-and-open orders plus filled position; KILL SWITCH = flag stopping every new order once set.
FACT-CHECK 2026-10-22: CORRECTION: Account exposure is not generically the simple sum of open-order values and filled position; currency, side, instrument, netting and venue risk rules determine the actual measure.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
112. RING R1 · exercises/07 limits: max quantity 100 shares, max notional $5,000; A = 30 @ 200, B = 80 @ 40, C = 101 @ 40 → CALCULATE notional = quantity × price per order = ___; CHECK quantity ≤ 100 and notional ≤ 5,000 independently: FILL 6 cells ✓/✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
113. K1 · R2 · rejected order mutates exposure: counter incremented before checks, 0 rollback on reject → next legal order rejected for phantom exposure ✗ (I3 shape).
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
114. K2 · R2 · release on cancel: order 100, fill 30, cancel → exposure released by 100 (original) instead of 70 (remaining) while 30 enters position → exposure under-counted by 30 ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
115. K3 · R2 · duplicate request: client retries same ClOrdID → counted twice → legal orders rejected ✗, or both sent → double position ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
116. K4 · R4 · check-then-act (M8 shape): exposure 4,000, limit 5,000, two threads each send 900 → each sees 4,900 ≤ 5,000 ✓ → total 5,800 > 5,000 ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
117. K5 · R4 · two counters, one decision: quantity counter and notional counter updated as two separate atomic steps → reader between steps sees new quantity with old notional → decision on a state never existing ✗.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
118. K6 · R4 · kill switch race: thread 0 reads kill flag 0 ✓; thread 1 sets flag 1, reports "trading stopped"; thread 0 sends order → order leaves after stop reported ✗; A7 must name one point where stop takes effect.
FOLLOW-UP: DRAW: Show only the first two states named in the previous line.
119. K7 · R5 · four clients, one firm limit: each client under own limit ✓, sum of four > firm limit ✗ when firm-level counter absent.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
120. K8 · R7 · notional overflow: $200,000.00 = 20,000,000 cents × 1,000,000 shares = 2×10^13 > 4.29×10^9 ✗ 32-bit, < 9.22×10^18 ✓ 64-bit; EVIDENCE: Rule 15c3-5 requires pre-order controls; Knight charged under 15c3-5 (line 79 ✓); Cboe risk page ⚠.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
121. RING R1 · exercises/08 (capacity 4; push 10, 20, 30, 40; push 50; pop; push 50) → DRAW slots and both cursors after each of 7 steps; FILL which push fails and why (lines 42, 43).
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
122. S1 · R1 · wrapped cursors, 0 slack slot: after 4 pushes write cursor = read cursor → empty test true with 4 items held ✗ (line 43).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
123. S2 · R4 · publish before construct: write cursor advanced before slot written, or advanced relaxed (M1 shape) → consumer reads slot holding old object ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
124. S3 · R4 · read cursor advanced before value copied out → producer overwrites slot mid-copy ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
125. S4 · R5 · second producer thread: SPSC contract = one writer of write cursor → two producers read same cursor, write same slot → items pushed ≠ items popped + items queued ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
126. S5 · R6 · ✓ on x86-64 laptop → ✗ on ARM64 (line 52, row M1); S6 · R7 · cursor wrap with capacity 3 (line 53) ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
127. Z1 · R6 · pointer in wire struct (exercises/12): pointer = box address inside one process (A3) → 8 bytes on 64-bit build, 4 bytes on 32-bit → struct size differs by 4 per pointer field → file written by one build misread by other ✗; pointer value read back names a box in writer's process, meaningless in reader's → dereference ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
128. Z2 · R1 · struct holding std::string or container written as raw bytes → bytes = heap addresses, not characters ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
129. Z3 · R3 · exercises/12 (ABC X 100, DEF X 60, ABC Y 25) → CALCULATE per-trader and per-instrument totals; CHECK Σper-trader = Σper-instrument = Σall ✓/✗: FILL; EVIDENCE: gist jeb2239/227acb… ⚠ not fetched, exercises/12 claims unverified.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
130. P1 · R2 · position limit vs open orders (exercises/09, 11): limit +20, position +15, open buys outstanding → worst case every open buy fills → CALCULATE buy capacity = limit − position − open buys = ___; capacity computed from position alone → position after fills > limit ✗; IMC breach rule ⚠ verify in competition docs.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
131. P2 · R4 · fill callback before insert acknowledgement → state machine with 0 "pending" state drops fill ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
132. P3 · R6 · exercises/09 environment C++17, GCC 10.2.1, Linux (Optiver FAQ ⚠) → code needing newer library or compiler → 0 build ✗.
FOLLOW-UP: DERIVE: State one testable premise required by the previous assertion.
133. TETRIS (exercises/10): board 6 columns; column height = highest filled cell + 1; piece footprint = columns covered, each with bottom offset; T1 · R1 · landing row taken from leftmost footprint column only → uneven surface → piece overlaps filled cells ✗ → DERIVE landing row from every footprint column: FILL.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
134. T2 · R2 · full rows: rows above a removed row move down one per removed row; two rows full at once → rescanning from wrong row after first removal misses second ✗; T3 · R1 · placement outside 6 columns → A7 reject vs silent clamp ✗.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
135. Q1 · R1 · macro placement (exercises/13): DERIVE overlap test for two rectangles from interval definition [x, x + w) × [y, y + h): FILL; touching edges counted as overlap or not → A7; float coordinates → equality test unreliable (line 63 mechanism) ✗; macro outside canvas ✗; fixed macro moved ✗ (SETUP.md, SCORING.md ⚠).
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
136. RING MAP: R1–R3 checkable by single-thread deterministic tests; R4–R5 checkable only by multi-thread stress on weak-ordering hardware plus A4 reasoning (lines 19, 26); R6 needs a second architecture, second byte order, second library; R7 needs counter arithmetic at 2^32 and 2^64 boundaries; benchmark run before R4 ✓ → throughput measured on a ✗ program.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
137. EVIDENCE STATUS: fetched ✓ = Linux wait.h, Linux refcount.h, folly ProducerConsumerQueue.h, rigtorp SPSCQueue.h, GCC 59448 title, GCC 124827 title, LLVM #109290, CPython #133980, Bloomberg quantum #160, ITCH 5.0 PDF, Cboe PITCH spec, SEC press release 2013-222; corrected = claims 1, 2, 5 in memory-ordering/README.md; ⚠ = McKenney 2010, N4215, P0371, Boehm 2012, seqlock.h, Boost.Atomic docs, FIX 4.4 tag definitions, ITCHFTP framing, SEC order 34-70694, Cboe risk page, Optiver FAQ, IMC docs, Akuna gist, macro-placement SETUP.md and SCORING.md.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.
138. NEW THINGS INTRODUCED WITHOUT DERIVATION: none outside axiom sources A1–A7 (lines 01–09); every term defined on or before its first line of use; constants taken from A5/A6/A7 carry their source at point of use; constants marked ⚠ = taken from source not re-fetched during writing, listed in line 137.
FOLLOW-UP: CALCULATE: Reconstruct the first numerical relation on the previous line without using the supplied result.


APPENDIX: EVIDENCE-TESTED USER SCENARIO, 22 OCT 2026
Do not treat this appended section as a tested trading engine. All pre-existing
lines are preserved; question bank1.txt Appendix G now holds Q55-Q102.

C1: "one million 32-byte NASDAQ ITCH messages" mixes a valid sample length
with a false universal wire format. In ITCH v5.0 A=36, F=40, E=31, X=23,
D=19 bytes. A historical-file wrapper can add framing bytes.
ONE ACTION: CALCULATE the total length of one A event from printed page 13.

C2: A Nasdaq ITCH Add Order message reports an order already accepted onto
the exchange's displayed book; a reconstructed feed is not automatically
a matching-engine instruction or a directly submitted order.
ONE ACTION: DRAW exchange -> Add A event -> local book.

C3: mmap creates a virtual mapping. MAP_HUGETLB is backed by huge pages;
length is rounded to huge-page size and availability may prevent success.
The 30-page assertion for decimal 64,000,000 bytes is insufficient.
ONE ACTION: CALCULATE the whole-page count for 64,000,000 / 2,097,152.

C4: One source-level cast of a raw NIC buffer to a packed struct does not
establish legal C++ object lifetime, alignment, aliasing or endian decoding.
No published result establishes the claimed 3 versus 45 cycle measurements.
ONE ACTION: DRAW three distinct boxes: wire bytes, decoded integer, C++ object.

C5: CPU 'L1 = 1 ns', 'L2 = 4 ns', 'DRAM = 100 ns', mutex = 2 us,
NIC ingress = 50 ns and 14-cycle tick-to-trade are artificial assumptions.
Arithmetic within those figures does not measure live performance.
ONE ACTION: CALCULATE the cycle budget for 500 ns at the supplied 3 GHz.

C6: alignas(64) and 60 bytes of padding are sufficient only for a layout
meeting concrete alignment/size checks and a machine whose interference
region matches the chosen alignment. False sharing is conditional on
concurrent accesses and coherence; no fixed 180-cycle penalty is universal.
ONE ACTION: DRAW the starting position of the second counter in the example.

C7: std::pmr::monotonic_buffer_resource may request upstream storage
after exhausting its initial arena; it is not inherently stack storage.
Zero runtime allocations cannot be inferred from one preallocated vector.
ONE ACTION: DRAW initial buffer -> exhaustion -> upstream allocation.

C8: std::memory_order_seq_cst means specified total order, not a universal
CPU pipeline flush. [[likely]] is C++20, not portable as standard C++17.
The leading-zero/trailing-zero count builtins have undefined zero input
when using GCC __builtin_ctz/ctzll.
ONE ACTION: WRITE 64 zeros as eight groups of eight zero digits.

C9: isolcpus and thread affinity alone cannot eliminate device interrupts,
timer ticks, sibling SMT interference and every involuntary disturbance.
Linux's official CPU isolation guide separates those controls.
ONE ACTION: DRAW the arrival of one IRQ to an otherwise pinned CPU.

C10: The pasted university ranking contains stronger claims than official
syllabi prove. Northwestern CS343 (Winter 2025) really provides a 13-page
producer-consumer lab with ring.[ch], atomics.[ch], harness.c and
spinlock/mutex/semaphore/signal tasks. It does not require MCS lock or
prove that any HFT employer uses the exact lab as a recruiting assessment.
ONE ACTION: CALCULATE threads from the lab's two-producer/four-consumer test.

References:
https://classic.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHSpecification.pdf
https://users.cs.northwestern.edu/~pdinda/os-w25/labs/pclab.pdf
https://man7.org/linux/man-pages/man2/mmap.2.html
https://cdn.kernel.org/doc/html/latest/admin-guide/cpu-isolation.html
https://en.cppreference.com/w/cpp/memory/monotonic_buffer_resource/do_allocate
https://en.cppreference.com/w/cpp/atomic/memory_order
https://gcc.gnu.org/onlinedocs/gcc/Bit-Operation-Builtins.html
END APPENDIX
