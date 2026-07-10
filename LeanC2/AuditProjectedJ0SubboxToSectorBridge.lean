import LeanC2.AuditProjectedJ0RectangleModBounds
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedBridge

/-!
# Subbox-to-sector bridge for projected-j0 sector certificates

This file connects the abstract rectangle/subbox contracts to the conditional
sector bridge.  It does not contain concrete subbox data, and it does not prove
that analytic finite objects belong to their raw rectangles.
-/

namespace C2
namespace ProjectedJ0RectangleArithmetic

open AdjustedQuartetProjectedJ0Aliases

/--
Concrete subbox bridge data for four complex values.  The rectangle contract
records membership in raw rectangles; the derived/modulus layers provide the
rectangle-arithmetic bounds; the comparison fields align those bounds with the
box-level constants that will be consumed by the sector certificate.
-/
structure ProjectedJ0SubboxSectorBridgeData
    (M D0 Drest RvecTail : ℂ)
    (mainLower d0NegReUpper restUpper : ℝ) where
  rectContract :
    ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail
  derivedBounds :
    ProjectedJ0SubboxDerivedBounds rectContract
  modBounds :
    ProjectedJ0SubboxModBounds rectContract
  mainLower_le_modLower :
    mainLower ≤ modBounds.mainLowerCert.lower
  d0Upper_le :
    derivedBounds.d0NegReUpper ≤ d0NegReUpper
  restUpper_le :
    modBounds.restUpperCert.upper ≤ restUpper

namespace ProjectedJ0SubboxSectorBridgeData

theorem main_lower
    {M D0 Drest RvecTail : ℂ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0SubboxSectorBridgeData
        M D0 Drest RvecTail mainLower d0NegReUpper restUpper) :
    mainLower ≤ ‖M‖ :=
  le_trans data.mainLower_le_modLower
    (ProjectedJ0SubboxModBounds.main_lower data.modBounds)

theorem d0_neg_re_upper
    {M D0 Drest RvecTail : ℂ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0SubboxSectorBridgeData
        M D0 Drest RvecTail mainLower d0NegReUpper restUpper) :
    -((D0 * starRingEnd ℂ M).re) ≤ d0NegReUpper :=
  le_trans
    (ProjectedJ0SubboxDerivedBounds.d0NegRe_le data.derivedBounds)
    data.d0Upper_le

theorem rest_upper
    {M D0 Drest RvecTail : ℂ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0SubboxSectorBridgeData
        M D0 Drest RvecTail mainLower d0NegReUpper restUpper) :
    ‖Drest + RvecTail‖ ≤ restUpper :=
  le_trans
    (ProjectedJ0SubboxModBounds.rest_upper data.modBounds)
    data.restUpper_le

end ProjectedJ0SubboxSectorBridgeData

/--
Box-level analytic hypotheses assembled from subbox information.  This mirrors
the external sector bridge hypothesis, but lives in the rectangle namespace so
that it can be produced by a subbox cover.
-/
structure ProjectedJ0BoxSectorAnalyticFromSubboxes
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ)
    (mainLower d0NegReUpper restUpper : ℝ) where
  main_lower :
    ∀ s ∈ Region,
      mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  d0_neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ d0NegReUpper
  rest_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s ≤ restUpper

namespace ProjectedJ0BoxSectorAnalyticFromSubboxes

theorem toExternalAnalyticBoxHypotheses
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0BoxSectorAnalyticFromSubboxes
        Region tiltSeed coreCutoff K Midx
        mainLower d0NegReUpper restUpper) :
    ProjectedJ0SectorExternalAnalyticBoxHypotheses
      Region tiltSeed coreCutoff K Midx
      mainLower d0NegReUpper restUpper where
  main_lower := data.main_lower
  d0_neg_re_upper := data.d0_neg_re_upper
  rest_upper := data.rest_upper

end ProjectedJ0BoxSectorAnalyticFromSubboxes

/--
Abstract cover of one box by subboxes.  Each subbox supplies the same box-level
constants, so the cover can be collapsed into the external analytic hypotheses
required by the rationalized sector bridge.
-/
structure ProjectedJ0SubboxCoverData
    (Region : Set ℂ)
    (SubboxId : Type)
    (subboxes : Finset SubboxId)
    (SubboxRegion : SubboxId → Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ)
    (mainLower d0NegReUpper restUpper : ℝ) where
  cover :
    ∀ s ∈ Region, ∃ i ∈ subboxes, s ∈ SubboxRegion i
  main_lower_subbox :
    ∀ i ∈ subboxes, ∀ s ∈ SubboxRegion i,
      mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  d0_neg_subbox :
    ∀ i ∈ subboxes, ∀ s ∈ SubboxRegion i,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ d0NegReUpper
  rest_upper_subbox :
    ∀ i ∈ subboxes, ∀ s ∈ SubboxRegion i,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s ≤ restUpper

namespace ProjectedJ0SubboxCoverData

theorem toBoxSectorAnalyticFromSubboxes
    {Region : Set ℂ}
    {SubboxId : Type}
    {subboxes : Finset SubboxId}
    {SubboxRegion : SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0SubboxCoverData
        Region SubboxId subboxes SubboxRegion
        tiltSeed coreCutoff K Midx
        mainLower d0NegReUpper restUpper) :
    ProjectedJ0BoxSectorAnalyticFromSubboxes
      Region tiltSeed coreCutoff K Midx
      mainLower d0NegReUpper restUpper where
  main_lower := by
    intro s hs
    rcases data.cover s hs with ⟨i, hi, hsi⟩
    exact data.main_lower_subbox i hi s hsi
  d0_neg_re_upper := by
    intro s hs
    rcases data.cover s hs with ⟨i, hi, hsi⟩
    exact data.d0_neg_subbox i hi s hsi
  rest_upper := by
    intro s hs
    rcases data.cover s hs with ⟨i, hi, hsi⟩
    exact data.rest_upper_subbox i hi s hsi

theorem toExternalAnalyticBoxHypotheses
    {Region : Set ℂ}
    {SubboxId : Type}
    {subboxes : Finset SubboxId}
    {SubboxRegion : SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    {mainLower d0NegReUpper restUpper : ℝ}
    (data :
      ProjectedJ0SubboxCoverData
        Region SubboxId subboxes SubboxRegion
        tiltSeed coreCutoff K Midx
        mainLower d0NegReUpper restUpper) :
    ProjectedJ0SectorExternalAnalyticBoxHypotheses
      Region tiltSeed coreCutoff K Midx
      mainLower d0NegReUpper restUpper :=
  data.toBoxSectorAnalyticFromSubboxes.toExternalAnalyticBoxHypotheses

end ProjectedJ0SubboxCoverData

end ProjectedJ0RectangleArithmetic

namespace AdjustedQuartetProjectedJ0Aliases

open ProjectedJ0RectangleArithmetic

theorem ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_subbox_cover
    {Region : Set ℂ}
    {SubboxId : Type}
    {subboxes : Finset SubboxId}
    {SubboxRegion : SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (cert : ProjectedJ0SectorRationalizedBoxCertificate)
    (coverData :
      ProjectedJ0SubboxCoverData
        Region SubboxId subboxes SubboxRegion
        tiltSeed coreCutoff K Midx
        (cert.constants.mainLower : ℝ)
        (cert.constants.d0NegReUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  exact cert.total_ne_zero_of_external_hypotheses
    (ProjectedJ0SubboxCoverData.toExternalAnalyticBoxHypotheses coverData)

end AdjustedQuartetProjectedJ0Aliases
end C2
