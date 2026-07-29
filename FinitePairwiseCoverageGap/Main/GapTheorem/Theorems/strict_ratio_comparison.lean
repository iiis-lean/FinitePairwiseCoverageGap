-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.GapTheorem.Prelude
import Mathlib.Tactic.NormNum.Core
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `strict_ratio_comparison`

In the real numbers, the strict rational comparison holds:

\[
(4 : \mathbb{R}) / (479 / 160) > 4 / 3.
\]

All numerals and divisions in this statement are interpreted as real numbers.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 126–131

## Proof outline

Use exact rational normalization over `ℝ`. The `norm_num` tactic evaluates the nonzero denominators
and reduces the goal

`(4 : ℝ) / (479 / 160) > 4 / 3`

to the corresponding strict comparison of explicit rational numerals (equivalently, `640 / 479 > 4 /
3`), which it closes by certified numeral arithmetic. Thus the Proof Formal implementation is simply
`by norm_num`; it introduces no hypotheses, auxiliary cases, or project-level helper lemmas.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 126–131

## Proof dependencies

- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
-/
theorem strict_ratio_comparison :
    (4 : ℝ) / (479 / 160) > 4 / 3 := by
  norm_num
