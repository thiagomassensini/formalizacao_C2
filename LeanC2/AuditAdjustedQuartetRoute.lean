import LeanC2.Analytic.GenuineBulkConcrete

/-!
# Adjusted Quartet Route Audit

This module gives the current candidate route a technical audit surface.

Historical source names in `GenuineBulkConcrete.lean` use the informal
"AntiMiracle" label.  This file intentionally exposes the same route under the
more descriptive name "adjusted quartet no-cancellation": the proof isolates a
four-term vertical quartet, absorbs the remaining channels into explicit upper
bounds, and requires a strict pointwise margin.

Status encoded by this file:

* Verified in Lean: if the inputs below are supplied, the route proves
  off-critical nonvanishing and then `RiemannHypothesis`.
* Verified in Lean: with the exact comparison input, the finite-model residual
  used by this route is identically zero on the open right half-plane.
* External / still to be proved: an inhabitant of `ClosureInputs`, especially
  the pointwise no-cancellation inequality in `PointwiseBounds.dominance`.
* Ruled out for this audit: the older `canonicalClosedScaled` local certificate,
  since Lean proves it is impossible at every off-critical point.
-/

namespace C2
namespace AdjustedQuartetAudit

/-- Near-axis data generated from genuine continuation for the adjusted quartet route. -/
noncomputable abbrev nearAxisData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (continuation : GenuineFInfiniteContinuationData) :
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
    (coreCutoff := coreCutoff) (K := K) (M := M)
    continuation
    (GenuineFInfiniteNearAxisData.of_continuation continuation)

/-- The audited route currently uses the empty edge branch. -/
def emptyEdgeData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
    (coreCutoff := coreCutoff) (K := K) (M := M)

/-- Off-critical points not discharged by the near-axis branch or the edge branch. -/
noncomputable abbrev middleRegion
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (continuation : GenuineFInfiniteContinuationData) : Set ℂ :=
  c2ExpandedScalarMiddleRegion
    (nearAxisData coreCutoff K M continuation)
    (emptyEdgeData coreCutoff K M)

/--
Pointwise analytic estimates required at a single middle-region point.

The field `dominance` is the mathematical no-cancellation target: the adjusted
quartet main term must strictly dominate the explicit defect and tail budgets.
-/
structure PointwiseBounds
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ)
    (s : ℂ) : Prop where
  scale :
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal :
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  seed :
    ‖c2OddTailBalancingSeed coreCutoff K M s‖ ≤ tiltConstant s / tiltScale s
  cutoff :
    ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤ cutoffConstant s
  dominance :
    c2ConcreteAntiMiracleAdjustedMain
        (c2OddTailBalancingSeed coreCutoff K M) s -
      c2ConcreteAntiMiracleAdjustedDefect coreCutoff s -
      c2ConcreteAntiMiracleAdjustedTailScaledUpper
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale s > 0

/--
Complete input package for the adjusted quartet route.

Supplying this structure is exactly the remaining formal task for this route.
No zero-argument inhabitant of this structure has been found in the current
project audit.
-/
structure ClosureInputs
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ) where
  continuation : GenuineFInfiniteContinuationData
  comparison : C2OddTailBalancingSeedBulkModelComparisonFromOneLtData coreCutoff K M
  pointwise : ∀ ⦃s : ℂ⦄,
    s ∈ middleRegion coreCutoff K M continuation →
      PointwiseBounds
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale s

/--
The exact-comparison input kills the finite-model residual on the audited middle
region.  This is why the remaining route is a no-cancellation inequality, not a
separate residual-estimation problem.
-/
theorem ClosureInputs.residual_eq_zero
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (data : ClosureInputs
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale)
    {s : ℂ}
    (hs : s ∈ middleRegion coreCutoff K M data.continuation) :
    c2ConcreteAntiMiracleResidual
        (c2OddTailBalancingSeed coreCutoff K M) coreCutoff K M s = 0 := by
  have hsOpen : s ∈ openRightHalfPlane := by
    simpa [openRightHalfPlane] using hs.1.1
  exact
    c2ConcreteAntiMiracleResidual_eq_zero_of_oddTailBalancingSeed_of_comparison
      data.comparison hsOpen

/-- The audited input package proves off-critical nonvanishing. -/
theorem ClosureInputs.offCriticalNonvanishing
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (data : ClosureInputs
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) := by
  exact
    offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle
      (coreCutoff := coreCutoff) (K := K) (M := M)
      data.continuation data.comparison
      (fun {s} hs => (data.pointwise hs).scale)
      (fun {s} hs => (data.pointwise hs).horizontal)
      (fun {s} hs => (data.pointwise hs).seed)
      (fun {s} hs => (data.pointwise hs).cutoff)
      (fun {s} hs => (data.pointwise hs).dominance)

/-- The audited input package proves the official mathlib RH statement. -/
theorem ClosureInputs.riemannHypothesis
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (data : ClosureInputs
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    RiemannHypothesis := by
  exact
    mathlibRiemannHypothesis_of_continuationAndOddTailBalancingAntiMiracleMiddle
      (coreCutoff := coreCutoff) (K := K) (M := M)
      data.continuation data.comparison
      (fun {s} hs => (data.pointwise hs).scale)
      (fun {s} hs => (data.pointwise hs).horizontal)
      (fun {s} hs => (data.pointwise hs).seed)
      (fun {s} hs => (data.pointwise hs).cutoff)
      (fun {s} hs => (data.pointwise hs).dominance)

/--
Audit guardrail: the older canonical-closed-scaled pointwise certificate is not
a valid candidate for this route, because Lean proves it is impossible at every
off-critical point.
-/
theorem canonicalClosedScaledLocalData_impossible
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hs : offCriticalStrip s) :
    ¬ C2CanonicalClosedScaledLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s :=
  not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip hs

end AdjustedQuartetAudit
end C2
