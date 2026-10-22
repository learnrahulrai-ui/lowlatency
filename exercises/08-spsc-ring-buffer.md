# 08 - Lock-Free C++ SPSC Ring Buffer

**Status:** Independent concurrency practice. Reference source to study afterwards: https://github.com/rigtorp/SPSCQueue
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Scenario
```
Capacity: 4
Producer writes: 10, 20, 30, 40
Producer attempts: 50
Consumer reads:  10
Producer attempts: 50 again
```
FOLLOW-UP: DRAW the initial state in the example above.
1. Draw the queue after each operation.
FOLLOW-UP: DRAW: Show the state before the first named operation.
2. Identify when a write must fail.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
3. Implement a single-threaded reference queue.
FOLLOW-UP: DRAW: Show the state before the first named operation.
4. Implement a one-producer/one-consumer atomic version.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
5. Verify every value is received exactly once and in order.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
6. Only then measure throughput and latency.
FOLLOW-UP: CALCULATE: Reproduce one given number from its stated inputs.

## Study questions (after your own version works)
Why might the queue need an extra internal slot? Why acquire/release ordering? Why separate producer and consumer positions onto different cache lines and cache the other side's position locally?
FACT CHECK: Reserving a physical slot is an implementation choice used by Folly and Rigtorp; it is not a mandatory requirement of every SPSC queue. https://github.com/facebook/folly/blob/main/folly/ProducerConsumerQueue.h
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
