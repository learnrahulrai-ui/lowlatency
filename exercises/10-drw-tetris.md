# 10 - DRW: Tetris-Style Engine

**Status:** First-hand candidate account of a 2017 exercise, published 2021. The full original specification is not public.
FACT CHECK: The public candidate account cannot establish the exact original geometry, scoring, or test behavior; all invented board rules below remain practice assumptions.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
Account: https://news.ycombinator.com/item?id=26629891
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

The candidate received a sequence of piece placements, computed final board height, wrote tests and a board visualization.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

## Reconstructed practice exercise
```
Board: 6 columns wide
Piece:  [##]
Landing column: 2
Next piece: [#]
            [#]
```
FOLLOW-UP: DRAW the initial state in the example above.
Questions: where can each piece land? which rows become full? what is the final board height?
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

Define the rules first (collision, completed-row removal, invalid placements). Write tests before the engine.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
