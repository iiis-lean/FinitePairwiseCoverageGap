-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `dualConstant`

`dualConstant` is the real dual constant λ₀, defined to be exactly `1 / 2`.

## Sources

- Source `article/sections/02_counterexample.tex`, line 61
-/
noncomputable def dualConstant : ℝ := 1 / 2
