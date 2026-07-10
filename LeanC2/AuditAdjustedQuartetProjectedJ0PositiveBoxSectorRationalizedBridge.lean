import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData
import LeanC2.AuditAdjustedQuartetProjectedJ0SectorUpper

/-!
# Conditional bridge from sector rationalized data to sector boxes

This file does not prove analytic enclosures.  It only says that a
rationalized sector algebra certificate can feed `ProjectedJ0SectorConstantBoxData`
once the corresponding analytic bounds are provided as explicit hypotheses.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Analytic hypotheses required externally for one combined-rest sector box. -/
structure ProjectedJ0SectorExternalAnalyticBoxHypotheses
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (mainLower d0NegReUpper restUpper : ℝ) where
  main_lower :
    ∀ s ∈ Region,
      mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  d0_neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ d0NegReUpper
  rest_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper

theorem ProjectedJ0SectorRationalizedBoxCertificate.main_pos_real
    (cert : ProjectedJ0SectorRationalizedBoxCertificate) :
    0 < (cert.constants.mainLower : ℝ) := by
  exact_mod_cast cert.main_pos

theorem ProjectedJ0SectorRationalizedBoxCertificate.rest_nonneg_real
    (cert : ProjectedJ0SectorRationalizedBoxCertificate) :
    0 ≤ (cert.constants.restUpper : ℝ) := by
  exact_mod_cast cert.rest_nonneg

theorem ProjectedJ0SectorRationalizedBoxCertificate.d0_neg_re_upper_nonpos_real
    (cert : ProjectedJ0SectorRationalizedBoxCertificate) :
    (cert.constants.d0NegReUpper : ℝ) ≤ 0 := by
  have hq : cert.constants.d0NegReUpper ≤ 0 := by
    simpa [ProjectedJ0SectorRationalizedNonDestructive] using
      cert.nondestructive
  exact_mod_cast hq

theorem ProjectedJ0SectorRationalizedBoxCertificate.budget_pos_real
    (cert : ProjectedJ0SectorRationalizedBoxCertificate) :
    0 < (cert.constants.mainLower : ℝ) -
      (cert.constants.restUpper : ℝ) := by
  have hq : 0 < cert.constants.mainLower - cert.constants.restUpper := by
    simpa [
      ProjectedJ0SectorRationalizedBudgetPositive,
      ProjectedJ0SectorRationalizedBudgetValue] using cert.budget_pos
  exact_mod_cast hq

theorem ProjectedJ0SectorRationalizedBoxCertificate.toSectorConstantBoxData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0SectorRationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0SectorExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.d0NegReUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ProjectedJ0SectorConstantBoxData
      Region tiltSeed coreCutoff K M
      (cert.constants.mainLower : ℝ)
      (cert.constants.restUpper : ℝ) := by
  refine
    { main_lower_pos := cert.main_pos_real
      main_lower := hAnalytic.main_lower
      non_destructive := ?_
      rest := hAnalytic.rest_upper
      budget := cert.budget_pos_real }
  intro s hs
  have hupper := hAnalytic.d0_neg_re_upper s hs
  have hnonpos := cert.d0_neg_re_upper_nonpos_real
  linarith

theorem ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_external_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0SectorRationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0SectorExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.d0NegReUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact (cert.toSectorConstantBoxData hAnalytic).total_ne_zero

theorem positiveBoxSector_s0_84_t7_combined_total_ne_zero_of_external_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (hAnalytic :
      ProjectedJ0SectorExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (positiveBoxSector_s0_84_t7_combined_certificate.constants.mainLower : ℝ)
        (positiveBoxSector_s0_84_t7_combined_certificate.constants.d0NegReUpper : ℝ)
        (positiveBoxSector_s0_84_t7_combined_certificate.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    positiveBoxSector_s0_84_t7_combined_certificate
      |>.total_ne_zero_of_external_hypotheses hAnalytic

end AdjustedQuartetProjectedJ0Aliases
end C2
