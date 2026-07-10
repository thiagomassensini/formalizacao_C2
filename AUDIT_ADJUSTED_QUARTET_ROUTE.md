# Audit: adjusted quartet no-cancellation route

This note records the current formal status of the candidate C2 route to RH.
It deliberately does not use `LeanC2/PeerReview.lean` and does not rely on
`ROUTE_TAG` comments.

Lean audit module:

- `LeanC2/AuditGenuineMiddle.lean`
- `LeanC2/AuditAdjustedQuartetRoute.lean`
- `LeanC2/AuditContinuedQuartetRoute.lean`
- `LeanC2/AuditContinuedQuartetProfile.lean`
- `LeanC2/AuditContinuedQuartetHorizontal.lean`
- `LeanC2/AuditContinuedQuartetDominance.lean`
- `LeanC2/AuditContinuationObligations.lean`

Working TODO tracker:

- `AUDIT_GENUINE_MIDDLE_TODO.md`
- `AUDIT_ADJUSTED_QUARTET_TODO.md`

Correction on 2026-06-22: the genuine middle audit is the primary mathematical
no-cancellation surface.  The continued-channel route remains transfer-side
plumbing/diagnostics and should not be treated as the geometric proof target.

Update on 2026-06-23: the base regularized genuine block
`rectangularExponentialGenuine s 5 1 X` is Lean-verified nonzero for
`0 < s.re` and `0 < X`, by exact weighted-quartet factorization.  The active
finite regularized target is now the exact two-core fiber prefix left by the
block `K = 5, M = 3`.

Historical source endpoint:

- `LeanC2/Analytic/GenuineBulkConcrete.lean`
- Existing historical names there still contain `AntiMiracle`; the audit module
  exposes the same route under the technical name "adjusted quartet
  no-cancellation".

## Current Status

Genuine middle route:

| Item | Status | Lean surface |
| --- | --- | --- |
| Quartet vertical prefix nonzero in `Re(s) > 0` | Lean-verified | `GenuineMiddleAudit.verticalQuartetPrefix_ne_zero_of_re_pos` |
| Quartet finite depth factor nonzero for `K = 5` | Lean-verified | `GenuineMiddleAudit.rectangularDepthFactor_five_ne_zero_of_re_pos` |
| Finite genuine nonzero reduced to odd-core nonzero | Reduced | `GenuineMiddleAudit.rectangularGenuine_five_ne_zero_of_oddCore_ne_zero` |
| Odd-core nonzero reduced to base dominance | Reduced | `GenuineMiddleAudit.rectangularOddCoreSum_ne_zero_of_base_dominance` |
| Minimal quartet rectangle nonzero for `K = 5, M = 1` | Lean-verified | `GenuineMiddleAudit.rectangularGenuine_five_one_ne_zero_of_re_pos` |
| Two-core quartet rectangle nonzero for `K = 5, M = 3` | Lean-verified | `GenuineMiddleAudit.rectangularGenuine_five_three_ne_zero_of_re_pos` |
| Weighted quartet prefix barrier in `Re(s) > 0` | Lean-verified | `GenuineMiddleAudit.weightedQuartetPrefix_ne_zero_of_re_pos` |
| Explicit lower bound for `K = 5, M = 3` genuine block | Lean-verified | `GenuineMiddleAudit.rectangularGenuine_five_three_norm_lower_bound_of_re_pos` |
| Finite cutoff genuine nonzero from oscillatory residual dominance | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_ne_zero_of_oscillatory_upper_lt` |
| Base finite cutoff nonzero for `K = 5, M = 1`, `X > 0` | Lean-verified | `GenuineMiddleAudit.rectangularExponentialGenuine_five_one_ne_zero_of_re_pos_of_cutoff_pos` |
| Two-core cutoff block factors through exact fiber prefix | Lean-verified | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_eq_twoCore_fiberPrefix` |
| Two-core fiber prefix splits into address `4` and `12` quartet prefixes | Lean-verified | `GenuineMiddleAudit.twoCoreCutoffFiberPrefix_eq_address_prefixes` |
| Each address quartet prefix is individually nonzero | Lean-verified | `GenuineMiddleAudit.cutoffAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos` |
| Two-core finite cutoff nonzero iff exact fiber prefix is nonzero | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_iff_twoCore_fiberPrefix` |
| Two-core finite cutoff nonzero from no address collision | Reduced | `GenuineMiddleAudit.twoCoreCutoffAddressCollision`; `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_no_address_collision` |
| Local address-dominance criterion | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_address_norm_dominance` |
| Region-level two-core cutoff package | Reduced | `GenuineMiddleAudit.TwoCoreCutoffNoAddressCollisionOn`; `GenuineMiddleAudit.TwoCoreCutoffNonvanishingOn`; `GenuineMiddleAudit.twoCoreCutoffNonvanishingOn_of_noAddressCollisionOn` |
| Two-core finite cutoff nonzero from explicit residual lower bound | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt_lower` |
| Default `J = 24` two-core residual criterion | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper24_lt_lower` |
| Balanced genuine bulk model equals central C2 double series in `Re(s) > 0` | Lean-verified | `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos` |
| Genuine central no-cancellation | Open | `GenuineMiddleAudit.GenuineCentralNoCancellation` |

Continued transfer route:

| Item | Status | Lean surface |
| --- | --- | --- |
| Continued bulk model analytic on punctured right half-plane | Lean-verified | `ContinuedQuartetAudit.analyticOnNhd_punctured` |
| Near-axis data for continued bulk model | Lean-verified | `ContinuedQuartetAudit.nearAxisData` |
| Edge branch | Lean-verified empty package | `ContinuedQuartetAudit.emptyEdgeData` |
| Route plumbing from continued middle estimates to `RiemannHypothesis` | Lean-verified once `ClosureInputs.middle` is supplied | `ContinuedQuartetAudit.ClosureInputs.riemannHypothesis` |
| Unit/half exact-residual middle profile | Lean-verified reduction | `ContinuedQuartetAudit.UnitHalfExactProfileMiddleInputs` |
| Exact weighted horizontal envelope | Closed for constant horizontal cutoff | `ContinuedQuartetAudit.weightedHorizontalEnvelope`; `UnitHalfExactProfileLocalData.ofConstantCoreCutoff` |
| Continued quartet middle estimates | Reduced to structured vertical-anchor residual dominance | `ConstantCoreCutoffMiddleDominanceInputs`; `ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance` |
| Raw triangle residual shortcut | Ruled out | `not_constantCoreTriangleResidualUpper_lt_allowanceReserve` |
| Scaled anchor floor at zeta zeros | Continued-channel transfer diagnostic only | `not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero` |
| Anchor factor target | Reduced only on the continued-channel transfer surface | `continuedAnchorFactorAllowance`; `continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance` |

Secondary historical route:

| Item | Status | Lean surface |
| --- | --- | --- |
| Route plumbing from explicit inputs to off-critical nonvanishing | Lean-verified | `AdjustedQuartetAudit.ClosureInputs.offCriticalNonvanishing` |
| Route plumbing from explicit inputs to `RiemannHypothesis` | Lean-verified | `AdjustedQuartetAudit.ClosureInputs.riemannHypothesis` |
| Exact-comparison residual vanishes on the middle region | Lean-verified once `comparison` is supplied | `AdjustedQuartetAudit.ClosureInputs.residual_eq_zero` |
| Near-axis data from genuine continuation | Bypassed on primary route | `ContinuedQuartetAudit.nearAxisData` |
| Edge branch | Lean-verified empty edge package | `AdjustedQuartetAudit.emptyEdgeData` |
| Middle-region scale signs and positivity | External pointwise obligation | `AdjustedQuartetAudit.PointwiseBounds.scale` |
| Horizontal layer budget | External pointwise obligation | `AdjustedQuartetAudit.PointwiseBounds.horizontal` |
| Balancing-seed norm bound | External pointwise obligation | `AdjustedQuartetAudit.PointwiseBounds.seed` |
| Cutoff-error bound | External pointwise obligation | `AdjustedQuartetAudit.PointwiseBounds.cutoff` |
| Adjusted quartet no-cancellation margin | Main open obligation | `AdjustedQuartetAudit.PointwiseBounds.dominance` |
| Older `canonicalClosedScaled` local certificate | Ruled out for this route | `AdjustedQuartetAudit.canonicalClosedScaledLocalData_impossible` |

## Technical Naming

| Historical informal label | Audit terminology |
| --- | --- |
| Anti-Miracle | adjusted quartet no-cancellation |
| Anti-Miracle closed inputs | adjusted quartet closure inputs |
| zero-proxy route | exact-comparison residual-zero route |
| edge vazio | empty edge branch |
| middle | off-critical middle region |

## Genuine-First Mathematical Target

For the active genuine route, the base finite regularized block is closed:

```lean
0 < s.re -> 0 < X ->
  rectangularExponentialGenuine s 5 1 X ≠ 0
```

through:

```lean
GenuineMiddleAudit.rectangularExponentialGenuine_five_one_ne_zero_of_re_pos_of_cutoff_pos
```

The current two-core finite regularized middle target is no longer the coarse
residual comparison.  Lean has factored the block exactly, so the active target
is:

```lean
GenuineMiddleAudit.twoCoreCutoffFiberPrefix s X ≠ 0
```

Equivalently, by the address-prefix split:

```lean
GenuineMiddleAudit.cutoffAddressQuartetPrefix s X 4 +
  complexDirichletCoeff s 3 *
    GenuineMiddleAudit.cutoffAddressQuartetPrefix s X 12 ≠ 0
```

This is the finite genuine object where the remaining non-cancellation proof
has to happen.  The two address prefixes are not independent: both use the same
`q s`, the same cutoff scale `X`, and the odd-core coefficient
`complexDirichletCoeff s 3`.

Lean now proves that every single address quartet prefix is nonzero under
`0 < s.re` and `0 < X`:

```lean
GenuineMiddleAudit.cutoffAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos
```

Thus the remaining finite obstruction is exactly a cross-core collision between
two already nonzero address prefixes, not a vertical-prefix zero.

Audit correction: the unrestricted global statement

```lean
0 < s.re -> 0 < X ->
  rectangularExponentialGenuine s 5 3 X ≠ 0
```

is not a safe target.  The numerical audit script
`audit_two_core_cutoff_zero_certificate.py` reproduces an extremely small
residual of the exact prefix near
`sigma = 3.0194247128036204e-9`,
`t = 168021.56816461699`,
`X = 81444144.70071535`.
This is near the positive-real boundary and should be treated as obstruction
evidence, not as proof evidence.  The next genuine-first target must include
the actual middle-region hypotheses, a cutoff regime that excludes this
near-axis degeneration, or a better regularized genuine channel.

The audit module now exposes the region-level form:

```lean
GenuineMiddleAudit.TwoCoreCutoffNoAddressCollisionOn region ->
  GenuineMiddleAudit.TwoCoreCutoffNonvanishingOn region
```

through:

```lean
GenuineMiddleAudit.twoCoreCutoffNonvanishingOn_of_noAddressCollisionOn
```

The older residual comparison remains a valid sufficient criterion:

```lean
rectangularExponentialPointwiseOscillatoryUpper s 5 3 J X <
  GenuineMiddleAudit.rectangularGenuineFiveThreeNormLower s
```

with `J = 24` for the note-style default Taylor depth.  Lean verifies that this
single inequality implies `rectangularExponentialGenuine s 5 3 X ≠ 0` through:

```lean
GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper24_lt_lower
```

This residual criterion is not the active target unless its upper bound is
sharpened enough.  The fiber-ratio shortcut in
`rectangularExponentialGenuine_five_three_ne_zero_of_fiber_ratio_bounds` is
also only local; its hypotheses are empirically too strong globally.

The infinite middle target remains:

```lean
GenuineMiddleAudit.GenuineCentralNoCancellation s
```

If the raw `tsum` central object is not the right middle-strip carrier, the
next mathematical step is to define the certified regularized genuine channel
and prove the same no-cancellation shape for that channel.

For the transfer-side historical route, the remaining middle-region package is:

```lean
C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates
```

The current chosen constants profile reduces that package to:

```lean
ContinuedQuartetAudit.UnitHalfExactProfileLocalData coreCutoff K M H s
```

with:

```lean
tiltScale      := unitScale
horizontalScale:= unitScale
horizontalRatio:= halfHorizontalRatio   -- constant 1 / 2
cutoffScale    := unitScale
tiltConstant   := exactResidualTiltConstant K M H
cutoffConstant := exactResidualCutoffConstant K M
```

Lean has verified the conversion:

```lean
UnitHalfExactProfileLocalData.toConcreteEstimates
UnitHalfExactProfileLocalData.ofHorizontalLayerBudget
UnitHalfExactProfileLocalData.ofOddTruncationBudget
weightedHorizontalEnvelope_nonneg
weightedHorizontalEnvelope_layer_bound
weightedHorizontalLayerSeries_summable_of_truncationMajorant
UnitHalfExactProfileLocalData.ofTruncationMajorant
two_mul_q_norm_lt_one_of_re_pos
c2WeightedTruncationMajorant_summable_of_uniformBound
UnitHalfExactProfileLocalData.ofUniformTruncationBound
c2ConcreteOddTruncationError_uniformBound_of_core_odd_bounds
c2ConcreteOddTruncationError_uniformBound_of_core_bound
UnitHalfExactProfileLocalData.ofUniformCoreOddBounds
UnitHalfExactProfileLocalData.ofUniformCoreBound
UnitHalfExactProfileLocalData.ofFiniteCoreUpperBound
UnitHalfExactProfileLocalData.ofConstantCoreCutoff
ConstantCoreCutoffMiddleDominanceInputs.toMiddleInputs
ConstantCoreCutoffMiddleDominanceInputs.riemannHypothesis
constantCoreResidualUpper_eq_closed
ConstantCoreCutoffMiddleDominanceInputs.ofResidualDominance
ConstantCoreCutoffMiddleDominanceInputs.ofAllowanceReserveDominance
ConstantCoreCutoffMiddleDominanceInputs.ofClosedAllowanceReserveDominance
constantCoreHorizontalEnvelope_eq_closed_of_re_pos
constantCoreClosedResidualUpper_eq_geometric_of_re_pos
constantCoreGeometricResidualUpper_le_triangle_of_offCritical
ConstantCoreCutoffMiddleDominanceInputs.ofTriangleAllowanceReserveDominance
not_constantCoreTriangleResidualUpper_lt_allowanceReserve
continuedVerticalChannelAnchor_eq_factorized
c2ContinuedVerticalResidual_eq_anchor_add_cutoff
c2ContinuedVerticalResidual_eq_factorized_anchor_add_cutoff
c2ContinuedCutoffError_eq_depth_core_split
c2ContinuedVerticalResidual_eq_anchor_add_depth_core_errors
continuedVerticalChannelAnchorExactUpper_eq_factorized_norm
c2ContinuedVerticalResidualExactUpper_le_anchor_add_cutoff
constantCoreStructuredResidualUpper
constantCoreGeometricResidualUpper_le_structured_of_offCritical
ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance
continuedVerticalAnchorScaledFloor
continuedVerticalAnchorScaledFloor_le_structured_of_offCritical
continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_structured
continuedOddDirichletChannel_eq_zero_of_zeta_zero
continuedVerticalChannelAnchorExactUpper_eq_verticalDepthTailFromTwo_norm_of_zeta_zero
c2AnalyticBulkAllowance_sub_reserve_lt_verticalDepthTailUpper_of_offCriticalStrip
verticalDepthTailUpper_le_continuedVerticalAnchorScaledFloor_of_zeta_zero
not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero
continuedAnchorFactorAllowance
continuedVerticalAnchorScaledFloor_eq_factor_norm
continuedVerticalAnchorScaledFloor_le_factorScaledVerticalTail_of_offCritical
continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance
continuedAnchorFactorAllowance_lt_one_of_offCritical
riemannZeta_ne_zero_of_continuedAnchorFactorAllowance
riemannZeta_ne_zero_of_structuredAllowanceReserveDominance
UnitHalfExactProfileMiddleInputs.toClosureInputs
UnitHalfExactProfileMiddleInputs.riemannHypothesis
```

The central field inside that package is the continued quartet dominance
inequality:

```lean
c2QuartetBulkGUpper
    (c2BulkGUpper
      (c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)) s +
  c2BulkEUpper (c2CutoffUpperFromScale cutoffConstant cutoffScale) s <
    c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))
```

For the secondary historical route, the remaining core inequality is:

```lean
c2ConcreteAntiMiracleAdjustedMain
    (c2OddTailBalancingSeed coreCutoff K M) s -
  c2ConcreteAntiMiracleAdjustedDefect coreCutoff s -
  c2ConcreteAntiMiracleAdjustedTailScaledUpper
    tiltConstant tiltScale
    horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale s > 0
```

Conceptually, both versions say that the quartet main term has strictly more
mass than the explicit defect and tail budgets.  The active genuine route keeps
this statement on the geometric genuine operator before any transfer step.

## Next Validation Steps

1. Use `LeanC2/AuditGenuineMiddle.lean` as the primary route.
2. Prove the finite regularized inequality
   `rectangularExponentialPointwiseOscillatoryUpper s 5 3 24 X <
   GenuineMiddleAudit.rectangularGenuineFiveThreeNormLower s`.
3. If that upper is too coarse, sharpen the finite oscillatory cutoff estimate
   while keeping the same target inequality.
4. Decide whether the raw `genuineCentralDoubleSeries` is acceptable in the
   middle strip.  If not, introduce the certified regularized genuine central
   channel and restate `GenuineCentralNoCancellation` for that channel.
5. Only after the genuine no-cancellation surface is closed, use the transfer
   route as downstream plumbing.
   This is a transfer-side diagnostic, not the geometric proof target.
7. Rebuild the normalized anchor-factor target with a zeta-free genuine channel.
   The continued-channel version is:
   `‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
   continuedAnchorFactorAllowance s`.
   Lean proves this target is sufficient for the scaled-anchor floor, and that
   `continuedAnchorFactorAllowance s < 1` on the off-critical strip, but
   `continuedOddDirichletChannel` contains `riemannZeta` by definition.
8. If the structured residual margin appears positive with slack, replace
   numerical evidence with certified interval or analytic bounds.
9. Encode those bounds as an inhabitant of
   `ConstantCoreCutoffMiddleDominanceInputs`.
10. Assemble `ContinuedQuartetAudit.ClosureInputs`; at that point Lean derives RH
   through `ContinuedQuartetAudit.ClosureInputs.riemannHypothesis`.

## Recommended Proof Order

The primary route should be closed one obligation at a time, in this order:

1. **Scale data and exact residual constants**: closed by
   `UnitHalfExactProfileLocalData.toExactEstimates`.
2. **Horizontal envelope `H`**: with
   `H := weightedHorizontalEnvelope (fun _ => N)`, closed by
   `UnitHalfExactProfileLocalData.ofConstantCoreCutoff`.
3. **Continued quartet dominance**: prove the strict quartet margin in
   `ConstantCoreCutoffMiddleDominanceInputs`.  The current audit surface reduces
   this to
   `ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance`.
   The raw triangle shortcut is formally ruled out; the structured target keeps
   the factor
   `verticalDepthTailFromTwo s * (1 - (2 : ℂ) * continuedOddDirichletChannel s)`
   instead of replacing it by the large vertical tail norm.
   Lean also isolates the scaled anchor floor
   `continuedVerticalAnchorScaledFloor`; proving it fits in the allowance-reserve
   margin is a necessary condition before adding finite horizontal/cutoff slack.
   The theorem
   `not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero`
   shows this necessary condition already excludes off-critical zeta zeros, so
   the next proof target is the corresponding middle-region anchor-margin
   estimate away from zeta zeros.  Lean reduces that estimate to the normalized
   factor inequality against `continuedAnchorFactorAllowance` only for the
   continued-channel transfer surface.  The geometric route must replace this
   with a zeta-free genuine-channel estimate.
4. **Closure assembly**: once the profile local data holds across
   `ContinuedQuartetAudit.middleRegion`, construct
   `ContinuedQuartetAudit.ClosureInputs`.

The useful discipline is to keep every bound as small and explicit as possible:
large constants may close local upper-bound obligations but can destroy the
strict dominance margin.
