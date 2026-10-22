# 12 - Akuna Capital Shanghai: Binary Order Message Analysis

**Status:** Candidate-published C++ code from 2020. Original assessment and input file not independently verified.
Source: https://gist.github.com/jeb2239/227acb7833948f30c7f4e60982d44ee6

The gist defines `Header`, `EntryFields`, `AckFields`, `FillFields`. Header: two-character marker, message type, sequence ID, timestamp, direction, message length. Later functions aggregate fills by trader and entry quantity by instrument.

## Debugging angle
The source places C++ pointers inside structures meant to describe binary messages. A process-memory pointer is not a portable serialized field.

## Exercise
```
Trader ABC  Instrument X  Qty 100
Trader DEF  Instrument X  Qty  60
Trader ABC  Instrument Y  Qty  25
```
1. Derive per-trader and per-instrument totals by hand.
2. Write an independent binary encoder and decoder.
3. Test truncated messages, invalid lengths, multiple counterparties, 32-bit vs 64-bit builds.
4. Review `step3`, `step4`, `step5` and the binary read loop in `main()` of the gist.
