# Audit Genuine Bracket Decay Raw Tail

Date: 2026-07-03

## Scope

Active route:

```text
genuine middle no-cancellation
```

Active Lean file:

```text
LeanC2/AuditGenuineMiddle.lean
```

Current raw-tail interface:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

meaning:

```text
rawCentralRectangleTailAt N L s <= R
```

The purpose of this audit is to check whether bracket-decay can provide a
genuine-first source of `R`.

## Definitions Located

The central infinite object is:

```lean
genuineCentralDoubleSeries s
```

It is defined in `LeanC2/Analytic/GenuineInfinite.lean` as a `tsum` over
addresses `p : Nat x Nat`:

```lean
(2 : Complex) *
  (verticalRatio s ^ (p.1 + 2) *
    complexDirichletCoeff s (2 * p.2 + 1))
```

The named address term is:

```lean
genuineCentralExplicitAddressTerm s p
```

The finite raw rectangle in the current route uses:

```lean
genuineAddressTermAt s a
```

with C2 address `a : C2Address`.

## Bracket Identity

The bracket address term is the weighted second-difference expression:

```lean
genuineBracketAddressTerm_eq_weighted_secondDifference
```

This was added as a local audit identity in `AuditGenuineMiddle.lean`.

The central explicit address term satisfies:

```lean
genuineCentralExplicitAddressTerm_eq_lateral_sub_bracket
```

This says, pointwise:

```text
central explicit address term
  =
direct address term - bracket address term
```

This is a post-cancellation identity.  It is not a norm split and it does not
license bounding the central term by bounding direct and bracket separately.

The exact bridge to bracket-decay is now named pointwise by:

```lean
genuineCentralBracketBridgeCorrectionTerm
genuineCentralExplicitAddressTerm_eq_bracket_add_bridgeCorrection
genuineCentralBracketBridgeCorrectionTerm_eq_weighted_residual
```

Lean proves:

```text
central explicit term
  =
bracket second-difference term
  + bridge correction
```

and expands the correction as:

```text
dyadicWeight(depth) *
  (4 * center coefficient - minus descendant coefficient
    - plus descendant coefficient)
```

So the difference between the current central family and the bracket-decay
family is explicit, but it is not zero.

## Finite Rectangle Bridge

The route now also has a finite-address version of the same bookkeeping in the
rectangle coordinates used by `rectangularGenuine_eq_addressSet_sum`:

```lean
genuineBracketAddressTermAt
genuineCentralBracketBridgeCorrectionAddressTerm
genuineAddressTermAt_eq_bracketAddressTerm_add_bridgeCorrectionAddressTerm
genuineBracketRectangleSum
genuineCentralBracketBridgeCorrectionRectangleSum
rectangularGenuine_eq_bracketRectangle_add_bridgeCorrectionRectangle
```

Lean proves:

```text
rectangularGenuine s K M
  =
genuineBracketRectangleSum s K M
  + genuineCentralBracketBridgeCorrectionRectangleSum s K M
```

This is a finite ledger only. It does not assert an infinite complement formula
or any tail convergence statement.

The correction rectangle is now also opened as an explicit finite residual:

```lean
genuineCentralBracketBridgeCorrectionResidualAddressTerm
genuineCentralBracketBridgeCorrectionAddressTerm_eq_residual
genuineCentralBracketBridgeCorrectionRectangleSum_eq_residual_sum
```

and bounded by its finite norm ledger:

```lean
genuineCentralBracketBridgeCorrectionRectangleNormUpper
norm_genuineCentralBracketBridgeCorrectionRectangleSum_le_normUpper
norm_rectangularGenuine_sub_bracketRectangle_le_bridgeCorrectionNormUpper
```

So Lean now isolates the finite mismatch:

```text
raw rectangle - bracket rectangle
  =
bridge-correction rectangle
```

and provides the local finite upper for that mismatch.  No theorem yet says
that this upper decays or telescopes.

The follow-up coefficient audit is:

```text
AUDIT_GENUINE_BRIDGE_CORRECTION_COEFFICIENTS.md
```

It classifies the current correction as non-telescopic central bulk, not as a
pure boundary term.

## Critical Semantic Point

The current `rawCentralRectangleTailAt` is:

```lean
norm (genuineCentralDoubleSeries s - rectangularGenuine s (L + 1) N)
```

With the definitions currently in Lean, this raw tail is built from the central
explicit post-cancellation terms, not directly from the bracket second
difference terms.

Therefore bracket-decay does not yet provide a bound for:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

To use bracket-decay here, one first needs a genuine-first theorem controlling
the bridge correction, showing it telescopes/bounds as a boundary contribution,
or reformulating the raw-tail target so that its address terms are genuinely the
second-difference bracket terms.

## Existing Convergence Surface

The search found route criteria that consume convergence or a limiting defect,
for example the finite-tail/two-core criteria in `AuditGenuineMiddle.lean`.

The search did not locate a theorem that already proves:

```text
rectangularGenuine s (L + 1) N -> genuineCentralDoubleSeries s
```

or directly produces:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

in the current middle route.

## Classification

```text
bracket-decay identity:
  located for genuineBracketAddressTerm.

central explicit post-cancellation identity:
  located for genuineCentralExplicitAddressTerm.

direct source for C2RawCentralRectangleTailUpperBudget:
  not located.

bridge correction:
  explicit residual; pointwise and finite-rectangle ledgers are proved, with a
  finite norm upper, but no decay/telescoping theorem is proved yet.

status:
  genuine-first obligation remains open.
```

## Next Correct Target

Do not take norms of direct and bracket pieces separately.

The next theorem should be one of:

```text
A. a genuine-first convergence/split theorem for the current central explicit
   rectangle family;

B. a genuine-first identity that rewrites the current raw-tail target into a
   bracket-decay family plus a controlled bridge correction before taking
   norms;

C. a new raw-tail budget source R proved directly for
   rawCentralRectangleTailAt N L s.
```

Until one of these exists, `C2RawCentralRectangleTailUpperBudget` remains the
honest open interface.
