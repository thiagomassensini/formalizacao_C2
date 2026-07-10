import LeanC2.AuditAdjustedQuartetProjectedJ0RatioUpper

/-!
# Constant atlas scaffold for the projected-j0 ledger

This audit file consumes constant box data for the ratio-upper route.  It does
not prove the constants and does not prove that a family of boxes covers any
analytic region.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/--
Constant data for one finite-model box with combined rest.  A future certified
atlas should provide these fields for each box.
-/
structure ProjectedJ0ConstantBoxData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (K M : ℕ)
    (numeratorUpperConst mainNormLowerConst restUpperConst : ℝ) where
  main_lower_pos :
    0 < mainNormLowerConst
  main_lower :
    ∀ s ∈ Region,
      mainNormLowerConst ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  numerator_nonneg :
    0 ≤ numeratorUpperConst
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpperConst
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpperConst
  budget :
    0 < mainNormLowerConst
      - numeratorUpperConst / mainNormLowerConst
      - restUpperConst

theorem ProjectedJ0ConstantBoxData.toConstantRatioUpperData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0ConstantBoxData
        Region tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    ProjectedJ0D0ConstantRatioUpperData
      tiltSeed coreCutoff Region numeratorUpperConst mainNormLowerConst := by
  exact
    { main_lower_pos := data.main_lower_pos
      main_lower := data.main_lower
      numerator_nonneg := data.numerator_nonneg
      neg_re_upper := data.neg_re_upper }

theorem ProjectedJ0ConstantBoxData.toFiniteRatioBoundedData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0ConstantBoxData
        Region tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    AdjustedProjectedJ0FiniteRatioBoundedData
      Region tiltSeed coreCutoff K M
      (constUpper numeratorUpperConst)
      (constUpper mainNormLowerConst)
      (constUpper restUpperConst) := by
  refine
    { parallel := data.toConstantRatioUpperData.toRatioUpperData
      rest := ?_
      budget := ?_ }
  · intro s hs
    exact data.rest s hs
  · intro s hs
    dsimp [
      adjustedProjectedJ0_projectedFiniteSurplusLower,
      adjustedProjectedJ0_parallelUpperFromNumeratorLower,
      constUpper]
    rw [adjustedProjectedJ0_mainExactLower_eq_norm]
    have hmain := data.main_lower s hs
    linarith [data.budget]

theorem ProjectedJ0ConstantBoxData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0ConstantBoxData
        Region tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact data.toFiniteRatioBoundedData.total_ne_zero

/--
Constant data for one finite-model box with separate rest.  This variant is
useful when the certificate bounds the quartet rest and finite tail separately.
-/
structure ProjectedJ0ConstantBoxSeparateRestData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (K M : ℕ)
    (numeratorUpperConst mainNormLowerConst restUpperConst : ℝ) where
  main_lower_pos :
    0 < mainNormLowerConst
  main_lower :
    ∀ s ∈ Region,
      mainNormLowerConst ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  numerator_nonneg :
    0 ≤ numeratorUpperConst
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpperConst
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤
        restUpperConst
  budget :
    0 < mainNormLowerConst
      - numeratorUpperConst / mainNormLowerConst
      - restUpperConst

theorem ProjectedJ0ConstantBoxSeparateRestData.toConstantRatioUpperData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0ConstantBoxSeparateRestData
        Region tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    ProjectedJ0D0ConstantRatioUpperData
      tiltSeed coreCutoff Region numeratorUpperConst mainNormLowerConst := by
  exact
    { main_lower_pos := data.main_lower_pos
      main_lower := data.main_lower
      numerator_nonneg := data.numerator_nonneg
      neg_re_upper := data.neg_re_upper }

theorem ProjectedJ0ConstantBoxSeparateRestData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0ConstantBoxSeparateRestData
        Region tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  refine
    adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSeparateSurplus
      tiltSeed coreCutoff K M
      (adjustedProjectedJ0_parallelUpperFromNumeratorLower
        (constUpper numeratorUpperConst)
        (constUpper mainNormLowerConst))
      (constUpper restUpperConst)
      ?_
  intro s hs
  refine ⟨?_, ?_, ?_⟩
  · exact data.toConstantRatioUpperData.toParallelUpperData.upper s hs
  · exact data.rest s hs
  · dsimp [
      adjustedProjectedJ0_projectedFiniteSeparateSurplusLower,
      adjustedProjectedJ0_parallelUpperFromNumeratorLower,
      constUpper]
    rw [adjustedProjectedJ0_mainExactLower_eq_norm]
    have hmain := data.main_lower s hs
    linarith [data.budget]

/--
Finite atlas scaffold with per-box constants.  The `cover` and `boxData`
fields are still abstract; this structure only records the shape a later
certificate should fill.
-/
structure ProjectedJ0ConstantAtlasData
    {ι : Type} [DecidableEq ι]
    (GlobalRegion : Set ℂ)
    (boxes : Finset ι)
    (BoxRegion : ι → Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (K M : ℕ)
    (numeratorUpperConst mainNormLowerConst restUpperConst : ι → ℝ) where
  cover :
    ∀ s ∈ GlobalRegion, ∃ i ∈ boxes, s ∈ BoxRegion i
  boxData :
    ∀ i, i ∈ boxes →
      ProjectedJ0ConstantBoxData
        (BoxRegion i) tiltSeed coreCutoff K M
        (numeratorUpperConst i) (mainNormLowerConst i) (restUpperConst i)

theorem ProjectedJ0ConstantAtlasData.total_ne_zero
    {ι : Type} [DecidableEq ι]
    {GlobalRegion : Set ℂ}
    {boxes : Finset ι}
    {BoxRegion : ι → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {K M : ℕ}
    {numeratorUpperConst mainNormLowerConst restUpperConst : ι → ℝ}
    (data :
      ProjectedJ0ConstantAtlasData
        GlobalRegion boxes BoxRegion tiltSeed coreCutoff K M
        numeratorUpperConst mainNormLowerConst restUpperConst) :
    ∀ s ∈ GlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  intro s hs
  rcases data.cover s hs with ⟨i, hi, hsi⟩
  exact (data.boxData i hi).total_ne_zero s hsi

end AdjustedQuartetProjectedJ0Aliases
end C2
