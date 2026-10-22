# 07 - Pre-Trade Risk Server and Kill Switch

**Status:** Constructed C++ assignment, based on exchange rules and regulatory background (SEC Rule 15c3-5 describes market-access controls; it is not a programming assignment).
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Cboe risk controls: https://www.cboe.com/us/equities/trading/offerings/risk_management/
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
- Futures risk spec: https://www.cboe.com/document/tech-spec/content/technical-specifications/cboe-titanium-cboe-futures-exchange-risk-management-specification/risk-controls-summary
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Artificial limits
```
Maximum order quantity:  100 shares
Maximum order value:     $5,000

Order A: 30 shares @ $200
Order B: 80 shares @ $ 40
Order C: 101 shares @ $40
```
FOLLOW-UP: DRAW the initial state in the example above.
1. Compute each order's value.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
2. Decide independently whether the quantity and value limits are violated.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

## Then add
Duplicate requests, simultaneous clients, cancellations, partial fills, a kill-switch command.
FACT CHECK: A kill switch's actual cancellation/rejection semantics depend on the specific exchange rule and phase; the artificial exercise must declare whether existing accepted orders are canceled.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

## Order of work
Single-threaded, deterministic tests first. Then concurrency: which shared quantities must be updated together? An order rejected by one rule must not change any exposure counter.
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.

SOURCE-AUDIT ADDENDUM (2026-10-22)
Artificial per-order $5,000 notional and 100-share quantity limits are practice numbers. Their semantics cannot be attributed to SEC Rule 15c3-5 or to Cboe. The kill switch must declare whether it rejects future orders, cancels resting orders, or both; venue docs determine any real-world behavior. No exposure formula or result is supplied here.
SOURCE: https://www.cboe.com/us/equities/trading/offerings/risk_management/
ONE ACTION: WRITE the two configured maximums without checking an order.
