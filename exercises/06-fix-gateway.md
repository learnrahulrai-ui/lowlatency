# 06 - FIX 4.4 Order Entry and Execution Report Gateway

**Status:** Constructed C++ assignment grounded in real exchange execution reports.
Examples: https://developer.gemini.com/trading/fix/order-entry/examples/execution-reports

Tags: `35=8` Execution Report, `38` order quantity, `14` cumulative executed quantity, `151` remaining quantity.
Examples print `|` for display; the wire separator is byte `0x01`.

## Scenario
```
New order quantity:     100
First execution:        30
Second execution:       25
Cancel request arrives
```
1. Compute cumulative filled and still-open quantity after every event.
2. Build an order-state transition table.
3. Decide how to treat a cancel acknowledgment versus a late execution.

## Implement
FIX framing, tag-value parsing, body-length and checksum validation, sequence numbers, order-ID mapping, execution report handling, replay tests.
