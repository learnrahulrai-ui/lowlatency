# 09 - Optiver Ready Trader Go (C++ Autotrader)

**Status:** Official public trading competition. Not an employee hiring take-home.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Rules: https://readytradergo.optiver.com/faqs/
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Example participant code (one participant's choices, not competition rules): https://github.com/russellstanley/optiver-trading
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

Rules specify C++17, GCC 10.2.1, Linux.
FACT CHECK: These are version-specific competition environment requirements; verify the season/date of the referenced Optiver rules before applying them to a different competition.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.

## Files to investigate
`autotrader.cc` (decision logic), `autotrader.h` (callbacks and state), `exchange.json` (simulator configuration), `match_events.csv` (observed outcomes).
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.

## Task
Build a program that receives market information, decides whether to quote buy or sell, and competes in a simulated exchange under position and resource limits. Lot size, position limit and window length found in the example repository are that participant's values; take limits from the official rules.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
