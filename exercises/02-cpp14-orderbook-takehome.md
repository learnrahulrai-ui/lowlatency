# 02 - C++14 Order Book Take-Home

**Status:** Detailed C++14 take-home preserved in a public repository. The hiring company is not independently established.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
Original assignment: https://github.com/olibre/Cpp14-OrderBook
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

Read only the assignment text first. Do not open the author's solution until yours passes your own tests.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## Required deliverables (six, from the original assignment)
- Order-book reconstruction
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
- Output every tenth message
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- Midquotes
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- Trade-volume aggregation
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
- Malformed-input handling
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- (Check the original assignment text for the remaining requirement and confirm the exact list yourself.)
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## Warm-up
Resting SELL orders are given in the published sample. A new `BUY 3 @ 1050` arrives.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
- Which sell order is used first?
FACT CHECK: The original sample includes additional price levels; preserve the complete original feed and don't infer its price-time rule from only three sell orders.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
- Which order remains partially active?
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.

## Tests you must write
Duplicate order IDs, negative quantities, unknown cancellations, undefined midquotes (empty side).
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.

SOURCE-AUDIT ADDENDUM (2026-10-22)
IMPORTANT CORRECTION: The original assignment is a FEED HANDLER. Its input already includes separate Order A/X/M and Trade T messages. The background matching example describes what the EXCHANGE does; it does not authorize a local feed handler to generate executions from a new BUY on its own. The published 'Problem' has five requirements plus a sixth item containing C++ starter code. Midquotes are output on each input message; a missing side yields the sample NAN. Traded volume is accumulated only for consecutive trades at the most recent trade price; a price change resets that tally. Read the original Problem section before the author's Solution section.
SOURCE: https://github.com/olibre/Cpp14-OrderBook
ONE ACTION: COPY the original action letters from the source's 'Messages' definition.
