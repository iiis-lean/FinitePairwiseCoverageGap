[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `dualConstant`

Constant coefficient of the exact pairwise dual certificate.

- Kind: `definition`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final statement projection

## Statement NL

`dualConstant` is the real dual constant λ₀, defined to be exactly `1 / 2`.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `dualConstant`

`dualConstant` is the real dual constant λ₀, defined to be exactly `1 / 2`.

## Sources

- Source `article/sections/02_counterexample.tex`, line 61
-/
noncomputable def dualConstant : ℝ := 1 / 2
```

## Proof NL

Not recorded.

## Proof Formal

Not recorded.

## Sources

- `article/sections/02_counterexample.tex:61-61`
