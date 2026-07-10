import LeanC2.AuditProjectedJ0SubboxToSectorBridge

/-!
# Sector atlas from subboxes for projected-j0 certificates

This file adds a global atlas layer above `ProjectedJ0SubboxCoverData`.
It is purely structural: it contains no concrete boxes, no subbox data, and no
analytic enclosure generation.
-/

namespace C2
namespace ProjectedJ0RectangleArithmetic

open AdjustedQuartetProjectedJ0Aliases

/--
Convenience theorem for one box.  It is a thin wrapper around the sector
rationalized bridge consumer, specialized to a subbox cover.
-/
theorem total_ne_zero_on_box_of_subbox_cover
    {BoxRegion : Set ℂ}
    {SubboxId : Type}
    {subboxes : Finset SubboxId}
    {SubboxRegion : SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (cert : ProjectedJ0SectorRationalizedBoxCertificate)
    (coverData :
      ProjectedJ0SubboxCoverData
        BoxRegion SubboxId subboxes SubboxRegion
        tiltSeed coreCutoff K Midx
        (cert.constants.mainLower : ℝ)
        (cert.constants.d0NegReUpper : ℝ)
        (cert.constants.restUpper : ℝ)) :
    ∀ s ∈ BoxRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 :=
  cert.total_ne_zero_of_subbox_cover coverData

/--
Global sector atlas assembled from boxes, where each box has a rationalized
sector certificate and an abstract cover by subboxes.

The certificate function is total on `BoxId`; only values on `boxes` are used.
This avoids dependent bookkeeping in the first atlas layer.
-/
structure ProjectedJ0SectorAtlasFromSubboxes
    (GlobalRegion : Set ℂ)
    (BoxId SubboxId : Type)
    (boxes : Finset BoxId)
    (BoxRegion : BoxId → Set ℂ)
    (BoxSubboxes : BoxId → Finset SubboxId)
    (SubboxRegion : BoxId → SubboxId → Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  cover_boxes :
    ∀ s ∈ GlobalRegion,
      ∃ b ∈ boxes, s ∈ BoxRegion b
  cert :
    BoxId → ProjectedJ0SectorRationalizedBoxCertificate
  subbox_cover :
    ∀ b ∈ boxes,
      ProjectedJ0SubboxCoverData
        (BoxRegion b)
        SubboxId
        (BoxSubboxes b)
        (SubboxRegion b)
        tiltSeed coreCutoff K Midx
        ((cert b).constants.mainLower : ℝ)
        ((cert b).constants.d0NegReUpper : ℝ)
        ((cert b).constants.restUpper : ℝ)

namespace ProjectedJ0SectorAtlasFromSubboxes

theorem total_ne_zero
    {GlobalRegion : Set ℂ}
    {BoxId SubboxId : Type}
    {boxes : Finset BoxId}
    {BoxRegion : BoxId → Set ℂ}
    {BoxSubboxes : BoxId → Finset SubboxId}
    {SubboxRegion : BoxId → SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (atlas :
      ProjectedJ0SectorAtlasFromSubboxes
        GlobalRegion BoxId SubboxId boxes BoxRegion BoxSubboxes
        SubboxRegion tiltSeed coreCutoff K Midx) :
    ∀ s ∈ GlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  intro s hs
  rcases atlas.cover_boxes s hs with ⟨b, hb, hsbox⟩
  exact
    total_ne_zero_on_box_of_subbox_cover
      (atlas.cert b)
      (atlas.subbox_cover b hb)
      s
      hsbox

end ProjectedJ0SectorAtlasFromSubboxes

end ProjectedJ0RectangleArithmetic
end C2
