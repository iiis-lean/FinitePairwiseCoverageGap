-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight
import FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `expectedCoverage`

Define `expectedCoverage (θ : Weight) : ℝ` as `∑ s : Finset Element, θ s * coverage s`, the finite
weighted sum over every finite subset of `Element`; `θ` remains an arbitrary real-valued weight
function and is neither restricted nor renormalized.

## Sources

- Source `formal_target.lean`, lines 28–30

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
-/
def expectedCoverage (θ : Weight) : ℝ :=
  ∑ s : Finset Element, θ s * coverage s
