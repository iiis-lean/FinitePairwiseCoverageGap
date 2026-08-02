[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md)

# `unrestrictedWitness`

The exact complete-domain three-support weight witnessing unrestricted value four.

- Kind: `definition`
- Node: `Main.UnrestrictedOptimum`
- Module: `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final statement projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestrictedWitness`

Define `unrestrictedWitness : Weight` as the complete-domain weight function on every `S : Finset
Element` by assigning `3 / 10` to the zero-based support set `{0, 2}`, `7 / 20` to `{1}`, and `7 /
20` to `{3, 4}`; assign `0` to every other finite subset.  The three displayed values are rational
real weights.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 24–39

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
-/
noncomputable def unrestrictedWitness : Weight := fun S ↦
  if S = {0, 2} then 3 / 10
  else if S = {1} then 7 / 20
  else if S = {3, 4} then 7 / 20
  else 0
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.Weight`

## Sources

- `article/sections/02_counterexample.tex:24-39`
