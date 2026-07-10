import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper

/-!
# Angular ratio for the projected-j0 ledger

This file factors the destructive parallel cost into the main norm times an
angular/sector quantity `max 0 (-Re (D / M))`.  It does not prove a concrete
upper bound for that angular quantity.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

open AdjustedQuartetHorizontalProjection

/-- Destructive angular ratio of `D` relative to a nonzero main vector `M`. -/
noncomputable def destructiveRatio (M D : ℂ) : ℝ :=
  max 0 (-((D / M).re))

/-- Division-free equivalent angular ratio. -/
noncomputable def destructiveRatioAlt (M D : ℂ) : ℝ :=
  destructiveNumerator M D / (‖M‖ ^ 2)

theorem div_re_eq_mul_conj_re_div_norm_sq (M D : ℂ) :
    (D / M).re = (D * starRingEnd ℂ M).re / (‖M‖ ^ 2) := by
  rw [Complex.div_re, Complex.normSq_eq_norm_sq]
  simp
  ring

theorem destructiveParallel_eq_norm_mul_destructiveRatio
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D =
      ‖M‖ * destructiveRatio M D := by
  have hMpos : 0 < ‖M‖ := norm_pos_iff.mpr hM
  let a : ℝ := (D * starRingEnd ℂ M).re
  have hratio_re : (D / M).re = a / (‖M‖ ^ 2) := by
    simpa [a] using div_re_eq_mul_conj_re_div_norm_sq M D
  rw [destructiveParallel_eq_destructiveNumerator_div_norm M D hM]
  unfold destructiveNumerator destructiveRatio
  rw [hratio_re]
  change max 0 (-a) / ‖M‖ = ‖M‖ * max 0 (-(a / ‖M‖ ^ 2))
  have hsqpos : 0 < ‖M‖ ^ 2 := sq_pos_of_pos hMpos
  have hneg_div : -(a / ‖M‖ ^ 2) = (-a) / ‖M‖ ^ 2 := by ring
  rw [hneg_div]
  by_cases ha : 0 ≤ -a
  · have hdiv_nonneg : 0 ≤ (-a) / ‖M‖ ^ 2 :=
      div_nonneg ha hsqpos.le
    rw [max_eq_right ha, max_eq_right hdiv_nonneg]
    field_simp [hMpos.ne', hsqpos.ne']
  · have ha_nonpos : -a ≤ 0 := le_of_lt (lt_of_not_ge ha)
    have hdiv_nonpos : (-a) / ‖M‖ ^ 2 ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg ha_nonpos hsqpos.le
    rw [max_eq_left ha_nonpos, max_eq_left hdiv_nonpos]
    ring

theorem destructiveParallel_eq_norm_mul_destructiveRatioAlt
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D =
      ‖M‖ * destructiveRatioAlt M D := by
  have hMpos : 0 < ‖M‖ := norm_pos_iff.mpr hM
  rw [destructiveParallel_eq_destructiveNumerator_div_norm M D hM]
  unfold destructiveRatioAlt
  field_simp [hMpos.ne']

/-- Ratio `D0 / M` for the adjusted projected-j0 ledger. -/
noncomputable def adjustedProjectedJ0_D0OverM
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  adjustedProjectedJ0_D0 coreCutoff s /
    adjustedProjectedJ0_M tiltSeed s

/-- Destructive angular ratio of the dominant `D0` layer. -/
noncomputable def adjustedProjectedJ0_D0DestructiveRatio
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  max 0 (-(adjustedProjectedJ0_D0OverM tiltSeed coreCutoff s).re)

theorem adjustedProjectedJ0_D0DestructiveRatio_eq_destructiveRatio
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0DestructiveRatio tiltSeed coreCutoff s =
      destructiveRatio
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s) := by
  rfl

theorem adjustedProjectedJ0_parallelCost_eq_main_mul_destructiveRatio
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0) :
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s =
      ‖adjustedProjectedJ0_M tiltSeed s‖ *
        adjustedProjectedJ0_D0DestructiveRatio tiltSeed coreCutoff s := by
  unfold adjustedProjectedJ0_parallelCost
  rw [adjustedProjectedJ0_D0DestructiveRatio_eq_destructiveRatio]
  exact destructiveParallel_eq_norm_mul_destructiveRatio
    (adjustedProjectedJ0_M tiltSeed s)
    (adjustedProjectedJ0_D0 coreCutoff s)
    hM

/-- Parallel upper induced by an angular upper `lambda`. -/
noncomputable def adjustedProjectedJ0_parallelUpperFromAngularRatio
    (tiltSeed : ℂ → ℂ) (lambda : ℂ → ℝ) : ℂ → ℝ :=
  fun s => lambda s * adjustedProjectedJ0_mainExactLower tiltSeed s

/-- Regional angular upper data for the dominant `D0 / M` ratio. -/
structure ProjectedJ0AngularUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (lambda : ℂ → ℝ) (Region : Set ℂ) where
  main_ne_zero :
    ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0
  lambda_nonneg :
    ∀ s ∈ Region, 0 ≤ lambda s
  ratio_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0DestructiveRatio tiltSeed coreCutoff s ≤ lambda s

theorem ProjectedJ0AngularUpperData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {lambda : ℂ → ℝ} {Region : Set ℂ}
    (data : ProjectedJ0AngularUpperData tiltSeed coreCutoff lambda Region) :
    ProjectedJ0ParallelUpperData
      tiltSeed coreCutoff
      (adjustedProjectedJ0_parallelUpperFromAngularRatio tiltSeed lambda)
      Region := by
  refine
    { main_ne_zero := data.main_ne_zero
      upper := ?_ }
  intro s hs
  rw [adjustedProjectedJ0_parallelCost_eq_main_mul_destructiveRatio
    tiltSeed coreCutoff s (data.main_ne_zero s hs)]
  unfold adjustedProjectedJ0_parallelUpperFromAngularRatio
  rw [adjustedProjectedJ0_mainExactLower_eq_norm]
  rw [mul_comm (lambda s) ‖adjustedProjectedJ0_M tiltSeed s‖]
  exact mul_le_mul_of_nonneg_left
    (data.ratio_upper s hs)
    (norm_nonneg (adjustedProjectedJ0_M tiltSeed s))

/--
Finite-model bounded data in angular form.  The budget reads
`mainExactLower - lambda * mainExactLower - restUpper > 0`.
-/
structure AdjustedProjectedJ0FiniteAngularBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (lambda restUpper : ℂ → ℝ) where
  angular :
    ProjectedJ0AngularUpperData tiltSeed coreCutoff lambda Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 <
        adjustedProjectedJ0_mainExactLower tiltSeed s -
          (lambda s * adjustedProjectedJ0_mainExactLower tiltSeed s) -
          restUpper s

theorem AdjustedProjectedJ0FiniteAngularBoundedData.toFiniteBoundedData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {lambda restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteAngularBoundedData
        Region tiltSeed coreCutoff K M lambda restUpper) :
    AdjustedProjectedJ0FiniteBoundedData
      Region tiltSeed coreCutoff K M
      (adjustedProjectedJ0_parallelUpperFromAngularRatio tiltSeed lambda)
      restUpper := by
  refine
    { parallel := data.angular.toParallelUpperData
      rest := data.rest
      budget := ?_ }
  intro s hs
  unfold adjustedProjectedJ0_projectedFiniteSurplusLower
    adjustedProjectedJ0_parallelUpperFromAngularRatio
  exact data.budget s hs

theorem AdjustedProjectedJ0FiniteAngularBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {lambda restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteAngularBoundedData
        Region tiltSeed coreCutoff K M lambda restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact data.toFiniteBoundedData.total_ne_zero

theorem adjustedProjectedJ0_D0OverM_eq_expanded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0OverM tiltSeed coreCutoff s =
      ((2 : ℂ) * c2ConcreteAntiMiracleAdjustedRatio s ^ 2 *
        (rectangularOddCoreSum s (coreCutoff 0) - oddDirichletChannel s)) /
        (c2ConcreteAntiMiracleAdjustedAmplitude tiltSeed s *
          verticalQuartetPrefix (c2ConcreteAntiMiracleAdjustedRatio s)) := by
  unfold adjustedProjectedJ0_D0OverM adjustedProjectedJ0_M
  rw [adjustedProjectedJ0_D0_eq_expanded]

theorem adjustedProjectedJ0_D0DestructiveRatio_eq_expanded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0DestructiveRatio tiltSeed coreCutoff s =
      max 0
        (-(((2 : ℂ) * c2ConcreteAntiMiracleAdjustedRatio s ^ 2 *
          (rectangularOddCoreSum s (coreCutoff 0) - oddDirichletChannel s)) /
          (c2ConcreteAntiMiracleAdjustedAmplitude tiltSeed s *
            verticalQuartetPrefix (c2ConcreteAntiMiracleAdjustedRatio s))).re) := by
  unfold adjustedProjectedJ0_D0DestructiveRatio
  rw [adjustedProjectedJ0_D0OverM_eq_expanded]

end AdjustedQuartetProjectedJ0Aliases
end C2
