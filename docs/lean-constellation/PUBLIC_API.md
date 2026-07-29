# Public API

- Repository completion: `graph_proved`
- Proof availability: `proved`
- Public declarations: `18` across `4` nodes

## Dependency graph

Consumers appear above the public declarations they depend on. Solid arrows are Statement dependencies; dashed arrows are Proof dependencies. Transitively implied edges are omitted for readability; each declaration page lists the complete direct dependency set. Mathlib and non-public project dependencies are not shown.

```mermaid
%%{init: {"flowchart": {"defaultRenderer": "elk", "nodeSpacing": 24, "rankSpacing": 36}}}%%
flowchart TB
  subgraph n0["Main.GapTheorem"]
    direction TB
    d0["finite_pairwise_coverage_gap"]
  end
  subgraph n1["Main.PairwiseBound"]
    direction TB
    d1["pairwise_upper_bound_479_160"]
  end
  subgraph n2["Main.UnrestrictedOptimum"]
    direction TB
    d2["unrestricted_optimum_four"]
    d3["coverage_le_four"]
    d4["unrestrictedWitness"]
  end
  subgraph n3["Main.Foundations"]
    direction TB
    d5["IsPairwiseUpperBound"]
    d6["IsUnrestrictedOptimum"]
    d7["PairwiseFeasible"]
    d8["MarginalFeasible"]
    d9["coverage_monotone"]
    d10["coverage_submodular"]
    d11["expectedCoverage"]
    d12["Weight"]
    d13["coverage"]
    d14["elementFeatures"]
    d15["Feature"]
    d16["marginal"]
    d17["Element"]
  end
  d5 --> d7
  d5 --> d11
  d6 --> d8
  d6 --> d11
  d8 --> d12
  d8 --> d16
  d7 --> d8
  d12 --> d17
  d13 --> d14
  d9 --> d13
  d10 --> d13
  d14 --> d17
  d14 --> d15
  d11 --> d12
  d11 --> d13
  d16 --> d17
  d0 -.-> d9
  d0 -.-> d10
  d0 -.-> d1
  d0 -.-> d2
  d1 --> d5
  d3 --> d13
  d4 --> d12
  d2 --> d6
  d2 -.-> d3
  d2 -.-> d4
```

## Declarations

| Node | Declaration | Kind | Status |
| --- | --- | --- | --- |
| `Main.GapTheorem` | [`finite_pairwise_coverage_gap`](public-api/main-gaptheorem-finite-pairwise-coverage-gap.md) | `theorem` | `proved` |
| `Main.PairwiseBound` | [`pairwise_upper_bound_479_160`](public-api/main-pairwisebound-pairwise-upper-bound-479-160.md) | `theorem` | `proved` |
| `Main.UnrestrictedOptimum` | [`unrestricted_optimum_four`](public-api/main-unrestrictedoptimum-unrestricted-optimum-four.md) | `theorem` | `proved` |
| `Main.UnrestrictedOptimum` | [`coverage_le_four`](public-api/main-unrestrictedoptimum-coverage-le-four.md) | `theorem` | `proved` |
| `Main.UnrestrictedOptimum` | [`unrestrictedWitness`](public-api/main-unrestrictedoptimum-unrestrictedwitness.md) | `definition` | `declared` |
| `Main.Foundations` | [`IsPairwiseUpperBound`](public-api/main-foundations-ispairwiseupperbound.md) | `definition` | `declared` |
| `Main.Foundations` | [`IsUnrestrictedOptimum`](public-api/main-foundations-isunrestrictedoptimum.md) | `definition` | `declared` |
| `Main.Foundations` | [`PairwiseFeasible`](public-api/main-foundations-pairwisefeasible.md) | `definition` | `declared` |
| `Main.Foundations` | [`MarginalFeasible`](public-api/main-foundations-marginalfeasible.md) | `definition` | `declared` |
| `Main.Foundations` | [`coverage_monotone`](public-api/main-foundations-coverage-monotone.md) | `theorem` | `proved` |
| `Main.Foundations` | [`coverage_submodular`](public-api/main-foundations-coverage-submodular.md) | `theorem` | `proved` |
| `Main.Foundations` | [`expectedCoverage`](public-api/main-foundations-expectedcoverage.md) | `definition` | `declared` |
| `Main.Foundations` | [`Weight`](public-api/main-foundations-weight.md) | `abbrev` | `declared` |
| `Main.Foundations` | [`coverage`](public-api/main-foundations-coverage.md) | `definition` | `declared` |
| `Main.Foundations` | [`elementFeatures`](public-api/main-foundations-elementfeatures.md) | `definition` | `declared` |
| `Main.Foundations` | [`Feature`](public-api/main-foundations-feature.md) | `abbrev` | `declared` |
| `Main.Foundations` | [`marginal`](public-api/main-foundations-marginal.md) | `definition` | `declared` |
| `Main.Foundations` | [`Element`](public-api/main-foundations-element.md) | `abbrev` | `declared` |
