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
