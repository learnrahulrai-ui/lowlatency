# 05 - Cboe Multicast PITCH Order-Book Decoder

**Status:** Official exchange specification; newly constructed C++ assignment.
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
Spec: https://www.cboe.com/document/tech-spec/document/technical-specifications/cboe-titanium-u.s.-equitiesoptions-multicast-pitch-specification
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.

## Key distinction
| Event | Code | Effect |
|---|---|---|
| Order Executed (visible) | `0x23` | Changes book quantity |
| Trade (non-displayed / routed) | `0x2A` | Does not change the visible book |

## Tasks
1. Read the equity execution layout (`0x23`) and the long equity Trade layout (`0x2A`) in the spec.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
2. Feed both into a reconstructed book; maintain traded volume separately.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
3. Explain in writing why book quantity and traded volume differ.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
4. Extend with `0x24` (execution at price/size). The spec permits executed quantity larger than displayed quantity because some liquidity may be hidden. Decide how your book handles that.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

SOURCE-AUDIT ADDENDUM (2026-10-22)
REVISION GATE: 0x23, 0x24 and 0x2A are protocol message-type identifiers, not automatically interchangeable with Nasdaq ITCH messages. Before writing tests, choose the Cboe market (equities versus options) and dated PITCH revision, then record the stated length, unit sequence, byte order, order-book effect and any variant fields. The cited specification was NOT exhaustively checked by this audit.
SOURCE: https://www.cboe.com/document/tech-spec/document/technical-specifications/cboe-titanium-u.s.-equitiesoptions-multicast-pitch-specification
ONE ACTION: LOCATE the row defining message type 0x23.
