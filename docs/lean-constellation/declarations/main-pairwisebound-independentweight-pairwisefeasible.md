[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `independentWeight_pairwiseFeasible`

The independent-product weight satisfies all pairwise-feasibility constraints.

- Kind: `theorem`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.independentWeight_pairwiseFeasible`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

`independentWeight_pairwiseFeasible` states `PairwiseFeasible independentWeight`.  Equivalently, this particular full-domain weight is nonnegative on every finite subset, has total mass `1`, has each prescribed singleton moment, and has each prescribed ordered-pair moment `marginal i * marginal j` for all `i < j`, without weakening any part of the Foundations feasibility predicate.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `independentWeight_pairwiseFeasible`

`independentWeight_pairwiseFeasible` states `PairwiseFeasible independentWeight`.  Equivalently,
this particular full-domain weight is nonnegative on every finite subset, has total mass `1`, has
each prescribed singleton moment, and has each prescribed ordered-pair moment `marginal i * marginal
j` for all `i < j`, without weakening any part of the Foundations feasibility predicate.

## Sources

- Source `formal_target.lean`, lines 38–43

## Statement dependencies

- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.PairwiseBound::independentWeight` → `independentWeight` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight`
-/
theorem independentWeight_pairwiseFeasible : PairwiseFeasible independentWeight := by
  sorry
```

## Proof NL

Keep the accepted goal `PairwiseFeasible independentWeight` unchanged.  Unfold `PairwiseFeasible` and `MarginalFeasible`, and write `p i = marginal i` and `q i = 1 - marginal i`.  For every subset `S`, use `Finset.prod_ite` on `Finset.univ` to rewrite the accepted definition as
`independentWeight S = (∏ i ∈ S, p i) * (∏ i ∈ (Finset.univ \ S), q i)`.
This factorization is used uniformly below; it does not restrict the `Weight` domain or enumerate only a support family.

For pointwise nonnegativity, prove `0 ≤ p i` and `0 ≤ q i` by `fin_cases i` followed by `norm_num [marginal]`, then apply `Finset.prod_nonneg` to each factor in the displayed factorization.  This proves nonnegativity for an arbitrary `S` algebraically, without a 32-case split.

For total mass, apply `Finset.prod_add p q Finset.univ`.  Rewrite every `p i + q i` to `1`, and rewrite the powerset side with `Finset.powerset_univ`.  By the `prod_ite` factorization, its summand indexed by `S` is exactly `independentWeight S`; hence this powerset sum is the full `Fintype` sum of weights and equals one.

For the first moment at `i`, apply the same `Finset.prod_add` identity with the complement factor at `i` replaced by `0` and with the ordinary `q` factor elsewhere.  In the resulting powerset sum, every subset omitting `i` has a zero complementary product, while the surviving terms are exactly the `independentWeight S` with `i ∈ S`.  The product on the other side reduces to `p i`; use `fin_cases i` and `norm_num [marginal]` only to simplify the five concrete marginal values, obtaining the prescribed first moment.

For the ordered-pair moment, fix `i j` and `hij : i < j`.  Use the analogous `Finset.prod_add` expansion with zero complement factors at both `i` and `j`.  Only powerset terms containing both indices survive, and `prod_ite` identifies their summands with `independentWeight S`; the left-hand product is `p i * p j`.  Use `fin_cases i`, `fin_cases j`, and `norm_num [marginal] at hij ⊢` solely to simplify the five-valued marginal table and eliminate non-increasing index pairs, concluding `marginal i * marginal j`.  This proves all four original feasibility fields via the same product/powerset calculation and supplies the required nonempty-domain witness.

## Proof Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.GroupWithZero.Finset
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.SDiff
import Mathlib.Data.Fintype.Powerset
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum.Core
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `independentWeight_pairwiseFeasible`

`independentWeight_pairwiseFeasible` states `PairwiseFeasible independentWeight`.  Equivalently,
this particular full-domain weight is nonnegative on every finite subset, has total mass `1`, has
each prescribed singleton moment, and has each prescribed ordered-pair moment `marginal i * marginal
j` for all `i < j`, without weakening any part of the Foundations feasibility predicate.

## Sources

- Source `formal_target.lean`, lines 38–43

## Statement dependencies

- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.PairwiseBound::independentWeight` → `independentWeight` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight`

## Proof outline

Keep the accepted goal `PairwiseFeasible independentWeight` unchanged.  Unfold `PairwiseFeasible`
and `MarginalFeasible`, and write `p i = marginal i` and `q i = 1 - marginal i`.  For every subset
`S`, use `Finset.prod_ite` on `Finset.univ` to rewrite the accepted definition as
`independentWeight S = (∏ i ∈ S, p i) * (∏ i ∈ (Finset.univ \ S), q i)`.
This factorization is used uniformly below; it does not restrict the `Weight` domain or enumerate
only a support family.

For pointwise nonnegativity, prove `0 ≤ p i` and `0 ≤ q i` by `fin_cases i` followed by `norm_num
[marginal]`, then apply `Finset.prod_nonneg` to each factor in the displayed factorization.  This
proves nonnegativity for an arbitrary `S` algebraically, without a 32-case split.

For total mass, apply `Finset.prod_add p q Finset.univ`.  Rewrite every `p i + q i` to `1`, and
rewrite the powerset side with `Finset.powerset_univ`.  By the `prod_ite` factorization, its summand
indexed by `S` is exactly `independentWeight S`; hence this powerset sum is the full `Fintype` sum
of weights and equals one.

For the first moment at `i`, apply the same `Finset.prod_add` identity with the complement factor at
`i` replaced by `0` and with the ordinary `q` factor elsewhere.  In the resulting powerset sum,
every subset omitting `i` has a zero complementary product, while the surviving terms are exactly
the `independentWeight S` with `i ∈ S`.  The product on the other side reduces to `p i`; use
`fin_cases i` and `norm_num [marginal]` only to simplify the five concrete marginal values,
obtaining the prescribed first moment.

For the ordered-pair moment, fix `i j` and `hij : i < j`.  Use the analogous `Finset.prod_add`
expansion with zero complement factors at both `i` and `j`.  Only powerset terms containing both
indices survive, and `prod_ite` identifies their summands with `independentWeight S`; the left-hand
product is `p i * p j`.  Use `fin_cases i`, `fin_cases j`, and `norm_num [marginal] at hij ⊢` solely
to simplify the five-valued marginal table and eliminate non-increasing index pairs, concluding
`marginal i * marginal j`.  This proves all four original feasibility fields via the same
product/powerset calculation and supplies the required nonempty-domain witness.

## Proof sources

- Source `formal_target.lean`, lines 32–43

## Proof dependencies

- `Fin.prod_univ_succ` from `Mathlib.Algebra.BigOperators.Fin`
- `Finset.prod_congr` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_congr` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_filter` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.prod_ite` from `Mathlib.Algebra.BigOperators.Group.Finset.Piecewise`
- `Finset.prod_eq_zero` from `Mathlib.Algebra.BigOperators.GroupWithZero.Finset`
- `Finset.prod_add` from `Mathlib.Algebra.BigOperators.Ring.Finset`
- `Finset.prod_nonneg` from `Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset`
- `Finset.powerset` from `Mathlib.Data.Finset.Powerset`
- `Finset.mem_sdiff` from `Mathlib.Data.Finset.SDiff`
- `Finset.powerset_univ` from `Mathlib.Data.Fintype.Powerset`
- `Lean.Elab.Tactic.finCases` from `Mathlib.Tactic.FinCases`
- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::marginal` → `marginal` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
- `Main.PairwiseBound::independentWeight` → `independentWeight` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight`
-/
theorem independentWeight_pairwiseFeasible : PairwiseFeasible independentWeight := by
  classical
  have weight_eq (S : Finset Element) :
      independentWeight S =
        (∏ i ∈ S, marginal i) * ∏ i ∈ Finset.univ \ S, (1 - marginal i) := by
    rw [independentWeight, Finset.prod_ite]
    have h_mem : (Finset.univ.filter fun i : Element => i ∈ S) = S := by
      ext i
      simp
    have h_not_mem : (Finset.univ.filter fun i : Element => i ∉ S) = Finset.univ \ S := by
      ext i
      simp
    rw [h_mem, h_not_mem]
  have first_moment (i : Element) :
      (∑ S : Finset Element with i ∈ S, independentWeight S) = marginal i := by
    change (∑ S ∈ (Finset.univ : Finset Element).powerset with i ∈ S,
      independentWeight S) = marginal i
    rw [Finset.sum_filter]
    calc
      (∑ S ∈ (Finset.univ : Finset Element).powerset,
          if i ∈ S then independentWeight S else 0) =
          ∑ S ∈ (Finset.univ : Finset Element).powerset,
            (∏ k ∈ S, marginal k) *
              ∏ k ∈ Finset.univ \ S, if k = i then 0 else 1 - marginal k := by
            apply Finset.sum_congr rfl
            intro S hS
            by_cases hi : i ∈ S
            · rw [if_pos hi, weight_eq]
              congr 1
              apply Finset.prod_congr rfl
              intro k hk
              have hki : k ≠ i := by
                intro hki
                subst k
                exact (Finset.mem_sdiff.mp hk).2 hi
              simp [hki]
            · rw [if_neg hi]
              have hz : (if i = i then (0 : ℝ) else 1 - marginal i) = 0 := by simp
              rw [Finset.prod_eq_zero (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hi⟩) hz]
              simp
      _ = ∏ k ∈ (Finset.univ : Finset Element),
          (marginal k + if k = i then 0 else 1 - marginal k) := by
            rw [Finset.prod_add]
      _ = marginal i := by
            fin_cases i <;> simp [marginal, Fin.prod_univ_succ]
  have second_moment (i j : Element) (hij : i < j) :
      (∑ S : Finset Element with i ∈ S ∧ j ∈ S, independentWeight S) =
        marginal i * marginal j := by
    change (∑ S ∈ (Finset.univ : Finset Element).powerset with i ∈ S ∧ j ∈ S,
      independentWeight S) = marginal i * marginal j
    rw [Finset.sum_filter]
    calc
      (∑ S ∈ (Finset.univ : Finset Element).powerset,
          if i ∈ S ∧ j ∈ S then independentWeight S else 0) =
          ∑ S ∈ (Finset.univ : Finset Element).powerset,
            (∏ k ∈ S, marginal k) *
              ∏ k ∈ Finset.univ \ S,
                if k = i ∨ k = j then 0 else 1 - marginal k := by
            apply Finset.sum_congr rfl
            intro S hS
            by_cases hSij : i ∈ S ∧ j ∈ S
            · rw [if_pos hSij, weight_eq]
              congr 1
              apply Finset.prod_congr rfl
              intro k hk
              have hki : k ≠ i := by
                intro hki
                subst k
                exact (Finset.mem_sdiff.mp hk).2 hSij.1
              have hkj : k ≠ j := by
                intro hkj
                subst k
                exact (Finset.mem_sdiff.mp hk).2 hSij.2
              simp [hki, hkj]
            · rw [if_neg hSij]
              by_cases hi : i ∈ S
              · have hj : j ∉ S := fun hj => hSij ⟨hi, hj⟩
                have hz : (if j = i ∨ j = j then (0 : ℝ) else 1 - marginal j) = 0 := by
                  simp
                rw [Finset.prod_eq_zero (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hj⟩) hz]
                simp
              · have hz : (if i = i ∨ i = j then (0 : ℝ) else 1 - marginal i) = 0 := by
                  simp
                rw [Finset.prod_eq_zero (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hi⟩) hz]
                simp
      _ = ∏ k ∈ (Finset.univ : Finset Element),
          (marginal k + if k = i ∨ k = j then 0 else 1 - marginal k) := by
            rw [Finset.prod_add]
      _ = marginal i * marginal j := by
            fin_cases i <;> fin_cases j <;> try norm_num at hij
            all_goals simp [marginal, Fin.prod_univ_succ] at hij ⊢
  refine ⟨?_, ?_⟩
  · refine ⟨?_, ?_, ?_⟩
    · intro S
      rw [weight_eq]
      apply mul_nonneg
      · apply Finset.prod_nonneg
        intro i _
        fin_cases i <;> norm_num [marginal]
      · apply Finset.prod_nonneg
        intro i _
        fin_cases i <;> norm_num [marginal]
    · change (∑ S ∈ (Finset.univ : Finset Element).powerset,
          independentWeight S) = 1
      calc
        (∑ S ∈ (Finset.univ : Finset Element).powerset, independentWeight S) =
            ∑ S ∈ (Finset.univ : Finset Element).powerset,
              (∏ i ∈ S, marginal i) * ∏ i ∈ Finset.univ \ S, (1 - marginal i) := by
                apply Finset.sum_congr rfl
                intro S hS
                exact weight_eq S
        _ = ∏ i ∈ (Finset.univ : Finset Element), (marginal i + (1 - marginal i)) := by
              rw [Finset.prod_add]
        _ = 1 := by simp
    · intro i
      exact first_moment i
  · intro i j hij
    exact second_moment i j hij
```

## Statement dependencies

- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.PairwiseBound.independentWeight`

## Proof dependencies

- `Mathlib:Mathlib.Algebra.BigOperators.Fin.Fin.prod_univ_succ`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.prod_congr`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_congr`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_filter`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Piecewise.Finset.prod_ite`
- `Mathlib:Mathlib.Algebra.BigOperators.GroupWithZero.Finset.Finset.prod_eq_zero`
- `Mathlib:Mathlib.Algebra.BigOperators.Ring.Finset.Finset.prod_add`
- `Mathlib:Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset.Finset.prod_nonneg`
- `Mathlib:Mathlib.Data.Finset.Powerset.Finset.powerset`
- `Mathlib:Mathlib.Data.Finset.SDiff.Finset.mem_sdiff`
- `Mathlib:Mathlib.Data.Fintype.Powerset.Finset.powerset_univ`
- `Mathlib:Mathlib.Tactic.FinCases.Lean.Elab.Tactic.finCases`
- `Mathlib:Mathlib.Tactic.NormNum.Core.Mathlib.Tactic.normNum`
- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.Foundations.marginal`
- `current repo:Main.PairwiseBound.independentWeight`

## Sources

- `formal_target.lean:38-43`
