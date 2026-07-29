import Mathlib

namespace FinitePairwiseCoverageGap

abbrev Element := Fin 5
abbrev Feature := Fin 4
abbrev Weight := Finset Element → ℝ

/-- The features covered by each of the five elements. -/
def elementFeatures (i : Element) : Finset Feature :=
  if i = 0 then {0, 1}
  else if i = 1 then {0, 1, 2, 3}
  else if i = 2 then {2, 3}
  else if i = 3 then {0, 2}
  else {1, 3}

/-- The cardinality of the union of the selected feature sets. -/
def coverage (s : Finset Element) : ℝ :=
  ((s.biUnion elementFeatures).card : ℝ)

/-- The prescribed one-element marginals. -/
noncomputable def marginal (i : Element) : ℝ :=
  if i = 0 then 3 / 10
  else if i = 1 then 7 / 20
  else if i = 2 then 3 / 10
  else 7 / 20

/-- Expected coverage under weights on all subsets of the ground set. -/
def expectedCoverage (θ : Weight) : ℝ :=
  ∑ s : Finset Element, θ s * coverage s

/-- Probability and one-element marginal constraints. -/
def MarginalFeasible (θ : Weight) : Prop :=
  (∀ s, 0 ≤ θ s) ∧
  (∑ s : Finset Element, θ s) = 1 ∧
  ∀ i, (∑ s : Finset Element, if i ∈ s then θ s else 0) = marginal i

/-- Pairwise independence, expressed by the prescribed two-element moments. -/
def PairwiseFeasible (θ : Weight) : Prop :=
  MarginalFeasible θ ∧
  ∀ i j, i < j →
    (∑ s : Finset Element, if i ∈ s ∧ j ∈ s then θ s else 0) =
      marginal i * marginal j

/-- A value is attained and bounds every marginally feasible distribution. -/
def IsUnrestrictedOptimum (q : ℝ) : Prop :=
  (∃ θ, MarginalFeasible θ ∧ expectedCoverage θ = q) ∧
  ∀ θ, MarginalFeasible θ → expectedCoverage θ ≤ q

/-- The pairwise feasible set is nonempty and all its values obey the bound. -/
def IsPairwiseUpperBound (q : ℝ) : Prop :=
  (∃ θ, PairwiseFeasible θ) ∧
  ∀ θ, PairwiseFeasible θ → expectedCoverage θ ≤ q

/-- The explicit five-element coverage function violates the proposed `4/3`
upper bound when arbitrary dependence is compared with pairwise independence. -/
theorem finite_pairwise_coverage_gap :
    (∀ ⦃s t : Finset Element⦄, s ⊆ t → coverage s ≤ coverage t) ∧
    (∀ s t : Finset Element,
      coverage (s ∪ t) + coverage (s ∩ t) ≤ coverage s + coverage t) ∧
    IsUnrestrictedOptimum 4 ∧
    IsPairwiseUpperBound (479 / 160) ∧
    (4 : ℝ) / (479 / 160) > 4 / 3 := by
  sorry

end FinitePairwiseCoverageGap
