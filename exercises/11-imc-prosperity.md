# 11 - IMC Prosperity 4 Trading Algorithm

**Status:** Official 2026 student competition. Python, not a C++ hiring assessment.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Competition: https://www.imc.com/ap/articles/prosperity-4-imc-global-trading-challenge
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Example participant repository (data model, strategies, tests): https://github.com/advitrocks9/imc-prosperity-4
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Exercise
```
Market offers to sell:
Price 100 -> 8 units
Price 101 -> 12 units

Your estimated fair price: 103
Existing position: +15
Position limit for this exercise: +20
```
FOLLOW-UP: DRAW the initial state in the example above.
1. How many units can be bought without exceeding the limit?
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
2. Which prices qualify?
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
3. How should each proposed order be sized?
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
4. What changes if other outstanding buy orders also execute?
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

Read `TradingState`, `OrderDepth`, `Order`; implement only `Trader.run(state)`; run a backtest.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
Check the executable interface directly: the participant notes a mismatch between the wiki description and the backtester data model.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
