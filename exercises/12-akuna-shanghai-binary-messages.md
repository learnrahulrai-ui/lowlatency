# 12 - Akuna Capital Shanghai: Binary Order Message Analysis

**Status:** Candidate-published C++ code from 2020. Original assessment and input file not independently verified.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
Source: https://gist.github.com/jeb2239/227acb7833948f30c7f4e60982d44ee6
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

The gist defines `Header`, `EntryFields`, `AckFields`, `FillFields`. Header: two-character marker, message type, sequence ID, timestamp, direction, message length. Later functions aggregate fills by trader and entry quantity by instrument.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

## Debugging angle
The source places C++ pointers inside structures meant to describe binary messages. A process-memory pointer is not a portable serialized field.
FACT CHECK: Raw pointer values are meaningful only within a matching address space and lifetime; a pointer field in an in-memory C++ structure is not automatically proof that the serialized wire format contains pointer bytes.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Exercise
```
Trader ABC  Instrument X  Qty 100
Trader DEF  Instrument X  Qty  60
Trader ABC  Instrument Y  Qty  25
```
FOLLOW-UP: DRAW the initial state in the example above.
1. Derive per-trader and per-instrument totals by hand.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
2. Write an independent binary encoder and decoder.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
3. Test truncated messages, invalid lengths, multiple counterparties, 32-bit vs 64-bit builds.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
4. Review `step3`, `step4`, `step5` and the binary read loop in `main()` of the gist.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
