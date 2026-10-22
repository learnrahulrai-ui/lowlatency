# 04 - Nasdaq TotalView-ITCH 5.0: Binary Market-Data Decoder

**Status:** Exchange specification; reconstructed C++ practice assignment.
- Spec: https://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHSpecification.pdf
- Historical files: https://www.nasdaqtrader.com/content/technicalSupport/specifications/dataproducts/ITCHFTP.pdf

Historical ITCH files are documented as BinaryFile format. They do not by themselves require PCAP or MoldUDP64 parsing.

## Message layouts to read
Add Order `A`, Cancel `X`, Delete `D` (specification printed pages 13-16). Take every length and offset from the spec, not from this file.

## Exercise
Build three messages for order ID 42: add 100 shares, execute 25, cancel 35.
Derive every intermediate book state by hand without losing or reusing shares.

## Implement
- Wire decoding and big-endian integer reads
- Message-length checks
- Order reconstruction
- Sequence validation

## Verify
Compare decoded fields with the spec. Replay a synthetic feed against a simple reference implementation.
