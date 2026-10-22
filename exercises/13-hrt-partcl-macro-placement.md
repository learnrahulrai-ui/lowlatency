# 13 - HRT x Partcl Macro Placement Challenge 2026

**Status:** Official public hardware/optimization competition. Relevant mainly to FPGA, ASIC, optimization and HPC roles; not an ordinary low-latency C++ hiring test.
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.
Source: https://github.com/partcleda/macro-place-challenge-2026
FOLLOW-UP: VERIFY: Find the original sentence that supports the preceding claim.

Place circuit blocks without overlap while optimizing wirelength, congestion and density. Scoring has a proxy-objective stage and a physical-design stage (see `SCORING.md`, including timing feasibility via worst and total negative slack).
FOLLOW-UP: DRAW: Show the state before the first named operation.

## Steps
1. Read `SETUP.md`.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
2. Inspect the benchmark files (e.g. `ibm01`).
FACT CHECK: Benchmark selection and scoring depend on the challenge's included files and published versions; inspect the actual benchmark rather than treating the sample as the only test.
FOLLOW-UP: CALCULATE: Reproduce one given number from its stated inputs.
3. Implement a legal initial placement and verify validity before optimizing.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
4. Compare every change against the published baseline.
FOLLOW-UP: DERIVE: State one directly testable premise of this assertion.
