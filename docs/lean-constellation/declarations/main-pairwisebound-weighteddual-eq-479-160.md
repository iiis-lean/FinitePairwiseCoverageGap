[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `weightedDual_eq_479_160`

Every pairwise-feasible weight gives the exact dual expectation 479/160.

- Kind: `theorem`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.weightedDual_eq_479_160`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

For every `θ : Weight`, if `PairwiseFeasible θ`, then `∑ S : Finset Element, θ S * dualValue S = 479 / 160`.  This is an exact evaluation of the full subset-domain weighted dual value for arbitrary real-valued pairwise-feasible weights, with no independent-witness or restricted-support assumption.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `weightedDual_eq_479_160`

For every `θ : Weight`, if `PairwiseFeasible θ`, then `∑ S : Finset Element, θ S * dualValue S = 479
/ 160`.  This is an exact evaluation of the full subset-domain weighted dual value for arbitrary
real-valued pairwise-feasible weights, with no independent-witness or restricted-support assumption.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 110–120

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`
-/
theorem weightedDual_eq_479_160 (θ : Weight) (hθ : PairwiseFeasible θ) :
    (∑ S : Finset Element, θ S * dualValue S) = 479 / 160 := by
  sorry
```

## Proof NL

Fix arbitrary `θ : Weight` and `hθ : PairwiseFeasible θ`.  Keep the full `Finset Element` sum throughout and unfold `dualValue`, `dualConstant`, `dualSingletonCoeff`, and `dualPairCoeff`.  Put `c = dualConstant`, `a i = dualSingletonCoeff i`, and `b i j = dualPairCoeff i j`.  Distribute `θ S` over the three parts of `dualValue`, use `Finset.mul_sum` and `Finset.sum_mul`, and commute the finite `S`, `i`, and `j` sums with `Finset.sum_comm`.

This rewrites the weighted dual into the coefficient expression
`c * (∑ S, θ S) + ∑ i, a i * (∑ S with i ∈ S, θ S) + ∑ i, ∑ j, if i < j then b i j * (∑ S with i ∈ S ∧ j ∈ S, θ S) else 0`.
Use `Fintype.sum_ite_mem` (and the corresponding filter/sum rewrites) to express the membership indicators as exactly the filtered finite sums in the Foundations definitions; this is a reindexing of the full domain, not a support restriction.

Now use only the stated feasibility equations: the total-mass equality from `hθ.1`, each singleton-moment equality from `hθ.1`, and the pairwise equality `hθ.2 i j hij` only in the `i < j` branch.  Thus the expression becomes
`c + ∑ i, a i * marginal i + ∑ i, ∑ j, if i < j then b i j * (marginal i * marginal j) else 0`.
For the remaining finite `Fin 5` coefficient calculation, unfold the three accepted coefficient definitions and `marginal`; use `fin_cases` for the five indices and `norm_num` (with routine ring normalization if required) to evaluate the exact rational expression.  The result is `479 / 160`, precisely the b_0015 calculation in source lines 115–120 from the b_0014 coefficients.  No step assumes an independent witness, a support restriction, or a nonnegative-subset equality.

## Proof Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum.Core
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `weightedDual_eq_479_160`

For every `θ : Weight`, if `PairwiseFeasible θ`, then `∑ S : Finset Element, θ S * dualValue S = 479
/ 160`.  This is an exact evaluation of the full subset-domain weighted dual value for arbitrary
real-valued pairwise-feasible weights, with no independent-witness or restricted-support assumption.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 110–120

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`

## Proof outline

Fix arbitrary `θ : Weight` and `hθ : PairwiseFeasible θ`.  Keep the full `Finset Element` sum
throughout and unfold `dualValue`, `dualConstant`, `dualSingletonCoeff`, and `dualPairCoeff`.  Put
`c = dualConstant`, `a i = dualSingletonCoeff i`, and `b i j = dualPairCoeff i j`.  Distribute `θ S`
over the three parts of `dualValue`, use `Finset.mul_sum` and `Finset.sum_mul`, and commute the
finite `S`, `i`, and `j` sums with `Finset.sum_comm`.

This rewrites the weighted dual into the coefficient expression
`c * (∑ S, θ S) + ∑ i, a i * (∑ S with i ∈ S, θ S) + ∑ i, ∑ j, if i < j then b i j * (∑ S with i ∈ S
∧ j ∈ S, θ S) else 0`.
Use `Fintype.sum_ite_mem` (and the corresponding filter/sum rewrites) to express the membership
indicators as exactly the filtered finite sums in the Foundations definitions; this is a reindexing
of the full domain, not a support restriction.

Now use only the stated feasibility equations: the total-mass equality from `hθ.1`, each
singleton-moment equality from `hθ.1`, and the pairwise equality `hθ.2 i j hij` only in the `i < j`
branch.  Thus the expression becomes
`c + ∑ i, a i * marginal i + ∑ i, ∑ j, if i < j then b i j * (marginal i * marginal j) else 0`.
For the remaining finite `Fin 5` coefficient calculation, unfold the three accepted coefficient
definitions and `marginal`; use `fin_cases` for the five indices and `norm_num` (with routine ring
normalization if required) to evaluate the exact rational expression.  The result is `479 / 160`,
precisely the b_0015 calculation in source lines 115–120 from the b_0014 coefficients.  No step
assumes an independent witness, a support restriction, or a nonnegative-subset equality.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 44–70
- Source `article/sections/02_counterexample.tex`, lines 110–120

## Proof dependencies

- `Fin.sum_univ_succ` from `Mathlib.Algebra.BigOperators.Fin`
- `Finset.sum_congr` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_filter` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Fintype.sum_ite_mem` from `Mathlib.Algebra.BigOperators.Group.Finset.Piecewise`
- `Finset.sum_comm` from `Mathlib.Algebra.BigOperators.Group.Finset.Sigma`
- `Finset.mul_sum` from `Mathlib.Algebra.BigOperators.Ring.Finset`
- `Finset.sum_mul` from `Mathlib.Algebra.BigOperators.Ring.Finset`
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
- `Main.PairwiseBound::dualConstant` → `dualConstant` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant`
- `Main.PairwiseBound::dualPairCoeff` → `dualPairCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff`
- `Main.PairwiseBound::dualSingletonCoeff` → `dualSingletonCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`
-/
theorem weightedDual_eq_479_160 (θ : Weight) (hθ : PairwiseFeasible θ) :
    (∑ S : Finset Element, θ S * dualValue S) = 479 / 160 := by
  classical
  rcases hθ with ⟨hM, hP⟩
  rcases hM with ⟨h_nonneg, h_mass, h_single⟩
  have sum_single (a : Element → ℝ) :
      (∑ S : Finset Element, θ S * ∑ i ∈ S, a i) =
        ∑ i : Element, a i * (∑ S : Finset Element with i ∈ S, θ S) := by
    calc
      (∑ S : Finset Element, θ S * ∑ i ∈ S, a i) =
          ∑ S : Finset Element, ∑ i : Element,
            if i ∈ S then θ S * a i else 0 := by
              apply Finset.sum_congr rfl
              intro S hS
              rw [← Fintype.sum_ite_mem S a, Finset.mul_sum]
              apply Finset.sum_congr rfl
              intro i hi
              split_ifs <;> simp
      _ = ∑ i : Element, a i * (∑ S : Finset Element with i ∈ S, θ S) := by
            rw [Finset.sum_comm]
            apply Finset.sum_congr rfl
            intro i hi
            rw [Finset.sum_filter, Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro S hS
            split_ifs <;> simp [mul_comm]
  have sum_pair (b : Element → Element → ℝ) :
      (∑ S : Finset Element,
          θ S * ∑ i ∈ S, ∑ j ∈ S, if i < j then b i j else 0) =
        ∑ i : Element, ∑ j : Element,
          if i < j then b i j * (∑ S : Finset Element with i ∈ S ∧ j ∈ S, θ S) else 0 := by
    calc
      (∑ S : Finset Element,
          θ S * ∑ i ∈ S, ∑ j ∈ S, if i < j then b i j else 0) =
          ∑ S : Finset Element, ∑ i : Element, ∑ j : Element,
            if i ∈ S ∧ j ∈ S then θ S * (if i < j then b i j else 0) else 0 := by
              apply Finset.sum_congr rfl
              intro S hS
              rw [← Fintype.sum_ite_mem S (fun i => ∑ j ∈ S,
                if i < j then b i j else 0), Finset.mul_sum]
              apply Finset.sum_congr rfl
              intro i hi
              by_cases his : i ∈ S
              · rw [if_pos his, ← Fintype.sum_ite_mem S (fun j =>
                  if i < j then b i j else 0), Finset.mul_sum]
                apply Finset.sum_congr rfl
                intro j hj
                by_cases hjs : j ∈ S <;> simp [his, hjs]
              · simp [his]
      _ = ∑ i : Element, ∑ S : Finset Element, ∑ j : Element,
            if i ∈ S ∧ j ∈ S then θ S * (if i < j then b i j else 0) else 0 := by
              rw [Finset.sum_comm]
      _ = ∑ i : Element, ∑ j : Element, ∑ S : Finset Element,
            if i ∈ S ∧ j ∈ S then θ S * (if i < j then b i j else 0) else 0 := by
              apply Finset.sum_congr rfl
              intro i hi
              rw [Finset.sum_comm]
      _ = ∑ i : Element, ∑ j : Element,
            if i < j then b i j *
              (∑ S : Finset Element with i ∈ S ∧ j ∈ S, θ S) else 0 := by
              apply Finset.sum_congr rfl
              intro i hi
              apply Finset.sum_congr rfl
              intro j hj
              by_cases hij : i < j
              · simp only [if_pos hij]
                rw [Finset.sum_filter, Finset.mul_sum]
                apply Finset.sum_congr rfl
                intro S hS
                by_cases hSij : i ∈ S ∧ j ∈ S <;> simp [hSij, mul_comm]
              · simp [hij]
  have sum_constant :
      (∑ S : Finset Element, θ S * dualConstant) =
        dualConstant * (∑ S : Finset Element, θ S) := by
    rw [← Finset.sum_mul, mul_comm]
  calc
    (∑ S : Finset Element, θ S * dualValue S) =
        dualConstant * (∑ S : Finset Element, θ S) +
          (∑ i : Element, dualSingletonCoeff i *
            (∑ S : Finset Element with i ∈ S, θ S)) +
          ∑ i : Element, ∑ j : Element,
            if i < j then dualPairCoeff i j *
              (∑ S : Finset Element with i ∈ S ∧ j ∈ S, θ S) else 0 := by
      calc
        (∑ S : Finset Element, θ S * dualValue S) =
            (∑ S : Finset Element, θ S * dualConstant) +
              (∑ S : Finset Element,
                θ S * ∑ i ∈ S, dualSingletonCoeff i) +
              (∑ S : Finset Element,
                θ S * ∑ i ∈ S, ∑ j ∈ S,
                  if i < j then dualPairCoeff i j else 0) := by
              simp only [dualValue, mul_add, Finset.sum_add_distrib]
        _ = dualConstant * (∑ S : Finset Element, θ S) +
              (∑ i : Element, dualSingletonCoeff i *
                (∑ S : Finset Element with i ∈ S, θ S)) +
              ∑ i : Element, ∑ j : Element,
                if i < j then dualPairCoeff i j *
                  (∑ S : Finset Element with i ∈ S ∧ j ∈ S, θ S) else 0 := by
              rw [sum_constant, sum_single, sum_pair]
    _ = dualConstant +
          (∑ i : Element, dualSingletonCoeff i * marginal i) +
          ∑ i : Element, ∑ j : Element,
            if i < j then dualPairCoeff i j * (marginal i * marginal j) else 0 := by
      rw [h_mass]
      simp only [mul_one]
      simp_rw [h_single]
      apply congrArg (fun x => dualConstant + (∑ i : Element,
        dualSingletonCoeff i * marginal i) + x) ?_
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      split_ifs with hij
      · rw [hP i j hij]
      · rfl
    _ = 479 / 160 := by
      simp [dualConstant, dualSingletonCoeff, dualPairCoeff, marginal,
        Fin.sum_univ_succ]
      norm_num
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.Foundations.Weight`
- `current repo:Main.PairwiseBound.dualValue`

## Proof dependencies

- `Mathlib:Mathlib.Algebra.BigOperators.Fin.Fin.sum_univ_succ`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_congr`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_filter`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Piecewise.Fintype.sum_ite_mem`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Sigma.Finset.sum_comm`
- `Mathlib:Mathlib.Algebra.BigOperators.Ring.Finset.Finset.mul_sum`
- `Mathlib:Mathlib.Algebra.BigOperators.Ring.Finset.Finset.sum_mul`
- `Mathlib:Mathlib.Tactic.FinCases.Lean.Elab.Tactic.finCases`
- `Mathlib:Mathlib.Tactic.NormNum.Core.Mathlib.Tactic.normNum`
- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.Foundations.marginal`
- `current repo:Main.PairwiseBound.dualConstant`
- `current repo:Main.PairwiseBound.dualPairCoeff`
- `current repo:Main.PairwiseBound.dualSingletonCoeff`
- `current repo:Main.PairwiseBound.dualValue`

## Sources

- `article/sections/02_counterexample.tex:110-120`
