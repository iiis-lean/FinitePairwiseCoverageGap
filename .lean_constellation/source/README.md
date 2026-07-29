# A Finite Pairwise-Independent Coverage Gap

## Source provenance

This corpus is derived from the frozen paper and author source for Arjun
Ramachandra and Karthik Natarajan, *Counterexample to a conjecture on the
pairwise independent correlation gap using AI*, arXiv:2606.19663v1 (2026).
The article directory is a faithful mathematical extraction of that version:
it preserves the definitions, explicit instance, proof certificates, citations,
and bibliography needed for the stated target.

## Reading order

1. Compile or read `article/main.tex` for the definitions, the five-element
   coverage instance, the unrestricted primal witness, and the complete
   32-row dual certificate.
2. Read `formal_target.lean` for the single formalization target. It defines
   the same finite coverage function, marginal and pairwise-moment constraints,
   expected value, and the certificate-level conclusion.

## Mathematical scope

The article proves that the unrestricted optimum is exactly `4`, while every
pairwise-independent feasible distribution has expected coverage at most
`479/160`. Consequently the certified ratio is at least `640/479`, which is
strictly greater than `4/3`.

The Lean target also records that the explicit coverage function is monotone
and submodular and that the pairwise feasible set is nonempty. These clauses
make the counterexample and its optimization semantics self-contained.

## Extraction limits

The corpus preserves the paper's title, authors, mathematical definitions,
conjecture, counterexample, primal table, all 32 dual rows, citations, and
bibliography. The later discussion of the discovery process, acknowledgements,
status table, and prompt transcript is not needed for the mathematical proof
and is not reproduced.

The paper supplies only an upper bound for the pairwise-independent optimum.
No equality claim for that optimum is part of this corpus.
