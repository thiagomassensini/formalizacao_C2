import LeanC2.AuditGenuineMiddleExactGapFrontier

namespace C2.PeerReview

/-!
Public, audit-facing endpoints for the C2 genuine middle route.

The first endpoint below exposes the compressed canonical terminal surface used
by the audit files.  The exact-gap ledger certificates that follow are kept as
compatibility and diagnostic routes; they are not the preferred active target.
-/

/-- Canonical near-axis package obtained directly from genuine continuation data. -/
noncomputable def canonicalNearAxisData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (continuation : GenuineFInfiniteContinuationData) :
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
    (coreCutoff := coreCutoff) (K := K) (M := M)
    continuation
    (GenuineFInfiniteNearAxisData.of_continuation continuation)

/-- Canonical empty edge package for the continued balancing-seed bulk model. -/
def canonicalEdgeData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
    (coreCutoff := coreCutoff) (K := K) (M := M)

/-- The public middle region used by the current quarter-unit route. -/
abbrev CurrentMiddleRegion
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (continuation : GenuineFInfiniteContinuationData) : Set ℂ :=
  c2ExpandedScalarMiddleRegion
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Pointwise canonical middle obligation left after continuation supplies the
canonical near-axis package and the current route uses the empty edge package.
-/
abbrev CanonicalMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s

/--
Audit-facing terminal certificate matching the compressed canonical endpoint:
continuation plus the local canonical middle obligation.
-/
structure ContinuationTerminalCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  middle :
    CanonicalMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/-- Convert the public continuation certificate to the internal terminal package. -/
noncomputable def ContinuationTerminalCertificate.toTerminalData
    (cert : ContinuationTerminalCertificate) :
    RiemannHypothesisTerminalData :=
  RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal
    (coreCutoff := cert.coreCutoff) (K := cert.K) (M := cert.M)
    (horizontalConstant := cert.horizontalConstant)
    (horizontalScale := cert.horizontalScale)
    (horizontalRatio := cert.horizontalRatio)
    cert.continuation
    cert.middle

/-- Public terminal endpoint for the compressed canonical certificate. -/
theorem riemannHypothesis_of_continuationTerminalCertificate
    (cert : ContinuationTerminalCertificate) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_terminalData cert.toTerminalData

/--
Current middle obligation: the canonical phase-aware collected slack is positive
throughout the canonical middle region.
-/
abbrev CollectedSlackMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Public certificate for the active exact-gap collected-slack middle route.
-/
structure CollectedSlackMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  collectedSlack :
    CollectedSlackMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/--
A collected-slack middle certificate gives nonvanishing of the genuine central
double series on the canonical middle region.
-/
theorem CollectedSlackMiddleCertificate.nonvanishing
    (cert : CollectedSlackMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  open C2.GenuineMiddleAudit in
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollectedSlack
    (coreCutoff := cert.coreCutoff) (K := cert.K) (M := cert.M)
    (tiltConstant := cert.tiltConstant)
    (tiltScale := cert.tiltScale)
    (horizontalConstant := cert.horizontalConstant)
    (horizontalScale := cert.horizontalScale)
    (horizontalRatio := cert.horizontalRatio)
    (cutoffScale := cert.cutoffScale)
    (near := canonicalNearAxisData
      cert.coreCutoff cert.K cert.M cert.continuation)
    (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
    cert.scale cert.horizontal cert.collectedSlack

/-- Public spelling for the current middle nonvanishing endpoint. -/
theorem genuineCentral_ne_zero_of_collectedSlackMiddleCertificate
    (cert : CollectedSlackMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Next refined middle obligation: the prototype dyadic atlas covers the exact
external/lower-factor pressure ratios throughout the canonical middle region.
-/
abbrev PrototypeRatioBoundsMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Public certificate for the refined prototype ratio-bounds cover route.
-/
structure PrototypeRatioBoundsMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  ratioBounds :
    PrototypeRatioBoundsMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/--
A prototype ratio-bounds certificate induces the current collected-slack
certificate.
-/
def PrototypeRatioBoundsMiddleCertificate.toCollectedSlackCertificate
    (cert : PrototypeRatioBoundsMiddleCertificate) :
    CollectedSlackMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  collectedSlack :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_closedPrototypeRatioBoundsCover
      (K := cert.K) (M := cert.M)
      (horizontalConstant := cert.horizontalConstant)
      (horizontalScale := cert.horizontalScale)
      (horizontalRatio := cert.horizontalRatio)
      (near := canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
      cert.ratioBounds

/--
A prototype ratio-bounds certificate gives nonvanishing of the genuine central
double series on the canonical middle region.
-/
theorem PrototypeRatioBoundsMiddleCertificate.nonvanishing
    (cert : PrototypeRatioBoundsMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the refined prototype ratio-bounds endpoint. -/
theorem genuineCentral_ne_zero_of_prototypeRatioBoundsMiddleCertificate
    (cert : PrototypeRatioBoundsMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Finer middle obligation: the division-free prototype pressure payment closes
against `3/4` of the exact cleared margin throughout the canonical middle.
-/
abbrev PrototypeClearedTotalMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Five-bill spelling of the cleared-total obligation: genuine central, continued
central, horizontal, cutoff, and lower-factor pressures fit under `3/4`.
-/
abbrev PrototypeComponentSumMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Diagnostic spelling of the five-bill target: after the exact central,
horizontal, and cutoff bills are paid, the exact lower-factor bill fits in the
remaining normalized slack.
-/
abbrev LowerFactorAfterCutoffSlackMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
        s ≤
      GenuineMiddleAudit.c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
        K M horizontalConstant horizontalScale horizontalRatio s

/--
The public cleared-total target is exactly the five-bill normalized target.
-/
theorem
    PrototypeClearedTotalMiddleObligation_iff_componentSumMiddleObligation
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {continuation : GenuineFInfiniteContinuationData} :
    PrototypeClearedTotalMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation ↔
      PrototypeComponentSumMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation := by
  unfold PrototypeClearedTotalMiddleObligation
  unfold PrototypeComponentSumMiddleObligation
  exact
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_componentSumOnMiddle

/--
The five-bill normalized target is exactly the lower-factor-after-cutoff slack
target.  This is the most direct diagnostic for deciding which component needs
refinement next.
-/
theorem
    PrototypeComponentSumMiddleObligation_iff_lowerFactorAfterCutoffSlack
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {continuation : GenuineFInfiniteContinuationData} :
    PrototypeComponentSumMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation ↔
      LowerFactorAfterCutoffSlackMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation := by
  unfold PrototypeComponentSumMiddleObligation
  unfold LowerFactorAfterCutoffSlackMiddleObligation
  exact
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalComponentSumOnMiddle_iff_lowerFactor_le_slack

/--
The public cleared-total target is exactly the lower-factor-after-cutoff slack
target.
-/
theorem
    PrototypeClearedTotalMiddleObligation_iff_lowerFactorAfterCutoffSlack
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {continuation : GenuineFInfiniteContinuationData} :
    PrototypeClearedTotalMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation ↔
      LowerFactorAfterCutoffSlackMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation :=
  (PrototypeClearedTotalMiddleObligation_iff_componentSumMiddleObligation
    (coreCutoff := coreCutoff) (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (continuation := continuation)).trans
    (PrototypeComponentSumMiddleObligation_iff_lowerFactorAfterCutoffSlack
      (coreCutoff := coreCutoff) (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (continuation := continuation))

/--
Public certificate for the refined division-free cleared-total route.
-/
structure PrototypeClearedTotalMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  clearedTotal :
    PrototypeClearedTotalMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/--
A cleared-total certificate induces the previous prototype ratio-bounds
certificate.
-/
def PrototypeClearedTotalMiddleCertificate.toPrototypeRatioBoundsCertificate
    (cert : PrototypeClearedTotalMiddleCertificate) :
    PrototypeRatioBoundsMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  ratioBounds :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_totalBounds
      (C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle_of_clearedTotalBound
        cert.scale cert.clearedTotal)

/--
A cleared-total certificate induces the current collected-slack certificate.
-/
def PrototypeClearedTotalMiddleCertificate.toCollectedSlackCertificate
    (cert : PrototypeClearedTotalMiddleCertificate) :
    CollectedSlackMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  collectedSlack :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeClearedTotalBound
      (K := cert.K) (M := cert.M)
      (tiltConstant := cert.tiltConstant)
      (tiltScale := cert.tiltScale)
      (horizontalConstant := cert.horizontalConstant)
      (horizontalScale := cert.horizontalScale)
      (horizontalRatio := cert.horizontalRatio)
      (cutoffScale := cert.cutoffScale)
      (near := canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
      cert.scale cert.clearedTotal

/--
A cleared-total certificate gives nonvanishing of the genuine central double
series on the canonical middle region.
-/
theorem PrototypeClearedTotalMiddleCertificate.nonvanishing
    (cert : PrototypeClearedTotalMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the refined cleared-total endpoint. -/
theorem genuineCentral_ne_zero_of_prototypeClearedTotalMiddleCertificate
    (cert : PrototypeClearedTotalMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Finest current middle obligation: after the exact external debit and
lower-factor cost are paid, at least one quarter of the cleared margin remains.
-/
abbrev PrototypeSurplusReserveMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Public certificate for the one-quarter surplus-reserve route.
-/
structure PrototypeSurplusReserveMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  surplusReserve :
    PrototypeSurplusReserveMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/--
A surplus-reserve certificate induces the cleared-total certificate.
-/
def PrototypeSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
    (cert : PrototypeSurplusReserveMiddleCertificate) :
    PrototypeClearedTotalMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  clearedTotal :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve
      cert.surplusReserve

/--
A surplus-reserve certificate induces the current collected-slack certificate.
-/
def PrototypeSurplusReserveMiddleCertificate.toCollectedSlackCertificate
    (cert : PrototypeSurplusReserveMiddleCertificate) :
    CollectedSlackMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  collectedSlack :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
      (K := cert.K) (M := cert.M)
      (tiltConstant := cert.tiltConstant)
      (tiltScale := cert.tiltScale)
      (horizontalConstant := cert.horizontalConstant)
      (horizontalScale := cert.horizontalScale)
      (horizontalRatio := cert.horizontalRatio)
      (cutoffScale := cert.cutoffScale)
      (near := canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
      cert.scale cert.surplusReserve

/--
A surplus-reserve certificate gives nonvanishing of the genuine central double
series on the canonical middle region.
-/
theorem PrototypeSurplusReserveMiddleCertificate.nonvanishing
    (cert : PrototypeSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the one-quarter surplus-reserve endpoint. -/
theorem genuineCentral_ne_zero_of_prototypeSurplusReserveMiddleCertificate
    (cert : PrototypeSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Operational bounded-envelope obligation for the surplus-reserve target.
-/
abbrev BoundedSurplusReserveMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (marginUpper surplusLower : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
    marginUpper surplusLower
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Public certificate for the bounded-envelope surplus-reserve route.

This is the current smallest practical target: upper-bound the cleared margin,
lower-bound the surplus, then prove the lower surplus pays one quarter of the
upper margin.
-/
structure BoundedSurplusReserveMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  marginUpper : ℂ → ℝ
  surplusLower : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  marginUpper_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
      marginUpper
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  surplusLower_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio surplusLower
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  boundedLedger :
    BoundedSurplusReserveMiddleObligation
      coreCutoff K M marginUpper surplusLower continuation

/--
A bounded-envelope certificate induces the surplus-reserve certificate.
-/
def BoundedSurplusReserveMiddleCertificate.toPrototypeSurplusReserveCertificate
    (cert : BoundedSurplusReserveMiddleCertificate) :
    PrototypeSurplusReserveMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  surplusReserve :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_boundedLedger
      cert.marginUpper_bound cert.surplusLower_bound cert.boundedLedger

/--
A bounded-envelope certificate induces the current collected-slack certificate.
-/
def BoundedSurplusReserveMiddleCertificate.toCollectedSlackCertificate
    (cert : BoundedSurplusReserveMiddleCertificate) :
    CollectedSlackMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  collectedSlack :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_boundedSurplusReserve
      (K := cert.K) (M := cert.M)
      (tiltConstant := cert.tiltConstant)
      (tiltScale := cert.tiltScale)
      (horizontalConstant := cert.horizontalConstant)
      (horizontalScale := cert.horizontalScale)
      (horizontalRatio := cert.horizontalRatio)
      (cutoffScale := cert.cutoffScale)
      (marginUpper := cert.marginUpper)
      (surplusLower := cert.surplusLower)
      (near := canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
      cert.scale cert.marginUpper_bound cert.surplusLower_bound
      cert.boundedLedger

/--
A bounded-envelope certificate gives nonvanishing of the genuine central double
series on the canonical middle region.
-/
theorem BoundedSurplusReserveMiddleCertificate.nonvanishing
    (cert : BoundedSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the bounded-envelope surplus-reserve endpoint. -/
theorem genuineCentral_ne_zero_of_boundedSurplusReserveMiddleCertificate
    (cert : BoundedSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Component-refined surplus-reserve obligation.

Instead of choosing an opaque surplus lower envelope, this target builds it as
`marginLower - externalDebitUpper - lowerFactorCostUpper`.
-/
abbrev ComponentSurplusReserveMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (marginUpper marginLower externalDebitUpper
      lowerFactorCostUpper : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
    marginUpper marginLower externalDebitUpper lowerFactorCostUpper
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Public certificate for the component-refined surplus-reserve route.
-/
structure ComponentSurplusReserveMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  marginUpper : ℂ → ℝ
  marginLower : ℂ → ℝ
  externalDebitUpper : ℂ → ℝ
  lowerFactorCostUpper : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  marginUpper_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
      marginUpper
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  marginLower_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
      marginLower
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  externalDebitUpper_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio externalDebitUpper
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  lowerFactorCostUpper_bound :
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
      lowerFactorCostUpper
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M)
  componentLedger :
    ComponentSurplusReserveMiddleObligation
      coreCutoff K M marginUpper marginLower externalDebitUpper
      lowerFactorCostUpper continuation

/--
A component-refined certificate induces the bounded-envelope certificate.
-/
noncomputable def ComponentSurplusReserveMiddleCertificate.toBoundedSurplusReserveCertificate
    (cert : ComponentSurplusReserveMiddleCertificate) :
    BoundedSurplusReserveMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  marginUpper := cert.marginUpper
  surplusLower :=
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
      cert.marginLower cert.externalDebitUpper cert.lowerFactorCostUpper
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  marginUpper_bound := cert.marginUpper_bound
  surplusLower_bound :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle_of_components
      cert.marginLower_bound cert.externalDebitUpper_bound
      cert.lowerFactorCostUpper_bound
  boundedLedger :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle_of_componentLedger
      cert.componentLedger

/--
A component-refined certificate induces the current collected-slack certificate.
-/
noncomputable def ComponentSurplusReserveMiddleCertificate.toCollectedSlackCertificate
    (cert : ComponentSurplusReserveMiddleCertificate) :
    CollectedSlackMiddleCertificate :=
  cert.toBoundedSurplusReserveCertificate.toCollectedSlackCertificate

/--
A component-refined certificate gives nonvanishing of the genuine central double
series on the canonical middle region.
-/
theorem ComponentSurplusReserveMiddleCertificate.nonvanishing
    (cert : ComponentSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the component-refined surplus-reserve endpoint. -/
theorem genuineCentral_ne_zero_of_componentSurplusReserveMiddleCertificate
    (cert : ComponentSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Sharp no-loss component obligation: every envelope is chosen as the exact
corresponding component.  This is the most refined baseline before introducing
numerical or analytic upper/lower replacements.
-/
abbrev ExactComponentSurplusReserveMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  ComponentSurplusReserveMiddleObligation
    coreCutoff K M
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedMargin
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedMargin
    (GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio)
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedLowerFactorCost
    continuation

/--
The sharp no-loss component obligation is exactly the cleared-total cash
obligation.  This proves the exact reserve account is a no-loss rewriting, not
a weaker or stronger target.
-/
theorem
    ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {continuation : GenuineFInfiniteContinuationData} :
    ExactComponentSurplusReserveMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation ↔
      PrototypeClearedTotalMiddleObligation
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio
        continuation := by
  unfold ExactComponentSurplusReserveMiddleObligation
  unfold ComponentSurplusReserveMiddleObligation
  unfold PrototypeClearedTotalMiddleObligation
  exact
    GenuineMiddleAudit.C2ExactGapAnchorCanonicalExactComponentLedgerOnMiddle_iff_clearedTotalBound

/--
Public certificate for the sharp no-loss component surplus-reserve route.
-/
structure ExactComponentSurplusReserveMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  componentLedger :
    ExactComponentSurplusReserveMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      continuation

/--
A sharp no-loss component certificate induces the cleared-total certificate.
-/
noncomputable def
    ExactComponentSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
    (cert : ExactComponentSurplusReserveMiddleCertificate) :
    PrototypeClearedTotalMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  clearedTotal :=
    ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation.1
      cert.componentLedger

/--
A cleared-total certificate induces the sharp no-loss component certificate.
-/
noncomputable def
    PrototypeClearedTotalMiddleCertificate.toExactComponentSurplusReserveCertificate
    (cert : PrototypeClearedTotalMiddleCertificate) :
    ExactComponentSurplusReserveMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  componentLedger :=
    ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation.2
      cert.clearedTotal

/--
The sharp no-loss certificate is a component-refined certificate with exact
upper/lower envelopes.
-/
noncomputable def ExactComponentSurplusReserveMiddleCertificate.toComponentSurplusReserveCertificate
    (cert : ExactComponentSurplusReserveMiddleCertificate) :
    ComponentSurplusReserveMiddleCertificate where
  coreCutoff := cert.coreCutoff
  K := cert.K
  M := cert.M
  tiltConstant := cert.tiltConstant
  tiltScale := cert.tiltScale
  horizontalConstant := cert.horizontalConstant
  horizontalScale := cert.horizontalScale
  horizontalRatio := cert.horizontalRatio
  cutoffScale := cert.cutoffScale
  marginUpper := GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedMargin
  marginLower := GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedMargin
  externalDebitUpper :=
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedExternalDebit
      cert.K cert.M cert.horizontalConstant cert.horizontalScale
      cert.horizontalRatio
  lowerFactorCostUpper :=
    GenuineMiddleAudit.c2ExactGapAnchorCanonicalClearedLowerFactorCost
  continuation := cert.continuation
  scale := cert.scale
  horizontal := cert.horizontal
  marginUpper_bound :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle_exact
      (canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (canonicalEdgeData cert.coreCutoff cert.K cert.M)
  marginLower_bound :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_exact
      (canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (canonicalEdgeData cert.coreCutoff cert.K cert.M)
  externalDebitUpper_bound :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle_exact
      (canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (canonicalEdgeData cert.coreCutoff cert.K cert.M)
  lowerFactorCostUpper_bound :=
    open C2.GenuineMiddleAudit in
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle_exact
      (canonicalNearAxisData
        cert.coreCutoff cert.K cert.M cert.continuation)
      (canonicalEdgeData cert.coreCutoff cert.K cert.M)
  componentLedger := cert.componentLedger

/--
A sharp no-loss component certificate induces the current collected-slack
certificate.
-/
noncomputable def ExactComponentSurplusReserveMiddleCertificate.toCollectedSlackCertificate
    (cert : ExactComponentSurplusReserveMiddleCertificate) :
    CollectedSlackMiddleCertificate :=
  cert.toComponentSurplusReserveCertificate.toCollectedSlackCertificate

/--
A sharp no-loss component certificate gives nonvanishing of the genuine central
double series on the canonical middle region.
-/
theorem ExactComponentSurplusReserveMiddleCertificate.nonvanishing
    (cert : ExactComponentSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.toCollectedSlackCertificate.nonvanishing

/-- Public spelling for the sharp no-loss component endpoint. -/
theorem genuineCentral_ne_zero_of_exactComponentSurplusReserveMiddleCertificate
    (cert : ExactComponentSurplusReserveMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

/--
Compatible middle obligation: the exact lower factor fits in the cleared
quarter-unit reserve throughout the canonical middle region.
-/
abbrev QuarterUnitMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  GenuineMiddleAudit.C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    (canonicalNearAxisData coreCutoff K M continuation)
    (canonicalEdgeData coreCutoff K M)

/--
Compatible certificate for the quarter-unit exact-gap anchor middle route.

The fields are exactly the ingredients required by the quarter-unit wrapper:
scale data, horizontal layer control, and the quarter-unit reserve budget.
-/
structure QuarterUnitMiddleCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  tiltConstant : ℂ → ℝ
  tiltScale : ℂ → ℝ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  cutoffScale : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  scale : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedScalarScaleData
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale s
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ CurrentMiddleRegion coreCutoff K M continuation →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  quarterUnit :
    QuarterUnitMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation

/--
A quarter-unit middle certificate gives nonvanishing of the genuine central
double series on the canonical middle region.
-/
theorem QuarterUnitMiddleCertificate.nonvanishing
    (cert : QuarterUnitMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
    (coreCutoff := cert.coreCutoff) (K := cert.K) (M := cert.M)
    (tiltConstant := cert.tiltConstant)
    (tiltScale := cert.tiltScale)
    (horizontalConstant := cert.horizontalConstant)
    (horizontalScale := cert.horizontalScale)
    (horizontalRatio := cert.horizontalRatio)
    (cutoffScale := cert.cutoffScale)
    (near := canonicalNearAxisData
      cert.coreCutoff cert.K cert.M cert.continuation)
    (edge := canonicalEdgeData cert.coreCutoff cert.K cert.M)
    cert.scale cert.horizontal cert.quarterUnit

/-- Public spelling for the current middle nonvanishing endpoint. -/
theorem genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
    (cert : QuarterUnitMiddleCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ CurrentMiddleRegion cert.coreCutoff cert.K cert.M cert.continuation →
      genuineCentralDoubleSeries s ≠ 0 :=
  cert.nonvanishing

end C2.PeerReview
