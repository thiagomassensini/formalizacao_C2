import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper
import LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas

/-!
# Non-destructive sector upper for the projected-j0 ledger

This file records the abstract sector case where the dominant `D0` layer has no
destructive projection against the main vector.  In that case the numerator and
parallel upper can both be set to zero.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/--
Regional data saying that the dominant `D0` layer lies in a non-destructive
sector against the main vector.
-/
structure ProjectedJ0D0NonDestructiveSectorData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (Region : Set ℂ) where
  main_ne_zero :
    ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0
  nondestructive :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ 0

theorem ProjectedJ0D0NonDestructiveSectorData.toNegReUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {Region : Set ℂ}
    (data :
      ProjectedJ0D0NonDestructiveSectorData tiltSeed coreCutoff Region) :
    ProjectedJ0D0NegReUpperData
      tiltSeed coreCutoff
      (fun _ => 0)
      (fun _ => 0)
      Region := by
  refine
    { main_ne_zero := data.main_ne_zero
      numerator_nonneg := ?_
      neg_re_upper := ?_
      convert := ?_
      parallel_nonneg := ?_ }
  · intro s hs
    positivity
  · intro s hs
    exact data.nondestructive s hs
  · intro s hs
    simp
  · intro s hs
    positivity

theorem ProjectedJ0D0NonDestructiveSectorData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {Region : Set ℂ}
    (data :
      ProjectedJ0D0NonDestructiveSectorData tiltSeed coreCutoff Region) :
    ProjectedJ0ParallelUpperData
      tiltSeed coreCutoff
      (fun _ => 0)
      Region := by
  exact data.toNegReUpperData.toParallelUpperData

/--
Finite-model bounded data specialized to the non-destructive sector case.
The parallel upper is identically zero.
-/
structure AdjustedProjectedJ0FiniteSectorBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (restUpper : ℂ → ℝ) where
  sector :
    ProjectedJ0D0NonDestructiveSectorData tiltSeed coreCutoff Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 <
        adjustedProjectedJ0_mainExactLower tiltSeed s -
          restUpper s

theorem AdjustedProjectedJ0FiniteSectorBoundedData.toFiniteBoundedData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteSectorBoundedData
        Region tiltSeed coreCutoff K M restUpper) :
    AdjustedProjectedJ0FiniteBoundedData
      Region tiltSeed coreCutoff K M
      (fun _ => 0)
      restUpper := by
  refine
    { parallel := data.sector.toParallelUpperData
      rest := data.rest
      budget := ?_ }
  intro s hs
  unfold adjustedProjectedJ0_projectedFiniteSurplusLower
  simpa using data.budget s hs

theorem AdjustedProjectedJ0FiniteSectorBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteSectorBoundedData
        Region tiltSeed coreCutoff K M restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact data.toFiniteBoundedData.total_ne_zero

/--
Constant box data for the sector route.  A future interval/geometric
certificate should provide these fields for each positive-box region.
-/
structure ProjectedJ0SectorConstantBoxData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (mainNormLowerConst restUpperConst : ℝ) where
  main_lower_pos :
    0 < mainNormLowerConst
  main_lower :
    ∀ s ∈ Region,
      mainNormLowerConst ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  non_destructive :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ 0
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpperConst
  budget :
    0 < mainNormLowerConst - restUpperConst

theorem ProjectedJ0SectorConstantBoxData.toFiniteSectorBoundedData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0SectorConstantBoxData
        Region tiltSeed coreCutoff K M
        mainNormLowerConst restUpperConst) :
    AdjustedProjectedJ0FiniteSectorBoundedData
      Region tiltSeed coreCutoff K M
      (fun _ => restUpperConst) := by
  refine
    { sector := ?_
      rest := ?_
      budget := ?_ }
  · refine
      { main_ne_zero := ?_
        nondestructive := data.non_destructive }
    intro s hs
    have hmain_pos : 0 < ‖adjustedProjectedJ0_M tiltSeed s‖ :=
      lt_of_lt_of_le data.main_lower_pos (data.main_lower s hs)
    exact norm_pos_iff.mp hmain_pos
  · intro s hs
    exact data.rest s hs
  · intro s hs
    rw [adjustedProjectedJ0_mainExactLower_eq_norm]
    have hmain := data.main_lower s hs
    linarith [data.budget]

theorem ProjectedJ0SectorConstantBoxData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {mainNormLowerConst restUpperConst : ℝ}
    (data :
      ProjectedJ0SectorConstantBoxData
        Region tiltSeed coreCutoff K M
        mainNormLowerConst restUpperConst) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact data.toFiniteSectorBoundedData.total_ne_zero

end AdjustedQuartetProjectedJ0Aliases
end C2
