[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `dualPairCoeff`

Ordered-pair coefficients of the exact pairwise dual certificate.

- Kind: `definition`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final statement projection

## Statement NL

`dualPairCoeff : Element → Element → ℝ` is the ordered-pair part of the dual certificate.  For the increasing zero-based pairs `(0,1)`, `(1,2)`, `(1,3)`, `(1,4)`, `(0,2)`, `(3,4)`, `(0,3)`, `(0,4)`, `(2,3)`, and `(2,4)`, its values are respectively `-1`, `-1`, `-3 / 2`, `-3 / 2`, `1 / 2`, `1 / 2`, `-1 / 2`, `-1 / 2`, `-1 / 2`, and `-1 / 2`.  It is defined to be `0` on every other ordered pair, including reversed pairs and diagonal pairs.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `dualPairCoeff`

`dualPairCoeff : Element → Element → ℝ` is the ordered-pair part of the dual certificate.  For the
increasing zero-based pairs `(0,1)`, `(1,2)`, `(1,3)`, `(1,4)`, `(0,2)`, `(3,4)`, `(0,3)`, `(0,4)`,
`(2,3)`, and `(2,4)`, its values are respectively `-1`, `-1`, `-3 / 2`, `-3 / 2`, `1 / 2`, `1 / 2`,
`-1 / 2`, `-1 / 2`, `-1 / 2`, and `-1 / 2`.  It is defined to be `0` on every other ordered pair,
including reversed pairs and diagonal pairs.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 64–67

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
-/
noncomputable def dualPairCoeff (i j : Element) : ℝ :=
  if i = 0 ∧ j = 1 then -1
  else if i = 1 ∧ j = 2 then -1
  else if i = 1 ∧ j = 3 then -3 / 2
  else if i = 1 ∧ j = 4 then -3 / 2
  else if i = 0 ∧ j = 2 then 1 / 2
  else if i = 3 ∧ j = 4 then 1 / 2
  else if i = 0 ∧ j = 3 then -1 / 2
  else if i = 0 ∧ j = 4 then -1 / 2
  else if i = 2 ∧ j = 3 then -1 / 2
  else if i = 2 ∧ j = 4 then -1 / 2
  else 0
```

## Proof NL

Not recorded.

## Proof Formal

Not recorded.

## Statement dependencies

- `current repo:Main.Foundations.Element`

## Sources

- `article/sections/02_counterexample.tex:64-67`
