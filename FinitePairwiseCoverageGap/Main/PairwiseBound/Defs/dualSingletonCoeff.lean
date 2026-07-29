-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `dualSingletonCoeff`

`dualSingletonCoeff : Element → ℝ` is the singleton part of the dual certificate.  Under `Element =
Fin 5`, its values at elements `0`, `1`, `2`, `3`, and `4` are respectively `3 / 2`, `7 / 2`, `3 /
2`, `3 / 2`, and `3 / 2`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 61–63

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
-/
noncomputable def dualSingletonCoeff (i : Element) : ℝ :=
  if i = 0 then 3 / 2
  else if i = 1 then 7 / 2
  else if i = 2 then 3 / 2
  else if i = 3 then 3 / 2
  else 3 / 2
