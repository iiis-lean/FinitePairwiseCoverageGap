-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `independentWeight`

`independentWeight : Weight` is the full Bernoulli-product weight determined by `marginal`.  For
every `S : Finset Element`, it assigns the real value `∏ i : Element, if i ∈ S then marginal i else
1 - marginal i`.  Thus it is defined on every subset of `Element`, including the empty subset,
rather than on a restricted support family.

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::marginal` → `marginal` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
-/
noncomputable def independentWeight : Weight := fun S ↦
  ∏ i : Element, if i ∈ S then marginal i else 1 - marginal i
