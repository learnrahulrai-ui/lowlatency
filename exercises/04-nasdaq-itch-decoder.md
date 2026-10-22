# 04 - Nasdaq TotalView-ITCH 5.0: Binary Market-Data Decoder

**Status:** Exchange specification; reconstructed C++ practice assignment.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- Spec: https://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHSpecification.pdf
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.
- Historical files: https://www.nasdaqtrader.com/content/technicalSupport/specifications/dataproducts/ITCHFTP.pdf
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.

Historical ITCH files are documented as BinaryFile format. They do not by themselves require PCAP or MoldUDP64 parsing.
FOLLOW-UP: VERIFY: Identify one primary record that would establish or contradict this assertion.

## Message layouts to read
Add Order `A`, Cancel `X`, Delete `D` (specification printed pages 13-16). Take every length and offset from the spec, not from this file.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Exercise
Build three messages for order ID 42: add 100 shares, execute 25, cancel 35.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
Derive every intermediate book state by hand without losing or reusing shares.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Implement
- Wire decoding and big-endian integer reads
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- Message-length checks
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- Order reconstruction
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
- Sequence validation
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## Verify
Compare decoded fields with the spec. Replay a synthetic feed against a simple reference implementation.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.


Appendix: actual ITCH lengths and source-traced follow-up
The specification's Add A is 36 bytes, not 32. Attributed Add F is
40 bytes; Order Executed E is 31, Cancel X 23, Delete D 19.
The printed PDF page 13 includes the detailed A and F field tables.
ITCH A describes an order already accepted into the exchange's displayed
book, not an instruction for a local matching engine to accept an order.
The user-supplied 32-byte synthetic in-memory order record is not a
universal ITCH message. Record it only as an invented storage example.
SOURCE: https://classic.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHSpecification.pdf
ONE ACTION: CALCULATE the byte count of A using the official field lengths,
without using the asserted final count.
