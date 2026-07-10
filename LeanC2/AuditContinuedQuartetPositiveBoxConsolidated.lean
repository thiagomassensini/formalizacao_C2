import LeanC2.AuditContinuedQuartetPositiveBoxSector
import LeanC2.AuditContinuedQuartetPositiveBoxCutoff

/-!
# Consolidated positive box audit certificate

Audit-only consolidation for the refined positive box.

This file packages the already closed q and sector data with the cutoff bridge.
The remaining channel-sensitive fields stay explicit.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/--
Remaining channel-sensitive data for the refined positive box.

The q endpoint, q phase, and sector lower fields are supplied by existing
closed audit data.  The cutoff field is stated through the exact upper bridge.
-/
structure PositiveBoxRemainingChannelData : Prop where
  anchor_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖anchor s‖ ≤ positiveBoxAnchorUpperValue
  cutoff_upper_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s ≤
        positiveBoxCutUpperValue
  odd_truncation_or_horizontal_bound : PositiveBoxOddTruncationData

/-- Extract the cutoff bridge data from the consolidated pending fields. -/
def PositiveBoxRemainingChannelData.cutoffUpperData
    (data : PositiveBoxRemainingChannelData) :
    PositiveBoxCutoffUpperData where
  cutoff_upper_bound := data.cutoff_upper_bound

/-- Rebuild the selected scalar ledger data from the remaining source field. -/
def PositiveBoxRemainingChannelData.ledgerBounds
    (data : PositiveBoxRemainingChannelData) :
    PositiveBoxLedgerBounds :=
  PositiveBoxLedgerBounds.ofEndpointQAndOddTruncation
    positiveBoxQEndpointData data.odd_truncation_or_horizontal_bound

/--
Consolidated positive-box certificate.

Closed inputs used here:
* q endpoints from `positiveBoxQEndpointData`;
* q phase and sector lower from `positiveBoxSectorFactorData`;
* cutoff bridge from `PositiveBoxCutoffUpperData`.
-/
def positiveBox_certificate_of_remainingChannelData
    (data : PositiveBoxRemainingChannelData) :
    PositiveBoxCertificate :=
  PositiveBoxCertificate.withSectorLower
    positiveBoxSectorFactorData
    data.ledgerBounds
    data.anchor_bound
    data.cutoffUpperData.cut_bound

/--
Audit-only true-prefix residual dominance from the consolidated pending data.
-/
def positiveBox_qratio_truePrefixResidualDominance_of_remainingChannelData
    (data : PositiveBoxRemainingChannelData)
    {s : ℂ} (hs : s ∈ positiveBox) :=
  positiveBox_qratio_truePrefixResidualDominance
    (positiveBox_certificate_of_remainingChannelData data) hs

end

end ContinuedQuartetAudit
end C2
