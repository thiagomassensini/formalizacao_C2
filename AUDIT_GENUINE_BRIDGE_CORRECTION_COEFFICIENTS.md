# Audit Genuine Bridge Correction Coefficients

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

Object audited:

```lean
genuineCentralBracketBridgeCorrectionRectangleSum s K M
```

This audit does not create a new endpoint and does not prove a decay estimate.
It classifies the coefficient bookkeeping of the finite bridge correction.

## Existing Lean Surface

The relevant closed declarations are:

```lean
genuineCentralBracketBridgeCorrectionRectangleSum
genuineCentralBracketBridgeCorrectionRectangleSum_eq_residual_sum
genuineCentralBracketBridgeCorrectionRectangleNormUpper
norm_genuineCentralBracketBridgeCorrectionRectangleSum_le_normUpper
rectangularGenuine_sub_bracketRectangle_eq_bridgeCorrectionRectangle
```

The residual address term is:

```lean
genuineCentralBracketBridgeCorrectionResidualAddressTerm s a
```

and Lean has:

```lean
genuineCentralBracketBridgeCorrectionAddressTerm_eq_residual
genuineCentralBracketBridgeCorrectionRectangleSum_eq_residual_sum
```

## Coefficient Expansion

For an address `a = (k, m)` in the finite C2 rectangle

```text
2 <= k <= K,
m <= M,
m odd,
```

the residual term is:

```text
dyadicWeight k *
  (4 * complexDirichletCoeff s (2^k * m)
    - complexDirichletCoeff s (2^k * m - 1)
    - complexDirichletCoeff s (2^k * m + 1))
```

Equivalently, as coefficients on natural indices `n`:

```text
n = 2^k * m:
  coefficient +4 * dyadicWeight k

n = 2^k * m - 1:
  coefficient -1 * dyadicWeight k

n = 2^k * m + 1:
  coefficient -1 * dyadicWeight k
```

Thus the collected finite coefficient function has the schematic form:

```text
Coeff(K,M,n)
  =
  sum over center addresses n = 2^k*m of +4*w_k
  -
  sum over minus-leg addresses n = 2^k*m-1 of w_k
  -
  sum over plus-leg addresses n = 2^k*m+1 of w_k
```

where `w_k = dyadicWeight k`.

## Collision Audit

### Center vs descendants

For valid addresses, centers are even:

```text
2^k * m
```

with `2 <= k`, while both descendants are odd:

```text
2^k * m - 1
2^k * m + 1
```

So center coefficients cannot cancel descendant coefficients by index
identification.

### Descendant vs descendant

The existing theorem:

```lean
natDescendant_address_unique
```

says that valid descendant addresses are unique. Therefore a minus or plus
descendant index is not reused by another valid address with different
`k`, branch, or odd core.

### Center vs center

For odd `m`, the existing valuation lemma:

```lean
v2_two_pow_mul_of_odd
```

identifies the depth in `2^k * m`. Hence two centers can coincide only when
the depth and odd core coincide. So center coefficients also do not merge
across distinct valid addresses.

## Variation In K And M

Increasing `K` adds new depth layers:

```text
k = K + 1
```

Increasing `M` adds new odd cores.

In both cases, the new center and descendant indices are fresh relative to the
previous rectangle, by the uniqueness/parity facts above. Existing coefficients
are not canceled by new coefficients.

Therefore the finite correction is not a telescoping boundary in the current
coefficient coordinates.

## Classification

Result:

```text
C. sobra massa central nao telescopica
```

The bridge correction contains a genuine finite bulk:

```text
+4 center mass
-1 minus-leg mass
-1 plus-leg mass
```

with disjoint natural supports. The current coefficient form does not collapse
to horizontal/depth boundary terms by finite index collection.

## Consequence For The Active Route

The bracket-decay rectangle can be used only after controlling the visible
bridge correction. The finite norm ledger:

```lean
genuineCentralBracketBridgeCorrectionRectangleNormUpper
```

is honest, but it is a bulk norm ledger, not a boundary ledger. Proving a small
bound from it by naive norms would not exploit telescoping, because the
coefficient audit found no internal telescoping.

The raw-tail route via bracket-decay therefore does not close by this norm
ledger alone. The next viable options are:

```text
1. prove a specific estimate for the current central family;
2. replace the carrier by a genuinely bracket-decay/regularized carrier;
3. find an additional identity, not yet present, that changes the coefficient
   structure before taking norms.
```

## Next Action

Do not attempt a border-bound theorem for this correction as currently written.

The next useful Lean task is to decide whether the route should:

```text
A. continue with a direct estimate for rawCentralRectangleTailAt;
or
B. pivot to a bracket-decay/regularized carrier where the second-difference
   decay is the actual summed family.
```

