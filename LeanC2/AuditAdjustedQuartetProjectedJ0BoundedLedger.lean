import LeanC2.AuditAdjustedQuartetProjectedJ0ExactLedger

/-!
# Bounded projected-j0 ledger for the adjusted quartet

This audit file converts future pointwise upper bounds into positivity of the
exact projected-`j0` surplus.  It does not prove those upper bounds.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Exact main lower used by the current adjusted quartet route. -/
noncomputable def adjustedProjectedJ0_mainExactLower
    (tiltSeed : ℂ → ℂ) (s : ℂ) : ℝ :=
  c2ConcreteAntiMiracleAdjustedMain tiltSeed s

theorem adjustedProjectedJ0_mainExactLower_eq_norm
    (tiltSeed : ℂ → ℂ) (s : ℂ) :
    adjustedProjectedJ0_mainExactLower tiltSeed s =
      ‖adjustedProjectedJ0_M tiltSeed s‖ := by
  rfl

theorem adjustedProjectedJ0_mainExactLower_le_norm
    (tiltSeed : ℂ → ℂ) (s : ℂ) :
    adjustedProjectedJ0_mainExactLower tiltSeed s ≤
      ‖adjustedProjectedJ0_M tiltSeed s‖ := by
  rw [adjustedProjectedJ0_mainExactLower_eq_norm]

/-- Bounded surplus lower for the adjusted quartet with combined rest. -/
noncomputable def adjustedProjectedJ0_projectedQuartetSurplusLower
    (tiltSeed : ℂ → ℂ) (_coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  adjustedProjectedJ0_mainExactLower tiltSeed s -
    parallelUpper s -
    restUpper s

/-- Bounded surplus lower for the finite model with combined rest. -/
noncomputable def adjustedProjectedJ0_projectedFiniteSurplusLower
    (tiltSeed : ℂ → ℂ) (_coreCutoff : ℕ → ℕ) (_K _M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  adjustedProjectedJ0_mainExactLower tiltSeed s -
    parallelUpper s -
    restUpper s

/-- Bounded surplus lower for the adjusted quartet with separate rest. -/
noncomputable def adjustedProjectedJ0_projectedQuartetSeparateSurplusLower
    (tiltSeed : ℂ → ℂ) (_coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  adjustedProjectedJ0_mainExactLower tiltSeed s -
    parallelUpper s -
    restUpper s

/-- Bounded surplus lower for the finite model with separate rest. -/
noncomputable def adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
    (tiltSeed : ℂ → ℂ) (_coreCutoff : ℕ → ℕ) (_K _M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  adjustedProjectedJ0_mainExactLower tiltSeed s -
    parallelUpper s -
    restUpper s

theorem adjustedProjectedJ0_projectedQuartetSurplus_pos_of_bounded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedQuartetSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s) :
    0 < adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s := by
  unfold adjustedProjectedJ0_projectedQuartetSurplusLower at hBudget
  unfold adjustedProjectedJ0_projectedQuartetSurplus
  rw [adjustedProjectedJ0_mainExactLower_eq_norm] at hBudget
  linarith

theorem adjustedProjectedJ0_projectedFiniteSurplus_pos_of_bounded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedFiniteSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s) :
    0 < adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s := by
  unfold adjustedProjectedJ0_projectedFiniteSurplusLower at hBudget
  unfold adjustedProjectedJ0_projectedFiniteSurplus
  rw [adjustedProjectedJ0_mainExactLower_eq_norm] at hBudget
  linarith

theorem adjustedProjectedJ0_projectedQuartetSeparateSurplus_pos_of_bounded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_separateRestCostQuartet coreCutoff s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedQuartetSeparateSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s) :
    0 < adjustedProjectedJ0_projectedQuartetSeparateSurplus tiltSeed coreCutoff s := by
  unfold adjustedProjectedJ0_projectedQuartetSeparateSurplusLower at hBudget
  unfold adjustedProjectedJ0_projectedQuartetSeparateSurplus
  rw [adjustedProjectedJ0_mainExactLower_eq_norm] at hBudget
  linarith

theorem adjustedProjectedJ0_projectedFiniteSeparateSurplus_pos_of_bounded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s) :
    0 < adjustedProjectedJ0_projectedFiniteSeparateSurplus tiltSeed coreCutoff K M s := by
  unfold adjustedProjectedJ0_projectedFiniteSeparateSurplusLower at hBudget
  unfold adjustedProjectedJ0_projectedFiniteSeparateSurplus
  rw [adjustedProjectedJ0_mainExactLower_eq_norm] at hBudget
  linarith

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedQuartetSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSurplus_pos
    tiltSeed coreCutoff s
    (adjustedProjectedJ0_projectedQuartetSurplus_pos_of_bounded
      tiltSeed coreCutoff parallelUpper restUpper s hParallel hRest hBudget)

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedFiniteSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSurplus_pos
    tiltSeed coreCutoff K M s
    (adjustedProjectedJ0_projectedFiniteSurplus_pos_of_bounded
      tiltSeed coreCutoff K M parallelUpper restUpper s hParallel hRest hBudget)

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSeparateSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_separateRestCostQuartet coreCutoff s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedQuartetSeparateSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSeparateSurplus_pos
    tiltSeed coreCutoff s
    (adjustedProjectedJ0_projectedQuartetSeparateSurplus_pos_of_bounded
      tiltSeed coreCutoff parallelUpper restUpper s hParallel hRest hBudget)

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSeparateSurplus
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) (s : ℂ)
    (hParallel :
      adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s)
    (hRest :
      adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤ restUpper s)
    (hBudget :
      0 < adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSeparateSurplus_pos
    tiltSeed coreCutoff K M s
    (adjustedProjectedJ0_projectedFiniteSeparateSurplus_pos_of_bounded
      tiltSeed coreCutoff K M parallelUpper restUpper s hParallel hRest hBudget)

def AdjustedProjectedJ0FiniteBoundedSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) : Prop :=
  ∀ s ∈ Region,
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s ∧
    adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s ∧
    0 < adjustedProjectedJ0_projectedFiniteSurplusLower
      tiltSeed coreCutoff K M parallelUpper restUpper s

def AdjustedProjectedJ0QuartetBoundedSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) : Prop :=
  ∀ s ∈ Region,
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s ∧
    adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s ∧
    0 < adjustedProjectedJ0_projectedQuartetSurplusLower
      tiltSeed coreCutoff parallelUpper restUpper s

def AdjustedProjectedJ0FiniteSeparateBoundedSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ) : Prop :=
  ∀ s ∈ Region,
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s ∧
    adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤ restUpper s ∧
    0 < adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
      tiltSeed coreCutoff K M parallelUpper restUpper s

def AdjustedProjectedJ0QuartetSeparateBoundedSurplusPositiveOnRegion
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ) : Prop :=
  ∀ s ∈ Region,
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s ∧
    adjustedProjectedJ0_separateRestCostQuartet coreCutoff s ≤ restUpper s ∧
    0 < adjustedProjectedJ0_projectedQuartetSeparateSurplusLower
      tiltSeed coreCutoff parallelUpper restUpper s

theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ)
    (h :
      AdjustedProjectedJ0FiniteBoundedSurplusPositiveOnRegion
        Region tiltSeed coreCutoff K M parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSurplus
    tiltSeed coreCutoff K M parallelUpper restUpper s
    (h s hs).1 (h s hs).2.1 (h s hs).2.2

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ)
    (h :
      AdjustedProjectedJ0QuartetBoundedSurplusPositiveOnRegion
        Region tiltSeed coreCutoff parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSurplus
    tiltSeed coreCutoff parallelUpper restUpper s
    (h s hs).1 (h s hs).2.1 (h s hs).2.2

theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSeparateSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (parallelUpper restUpper : ℂ → ℝ)
    (h :
      AdjustedProjectedJ0FiniteSeparateBoundedSurplusPositiveOnRegion
        Region tiltSeed coreCutoff K M parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSeparateSurplus
    tiltSeed coreCutoff K M parallelUpper restUpper s
    (h s hs).1 (h s hs).2.1 (h s hs).2.2

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSeparateSurplus
    {Region : Set ℂ}
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (parallelUpper restUpper : ℂ → ℝ)
    (h :
      AdjustedProjectedJ0QuartetSeparateBoundedSurplusPositiveOnRegion
        Region tiltSeed coreCutoff parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  intro s hs
  exact adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSeparateSurplus
    tiltSeed coreCutoff parallelUpper restUpper s
    (h s hs).1 (h s hs).2.1 (h s hs).2.2

end AdjustedQuartetProjectedJ0Aliases
end C2
