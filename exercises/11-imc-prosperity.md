# 11 - IMC Prosperity 4 Trading Algorithm

**Status:** Official 2026 student competition. Python, not a C++ hiring assessment.
- Competition: https://www.imc.com/ap/articles/prosperity-4-imc-global-trading-challenge
- Example participant repository (data model, strategies, tests): https://github.com/advitrocks9/imc-prosperity-4

## Exercise
```
Market offers to sell:
Price 100 -> 8 units
Price 101 -> 12 units

Your estimated fair price: 103
Existing position: +15
Position limit for this exercise: +20
```
1. How many units can be bought without exceeding the limit?
2. Which prices qualify?
3. How should each proposed order be sized?
4. What changes if other outstanding buy orders also execute?

Read `TradingState`, `OrderDepth`, `Order`; implement only `Trader.run(state)`; run a backtest.
Check the executable interface directly: the participant notes a mismatch between the wiki description and the backtester data model.
