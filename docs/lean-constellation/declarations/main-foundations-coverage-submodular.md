[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md)

# `coverage_submodular`

Union/intersection submodularity of explicit feature-union coverage.

- Kind: `theorem`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Theorems.coverage_submodular`
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
# lean-constellation target: `coverage_submodular`

For arbitrary `S T : Finset Element`, `coverage (S ∪ T) + coverage (S ∩ T) ≤ coverage S + coverage
T`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 11–16

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`

## Proof outline

Unfold `coverage` and put `A = S.biUnion elementFeatures`, `B = T.biUnion elementFeatures`, and `C =
(S ∩ T).biUnion elementFeatures`. Rewrite the covered features of `S ∪ T` with
`Finset.union_biUnion`, obtaining `A ∪ B`. Use `Finset.biUnion_subset_biUnion_of_subset_left
elementFeatures Finset.inter_subset_left` and the analogous lift of `Finset.inter_subset_right` to
show `C ⊆ A` and `C ⊆ B`; combine them into `C ⊆ A ∩ B`. By `Finset.card_mono`, `C.card ≤ (A ∩
B).card`. Add `(A ∪ B).card` to both sides, then rewrite the right-hand side using
`Finset.card_inter_add_card_union A B` to get `(A ∪ B).card + C.card ≤ A.card + B.card` (commuting
addends if required). Cast this natural inequality to `ℝ` using `Nat.cast_le` and normalize cast
addition, yielding exactly `coverage (S ∪ T) + coverage (S ∩ T) ≤ coverage S + coverage T`. This
uses `elementFeatures : Element → Finset Feature` throughout and adds no hypotheses.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 11–16

## Proof dependencies

- `Finset.card_inter_add_card_union` from `Mathlib.Data.Finset.Card`
- `Finset.card_mono` from `Mathlib.Data.Finset.Card`
- `Finset.biUnion_subset_biUnion_of_subset_left` from `Mathlib.Data.Finset.Union`
- `Finset.union_biUnion` from `Mathlib.Data.Finset.Union`
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
theorem coverage_submodular (S T : Finset Element) :
    coverage (S ∪ T) + coverage (S ∩ T) ≤ coverage S + coverage T := by
  unfold coverage
  rw [Finset.union_biUnion]
  have hsub : (S ∩ T).biUnion elementFeatures ⊆
      S.biUnion elementFeatures ∩ T.biUnion elementFeatures := by
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨Finset.biUnion_subset_biUnion_of_subset_left elementFeatures
          Finset.inter_subset_left hx,
        Finset.biUnion_subset_biUnion_of_subset_left elementFeatures
          Finset.inter_subset_right hx⟩
  have hcard := Finset.card_mono hsub
  have hsum := Nat.add_le_add_left hcard
    ((S.biUnion elementFeatures ∪ T.biUnion elementFeatures).card)
  have hrewrite : (S.biUnion elementFeatures ∪ T.biUnion elementFeatures).card +
      (S.biUnion elementFeatures ∩ T.biUnion elementFeatures).card =
      (S.biUnion elementFeatures).card + (T.biUnion elementFeatures).card := by
    simpa [Nat.add_comm] using Finset.card_inter_add_card_union
      (S.biUnion elementFeatures) (T.biUnion elementFeatures)
  have hnat : (S.biUnion elementFeatures ∪ T.biUnion elementFeatures).card +
      ((S ∩ T).biUnion elementFeatures).card ≤
      (S.biUnion elementFeatures).card + (T.biUnion elementFeatures).card := by
    exact hsum.trans_eq hrewrite
  exact_mod_cast hnat
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.coverage`

## Proof dependencies

- `Mathlib:Mathlib.Data.Finset.Card.Finset.card_inter_add_card_union`
- `Mathlib:Mathlib.Data.Finset.Card.Finset.card_mono`
- `Mathlib:Mathlib.Data.Finset.Union.Finset.biUnion_subset_biUnion_of_subset_left`
- `Mathlib:Mathlib.Data.Finset.Union.Finset.union_biUnion`
- `Mathlib:Mathlib.Data.Nat.Cast.Order.Basic.Nat.cast_le`
- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.Feature`
- `current repo:Main.Foundations.coverage`
- `current repo:Main.Foundations.elementFeatures`

## Sources

- `article/sections/02_counterexample.tex:11-16`
