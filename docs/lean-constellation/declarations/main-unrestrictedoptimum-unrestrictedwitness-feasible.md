[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `unrestrictedWitness_feasible`

The exact three-support witness satisfies the complete marginal-feasibility predicate.

- Kind: `theorem`
- Node: `Main.UnrestrictedOptimum`
- Module: `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestrictedWitness_feasible`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

Theorem `unrestrictedWitness_feasible` states `MarginalFeasible unrestrictedWitness`.  Thus the complete-domain witness is nonnegative on every `S : Finset Element`, its total mass over all finite subsets is `1`, and for every `i : Element` the sum of its weights on subsets containing `i` equals the prescribed marginal `marginal i`.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestrictedWitness_feasible`

Theorem `unrestrictedWitness_feasible` states `MarginalFeasible unrestrictedWitness`.  Thus the
complete-domain witness is nonnegative on every `S : Finset Element`, its total mass over all finite
subsets is `1`, and for every `i : Element` the sum of its weights on subsets containing `i` equals
the prescribed marginal `marginal i`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 34–38

## Statement dependencies

- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`
-/
theorem unrestrictedWitness_feasible : MarginalFeasible unrestrictedWitness := by
  sorry
```

## Proof NL

Unfold `MarginalFeasible` and `unrestrictedWitness`, and construct its three conjuncts.

1. For `∀ s : Finset Element, 0 ≤ unrestrictedWitness s`, split the nested equality tests in the witness definition.  Each branch is either `0`, `3 / 10`, or `7 / 20`; exact rational normalization proves nonnegativity.
2. For the total-mass equality, expand the finite sum over `Finset Element`.  The witness is zero away from `{0,2}`, `{1}`, and `{3,4}`; normalize the resulting three rational summands to `3/10 + 7/20 + 7/20 = 1`.
3. Introduce an arbitrary `i : Element` and use exhaustive `Fin 5` case analysis.  In each of the five cases, rewrite the filtered sum using `Finset.sum_filter`, unfold the witness and `marginal`, discard the zero terms, and normalize the remaining rational terms.  This proves the prescribed equality for every element, so no support point or domain case is omitted.

The source certificate is exactly the three-support-set distribution with weights `3/10, 7/20, 7/20`; the computation proves all three conjuncts of the accepted complete-domain predicate.

## Proof Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Tactic.Field
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum.BigOperators
import Mathlib.Tactic.NormNum.Core
import Mathlib.Tactic.Ring.RingNF
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestrictedWitness_feasible`

Theorem `unrestrictedWitness_feasible` states `MarginalFeasible unrestrictedWitness`.  Thus the
complete-domain witness is nonnegative on every `S : Finset Element`, its total mass over all finite
subsets is `1`, and for every `i : Element` the sum of its weights on subsets containing `i` equals
the prescribed marginal `marginal i`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 34–38

## Statement dependencies

- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`

## Proof outline

Unfold `MarginalFeasible` and `unrestrictedWitness`, and construct its three conjuncts.

1. For `∀ s : Finset Element, 0 ≤ unrestrictedWitness s`, split the nested equality tests in the
witness definition.  Each branch is either `0`, `3 / 10`, or `7 / 20`; exact rational normalization
proves nonnegativity.
2. For the total-mass equality, expand the finite sum over `Finset Element`.  The witness is zero
away from `{0,2}`, `{1}`, and `{3,4}`; normalize the resulting three rational summands to `3/10 +
7/20 + 7/20 = 1`.
3. Introduce an arbitrary `i : Element` and use exhaustive `Fin 5` case analysis.  In each of the
five cases, rewrite the filtered sum using `Finset.sum_filter`, unfold the witness and `marginal`,
discard the zero terms, and normalize the remaining rational terms.  This proves the prescribed
equality for every element, so no support point or domain case is omitted.

The source certificate is exactly the three-support-set distribution with weights `3/10, 7/20,
7/20`; the computation proves all three conjuncts of the accepted complete-domain predicate.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 34–38

## Proof dependencies

- `Finset.sum_add_distrib` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_filter` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_ite_eq'` from `Mathlib.Algebra.BigOperators.Group.Finset.Piecewise`
- `Mathlib.Tactic.FieldSimp.field` from `Mathlib.Tactic.Field`
- `Lean.Elab.Tactic.finCases` from `Mathlib.Tactic.FinCases`
- `Mathlib.Meta.NormNum.evalFinsetSum` from `Mathlib.Tactic.NormNum.BigOperators`
- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
- `Mathlib.Tactic.RingNF.ring` from `Mathlib.Tactic.Ring.RingNF`
- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.Foundations::marginal` → `marginal` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`
-/
theorem unrestrictedWitness_feasible : MarginalFeasible unrestrictedWitness := by
  classical
  have h₀₁ : ({0, 2} : Finset Element) ≠ {1} := by decide
  have h₀₂ : ({0, 2} : Finset Element) ≠ {3, 4} := by decide
  have h₁₂ : ({1} : Finset Element) ≠ {3, 4} := by decide
  have h₁₀ : ({1} : Finset Element) ≠ {0, 2} := Ne.symm h₀₁
  have h₂₀ : ({3, 4} : Finset Element) ≠ {0, 2} := Ne.symm h₀₂
  have h₂₁ : ({3, 4} : Finset Element) ≠ {1} := Ne.symm h₁₂
  have hw (x : Finset Element) :
      unrestrictedWitness x =
        (if x = {0, 2} then (3 / 10 : ℝ) else 0) +
          (if x = {1} then (7 / 20 : ℝ) else 0) +
            (if x = {3, 4} then (7 / 20 : ℝ) else 0) := by
    by_cases h₀ : x = {0, 2}
    · subst x
      simp [unrestrictedWitness, h₀₁, h₀₂]
    by_cases h₁ : x = {1}
    · subst x
      simp [unrestrictedWitness, h₁₀, h₁₂]
    by_cases h₂ : x = {3, 4}
    · subst x
      simp [unrestrictedWitness, h₂₀, h₂₁]
    simp [unrestrictedWitness, h₀, h₁, h₂]
  constructor
  · intro s
    rw [hw]
    have h₃₁₀ : (0 : ℝ) ≤ 3 / 10 := div_nonneg (by norm_num) (by norm_num)
    have h₇₂₀ : (0 : ℝ) ≤ 7 / 20 := div_nonneg (by norm_num) (by norm_num)
    exact add_nonneg
      (add_nonneg (by split <;> simp [h₃₁₀]) (by split <;> simp [h₇₂₀]))
      (by split <;> simp [h₇₂₀])
  constructor
  · simp_rw [hw]
    rw [Finset.sum_add_distrib, Finset.sum_add_distrib]
    simp [Finset.sum_ite_eq']
    field
  · intro i
    fin_cases i <;> simp_rw [hw] <;>
      rw [Finset.sum_add_distrib, Finset.sum_add_distrib] <;>
      simp [Finset.sum_ite_eq', marginal, Fin.ext_iff]
```

## Statement dependencies

- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.UnrestrictedOptimum.unrestrictedWitness`

## Proof dependencies

- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_add_distrib`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Basic.Finset.sum_filter`
- `Mathlib:Mathlib.Algebra.BigOperators.Group.Finset.Piecewise.Finset.sum_ite_eq'`
- `Mathlib:Mathlib.Tactic.Field.Mathlib.Tactic.FieldSimp.field`
- `Mathlib:Mathlib.Tactic.FinCases.Lean.Elab.Tactic.finCases`
- `Mathlib:Mathlib.Tactic.NormNum.BigOperators.Mathlib.Meta.NormNum.evalFinsetSum`
- `Mathlib:Mathlib.Tactic.NormNum.Core.Mathlib.Tactic.normNum`
- `Mathlib:Mathlib.Tactic.Ring.RingNF.Mathlib.Tactic.RingNF.ring`
- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.Foundations.marginal`
- `current repo:Main.UnrestrictedOptimum.unrestrictedWitness`

## Sources

- `article/sections/02_counterexample.tex:34-38`
