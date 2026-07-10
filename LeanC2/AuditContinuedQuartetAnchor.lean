import LeanC2.AuditContinuedQuartetVSplit

/-!
# Continued quartet anchor audit

Audit-only infrastructure for the remaining `anchor` bottleneck in the
continued-quartet V-split route.  This file does not promote anything to the
main route and does not introduce numerical assumptions.
-/

namespace C2
namespace ContinuedQuartetAudit

/-- The audit `anchor` is definitionally `tau - continuedCentralOddChannel`. -/
theorem anchor_eq_tau_sub_continuedCentral (s : ℂ) :
    anchor s = verticalDepthTailFromTwo s - continuedCentralOddChannel s := by
  rfl

/-- Factorized form of the audit anchor. -/
theorem anchor_eq_tau_mul_one_sub_two_oddChannel (s : ℂ) :
    anchor s =
      verticalDepthTailFromTwo s *
        (1 - (2 : ℂ) * continuedOddDirichletChannel s) := by
  rw [anchor_eq_continuedVerticalChannelAnchor,
    continuedVerticalChannelAnchor_eq_factorized]

/-- Exact norm factorization attached to the algebraic anchor identity. -/
theorem anchor_norm_eq_tau_norm_mul_factor (s : ℂ) :
    ‖anchor s‖ =
      ‖verticalDepthTailFromTwo s‖ *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
  rw [anchor_eq_tau_mul_one_sub_two_oddChannel, norm_mul]

/--
Abstract regional data for the anchor bottleneck audit.

The `sector_lower` field is deliberately conditional: it records the lower
bound that a future interval/sector proof would need to supply.
-/
structure AnchorUpperData
    (K M : ℕ) (region : Set ℂ)
    (anchorUpper cutUpper Lsector : ℂ → ℝ) : Prop where
  anchor_bound : ∀ ⦃s : ℂ⦄, s ∈ region → ‖anchor s‖ ≤ anchorUpper s
  cut_bound : ∀ ⦃s : ℂ⦄, s ∈ region → ‖cutVec K M s‖ ≤ cutUpper s
  sector_lower : ∀ ⦃s : ℂ⦄,
    s ∈ region → Lsector s ≤ ‖verticalQuartetPrefix (q s)‖

theorem AnchorUpperData.bound
    {K M : ℕ} {region : Set ℂ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    {s : ℂ} (hs : s ∈ region) :
    ‖anchor s‖ ≤ anchorUpper s :=
  data.anchor_bound hs

theorem AnchorUpperData.cut_bound'
    {K M : ℕ} {region : Set ℂ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    {s : ℂ} (hs : s ∈ region) :
    ‖cutVec K M s‖ ≤ cutUpper s :=
  data.cut_bound hs

theorem AnchorUpperData.sectorLower
    {K M : ℕ} {region : Set ℂ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    {s : ℂ} (hs : s ∈ region) :
    QuartetPrefixSectorLower Lsector s :=
  data.sector_lower hs

/--
Direct-balanced audit ledger:

`anchor + cutVec + 2 * H + Cut`

This is intentionally not the public residual upper.  It records the numerical
diagnostic that removes the current seed resolvent tax.
-/
noncomputable def vSplitDirectBalancedLedgerQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    anchorUpper s + cutUpper s +
      2 * constantCoreHorizontalUpperQRatio N s +
      cutUpper s

/--
Audit-only direct-balanced sector dominance.  This is not
`C2ExpandedQuartetDominance`; promoting it would require a new theorem showing
that the direct-balanced ledger controls the actual bulk residual.
-/
def VSplitDirectBalancedSectorAuditDominance
    (N : ℕ) (anchorUpper cutUpper Lsector : ℂ → ℝ) (s : ℂ) : Prop :=
  vSplitDirectBalancedLedgerQRatio N anchorUpper cutUpper s <
    c2ExpandedQuartetSectorResidualMargin Lsector s

/--
Worst-case residual-margin dominance from abstract regional `anchor` and
`cutVec` uppers.
-/
theorem vSplitQRatio_quartetDominance_of_upperData
    {region : Set ℂ} {N K M : ℕ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ} {s : ℂ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    (hs : s ∈ region)
    (hledger :
      vSplitResidualLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExpandedQuartetDominance
      (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
      (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
      cutUpper unitScale s :=
  vSplitQRatio_quartetDominance_of_ledger
    (N := N) (K := K) (M := M)
    (anchorUpper := anchorUpper) (cutUpper := cutUpper)
    (data.bound hs) (data.cut_bound' hs) hledger

/--
Sector-margin residual dominance from abstract regional uppers.  This records
the sector ledger only; public quartet dominance still requires the public
worst-case residual margin.
-/
theorem vSplitQRatio_sectorResidualDominance_of_upperData
    {region : Set ℂ} {N K M : ℕ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ} {s : ℂ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    (hs : s ∈ region)
    (hledger :
      vSplitResidualLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetSectorResidualMargin Lsector s) :
    C2ExpandedQuartetSectorResidualDominance
      Lsector
      (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
      (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
      cutUpper unitScale s := by
  have _hvertical :
      c2ContinuedVerticalResidualExactUpper K M s ≤
        anchorUpper s + cutUpper s :=
    c2ContinuedVerticalResidualExactUpper_le_vSplitUpper
      (data.bound hs) (data.cut_bound' hs)
  unfold C2ExpandedQuartetSectorResidualDominance
  change vSplitResidualUpperQRatio N anchorUpper cutUpper s <
    c2ExpandedQuartetSectorResidualMargin Lsector s
  rw [vSplitResidualUpperQRatio_eq_ledger]
  exact hledger

/--
Sector-margin ledger transported to the true quartet-prefix residual statement,
assuming the supplied sector lower is certified.
-/
theorem vSplitQRatio_truePrefixResidualDominance_of_sectorUpperData
    {region : Set ℂ} {N K M : ℕ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ} {s : ℂ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    (hs : s ∈ region)
    (hledger :
      vSplitResidualLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetSectorResidualMargin Lsector s) :
    c2ExpandedQuartetResidualUpper
        (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
        (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
        cutUpper unitScale s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s := by
  exact truePrefixResidualDominance_of_sectorResidualDominance
    (data.sectorLower hs)
    (vSplitQRatio_sectorResidualDominance_of_upperData
      (N := N) (K := K) (M := M)
      (anchorUpper := anchorUpper) (cutUpper := cutUpper)
      (Lsector := Lsector)
      data hs hledger)

/--
Direct-balanced sector audit from the regional upper data.  This theorem only
packages the diagnostic inequality; it is not a public route dominance theorem.
-/
theorem vSplitDirectBalanced_sectorAuditDominance_of_upperData
    {region : Set ℂ} {N K M : ℕ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ} {s : ℂ}
    (_data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    (_hs : s ∈ region)
    (hledger :
      vSplitDirectBalancedLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetSectorResidualMargin Lsector s) :
    VSplitDirectBalancedSectorAuditDominance
      N anchorUpper cutUpper Lsector s :=
  hledger

/--
The direct-balanced audit ledger is safe against the true quartet-prefix margin
once a sector lower is supplied.  It still remains audit-only because the
direct-balanced ledger has not been proved to control the public bulk residual.
-/
theorem vSplitDirectBalanced_truePrefixAuditDominance_of_upperData
    {region : Set ℂ} {N K M : ℕ}
    {anchorUpper cutUpper Lsector : ℂ → ℝ} {s : ℂ}
    (data : AnchorUpperData K M region anchorUpper cutUpper Lsector)
    (hs : s ∈ region)
    (hledger :
      vSplitDirectBalancedLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetSectorResidualMargin Lsector s) :
    vSplitDirectBalancedLedgerQRatio N anchorUpper cutUpper s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s := by
  exact lt_of_lt_of_le hledger
    (c2ExpandedQuartetSectorResidualMargin_le_trueResidualMargin
      (data.sectorLower hs))

end ContinuedQuartetAudit
end C2
