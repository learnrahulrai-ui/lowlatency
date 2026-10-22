# 01 - Akuna Capital: Exchange Matching Engine

**Status:** Reported real hiring assessment. Supported by independent candidate accounts (2017, 2022, later). Akuna has not authenticated the posted copies.

Accounts:
- 2017: https://www.1point3acres.com/bbs/forum.php?mod=viewthread&page=1&tid=306338
- 2022: https://www.1point3acres.com/bbs/forum.php?mod=viewthread&page=1&tid=892408

## Commands
`BUY`, `SELL`, `CANCEL`, `MODIFY`, `PRINT`.
Orders have price, quantity, ID, and an order type: IOC (immediate-or-cancel) or GFD (good-for-day).

## Sample input
```
BUY GFD 1000 10 order1
BUY GFD 1001 20 order2
SELL GFD 1000 15 order3
PRINT
```

## Your tasks
1. Derive the execution order by hand.
2. Identify which orders remain and with what quantity.
3. Implement every command.
4. Reproduce the exact printed book.
5. Add tests for: unknown IDs, partial fills, a MODIFY that changes side.

## Deliverables (see root README)
Input generator, simple reference, deterministic tests, benchmark, short write-up.
