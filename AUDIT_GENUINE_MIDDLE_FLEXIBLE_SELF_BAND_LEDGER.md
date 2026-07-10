# Audit Genuine Middle Flexible Self-Band Ledger

Date: 2026-07-03

## Scope

This document records the current state of the genuine-middle
no-cancellation route in:

```text
LeanC2/AuditGenuineMiddle.lean
```

The active local target is:

```lean
genuineCentralDoubleSeries s != 0
```

The current route is not the positive-box route, not the old canonical detour,
and not the oddRef shim.  The positive-box material remains useful as
background intuition only; it is not an input to this route.

## Route Shape

The active proof surface was reduced to a two-core defect budget:

```lean
twoCoreDepthLimitDefectAt K s
  <
twoCoreDepthStableGapAt K s
```

Then the gap side was normalized to a scalar-margin payment:

```lean
twoCoreDepthLimitDefectAt K s
  + 9 * ((1 / 2 : Real) ^ (K + 1))
<
superGaussianFiniteTwoCoreUnitStripScalarMargin s
```

This is named by:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget K s
```

and is consumed by:

```lean
genuineCentralNoCancellation_of_twoCoreDepthLimitDefectScalarMarginBudget
genuineCentralNoCancellation_of_exists_twoCoreDepthLimitDefectScalarMarginBudget
```

So the current existential endpoint is:

```lean
exists K,
  2 <= K /\
  C2TwoCoreDepthLimitDefectScalarMarginBudget K s
```

## Defect Anatomy

The raw two-core defect was opened into a visible finite ledger:

```text
A + B + C + E
```

where:

```text
A = finite genuine approximation error
B = finite-core depth tail
C = bandSaldo
E = extraSaldo
```

The named upper is:

```lean
finiteApproxDepthTailBandExtraUpperAt K M N L s
```

and the scalar payment budget for that finite ledger is:

```lean
C2FiniteApproxDepthTailBandExtraScalarMarginBudget K M N L s
```

The bridge from the fine ledger back to the two-core scalar-margin route is:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteApproxDepthTailBandExtra
```

## Component Adapters

The full component adapter is:

```lean
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_componentUpper
```

It consumes:

```text
A upper
B upper
C upper
E upper
A + B + C + E + 9 * tailK < scalarMargin
```

The generic external-upper adapter is:

```lean
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_upper
```

## Technical Saldos

### A: Finite Approximation Error

The finite approximation component is now named:

```lean
finiteApproxErrorAt K N L s
```

Its depth-limit object is:

```lean
finiteCoreLimitDefectAt K N s
```

Lean proves convergence of the finite-depth component to the limit defect:

```lean
tendsto_finiteApproxErrorAt
```

and the allowance form:

```lean
eventually_finiteApproxErrorAt_le_limitDefect_add_allowance
```

For every `alpha > 0`, Lean can choose the finite depth so that:

```text
finiteApproxErrorAt K N L s
  <= finiteCoreLimitDefectAt K N s + alpha
```

The route-facing wrapper is:

```lean
exists_flexibleSelfBandBudget_of_limitApproxExtraMarginBudget
```

This changes the active route from:

```text
A_L + beta + E_N + 9 * tailK < scalarMargin
```

to the limit-defect payment:

```text
finiteCoreLimitDefectAt K N s
  + alpha + beta + E_N + 9 * tailK < scalarMargin
```

The finite depth `L` is therefore no longer part of the main target for `A`;
it is chosen existentially after paying a positive allowance `alpha`.

There is also a direct limit-level bridge:

```lean
twoCoreDepthLimitDefectAt_le_finiteCoreLimitDefect_extraSaldo
```

It proves:

```text
twoCoreDepthLimitDefectAt K s
  <= finiteCoreLimitDefectAt K N s + E
```

assuming `3 <= N`, `0 < s.re`, and
`C2ExtraSaldoUpperBudget K N s E`.

The direct scalar-margin consumer is:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitDefect_extraSaldo
```

It turns the limit-level payment:

```text
finiteCoreLimitDefectAt K N s + E + 9 * tailK < scalarMargin
```

directly into `C2TwoCoreDepthLimitDefectScalarMarginBudget K s`, without
carrying `L`, `alpha`, or `beta` in the endpoint payment.

The external `E` parameter is now canonically fixed by:

```lean
C2ExtraSaldoUpperBudget.self
```

The canonical debt is:

```lean
finiteCoreLimitExtraDebtAt K N s
```

meaning:

```text
finiteCoreLimitDefectAt K N s
  + superGaussianFiniteCoreExtraSaldoNormUpper N X s
```

where `X = superGaussianFiniteTwoCoreReciprocalCutoffScale K s`.

The terminal budget is:

```lean
C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

and the endpoint consumer is:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitExtra
```

So the endpoint route is now expressed by the single payment:

```text
finiteCoreLimitExtraDebtAt K N s + 9 * tailK < scalarMargin
```

The direct no-cancellation consumers are:

```lean
genuineCentralNoCancellation_of_finiteCoreLimitExtraScalarMarginBudget
genuineCentralNoCancellation_of_exists_finiteCoreLimitExtraScalarMarginBudget
```

Thus the active local middle endpoint is now bought by:

```text
exists K N,
  2 <= K /\
  3 <= N /\
  C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

### A_N Structural Upper

The finite-core limit defect is now opened by a named structural upper:

```lean
centralFiniteCoreTailUpper K N L s
```

meaning:

```text
finiteApproxErrorAt K N L s
  + superGaussianFiniteCoreDepthTailNormUpper N X s L
```

where:

```text
X = superGaussianFiniteTwoCoreReciprocalCutoffScale K s
```

Lean declaration:

```lean
finiteCoreLimitDefectAt_le_centralFiniteCoreTailUpper
```

It proves, assuming `0 < s.re`:

```text
finiteCoreLimitDefectAt K N s
  <= centralFiniteCoreTailUpper K N L s
```

Classification:

```text
A_N has a genuine-first structural upper.
The upper is not yet a closed scalar estimate.
The remaining hard component is finiteApproxErrorAt K N L s, or an equivalent
direct upper for finiteCoreLimitDefectAt K N s.
```

The terminal scalar-margin budget can now consume this structural upper
directly:

```lean
C2FiniteCoreLimitExtraScalarMarginBudget.of_centralFiniteCoreTailUpper
```

It changes the endpoint payment from:

```text
finiteCoreLimitDefectAt K N s + E_N + 9 * tailK < scalarMargin
```

to:

```text
centralFiniteCoreTailUpper K N L s + E_N + 9 * tailK < scalarMargin
```

without hiding the finite approximation error.

### finiteApproxErrorAt Anatomy

The finite approximation error is now opened by:

```lean
finiteApproxErrorAt_le_rawCentralRectangleTail_add_cutoffResidual
```

It proves:

```text
finiteApproxErrorAt K N L s
  <= rawCentralRectangleTailAt N L s
    + superGaussianFiniteGenuineCutoffResidualNormUpper 2 (L + 1) N X s
```

where:

```text
X = superGaussianFiniteTwoCoreReciprocalCutoffScale K s
```

The raw tail is named by:

```lean
rawCentralRectangleTailAt N L s
```

meaning:

```text
norm (genuineCentralDoubleSeries s - rectangularGenuine s (L + 1) N)
```

The cutoff side also has the algebraic/Taylor-style variant:

```lean
finiteApproxErrorAt_le_rawCentralRectangleTail_add_cutoffResidualAlgebraicUpper
```

It proves:

```text
finiteApproxErrorAt K N L s
  <= rawCentralRectangleTailAt N L s
    + superGaussianFiniteGenuineCutoffResidualAlgebraicUpper 2 (L + 1) N X s
```

assuming `0 < s.re`, where:

```text
X = superGaussianFiniteTwoCoreReciprocalCutoffScale K s
```

This is the route-compatible content of the finite Taylor cutoff calculation:
the active route uses `p = 2`, so the cutoff debt is the explicit finite
algebraic upper already present in Lean.  The Mellin-Barnes/global continuation
side of that calculation remains diagnostic background and is not used as an
active middle proof input.

Classification:

```text
cutoff residual is explicit and now has a named algebraic-upper split;
rawCentralRectangleTailAt is now the remaining genuine-first obstruction;
no scalar bound for rawCentralRectangleTailAt was proved in this step.
```

Raw-tail audit:

```text
No unconditional middle-valid complement-sum upper was created for
rawCentralRectangleTailAt.  Opening
  genuineCentralDoubleSeries s - rectangularGenuine s (L + 1) N
as a rectangle complement requires a valid genuine-first
HasSum/Summable/Tendsto/split theorem for this rectangle family.
```

This is only a formal alignment statement: it is not a claim that the genuine
operator fails to converge in the middle, and it is not a terminal/classical
obstruction.  The current gap is that no Lean theorem has yet been located or
proved which supplies the raw-tail budget in the exact form consumed by this
route.

The honest interface is now:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

meaning:

```text
rawCentralRectangleTailAt N L s <= R
```

The route-facing consumer is:

```lean
C2FiniteCoreLimitExtraScalarMarginBudget.of_rawCentralTailBudget_cutoffAlgebraic
```

It consumes:

```text
C2RawCentralRectangleTailUpperBudget N L s R
R
  + superGaussianFiniteGenuineCutoffResidualAlgebraicUpper 2 (L + 1) N X s
  + superGaussianFiniteCoreDepthTailNormUpper N X s L
  + superGaussianFiniteCoreExtraSaldoNormUpper N X s
  + 9 * tailK
<
superGaussianFiniteTwoCoreUnitStripScalarMargin s
```

where:

```text
X = superGaussianFiniteTwoCoreReciprocalCutoffScale K s
tailK = (1 / 2) ^ (K + 1)
```

Bracket-decay audit:

```lean
genuineBracketAddressTerm_eq_weighted_secondDifference
genuineCentralExplicitAddressTerm_eq_lateral_sub_bracket
genuineCentralBracketBridgeCorrectionTerm
genuineCentralExplicitAddressTerm_eq_bracket_add_bridgeCorrection
genuineCentralBracketBridgeCorrectionTerm_eq_weighted_residual
```

The first theorem records that the bracket address term is the weighted
second-difference expression.  The second theorem records that the current
central explicit address term is the local post-cancellation remainder.
The bridge-correction theorem records the exact mismatch:

```text
central explicit term = bracket second-difference term + bridge correction
```

and expands the correction as:

```text
dyadicWeight(depth) *
  (4 * center coefficient - minus descendant coefficient
    - plus descendant coefficient)
```

Therefore bracket-decay is not yet a source of:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

for the current raw tail.  The explicit bridge correction must first be
controlled or shown to telescope as a boundary contribution.

Detailed report:

```text
AUDIT_GENUINE_BRACKET_DECAY_RAW_TAIL.md
```

### B: Depth Tail

The depth-tail component can be made smaller than any positive allowance by
choosing `L`.

Lean declarations:

```lean
exists_finiteApproxDepthTailBandExtra_depthTailComponent_lt
exists_finiteApproxDepthTailBandExtra_depthTailComponent_le
```

The route was then simplified further by introducing an existential allowance
wrapper:

```lean
exists_flexibleSelfBandBudget_of_depthTailAllowance
```

This changes the active route from:

```text
A + B(L) + E + 9 * tailK < scalarMargin
```

to:

```text
A + beta + E + 9 * tailK < scalarMargin
```

with `beta > 0`, while `L` becomes existential.

Important detail: the finite approximation upper `A` is required eventually in
`L`, not uniformly.  This avoids pretending that `A` is independent of the
finite depth before such a theorem exists.

### C: Band Saldo

The band component vanishes on the self-band route:

```text
M = N
```

Lean declarations:

```lean
finiteApproxDepthTailBandExtra_bandComponent_self_eq_zero
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero
```

This keeps `N` flexible and removes `C` without forcing `N = 3`.

### E: Extra Saldo

The extra component vanishes at the certified two-core horizontal cutoff:

```text
M = 3
```

Lean declarations:

```lean
finiteApproxDepthTailBandExtra_extraComponent_three_eq_zero
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_extraZero
```

This is useful as a sanity route, but it should not be selected as the main
route yet, because setting `M = N = 3` may make the finite approximation error
`A` too crude.

For the flexible self-band route, `E` remains visible and is named by:

```lean
C2ExtraSaldoUpperBudget K N s E
```

The wrappers that consume it are:

```lean
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero_extraUpper
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero_extraBudget
```

## Candidate Routes

### Route A: Minimal Sanity

Set:

```text
M = N = 3
```

Then:

```text
C = 0
E = 0
```

Remaining payment:

```text
A_3 + beta + 9 * tailK < scalarMargin
```

Lean declaration:

```lean
C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandExtraZero_three
```

Status: sanity route only.  It is not the current main route.

### Route B: Flexible Self-Band

Set:

```text
M = N
```

Then:

```text
C = 0
B is absorbed by beta and existential L
E remains visible
```

Remaining payment:

```text
A_N + beta + E_N + 9 * tailK < scalarMargin
```

Status: current preferred route, because it preserves the option to improve
the finite approximation error by increasing `N`.

The named Lean budget for this tradeoff is:

```lean
C2FlexibleSelfBandApproxExtraMarginBudget K N s A E beta
```

and it is consumed by:

```lean
exists_flexibleSelfBandBudget_of_approxExtraMarginBudget
```

This is now the component-level route surface.  It intentionally keeps `A_N`
and `E_N` in the same payment because increasing `N` may improve the finite
approximation while also increasing the accumulated extra-core mass.

After normalizing `A` to its depth-limit object, the preferred payment surface
is:

```text
finiteCoreLimitDefectAt K N s
  + alpha + beta + E_N + 9 * tailK < scalarMargin
```

The Lean consumer is:

```lean
exists_flexibleSelfBandBudget_of_limitApproxExtraMarginBudget
```

After adding the direct limit-level bridge, the endpoint-level payment is:

```text
finiteCoreLimitDefectAt K N s + E_N + 9 * tailK < scalarMargin
```

The Lean consumer is:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitDefect_extraSaldo
```

The finite `L`, `alpha`, and `beta` route remains useful as a witness route for
finite ledgers, but the endpoint payment can now be stated at limit level.

After canonizing `E_N`, the terminal budget is:

```lean
C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

or equivalently:

```text
finiteCoreLimitExtraDebtAt K N s + 9 * tailK < scalarMargin
```

## Extra-Saldo Audit

The current `E` object is:

```lean
superGaussianFiniteCoreExtraSaldoNormUpper N X s
```

It is an explicit genuine-first upper:

```text
tsum over depth j of norms of visible extra-core layers
```

Each visible extra-core layer is a finite sum over:

```text
oddCoresUpTo N \ oddCoresUpTo 3
```

Current classification:

```text
E is explicit and route-local.
E is not currently known to decay with N.
E should not be treated as a standalone cauda.
E may grow with N and must be balanced against A_N.
```

No theorem was found in the current file proving an asymptotic decay of
`extraSaldo` in `N`.  The file currently provides:

```text
explicit extra-core definition
summability of extra-core layers
upper for the exact extra-core depth limit
consumer criteria
exact zero at M = 3
```

## Current Reduced Target

After the component cleanup, the current useful target is:

```lean
exists K N,
  2 <= K /\
  3 <= N /\
  C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

This is a schematic target.  The exact named Lean budget is:

```lean
C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

It is consumed by:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitExtra
```

and then by:

```lean
genuineCentralNoCancellation_of_finiteCoreLimitExtraScalarMarginBudget
genuineCentralNoCancellation_of_exists_finiteCoreLimitExtraScalarMarginBudget
```

followed by:

```lean
C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteApproxDepthTailBandExtra
genuineCentralNoCancellation_of_exists_twoCoreDepthLimitDefectScalarMarginBudget
```

## What Is Closed

Closed by Lean declarations:

```text
two-core defect naming
stable-gap naming
scalar-margin budget
scalar-margin to no-cancellation endpoint wrappers
fine finite ledger A+B+C+E
bridge from fine ledger to two-core scalar budget
B depth-tail allowance via existential L
C zero on M=N
E zero at M=3
flexible self-band wrapper with external E
named interface for E
A finite approximation error naming
A depth-limit defect naming
A_L convergence to the finite-core limit defect
A allowance wrapper removing L from the active target
direct limit-level A+E bridge to the raw two-core defect
direct scalar-margin consumer for finiteCoreLimitDefectAt + E
canonical A+E debt naming
terminal scalar-margin budget for the canonical A+E debt
canonical endpoint consumer without external E
pointwise no-cancellation wrapper for the canonical A+E budget
existential no-cancellation wrapper for the canonical A+E budget
structural upper for finiteCoreLimitDefectAt by centralFiniteCoreTailUpper
structural payment from centralFiniteCoreTailUpper to terminal scalar budget
finiteApproxErrorAt split into rawCentralRectangleTailAt plus cutoff residual
finiteApproxErrorAt split into rawCentralRectangleTailAt plus algebraic cutoff
residual upper
finite-address bridge:
  rectangularGenuine = bracket rectangle + bridge-correction rectangle
finite correction ledger:
  raw rectangle - bracket rectangle is bounded by
  genuineCentralBracketBridgeCorrectionRectangleNormUpper
```

## What Remains Open

Open items:

```text
1. Prove or identify a genuine-first source of
   C2RawCentralRectangleTailUpperBudget N L s R.
2. If using bracket-decay, first control
   genuineCentralBracketBridgeCorrectionRectangleSum or prove that it
   telescopes as a boundary contribution.  The finite rectangle bridge and its
   finite norm ledger are now proved, but no decay/telescoping bound is proved.
3. Use the named algebraic cutoff residual upper for the regularization
   residual.
4. Audit finiteCoreLimitExtraDebtAt K N s as a single A+E object.
5. Decide whether increasing N improves finiteCoreLimitDefectAt faster than it
   increases E_N.
6. Prove the existential terminal budget:
   exists K N, 2 <= K /\ 3 <= N /\
     C2FiniteCoreLimitExtraScalarMarginBudget K N s.
```

## Guardrails

Do not do now:

```text
do not select M=N=3 as the main route without A_3 control
do not return to positive box
do not return to oddRef
do not use sampled diagnostics as proof
do not chase the old canonical detour
do not introduce terminal analytic input into active middle work
```

## Verification Status

Commands that passed after the current route cleanup:

```bash
lake env lean LeanC2/AuditGenuineMiddle.lean
lake build LeanC2.AuditGenuineMiddle
```

The build still reports pre-existing style warnings in the large Lean files.
No new Lean error remains from this route cleanup.

## Next Action

Next action:

```text
Audit or prove a legitimate raw-tail upper budget:
  C2RawCentralRectangleTailUpperBudget N L s R.
Do not replace it by an unconditional complement-sum upper unless the required
genuine-first HasSum/Summable/Tendsto/split theorem for this rectangle family
is available.
Do not use bracket-decay by taking norms of direct and bracket pieces
separately; first control the explicit bridge correction or prove that it
telescopes as a boundary contribution.
```

The next mathematical decision is whether the combined tradeoff

```text
finiteCoreLimitExtraDebtAt K N s
```

can fit below the scalar margin after paying the small depth-tail allowance and
the dyadic64 tax.
