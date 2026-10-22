# 08 - Lock-Free C++ SPSC Ring Buffer

**Status:** Independent concurrency practice. Reference source to study afterwards: https://github.com/rigtorp/SPSCQueue

## Scenario
```
Capacity: 4
Producer writes: 10, 20, 30, 40
Producer attempts: 50
Consumer reads:  10
Producer attempts: 50 again
```
1. Draw the queue after each operation.
2. Identify when a write must fail.
3. Implement a single-threaded reference queue.
4. Implement a one-producer/one-consumer atomic version.
5. Verify every value is received exactly once and in order.
6. Only then measure throughput and latency.

## Study questions (after your own version works)
Why might the queue need an extra internal slot? Why acquire/release ordering? Why separate producer and consumer positions onto different cache lines and cache the other side's position locally?
