import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper

/-!
# Ratio upper for the projected-j0 ledger

This audit file turns a destructive numerator upper and a positive lower bound
for the seeded main norm into a `parallelUpper`.  It does not build the
interval or geometric certificates that provide those two inputs.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Parallel upper obtained by dividing a numerator upper by a main-norm lower. -/
noncomputable def adjustedProjectedJ0_parallelUpperFromNumeratorLower
    (numeratorUpper mainNormLower : ℂ → ℝ) : ℂ → ℝ :=
  fun s => numeratorUpper s / mainNormLower s

theorem ratio_mul_le_of_nonneg_of_pos_of_le
    {a b c : ℝ}
    (ha : 0 ≤ a) (hb : 0 < b) (hbc : b ≤ c) :
    a ≤ (a / b) * c := by
  have hdiv_nonneg : 0 ≤ a / b := div_nonneg ha hb.le
  have hcancel : a = (a / b) * b := by
    field_simp [hb.ne']
  calc
    a = (a / b) * b := hcancel
    _ ≤ (a / b) * c := mul_le_mul_of_nonneg_left hbc hdiv_nonneg

theorem div_nonneg_of_nonneg_of_pos
    {a b : ℝ} (ha : 0 ≤ a) (hb : 0 < b) :
    0 ≤ a / b :=
  div_nonneg ha hb.le

/--
Regional data giving a numerator upper and a positive main-norm lower.  The
ratio of these two functions is the resulting `parallelUpper`.
-/
structure ProjectedJ0D0RatioUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper mainNormLower : ℂ → ℝ)
    (Region : Set ℂ) where
  main_lower_pos :
    ∀ s ∈ Region, 0 < mainNormLower s
  main_lower :
    ∀ s ∈ Region,
      mainNormLower s ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  numerator_nonneg :
    ∀ s ∈ Region, 0 ≤ numeratorUpper s
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper s

theorem ProjectedJ0D0RatioUpperData.toNegReUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper mainNormLower : ℂ → ℝ}
    {Region : Set ℂ}
    (data : ProjectedJ0D0RatioUpperData
      tiltSeed coreCutoff numeratorUpper mainNormLower Region) :
    ProjectedJ0D0NegReUpperData
      tiltSeed coreCutoff numeratorUpper
      (adjustedProjectedJ0_parallelUpperFromNumeratorLower
        numeratorUpper mainNormLower)
      Region := by
  refine
    { main_ne_zero := ?_
      numerator_nonneg := data.numerator_nonneg
      neg_re_upper := data.neg_re_upper
      convert := ?_
      parallel_nonneg := ?_ }
  · intro s hs
    have hnorm_pos : 0 < ‖adjustedProjectedJ0_M tiltSeed s‖ :=
      lt_of_lt_of_le (data.main_lower_pos s hs) (data.main_lower s hs)
    exact norm_pos_iff.mp hnorm_pos
  · intro s hs
    unfold adjustedProjectedJ0_parallelUpperFromNumeratorLower
    exact ratio_mul_le_of_nonneg_of_pos_of_le
      (data.numerator_nonneg s hs)
      (data.main_lower_pos s hs)
      (data.main_lower s hs)
  · intro s hs
    unfold adjustedProjectedJ0_parallelUpperFromNumeratorLower
    exact div_nonneg_of_nonneg_of_pos
      (data.numerator_nonneg s hs)
      (data.main_lower_pos s hs)

theorem ProjectedJ0D0RatioUpperData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper mainNormLower : ℂ → ℝ}
    {Region : Set ℂ}
    (data : ProjectedJ0D0RatioUpperData
      tiltSeed coreCutoff numeratorUpper mainNormLower Region) :
    ProjectedJ0ParallelUpperData
      tiltSeed coreCutoff
      (adjustedProjectedJ0_parallelUpperFromNumeratorLower
        numeratorUpper mainNormLower)
      Region := by
  exact data.toNegReUpperData.toParallelUpperData

/--
Finite-model bounded data using the ratio upper for the dominant `D0` layer,
with the rest bound kept abstract.
-/
structure AdjustedProjectedJ0FiniteRatioBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (numeratorUpper mainNormLower restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0D0RatioUpperData
      tiltSeed coreCutoff numeratorUpper mainNormLower Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedFiniteSurplusLower
        tiltSeed coreCutoff K M
        (adjustedProjectedJ0_parallelUpperFromNumeratorLower
          numeratorUpper mainNormLower)
        restUpper
        s

theorem AdjustedProjectedJ0FiniteRatioBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpper mainNormLower restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteRatioBoundedData
        Region tiltSeed coreCutoff K M numeratorUpper mainNormLower restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    (AdjustedProjectedJ0FiniteBoundedData.total_ne_zero
      { parallel := data.parallel.toParallelUpperData
        rest := data.rest
        budget := data.budget })

/--
Adjusted-quartet bounded data using the ratio upper for the dominant `D0`
layer, with the quartet rest bound kept abstract.
-/
structure AdjustedProjectedJ0QuartetRatioBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper mainNormLower restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0D0RatioUpperData
      tiltSeed coreCutoff numeratorUpper mainNormLower Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedQuartetSurplusLower
        tiltSeed coreCutoff
        (adjustedProjectedJ0_parallelUpperFromNumeratorLower
          numeratorUpper mainNormLower)
        restUpper
        s

theorem AdjustedProjectedJ0QuartetRatioBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper mainNormLower restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0QuartetRatioBoundedData
        Region tiltSeed coreCutoff numeratorUpper mainNormLower restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact
    (AdjustedProjectedJ0QuartetBoundedData.total_ne_zero
      { parallel := data.parallel.toParallelUpperData
        rest := data.rest
        budget := data.budget })

/-- Constant real upper/lower function for region-wise box certificates. -/
def constUpper (A : ℝ) : ℂ → ℝ :=
  fun _ => A

/--
Constant version of the ratio data, matching a simple box certificate with one
numerator upper and one main-norm lower over the whole region.
-/
structure ProjectedJ0D0ConstantRatioUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (Region : Set ℂ)
    (numeratorUpperConst mainNormLowerConst : ℝ) where
  main_lower_pos : 0 < mainNormLowerConst
  main_lower :
    ∀ s ∈ Region,
      mainNormLowerConst ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  numerator_nonneg : 0 ≤ numeratorUpperConst
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpperConst

theorem ProjectedJ0D0ConstantRatioUpperData.toRatioUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {Region : Set ℂ} {numeratorUpperConst mainNormLowerConst : ℝ}
    (data :
      ProjectedJ0D0ConstantRatioUpperData
        tiltSeed coreCutoff Region numeratorUpperConst mainNormLowerConst) :
    ProjectedJ0D0RatioUpperData
      tiltSeed coreCutoff
      (constUpper numeratorUpperConst)
      (constUpper mainNormLowerConst)
      Region := by
  refine
    { main_lower_pos := ?_
      main_lower := ?_
      numerator_nonneg := ?_
      neg_re_upper := ?_ }
  · intro _ _
    exact data.main_lower_pos
  · intro s hs
    exact data.main_lower s hs
  · intro _ _
    exact data.numerator_nonneg
  · intro s hs
    exact data.neg_re_upper s hs

theorem ProjectedJ0D0ConstantRatioUpperData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {Region : Set ℂ} {numeratorUpperConst mainNormLowerConst : ℝ}
    (data :
      ProjectedJ0D0ConstantRatioUpperData
        tiltSeed coreCutoff Region numeratorUpperConst mainNormLowerConst) :
    ProjectedJ0ParallelUpperData
      tiltSeed coreCutoff
      (adjustedProjectedJ0_parallelUpperFromNumeratorLower
        (constUpper numeratorUpperConst)
        (constUpper mainNormLowerConst))
      Region := by
  exact data.toRatioUpperData.toParallelUpperData

end AdjustedQuartetProjectedJ0Aliases
end C2
