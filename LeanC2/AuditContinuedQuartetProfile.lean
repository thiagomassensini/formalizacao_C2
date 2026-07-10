import LeanC2.AuditContinuedQuartetRoute

/-!
# Continued quartet middle profile

This module fixes the current audit profile for the continued quartet middle
route.  The profile uses unit tilt/cutoff/horizontal scales, horizontal ratio
`1 / 2`, the exact continued vertical residual in the tilt budget, and the
exact continued cutoff residual in the cutoff budget.

The horizontal envelope is intentionally left as an explicit function `H`: the
statement that `H` dominates every horizontal layer is a real analytic
obligation, not a mechanical scale choice.
-/

namespace C2
namespace ContinuedQuartetAudit

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

/--
The remaining pointwise middle obligations after the unit/half exact-residual
profile has been chosen.
-/
structure UnitHalfExactProfileLocalData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) (H : ℂ → ℝ) (s : ℂ) : Prop where
  offCritical : offCriticalStrip s
  horizontalConstant_nonneg : 0 ≤ H s
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      H s * (1 / 2 : ℝ) ^ j
  quartet_dominance :
    c2QuartetBulkGUpper
        (c2BulkGUpper
          (c2TiltAnalyticRegularizedUpper
            (exactResidualTiltConstant K M H) unitScale)
          (c2HorizontalRegularizedUpper H unitScale halfHorizontalRatio)) s +
      c2BulkEUpper
        (c2CutoffUpperFromScale
          (exactResidualCutoffConstant K M) unitScale) s <
        c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

theorem UnitHalfExactProfileLocalData.toExactEstimates
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {H : ℂ → ℝ} {s : ℂ}
    (data : UnitHalfExactProfileLocalData coreCutoff K M H s) :
    C2OddTailContinuedBalancingSeedBulkQuartetExactEstimates
      coreCutoff K M
      (exactResidualTiltConstant K M H) unitScale
      H unitScale halfHorizontalRatio
      (exactResidualCutoffConstant K M) unitScale s := by
  refine {
    offCritical := data.offCritical
    tiltScale_pos := by norm_num [unitScale]
    tiltConstant_nonneg := ?_
    horizontalScale_pos := by norm_num [unitScale]
    horizontalConstant_nonneg := data.horizontalConstant_nonneg
    horizontalRatio_nonneg := by norm_num [halfHorizontalRatio]
    horizontalRatio_lt_one := by norm_num [halfHorizontalRatio]
    horizontalLayer_bound := ?_
    balancing_seed_factor_scaled_bound := ?_
    cutoffScale_pos := by norm_num [unitScale]
    cutoff_exact_scaled_bound := ?_
    quartet_dominance := data.quartet_dominance
  }
  · have hvertical :
        0 ≤ c2ContinuedVerticalResidualExactUpper K M s := by
      unfold c2ContinuedVerticalResidualExactUpper
      exact norm_nonneg _
    have hhorizontal :
        0 ≤ c2HorizontalRegularizedUpper H unitScale halfHorizontalRatio s :=
      c2HorizontalRegularizedUpper_nonneg_of_pos
        (by norm_num [unitScale])
        data.horizontalConstant_nonneg
        (by norm_num [halfHorizontalRatio])
    have hgap : 0 ≤ 1 + ‖q s‖ :=
      add_nonneg zero_le_one (norm_nonneg _)
    unfold exactResidualTiltConstant
    exact mul_nonneg (add_nonneg hvertical hhorizontal) hgap
  · intro j
    simpa [unitScale, halfHorizontalRatio] using data.horizontalLayer_bound j
  · unfold C2BalancingSeedFactorScaledBound exactResidualTiltConstant unitScale
    simp
  · simp [exactResidualCutoffConstant, unitScale]

theorem UnitHalfExactProfileLocalData.toConcreteEstimates
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {H : ℂ → ℝ} {s : ℂ}
    (data : UnitHalfExactProfileLocalData coreCutoff K M H s) :
    C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates
      coreCutoff K M
      (exactResidualTiltConstant K M H) unitScale
      H unitScale halfHorizontalRatio
      (exactResidualCutoffConstant K M) unitScale s := by
  have hsExact :
      s ∈ c2OddTailContinuedBalancingSeedBulkQuartetExactRegion
        coreCutoff K M
        (exactResidualTiltConstant K M H) unitScale
        H unitScale halfHorizontalRatio
        (exactResidualCutoffConstant K M) unitScale :=
    data.toExactEstimates
  simpa [c2OddTailContinuedBalancingSeedBulkQuartetConcreteRegion] using
    c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_exactRegion
      hsExact

theorem UnitHalfExactProfileLocalData.ofHorizontalLayerBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {H : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hH_nonneg : 0 ≤ H s)
    (hhorizontal :
      C2ExpandedHorizontalLayerBudget
        coreCutoff H unitScale halfHorizontalRatio s)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M H) unitScale)
            (c2HorizontalRegularizedUpper H unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData coreCutoff K M H s := by
  exact {
    offCritical := hoff
    horizontalConstant_nonneg := hH_nonneg
    horizontalLayer_bound := by
      intro j
      simpa [unitScale, halfHorizontalRatio] using
        hhorizontal.layer_bound j
    quartet_dominance := hdominance
  }

theorem UnitHalfExactProfileLocalData.ofOddTruncationBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddTruncationUpper : ℂ → ℕ → ℝ}
    {H : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hH_nonneg : 0 ≤ H s)
    (htruncation :
      C2ExpandedOddTruncationBudget
        coreCutoff oddTruncationUpper
        H unitScale halfHorizontalRatio s)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M H) unitScale)
            (c2HorizontalRegularizedUpper H unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData coreCutoff K M H s :=
  UnitHalfExactProfileLocalData.ofHorizontalLayerBudget
    hoff hH_nonneg htruncation.toHorizontalLayerBudget hdominance

/--
Middle-region input package for the chosen unit/half exact-residual profile.
-/
structure UnitHalfExactProfileMiddleInputs
    (coreCutoff : ℕ → ℕ) (K M : ℕ) (H : ℂ → ℝ) where
  middle : ∀ ⦃s : ℂ⦄,
    s ∈ middleRegion coreCutoff K M →
      UnitHalfExactProfileLocalData coreCutoff K M H s

def UnitHalfExactProfileMiddleInputs.toClosureInputs
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {H : ℂ → ℝ}
    (data : UnitHalfExactProfileMiddleInputs coreCutoff K M H) :
    ClosureInputs
      coreCutoff K M
      (exactResidualTiltConstant K M H) unitScale
      H unitScale halfHorizontalRatio
      (exactResidualCutoffConstant K M) unitScale where
  middle := fun {s} hs =>
    (data.middle (s := s) hs).toConcreteEstimates

/--
The chosen middle profile is sufficient for the continued route to prove the
official mathlib RH statement.
-/
theorem UnitHalfExactProfileMiddleInputs.riemannHypothesis
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {H : ℂ → ℝ}
    (data : UnitHalfExactProfileMiddleInputs coreCutoff K M H) :
    RiemannHypothesis :=
  data.toClosureInputs.riemannHypothesis

end ContinuedQuartetAudit
end C2
