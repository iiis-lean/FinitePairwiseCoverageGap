[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md)

# `MarginalFeasible`

Nonnegative normalized real weights with exact singleton marginals.

- Kind: `definition`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final statement projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight
import FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `MarginalFeasible`

Define `MarginalFeasible (θ : Weight)` as the conjunction that, for every `s : Finset Element`, `0 ≤
θ s`; the total finite sum `∑ s : Finset Element, θ s` equals `1`; and, for every `i : Element`, the
membership-filtered finite sum of `θ s` over subsets `s` containing `i` equals `marginal i`. The
definition adds no support, positivity beyond pointwise nonnegativity, or probability-measure
assumptions.

## Sources

- Source `formal_target.lean`, lines 32–36

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::marginal` → `marginal` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
-/
def MarginalFeasible (θ : Weight) : Prop :=
  (∀ s : Finset Element, 0 ≤ θ s) ∧
    (∑ s : Finset Element, θ s) = 1 ∧
      ∀ i : Element, ∑ s : Finset Element with i ∈ s, θ s = marginal i
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.Weight`
- `current repo:Main.Foundations.marginal`

## Sources

- `formal_target.lean:32-36`
