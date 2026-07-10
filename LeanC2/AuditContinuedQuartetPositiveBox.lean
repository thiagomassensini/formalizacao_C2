import LeanC2.AuditContinuedQuartetAnchor

/-!
# Positive pocket box audit

Audit-only first box certificate for the q-ratio V-split route.

The numerical values below record the first promising subbox selected by the
diagnostic scanner.  They are not used as proofs by themselves: the structure
`PositiveBoxCertificate` keeps the required interval/sector bounds as explicit
fields.  This file only proves that such a certificate plugs into the existing
sector q-ratio V-split API.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- Lower real edge of the selected positive-pocket subbox. -/
def positiveBoxSigmaMin : ℝ := (21 : ℝ) / 25

/-- Upper real edge of the selected positive-pocket subbox. -/
def positiveBoxSigmaMax : ℝ := (43 : ℝ) / 50

/-- Lower imaginary edge of the selected positive-pocket subbox. -/
def positiveBoxOldTMin : ℝ := (525 : ℝ) / 16

/-- Upper imaginary edge of the selected positive-pocket subbox. -/
def positiveBoxOldTMax : ℝ := (263 : ℝ) / 8

/--
Lower imaginary edge of the refined phase-positive subbox.

The previous audit box endpoints are retained above as `positiveBoxOldTMin`
and `positiveBoxOldTMax`; the active audit-only `positiveBox` below uses this
smaller phase box.
-/
def positiveBoxTMin : ℝ := (1641 : ℝ) / 50

/-- Upper imaginary edge of the refined phase-positive subbox. -/
def positiveBoxTMax : ℝ := (1643 : ℝ) / 50

/-- Selected horizontal cutoff parameter. -/
def positiveBoxN : ℕ := 50

/-- Selected rectangular depth parameter. -/
def positiveBoxK : ℕ := 3

/-- Selected rectangular width parameter. -/
def positiveBoxM : ℕ := 50

/-- The selected positive-pocket subbox. -/
def positiveBox : Set ℂ :=
  fun s =>
    positiveBoxSigmaMin ≤ s.re ∧ s.re ≤ positiveBoxSigmaMax ∧
      positiveBoxTMin ≤ s.im ∧ s.im ≤ positiveBoxTMax

/--
Conservative anchor upper candidate attached to the selected box.

This rational is larger than the sampled diagnostic maximum.  The Lean theorem
below still requires a real interval bound field.
-/
def positiveBoxAnchorUpperValue : ℝ :=
  (1 : ℝ) / 125

/--
Conservative cutoff-vector upper candidate attached to the selected box.

This rational is larger than the sampled diagnostic maximum.  The Lean theorem
below still requires a real interval bound field.
-/
def positiveBoxCutUpperValue : ℝ :=
  (3 : ℝ) / 1000

/--
Conservative sector lower candidate attached to the selected box.

The earlier diagnostic report mixed the sampled and guarded values from
different rows.  This rational is below the sampled lower on the selected grid,
but the Lean theorem below still requires a real sector-lower field.
-/
def positiveBoxSectorLowerValue : ℝ :=
  (819 : ℝ) / 1000

/-- Constant anchor upper function for the selected box. -/
def positiveBoxAnchorUpper : ℂ → ℝ :=
  fun _ => positiveBoxAnchorUpperValue

/-- Constant cutoff-vector upper function for the selected box. -/
def positiveBoxCutUpper : ℂ → ℝ :=
  fun _ => positiveBoxCutUpperValue

/-- Constant sector lower function for the selected box. -/
def positiveBoxSectorLower : ℂ → ℝ :=
  fun _ => positiveBoxSectorLowerValue

/--
Candidate positive-box certificate.

All analytic and interval content remains conditional:

* `anchor_bound` is the future interval proof for the anchor;
* `cut_bound` is the future interval proof for the cutoff vector;
* `sector_lower` is the future sector proof for the quartet prefix;
* `ledger_strict` is the future scalar ledger proof over the whole box.
-/
structure PositiveBoxCertificate : Prop where
  anchor_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖anchor s‖ ≤ positiveBoxAnchorUpperValue
  cut_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
  sector_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖
  ledger_strict :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      vSplitResidualLedgerQRatio
          positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
        c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s

/-- Convert the positive-box certificate into the generic regional upper data. -/
def PositiveBoxCertificate.toAnchorUpperData
    (cert : PositiveBoxCertificate) :
    AnchorUpperData
      positiveBoxK positiveBoxM positiveBox
      positiveBoxAnchorUpper positiveBoxCutUpper positiveBoxSectorLower where
  anchor_bound := by
    intro s hs
    simpa [positiveBoxAnchorUpper] using cert.anchor_bound hs
  cut_bound := by
    intro s hs
    simpa [positiveBoxCutUpper] using cert.cut_bound hs
  sector_lower := by
    intro s hs
    simpa [positiveBoxSectorLower] using cert.sector_lower hs

/--
Main audit theorem for the selected positive box.

If the interval/sector fields in `PositiveBoxCertificate` are supplied, then
the current q-ratio V-split sector residual dominance holds throughout this
box.  This remains audit-only and does not promote the box to the main route.
-/
theorem positiveBox_qratio_sectorResidualDominance
    (cert : PositiveBoxCertificate) {s : ℂ} (hs : s ∈ positiveBox) :
    C2ExpandedQuartetSectorResidualDominance
      positiveBoxSectorLower
      (vSplitTiltConstantQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
      unitScale
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      positiveBoxCutUpper unitScale s :=
  vSplitQRatio_sectorResidualDominance_of_upperData
    (N := positiveBoxN) (K := positiveBoxK) (M := positiveBoxM)
    (anchorUpper := positiveBoxAnchorUpper)
    (cutUpper := positiveBoxCutUpper)
    (Lsector := positiveBoxSectorLower)
    cert.toAnchorUpperData hs (cert.ledger_strict hs)

/--
True-prefix audit consequence for the selected positive box.

This uses the supplied sector lower to compare the sector margin against the
actual quartet-prefix margin, but it is still conditional on the certificate
fields above.
-/
theorem positiveBox_qratio_truePrefixResidualDominance
    (cert : PositiveBoxCertificate) {s : ℂ} (hs : s ∈ positiveBox) :
    c2ExpandedQuartetResidualUpper
        (vSplitTiltConstantQRatio
          positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
        unitScale
        (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
        unitScale qNormHorizontalRatio
        positiveBoxCutUpper unitScale s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s :=
  vSplitQRatio_truePrefixResidualDominance_of_sectorUpperData
    (N := positiveBoxN) (K := positiveBoxK) (M := positiveBoxM)
    (anchorUpper := positiveBoxAnchorUpper)
    (cutUpper := positiveBoxCutUpper)
    (Lsector := positiveBoxSectorLower)
    cert.toAnchorUpperData hs (cert.ledger_strict hs)

end

end ContinuedQuartetAudit
end C2
