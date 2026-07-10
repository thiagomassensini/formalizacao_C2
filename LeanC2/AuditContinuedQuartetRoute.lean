import LeanC2.Analytic.GenuineBulkConcrete

/-!
# Continued quartet route audit

This module records a continuation-free audit surface for the continued C2 bulk
model.  It avoids the historical `GenuineFInfiniteContinuationData` input by
working directly with `c2OddTailContinuedBalancingSeedBulkModel`, whose
fundamental identity on the right half-plane is already proved in
`GenuineBulkConcrete.lean`.

The remaining mathematical work is the middle-region quartet estimate, encoded
as `ClosureInputs.middle`.
-/

namespace C2
namespace ContinuedQuartetAudit

open scoped Topology

/-- The continued bulk model is analytic on the punctured open right half-plane. -/
theorem analyticOnNhd_punctured
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    AnalyticOnNhd ℂ
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M)
      puncturedOpenRightHalfPlane := by
  refine
    continuedCentralOddChannel_analyticOnNhd_punctured.congr
      puncturedOpenRightHalfPlane_isOpen ?_
  intro s hs
  symm
  simpa [c2OddTailContinuedBalancingSeedBulkModel] using
    c2OddTailContinuedBalancingSeedBulkModel_eq_continuedCentral_of_re_pos
      coreCutoff K M (s := s) hs.1

/-- The continued bulk model is nonzero at `s = 2`. -/
theorem nonzero_at_two
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M (2 : ℂ) ≠ 0 := by
  have hPos : 0 < ((2 : ℂ).re) := by norm_num
  rw [c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity
    coreCutoff K M (2 : ℂ) hPos]
  exact mul_ne_zero
    (c0_ne_zero_of_re_pos hPos)
    (riemannZeta_ne_zero_of_one_lt_re (by norm_num))

/--
The continued bulk model is not locally identically zero around any critical
zero of zeta.
-/
theorem not_eventually_zero_at_critical
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    {ρ : ℂ} (hρ : IsCriticalZero riemannZeta ρ) :
    ¬ ∀ᶠ z in 𝓝 ρ,
      c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M z = 0 := by
  intro hZero
  have hEqZero : Set.EqOn
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M)
      0 puncturedOpenRightHalfPlane :=
    (analyticOnNhd_punctured coreCutoff K M).eqOn_zero_of_preconnected_of_eventuallyEq_zero
      puncturedOpenRightHalfPlane_isPreconnected
      hρ.mem_puncturedOpenRightHalfPlane
      hZero
  have hTwoMem : (2 : ℂ) ∈ puncturedOpenRightHalfPlane := by
    constructor <;> norm_num
  exact nonzero_at_two coreCutoff K M (hEqZero hTwoMem)

/-- Local punctured-neighborhood nonvanishing around each critical zero. -/
theorem eventually_ne_zero_at_critical
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    {ρ : ℂ} (hρ : IsCriticalZero riemannZeta ρ) :
    ∀ᶠ z in 𝓝[≠] ρ,
      c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M z ≠ 0 := by
  let hAnalytic :=
    analyticOnNhd_punctured coreCutoff K M
      ρ hρ.mem_puncturedOpenRightHalfPlane
  exact hAnalytic.eventually_eq_zero_or_eventually_ne_zero.resolve_left
    (not_eventually_zero_at_critical coreCutoff K M hρ)

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

/--
Complete input package for the continuation-free continued quartet route.

Supplying `middle` is now the main remaining obligation: every off-critical
middle point must satisfy the concrete continued quartet estimates.
-/
structure ClosureInputs
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ) where
  middle : ∀ ⦃s : ℂ⦄,
    s ∈ middleRegion coreCutoff K M →
      C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale s

/-- The continued quartet closure package proves the official mathlib RH statement. -/
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
    mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_quartetConcreteCover
      (coreCutoff := coreCutoff) (K := K) (M := M)
      (nearAxisData coreCutoff K M)
      (emptyEdgeData coreCutoff K M)
      (c2ExpandedScalarMiddleRegion_cover
        (nearAxisData coreCutoff K M)
        (emptyEdgeData coreCutoff K M)
        (fun {s} hs => data.middle hs))

end ContinuedQuartetAudit
end C2
