import LeanC2.AuditAdjustedQuartetProjectedJ0Aliases

/-!
# Exact projected-j0 ledger for the adjusted quartet

This audit file packages the projected-`j0` ledger with exact pointwise costs.
It proves that positive exact surplus implies nonvanishing, but does not prove
that the surplus is positive on any analytic region.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

open AdjustedQuartetHorizontalProjection

/-- Exact destructive projected cost of the dominant horizontal layer. -/
noncomputable def adjustedProjectedJ0_parallelCost
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  destructiveParallel
    (adjustedProjectedJ0_M tiltSeed s)
    (adjustedProjectedJ0_D0 coreCutoff s)

/-- Exact combined rest cost for the adjusted quartet alone. -/
noncomputable def adjustedProjectedJ0_restCostQuartet
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_Drest coreCutoff s + 0‖

/-- Exact combined rest cost for the finite model. -/
noncomputable def adjustedProjectedJ0_restCostFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_Drest coreCutoff s +
    adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s‖

/-- Separate rest cost for the adjusted quartet alone. -/
noncomputable def adjustedProjectedJ0_separateRestCostQuartet
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_Drest coreCutoff s‖ + ‖(0 : ℂ)‖

/-- Separate rest cost for the finite model. -/
noncomputable def adjustedProjectedJ0_separateRestCostFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_Drest coreCutoff s‖ +
    ‖adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s‖

/-- Exact projected surplus for the adjusted quartet alone. -/
noncomputable def adjustedProjectedJ0_projectedQuartetSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_M tiltSeed s‖ -
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s -
    adjustedProjectedJ0_restCostQuartet coreCutoff s

/-- Exact projected surplus for the finite model. -/
noncomputable def adjustedProjectedJ0_projectedFiniteSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_M tiltSeed s‖ -
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s -
    adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s

/-- Exact projected surplus with separate rest for the adjusted quartet alone. -/
noncomputable def adjustedProjectedJ0_projectedQuartetSeparateSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_M tiltSeed s‖ -
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s -
    adjustedProjectedJ0_separateRestCostQuartet coreCutoff s

/-- Exact projected surplus with separate rest for the finite model. -/
noncomputable def adjustedProjectedJ0_projectedFiniteSeparateSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ :=
  ‖adjustedProjectedJ0_M tiltSeed s‖ -
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s -
    adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s

theorem destructiveParallel_nonneg (M D : ℂ) :
    0 ≤ destructiveParallel M D := by
  unfold destructiveParallel
  exact le_max_left 0 (-(parallelCoord M D))

theorem adjustedProjectedJ0_parallelCost_nonneg
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    0 ≤ adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s := by
  unfold adjustedProjectedJ0_parallelCost
  exact destructiveParallel_nonneg _ _

theorem adjustedProjectedJ0_restCostQuartet_nonneg
    (coreCutoff : ℕ → ℕ) (s : ℂ) :
    0 ≤ adjustedProjectedJ0_restCostQuartet coreCutoff s := by
  unfold adjustedProjectedJ0_restCostQuartet
  exact norm_nonneg _

theorem adjustedProjectedJ0_restCostFinite_nonneg
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) :
    0 ≤ adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s := by
  unfold adjustedProjectedJ0_restCostFinite
  exact norm_nonneg _

theorem adjustedProjectedJ0_separateRestCostQuartet_nonneg
    (coreCutoff : ℕ → ℕ) (s : ℂ) :
    0 ≤ adjustedProjectedJ0_separateRestCostQuartet coreCutoff s := by
  unfold adjustedProjectedJ0_separateRestCostQuartet
  positivity

theorem adjustedProjectedJ0_separateRestCostFinite_nonneg
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) :
    0 ≤ adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s := by
  unfold adjustedProjectedJ0_separateRestCostFinite
  positivity

theorem adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s) :
    adjustedProjectedJ0_M tiltSeed s ≠ 0 := by
  intro hzero
  have hnorm : ‖adjustedProjectedJ0_M tiltSeed s‖ = 0 := by simp [hzero]
  have hp := adjustedProjectedJ0_parallelCost_nonneg tiltSeed coreCutoff s
  have hr := adjustedProjectedJ0_restCostQuartet_nonneg coreCutoff s
  have hnonpos :
      adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s ≤ 0 := by
    unfold adjustedProjectedJ0_projectedQuartetSurplus
    rw [hnorm]
    linarith
  linarith

theorem adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s) :
    adjustedProjectedJ0_M tiltSeed s ≠ 0 := by
  intro hzero
  have hnorm : ‖adjustedProjectedJ0_M tiltSeed s‖ = 0 := by simp [hzero]
  have hp := adjustedProjectedJ0_parallelCost_nonneg tiltSeed coreCutoff s
  have hr := adjustedProjectedJ0_restCostFinite_nonneg tiltSeed coreCutoff K M s
  have hnonpos :
      adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s ≤ 0 := by
    unfold adjustedProjectedJ0_projectedFiniteSurplus
    rw [hnorm]
    linarith
  linarith

theorem adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSeparateSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedQuartetSeparateSurplus tiltSeed coreCutoff s) :
    adjustedProjectedJ0_M tiltSeed s ≠ 0 := by
  intro hzero
  have hnorm : ‖adjustedProjectedJ0_M tiltSeed s‖ = 0 := by simp [hzero]
  have hp := adjustedProjectedJ0_parallelCost_nonneg tiltSeed coreCutoff s
  have hr := adjustedProjectedJ0_separateRestCostQuartet_nonneg coreCutoff s
  have hnonpos :
      adjustedProjectedJ0_projectedQuartetSeparateSurplus tiltSeed coreCutoff s ≤ 0 := by
    unfold adjustedProjectedJ0_projectedQuartetSeparateSurplus
    rw [hnorm]
    linarith
  linarith

theorem adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSeparateSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedFiniteSeparateSurplus tiltSeed coreCutoff K M s) :
    adjustedProjectedJ0_M tiltSeed s ≠ 0 := by
  intro hzero
  have hnorm : ‖adjustedProjectedJ0_M tiltSeed s‖ = 0 := by simp [hzero]
  have hp := adjustedProjectedJ0_parallelCost_nonneg tiltSeed coreCutoff s
  have hr := adjustedProjectedJ0_separateRestCostFinite_nonneg tiltSeed coreCutoff K M s
  have hnonpos :
      adjustedProjectedJ0_projectedFiniteSeparateSurplus tiltSeed coreCutoff K M s ≤ 0 := by
    unfold adjustedProjectedJ0_projectedFiniteSeparateSurplus
    rw [hnorm]
    linarith
  linarith

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  apply adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_bounds
    (mainLower := ‖adjustedProjectedJ0_M tiltSeed s‖)
    (parallelUpper := adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s)
    (restUpper := adjustedProjectedJ0_restCostQuartet coreCutoff s)
  · exact adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSurplus_pos
      tiltSeed coreCutoff s hSurplus
  · rfl
  · rfl
  · rfl
  · unfold adjustedProjectedJ0_projectedQuartetSurplus at hSurplus
    linarith

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  apply adjustedProjectedJ0_totalFinite_ne_zero_of_projected_bounds
    (mainLower := ‖adjustedProjectedJ0_M tiltSeed s‖)
    (parallelUpper := adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s)
    (restUpper := adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s)
  · exact adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSurplus_pos
      tiltSeed coreCutoff K M s hSurplus
  · rfl
  · rfl
  · rfl
  · unfold adjustedProjectedJ0_projectedFiniteSurplus at hSurplus
    linarith

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSeparateSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedQuartetSeparateSurplus tiltSeed coreCutoff s) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  apply adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_separate_bounds
    (mainLower := ‖adjustedProjectedJ0_M tiltSeed s‖)
    (parallelUpper := adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s)
    (restUpper := adjustedProjectedJ0_separateRestCostQuartet coreCutoff s)
  · exact adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSeparateSurplus_pos
      tiltSeed coreCutoff s hSurplus
  · rfl
  · rfl
  · rfl
  · unfold adjustedProjectedJ0_projectedQuartetSeparateSurplus at hSurplus
    linarith

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSeparateSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedFiniteSeparateSurplus tiltSeed coreCutoff K M s) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  apply adjustedProjectedJ0_totalFinite_ne_zero_of_projected_separate_bounds
    (mainLower := ‖adjustedProjectedJ0_M tiltSeed s‖)
    (parallelUpper := adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s)
    (restUpper := adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s)
  · exact adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSeparateSurplus_pos
      tiltSeed coreCutoff K M s hSurplus
  · rfl
  · rfl
  · rfl
  · unfold adjustedProjectedJ0_projectedFiniteSeparateSurplus at hSurplus
    linarith

def AdjustedProjectedJ0FiniteSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) : Prop :=
  ∀ s ∈ Region,
    0 < adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s

def AdjustedProjectedJ0QuartetSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) : Prop :=
  ∀ s ∈ Region,
    0 < adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s

theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_projectedSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (hSurplus : AdjustedProjectedJ0FiniteSurplusPositiveOnRegion
      Region tiltSeed coreCutoff K M) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSurplus_pos
    tiltSeed coreCutoff K M s (hSurplus s hs)

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_projectedSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (hSurplus : AdjustedProjectedJ0QuartetSurplusPositiveOnRegion
      Region tiltSeed coreCutoff) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSurplus_pos
    tiltSeed coreCutoff s (hSurplus s hs)

end AdjustedQuartetProjectedJ0Aliases
end C2
