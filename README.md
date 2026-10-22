# lowlatency

Practice problems for low-latency C++ and trading-systems work. This repo holds **problem statements and sources only. No solutions.**

## Rules for every exercise
Produce, in this order:
1. An independent input generator
2. A simple correctness reference
3. Deterministic unit tests
4. A benchmark
5. A short explanation of the measured results

Correctness first; build the optimization argument from measurements.

## Priority order (C++ low-latency hiring prep)
| # | Exercise | Evidence level |
|---|---|---|
| 1 | [Akuna matching engine](exercises/01-akuna-matching-engine.md) | Candidate-reported hiring exercise |
| 2 | [C++14 order-book take-home](exercises/02-cpp14-orderbook-takehome.md) | Preserved spec, company unknown |
| 3 | [HRT order-book workshop](exercises/03-hrt-order-book-workshop.md) | Official workshop |
| 4 | [Nasdaq ITCH decoder](exercises/04-nasdaq-itch-decoder.md) | Official spec, constructed task |
| 5 | [Cboe PITCH decoder](exercises/05-cboe-pitch-decoder.md) | Official spec, constructed task |
| 6 | [FIX gateway](exercises/06-fix-gateway.md) | Constructed task |
| 7 | [Pre-trade risk server](exercises/07-pretrade-risk-server.md) | Constructed task |
| 8 | [SPSC ring buffer](exercises/08-spsc-ring-buffer.md) | Independent practice |

## Other (not C++ low-latency hiring tests)
| # | Exercise | Evidence level |
|---|---|---|
| 9 | [Optiver Ready Trader Go](exercises/09-optiver-ready-trader-go.md) | Public competition |
| 10 | [DRW Tetris engine](exercises/10-drw-tetris.md) | Candidate account (2017) |
| 11 | [IMC Prosperity 4](exercises/11-imc-prosperity.md) | Public competition (Python) |
| 12 | [Akuna Shanghai binary messages](exercises/12-akuna-shanghai-binary-messages.md) | Unverified candidate code |
| 13 | [HRT x Partcl macro placement](exercises/13-hrt-partcl-macro-placement.md) | Public competition (hardware) |

## Caveat
Public competitions, personal GitHub projects and candidate accounts are not confirmed recruitment assignments. No authenticated hiring take-home was verified for Citadel Securities, Jump Trading, Flow Traders or Tower Research Capital. Your own OrderCache project uses a company-restricted quantity-matching rule, which is different from exchange price-time matching; keep their specifications separate.
