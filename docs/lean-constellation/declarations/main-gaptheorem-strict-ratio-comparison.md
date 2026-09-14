[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `strict_ratio_comparison`

The explicit ratio 4 / (479 / 160) is strictly greater than 4 / 3.

- Kind: `theorem`
- Node: `Main.GapTheorem`
- Module: `FinitePairwiseCoverageGap.Main.GapTheorem.Theorems.strict_ratio_comparison`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

In the real numbers, the strict rational comparison holds:

\[
(4 : \mathbb{R}) / (479 / 160) > 4 / 3.
\]

All numerals and divisions in this statement are interpreted as real numbers.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.GapTheorem.Prelude
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
-/
theorem strict_ratio_comparison :
    (4 : ℝ) / (479 / 160) > 4 / 3 := by
  sorry
```

## Proof NL

Exact rational normalization over `ℝ` evaluates the nonzero denominators and reduces `(4 : ℝ) / (479 / 160) > 4 / 3` to the corresponding strict comparison of explicit rational numerals, equivalently `640 / 479 > 4 / 3`, which is closed by certified numeral arithmetic. No hypotheses, auxiliary cases, or project-level helper lemmas are mathematically needed.

## Proof Formal

```lean
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
```

## Proof dependencies

- `Mathlib:Mathlib.Tactic.NormNum.Core.Mathlib.Tactic.normNum`

## Sources

- `article/sections/02_counterexample.tex:126-131`
