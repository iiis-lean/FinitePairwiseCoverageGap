[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md)

# `coverage_monotone`

Monotonicity of explicit feature-union coverage under Finset inclusion.

- Kind: `theorem`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Theorems.coverage_monotone`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final proof projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Feature
import FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage
import FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Union
import Mathlib.Data.Nat.Cast.Order.Basic
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `coverage_monotone`

For arbitrary `S T : Finset Element`, if `S ⊆ T`, then `coverage S ≤ coverage T`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 11–16

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`

## Proof outline

Unfold `coverage`, so the goal is the real coercion of the cardinalities of `S.biUnion
elementFeatures` and `T.biUnion elementFeatures`. Apply
`Finset.biUnion_subset_biUnion_of_subset_left elementFeatures h` to obtain the covered-feature
inclusion from the hypothesis `h : S ⊆ T`. Apply `Finset.card_mono` to this inclusion. Finally use
`Nat.cast_le` (or `exact_mod_cast`) to transfer the natural-cardinality inequality to `ℝ`, matching
the accepted real-valued definition of `coverage`. The use of `elementFeatures : Element → Finset
Feature` preserves the declared coverage object and needs no case analysis on the five elements.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 11–16

## Proof dependencies

- `Finset.card_mono` from `Mathlib.Data.Finset.Card`
- `Finset.biUnion_subset_biUnion_of_subset_left` from `Mathlib.Data.Finset.Union`
- `Nat.cast_le` from `Mathlib.Data.Nat.Cast.Order.Basic`
- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::Feature` → `Feature` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Feature`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
- `Main.Foundations::elementFeatures` → `elementFeatures` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures`
-/
theorem coverage_monotone (S T : Finset Element) (h : S ⊆ T) :
    coverage S ≤ coverage T := by
  unfold coverage
  exact_mod_cast Finset.card_mono
    (Finset.biUnion_subset_biUnion_of_subset_left elementFeatures h)
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.coverage`

## Proof dependencies

- `Mathlib:Mathlib.Data.Finset.Card.Finset.card_mono`
- `Mathlib:Mathlib.Data.Finset.Union.Finset.biUnion_subset_biUnion_of_subset_left`
- `Mathlib:Mathlib.Data.Nat.Cast.Order.Basic.Nat.cast_le`
- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.Feature`
- `current repo:Main.Foundations.coverage`
- `current repo:Main.Foundations.elementFeatures`

## Sources

- `article/sections/02_counterexample.tex:11-16`
