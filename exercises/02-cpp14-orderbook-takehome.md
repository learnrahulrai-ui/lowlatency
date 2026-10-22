# 02 - C++14 Order Book Take-Home

**Status:** Detailed C++14 take-home preserved in a public repository. The hiring company is not independently established.
Original assignment: https://github.com/olibre/Cpp14-OrderBook

Read only the assignment text first. Do not open the author's solution until yours passes your own tests.

## Required deliverables (six, from the original assignment)
- Order-book reconstruction
- Output every tenth message
- Midquotes
- Trade-volume aggregation
- Malformed-input handling
- (Check the original assignment text for the remaining requirement and confirm the exact list yourself.)

## Warm-up
Resting SELL orders are given in the published sample. A new `BUY 3 @ 1050` arrives.
- Which sell order is used first?
- Which order remains partially active?

## Tests you must write
Duplicate order IDs, negative quantities, unknown cancellations, undefined midquotes (empty side).
