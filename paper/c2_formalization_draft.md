# A Lean-Formalized C2 Terminal Certificate Pipeline for the Riemann Hypothesis

**Draft status:** working draft.  
**Repository module:** `LeanC2`.  
**Public endpoint:** `LeanC2.PeerReview`.

---

## Abstract

We describe a Lean formalization of a C2 certificate pipeline whose public
endpoint derives mathlib's `RiemannHypothesis` from explicit terminal
certificate data. The formalization decomposes the route into dyadic
combinatorics, finite lateral cancellation, a central factorization producing
the scalar factor `c0` and the zeta channel, analytic continuation data for the
genuine infinite numerator, near-axis and bulk nonvanishing certificates, an
off-critical cover, and the final transfer to mathlib's formulation of the
Riemann Hypothesis. The public audit-facing API is exposed in
`LeanC2.PeerReview`: a `TerminalCertificate`, or equivalently a continuation
terminal certificate, implies `RiemannHypothesis`. The development is organized
so that the remaining mathematical content is localized in explicit
certificate fields rather than hidden in global proof plumbing.

---

## 1. Introduction

Formalizing a long analytic argument in Lean has two distinct goals. The first
is to prove statements. The second is to make the dependency structure of the
argument inspectable: a reader should be able to identify which parts are
combinatorial, which parts are analytic, which parts are local estimates, and
which parts are merely transport between interfaces.

This paper reports the current C2 formalization in that spirit. The core
mathematical route can be summarized as follows:

```text
K.5 bijection
-> Halving Law
-> finite lateral cancellation
-> central factorization
-> F = c0 zeta for sigma > 1
-> continuation / comparison on sigma > 0
-> c0 nonzero
-> genuine continuation data
-> near-axis + bulk + edge cover
-> F nonzero off-critical
-> zeta nonzero off-critical
-> mathlib RiemannHypothesis
```

The Lean development exposes this route through a small public endpoint:

```lean
namespace C2.PeerReview

structure TerminalCertificate where
  coreCutoff : Nat -> Nat
  K : Nat
  M : Nat
  horizontalConstant : Complex -> Real
  horizontalScale : Complex -> Real
  horizontalRatio : Complex -> Real
  continuation : GenuineFInfiniteContinuationData
  middle : C2CanonicalClosedScaledMiddleRegionData
    coreCutoff K M horizontalConstant horizontalScale horizontalRatio

theorem riemannHypothesis_of_terminalCertificate
  (cert : TerminalCertificate) : RiemannHypothesis

end C2.PeerReview
```

There is also a more compressed certificate interface in which continuation
supplies the canonical near-axis package and the current route supplies the
empty edge package:

```lean
structure ContinuationTerminalCertificate where
  continuation : GenuineFInfiniteContinuationData
  middle : CanonicalMiddleObligation ...

theorem riemannHypothesis_of_continuationTerminalCertificate
  (cert : ContinuationTerminalCertificate) : RiemannHypothesis
```

The purpose of these structures is auditability. A reviewer need not navigate
the full terminal file to see the final logical statement: the theorem is a
certificate-to-RH endpoint.

---

## 2. Formalization Philosophy

The development follows three principles.

First, the route is split by mathematical role. Dyadic combinatorics and finite
cancellation are formalized separately from analytic continuation and separately
from the local bulk estimates.

Second, the terminal theorem is stated through certificate data. Instead of
letting global proof obligations appear in the final theorem, the required
analytic input is stored in named structures. This makes the remaining
obligations visible.

Third, historical routes are retained but tagged. The large terminal file
contains active route components, optional refinements, formal barriers, and
deprecated historical material. These are marked by route tags in comments:

```lean
-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
-- ROUTE_TAG: FORMAL_BARRIER
-- ROUTE_TAG: DEPRECATED_HISTORICAL
```

This tagging is not part of Lean's logic, but it is important for human
auditability.

---

## 3. The C2 Algebraic Core

The algebraic core begins with the dyadic structure of odd integers. Every odd
integer appearing as a leg of a C2 bracket is assigned a unique dyadic address.
In conceptual terms, an odd leg is represented as

```text
2^k m - 1    or    2^k m + 1
```

with `m` odd and `k >= 2`. The K.5 bijection asserts that each admissible odd
integer appears as exactly one such leg. This is formalized in the foundations
and dyadic modules.

The finite cancellation layer then shows that the lateral bracket terms cancel
in the appropriate rectangular finite sums. What remains is a central
contribution. Factoring the central contribution by dyadic depth `k` and odd
core `m` produces two factors:

1. a geometric factor in the dyadic depth, yielding `c0(s)`;
2. an odd Dirichlet channel in the core, yielding `zeta_odd(s)` and hence
   `zeta(s)`.

In the half-plane `sigma > 1`, where absolute convergence justifies the
Dirichlet manipulations, this gives the fundamental identity

```text
F(s) = c0(s) * zeta(s).
```

In the repository, this part of the argument is spread across:

```text
LeanC2/Foundations/Dyadic.lean
LeanC2/Operators/FiniteCancellation.lean
LeanC2/Operators/DirichletFormal.lean
LeanC2/Operators/ComplexDirichlet.lean
LeanC2/Operators/TruncatedGenuine.lean
LeanC2/Identity/C0.lean
LeanC2/Identity/C0Bridge.lean
LeanC2/Route/FundamentalAlgebra.lean
```

---

## 4. Continuation and the Genuine Infinite Numerator

The route used by the terminal formalization is not the historical finite
proxy route. The current endpoint is expressed in terms of the genuine infinite
numerator and a continuation package:

```lean
GenuineFInfiniteContinuationData
```

This package provides the continuation/comparison data needed downstream. In
particular, the terminal concrete file uses the continued balancing-seed bulk
model:

```lean
c2OddTailContinuedBalancingSeedBulkModel
```

and relates it to `genuineFInfinite` on the punctured right half-plane. This
lets the proof establish nonvanishing for the continued model and transport it
to the genuine target on the off-critical strip.

The relevant modules are:

```text
LeanC2/Analytic/GenuineInfinite.lean
LeanC2/Analytic/GenuineContinuation.lean
LeanC2/Analytic/GenuineBulk.lean
LeanC2/Analytic/GenuineBulkConcrete.lean
```

---

## 5. Near-Axis, Bulk, and Edge

The global nonvanishing argument is organized as a cover:

```text
near-axis + middle bulk + edge.
```

The near-axis part is supplied from continuation and isolated zeros:

```lean
GenuineFInfiniteNearAxisData.of_continuation
```

The edge part in the current terminal route is the empty edge package:

```lean
C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
```

The remaining substantive local content is in the middle region. The canonical
middle region is:

```lean
c2ExpandedScalarMiddleRegion
```

and the minimal local target is:

```lean
C2CanonicalClosedScaledLocalData
```

The corresponding public middle obligation is:

```lean
CanonicalMiddleObligation
```

from `LeanC2.PeerReview`.

---

## 6. Bulk Dominance and Refinement Layers

The bulk part is organized through a hierarchy of increasingly explicit
witnesses and estimates. Conceptually, the goal is to show that a principal
quartet/resolvent contribution dominates the sum of error terms:

```text
main quartet contribution > tilt error + horizontal error + cutoff error + tail.
```

The formalized route includes several interfaces for this local content:

```lean
C2ExpandedScalarScaleData
C2ExpandedHorizontalLayerBudget
C2ExpandedSeedScaledBound
C2ExpandedCutoffScaledBound
C2ExpandedQuartetDominance
C2ExpandedScalarMainInequalities
C2ExpandedScalarLocalBulkData
C2CanonicalClosedScaledLocalData
```

The main public-style endpoints downstream of these interfaces include:

```lean
mathlibRiemannHypothesis_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds
mathlibRiemannHypothesis_of_continuationAndExpandedScalarMiddleRegionWithBounds
mathlibRiemannHypothesis_of_continuationAndExpandedScalarMiddleSeparatedMainBounds
```

These theorems make the local analytic obligations progressively more explicit.

---

## 7. Transfer to mathlib's RiemannHypothesis

The final transfer is conceptually simple. If the genuine numerator is
nonzero on the off-critical strip, then the zeta function is nonzero there.
Together with mathlib's formulation, this yields:

```lean
RiemannHypothesis
```

The relevant transport layer is in:

```text
LeanC2/Foundations/Basic.lean
LeanC2/Route/Transfer.lean
LeanC2/Roadmap.lean
```

The public endpoint is:

```lean
C2.PeerReview.riemannHypothesis_of_terminalCertificate
```

and the continuation-compressed endpoint is:

```lean
C2.PeerReview.riemannHypothesis_of_continuationTerminalCertificate
```

---

## 8. Build and Audit Status

The public endpoint compiles with:

```bash
lake build LeanC2.PeerReview
```

The full aggregate module compiles with:

```bash
lake build LeanC2
```

The current source tree is intended to contain no proof placeholders such as
`sorry` or `admit`, and no new axiomatic declarations for the C2 route. The
large concrete terminal file is tagged to separate active route components,
optional refinements, formal barriers, and deprecated historical routes.

---

## 9. What This Paper Claims

The safest current claim is:

> We formalize an audit-facing C2 terminal certificate pipeline in Lean. The
> public endpoint proves mathlib's `RiemannHypothesis` from explicit terminal
> certificate data.

This paper should not obscure the certificate nature of the endpoint. The
terminal certificate contains the continuation data and the middle-region
certificate data needed by the route. If a future development constructs such
a terminal certificate without remaining external mathematical assumptions,
then the paper's main theorem can be strengthened accordingly.

---

## 10. Conclusion

The C2 formalization turns a long analytic route into a set of named Lean
interfaces. The central architectural achievement is that global proof plumbing
has been compressed into a small public certificate endpoint:

```lean
TerminalCertificate -> RiemannHypothesis
```

This makes the route auditable. The proof obligations are not hidden in a
monolithic theorem; they are exposed as continuation and middle-region data.
The resulting workspace can therefore be read both as a formal proof pipeline
and as a roadmap for future refinements of the local analytic certificates.

