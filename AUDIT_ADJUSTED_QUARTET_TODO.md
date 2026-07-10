# TODO: adjusted quartet no-cancellation route

Last updated: 2026-06-22.

This tracker is the working checklist for the audited C2 route.

Correction on 2026-06-22: the active mathematical target is now tracked in the
zeta-free genuine middle audit:

```lean
C2.GenuineMiddleAudit.GenuineCentralNoCancellation
```

See `AUDIT_GENUINE_MIDDLE_TODO.md` and
`LeanC2/AuditGenuineMiddle.lean`.  The continued-channel package below remains
useful transfer-side plumbing, but it is not the primary geometric
no-cancellation evidence.

The continued transfer package is:

```lean
C2.ContinuedQuartetAudit.ClosureInputs
```

Lean constructs the near-axis certificate directly for the continued bulk
model, without requiring `GenuineFInfiniteContinuationData`; this is a
transfer-side simplification, not a replacement for the genuine middle
non-cancellation proof.

The older adjusted quartet package is still tracked as a secondary route:

```lean
C2.AdjustedQuartetAudit.ClosureInputs
```

Once the continued transfer package is constructed, Lean derives
`RiemannHypothesis` through:

```lean
C2.ContinuedQuartetAudit.ClosureInputs.riemannHypothesis
```

The current chosen middle profile is:

```lean
C2.ContinuedQuartetAudit.UnitHalfExactProfileMiddleInputs
```

It fixes the scales and exact residual constants as:

```lean
tiltScale      := unitScale
horizontalScale:= unitScale
horizontalRatio:= halfHorizontalRatio   -- constant 1 / 2
cutoffScale    := unitScale
tiltConstant   := exactResidualTiltConstant K M H
cutoffConstant := exactResidualCutoffConstant K M
```

For the active horizontal route, `H` is chosen as:

```lean
C2.ContinuedQuartetAudit.weightedHorizontalEnvelope coreCutoff
```

This is the exact weighted sum of the horizontal layer norms.  Its
nonnegativity and conversion to the unit/half layer budget are Lean-verified.
Lean has also proved that, because `2 * ‖q s‖ < 1` in the open right
half-plane, a uniform bound

```lean
∀ j, ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ C
```

is enough to supply the weighted horizontal summability.

Lean has also split that uniform truncation bound into the smaller target:

```lean
∀ j, ‖rectangularOddCoreSum s (coreCutoff j)‖ ≤ coreUpper
```

plus the pointwise odd-channel norm.  This reduction is verified by
`c2ConcreteOddTruncationError_uniformBound_of_core_bound` and assembled into
the profile by `UnitHalfExactProfileLocalData.ofUniformCoreBound`.

For the active route we can choose a constant horizontal cutoff
`coreCutoff := fun _ => N`.  Under this choice, Lean closes the finite-core
uniformity by definition and reduces the middle package to one dominance input:

```lean
C2.ContinuedQuartetAudit.ConstantCoreCutoffMiddleDominanceInputs N K M
```

The dominance audit surface first reduces that package to the closed residual
inequality:

```lean
constantCoreClosedResidualUpper N K M s <
  c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s
```

on the constant-cutoff middle region.  Lean then rewrites the horizontal
envelope to its closed geometric form.  The current live dominance target is:

```lean
constantCoreGeometricResidualUpper N K M s <
  c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s
```

on the same middle region.  A tempting shortcut replaces the exact continued
vertical/cutoff norms by the triangle envelopes:

```lean
constantCoreTriangleResidualUpper N K M s <
  c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s
```

Lean proves this shortcut is too coarse at every off-critical point:

```lean
not_constantCoreTriangleResidualUpper_lt_allowanceReserve
```

Lean now exposes the structured replacement for the raw triangle bound:

```lean
continuedVerticalChannelAnchor_eq_factorized
c2ContinuedVerticalResidual_eq_anchor_add_depth_core_errors
constantCoreStructuredResidualUpper
ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance
continuedVerticalAnchorScaledFloor
continuedVerticalAnchorScaledFloor_le_structured_of_offCritical
continuedOddDirichletChannel_eq_zero_of_zeta_zero
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
```

The fixed vertical anchor factors as

```lean
verticalDepthTailFromTwo s *
  (1 - (2 : ℂ) * continuedOddDirichletChannel s)
```

with no `Re(s) > 1` hypothesis.  The remaining finite pieces are the odd-core
truncation error and the rectangular-depth cutoff error, packaged through the
continued cutoff exact upper.  So the current preferred live target is:

```lean
constantCoreStructuredResidualUpper N K M s <
  c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s
```

on the constant-cutoff middle region.  These reductions, the structured split,
and the triangle obstruction are Lean-verified in
`LeanC2/AuditContinuedQuartetDominance.lean`.

Lean also isolates the necessary anchor floor:

```lean
continuedVerticalAnchorScaledFloor s
```

and proves that every structured residual upper dominates it on the
off-critical strip:

```lean
continuedVerticalAnchorScaledFloor_le_structured_of_offCritical
continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_structured
```

Thus any successful structured dominance proof must, in particular, establish
that this scaled anchor fits inside the allowance-reserve margin.

Lean also proves a transfer-side zero obstruction for that necessary condition:

```lean
not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero
```

At an off-critical zero of `riemannZeta`, the continued odd channel is zero, the
continued vertical anchor is exactly the vertical tail, and the allowance-reserve
margin is strictly smaller than `verticalDepthTailUpper`.  Therefore the
required scaled-anchor inequality cannot hold at such a point.  This is only a
diagnostic for the continued-channel transfer surface, because
`continuedOddDirichletChannel` is defined from `riemannZeta`.  It is not the
primary geometric no-cancellation target for the C2 genuine operator.

Lean further normalizes this continued-channel diagnostic into the explicit
factor target:

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
  continuedAnchorFactorAllowance s
```

where `continuedAnchorFactorAllowance` is the allowance-reserve margin divided
by the scaled vertical-tail denominator.  The theorem
`continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance`
proves that this factor inequality is sufficient for the scaled-anchor margin.
Lean also proves `continuedAnchorFactorAllowance_lt_one_of_offCritical`, so the
target is genuinely a strict cancellation estimate for the continued anchor
factor.  Because the factor contains `continuedOddDirichletChannel`, this target
must remain transfer-side unless it is replaced by a zeta-free genuine-channel
version.

For the secondary package, Lean derives off-critical nonvanishing and then
`RiemannHypothesis` through:

```lean
C2.AdjustedQuartetAudit.ClosureInputs.offCriticalNonvanishing
C2.AdjustedQuartetAudit.ClosureInputs.riemannHypothesis
```

## Evidence Rules

- Mark an item **Closed** only when there is a named Lean declaration compiling
  in the audit surface or in an imported module.
- Mark an item **Ruled out** only when there is a named Lean theorem proving an
  obstruction, contradiction, or empty-region result.
- Mark an item **Candidate** when the route shape is plausible but the exact
  Lean obligation is not yet constructed.
- Mark an item **Open** when no complete Lean inhabitant/proof has been found.
- Numerical experiments may guide the work, but they do not close an item until
  replaced by certified interval bounds or analytic Lean proofs.
- Do not use `LeanC2/PeerReview.lean`, `ROUTE_TAG` comments, or `REPORT.md` as
  proof evidence for this checklist.

## Status Legend

| Status | Meaning |
| --- | --- |
| Closed | Lean declaration compiles and supplies the obligation |
| Conditional | Lean closes the step once explicit inputs are supplied |
| Bypassed | no longer required on the primary route |
| Reduced | replaced by smaller named Lean obligations, still not closed |
| Candidate | promising route, still missing formal evidence |
| Open | not yet supplied |
| Ruled out | Lean proves this route or sub-route cannot work as stated |

## Primary Continued Quartet Package

| Item | Status | Evidence | Next action |
| --- | --- | --- | --- |
| Audit surface for continuation-free route | Closed | `LeanC2/AuditContinuedQuartetRoute.lean` | Use as primary source of truth |
| Unit/half exact-residual middle profile | Closed | `LeanC2/AuditContinuedQuartetProfile.lean`; `UnitHalfExactProfileMiddleInputs.riemannHypothesis` | Use as current constants profile |
| Exact weighted horizontal envelope | Closed for constant horizontal cutoff | `LeanC2/AuditContinuedQuartetHorizontal.lean`; `weightedHorizontalEnvelope_layer_bound`; `UnitHalfExactProfileLocalData.ofConstantCoreCutoff`; `ConstantCoreCutoffMiddleDominanceInputs.toMiddleInputs` | Use `coreCutoff := fun _ => N` and attack dominance |
| Near-axis for continued bulk model | Closed | `ContinuedQuartetAudit.nearAxisData` | No genuine continuation input needed |
| Empty edge branch | Closed | `ContinuedQuartetAudit.emptyEdgeData` | Keep edge empty unless a later split needs it |
| Constant-cutoff dominance surface | Reduced to structured vertical-anchor residual inequality | `LeanC2/AuditContinuedQuartetDominance.lean`; `ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance` | Prove the structured residual inequality using the anchor factor and finite cutoff control |
| Scaled anchor floor | Necessary condition isolated; continued-channel transfer diagnostics closed | `continuedVerticalAnchorScaledFloor_le_structured_of_offCritical`; `continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_structured`; `not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero`; `continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance` | Rebuild the anchor-factor target with a zeta-free genuine channel before using it as a geometric dominance input |
| Triangle residual shortcut | Ruled out | `not_constantCoreTriangleResidualUpper_lt_allowanceReserve` | Do not use raw triangle majorization for dominance |
| Package to construct | Reduced to dominance | `ConstantCoreCutoffMiddleDominanceInputs.riemannHypothesis` | Prove the constant-cutoff middle dominance package |
| RH from package | Conditional | `ClosureInputs.riemannHypothesis` | Wait for middle estimates |

## Primary Middle Obligation

| Field | Lean target | Status | Current evidence | Next action |
| --- | --- | --- | --- | --- |
| Continued quartet middle estimates | `∀ s ∈ ContinuedQuartetAudit.middleRegion coreCutoff K M, C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates ... s` | Reduced | `UnitHalfExactProfileMiddleInputs.toClosureInputs` | Prove the reduced profile obligations below |

## Unit/Half Exact-Residual Profile Obligations

| Field | Lean target | Status | Current evidence | Next action |
| --- | --- | --- | --- | --- |
| Horizontal envelope nonnegativity | `0 ≤ weightedHorizontalEnvelope coreCutoff s` | Closed | `weightedHorizontalEnvelope_nonneg` | No action for the active `H` |
| Horizontal layer envelope | `∀ j, ‖c2ConcreteOddHorizontalLayerDefect (fun _ => N) s j‖ ≤ H s * (1 / 2)^j` | Closed for constant horizontal cutoff | `weightedHorizontalEnvelope_layer_bound`; `two_mul_q_norm_lt_one_of_re_pos`; `UnitHalfExactProfileLocalData.ofConstantCoreCutoff` | No separate horizontal action on the constant-cutoff route |
| Continued quartet dominance under profile | `quartet_dominance` for `exactResidualTiltConstant`, `unitScale`, `H`, `halfHorizontalRatio`, `exactResidualCutoffConstant` | Reduced | `ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance`; `continuedVerticalChannelAnchor_eq_factorized`; `c2ContinuedVerticalResidual_eq_anchor_add_depth_core_errors` | Prove `constantCoreStructuredResidualUpper < allowance - reserve`; avoid the ruled-out triangle bound |
| Profile to concrete estimates | `UnitHalfExactProfileLocalData.toConcreteEstimates` | Closed | `LeanC2/AuditContinuedQuartetProfile.lean` | No action |
| Profile middle package to RH | `ConstantCoreCutoffMiddleDominanceInputs.riemannHypothesis` | Conditional | Compiles once dominance is supplied on the constant-cutoff middle region | Wait for dominance |

## Continued Quartet Estimate Fields

| Field | Lean target | Status | Suggested route |
| --- | --- | --- | --- |
| Off-critical membership | `offCriticalStrip s` | Closed in middle region | Use `hs.1` from `middleRegion` |
| Scale signs | positivity/nonnegativity fields for `tilt*`, `horizontal*`, `cutoff*` | Closed under profile | `UnitHalfExactProfileLocalData.toExactEstimates` | Only `0 ≤ H s` remains as a profile field |
| Continued seed bound | `‖c2OddTailContinuedBalancingSeed coreCutoff K M s‖ * tiltScale s ≤ tiltConstant s` | Closed under profile | `exactResidualTiltConstant`; `UnitHalfExactProfileLocalData.toExactEstimates` | Keep this exact-residual budget unless dominance fails |
| Horizontal layer budget | layer bound for `c2ConcreteOddHorizontalLayerDefect` | Closed for constant horizontal cutoff | `UnitHalfExactProfileLocalData.ofConstantCoreCutoff` | Use `coreCutoff := fun _ => N` |
| Continued cutoff bound | `‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s‖ * cutoffScale s ≤ cutoffConstant s` | Closed under profile | `exactResidualCutoffConstant`; `UnitHalfExactProfileLocalData.toExactEstimates` | No separate cutoff envelope needed for this profile |
| Quartet dominance | `quartet_dominance` field | Reduced | `LeanC2/AuditContinuedQuartetDominance.lean` | Prove a sharper-than-triangle residual inequality on the constant-cutoff middle region |

## Secondary Historical Closure Package

| Item | Status | Evidence | Next action |
| --- | --- | --- | --- |
| Audit surface for the route | Closed | `LeanC2/AuditAdjustedQuartetRoute.lean` | Keep as source of truth |
| Package to construct | Open | `AdjustedQuartetAudit.ClosureInputs` | Fill fields below |
| Off-critical nonvanishing from package | Conditional | `ClosureInputs.offCriticalNonvanishing` | Wait for package |
| RH from package | Conditional | `ClosureInputs.riemannHypothesis` | Wait for package |

## ClosureInputs Fields

| Field | Lean target | Status | Current evidence | Next action |
| --- | --- | --- | --- | --- |
| Continuation | `GenuineFInfiniteContinuationData` | Bypassed on primary route / Reduced on secondary route | `ContinuedQuartetAudit.nearAxisData`; `genuineContinuationData_of_analyticOnNhd_punctured` | Prefer primary route; secondary still needs analytic continuation of `genuineFInfinite` |
| Comparison | `C2OddTailBalancingSeedBulkModelComparisonFromOneLtData coreCutoff K M` | Open | Residual-zero theorem uses this input | Prove analytic comparison or construct from at-one data |
| Pointwise bounds on middle | `∀ s ∈ middleRegion, PointwiseBounds ... s` | Open | Structure isolated in audit file | Close subfields below |

## Secondary Continuation Sub-Obligations

| Item | Status | Evidence | Meaning |
| --- | --- | --- | --- |
| Continued central channel continuation | Closed | `continuedCentralOddChannelContinuationData` | The continued channel already carries the right identity |
| Equality bridge to `genuineFInfinite` | Conditional | `genuineContinuationData_of_eqOnOpenRightHalfPlane` | Needs equality on the whole open right half-plane |
| Punctured analytic reduction | Conditional | `genuineContinuationData_of_analyticOnNhd_punctured` | Needs analyticity of `genuineFInfinite` on the punctured half-plane plus equality at `s = 1` |
| `genuineFInfinite` analytic on punctured half-plane | Open | No non-circular inhabitant found | Avoid unless secondary route becomes necessary |
| Equality at `s = 1` | Open | `riemannZeta_one` is nontrivial in mathlib | Do not assume this is definitional |

## PointwiseBounds Subfields

| Subfield | Lean target | Status | Suggested route |
| --- | --- | --- | --- |
| Scale signs | `C2ExpandedScalarScaleData ... s` | Open | Choose positive scales and nonnegative constants |
| Horizontal budget | `C2ExpandedHorizontalLayerBudget coreCutoff ... s` | Open | Prove odd-truncation envelope, then use `C2ExpandedOddTruncationBudget.toHorizontalLayerBudget` |
| Seed bound | `‖c2OddTailBalancingSeed coreCutoff K M s‖ ≤ tiltConstant s / tiltScale s` | Open | Use existing seed bound lemmas, but keep constants small enough for dominance |
| Cutoff bound | `‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤ cutoffConstant s` | Open | Use cutoff-from-target or central-defect bounds |
| Adjusted quartet dominance | `main - defect - tail > 0` | Open | Main mathematical target; validate only after the previous bounds are chosen |

## Already Verified Guardrails

| Item                                              | Status      | Evidence                                                         | Meaning                                                                               |
| ------------------------------------------------- | ----------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| Empty edge branch exists                          | Closed      | `AdjustedQuartetAudit.emptyEdgeData`                             | The audited route does not require a separate edge certificate                        |
| Exact-comparison residual vanishes                | Conditional | `ClosureInputs.residual_eq_zero`                                 | Once `comparison` is supplied, the finite-model residual is zero on the middle region |
| Canonical closed-scaled local package cannot work | Ruled out   | `AdjustedQuartetAudit.canonicalClosedScaledLocalData_impossible` | Do not confuse this route with a valid closure                                        |
| `offCriticalStrip` excludes `1 < Re(s)`           | Closed      | `false_of_one_lt_re_offCritical`                                 | Any route requiring both `1 < Re(s)` and `offCriticalStrip s` is empty                |

## Work Protocol

1. Work in small audit modules, not directly inside the large source file unless
   a reusable theorem must be added there.
2. For each obligation, create a named theorem or structure constructor with the
   exact target used by the active audit package.
3. Run `lake build LeanC2.AuditContinuedQuartetDominance
   LeanC2.AuditContinuedQuartetHorizontal
   LeanC2.AuditContinuedQuartetProfile LeanC2.AuditContinuedQuartetRoute
   LeanC2.AuditContinuationObligations LeanC2.AuditAdjustedQuartetRoute` after
   every meaningful change.
4. Update this checklist immediately after a Lean proof compiles or a route is
   ruled out.
5. Keep failed routes documented only if they prevent future confusion.

## Immediate Next Tasks

- [x] Decide whether to attack `Continuation` or `Comparison` first.
      Decision: use the continuation-free continued quartet route first.
- [x] Create a small audit file for continuation/comparison candidates.
- [x] Create a continuation-free continued quartet audit file.
- [x] Choose a provisional bound profile for the continued quartet middle fields.
      Decision: unit scales, horizontal ratio `1 / 2`, exact continued residual
      tilt/cutoff constants, and an explicit horizontal envelope `H`.
- [x] Encode the profile in Lean and close the mechanical fields.
- [x] Choose the active horizontal envelope `H`.
      Decision: use `weightedHorizontalEnvelope coreCutoff`.
- [x] Reduce C2-weighted odd-truncation summability to a uniform truncation
      bound.
- [x] Reduce the uniform truncation bound to a uniform finite odd-core bound
      along the chosen cutoff schedule.
- [x] Close the finite-core bound for the constant horizontal cutoff route.
      Decision: use `coreCutoff := fun _ => N` unless dominance testing forces
      a different schedule.
- [x] Create the dominance audit surface and reduce the package to a closed
      residual inequality.
- [x] Split the continued vertical residual into the continued vertical anchor
      and finite cutoff errors.
- [x] Isolate the scaled continued-anchor floor as a necessary dominance
      condition.
- [x] Prove the zeta-zero obstruction for the scaled anchor floor:
      `not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero`.
- [x] Reduce the continued-channel positive anchor margin to the normalized
      factor target:
      `continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance`.
- [ ] Rebuild the middle-region anchor-factor estimate with a zeta-free genuine
      channel/operator, not `continuedOddDirichletChannel`.
- [ ] Prove the zeta-free genuine middle-region anchor-factor estimate:
      `‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
       continuedAnchorFactorAllowance s`
      after replacing both sides by genuine-channel definitions.
- [ ] Prove the positive zeta-free middle-region anchor margin:
      `continuedVerticalAnchorScaledFloor s <
       c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s`.
- [ ] Prove
      `constantCoreStructuredResidualUpper N K M s <
       c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s`
      on the constant-cutoff middle region.
