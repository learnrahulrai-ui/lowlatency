# lowlatency

Practice problems for low-latency C++ and trading-systems work. This repo holds **problem statements and sources only. No solutions.**
FACT CHECK CORRECTION: This description is outdated: main also contains worked numerical scenarios, CORRECTNESS.md, prediction files and ans files. These are not exclusively original problem statements, and their worked claims require verification.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Rules for every exercise
Produce, in this order:
FOLLOW-UP: CALCULATE: Apply only the first described change to the stated numerical input.
1. An independent input generator
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
2. A simple correctness reference
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
3. Deterministic unit tests
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
4. A benchmark
FOLLOW-UP: CALCULATE: Reproduce one given number from its stated inputs.
5. A short explanation of the measured results
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.

Correctness first; build the optimization argument from measurements.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.

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

## Memory-ordering reference
[memory-ordering/README.md](memory-ordering/README.md): store-buffer and refcount race diagrams, seven reconstructed memory-order bugs, and a summary table. Marked unverified until checked against the linked trackers.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

## Caveat
Public competitions, personal GitHub projects and candidate accounts are not confirmed recruitment assignments. No authenticated hiring take-home was verified for Citadel Securities, Jump Trading, Flow Traders or Tower Research Capital. Your own OrderCache project uses a company-restricted quantity-matching rule, which is different from exchange price-time matching; keep their specifications separate.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.


ADDITIONAL VERIFIED RESEARCH - 2026-10-22
Open 'question bank1.txt' at Appendix G: 48 new unsolved questions Q55-Q102
covering ITCH field lengths, memory mapping/huge pages, CPU timings,
false sharing, C++ atomics, allocation, cache-line diagrams, Linux isolation
and university lab/source provenance.
The original 54 questions and all pre-existing files are retained.
'CORRECTNESS.md' and 'predictnext1.txt' include related additive corrections.
Do not treat copied benchmark numbers or a course title as evidence of a
measured production path or a firm-authenticated assessment.
