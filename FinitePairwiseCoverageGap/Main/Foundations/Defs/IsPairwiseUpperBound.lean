-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight
import FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `IsPairwiseUpperBound`

Define `IsPairwiseUpperBound (q : ℝ)` as the conjunction that there exists `θ : Weight` satisfying
`PairwiseFeasible θ`, and that every arbitrary-real `θ : Weight` satisfying `PairwiseFeasible θ`
obeys `expectedCoverage θ ≤ q`. This requires nonemptiness of the pairwise-feasible domain and a
universal upper bound, but does not require attainment at `q`.

## Sources

- Source `formal_target.lean`, lines 50–53

## Statement dependencies

- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
-/
def IsPairwiseUpperBound (q : ℝ) : Prop :=
  (∃ θ : Weight, PairwiseFeasible θ) ∧
    ∀ θ : Weight, PairwiseFeasible θ → expectedCoverage θ ≤ q
