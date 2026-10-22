# 07 - Pre-Trade Risk Server and Kill Switch

**Status:** Constructed C++ assignment, based on exchange rules and regulatory background (SEC Rule 15c3-5 describes market-access controls; it is not a programming assignment).
- Cboe risk controls: https://www.cboe.com/us/equities/trading/offerings/risk_management/
- Futures risk spec: https://www.cboe.com/document/tech-spec/content/technical-specifications/cboe-titanium-cboe-futures-exchange-risk-management-specification/risk-controls-summary

## Artificial limits
```
Maximum order quantity:  100 shares
Maximum order value:     $5,000

Order A: 30 shares @ $200
Order B: 80 shares @ $ 40
Order C: 101 shares @ $40
```
1. Compute each order's value.
2. Decide independently whether the quantity and value limits are violated.

## Then add
Duplicate requests, simultaneous clients, cancellations, partial fills, a kill-switch command.

## Order of work
Single-threaded, deterministic tests first. Then concurrency: which shared quantities must be updated together? An order rejected by one rule must not change any exposure counter.
