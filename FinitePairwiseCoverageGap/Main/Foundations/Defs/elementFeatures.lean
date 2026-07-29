-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Feature
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `elementFeatures`

Define `elementFeatures : Element → Finset Feature` by zero-based cases: element `0` maps to `{0,
1}`, `1` maps to `{0, 1, 2, 3}`, `2` maps to `{2, 3}`, `3` maps to `{0, 2}`, and `4` maps to `{1,
3}`.

## Sources

- Source `formal_target.lean`, lines 9–15

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Feature` → `Feature` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Feature`
-/
def elementFeatures : Element → Finset Feature
  | 0 => {0, 1}
  | 1 => {0, 1, 2, 3}
  | 2 => {2, 3}
  | 3 => {0, 2}
  | 4 => {1, 3}
