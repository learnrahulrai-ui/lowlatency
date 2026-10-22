# 06 - FIX 4.4 Order Entry and Execution Report Gateway

**Status:** Constructed C++ assignment grounded in real exchange execution reports.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
Examples: https://developer.gemini.com/trading/fix/order-entry/examples/execution-reports
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

Tags: `35=8` Execution Report, `38` order quantity, `14` cumulative executed quantity, `151` remaining quantity.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
Examples print `|` for display; the wire separator is byte `0x01`.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## Scenario
```
New order quantity:     100
First execution:        30
Second execution:       25
Cancel request arrives
```
FOLLOW-UP: DRAW the initial state represented by this code example.
1. Compute cumulative filled and still-open quantity after every event.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
2. Build an order-state transition table.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
3. Decide how to treat a cancel acknowledgment versus a late execution.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## Implement
FIX framing, tag-value parsing, body-length and checksum validation, sequence numbers, order-ID mapping, execution report handling, replay tests.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

SOURCE-AUDIT ADDENDUM (2026-10-22)
CONSTRUCTED EXERCISE: Gemini examples are venue-specific execution reports, not the complete FIX 4.4 normative standard. A cancel REQUEST does not automatically mean a cancel was accepted; treat order state, FIX session sequence, replay and duplicate execution identity as separate unknowns to specify/test. This note does not fill any transition table.
SOURCE: https://developer.gemini.com/trading/fix/order-entry/examples/execution-reports
ONE ACTION: COPY the value of the FIX MsgType tag used for an execution report.
