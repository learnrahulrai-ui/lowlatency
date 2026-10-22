# 09 - Optiver Ready Trader Go (C++ Autotrader)

**Status:** Official public trading competition. Not an employee hiring take-home.
- Rules: https://readytradergo.optiver.com/faqs/
- Example participant code (one participant's choices, not competition rules): https://github.com/russellstanley/optiver-trading

Rules specify C++17, GCC 10.2.1, Linux.

## Files to investigate
`autotrader.cc` (decision logic), `autotrader.h` (callbacks and state), `exchange.json` (simulator configuration), `match_events.csv` (observed outcomes).

## Task
Build a program that receives market information, decides whether to quote buy or sell, and competes in a simulated exchange under position and resource limits. Lot size, position limit and window length found in the example repository are that participant's values; take limits from the official rules.
