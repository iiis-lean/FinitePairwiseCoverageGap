[← Public API index](../PUBLIC_API.md)

# `IsUnrestrictedOptimum`

Attainment and universal optimality over marginal-feasible weights.

- Kind: `definition`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsUnrestrictedOptimum`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final statement projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight
import FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `IsUnrestrictedOptimum`

Define `IsUnrestrictedOptimum (q : ℝ)` as the conjunction that there exists `θ : Weight` with
`MarginalFeasible θ` and `expectedCoverage θ = q`, and that every arbitrary-real `θ : Weight`
satisfying `MarginalFeasible θ` obeys `expectedCoverage θ ≤ q`. Thus the predicate requires
attainment and the universal upper-bound conclusion.

## Sources

- Source `formal_target.lean`, lines 45–48

## Statement dependencies

- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
-/
def IsUnrestrictedOptimum (q : ℝ) : Prop :=
  (∃ θ : Weight, MarginalFeasible θ ∧ expectedCoverage θ = q) ∧
    ∀ θ : Weight, MarginalFeasible θ → expectedCoverage θ ≤ q
```

## Statement dependencies

- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.Foundations.Weight`
- `current repo:Main.Foundations.expectedCoverage`

## Sources

- `formal_target.lean:45-48`
