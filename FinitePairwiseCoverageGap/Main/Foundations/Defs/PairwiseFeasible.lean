-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight
import FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `PairwiseFeasible`

Define `PairwiseFeasible (θ : Weight)` as `MarginalFeasible θ` together with the condition that for
every ordered pair `i j : Element` with `i < j`, the finite sum of `θ s` over every `s : Finset
Element` containing both `i` and `j` equals `marginal i * marginal j`. The domain of `θ` remains
arbitrary real-valued `Weight`.

## Sources

- Source `formal_target.lean`, lines 38–43

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::marginal` → `marginal` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
-/
def PairwiseFeasible (θ : Weight) : Prop :=
  MarginalFeasible θ ∧
    ∀ i j : Element, i < j →
      (∑ s : Finset Element with i ∈ s ∧ j ∈ s, θ s) =
        marginal i * marginal j
