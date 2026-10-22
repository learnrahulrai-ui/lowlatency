# 13 - HRT x Partcl Macro Placement Challenge 2026

**Status:** Official public hardware/optimization competition. Relevant mainly to FPGA, ASIC, optimization and HPC roles; not an ordinary low-latency C++ hiring test.
Source: https://github.com/partcleda/macro-place-challenge-2026

Place circuit blocks without overlap while optimizing wirelength, congestion and density. Scoring has a proxy-objective stage and a physical-design stage (see `SCORING.md`, including timing feasibility via worst and total negative slack).

## Steps
1. Read `SETUP.md`.
2. Inspect the benchmark files (e.g. `ibm01`).
3. Implement a legal initial placement and verify validity before optimizing.
4. Compare every change against the published baseline.
