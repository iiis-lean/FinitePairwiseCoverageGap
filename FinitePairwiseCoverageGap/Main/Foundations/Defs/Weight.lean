-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `Weight`

Define `Weight` as the type `Finset Element → ℝ` of arbitrary real-valued functions on every finite
subset of `Element`, with no nonnegativity, normalization, or feasibility restriction.

## Sources

- Source `formal_target.lean`, line 7

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
-/
abbrev Weight := Finset Element → ℝ
