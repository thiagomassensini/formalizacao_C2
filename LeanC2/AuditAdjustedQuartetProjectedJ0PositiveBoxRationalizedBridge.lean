import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData
import LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas

/-!
# Conditional bridge from rationalized positive-box data to constant boxes

This file does not prove analytic enclosures.  It only says that a
rationalized algebra certificate can feed `ProjectedJ0ConstantBoxData` once the
corresponding analytic bounds are provided as explicit hypotheses.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Analytic hypotheses required externally for one combined-rest box. -/
structure ProjectedJ0ExternalAnalyticBoxHypotheses
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (mainLower numeratorUpper restUpper : ℝ) where
  main_lower :
    ∀ s ∈ Region,
      mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper
  rest_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper

/-- Analytic hypotheses required externally for one separate-rest box. -/
structure ProjectedJ0ExternalAnalyticBoxSeparateHypotheses
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (mainLower numeratorUpper restUpper : ℝ) where
  main_lower :
    ∀ s ∈ Region,
      mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper
  rest_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤
        restUpper

theorem ProjectedJ0RationalizedBoxCertificate.main_pos_real
    (cert : ProjectedJ0RationalizedBoxCertificate) :
    0 < (cert.constants.mainLower : ℝ) := by
  exact_mod_cast cert.main_pos

theorem ProjectedJ0RationalizedBoxCertificate.numerator_nonneg_real
    (cert : ProjectedJ0RationalizedBoxCertificate) :
    0 ≤ (cert.constants.numeratorUpper : ℝ) := by
  exact_mod_cast cert.numerator_nonneg

theorem ProjectedJ0RationalizedBoxCertificate.rest_nonneg_real
    (cert : ProjectedJ0RationalizedBoxCertificate) :
    0 ≤ (cert.constants.restUpper : ℝ) := by
  exact_mod_cast cert.rest_nonneg

theorem ProjectedJ0RationalizedBoxCertificate.budget_pos_real
    (cert : ProjectedJ0RationalizedBoxCertificate) :
    0 < (cert.constants.mainLower : ℝ)
      - (cert.constants.numeratorUpper : ℝ) / (cert.constants.mainLower : ℝ)
      - (cert.constants.restUpper : ℝ) := by
  have hq :
      0 < cert.constants.mainLower
        - cert.constants.numeratorUpper / cert.constants.mainLower
        - cert.constants.restUpper := by
    simpa [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue] using cert.budget_pos
  exact_mod_cast hq

theorem ProjectedJ0RationalizedBoxCertificate.toConstantBoxData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0RationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.numeratorUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ProjectedJ0ConstantBoxData
      Region tiltSeed coreCutoff K M
      (cert.constants.numeratorUpper : ℝ)
      (cert.constants.mainLower : ℝ)
      (cert.constants.restUpper : ℝ) := by
  exact
    { main_lower_pos := cert.main_pos_real
      main_lower := hAnalytic.main_lower
      numerator_nonneg := cert.numerator_nonneg_real
      neg_re_upper := hAnalytic.neg_re_upper
      rest := hAnalytic.rest_upper
      budget := cert.budget_pos_real }

theorem ProjectedJ0RationalizedBoxCertificate.toConstantBoxSeparateRestData
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0RationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxSeparateHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.numeratorUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ProjectedJ0ConstantBoxSeparateRestData
      Region tiltSeed coreCutoff K M
      (cert.constants.numeratorUpper : ℝ)
      (cert.constants.mainLower : ℝ)
      (cert.constants.restUpper : ℝ) := by
  exact
    { main_lower_pos := cert.main_pos_real
      main_lower := hAnalytic.main_lower
      numerator_nonneg := cert.numerator_nonneg_real
      neg_re_upper := hAnalytic.neg_re_upper
      rest := hAnalytic.rest_upper
      budget := cert.budget_pos_real }

theorem ProjectedJ0RationalizedBoxCertificate.total_ne_zero_of_external_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0RationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.numeratorUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact (cert.toConstantBoxData hAnalytic).total_ne_zero

theorem ProjectedJ0RationalizedBoxCertificate.total_ne_zero_of_external_separate_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cert : ProjectedJ0RationalizedBoxCertificate)
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxSeparateHypotheses
        Region tiltSeed coreCutoff K M
        (cert.constants.mainLower : ℝ)
        (cert.constants.numeratorUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact (cert.toConstantBoxSeparateRestData hAnalytic).total_ne_zero

theorem positiveBox_s0_84_t7_combined_total_ne_zero_of_external_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxHypotheses
        Region tiltSeed coreCutoff K M
        (positiveBox_s0_84_t7_combined_certificate.constants.mainLower : ℝ)
        (positiveBox_s0_84_t7_combined_certificate.constants.numeratorUpper : ℝ)
        (positiveBox_s0_84_t7_combined_certificate.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    positiveBox_s0_84_t7_combined_certificate
      |>.total_ne_zero_of_external_hypotheses hAnalytic

theorem positiveBox_s0_84_t7_separate_total_ne_zero_of_external_hypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (hAnalytic :
      ProjectedJ0ExternalAnalyticBoxSeparateHypotheses
        Region tiltSeed coreCutoff K M
        (positiveBox_s0_84_t7_separate_certificate.constants.mainLower : ℝ)
        (positiveBox_s0_84_t7_separate_certificate.constants.numeratorUpper : ℝ)
        (positiveBox_s0_84_t7_separate_certificate.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    positiveBox_s0_84_t7_separate_certificate
      |>.total_ne_zero_of_external_separate_hypotheses hAnalytic

/--
Conditional finite atlas over rationalized box certificates.  The cover and
all analytic bounds remain explicit hypotheses.
-/
structure PositiveBoxRationalizedExternalAtlasHypotheses
    {ι : Type} [DecidableEq ι]
    (GlobalRegion : Set ℂ)
    (boxes : Finset ι)
    (BoxRegion : ι → Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (K M : ℕ) where
  cover :
    ∀ s ∈ GlobalRegion, ∃ i ∈ boxes, s ∈ BoxRegion i
  boxCert :
    ι → ProjectedJ0RationalizedBoxCertificate
  boxAnalytic :
    ∀ i, i ∈ boxes →
      ProjectedJ0ExternalAnalyticBoxHypotheses
        (BoxRegion i) tiltSeed coreCutoff K M
        ((boxCert i).constants.mainLower : ℝ)
        ((boxCert i).constants.numeratorUpper : ℝ)
        ((boxCert i).constants.restUpper : ℝ)

theorem PositiveBoxRationalizedExternalAtlasHypotheses.total_ne_zero
    {ι : Type} [DecidableEq ι]
    {GlobalRegion : Set ℂ}
    {boxes : Finset ι}
    {BoxRegion : ι → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {K M : ℕ}
    (data :
      PositiveBoxRationalizedExternalAtlasHypotheses
        GlobalRegion boxes BoxRegion tiltSeed coreCutoff K M) :
    ∀ s ∈ GlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  intro s hs
  rcases data.cover s hs with ⟨i, hi, hsi⟩
  exact
    ((data.boxCert i).total_ne_zero_of_external_hypotheses
      (data.boxAnalytic i hi)) s hsi

def positiveBoxCombinedCertificateCount : Nat := 27

def positiveBoxSeparateCertificateCount : Nat := 27

theorem positiveBoxCombinedCertificates_length :
    positiveBoxCombinedRationalizedCertificates.length =
      positiveBoxCombinedCertificateCount := by
  norm_num [
    positiveBoxCombinedCertificateCount,
    positiveBoxCombinedRationalizedCertificates]

theorem positiveBoxSeparateCertificates_length :
    positiveBoxSeparateRationalizedCertificates.length =
      positiveBoxSeparateCertificateCount := by
  norm_num [
    positiveBoxSeparateCertificateCount,
    positiveBoxSeparateRationalizedCertificates]

end AdjustedQuartetProjectedJ0Aliases
end C2
