# 05 - Cboe Multicast PITCH Order-Book Decoder

**Status:** Official exchange specification; newly constructed C++ assignment.
Spec: https://www.cboe.com/document/tech-spec/document/technical-specifications/cboe-titanium-u.s.-equitiesoptions-multicast-pitch-specification

## Key distinction
| Event | Code | Effect |
|---|---|---|
| Order Executed (visible) | `0x23` | Changes book quantity |
| Trade (non-displayed / routed) | `0x2A` | Does not change the visible book |

## Tasks
1. Read the equity execution layout (`0x23`) and the long equity Trade layout (`0x2A`) in the spec.
2. Feed both into a reconstructed book; maintain traded volume separately.
3. Explain in writing why book quantity and traded volume differ.
4. Extend with `0x24` (execution at price/size). The spec permits executed quantity larger than displayed quantity because some liquidity may be hidden. Decide how your book handles that.
