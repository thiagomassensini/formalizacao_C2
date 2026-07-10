# C2 candidate family scanner extract

Este arquivo complementa `C2_CANONICAL_MIDDLE_CERTIFICATE_EXTRACT.md`.

Objetivo: abrir as definicoes que faltavam para montar um scanner fiel da
familia candidata continued/quartet, especialmente a familia:

```text
coreCutoff = fun _ => N
horizontalScale = 1
horizontalRatio = 1/2
horizontalConstant = weightedHorizontalEnvelope (fun _ => N)
```

Regra de leitura: isto e material para buscar uma familia candidata nao
bloqueada pela porta canonica publica atual. Nao usar zeta como input analitico
de middle. Onde `riemannZeta` aparece abaixo, ele aparece na infraestrutura de
continuacao/near-axis/cover, nao como majorante numerico para fechar o middle.

## Ocorrencias encontradas

```text
LeanC2/AuditContinuedQuartetHorizontal.lean:23
  weightedHorizontalEnvelope

LeanC2/AuditContinuedQuartetProfile.lean:31
  exactResidualTiltConstant

LeanC2/AuditContinuedQuartetProfile.lean:39
  exactResidualCutoffConstant

LeanC2/AuditContinuedQuartetDominance.lean:23
  constantCoreOddTruncationNorm

LeanC2/AuditContinuedQuartetRoute.lean:96
  middleRegion

LeanC2/Analytic/GenuineBulkConcrete.lean:4488
  c2RectangularGenuineDirectBracketUpper

LeanC2/Analytic/GenuineBulkConcrete.lean:4567
  c2ContinuedCentralExactUpper
```

## Middle region

Fonte: `LeanC2/AuditContinuedQuartetRoute.lean`.

```lean
/-- Near-axis certificate for the continued bulk model, with no genuine continuation input. -/
noncomputable def nearAxisData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M where
  near_axis :=
    NearAxisCertificate.of_eventually_ne_zero
      (fun _ hρ => eventually_ne_zero_at_critical coreCutoff K M hρ)

/-- The continued route can keep the edge branch empty. -/
def emptyEdgeData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
    (coreCutoff := coreCutoff) (K := K) (M := M)

/-- Off-critical points not discharged by near-axis or edge. -/
noncomputable abbrev middleRegion
    (coreCutoff : ℕ → ℕ) (K M : ℕ) : Set ℂ :=
  c2ExpandedScalarMiddleRegion
    (nearAxisData coreCutoff K M)
    (emptyEdgeData coreCutoff K M)
```

The expanded scalar middle region itself is:

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

```lean
def c2ExpandedScalarMiddleRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) : Set ℂ :=
  {s | offCriticalStrip s ∧
    s ∉ nearAxisRegion riemannZeta near.near_axis.radius ∧
    s ∉ edge.edgeRegion}
```

And:

Fonte: `LeanC2/Foundations/Basic.lean`.

```lean
def offCriticalStrip (s : Complex) : Prop :=
  0 < s.re ∧ s.re < 1 ∧ s.re ≠ (1 : ℝ) / 2
```

Operationally, for the continued audit route, `emptyEdgeData` makes the edge
branch empty. So middle is:

```text
middleRegion(coreCutoff,K,M) =
  offCriticalStrip
  minus nearAxisRegion for the continued model
```

The near-axis radius is supplied by a qualitative analytic continuation
certificate. It is not a concrete numerical middle parameter in the current
extract.

## Unit/half exact profile

Fonte: `LeanC2/AuditContinuedQuartetProfile.lean`.

```lean
/-- Unit scale used for tilt, horizontal, and cutoff budgets. -/
def unitScale : ℂ → ℝ :=
  fun _ => (1 : ℝ)

/-- Fixed geometric ratio for the horizontal middle profile. -/
noncomputable def halfHorizontalRatio : ℂ → ℝ :=
  fun _ => (1 / 2 : ℝ)

/--
Exact-residual tilt constant for the continued model with a chosen horizontal
envelope `H`.
-/
noncomputable def exactResidualTiltConstant
    (K M : ℕ) (H : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (c2ContinuedVerticalResidualExactUpper K M s +
      c2HorizontalRegularizedUpper H unitScale halfHorizontalRatio s) *
      (1 + ‖q s‖)

/-- Exact cutoff constant for the continued model. -/
noncomputable def exactResidualCutoffConstant (K M : ℕ) : ℂ → ℝ :=
  c2ContinuedCutoffExactUpper K M
```

Since:

```lean
noncomputable def c2HorizontalRegularizedUpper
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s => (horizontalConstant s / horizontalScale s) * (1 - horizontalRatio s)⁻¹
```

the unit/half specialization is:

```text
H_reg(s) = H(s) / 1 / (1 - 1/2) = 2 * H(s)
```

So:

```text
exactResidualTiltConstant(K,M,H)(s)
  = (V_exact(K,M,s) + 2*H(s)) * (1 + |q(s)|)

exactResidualCutoffConstant(K,M)(s)
  = Cut_exact(K,M,s)
```

## Weighted horizontal envelope

Fonte: `LeanC2/AuditContinuedQuartetHorizontal.lean`.

```lean
/--
Exact weighted horizontal envelope for the unit/half profile.

If the weighted layer series is summable, this single scalar envelope controls
every horizontal layer with ratio `1 / 2`.
-/
noncomputable def weightedHorizontalEnvelope
    (coreCutoff : ℕ → ℕ) : ℂ → ℝ :=
  fun s =>
    ∑' j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
        (1 / 2 : ℝ) ^ j
```

The corresponding layer budget is:

```lean
theorem weightedHorizontalEnvelope_layer_bound
    {coreCutoff : ℕ → ℕ} {s : ℂ}
    (hweighted :
      Summable fun j : ℕ =>
        ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
          (1 / 2 : ℝ) ^ j) :
    C2ExpandedHorizontalLayerBudget
      coreCutoff
      (weightedHorizontalEnvelope coreCutoff)
      unitScale halfHorizontalRatio s
```

Operational meaning:

```text
H_weighted(coreCutoff,s)
  = sum_j |horizontalLayerDefect(coreCutoff,s,j)| / (1/2)^j

If this sum exists, then:
  |horizontalLayerDefect(coreCutoff,s,j)|
    <= H_weighted(coreCutoff,s) * (1/2)^j
```

## Constant cutoff family

Fonte: `LeanC2/AuditContinuedQuartetDominance.lean`.

```lean
/-- Constant horizontal cutoff schedule used by the active dominance audit. -/
def constantCoreCutoff (N : ℕ) : ℕ → ℕ :=
  fun _ => N

/-- Weighted horizontal envelope attached to the constant cutoff schedule. -/
noncomputable def constantCoreHorizontalEnvelope (N : ℕ) : ℂ → ℝ :=
  weightedHorizontalEnvelope (constantCoreCutoff N)

/-- Constant-cutoff odd truncation norm. -/
noncomputable def constantCoreOddTruncationNorm (N : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖

/-- Closed geometric expression for the constant-cutoff horizontal envelope. -/
noncomputable def constantCoreHorizontalEnvelopeClosed (N : ℕ) : ℂ → ℝ :=
  fun s =>
    (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
      (1 - 2 * ‖q s‖)⁻¹
```

Lean proves, for `0 < s.re`:

```lean
theorem constantCoreHorizontalEnvelope_eq_closed_of_re_pos
    (N : ℕ) {s : ℂ} (hs : 0 < s.re) :
    constantCoreHorizontalEnvelope N s =
      constantCoreHorizontalEnvelopeClosed N s
```

Operational formula:

```text
coreCutoff_N(j) = N

OddTrunc_N(s)
  = |c2ConcreteOddTruncationError(coreCutoff_N,s,0)|

H_N_closed(s)
  = (2 * |q(s)|^2 * OddTrunc_N(s)) / (1 - 2*|q(s)|)
```

This closed form requires the geometric ratio condition used by Lean:

```text
2 * |q(s)| < 1
```

Lean gets that from `0 < s.re` for this `q`.

## Horizontal/truncation primitives

Fonte: `LeanC2/Route/BulkEstimates.lean`.

```lean
/-- Odd-channel truncation error at the horizontal cutoff attached to layer `j`. -/
noncomputable def c2OddTruncationError
    (ZoddRef : ℂ → ℂ) (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  fun s j => rectangularOddCoreSum s (coreCutoff j) - ZoddRef s

/-- Route specialization of the odd-channel truncation error. -/
noncomputable def c2ConcreteOddTruncationError
    (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  c2OddTruncationError oddDirichletChannel coreCutoff
```

Fonte: `LeanC2/Route/BulkConcrete.lean`.

```lean
/-- The route's concrete odd-channel horizontal layer defect. -/
noncomputable def c2ConcreteOddHorizontalLayerDefect
    (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  c2ConcreteHorizontalLayerDefect oddDirichletChannel coreCutoff
```

Lean also records:

```lean
theorem c2ConcreteHorizontalLayerDefect_eq_weighted_truncation_error
    (ZoddRef : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) (j : ℕ) :
    c2ConcreteHorizontalLayerDefect ZoddRef coreCutoff s j =
      (2 : ℂ) * q s ^ (j + 2) *
        c2OddTruncationError ZoddRef coreCutoff s j
```

Operational formula:

```text
horizontalLayerDefect(coreCutoff,s,j)
  = 2 * q(s)^(j+2) *
    (rectangularOddCoreSum(s, coreCutoff(j)) - oddDirichletChannel(s))

For constant cutoff N:
  odd truncation error is independent of j.
```

## Odd channel and finite odd core

Fonte: `LeanC2/Analytic/OddChannel.lean`.

```lean
/-- The odd subchannel `1, 3, 5, ...` of the Dirichlet coefficients. -/
noncomputable def oddDirichletChannel (s : ℂ) : ℂ :=
  ∑' n : ℕ, complexDirichletCoeff s (2 * n + 1)
```

Fonte: `LeanC2/Operators/TruncatedGenuine.lean`.

```lean
/-- Finite odd-core channel on the rectangle. -/
noncomputable def rectangularOddCoreSum (s : ℂ) (M : Nat) : ℂ :=
  ∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m
```

Fonte: `LeanC2/Operators/FiniteCancellation.lean`.

```lean
/-- Odd cores up to the finite cutoff `M`. -/
def oddCoresUpTo (M : Nat) : Finset Nat :=
  (Finset.range (M + 1)).filter Odd
```

Fonte: `LeanC2/Operators/ComplexDirichlet.lean`.

```lean
/-- Positive-real branch of the Dirichlet coefficient `n ↦ n^(-s)` on natural indices. -/
noncomputable def complexDirichletCoeff (s : ℂ) (n : Nat) : ℂ :=
  Complex.exp (-(s * (Real.log (n : ℝ) : ℂ)))
```

Operational formula:

```text
a_n(s) = exp(-s * log(n))

oddDirichletChannel(s)
  = sum_{n>=0} a_{2n+1}(s)

rectangularOddCoreSum(s,N)
  = sum_{1 <= m <= N, m odd} a_m(s)

OddTrunc_N(s)
  = |rectangularOddCoreSum(s,N) - oddDirichletChannel(s)|
```

Important: the infinite odd channel is a genuine-side object here. Avoid
replacing it by zeta bounds for the active middle scanner.

## q and vertical tail

Fonte: `LeanC2/Operators/VerticalResolvent.lean`.

```lean
/-- Vertical C2 ratio `q(s) = 2^{-1} * 2^{-s}` in the positive-real branch. -/
noncomputable def verticalRatio (s : ℂ) : ℂ :=
  depthGeometricRatio (complexDirichletCoeff s 2)

/-- Roadmap notation for the vertical geometric ratio. -/
noncomputable abbrev q (s : ℂ) : ℂ :=
  verticalRatio s
```

Lean proves:

```lean
lemma verticalRatio_eq (s : ℂ) :
    verticalRatio s = (1 / 2 : ℂ) * complexDirichletCoeff s 2
```

So operationally:

```text
q(s) = (1/2) * exp(-s * log(2))
|q(s)| = (1/2) * exp(-Re(s) * log(2))
       = 2^(-Re(s)-1)
```

Fonte: `LeanC2/Operators/VerticalResolvent.lean`.

```lean
/-- Infinite vertical depth factor starting at C2 depth `2`. -/
noncomputable def verticalDepthTailFromTwo (s : ℂ) : ℂ :=
  ∑' j : Nat, verticalRatio s ^ (j + 2)
```

Fonte: `LeanC2/Operators/VerticalResolvent.lean`.

```lean
/-- Explicit geometric upper bound for the vertical tail `∑_{k≥2} q(s)^k`. -/
noncomputable def verticalDepthTailUpper (s : ℂ) : ℝ :=
  ‖q s‖ ^ 2 / (1 - ‖q s‖)
```

## Continued central and residual exact uppers

Fonte: `LeanC2/Analytic/GenuineContinuation.lean`.

```lean
/-- The continued odd channel `(1 - 2^{-s}) ζ(s)` on the punctured right half-plane. -/
noncomputable def continuedOddDirichletChannel (s : ℂ) : ℂ :=
  (1 - complexDirichletCoeff s 2) * riemannZeta s

/-- The corresponding continued central C2 expression obtained from the odd channel bridge. -/
noncomputable def continuedCentralOddChannel (s : ℂ) : ℂ :=
  centralFromOddChannel continuedOddDirichletChannel s
```

Fonte: `LeanC2/Route/FundamentalAlgebra.lean`.

```lean
/-- Central C2 expression after the vertical tower has been summed, with an abstract odd channel. -/
noncomputable def centralFromOddChannel (Zodd : OddChannel) (s : ℂ) : ℂ :=
  (2 : ℂ) * verticalDepthTailFromTwo s * Zodd s
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

```lean
/-- Exact upper envelope for the continued central channel. -/
noncomputable def c2ContinuedCentralExactUpper : ℂ → ℝ :=
  fun s => ‖continuedCentralOddChannel s‖
```

The exact continued vertical residual is:

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

```lean
/--
Residual coming from the vertical resolvent and rectangular truncation relative
to the continued target.
-/
noncomputable def c2ScaledSeededExplicitOddTailContinuedVerticalResidual
    (K M : ℕ) : ℂ → ℂ :=
  fun s =>
    verticalDepthTailFromTwo s +
      rectangularGenuine s K M -
      (2 : ℂ) * continuedCentralOddChannel s

/-- Exact upper envelope for the continued vertical/rectangular residual. -/
noncomputable def c2ContinuedVerticalResidualExactUpper (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s‖
```

The exact continued cutoff upper is:

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

```lean
/-- Exact upper envelope for the continued cutoff error. -/
noncomputable def c2ContinuedCutoffExactUpper (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s‖
```

Fonte: `LeanC2/Route/BulkConcrete.lean`.

```lean
/-- Cutoff error of a rectangular finite operator against a supplied analytic target. -/
noncomputable def c2ConcreteCutoffErrorFromTarget
    (targetF : ℂ → ℂ) (K M : ℕ) : ℂ → ℂ :=
  fun s => c2RectangularGenuineOperator K M s - targetF s
```

Operational formulas:

```text
continuedCentralOddChannel(s)
  = 2 * verticalDepthTailFromTwo(s) * continuedOddDirichletChannel(s)

V_exact(K,M,s)
  = |verticalDepthTailFromTwo(s)
      + rectangularGenuine(s,K,M)
      - 2 * continuedCentralOddChannel(s)|

Cut_exact(K,M,s)
  = |rectangularGenuine(s,K,M) - continuedCentralOddChannel(s)|
```

Note: these continued objects are part of the continued route audit. They are
not the same as proving the active middle with a zeta majorant.

## Rectangular finite genuine pieces

Fonte: `LeanC2/Operators/TruncatedGenuine.lean`.

```lean
/-- Rectangular finite direct/lateral C2 operator for the complex Dirichlet coefficient. -/
noncomputable def rectangularDirect (s : ℂ) (K M : Nat) : ℂ :=
  (complexDirichletKernel s K M).directLateralSum

/-- Rectangular finite bracket C2 operator for the complex Dirichlet coefficient. -/
noncomputable def rectangularBracket (s : ℂ) (K M : Nat) : ℂ :=
  (complexDirichletKernel s K M).bracketSum

/-- Rectangular finite genuine numerator `F = D - B`. -/
noncomputable def rectangularGenuine (s : ℂ) (K M : Nat) : ℂ :=
  rectangularDirect s K M - rectangularBracket s K M
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

```lean
/-- Canonical finite bound for `rectangularGenuine` from direct and bracket sums. -/
noncomputable def c2RectangularGenuineDirectBracketUpper (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖rectangularDirect s K M‖ + ‖rectangularBracket s K M‖
```

Finite triangle uppers:

```lean
/-- Finite triangle upper for the rectangular direct sum. -/
noncomputable def c2RectangularDirectFiniteUpper (K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ∑ k ∈ Finset.Icc 2 K,
      ∑ m ∈ oddCoresUpTo M,
        ‖directPairTerm (complexDirichletCoeff s) k m‖

/-- Finite triangle upper for the rectangular bracket sum. -/
noncomputable def c2RectangularBracketFiniteUpper (K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ∑ k ∈ Finset.Icc 2 K,
      ∑ m ∈ oddCoresUpTo M,
        ‖bracketTerm (complexDirichletCoeff s) k m‖
```

Fonte: `LeanC2/Operators/FiniteCancellation.lean`.

```lean
/-- A direct `D`-side leg term, using `keff` weight. -/
def directLegTerm (f : Nat -> R) (n : Nat) : R :=
  algebraMap ℚ R (directLegWeight n) * f n

/-- The two lateral terms of `D`, grouped by a bracket address. -/
def directPairTerm (f : Nat -> R) (k m : Nat) : R :=
  directLegTerm f (natDescendant k BranchSign.minus m) +
    directLegTerm f (natDescendant k BranchSign.plus m)

/-- The bracket term attached to a C2 center. -/
def bracketTerm (f : Nat -> R) (k m : Nat) : R :=
  algebraMap ℚ R (dyadicWeight k) *
    (f (natDescendant k BranchSign.minus m) +
      f (natDescendant k BranchSign.plus m) - 2 * f (c2Center k m))
```

For a scanner, either compute `rectangularDirect` and `rectangularBracket` via
the existing kernel implementation, or expand them through `directPairTerm` and
`bracketTerm` over:

```text
2 <= k <= K
1 <= m <= M, m odd
```

## Residual uppers for the constant cutoff family

Fonte: `LeanC2/AuditContinuedQuartetDominance.lean`.

```lean
/--
Closed expression for the residual upper in the constant-cutoff profile.  This
is the formula to estimate when attacking dominance directly.
-/
noncomputable def constantCoreClosedResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualExactUpper K M s +
        2 * constantCoreHorizontalEnvelope N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelope N s +
    c2ContinuedCutoffExactUpper K M s

/--
Residual upper with the constant-cutoff horizontal envelope replaced by its
closed geometric expression.
-/
noncomputable def constantCoreGeometricResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualExactUpper K M s +
        2 * constantCoreHorizontalEnvelopeClosed N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelopeClosed N s +
    c2ContinuedCutoffExactUpper K M s
```

Lean proves:

```lean
theorem constantCoreResidualUpper_eq_closed
    (N K M : ℕ) (s : ℂ) :
    constantCoreResidualUpper N K M s =
      constantCoreClosedResidualUpper N K M s

theorem constantCoreClosedResidualUpper_eq_geometric_of_re_pos
    (N K M : ℕ) {s : ℂ} (hs : 0 < s.re) :
    constantCoreClosedResidualUpper N K M s =
      constantCoreGeometricResidualUpper N K M s
```

Operational formula:

```text
U_const_geom(N,K,M,s)
  = (V_exact(K,M,s) + 2*H_N_closed(s))
      * (1 + |q(s)|) / (1 - |q(s)|)
    + 2*H_N_closed(s)
    + Cut_exact(K,M,s)
```

where:

```text
H_N_closed(s)
  = (2 * |q(s)|^2 * OddTrunc_N(s)) / (1 - 2*|q(s)|)

OddTrunc_N(s)
  = |rectangularOddCoreSum(s,N) - oddDirichletChannel(s)|
```

## Dominance target for the family

Fonte: `LeanC2/AuditContinuedQuartetHorizontal.lean`.

```lean
structure ConstantCoreCutoffMiddleDominanceInputs
    (N K M : ℕ) : Prop where
  dominance : ∀ ⦃s : ℂ⦄,
    s ∈ middleRegion (fun _ : ℕ => N) K M →
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope (fun _ : ℕ => N)))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope (fun _ : ℕ => N))
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))
```

Equivalent residual style:

```lean
def ConstantCoreCutoffResidualDominance (N K M : ℕ) (s : ℂ) : Prop :=
  constantCoreResidualUpper N K M s < c2ExpandedQuartetResidualMargin s
```

So the scanner target is:

```text
Q(s) = c2ExpandedQuartetResidualMargin(s)

U(s) = constantCoreResidualUpper(N,K,M,s)
     = constantCoreGeometricResidualUpper(N,K,M,s)   when 0 < Re(s)

slack(N,K,M,s) = Q(s) - U(s)
```

Using the previous extract:

```text
Q(s)
  = |q(s)|^2 * ((1 - |q(s)|) * (1 + |q(s)|^2))
    - |q(s)|^6 / (1 - |q(s)|)
```

and:

```text
U_const_geom(N,K,M,s)
  = (V_exact(K,M,s) + 2*H_N_closed(s))
      * (1 + |q(s)|) / (1 - |q(s)|)
    + 2*H_N_closed(s)
    + Cut_exact(K,M,s)
```

## Minimum Python implementation checklist

To implement the family scanner faithfully, implement:

```text
complexDirichletCoeff(s,n) = exp(-s*log(n))
q(s) = 0.5 * complexDirichletCoeff(s,2)
verticalDepthTailFromTwo(s) = q(s)^2 / (1 - q(s))      for Re(s)>0
oddDirichletChannel(s) = sum over odd positive n of exp(-s*log(n))
rectangularOddCoreSum(s,N) = finite odd sum m<=N
OddTrunc_N(s) = |rectangularOddCoreSum(s,N) - oddDirichletChannel(s)|
H_N_closed(s) = 2*|q|^2*OddTrunc_N(s)/(1 - 2*|q|)
rectangularGenuine(s,K,M) = rectangularDirect(s,K,M) - rectangularBracket(s,K,M)
continuedCentralOddChannel(s) = 2*verticalDepthTailFromTwo(s)*continuedOddDirichletChannel(s)
V_exact(K,M,s) = |verticalDepthTailFromTwo + rectangularGenuine - 2*continuedCentralOddChannel|
Cut_exact(K,M,s) = |rectangularGenuine - continuedCentralOddChannel|
Q(s) = quartet residual margin
U(s) = constantCoreGeometricResidualUpper
slack = Q - U
```

Open implementation issue:

```text
continuedOddDirichletChannel(s)
  is defined in Lean as (1 - 2^-s) * riemannZeta(s).
```

For genuine-first numerical experiments, avoid using a zeta bound as the proof
input. If a numerical scanner needs values, prefer direct/continued odd-channel
evaluation or clearly mark any zeta-based numerical evaluation as diagnostic
only, not as the active middle certificate input.

## Bottom line

The candidate-family scanner should not test the blocked public canonical
package. It should test:

```text
constantCoreResidualUpper(N,K,M,s)
  < c2ExpandedQuartetResidualMargin(s)
```

or the geometric equivalent on `0 < Re(s)`:

```text
constantCoreGeometricResidualUpper(N,K,M,s)
  < c2ExpandedQuartetResidualMargin(s)
```

with the constant-cutoff unit/half family:

```text
coreCutoff = fun _ => N
horizontalScale = 1
horizontalRatio = 1/2
horizontalConstant = weightedHorizontalEnvelope (fun _ => N)
```

This is the route that the scanner can use as a laboratory for a corrected or
replacement middle obligation.
