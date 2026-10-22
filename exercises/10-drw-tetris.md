# 10 - DRW: Tetris-Style Engine

**Status:** First-hand candidate account of a 2017 exercise, published 2021. The full original specification is not public.
Account: https://news.ycombinator.com/item?id=26629891

The candidate received a sequence of piece placements, computed final board height, wrote tests and a board visualization.

## Reconstructed practice exercise
```
Board: 6 columns wide
Piece:  [##]
Landing column: 2
Next piece: [#]
            [#]
```
Questions: where can each piece land? which rows become full? what is the final board height?

Define the rules first (collision, completed-row removal, invalid placements). Write tests before the engine.
