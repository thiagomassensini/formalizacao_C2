import LeanC2.AuditAdjustedQuartetProjectedJ0BoundedLedger

/-!
# Parallel-upper interface for the projected-j0 ledger

This audit file prepares the next formal bound for the projected `j0` route:
upper bounds for the destructive parallel cost of the dominant horizontal
layer.  It does not prove a concrete analytic upper bound.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

open AdjustedQuartetHorizontalProjection

/--
Division-free numerator for the destructive projected part of `D` against `M`.

Future interval or sector certificates can bound this numerator first, then
convert to a bound for `destructiveParallel M D`.
-/
noncomputable def destructiveNumerator (M D : ℂ) : ℝ :=
  max 0 (-(D * starRingEnd ℂ M).re)

theorem destructiveParallel_eq_destructiveNumerator_div_norm
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D =
      destructiveNumerator M D / ‖M‖ := by
  have hMpos : 0 < ‖M‖ := norm_pos_iff.mpr hM
  let a : ℝ := (D * starRingEnd ℂ M).re
  unfold destructiveParallel parallelCoord destructiveNumerator
  change max 0 (-(a / ‖M‖)) = max 0 (-a) / ‖M‖
  have hneg_div : -(a / ‖M‖) = (-a) / ‖M‖ := by ring
  rw [hneg_div]
  by_cases ha : 0 ≤ -a
  · have hdiv_nonneg : 0 ≤ (-a) / ‖M‖ :=
      div_nonneg ha hMpos.le
    rw [max_eq_right hdiv_nonneg, max_eq_right ha]
  · have ha_nonpos : -a ≤ 0 := le_of_lt (lt_of_not_ge ha)
    have hdiv_nonpos : (-a) / ‖M‖ ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg ha_nonpos hMpos.le
    rw [max_eq_left hdiv_nonpos, max_eq_left ha_nonpos]
    simp

theorem destructiveParallel_le_of_destructiveNumerator_le
    (M D : ℂ) (U : ℝ) (hM : M ≠ 0)
    (hU : destructiveNumerator M D ≤ U * ‖M‖)
    (_hUnonneg : 0 ≤ U) :
    destructiveParallel M D ≤ U := by
  have hMpos : 0 < ‖M‖ := norm_pos_iff.mpr hM
  rw [destructiveParallel_eq_destructiveNumerator_div_norm M D hM]
  exact (div_le_iff₀ hMpos).mpr hU

theorem destructiveNumerator_le_norm_mul_norm
    (M D : ℂ) :
    destructiveNumerator M D ≤ ‖D‖ * ‖M‖ := by
  let z : ℂ := D * starRingEnd ℂ M
  have h0 : 0 ≤ ‖D‖ * ‖M‖ :=
    mul_nonneg (norm_nonneg D) (norm_nonneg M)
  have hre_abs : -z.re ≤ |z.re| := by
    simpa [abs_neg] using le_abs_self (-z.re)
  have hre_norm : |z.re| ≤ ‖z‖ :=
    Complex.abs_re_le_norm z
  have hz_norm : ‖z‖ = ‖D‖ * ‖M‖ := by
    simp [z]
  have hre : -z.re ≤ ‖D‖ * ‖M‖ := by
    calc
      -z.re ≤ |z.re| := hre_abs
      _ ≤ ‖z‖ := hre_norm
      _ = ‖D‖ * ‖M‖ := hz_norm
  unfold destructiveNumerator
  change max 0 (-z.re) ≤ ‖D‖ * ‖M‖
  exact max_le h0 hre

theorem destructiveParallel_le_norm
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D ≤ ‖D‖ := by
  exact destructiveParallel_le_of_destructiveNumerator_le
    (M := M) (D := D) (U := ‖D‖) hM
    (destructiveNumerator_le_norm_mul_norm M D)
    (norm_nonneg D)

theorem adjustedProjectedJ0_parallelCost_le_D0_norm
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0) :
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤
      ‖adjustedProjectedJ0_D0 coreCutoff s‖ := by
  unfold adjustedProjectedJ0_parallelCost
  exact destructiveParallel_le_norm
    (adjustedProjectedJ0_M tiltSeed s)
    (adjustedProjectedJ0_D0 coreCutoff s)
    hM

/-- Regional data giving an upper bound for the projected `j0` cost. -/
structure ProjectedJ0ParallelUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper : ℂ → ℝ) (Region : Set ℂ) where
  main_ne_zero :
    ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0
  upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s

/--
Regional numerator data.  This is the intended input shape for future
phase/sector certificates: first bound the numerator, then convert it to the
parallel-upper currency.
-/
structure ProjectedJ0ParallelNumeratorUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper parallelUpper : ℂ → ℝ) (Region : Set ℂ) where
  main_ne_zero :
    ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0
  numerator_upper :
    ∀ s ∈ Region,
      destructiveNumerator
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
      ≤ numeratorUpper s
  convert :
    ∀ s ∈ Region,
      numeratorUpper s ≤ parallelUpper s * ‖adjustedProjectedJ0_M tiltSeed s‖
  parallel_nonneg :
    ∀ s ∈ Region, 0 ≤ parallelUpper s

theorem ProjectedJ0ParallelNumeratorUpperData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper parallelUpper : ℂ → ℝ} {Region : Set ℂ}
    (data :
      ProjectedJ0ParallelNumeratorUpperData
        tiltSeed coreCutoff numeratorUpper parallelUpper Region) :
    ProjectedJ0ParallelUpperData tiltSeed coreCutoff parallelUpper Region := by
  refine
    { main_ne_zero := data.main_ne_zero
      upper := ?_ }
  intro s hs
  unfold adjustedProjectedJ0_parallelCost
  exact destructiveParallel_le_of_destructiveNumerator_le
    (M := adjustedProjectedJ0_M tiltSeed s)
    (D := adjustedProjectedJ0_D0 coreCutoff s)
    (U := parallelUpper s)
    (data.main_ne_zero s hs)
    (le_trans (data.numerator_upper s hs) (data.convert s hs))
    (data.parallel_nonneg s hs)

/--
Combined bounded data for the finite model: a parallel-upper certificate,
an abstract rest-upper certificate, and the bounded-surplus budget.
-/
structure AdjustedProjectedJ0FiniteBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0ParallelUpperData tiltSeed coreCutoff parallelUpper Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedFiniteSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s

theorem AdjustedProjectedJ0FiniteBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {parallelUpper restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteBoundedData
        Region tiltSeed coreCutoff K M parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSurplus
    tiltSeed coreCutoff K M parallelUpper restUpper
    (by
      intro s hs
      exact ⟨data.parallel.upper s hs, data.rest s hs, data.budget s hs⟩)

/--
Combined bounded data for the adjusted quartet without the finite tail.  This
is the same interface as the finite model, with the quartet rest cost.
-/
structure AdjustedProjectedJ0QuartetBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0ParallelUpperData tiltSeed coreCutoff parallelUpper Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedQuartetSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s

theorem AdjustedProjectedJ0QuartetBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {parallelUpper restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0QuartetBoundedData
        Region tiltSeed coreCutoff parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSurplus
    tiltSeed coreCutoff parallelUpper restUpper
    (by
      intro s hs
      exact ⟨data.parallel.upper s hs, data.rest s hs, data.budget s hs⟩)

end AdjustedQuartetProjectedJ0Aliases
end C2
