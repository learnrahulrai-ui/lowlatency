# 01 - Akuna Capital: Exchange Matching Engine

**Status:** Reported real hiring assessment. Supported by independent candidate accounts (2017, 2022, later). Akuna has not authenticated the posted copies.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

Accounts:
- 2017: https://www.1point3acres.com/bbs/forum.php?mod=viewthread&page=1&tid=306338
FOLLOW-UP: DRAW: Mark the first operation performed by each participant.
- 2022: https://www.1point3acres.com/bbs/forum.php?mod=viewthread&page=1&tid=892408
FOLLOW-UP: DRAW: Mark the first operation performed by each participant.

## Commands
`BUY`, `SELL`, `CANCEL`, `MODIFY`, `PRINT`.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
Orders have price, quantity, ID, and an order type: IOC (immediate-or-cancel) or GFD (good-for-day).
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Sample input
```
BUY GFD 1000 10 order1
BUY GFD 1001 20 order2
SELL GFD 1000 15 order3
PRINT
```
FOLLOW-UP: DRAW the initial state represented by this code example.

## Your tasks
1. Derive the execution order by hand.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
2. Identify which orders remain and with what quantity.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
3. Implement every command.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
4. Reproduce the exact printed book.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
5. Add tests for: unknown IDs, partial fills, a MODIFY that changes side.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Deliverables (see root README)
Input generator, simple reference, deterministic tests, benchmark, short write-up.
FOLLOW-UP: DRAW: Record the initial numerical state before processing the first event.

SOURCE-AUDIT ADDENDUM (2026-10-22)
Status remains candidate-reported, not employer-authenticated. The command list and price-time behavior are specifications to verify from the full candidate report, not proof of current Akuna hiring rules.
ONE ACTION: COPY the first five tokens in the sample BUY command.
