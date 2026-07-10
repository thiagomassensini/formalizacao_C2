import LeanC2.AuditGenuineMiddle

/-!
# Exact-gap middle frontier

This audit module compresses the currently preferred genuine-first middle
route.  The exact normalized anchor residual factor is fixed as the upper
envelope, so the remaining analytic work is to produce a lower envelope for the
exact gap-anchor allowance and prove the strict factor/lower comparison on the
middle region.
-/

namespace C2
namespace GenuineMiddleAudit

/--
Canonical upper/lower middle data for the exact-gap anchor route.

The upper side is fixed to
`c2ContinuedVerticalAnchorResidualExactFactorUpper`; this avoids introducing an
extra artificial gap envelope.  After horizontal geometry, the live obligations
are the allowance lower bound and the strict exact-factor/lower budget.
-/
structure C2ExactGapAnchorCanonicalUpperLowerMiddleData
    {coreCutoff : ℕ → ℕ} (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop where
  horizontalScale_pos : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s
  horizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1
  horizontal : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s
  allowance_lower :
    C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      allowanceLower near edge
  exact_factor_upper_lower :
    C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
      c2ContinuedVerticalAnchorResidualExactFactorUpper
      allowanceLower near edge

/-- Build the canonical frontier from existing scale data. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge) :
    C2ExactGapAnchorCanonicalUpperLowerMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      allowanceLower near edge where
  horizontalScale_pos := fun {s} hs =>
    (hscale (s := s) hs).horizontalScale_pos
  horizontalConstant_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalConstant_nonneg
  horizontalRatio_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_nonneg
  horizontalRatio_lt_one := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_lt_one
  horizontal := hhorizontal
  allowance_lower := hallow
  exact_factor_upper_lower := hbudget

/-- Build the canonical frontier from scale data and a scalar allowance budget. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_scalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge) :
    C2ExactGapAnchorCanonicalUpperLowerMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      allowanceLower near edge :=
  C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData
    hscale hhorizontal
    (C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle
      hallow)
    hbudget

/--
The exact-gap factor reserve lower is a valid scalar lower bound for the
gap-anchor allowance, provided it upper-bounds the non-tail external debit.
-/
theorem C2ExactGapAnchorFactorAllowanceLowerScalarBudget_of_factorReserveLower
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hdebit :
      C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound
        K M c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M)
        externalDebitUpper s) :
    C2ExactGapAnchorFactorAllowanceLowerScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        externalDebitUpper) s := by
  set r := ‖q s‖
  set g := 1 - r
  set p := 1 + r
  set V := verticalDepthTailUpper s
  set Q := c2ExpandedQuartetResidualMargin s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set C := c2RawCentralCutoffNormConstant K M s
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set Du := externalDebitUpper s
  set D :=
    c2ExactGapAnchorExactGapExpandedUpperExternalDebit
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) s
  have hp_pos : 0 < p := by
    dsimp [p, r]
    linarith [norm_nonneg (q s)]
  have hV_pos : 0 < V := by
    simpa [V] using verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  have hden_pos : 0 < p * V := mul_pos hp_pos hV_pos
  have hD_le : D ≤ Du := by
    simpa [
      C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound,
      D, Du] using hdebit
  have hreserve_le : Q * g - Du ≤ Q * g - D := by
    linarith
  have hdiv_le :
      (Q * g - Du) / (p * V) ≤ (Q * g - D) / (p * V) :=
    div_le_div_of_nonneg_right hreserve_le (le_of_lt hden_pos)
  have hmul_le :
      ((Q * g - Du) / (p * V)) * V ≤
        ((Q * g - D) / (p * V)) * V :=
    mul_le_mul_of_nonneg_right hdiv_le (le_of_lt hV_pos)
  have hright_eq :
      ((Q * g - D) / (p * V)) * V + G + Cc =
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
    have hp_ne : p ≠ 0 := ne_of_gt hp_pos
    have hV_ne : V ≠ 0 := ne_of_gt hV_pos
    have hcancel :
        ((Q * g - D) / (p * V)) * V = (Q * g - D) / p := by
      field_simp [hp_ne, hV_ne]
    rw [hcancel]
    simp only [
      c2ExactVerticalAnchorResidualNormAllowance,
      c2ExactVerticalResidualNormAllowance,
      c2ExactGapAnchorExactGapExpandedUpperExternalDebit,
      D, Q, G, Cc, p, g, r]
    field_simp [hp_ne]
    ring
  have hmain :
      ((Q * g - Du) / (p * V)) * V + G + Cc ≤
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
    linarith
  unfold C2ExactGapAnchorFactorAllowanceLowerScalarBudget
  unfold c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
    c2ExactGapAnchorExactGapExpandedUpperTailGapReserveLower
  simpa [Q, g, Du, p, V, G, Cc, r] using hmain

/-- Global middle version of the factor-reserve lower allowance budget. -/
theorem C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_factorReserveLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hdebit :
      C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M)
        externalDebitUpper near edge) :
    C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        externalDebitUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorFactorAllowanceLowerScalarBudget_of_factorReserveLower
      hs.1 (hdebit hs)

/--
The external-factor budget is the upper/lower comparison for the chosen
factor-reserve allowance lower.
-/
theorem C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_of_externalFactorBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
        externalDebitUpper near edge) :
    C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
      c2ContinuedVerticalAnchorResidualExactFactorUpper
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        externalDebitUpper) near edge := by
  intro s hs
  have hgap :
      C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget
        K M
        (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
          externalDebitUpper) s :=
    C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget_of_externalFactorBudget
      hs.1 (hbudget hs)
  simpa [
    C2ExactGapAnchorFactorUpperLowerBudget,
    C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget] using
    hgap

/--
Chosen next frontier: take the allowance lower to be the factor-reserve lower
after paying an external debit envelope.
-/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_factorReserveLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdebit :
      C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M)
        externalDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalUpperLowerMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        externalDebitUpper) near edge :=
  C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_scalarBudget
    hscale hhorizontal
    (C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_factorReserveLower
      hdebit)
    (C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_of_externalFactorBudget
      hbudget)

/-- The finest non-tail external debit available in the exact-gap ledger. -/
noncomputable def c2ExactGapAnchorCanonicalExternalDebit
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    ℂ → ℝ :=
  c2ExactGapAnchorExactGapExpandedUpperExternalDebit
    c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
    (c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio)
    (c2RawCentralCutoffNormConstant K M)

/-- Canonical weighted phase debit paid by the exact anchor factor. -/
noncomputable def c2ExactGapAnchorCanonicalPhaseDebit
    (s : ℂ) : ℝ :=
  ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s

/-- Remaining canonical reserve after paying the non-tail external debit. -/
noncomputable def c2ExactGapAnchorCanonicalPhaseReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Pointwise reserve form of the finest exact-gap budget. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalPhaseDebit s <
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the canonical phase-reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPhaseReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Pointwise upper envelope for only the canonical weighted phase debit. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseDebitUpperBound
    (phaseDebitUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalPhaseDebit s ≤ phaseDebitUpper s

/-- Global middle version of the canonical phase-debit upper envelope. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (phaseDebitUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPhaseDebitUpperBound phaseDebitUpper s

/--
Fine reserve budget after replacing only the canonical phase debit by a chosen
upper envelope.
-/
noncomputable def C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      phaseDebitUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  phaseDebitUpper s <
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the phase-debit-upper reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      phaseDebitUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio
      phaseDebitUpper s

/-- The exact phase debit is its own no-loss upper envelope. -/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperBound_self
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPhaseDebitUpperBound
      c2ExactGapAnchorCanonicalPhaseDebit s := by
  unfold C2ExactGapAnchorCanonicalPhaseDebitUpperBound
  exact le_rfl

/-- Global middle version of the no-loss phase-debit upper envelope. -/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle_self
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
      c2ExactGapAnchorCanonicalPhaseDebit near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalPhaseDebitUpperBound_self

/--
A fine upper bound for the phase debit closes the canonical phase-reserve
budget once that upper lies below the canonical reserve.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudget_of_phaseDebitUpperReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      phaseDebitUpper : ℂ → ℝ}
    {s : ℂ}
    (hupper :
      C2ExactGapAnchorCanonicalPhaseDebitUpperBound
        phaseDebitUpper s)
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        phaseDebitUpper s) :
    C2ExactGapAnchorCanonicalPhaseReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPhaseDebitUpperBound at hupper
  unfold C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget at hbudget
  unfold C2ExactGapAnchorCanonicalPhaseReserveBudget
  exact lt_of_le_of_lt hupper hbudget

/-- Global middle version of the phase-debit-upper bridge. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      phaseDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hupper :
      C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
        phaseDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        phaseDebitUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPhaseReserveBudget_of_phaseDebitUpperReserveBudget
      (hupper hs) (hbudget hs)

/--
Reserve budget phrased through an upper envelope for the normalized exact
anchor factor.  This keeps the non-tail debit canonical and only changes the
phase factor estimate.
-/
noncomputable def C2ExactGapAnchorCanonicalFactorUpperReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      factorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit factorUpper s <
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the factor-upper reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      factorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalFactorUpperReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio
      factorUpper s

/-- A normalized factor upper gives a phase-debit upper after weighting. -/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperBound_of_exactFactorUpperBound
    {factorUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBound factorUpper s) :
    C2ExactGapAnchorCanonicalPhaseDebitUpperBound
      (c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
        factorUpper) s := by
  set C := (1 + ‖q s‖) * verticalDepthTailUpper s
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hp_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    le_of_lt (verticalDepthTailUpper_pos_of_offCriticalStrip hoff)
  have hC_nonneg : 0 ≤ C := by
    simpa [C] using mul_nonneg hp_nonneg htail_nonneg
  have hfactor_le :
      c2ContinuedVerticalAnchorResidualExactFactorUpper s ≤
        factorUpper s := by
    simpa [C2ExactGapAnchorExactFactorUpperBound] using hfactor
  unfold C2ExactGapAnchorCanonicalPhaseDebitUpperBound
  unfold c2ExactGapAnchorCanonicalPhaseDebit
  unfold c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
  simpa [C] using mul_le_mul_of_nonneg_left hfactor_le hC_nonneg

/-- Global middle version of the factor-upper to phase-debit-upper bridge. -/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {factorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBoundOnMiddle
        factorUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
      (c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
        factorUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPhaseDebitUpperBound_of_exactFactorUpperBound
      hs.1 (hfactor hs)

/--
A factor-upper reserve budget is the phase-debit-upper reserve budget for the
weighted factor upper.
-/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget_of_factorUpperReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      factorUpper : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2ExactGapAnchorCanonicalFactorUpperReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        factorUpper s) :
    C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
        factorUpper) s := by
  unfold C2ExactGapAnchorCanonicalFactorUpperReserveBudget at hbudget
  unfold C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
  simpa using hbudget

/-- Global middle version of the factor-upper reserve bridge. -/
theorem C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle_of_factorReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      factorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        factorUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
        factorUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget_of_factorUpperReserveBudget
      (hbudget hs)

/--
Direct bridge from a normalized factor upper and its reserve comparison to the
canonical phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      factorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBoundOnMiddle
        factorUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        factorUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
    (C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle
      hfactor)
    (C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle_of_factorReserve
      hbudget)

/--
Odd-gap reserve form: the factor upper is supplied directly as an upper for
`‖1 - 2 * continuedOddDirichletChannel s‖`.
-/
noncomputable def C2ExactGapAnchorCanonicalOddGapReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalFactorUpperReserveBudget
    K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/-- Global middle version of the odd-gap reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalOddGapReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/-- The odd-gap reserve budget is the factor-upper reserve budget. -/
theorem C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle_of_oddGapReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge) :
    C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio gapUpper near edge := by
  intro s hs
  simpa [C2ExactGapAnchorCanonicalOddGapReserveBudget] using hbudget hs

/--
Direct bridge from a continued odd-gap upper and its reserve comparison to the
canonical phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
    (C2ExactGapAnchorExactFactorUpperBoundOnMiddle_of_gapBoundOnMiddle hgap)
    (C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle_of_oddGapReserve
      hbudget)

/-- Half-disk specialization of the odd-gap reserve bridge. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
    (C2ContinuedOddGapBoundOnMiddle_of_halfDiskBoundOnMiddle hhalf)
    hbudget

/-- Positive coefficient multiplying an odd-gap upper in the phase debit. -/
noncomputable def c2ExactGapAnchorCanonicalOddGapWeight
    (s : ℂ) : ℝ :=
  (1 + ‖q s‖) * verticalDepthTailUpper s

/-- Remaining canonical reserve measured in units of odd-gap upper. -/
noncomputable def c2ExactGapAnchorCanonicalOddGapUnitReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s /
    c2ExactGapAnchorCanonicalOddGapWeight s

/-- Pointwise unit-reserve budget for a continued odd-gap upper. -/
noncomputable def C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  gapUpper s <
    c2ExactGapAnchorCanonicalOddGapUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the odd-gap unit-reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/-- The canonical odd-gap weight is positive off the critical boundary. -/
theorem c2ExactGapAnchorCanonicalOddGapWeight_pos_of_offCriticalStrip
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    0 < c2ExactGapAnchorCanonicalOddGapWeight s := by
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hp_pos : 0 < 1 + ‖q s‖ := by linarith
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  unfold c2ExactGapAnchorCanonicalOddGapWeight
  exact mul_pos hp_pos htail_pos

/--
The weighted odd-gap reserve budget is equivalent to the unit-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalOddGapReserveBudget_iff_unitReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalOddGapReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio gapUpper s ↔
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio gapUpper s := by
  have hweight_pos :
      0 < c2ExactGapAnchorCanonicalOddGapWeight s :=
    c2ExactGapAnchorCanonicalOddGapWeight_pos_of_offCriticalStrip hoff
  have hden_pos :
      0 < (1 + ‖q s‖) * verticalDepthTailUpper s := by
    simpa [c2ExactGapAnchorCanonicalOddGapWeight] using hweight_pos
  unfold C2ExactGapAnchorCanonicalOddGapReserveBudget
  unfold C2ExactGapAnchorCanonicalFactorUpperReserveBudget
  unfold C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
  unfold c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
  unfold c2ExactGapAnchorCanonicalOddGapUnitReserve
    c2ExactGapAnchorCanonicalOddGapWeight
  rw [lt_div_iff₀ hden_pos]
  constructor <;> intro h <;>
    simpa [mul_comm, mul_left_comm, mul_assoc] using h

/-- Global middle version of the unit-reserve equivalence. -/
theorem C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle_iff_unitReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge ↔
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalOddGapReserveBudget_iff_unitReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (gapUpper := gapUpper)
        (s := s) hs.1).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalOddGapReserveBudget_iff_unitReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (gapUpper := gapUpper)
        (s := s) hs.1).2 (hbudget hs)

/--
Direct bridge from a continued odd-gap upper and its unit-reserve comparison to
the canonical phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
    hgap
    ((C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle_iff_unitReserveBudgetOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (gapUpper := gapUpper)
      (near := near)
      (edge := edge)).2 hbudget)

/-- Half-disk specialization using the odd-gap unit reserve. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapUnitReserve
    (C2ContinuedOddGapBoundOnMiddle_of_halfDiskBoundOnMiddle hhalf)
    hbudget

/-- Canonical radius reserve for the half-disk form around `1 / 2`. -/
noncomputable def c2ExactGapAnchorCanonicalHalfDiskUnitReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalOddGapUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s /
    2

/-- Pointwise half-disk radius budget against the canonical unit reserve. -/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  halfDiskUpper s <
    c2ExactGapAnchorCanonicalHalfDiskUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the half-disk radius reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio halfDiskUpper s

/-- No-loss upper for the radius of the half-disk around `1 / 2`. -/
noncomputable def c2ContinuedOddExactHalfDiskUpper : ℂ → ℝ :=
  fun s => ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖

/-- The exact half-disk radius is its own upper bound. -/
theorem C2ContinuedOddHalfDiskBound_exactHalfDiskUpper
    (s : ℂ) :
    C2ContinuedOddHalfDiskBound c2ContinuedOddExactHalfDiskUpper s := by
  unfold C2ContinuedOddHalfDiskBound c2ContinuedOddExactHalfDiskUpper
  exact le_rfl

/-- Global middle version of the no-loss half-disk upper bound. -/
theorem C2ContinuedOddHalfDiskBoundOnMiddle_exactHalfDiskUpper
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedOddHalfDiskBoundOnMiddle
      c2ContinuedOddExactHalfDiskUpper near edge := by
  intro s _hs
  exact C2ContinuedOddHalfDiskBound_exactHalfDiskUpper s

/--
Exact radius budget against the canonical half-disk reserve.

This is the no-loss form of the active half-disk target: the left side is
literally the radius around `1 / 2`.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedOddExactHalfDiskUpper s <
    c2ExactGapAnchorCanonicalHalfDiskUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the exact half-disk radius budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The exact radius budget is the half-disk reserve budget with no-loss upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle_iff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedOddExactHalfDiskUpper near edge := by
  constructor
  · intro hbudget s hs
    simpa [
      C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget,
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget] using
      hbudget hs
  · intro hbudget s hs
    simpa [
      C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget,
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget] using
      hbudget hs

/--
Cleared exact half-disk budget: the canonical odd-gap weight and the factor
`2` have been moved to the left side.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * c2ExactGapAnchorCanonicalOddGapWeight s *
      c2ContinuedOddExactHalfDiskUpper s <
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the cleared exact half-disk budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Fully expanded scalar form of the exact half-disk budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
      ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
      c2ExactGapAnchorCanonicalExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the expanded exact half-disk scalar budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Weighted payment demanded by the exact half-disk radius. -/
noncomputable def c2ExactGapAnchorCanonicalExactHalfDiskPayment
    (s : ℂ) : ℝ :=
  2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖

/-- Expanded scalar reserve available after the canonical external debit. -/
noncomputable def c2ExactGapAnchorCanonicalExactHalfDiskReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Upper envelope for the exact half-disk payment. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
    (paymentUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalExactHalfDiskPayment s ≤ paymentUpper s

/-- Global middle version of the exact half-disk payment upper envelope. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (paymentUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound paymentUpper s

/-- Lower envelope for the expanded exact half-disk reserve. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      reserveLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  reserveLower s ≤
    c2ExactGapAnchorCanonicalExactHalfDiskReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the expanded reserve lower envelope. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      reserveLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound
      K M horizontalConstant horizontalScale horizontalRatio reserveLower s

/-- Strict scalar budget between a payment upper and a reserve lower. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
    (paymentUpper reserveLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  paymentUpper s < reserveLower s

/-- Global middle version of the payment/reserve scalar budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (paymentUpper reserveLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
      paymentUpper reserveLower s

/-- Payment upper induced by a half-disk radius upper. -/
noncomputable def c2ExactGapAnchorCanonicalHalfDiskPaymentUpper
    (halfDiskUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
      halfDiskUpper s

/-- Canonical external debit upper, specialized to the current ledger. -/
noncomputable def C2ExactGapAnchorCanonicalExternalDebitUpperBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s ≤
    externalDebitUpper s

/-- Global middle version of the canonical external debit upper. -/
noncomputable def C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper s

/-- The canonical external debit is its own sharp upper envelope. -/
theorem C2ExactGapAnchorCanonicalExternalDebitUpperBound_canonical
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound
  exact le_rfl

/-- Global middle version of the sharp canonical debit upper. -/
theorem C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_canonical
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio) near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalExternalDebitUpperBound_canonical

/--
No-loss allowance/reserve presentation of the raw quartet residual margin.

On the off-critical strip this is equal to `c2ExpandedQuartetResidualMargin`,
but it exposes the two scalar components that drive the current cash ledger.
-/
noncomputable def c2ExactGapAnchorCanonicalResidualMarginAllowanceLower
    (s : ℂ) : ℝ :=
  c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s

/-- Expanded norm formula for the no-loss residual-margin lower. -/
theorem c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq_norm
    (s : ℂ) :
    c2ExactGapAnchorCanonicalResidualMarginAllowanceLower s =
      ‖q s‖ ^ 2 / (1 + ‖q s‖) -
        2 * ‖q s‖ ^ 6 / (1 - ‖q s‖ ^ 2) := by
  simp [
    c2ExactGapAnchorCanonicalResidualMarginAllowanceLower,
    c2AnalyticBulkAllowance,
    c2ExpandedQuartetResidualReserve]

/-- The no-loss allowance/reserve lower is exactly the residual margin. -/
theorem c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2ExactGapAnchorCanonicalResidualMarginAllowanceLower s =
      c2ExpandedQuartetResidualMargin s := by
  simpa [c2ExactGapAnchorCanonicalResidualMarginAllowanceLower] using
    (c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
      hoff).symm

/-- Lower envelope for the raw quartet margin. -/
noncomputable def C2ExactGapAnchorCanonicalMarginLowerBound
    (marginLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  marginLower s ≤ c2ExpandedQuartetResidualMargin s

/-- Global middle version of the raw margin lower envelope. -/
noncomputable def C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalMarginLowerBound marginLower s

/-- The quartet margin is its own sharp lower envelope. -/
theorem C2ExactGapAnchorCanonicalMarginLowerBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalMarginLowerBound
      c2ExpandedQuartetResidualMargin s := by
  unfold C2ExactGapAnchorCanonicalMarginLowerBound
  exact le_rfl

/-- Global middle version of the sharp quartet margin lower. -/
theorem C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
      c2ExpandedQuartetResidualMargin near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalMarginLowerBound_exact

/-- The allowance/reserve presentation is a sharp raw-margin lower. -/
theorem C2ExactGapAnchorCanonicalMarginLowerBound_allowanceLower
    {s : ℂ} (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalMarginLowerBound
      c2ExactGapAnchorCanonicalResidualMarginAllowanceLower s := by
  unfold C2ExactGapAnchorCanonicalMarginLowerBound
  rw [c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq hoff]

/-- Global middle version of the no-loss allowance/reserve raw-margin lower. -/
theorem C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_allowanceLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
      c2ExactGapAnchorCanonicalResidualMarginAllowanceLower near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalMarginLowerBound_allowanceLower hs.1

/-- Lower envelope for the weighted margin `Q * (1 - ‖q‖)`. -/
noncomputable def C2ExactGapAnchorCanonicalWeightedMarginLowerBound
    (weightedMarginLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  weightedMarginLower s ≤
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)

/-- Global middle version of the weighted margin lower envelope. -/
noncomputable def C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (weightedMarginLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalWeightedMarginLowerBound weightedMarginLower s

/-- Weighted-margin lower induced by a raw margin lower. -/
noncomputable def c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
    (marginLower : ℂ → ℝ) : ℂ → ℝ :=
  fun s => marginLower s * (1 - ‖q s‖)

/-- Reserve lower induced by weighted-margin lower and external-debit upper. -/
noncomputable def c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
    (weightedMarginLower externalDebitUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => weightedMarginLower s - externalDebitUpper s

/-- Reserve lower induced by raw-margin lower and external-debit upper. -/
noncomputable def c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
    (marginLower externalDebitUpper : ℂ → ℝ) : ℂ → ℝ :=
  c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
    (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin marginLower)
    externalDebitUpper

/--
Final scalar budget after choosing a half-disk radius upper, a raw quartet
margin lower, and an external debit upper.
-/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
    (halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
      halfDiskUpper s <
    marginLower s * (1 - ‖q s‖) - externalDebitUpper s

/-- Global middle version of the final half-disk/margin/debit scalar budget. -/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
      halfDiskUpper marginLower externalDebitUpper s

/--
The explicit scalar budget is definitionally the specialized payment/reserve
budget.
-/
theorem C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget_iff_paymentReserve
    {halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
        halfDiskUpper marginLower externalDebitUpper s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
        (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
        (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
          marginLower externalDebitUpper) s := by
  unfold C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
  unfold c2ExactGapAnchorCanonicalHalfDiskPaymentUpper
  unfold c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
  unfold c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
  unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
  rfl

/-- Global middle version of the scalar/payment-reserve equivalence. -/
theorem
    C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle_iff_paymentReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
        halfDiskUpper marginLower externalDebitUpper near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
        (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
          marginLower externalDebitUpper) near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget_iff_paymentReserve
        (halfDiskUpper := halfDiskUpper)
        (marginLower := marginLower)
        (externalDebitUpper := externalDebitUpper)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget_iff_paymentReserve
        (halfDiskUpper := halfDiskUpper)
        (marginLower := marginLower)
        (externalDebitUpper := externalDebitUpper)
        (s := s)).2 (hbudget hs)

/--
Canonical half-disk scalar budget using the exact quartet margin and the
canonical external debit.
-/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
      halfDiskUpper s <
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the canonical half-disk phase-reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper s

/-- The canonical half-disk budget is the exact margin/debit scalar budget. -/
theorem C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget_iff_marginDebitScalar
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper s ↔
      C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
        halfDiskUpper c2ExpandedQuartetResidualMargin
        (c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
  unfold C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  rfl

/-- Global middle version of the canonical half-disk scalar equivalence. -/
theorem
    C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle_iff_marginDebitScalar
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge ↔
      C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
        halfDiskUpper c2ExpandedQuartetResidualMargin
        (c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio)
        near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget_iff_marginDebitScalar
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (halfDiskUpper := halfDiskUpper)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget_iff_marginDebitScalar
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (halfDiskUpper := halfDiskUpper)
        (s := s)).2 (hbudget hs)

/--
Exact-radius version of the canonical half-disk phase-reserve budget.  This
removes the free `halfDiskUpper` envelope.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
    K M horizontalConstant horizontalScale horizontalRatio
    c2ContinuedOddExactHalfDiskUpper s

/-- Global middle version of the exact-radius phase-reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The exact-radius phase budget is the no-loss half-disk phase budget. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_halfDiskPhaseReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedOddExactHalfDiskUpper s := by
  rfl

/-- Global middle version of the no-loss half-disk phase equivalence. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_halfDiskPhaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedOddExactHalfDiskUpper near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_halfDiskPhaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_halfDiskPhaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- The exact-radius phase-reserve budget is the expanded exact half-disk budget. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
  unfold C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
  unfold c2ContinuedOddExactHalfDiskUpper
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  rfl

/-- Global middle version of the exact phase/expanded equivalence. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_expanded
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- Lower envelope for the canonical phase reserve. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseReserveLowerBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      reserveLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  reserveLower s ≤
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the canonical phase-reserve lower envelope. -/
noncomputable def C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      reserveLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPhaseReserveLowerBound
      K M horizontalConstant horizontalScale horizontalRatio reserveLower s

/-- The canonical phase reserve is its own sharp lower envelope. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveLowerBound_exact
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPhaseReserveLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalPhaseReserve
        K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorCanonicalPhaseReserveLowerBound
  exact le_rfl

/-- Global middle version of the sharp canonical phase-reserve lower. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalPhaseReserve
        K M horizontalConstant horizontalScale horizontalRatio) near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalPhaseReserveLowerBound_exact

/- The weighted margin/debit split gives a lower envelope for phase reserve. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveLowerBound_of_weightedMarginDebit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBound
        weightedMarginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s) :
    C2ExactGapAnchorCanonicalPhaseReserveLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
        weightedMarginLower externalDebitUpper) s := by
  unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalPhaseReserveLowerBound
  unfold c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  linarith

/--
Global middle lower envelope for phase reserve from weighted-margin lower and
debit upper.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_of_weightedMarginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
        weightedMarginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
        weightedMarginLower externalDebitUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPhaseReserveLowerBound_of_weightedMarginDebit
      (hmargin hs) (hdebit hs)

/-- Global middle phase-reserve lower from raw-margin lower and debit upper. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_of_marginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
        marginLower externalDebitUpper) near edge := by
  intro s hs
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs.1
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  have hweighted :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBound
        (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin marginLower) s := by
    have hmargin_s := hmargin hs
    unfold C2ExactGapAnchorCanonicalMarginLowerBound at hmargin_s
    unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound
    unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
    exact mul_le_mul_of_nonneg_right hmargin_s hgap_nonneg
  unfold c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
  exact
    C2ExactGapAnchorCanonicalPhaseReserveLowerBound_of_weightedMarginDebit
      hweighted (hdebit hs)

/-- The exact half-disk payment is its own sharp payment upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
      c2ExactGapAnchorCanonicalExactHalfDiskPayment s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
  exact le_rfl

/-- Global middle version of the sharp exact half-disk payment upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
      c2ExactGapAnchorCanonicalExactHalfDiskPayment near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound_exact

/--
Component bridge: an upper for the exact half-disk payment, a lower for the
phase reserve, and a strict scalar budget close the current exact target.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_of_upperLower
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {s : ℂ}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
        paymentUpper s)
    (hreserve :
      C2ExactGapAnchorCanonicalPhaseReserveLowerBound
        K M horizontalConstant horizontalScale horizontalRatio
        reserveLower s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
        paymentUpper reserveLower s) :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound at hpayment
  unfold C2ExactGapAnchorCanonicalPhaseReserveLowerBound at hreserve
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget at hbudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
  unfold C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment at hpayment
  unfold c2ContinuedOddExactHalfDiskUpper
  exact lt_of_le_of_lt hpayment (lt_of_lt_of_le hbudget hreserve)

/-- Global middle component bridge for the current exact target. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle_of_upperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_of_upperLower
      (hpayment hs) (hreserve hs) (hbudget hs)

/--
Sharp exact payment/reserve budget: the payment upper and the reserve lower are
chosen with no loss.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
    c2ExactGapAnchorCanonicalExactHalfDiskPayment
    (c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio) s

/-- Global middle version of the sharp exact payment/reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The sharp payment/reserve budget is the exact half-disk phase budget. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
  unfold C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
  unfold c2ContinuedOddExactHalfDiskUpper
  rfl

/-- Global middle equivalence between sharp split and exact phase budget. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_phaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/--
Sharp surplus for the exact half-disk ledger: canonical reserve after external
debit minus the exact half-disk payment.
-/
noncomputable def c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s -
      c2ExactGapAnchorCanonicalExactHalfDiskPayment s

/-- Pointwise positivity of the sharp exact half-disk surplus. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  0 <
    c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of sharp surplus positivity. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Ledger identity for the sharp exact half-disk surplus. -/
theorem c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_ledger
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
        c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio s -
        c2ExactGapAnchorCanonicalExactHalfDiskPayment s := by
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  rfl

/-- Fully expanded ledger identity for the sharp exact half-disk surplus. -/
theorem c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_expandedLedger
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
        c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio s -
        2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
          ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ := by
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  rfl

/-- The sharp payment/reserve budget is exactly positivity of the sharp surplus. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  constructor <;> intro h <;> linarith

/-- Global middle equivalence between the sharp budget and surplus positivity. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_surplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hsurplus hs)

/-- Sharp surplus positivity is the expanded exact half-disk budget. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_iff_expanded
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hsurplus
    have hsharp :
        C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
          K M horizontalConstant horizontalScale horizontalRatio s :=
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 hsurplus
    have hphase :
        C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
          K M horizontalConstant horizontalScale horizontalRatio s :=
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 hsharp
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 hphase
  · intro hexpanded
    have hphase :
        C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
          K M horizontalConstant horizontalScale horizontalRatio s :=
      (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 hexpanded
    have hsharp :
        C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
          K M horizontalConstant horizontalScale horizontalRatio s :=
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 hphase
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 hsharp

/-- Global middle equivalence between sharp surplus and expanded budget. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_iff_expanded
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hsurplus hs)
  · intro hexpanded s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hexpanded hs)

/--
Scalar budget in the weighted ledger: the weighted quartet margin lower pays
both the external debit upper and the exact half-disk payment upper.
-/
noncomputable def C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
    (weightedMarginLower externalDebitUpper paymentUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  externalDebitUpper s + paymentUpper s < weightedMarginLower s

/-- Global middle version of the weighted margin/debit/payment budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (weightedMarginLower externalDebitUpper paymentUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
      weightedMarginLower externalDebitUpper paymentUpper s

/- The exact weighted margin is its own sharp lower envelope. -/
theorem C2ExactGapAnchorCanonicalWeightedMarginLowerBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalWeightedMarginLowerBound
      (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
        c2ExpandedQuartetResidualMargin) s := by
  unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound
  unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
  exact le_rfl

/-- Global middle version of the sharp exact weighted-margin lower. -/
theorem C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
      (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
        c2ExpandedQuartetResidualMargin) near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalWeightedMarginLowerBound_exact

/--
Component bridge from weighted margin lower, external debit upper, payment
upper, and their strict scalar budget to sharp surplus positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_of_weighted
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper paymentUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBound
        weightedMarginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s)
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
        paymentUpper s)
    (hbudget :
      C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
        weightedMarginLower externalDebitUpper paymentUpper s) :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound at hpayment
  unfold C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget at hbudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  linarith

/-- Global middle component bridge to sharp surplus positivity. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_weighted
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper paymentUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
        weightedMarginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle
        weightedMarginLower externalDebitUpper paymentUpper near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_of_weighted
      (hmargin hs) (hdebit hs) (hpayment hs) (hbudget hs)

/--
No-loss weighted-ledger budget: the exact weighted quartet margin pays the
canonical external debit and the exact half-disk payment.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
    (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
      c2ExpandedQuartetResidualMargin)
    (c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio)
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s

/-- Global middle version of the no-loss weighted-ledger budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The no-loss weighted-ledger budget is sharp surplus positivity. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget_iff_surplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
  unfold C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
  constructor <;> intro h <;> linarith

/--
Global middle equivalence between the no-loss weighted ledger and sharp
surplus positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerOnMiddle_iff_surplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hledger s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hledger hs)
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hsurplus hs)

/-- Canonical component upper for the non-tail external debit. -/
noncomputable def c2ExactGapAnchorCanonicalExternalDebitComponentUpper
    (genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper : ℂ → ℝ) :
    ℂ → ℝ :=
  c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
    genuineBudget continuedBudget
    horizontalBudgetUpper cutoffBudgetUpper

/-- Component bounds for the canonical non-tail external debit. -/
noncomputable def C2ExactGapAnchorCanonicalExternalDebitComponentBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBounds
    c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper
    (c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio)
    (c2RawCentralCutoffNormConstant K M)
    genuineBudget continuedBudget
    horizontalBudgetUpper cutoffBudgetUpper s

/-- Global middle version of canonical external-debit component bounds. -/
noncomputable def C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExternalDebitComponentBounds
      K M horizontalConstant horizontalScale horizontalRatio
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper s

/-- Exact canonical components are their own external-debit component bounds. -/
theorem C2ExactGapAnchorCanonicalExternalDebitComponentBounds_exact
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExternalDebitComponentBounds
      K M horizontalConstant horizontalScale horizontalRatio
      c2GenuineCentralExactUpper
      c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) s := by
  unfold C2ExactGapAnchorCanonicalExternalDebitComponentBounds
  unfold C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBounds
  exact ⟨le_rfl, le_rfl, le_rfl, le_rfl⟩

/-- Global middle exact canonical component bounds. -/
theorem C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2GenuineCentralExactUpper
      c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalExternalDebitComponentBounds_exact

/--
Canonical external-debit upper induced by component bounds.
-/
theorem C2ExactGapAnchorCanonicalExternalDebitUpperBound_of_componentBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper : ℂ → ℝ}
    {s : ℂ}
    (hcomponents :
      C2ExactGapAnchorCanonicalExternalDebitComponentBounds
        K M horizontalConstant horizontalScale horizontalRatio
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper s) :
    C2ExactGapAnchorCanonicalExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalExternalDebitComponentUpper
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper) s := by
  unfold C2ExactGapAnchorCanonicalExternalDebitComponentBounds at hcomponents
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound
  unfold c2ExactGapAnchorCanonicalExternalDebit
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  exact
    C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound_of_componentBounds
      (K := K) (M := M) hcomponents

/-- Global middle external-debit upper induced by component bounds. -/
theorem C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_of_components
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcomponents :
      C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper near edge) :
    C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalExternalDebitComponentUpper
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExternalDebitUpperBound_of_componentBounds
      (hcomponents hs)

/--
Component weighted ledger: component external-debit upper plus payment upper
fits under a weighted margin lower.
-/
noncomputable def C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget
    (weightedMarginLower genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper paymentUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalExternalDebitComponentUpper
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper s +
    paymentUpper s <
      weightedMarginLower s

/-- Global middle version of the component weighted ledger. -/
noncomputable def
    C2ExactGapAnchorCanonicalWeightedComponentLedgerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (weightedMarginLower genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper paymentUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget
      weightedMarginLower genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper paymentUpper s

/-- Component ledger gives the corresponding debit/payment budget. -/
theorem
    C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle_of_components
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {weightedMarginLower genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper paymentUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalWeightedComponentLedgerBudgetOnMiddle
        weightedMarginLower genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper paymentUpper near edge) :
    C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle
      weightedMarginLower
      (c2ExactGapAnchorCanonicalExternalDebitComponentUpper
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper)
      paymentUpper near edge := by
  intro s hs
  simpa [
    C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget,
    C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget] using
    hbudget hs

/--
Component bridge to sharp surplus positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_componentLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper paymentUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
        weightedMarginLower near edge)
    (hcomponents :
      C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper near edge)
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalWeightedComponentLedgerBudgetOnMiddle
        weightedMarginLower genuineBudget continuedBudget
        horizontalBudgetUpper cutoffBudgetUpper paymentUpper near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_weighted
    hmargin
    (C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_of_components
      hcomponents)
    hpayment
    (C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle_of_components
      hbudget)

/--
No-loss component ledger with exact weighted margin, exact component costs, and
the exact half-disk payment.
-/
noncomputable def C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget
    (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
      c2ExpandedQuartetResidualMargin)
    c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper
    (c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio)
    (c2RawCentralCutoffNormConstant K M)
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s

/-- Global middle version of the exact component ledger. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The exact component ledger is the no-loss weighted ledger. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_weighted
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
  unfold C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget
  unfold C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold c2ExactGapAnchorCanonicalExternalDebit
  rfl

/-- Global middle equivalence between exact component and weighted ledgers. -/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_weighted
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_weighted
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcomponent hs)
  · intro hweighted s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_weighted
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hweighted hs)

/--
The exact half-disk payment is the weighted exact odd-gap tail contribution.
-/
theorem c2ExactGapAnchorCanonicalExactHalfDiskPayment_eq_weightedExactTailGap
    {s : ℂ} :
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s =
      (1 + ‖q s‖) * c2ExactGapAnchorExactTailGapBudget s := by
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  unfold c2ExactGapAnchorExactTailGapBudget
  unfold c2ContinuedOddExactGapUpper
  rw [norm_one_sub_two_mul_eq_two_norm_half_sub]
  ring

/--
The exact component ledger is the canonical exact-gap collected budget.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_collected
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorExactGapExpandedUpperCollectedBudget
        K M c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) s := by
  rw [C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_weighted]
  unfold C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
  unfold C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
  unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
  unfold c2ExactGapAnchorCanonicalExternalDebit
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebit
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  unfold C2ExactGapAnchorExactGapExpandedUpperCollectedBudget
  unfold c2ExactGapAnchorExactTailGapBudget
  unfold c2ContinuedOddExactGapUpper
  rw [norm_one_sub_two_mul_eq_two_norm_half_sub]
  ring_nf

/--
Global middle equivalence between the exact component ledger and the canonical
exact-gap collected budget.
-/
theorem
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_collected
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) near edge := by
  constructor
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_collected
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcomponent hs)
  · intro hcollected s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_collected
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hcollected hs)

/--
Canonical collected slack: the phase reserve left after paying the exact
tail-gap contribution in the collected exact-gap budget.
-/
noncomputable def c2ExactGapAnchorCanonicalExactGapCollectedSlack
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    c2ExactGapAnchorCanonicalPhaseReserve
      K M horizontalConstant horizontalScale horizontalRatio s -
      (1 + ‖q s‖) * c2ExactGapAnchorExactTailGapBudget s

/-- Pointwise positivity of the canonical collected exact-gap slack. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  0 <
    c2ExactGapAnchorCanonicalExactGapCollectedSlack
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of collected exact-gap slack positivity. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
      K M horizontalConstant horizontalScale horizontalRatio s

/--
The canonical collected slack is the sharp exact half-disk surplus, because the
exact half-disk payment is the weighted exact tail-gap contribution.
-/
theorem c2ExactGapAnchorCanonicalExactGapCollectedSlack_eq_sharpSurplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalExactGapCollectedSlack
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold c2ExactGapAnchorCanonicalExactGapCollectedSlack
  unfold c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  rw [c2ExactGapAnchorCanonicalExactHalfDiskPayment_eq_weightedExactTailGap]

/-- Collected slack positivity is the sharp exact half-disk surplus target. -/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive_iff_sharpSurplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
  unfold C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
  constructor <;> intro h <;>
    simpa [c2ExactGapAnchorCanonicalExactGapCollectedSlack_eq_sharpSurplus] using h

/--
The canonical exact-gap collected budget is exactly positivity of the collected
slack.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudget
        K M c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) s ↔
      C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorExactGapExpandedUpperCollectedBudget
  unfold C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
  unfold c2ExactGapAnchorCanonicalExactGapCollectedSlack
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  unfold c2ExactGapAnchorCanonicalExternalDebit
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebit
  constructor <;> intro h <;> linarith

/--
Global middle equivalence between the canonical collected exact-gap budget and
collected slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) near edge ↔
      C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hcollected s hs
    exact
      (C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcollected hs)
  · intro hslack s hs
    exact
      (C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hslack hs)

/--
Canonical operator-side cleared budget for the anchor residual component split.
-/
noncomputable def C2ExactGapAnchorCanonicalAnchorResidualClearedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorExactGapExpandedUpperAnchorResidualComponentClearedBudget
    K M c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
    (c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio)
    (c2RawCentralCutoffNormConstant K M) s

/--
Global middle version of the canonical anchor-residual cleared budget.
-/
noncomputable def C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalAnchorResidualClearedBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Canonical lower-tail factor form of the anchor-residual cleared budget. -/
noncomputable def C2ExactGapAnchorCanonicalLowerFactorClearedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget
    K M c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
    c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
    (c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio)
    (c2RawCentralCutoffNormConstant K M) s

/-- Global middle version of the canonical lower-tail factor cleared budget. -/
noncomputable def C2ExactGapAnchorCanonicalLowerFactorClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorClearedBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Cleared lower-tail coefficient in front of the exact lower factor. -/
noncomputable def c2ExactGapAnchorCanonicalLowerFactorClearedWeight
    (s : ℂ) : ℝ :=
  (1 + ‖q s‖) * ‖q s‖ ^ 2

/-- Cleared reserve after paying canonical external components. -/
noncomputable def c2ExactGapAnchorCanonicalLowerFactorClearedReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 2 -
    c2ExactGapAnchorCanonicalExternalDebitComponentUpper
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) s *
      (1 - ‖q s‖)

/-- Unit reserve for the exact lower-tail factor. -/
noncomputable def c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalLowerFactorClearedReserve
      K M horizontalConstant horizontalScale horizontalRatio s /
    c2ExactGapAnchorCanonicalLowerFactorClearedWeight s

/-- Unit-reserve form of the canonical lower-tail factor cleared budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s <
    c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the lower-tail factor unit-reserve budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Cleared surplus for the canonical lower-tail factor budget. -/
noncomputable def c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalLowerFactorClearedReserve
      K M horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalLowerFactorClearedWeight s *
      c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s

/-- Positivity of the canonical lower-tail factor cleared surplus. -/
noncomputable def C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  0 <
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of lower-tail factor cleared surplus positivity. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Expanded identity for the lower-tail factor cleared surplus. -/
theorem c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_expanded
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 2 -
        c2ExactGapAnchorCanonicalExternalDebitComponentUpper
          c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio)
          (c2RawCentralCutoffNormConstant K M) s *
          (1 - ‖q s‖) -
        c2ExactGapAnchorCanonicalLowerFactorClearedWeight s *
          c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s := by
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedReserve
  ring

/-- Cleared quartet-margin component of the lower-factor surplus. -/
noncomputable def c2ExactGapAnchorCanonicalClearedMargin
    (s : ℂ) : ℝ :=
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 2

/--
No-loss allowance/reserve lower for the cleared quartet-margin component.

This keeps the exact residual-margin lower and applies the exact clearing factor
used by the current lower-factor ledger.
-/
noncomputable def c2ExactGapAnchorCanonicalClearedMarginAllowanceLower
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalResidualMarginAllowanceLower s *
    (1 - ‖q s‖) ^ 2

/-- Expanded norm formula for the no-loss cleared-margin lower. -/
theorem c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq_norm
    (s : ℂ) :
    c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s =
      (‖q s‖ ^ 2 / (1 + ‖q s‖) -
          2 * ‖q s‖ ^ 6 / (1 - ‖q s‖ ^ 2)) *
        (1 - ‖q s‖) ^ 2 := by
  rw [c2ExactGapAnchorCanonicalClearedMarginAllowanceLower,
    c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq_norm]

/-- On the off-critical strip, the no-loss lower is exactly the cleared margin. -/
theorem c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s =
      c2ExactGapAnchorCanonicalClearedMargin s := by
  unfold c2ExactGapAnchorCanonicalClearedMarginAllowanceLower
  unfold c2ExactGapAnchorCanonicalClearedMargin
  rw [c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq hoff]

/--
Unit reserve for the exact lower-tail factor after reserving one quarter of the
cleared margin.
-/
noncomputable def
    c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  (c2ExactGapAnchorCanonicalLowerFactorClearedReserve
      K M horizontalConstant horizontalScale horizontalRatio s -
    (1 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s) /
    c2ExactGapAnchorCanonicalLowerFactorClearedWeight s

/--
Quarter-reserve unit-budget form: the exact lower factor fits in the cleared
unit reserve while leaving one quarter of the cleared margin unpaid.
-/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s ≤
    c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the quarter-reserve unit budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Residual quartet-margin positivity implies positivity of the cleared margin on
the off-critical strip.
-/
theorem c2ExactGapAnchorCanonicalClearedMargin_pos_of_residualMargin_pos
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExpandedQuartetResidualMargin s) :
    0 < c2ExactGapAnchorCanonicalClearedMargin s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s)]
  unfold c2ExactGapAnchorCanonicalClearedMargin
  exact mul_pos hmargin (sq_pos_of_pos hgap_pos)

/-- Residual quartet-margin positivity on the middle region. -/
noncomputable def C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    0 < c2ExpandedQuartetResidualMargin s

/-- The analytic allowance strictly pays the explicit residual reserve. -/
noncomputable def C2ExactGapAnchorCanonicalAllowanceReserveBudget
    (s : ℂ) : Prop :=
  c2ExpandedQuartetResidualReserve s < c2AnalyticBulkAllowance s

/-- Middle-region version of the analytic allowance/reserve budget. -/
noncomputable def C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalAllowanceReserveBudget s

private theorem c2_residualReserve_lt_analyticAllowance_of_norm_lt_half
    {r : ℝ} (hr_pos : 0 < r) (hr_half : r < (1 / 2 : ℝ)) :
    2 * r ^ 6 / (1 - r ^ 2) < r ^ 2 / (1 + r) := by
  have hr_nonneg : 0 ≤ r := le_of_lt hr_pos
  have hden_reserve : 0 < 1 - r ^ 2 := by nlinarith
  have hden_allowance : 0 < 1 + r := by nlinarith
  have hdiff_half : 0 < (1 / 2 : ℝ) - r := by linarith
  have hsq_half : 0 < ((1 / 2 : ℝ) - r) ^ 2 :=
    sq_pos_of_pos hdiff_half
  have hr_sq_lt : r ^ 2 < (1 / 4 : ℝ) := by nlinarith
  have hr_sq_nonneg : 0 ≤ r ^ 2 := by positivity
  have hr_sq_pos : 0 < r ^ 2 := by positivity
  have hr_four_lt : r ^ 4 < (1 / 16 : ℝ) := by
    have hmul :
        r ^ 2 * r ^ 2 < (1 / 4 : ℝ) * (1 / 4 : ℝ) :=
      mul_lt_mul hr_sq_lt (le_of_lt hr_sq_lt) hr_sq_pos (by norm_num)
    nlinarith
  have hr_four_nonneg : 0 ≤ r ^ 4 := by positivity
  have hr_five_lt : r ^ 5 < (1 / 32 : ℝ) := by
    have hmul :
        r ^ 4 * r < (1 / 16 : ℝ) * (1 / 2 : ℝ) :=
      mul_lt_mul hr_four_lt (le_of_lt hr_half) hr_pos (by norm_num)
    nlinarith
  have hbracket : r ^ 2 + 2 * r ^ 4 + 2 * r ^ 5 < 1 := by
    nlinarith [hr_sq_lt, hr_four_lt, hr_five_lt]
  have hbracket_pos : 0 < 1 - (r ^ 2 + 2 * r ^ 4 + 2 * r ^ 5) := by
    linarith
  have hprod :
      0 < r ^ 2 * (1 - (r ^ 2 + 2 * r ^ 4 + 2 * r ^ 5)) :=
    mul_pos hr_sq_pos hbracket_pos
  rw [div_lt_iff₀ hden_reserve]
  rw [show r ^ 2 / (1 + r) * (1 - r ^ 2) =
      r ^ 2 * (1 - r ^ 2) / (1 + r) by ring]
  rw [lt_div_iff₀ hden_allowance]
  nlinarith [hprod]

/--
The explicit quartet residual reserve is paid by the analytic allowance
throughout the off-critical strip.
-/
theorem C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalAllowanceReserveBudget s := by
  have hq_pos : 0 < ‖q s‖ := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    exact norm_pos_iff.mpr hq_ne
  have hq_half : ‖q s‖ < (1 / 2 : ℝ) :=
    q_norm_lt_half_of_re_pos hoff.1
  unfold C2ExactGapAnchorCanonicalAllowanceReserveBudget
  unfold c2ExpandedQuartetResidualReserve c2AnalyticBulkAllowance
  exact
    c2_residualReserve_lt_analyticAllowance_of_norm_lt_half
      hq_pos hq_half

/-- The allowance/reserve budget is closed on the whole middle region. -/
theorem C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_offCriticalStrip hs.1

/--
The allowance/reserve budget is exactly the positivity source for the residual
quartet margin.
-/
theorem c2ExpandedQuartetResidualMargin_pos_of_allowanceReserveBudget
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget : C2ExactGapAnchorCanonicalAllowanceReserveBudget s) :
    0 < c2ExpandedQuartetResidualMargin s := by
  unfold C2ExactGapAnchorCanonicalAllowanceReserveBudget at hbudget
  rw [
    c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
      hoff]
  linarith

/-- The allowance/reserve budget proves residual-margin positivity on middle. -/
theorem C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge) :
    C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge := by
  intro s hs
  exact
    c2ExpandedQuartetResidualMargin_pos_of_allowanceReserveBudget
      hs.1 (hbudget hs)

/-- Positivity of the analytic allowance on the middle region. -/
noncomputable def C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    0 < c2AnalyticBulkAllowance s

/-- Residual reserve normalized by the analytic allowance. -/
noncomputable def c2ExactGapAnchorCanonicalResidualReserveShare
    (s : ℂ) : ℝ :=
  c2ExpandedQuartetResidualReserve s / c2AnalyticBulkAllowance s

/-- The residual reserve consumes less than one allowance unit. -/
noncomputable def C2ExactGapAnchorCanonicalResidualReserveShareLTOne
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalResidualReserveShare s < 1

/-- Middle-region version of the residual-reserve share target. -/
noncomputable def C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalResidualReserveShareLTOne s

/--
Positive analytic allowance and reserve share below `1` imply the direct
allowance/reserve budget.
-/
theorem C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_reserveShareLTOne
    {s : ℂ}
    (hallow : 0 < c2AnalyticBulkAllowance s)
    (hshare : C2ExactGapAnchorCanonicalResidualReserveShareLTOne s) :
    C2ExactGapAnchorCanonicalAllowanceReserveBudget s := by
  unfold C2ExactGapAnchorCanonicalResidualReserveShareLTOne at hshare
  unfold c2ExactGapAnchorCanonicalResidualReserveShare at hshare
  unfold C2ExactGapAnchorCanonicalAllowanceReserveBudget
  rw [div_lt_iff₀ hallow] at hshare
  simpa using hshare

/--
Allowance positivity and a reserve-share budget below `1` prove the direct
allowance/reserve budget on the middle.
-/
theorem C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_of_reserveShareLTOne
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge)
    (hshare :
      C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge) :
    C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_reserveShareLTOne
      (hallow hs) (hshare hs)

/--
Allowance positivity plus residual-reserve share below `1` proves
residual-margin positivity on the middle.
-/
theorem C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_reserveShareLTOne
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge)
    (hshare :
      C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge) :
    C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge :=
  C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
    (C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_of_reserveShareLTOne
      hallow hshare)

/-- The residual quartet margin is positive on the middle region. -/
theorem C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_closed
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge :=
  C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
    C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed

/-- Positivity of the exact cleared margin on the middle region. -/
noncomputable def C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    0 < c2ExactGapAnchorCanonicalClearedMargin s

/--
Residual margin positivity on the middle region supplies the common positive
denominator for the normalized pressure ratios.
-/
theorem
    C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_of_residualMarginPositive
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge) :
    C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge := by
  intro s hs
  exact
    c2ExactGapAnchorCanonicalClearedMargin_pos_of_residualMargin_pos
      hs.1 (hmargin hs)

/-- The exact cleared margin is positive on the middle region. -/
theorem C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge :=
  C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_of_residualMarginPositive
    C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_closed

/-- Cleared external-debit component of the lower-factor surplus. -/
noncomputable def c2ExactGapAnchorCanonicalClearedExternalDebit
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalExternalDebitComponentUpper
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) s *
    (1 - ‖q s‖)

/-- Cleared lower-factor cost component of the lower-factor surplus. -/
noncomputable def c2ExactGapAnchorCanonicalClearedLowerFactorCost
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalLowerFactorClearedWeight s *
    c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s

/-- Lower envelope for the cleared quartet-margin component. -/
noncomputable def C2ExactGapAnchorCanonicalClearedMarginLowerBound
    (marginLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  marginLower s ≤ c2ExactGapAnchorCanonicalClearedMargin s

/-- Global middle lower envelope for the cleared quartet-margin component. -/
noncomputable def C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalClearedMarginLowerBound marginLower s

/-- Upper envelope for the cleared external-debit component. -/
noncomputable def C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s ≤
    externalDebitUpper s

/-- Global middle upper envelope for the cleared external-debit component. -/
noncomputable def
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper s

/-- Upper envelope for the cleared lower-factor cost component. -/
noncomputable def C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
    (lowerFactorCostUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
    lowerFactorCostUpper s

/-- Global middle upper envelope for the cleared lower-factor cost component. -/
noncomputable def
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (lowerFactorCostUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
      lowerFactorCostUpper s

/-- The exact cleared quartet margin is its own sharp lower envelope. -/
theorem C2ExactGapAnchorCanonicalClearedMarginLowerBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalClearedMarginLowerBound
      c2ExactGapAnchorCanonicalClearedMargin s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginLowerBound
  exact le_rfl

/-- Global middle version of the exact cleared quartet-margin lower. -/
theorem C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
      c2ExactGapAnchorCanonicalClearedMargin near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalClearedMarginLowerBound_exact

/-- The allowance/reserve presentation is a sharp cleared-margin lower. -/
theorem C2ExactGapAnchorCanonicalClearedMarginLowerBound_allowanceLower
    {s : ℂ} (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalClearedMarginLowerBound
      c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginLowerBound
  rw [c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq hoff]

/--
Global middle version of the no-loss allowance/reserve cleared-margin lower.
-/
theorem C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_allowanceLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
      c2ExactGapAnchorCanonicalClearedMarginAllowanceLower near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalClearedMarginLowerBound_allowanceLower hs.1

/-- The exact cleared external debit is its own sharp upper envelope. -/
theorem C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound_exact
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
  exact le_rfl

/-- Global middle version of the exact cleared external-debit upper. -/
theorem C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio) near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound_exact

/-- The exact cleared lower-factor cost is its own sharp upper envelope. -/
theorem C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
      c2ExactGapAnchorCanonicalClearedLowerFactorCost s := by
  unfold C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
  exact le_rfl

/-- Global middle version of the exact cleared lower-factor cost upper. -/
theorem C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
      c2ExactGapAnchorCanonicalClearedLowerFactorCost near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound_exact

/--
Strict envelope ledger for the lower-factor surplus: external debit plus the
lower-factor cost must fit below the cleared margin lower envelope.
-/
noncomputable def C2ExactGapAnchorCanonicalClearedEnvelopeLedger
    (marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  externalDebitUpper s + lowerFactorCostUpper s < marginLower s

/-- Global middle version of the cleared lower-factor envelope ledger. -/
noncomputable def C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalClearedEnvelopeLedger
      marginLower externalDebitUpper lowerFactorCostUpper s

/- The cleared surplus is exactly margin minus debit minus lower-factor cost. -/
theorem c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExactGapAnchorCanonicalClearedMargin s -
        c2ExactGapAnchorCanonicalClearedExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio s -
        c2ExactGapAnchorCanonicalClearedLowerFactorCost s := by
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedReserve
  unfold c2ExactGapAnchorCanonicalClearedMargin
  unfold c2ExactGapAnchorCanonicalClearedExternalDebit
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorCost
  rfl

/--
Pointwise component bridge: lower/upper envelopes plus the strict cleared
ledger imply positivity of the canonical lower-factor surplus.
-/
theorem C2ExactGapAnchorCanonicalClearedSurplusPositive_of_envelopeLedger
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBound
        marginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
        lowerFactorCostUpper s)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedger
        marginLower externalDebitUpper lowerFactorCostUpper s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound at hcost
  unfold C2ExactGapAnchorCanonicalClearedEnvelopeLedger at hledger
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
  linarith

/--
Global middle component bridge from the cleared envelope ledger to surplus
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorCostUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalClearedSurplusPositive_of_envelopeLedger
      (hmargin hs) (hdebit hs) (hcost hs) (hledger hs)

/-- Cleared margin lower induced by a raw quartet-margin lower. -/
noncomputable def c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
    (marginLower : ℂ → ℝ) : ℂ → ℝ :=
  fun s => marginLower s * (1 - ‖q s‖) ^ 2

/-- Cleared external-debit upper induced by an external-debit upper. -/
noncomputable def c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
    (externalDebitUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => externalDebitUpper s * (1 - ‖q s‖)

/-- Cleared lower-factor cost upper induced by a lower-factor upper. -/
noncomputable def c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
    (lowerFactorUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2ExactGapAnchorCanonicalLowerFactorClearedWeight s *
      lowerFactorUpper s

/-- Upper envelope for the exact lower-factor term before applying its weight. -/
noncomputable def C2ExactGapAnchorCanonicalLowerFactorUpperBound
    (lowerFactorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s ≤
    lowerFactorUpper s

/-- Global middle upper envelope for the exact lower-factor term. -/
noncomputable def C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (lowerFactorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorUpperBound
      lowerFactorUpper s

/-- The exact lower-factor term is its own sharp upper envelope. -/
theorem C2ExactGapAnchorCanonicalLowerFactorUpperBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalLowerFactorUpperBound
      c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s := by
  unfold C2ExactGapAnchorCanonicalLowerFactorUpperBound
  exact le_rfl

/-- Global middle version of the exact lower-factor upper envelope. -/
theorem C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
      c2ContinuedVerticalAnchorResidualExactLowerFactorUpper near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalLowerFactorUpperBound_exact

/--
Weighted raw-envelope ledger for the lower-factor surplus.  This keeps the
chosen envelopes before clearing but applies the exact clearing weights.
-/
noncomputable def C2ExactGapAnchorCanonicalWeightedEnvelopeLedger
    (marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
      externalDebitUpper s +
    c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
      lowerFactorUpper s <
    c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
      marginLower s

/-- Global middle version of the weighted raw-envelope ledger. -/
noncomputable def C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalWeightedEnvelopeLedger
      marginLower externalDebitUpper lowerFactorUpper s

/-- Raw margin lower gives a cleared-margin lower on the off-critical strip. -/
theorem C2ExactGapAnchorCanonicalClearedMarginLowerBound_of_marginLower
    {marginLower : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBound marginLower s) :
    C2ExactGapAnchorCanonicalClearedMarginLowerBound
      (c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
        marginLower) s := by
  have hgap_sq_nonneg : 0 ≤ (1 - ‖q s‖) ^ 2 := sq_nonneg _
  unfold C2ExactGapAnchorCanonicalMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalClearedMarginLowerBound
  unfold c2ExactGapAnchorCanonicalClearedMargin
  unfold c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
  exact mul_le_mul_of_nonneg_right hmargin hgap_sq_nonneg

/-- Global middle cleared-margin lower induced by a raw margin lower. -/
theorem
    C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_of_marginLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {marginLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge) :
    C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
      (c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
        marginLower) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalClearedMarginLowerBound_of_marginLower
      (hmargin hs)

/--
External-debit upper gives a cleared external-debit upper on the off-critical
strip.
-/
theorem C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound_of_debitUpper
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s) :
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
        externalDebitUpper) s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
  unfold c2ExactGapAnchorCanonicalClearedExternalDebit
  unfold c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
  unfold c2ExactGapAnchorCanonicalExternalDebit at hdebit
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebit at hdebit
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
  exact mul_le_mul_of_nonneg_right hdebit hgap_nonneg

/-- Global middle cleared external-debit upper induced by a debit upper. -/
theorem
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle_of_debitUpper
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
        externalDebitUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound_of_debitUpper
      hs.1 (hdebit hs)

/-- A lower-factor upper gives the cleared lower-factor cost upper. -/
theorem
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound_of_factorUpper
    {lowerFactorUpper : ℂ → ℝ}
    {s : ℂ}
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBound
        lowerFactorUpper s) :
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
      (c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
        lowerFactorUpper) s := by
  have hweight_nonneg :
      0 ≤ c2ExactGapAnchorCanonicalLowerFactorClearedWeight s := by
    have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
    have hone_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
    unfold c2ExactGapAnchorCanonicalLowerFactorClearedWeight
    exact mul_nonneg hone_nonneg (sq_nonneg _)
  unfold C2ExactGapAnchorCanonicalLowerFactorUpperBound at hfactor
  unfold C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorCost
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
  exact mul_le_mul_of_nonneg_left hfactor hweight_nonneg

/-- Global middle cleared lower-factor cost upper from a lower-factor upper. -/
theorem
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle_of_factorUpper
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge) :
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
      (c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
        lowerFactorUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound_of_factorUpper
      (hfactor hs)

/-- The weighted raw-envelope ledger is the cleared ledger for induced terms. -/
theorem C2ExactGapAnchorCanonicalClearedEnvelopeLedger_of_weightedLedger
    {marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {s : ℂ}
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedger
        marginLower externalDebitUpper lowerFactorUpper s) :
    C2ExactGapAnchorCanonicalClearedEnvelopeLedger
      (c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
        marginLower)
      (c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
        externalDebitUpper)
      (c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
        lowerFactorUpper) s := by
  unfold C2ExactGapAnchorCanonicalWeightedEnvelopeLedger at hledger
  unfold C2ExactGapAnchorCanonicalClearedEnvelopeLedger
  exact hledger

/-- Global middle cleared ledger induced by the weighted raw-envelope ledger. -/
theorem
    C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle_of_weightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
      (c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
        marginLower)
      (c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
        externalDebitUpper)
      (c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
        lowerFactorUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalClearedEnvelopeLedger_of_weightedLedger
      (hledger hs)

/--
Raw-envelope component bridge: margin/debit/lower-factor envelopes plus the
weighted ledger imply positivity of the canonical lower-factor surplus.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
    (C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_of_marginLower
      hmargin)
    (C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle_of_debitUpper
      hdebit)
    (C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle_of_factorUpper
      hfactor)
    (C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle_of_weightedLedger
      hledger)

/--
No-loss weighted envelope ledger with exact quartet margin, exact canonical
external debit, and the exact lower-factor upper.
-/
noncomputable def C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalWeightedEnvelopeLedger
    c2ExpandedQuartetResidualMargin
    (c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio)
    c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s

/-- Global middle version of the no-loss weighted envelope ledger. -/
noncomputable def
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The no-loss weighted envelope ledger is lower-factor surplus positivity. -/
theorem
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_iff_surplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget
  unfold C2ExactGapAnchorCanonicalWeightedEnvelopeLedger
  unfold c2ExactGapAnchorCanonicalClearedMarginLowerFromMargin
  unfold c2ExactGapAnchorCanonicalClearedExternalDebitUpperFromDebit
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorCostUpperFromFactor
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedReserve
  unfold c2ExactGapAnchorCanonicalExternalDebit
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebit
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
  constructor <;> intro h <;> linarith

/--
Global middle equivalence between the no-loss weighted envelope ledger and
lower-factor surplus positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hledger s hs
    exact
      (C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hledger hs)
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hsurplus hs)

/-- The lower-tail cleared weight is positive on the off-critical strip. -/
theorem c2ExactGapAnchorCanonicalLowerFactorClearedWeight_pos_of_offCriticalStrip
    {s : ℂ}
    (_hoff : offCriticalStrip s) :
    0 < c2ExactGapAnchorCanonicalLowerFactorClearedWeight s := by
  have hq_ne : q s ≠ 0 := by
    unfold q verticalRatio
    exact complexDirichletDepthRatio_ne_zero s
  have hq_pos : 0 < ‖q s‖ := by
    simpa using norm_pos_iff.mpr hq_ne
  have hone_pos : 0 < 1 + ‖q s‖ := by
    linarith
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedWeight
  positivity

/--
The lower-tail factor cleared budget is exactly positivity of the cleared
surplus.
-/
theorem C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_surplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalLowerFactorClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedBudget
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedReserve
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedWeight
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget
  constructor <;> intro h <;> nlinarith

/--
Global middle equivalence between lower-tail factor cleared budget and surplus
positivity.
-/
theorem C2ExactGapAnchorCanonicalLowerFactorClearedOnMiddle_iff_surplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hsurplus hs)

/--
The unit-reserve budget is exactly the lower-tail factor cleared budget.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_cleared
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  set W := c2ExactGapAnchorCanonicalLowerFactorClearedWeight s
  set G := c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s
  set D :=
    c2ExactGapAnchorCanonicalExternalDebitComponentUpper
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) s
  set Q := c2ExpandedQuartetResidualMargin s
  set a := 1 - ‖q s‖
  have hW_pos : 0 < W := by
    simpa [W] using
      c2ExactGapAnchorCanonicalLowerFactorClearedWeight_pos_of_offCriticalStrip
        (s := s) hoff
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedReserve
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedBudget
  unfold C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget
  rw [lt_div_iff₀ hW_pos]
  constructor
  · intro h
    simpa [W, G, D, Q, a,
      c2ExactGapAnchorCanonicalLowerFactorClearedWeight] using
      (by nlinarith : W * G + D * a < Q * a ^ 2)
  · intro h
    have h' : G * W < Q * a ^ 2 - D * a := by
      have hcleared : W * G + D * a < Q * a ^ 2 := by
        simpa [W, G, D, Q, a,
          c2ExactGapAnchorCanonicalLowerFactorClearedWeight] using h
      nlinarith
    simpa [W, G, D, Q, a] using h'

/--
The lower-tail factor unit-reserve budget is exactly positivity of the cleared
surplus.
-/
theorem C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_surplus
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_cleared
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).trans
    (C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_surplus
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s))

/--
Global middle equivalence between lower-tail factor unit reserve and surplus
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_surplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hunit s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hunit hs)
  · intro hsurplus s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_surplus
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hsurplus hs)

set_option linter.style.longLine false

/--
The canonical lower-factor cleared budget is the operator-side anchor-residual
cleared budget.
-/
theorem C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_anchorResidual
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalLowerFactorClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedBudget
  unfold C2ExactGapAnchorCanonicalAnchorResidualClearedBudget
  exact
    C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget_exactLowerFactorUpper_iff_anchorResidualComponentClearedBudget
      (K := K) (M := M)
      (genuineBudget := c2GenuineCentralExactUpper)
      (continuedBudget := c2ContinuedCentralExactUpper)
      (horizontalBudgetUpper :=
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
      (cutoffBudgetUpper := c2RawCentralCutoffNormConstant K M)
      (s := s)

set_option linter.style.longLine true

/--
The unit-reserve target is equivalent to the canonical anchor-residual cleared
target on the middle region.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hunit s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_anchorResidual
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1
        ((C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_cleared
          (K := K) (M := M)
          (horizontalConstant := horizontalConstant)
          (horizontalScale := horizontalScale)
          (horizontalRatio := horizontalRatio)
          (s := s) hs.1).1 (hunit hs))
  · intro hcleared s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_cleared
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2
        ((C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_anchorResidual
          (K := K) (M := M)
          (horizontalConstant := horizontalConstant)
          (horizontalScale := horizontalScale)
          (horizontalRatio := horizontalRatio)
          (s := s)).2 (hcleared hs))

/--
The cleared surplus target is equivalent to the canonical anchor-residual
cleared target on the middle region.
-/
theorem C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_surplus
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).symm.trans
    (C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge))

/--
The no-loss exact weighted envelope ledger is equivalent to the canonical
anchor-residual cleared target on the middle region.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_anchorResidual
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).trans
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge))

/--
Pressure-share bounds for the exact weighted ledger.  The exact cleared margin
is the local cash balance; the external debit and lower-factor cost consume
the listed local shares of that balance.
-/
noncomputable def C2ExactGapAnchorCanonicalPressureShareBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      externalShare lowerFactorShare : ℂ → ℝ)
    (s : ℂ) : Prop :=
  0 < c2ExactGapAnchorCanonicalClearedMargin s ∧
    c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio s ≤
      externalShare s * c2ExactGapAnchorCanonicalClearedMargin s ∧
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      lowerFactorShare s * c2ExactGapAnchorCanonicalClearedMargin s ∧
    externalShare s + lowerFactorShare s < 1

/--
Pressure-share bounds on a chosen middle filter.
-/
noncomputable def C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (filter : ℂ → Prop)
    (horizontalConstant horizontalScale horizontalRatio
      externalShare lowerFactorShare : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    filter s →
    C2ExactGapAnchorCanonicalPressureShareBounds
      K M horizontalConstant horizontalScale horizontalRatio
      externalShare lowerFactorShare s

/-- A family of filters covers the active middle region. -/
noncomputable def C2ExactGapAnchorCanonicalMiddleFilterCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {ι : Type*}
    (filters : ι → ℂ → Prop)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    ∃ i : ι, filters i s

/-- Pointwise pressure-share bounds close the no-loss weighted envelope ledger. -/
theorem
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_of_pressureShares
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      externalShare lowerFactorShare : ℂ → ℝ}
    {s : ℂ}
    (hpressure :
      C2ExactGapAnchorCanonicalPressureShareBounds
        K M horizontalConstant horizontalScale horizontalRatio
        externalShare lowerFactorShare s) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  rw [C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_iff_surplus]
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
  unfold C2ExactGapAnchorCanonicalPressureShareBounds at hpressure
  rcases hpressure with ⟨hmargin_pos, hdebit, hcost, hshares⟩
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  set a := externalShare s
  set b := lowerFactorShare s
  have hsum_le : D + G ≤ (a + b) * Q := by
    nlinarith
  have hsum_lt : (a + b) * Q < Q := by
    have hmul : (a + b) * Q < 1 * Q :=
      mul_lt_mul_of_pos_right hshares hmargin_pos
    nlinarith
  nlinarith

/--
A cover by pressure-share filters closes the exact weighted envelope ledger on
the whole middle region.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {ι : Type*}
    {filters : ι → ℂ → Prop}
    {externalShare lowerFactorShare : ι → ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalMiddleFilterCover filters near edge)
    (hpressure : ∀ i : ι,
      C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
        (filters i)
        horizontalConstant horizontalScale horizontalRatio
        (externalShare i) (lowerFactorShare i) near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  rcases hcover hs with ⟨i, hfilter⟩
  exact
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_of_pressureShares
      ((hpressure i) hs hfilter)

/-- Constant-share window used by the pressure-filter atlas. -/
structure C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare : ℝ
  lowerFactorShare : ℝ
  externalShare_nonneg : 0 ≤ externalShare
  lowerFactorShare_nonneg : 0 ≤ lowerFactorShare
  share_sum_lt_one : externalShare + lowerFactorShare < 1

/-- Constant external share as a pointwise function. -/
noncomputable def c2ExactGapAnchorCanonicalPressureExternalShare
    (idx : C2ExactGapAnchorCanonicalPressureShareIndex) : ℂ → ℝ :=
  fun _ => idx.externalShare

/-- Constant lower-factor share as a pointwise function. -/
noncomputable def c2ExactGapAnchorCanonicalPressureLowerFactorShare
    (idx : C2ExactGapAnchorCanonicalPressureShareIndex) : ℂ → ℝ :=
  fun _ => idx.lowerFactorShare

/--
Concrete pressure filter for a constant-share window.  A point belongs to this
filter exactly when those two shares pay its exact external debit and exact
lower-factor cost.
-/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexFilter
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (idx : C2ExactGapAnchorCanonicalPressureShareIndex)
    (s : ℂ) : Prop :=
  0 < c2ExactGapAnchorCanonicalClearedMargin s ∧
    c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio s ≤
      idx.externalShare * c2ExactGapAnchorCanonicalClearedMargin s ∧
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      idx.lowerFactorShare * c2ExactGapAnchorCanonicalClearedMargin s

/-- A constant-share pressure filter supplies the generic pressure bounds. -/
theorem C2ExactGapAnchorCanonicalPressureShareBounds_of_indexFilter
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {idx : C2ExactGapAnchorCanonicalPressureShareIndex}
    {s : ℂ}
    (hfilter :
      C2ExactGapAnchorCanonicalPressureShareIndexFilter
        K M horizontalConstant horizontalScale horizontalRatio idx s) :
    C2ExactGapAnchorCanonicalPressureShareBounds
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalPressureExternalShare idx)
      (c2ExactGapAnchorCanonicalPressureLowerFactorShare idx) s := by
  unfold C2ExactGapAnchorCanonicalPressureShareIndexFilter at hfilter
  unfold C2ExactGapAnchorCanonicalPressureShareBounds
  unfold c2ExactGapAnchorCanonicalPressureExternalShare
  unfold c2ExactGapAnchorCanonicalPressureLowerFactorShare
  rcases hfilter with ⟨hmargin, hdebit, hcost⟩
  exact ⟨hmargin, hdebit, hcost, idx.share_sum_lt_one⟩

/--
If constant-share pressure windows cover the middle, the exact weighted ledger
closes on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalMiddleFilterCover
        (fun idx =>
          C2ExactGapAnchorCanonicalPressureShareIndexFilter
            K M horizontalConstant horizontalScale horizontalRatio idx)
        near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
    (filters :=
      fun idx =>
        C2ExactGapAnchorCanonicalPressureShareIndexFilter
          K M horizontalConstant horizontalScale horizontalRatio idx)
    (externalShare :=
      fun idx => c2ExactGapAnchorCanonicalPressureExternalShare idx)
    (lowerFactorShare :=
      fun idx => c2ExactGapAnchorCanonicalPressureLowerFactorShare idx)
    hcover
    (by
      intro idx s _hs hfilter
      exact C2ExactGapAnchorCanonicalPressureShareBounds_of_indexFilter
        hfilter)

/-- Finite list cover by constant-share pressure windows. -/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (atlas : List C2ExactGapAnchorCanonicalPressureShareIndex)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    ∃ idx : C2ExactGapAnchorCanonicalPressureShareIndex,
      idx ∈ atlas ∧
        C2ExactGapAnchorCanonicalPressureShareIndexFilter
          K M horizontalConstant horizontalScale horizontalRatio idx s

/-- A finite list cover induces the generic constant-share pressure cover. -/
theorem C2ExactGapAnchorCanonicalMiddleFilterCover_of_pressureShareIndexListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalMiddleFilterCover
      (fun idx =>
        C2ExactGapAnchorCanonicalPressureShareIndexFilter
          K M horizontalConstant horizontalScale horizontalRatio idx)
      near edge := by
  intro s hs
  rcases hcover hs with ⟨idx, _hmem, hfilter⟩
  exact ⟨idx, hfilter⟩

/-- A finite list cover by pressure windows closes the exact weighted ledger. -/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
    (C2ExactGapAnchorCanonicalMiddleFilterCover_of_pressureShareIndexListCover
      hcover)

/-- Exact external pressure normalized by the exact cleared margin. -/
noncomputable def c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Exact lower-factor pressure normalized by the exact cleared margin. -/
noncomputable def c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalClearedLowerFactorCost s /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Genuine central component of the normalized cleared external pressure. -/
noncomputable def c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
    (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * (1 + ‖q s‖) * c2GenuineCentralExactUpper s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Continued central component of the normalized cleared external pressure. -/
noncomputable def
    c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
    (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * (1 + ‖q s‖) * c2ContinuedCentralExactUpper s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Horizontal component of the normalized cleared external pressure. -/
noncomputable def c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * 2 *
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Cutoff component of the normalized cleared external pressure. -/
noncomputable def c2ExactGapAnchorCanonicalClearedCutoffPressureRatio
    (K M : ℕ) (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * 2 * c2RawCentralCutoffNormConstant K M s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Exact component sum for the normalized cleared external pressure. -/
noncomputable def
    c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio s +
    c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s +
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio s +
        c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s

/--
The normalized cleared external pressure is exactly the sum of its four
component pressures.
-/
theorem c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalClearedExternalPressureRatio
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  unfold c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedCutoffPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedExternalDebit
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
  ring

/--
Ratio-box form of a constant-share pressure window.  This is the useful
analytic target: prove the two normalized pressures are below the chosen
shares.
-/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexRatioBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (idx : C2ExactGapAnchorCanonicalPressureShareIndex)
    (s : ℂ) : Prop :=
  0 < c2ExactGapAnchorCanonicalClearedMargin s ∧
    c2ExactGapAnchorCanonicalClearedExternalPressureRatio
        K M horizontalConstant horizontalScale horizontalRatio s ≤
      idx.externalShare ∧
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      idx.lowerFactorShare

/--
Ratio bounds for a constant-share pressure window, with the positive cleared
margin supplied separately.
-/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (idx : C2ExactGapAnchorCanonicalPressureShareIndex)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s ≤
    idx.externalShare ∧
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
    idx.lowerFactorShare

/-- Positive cleared margin plus ratio bounds give a full ratio box. -/
theorem C2ExactGapAnchorCanonicalPressureShareIndexRatioBox_of_ratioBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {idx : C2ExactGapAnchorCanonicalPressureShareIndex}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbounds :
      C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
        K M horizontalConstant horizontalScale horizontalRatio idx s) :
    C2ExactGapAnchorCanonicalPressureShareIndexRatioBox
      K M horizontalConstant horizontalScale horizontalRatio idx s := by
  unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds at hbounds
  unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBox
  exact ⟨hmargin, hbounds⟩

/-- A normalized ratio box implies the corresponding pressure-share filter. -/
theorem C2ExactGapAnchorCanonicalPressureShareIndexFilter_of_ratioBox
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {idx : C2ExactGapAnchorCanonicalPressureShareIndex}
    {s : ℂ}
    (hbox :
      C2ExactGapAnchorCanonicalPressureShareIndexRatioBox
        K M horizontalConstant horizontalScale horizontalRatio idx s) :
    C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio idx s := by
  unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBox at hbox
  unfold C2ExactGapAnchorCanonicalPressureShareIndexFilter
  rcases hbox with ⟨hmargin, hdebitRatio, hcostRatio⟩
  refine ⟨hmargin, ?_, ?_⟩
  · unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio at hdebitRatio
    rw [div_le_iff₀ hmargin] at hdebitRatio
    exact hdebitRatio
  · unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio at hcostRatio
    rw [div_le_iff₀ hmargin] at hcostRatio
    exact hcostRatio

/-- Finite list cover by normalized pressure-ratio boxes. -/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (atlas : List C2ExactGapAnchorCanonicalPressureShareIndex)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    ∃ idx : C2ExactGapAnchorCanonicalPressureShareIndex,
      idx ∈ atlas ∧
        C2ExactGapAnchorCanonicalPressureShareIndexRatioBox
          K M horizontalConstant horizontalScale horizontalRatio idx s

/-- Finite list cover by normalized pressure-ratio bounds. -/
noncomputable def C2ExactGapAnchorCanonicalPressureShareIndexRatioBoundsListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (atlas : List C2ExactGapAnchorCanonicalPressureShareIndex)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    ∃ idx : C2ExactGapAnchorCanonicalPressureShareIndex,
      idx ∈ atlas ∧
        C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
          K M horizontalConstant horizontalScale horizontalRatio idx s

/--
Positive cleared margin on the middle plus a ratio-bounds list cover induces
the full ratio-box list cover.
-/
theorem C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover_of_ratioBoundsListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexRatioBoundsListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover
      atlas horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  rcases hcover hs with ⟨idx, hmem, hbounds⟩
  exact
    ⟨idx, hmem,
      C2ExactGapAnchorCanonicalPressureShareIndexRatioBox_of_ratioBounds
        (hmargin hs) hbounds⟩

/-- A ratio-box list cover induces the pressure-share list cover. -/
theorem C2ExactGapAnchorCanonicalPressureShareIndexListCover_of_ratioListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPressureShareIndexListCover
      atlas horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  rcases hcover hs with ⟨idx, hmem, hbox⟩
  exact
    ⟨idx, hmem,
      C2ExactGapAnchorCanonicalPressureShareIndexFilter_of_ratioBox
        hbox⟩

/--
A finite list cover by normalized pressure-ratio boxes closes the exact
weighted ledger.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexRatioListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
    (C2ExactGapAnchorCanonicalPressureShareIndexListCover_of_ratioListCover
      hcover)

/-- Prototype pressure window with shares `(1/8, 3/4)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 8 : ℝ)
  lowerFactorShare := (3 / 4 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/4, 1/4)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexQuarterQuarter :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 4 : ℝ)
  lowerFactorShare := (1 / 4 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/4, 3/8)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexQuarterThreeEighth :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 4 : ℝ)
  lowerFactorShare := (3 / 8 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(3/8, 1/4)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthQuarter :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (3 / 8 : ℝ)
  lowerFactorShare := (1 / 4 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/4, 1/2)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexQuarterHalf :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 4 : ℝ)
  lowerFactorShare := (1 / 2 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/2, 1/4)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexHalfQuarter :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 2 : ℝ)
  lowerFactorShare := (1 / 4 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(3/8, 3/8)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthThreeEighth :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (3 / 8 : ℝ)
  lowerFactorShare := (3 / 8 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/4, 5/8)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 4 : ℝ)
  lowerFactorShare := (5 / 8 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(5/8, 1/4)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (5 / 8 : ℝ)
  lowerFactorShare := (1 / 4 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(3/8, 1/2)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (3 / 8 : ℝ)
  lowerFactorShare := (1 / 2 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(1/2, 3/8)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (1 / 2 : ℝ)
  lowerFactorShare := (3 / 8 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/-- Prototype pressure window with shares `(3/4, 1/8)`. -/
noncomputable def c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth :
    C2ExactGapAnchorCanonicalPressureShareIndex where
  externalShare := (3 / 4 : ℝ)
  lowerFactorShare := (1 / 8 : ℝ)
  externalShare_nonneg := by norm_num
  lowerFactorShare_nonneg := by norm_num
  share_sum_lt_one := by norm_num

/--
First concrete dyadic atlas for the pressure-share cover.  It keeps every
window strictly below total share `1`, with the largest rows still leaving
`1/8` of exact margin as reserve.
-/
noncomputable def c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas :
    List C2ExactGapAnchorCanonicalPressureShareIndex :=
  [c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter,
   c2ExactGapAnchorCanonicalPressureShareIndexQuarterQuarter,
   c2ExactGapAnchorCanonicalPressureShareIndexQuarterThreeEighth,
   c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthQuarter,
   c2ExactGapAnchorCanonicalPressureShareIndexQuarterHalf,
   c2ExactGapAnchorCanonicalPressureShareIndexHalfQuarter,
   c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthThreeEighth,
   c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth,
   c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter,
   c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf,
   c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth,
   c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth]

/--
Pointwise case split for the first concrete dyadic pressure-share atlas.
-/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexQuarterQuarter s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexQuarterThreeEighth s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthQuarter s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexQuarterHalf s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexHalfQuarter s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthThreeEighth s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf s ∨
  C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio
      c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth s

/--
Specialized cover obligation for the first concrete dyadic pressure-share
atlas.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  C2ExactGapAnchorCanonicalPressureShareIndexListCover
    c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
    horizontalConstant horizontalScale horizontalRatio near edge

/--
Specialized normalized-ratio cover obligation for the prototype dyadic
pressure-share atlas.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover
    c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
    horizontalConstant horizontalScale horizontalRatio near edge

/--
Specialized normalized-ratio-bounds cover obligation for the prototype dyadic
pressure-share atlas.  The positive cleared margin is supplied separately.
-/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  C2ExactGapAnchorCanonicalPressureShareIndexRatioBoundsListCover
    c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
    horizontalConstant horizontalScale horizontalRatio near edge

/--
Aggregate ratio bounds that imply membership in the prototype dyadic pressure
atlas.  This keeps the target scalar: each individual pressure is at most
`5/8`, and their combined pressure is at most `3/4`.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s ≤
    (5 / 8 : ℝ) ∧
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
    (5 / 8 : ℝ) ∧
  c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      (3 / 4 : ℝ)

/-- Middle-region version of the aggregate prototype pressure bounds. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Division-free form of the aggregate prototype pressure bounds.  It compares
the exact cleared debit terms directly against the exact cleared margin.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s ≤
    (5 / 8 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s ∧
  c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
    (5 / 8 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s ∧
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      (3 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s

/-- Middle-region version of the division-free aggregate pressure bounds. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBoundsOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBounds
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Positive cleared margin turns the division-free aggregate payments into the
normalized aggregate pressure bounds.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds_of_clearedAggregateBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBounds
    at hbounds
  unfold C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  have hD : D ≤ (5 / 8 : ℝ) * Q := by simpa [D, Q] using hbounds.1
  have hG : G ≤ (5 / 8 : ℝ) * Q := by
    simpa [G, Q] using hbounds.2.1
  have hsum : D + G ≤ (3 / 4 : ℝ) * Q := by
    simpa [D, G, Q] using hbounds.2.2
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  constructor
  · unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    rw [div_le_iff₀ hQ_pos]
    simpa [D, Q] using hD
  constructor
  · unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
    rw [div_le_iff₀ hQ_pos]
    simpa [G, Q] using hG
  · have hsum_ratio : (D + G) / Q ≤ (3 / 4 : ℝ) := by
      rw [div_le_iff₀ hQ_pos]
      simpa [mul_comm] using hsum
    have hsplit : D / Q + G / Q = (D + G) / Q := by ring
    unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
    simpa [D, G, Q, hsplit]

/--
The closed margin certificate turns division-free aggregate payments on the
middle into normalized aggregate pressure bounds.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle_of_clearedAggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds_of_clearedAggregateBounds
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbounds hs)

/--
Even leaner aggregate target for the enlarged prototype atlas: both normalized
pressures are nonnegative and their total pressure is at most `3/4`.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  0 ≤ c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s ∧
  0 ≤ c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ∧
  c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      (3 / 4 : ℝ)

/-- Middle-region version of total prototype pressure bounds. -/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Minimal normalized total-pressure target: only the sum of the exact external
pressure and the exact lower-factor pressure must fit under `3/4`.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureSumBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      (3 / 4 : ℝ)

/-- Middle-region version of the minimal normalized total-pressure target. -/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureSumBound
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Component-expanded version of the minimal normalized total-pressure target.
This exposes the exact four external-pressure components before adding the
lower-factor pressure.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      (3 / 4 : ℝ)

/-- Middle-region version of the component-expanded minimal sum bound. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Normalized cash left after the exact genuine and continued central pressure
bills are paid.
-/
noncomputable def c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
    (s : ℂ) : ℝ :=
  (3 / 4 : ℝ) -
    (c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio s +
      c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s)

/--
Normalized cash left after the exact central pair and horizontal pressure bills
are paid.
-/
noncomputable def c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair s -
    c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
      horizontalConstant horizontalScale horizontalRatio s

/--
Normalized cash left after the exact central pair, horizontal, and cutoff bills
are paid.
-/
noncomputable def c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
      horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s

/--
Normalized cash left after all five exact pressure bills are paid.  Nonnegativity
of this quantity is exactly the component-expanded `3/4` budget.
-/
noncomputable def c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
      K M horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s

/--
The five-bill sum target is equivalent to asking the lower-factor bill to fit
inside the slack left after central, horizontal, and cutoff have been paid.
-/
theorem C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
          K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
  constructor <;> intro h <;> linarith

/--
The same five-bill target can be read as: cutoff plus lower-factor fit inside
the slack left after central and horizontal have been paid.
-/
theorem C2ExactGapAnchorCanonicalComponentSumBound_iff_cutoff_lower_le_slack
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
          c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
          horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
  constructor <;> intro h <;> linarith

/--
The same five-bill target can be read as: horizontal, cutoff, and lower-factor
fit inside the slack left after the central pair has been paid.
-/
theorem C2ExactGapAnchorCanonicalComponentSumBound_iff_tail_le_centralSlack
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
          horizontalConstant horizontalScale horizontalRatio s +
          c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
          c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
  constructor <;> intro h <;> linarith

/--
The component-expanded target is exactly nonnegativity of the normalized cash
left after all five exact pressure bills are paid.
-/
theorem C2ExactGapAnchorCanonicalComponentSumBound_iff_slack_nonneg
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      0 ≤
        c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
          K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
  unfold c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
  constructor <;> intro h <;> linarith

/--
Middle-region version of the lower-factor-vs-slack diagnostic.
-/
theorem C2ExactGapAnchorCanonicalComponentSumOnMiddle_iff_lowerFactor_le_slack
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      ∀ ⦃s : ℂ⦄,
        s ∈ c2ExpandedScalarMiddleRegion near edge →
        c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
          c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
            K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcomponent hs)
  · intro hslack s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hslack hs)

/--
Middle-region version of the final normalized slack diagnostic.
-/
theorem C2ExactGapAnchorCanonicalComponentSumOnMiddle_iff_slack_nonneg
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      ∀ ⦃s : ℂ⦄,
        s ∈ c2ExpandedScalarMiddleRegion near edge →
        0 ≤
          c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
            K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_slack_nonneg
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcomponent hs)
  · intro hslack s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_slack_nonneg
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hslack hs)

/--
Pointwise five-bill pressure budget.  Each component pressure is paid by its
own pointwise share, and the five shares together fit under `3/4`.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio s ≤
      genuineShare s ∧
    c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s ≤
      continuedShare s ∧
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
          horizontalConstant horizontalScale horizontalRatio s ≤
        horizontalShare s ∧
        c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s ≤
          cutoffShare s ∧
          c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
            lowerFactorShare s ∧
            genuineShare s + continuedShare s + horizontalShare s +
                cutoffShare s + lowerFactorShare s ≤
              (3 / 4 : ℝ)

/-- Middle-region version of the pointwise five-bill pressure budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare s

/--
Five-bill pressure budgets imply the component-expanded minimal sum bound.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound_of_componentShareBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
        K M horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare s) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
    at hbudget
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
  rcases hbudget with
    ⟨hgenuine, hcontinued, hhorizontal, hcutoff, hlower, hshares⟩
  linarith

/--
Five-bill pressure budgets on the middle imply the component-expanded minimal
sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound_of_componentShareBudget
      (hbudget hs)

/--
No-loss choice of shares: every bill is paid by its exact normalized pressure.
This is the finest baseline before replacing individual shares by usable
upper bounds.
-/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
    K M horizontalConstant horizontalScale horizontalRatio
    c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
    c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
    (c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
      horizontalConstant horizontalScale horizontalRatio)
    (c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M)
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s

/-- Middle-region version of the exact no-loss component-share budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Exact component shares are equivalent to the component-expanded minimal sum
bound.
-/
theorem
    C2ExactGapAnchorCanonicalExactShareBudget_iff_componentSumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hbudget
    unfold C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
      at hbudget
    exact
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound_of_componentShareBudget
        hbudget
  · intro hcomponent
    unfold C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
    unfold C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
    unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
      at hcomponent
    unfold c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
      at hcomponent
    exact ⟨le_rfl, le_rfl, le_rfl, le_rfl, le_rfl, hcomponent⟩

/--
On the middle, exact component shares are equivalent to the
component-expanded minimal sum bound.
-/
theorem
    C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactShareBudget_iff_componentSumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalExactShareBudget_iff_componentSumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hcomponent hs)

/--
First-bill replacement target: only the genuine central pressure is paid by a
chosen share; the other four bills remain exact.
-/
noncomputable def C2ExactGapAnchorCanonicalGenuinePressureShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineShare : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio s ≤
      genuineShare s ∧
    genuineShare s +
      c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s +
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio s +
      c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        (3 / 4 : ℝ)

/-- Middle-region version of the first-bill genuine-pressure share target. -/
noncomputable def C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineShare : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalGenuinePressureShareBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineShare s

/--
Refined first-bill share induced by an upper for only the genuine central
numerator.  The exact geometric factor and exact cleared margin are preserved.
-/
noncomputable def c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper
    (genuineUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * (1 + ‖q s‖) * genuineUpper s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Pointwise upper for the genuine central numerator. -/
noncomputable def C2ExactGapAnchorCanonicalGenuineCentralUpperBound
    (genuineUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  c2GenuineCentralExactUpper s ≤ genuineUpper s

/-- Middle-region pointwise upper for the genuine central numerator. -/
noncomputable def C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (genuineUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s

/--
A numerator upper pays the genuine central pressure once normalized by the
same exact geometric factor and exact cleared margin.
-/
theorem c2ExactGapAnchorCanonicalGenuinePressure_le_shareFromUpper
    {genuineUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hupper :
      C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s) :
    c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio s ≤
      c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s := by
  unfold C2ExactGapAnchorCanonicalGenuineCentralUpperBound at hupper
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  have hone_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
  set F := (1 - ‖q s‖) * (1 + ‖q s‖)
  have hF_nonneg : 0 ≤ F := by
    simpa [F] using mul_nonneg hgap_nonneg hone_nonneg
  have hmul :
      F * c2GenuineCentralExactUpper s ≤ F * genuineUpper s :=
    mul_le_mul_of_nonneg_left hupper hF_nonneg
  unfold c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
  unfold c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper
  simpa [F] using div_le_div_of_nonneg_right hmul (le_of_lt hmargin)

/--
First-bill budget where the chosen genuine share is induced by a refined upper
for the genuine central numerator.
-/
noncomputable def C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s ∧
    c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s +
      c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s +
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio s +
      c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        (3 / 4 : ℝ)

/-- Middle-region version of the refined first-bill upper-share budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s

/--
The refined upper-share budget is a first-bill genuine-pressure share budget.
-/
theorem C2ExactGapAnchorCanonicalGenuineShareBudget_of_upperShare
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudget
        K M horizontalConstant horizontalScale horizontalRatio genuineUpper s) :
    C2ExactGapAnchorCanonicalGenuinePressureShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper)
      s := by
  unfold C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudget at hbudget
  unfold C2ExactGapAnchorCanonicalGenuinePressureShareBudget
  exact
    ⟨c2ExactGapAnchorCanonicalGenuinePressure_le_shareFromUpper
        hoff hmargin hbudget.1,
      hbudget.2⟩

/--
Middle-region refined upper-share budgets give first-bill genuine-pressure
share budgets.
-/
theorem C2ExactGapAnchorCanonicalGenuineShareBudgetOnMiddle_of_upperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalGenuineShareBudget_of_upperShare
      hs.1
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbudget hs)

/--
Refined second-bill share induced by an upper for only the continued central
numerator.  The same exact central geometric factor and cleared margin are
preserved.
-/
noncomputable def c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
    (continuedUpper : ℂ → ℝ) (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * (1 + ‖q s‖) * continuedUpper s) /
    c2ExactGapAnchorCanonicalClearedMargin s

/-- Pointwise upper for the continued central numerator. -/
noncomputable def C2ExactGapAnchorCanonicalContinuedCentralUpperBound
    (continuedUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  c2ContinuedCentralExactUpper s ≤ continuedUpper s

/-- Middle-region pointwise upper for the continued central numerator. -/
noncomputable def C2ExactGapAnchorCanonicalContinuedCentralUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (continuedUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound continuedUpper s

/-- A continued-central bound is exactly a canonical continued numerator upper. -/
theorem
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_continuedBound
    {continuedUpper : ℂ → ℝ} {s : ℂ}
    (hcontinued : C2ContinuedCentralBound continuedUpper s) :
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound
      continuedUpper s := by
  simpa [C2ExactGapAnchorCanonicalContinuedCentralUpperBound,
    C2ContinuedCentralBound, c2ContinuedCentralExactUpper] using hcontinued

/--
An odd-channel upper induces the canonical continued numerator upper through
`c2ContinuedCentralFromOddUpper`.
-/
theorem C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
    {oddUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s) :
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound
      (c2ContinuedCentralFromOddUpper oddUpper) s :=
  C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_continuedBound
    (c2ContinuedCentralBound_of_oddChannelBound hoff hodd)

/-- Middle-region version of the inherited continued numerator upper. -/
theorem
    C2ExactGapAnchorCanonicalContinuedCentralUpperBoundOnMiddle_of_oddChannel
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hodd : C2ContinuedOddChannelBoundOnMiddle oddUpper near edge) :
    C2ExactGapAnchorCanonicalContinuedCentralUpperBoundOnMiddle
      (c2ContinuedCentralFromOddUpper oddUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
      hs.1 (hodd hs)

/--
A numerator upper pays the continued central pressure once normalized by the
same exact geometric factor and exact cleared margin.
-/
theorem c2ExactGapAnchorCanonicalContinuedPressure_le_shareFromUpper
    {continuedUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hupper :
      C2ExactGapAnchorCanonicalContinuedCentralUpperBound continuedUpper s) :
    c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio s ≤
      c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
        continuedUpper s := by
  unfold C2ExactGapAnchorCanonicalContinuedCentralUpperBound at hupper
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  have hone_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
  set F := (1 - ‖q s‖) * (1 + ‖q s‖)
  have hF_nonneg : 0 ≤ F := by
    simpa [F] using mul_nonneg hgap_nonneg hone_nonneg
  have hmul :
      F * c2ContinuedCentralExactUpper s ≤ F * continuedUpper s :=
    mul_le_mul_of_nonneg_left hupper hF_nonneg
  unfold c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
  unfold c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
  simpa [F] using div_le_div_of_nonneg_right hmul (le_of_lt hmargin)

/--
Central-pair budget: the genuine and continued central bills are both paid by
refined numerator uppers; the horizontal, cutoff, and lower-factor bills remain
exact.
-/
noncomputable def C2ExactGapAnchorCanonicalCentralPairUpperShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper continuedUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s ∧
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound continuedUpper s ∧
      c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s +
        c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
          continuedUpper s +
        c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
          horizontalConstant horizontalScale horizontalRatio s +
        c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
        c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
          (3 / 4 : ℝ)

/-- Middle-region version of the refined central-pair upper-share budget. -/
noncomputable def C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper continuedUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper s

/--
The refined central-pair upper-share target is a five-bill component-share
budget.
-/
theorem C2ExactGapAnchorCanonicalComponentShareBudget_of_centralPairUpperShare
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudget
        K M horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper s) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper)
      (c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper continuedUpper)
      (c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio)
      (c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M)
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s := by
  unfold C2ExactGapAnchorCanonicalCentralPairUpperShareBudget at hbudget
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
  rcases hbudget with ⟨hgenuine, hcontinued, hcash⟩
  exact
    ⟨c2ExactGapAnchorCanonicalGenuinePressure_le_shareFromUpper
        hoff hmargin hgenuine,
      c2ExactGapAnchorCanonicalContinuedPressure_le_shareFromUpper
        hoff hmargin hcontinued,
      le_rfl,
      le_rfl,
      le_rfl,
      hcash⟩

/--
Middle-region refined central-pair upper-share budgets give five-bill
component-share budgets.
-/
theorem
    C2ExactGapAnchorCanonicalComponentShareBudgetOnMiddle_of_centralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper)
      (c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper continuedUpper)
      (c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio)
      (c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M)
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalComponentShareBudget_of_centralPairUpperShare
      hs.1
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbudget hs)

/--
Central-pair budget with the continued bill inherited from a continued
odd-channel upper.  The remaining three bills are still exact.
-/
noncomputable def C2ExactGapAnchorCanonicalCentralPairOddShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper oddUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s ∧
    C2ContinuedOddChannelBound oddUpper s ∧
      c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s +
        c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
          (c2ContinuedCentralFromOddUpper oddUpper) s +
        c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
          horizontalConstant horizontalScale horizontalRatio s +
        c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
        c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
          (3 / 4 : ℝ)

/-- Middle-region version of the odd-inherited central-pair budget. -/
noncomputable def C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper oddUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairOddShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper s

/--
Odd-inherited central-pair budgets are central-pair upper-share budgets with
`continuedUpper = c2ContinuedCentralFromOddUpper oddUpper`.
-/
theorem
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudget_of_oddShare
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudget
        K M horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper s) :
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineUpper (c2ContinuedCentralFromOddUpper oddUpper) s := by
  unfold C2ExactGapAnchorCanonicalCentralPairOddShareBudget at hbudget
  unfold C2ExactGapAnchorCanonicalCentralPairUpperShareBudget
  rcases hbudget with ⟨hgenuine, hodd, hcash⟩
  exact
    ⟨hgenuine,
      C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
        hoff hodd,
      hcash⟩

/-- Middle-region conversion from odd-inherited budgets to central-pair budgets. -/
theorem
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle_of_oddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      genuineUpper (c2ContinuedCentralFromOddUpper oddUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalCentralPairUpperShareBudget_of_oddShare
      hs.1 (hbudget hs)

/--
No-loss odd-channel specialization of the central-pair budget.  The continued
bill is inherited from the exact odd-channel norm upper; the cash line is the
only remaining obligation for this specialization.
-/
noncomputable def C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s ∧
    c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s +
      c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
        (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper) s +
      c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio s +
      c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
        (3 / 4 : ℝ)

/-- Middle-region version of the no-loss exact odd-channel central-pair budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s

/--
The cash line left by the no-loss exact odd-channel specialization.  The
continued bill has already been replaced by the upper inherited from
`c2ContinuedOddExactUpper`.
-/
noncomputable def C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper s +
    c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
      (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper) s +
    c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
      horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M s +
    c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
      (3 / 4 : ℝ)

/-- Middle-region version of the exact odd-channel cash line. -/
noncomputable def C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s

/--
Division-free external debit for the exact odd-channel central-pair cash line.
This is the numerator of the first four normalized shares.
-/
noncomputable def
    c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  ((1 - ‖q s‖) * (1 + ‖q s‖) * genuineUpper s) +
    ((1 - ‖q s‖) * (1 + ‖q s‖) *
      c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper s) +
      ((1 - ‖q s‖) * 2 *
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s) +
        ((1 - ‖q s‖) * 2 *
          c2RawCentralCutoffNormConstant K M s)

/--
Extra cleared continued debit paid by the odd-channel inherited upper compared
with the exact continued central debit.
-/
noncomputable def
    c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
    (s : ℂ) : ℝ :=
  (1 - ‖q s‖) * (1 + ‖q s‖) *
    (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper s -
      c2ContinuedCentralExactUpper s)

/--
For the exact genuine upper, the exact odd-channel debit is the canonical exact
external debit plus the continued overshoot introduced by inheriting the
continued bound from the odd-channel norm.
-/
theorem
    c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit_exactGenuine_eq
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio
        c2GenuineCentralExactUpper s =
      c2ExactGapAnchorCanonicalClearedExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio s +
        c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
          s := by
  unfold c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit
  unfold c2ExactGapAnchorCanonicalClearedExternalDebit
  unfold c2ExactGapAnchorCanonicalExternalDebitComponentUpper
  unfold c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
  unfold c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
  ring

/-- The exact odd-channel continued overshoot is nonnegative off the boundary. -/
theorem
    c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot_nonneg
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    0 ≤
      c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
        s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  have hone_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
  have hfactor_nonneg : 0 ≤ (1 - ‖q s‖) * (1 + ‖q s‖) :=
    mul_nonneg hgap_nonneg hone_nonneg
  have hcontinued :
      c2ContinuedCentralExactUpper s ≤
        c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper s :=
    C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
      hoff (c2ContinuedOddChannelBound_exact s)
  have hdiff_nonneg :
      0 ≤
        c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper s -
          c2ContinuedCentralExactUpper s :=
    sub_nonneg.mpr hcontinued
  simpa [
    c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot,
    mul_assoc] using mul_nonneg hfactor_nonneg hdiff_nonneg

/-- Division-free form of the exact odd-channel cash line. -/
noncomputable def C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s +
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      (3 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s

/--
Reserve form of the exact genuine/exact odd-channel cash target: the ordinary
canonical debit and lower-factor cost must fit under `3 / 4` even after paying
the continued overshoot.
-/
noncomputable def
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot s +
      c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
        (3 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s

/--
Remaining `3 / 4` cash after the ordinary canonical external debit and
lower-factor cost are paid.
-/
noncomputable def c2ExactGapAnchorCanonicalExactOddCashSlack
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  (3 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s -
    (c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio s +
      c2ExactGapAnchorCanonicalClearedLowerFactorCost s)

/--
Surplus still available after reserving the mandatory one-quarter cleared
margin.  This is the same remaining cash as `c2ExactGapAnchorCanonicalExactOddCashSlack`,
but expressed in the existing surplus ledger.
-/
noncomputable def c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : ℝ :=
  c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
      K M horizontalConstant horizontalScale horizontalRatio s -
    (1 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s

/--
The exact-odd cash slack is exactly the lower-factor cleared surplus remaining
after the one-quarter margin reserve is set aside.
-/
theorem c2ExactGapAnchorCanonicalExactOddCashSlack_eq_surplusAfterQuarter
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    c2ExactGapAnchorCanonicalExactOddCashSlack
        K M horizontalConstant horizontalScale horizontalRatio s =
      c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold c2ExactGapAnchorCanonicalExactOddCashSlack
  unfold c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
  ring

/-- The overshoot-reserve budget is exactly `overshoot ≤ cash slack`. -/
theorem C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_slack
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot s ≤
        c2ExactGapAnchorCanonicalExactOddCashSlack
          K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
  unfold c2ExactGapAnchorCanonicalExactOddCashSlack
  constructor <;> intro h <;> linarith

/--
Surplus-ledger spelling of the exact-odd overshoot target: after paying the
ordinary canonical debit and lower-factor cost, the surplus beyond the required
one-quarter reserve must cover the continued overshoot.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot s ≤
        c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
          K M horizontalConstant horizontalScale horizontalRatio s := by
  rw [C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_slack]
  rw [c2ExactGapAnchorCanonicalExactOddCashSlack_eq_surplusAfterQuarter]

/-- Middle-region version of the exact odd-channel overshoot-reserve budget. -/
noncomputable def
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Middle-region spelling of the surplus-after-quarter target for the exact-odd
overshoot.
-/
noncomputable def
    C2ExactGapAnchorCanonicalExactOddSurplusAfterQuarterBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot s ≤
      c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
        K M horizontalConstant horizontalScale horizontalRatio s

/--
On the middle, the exact-odd overshoot reserve is the same as the
surplus-after-quarter bound.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddOvershootOnMiddle_iff_surplusAfterQuarter
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactOddSurplusAfterQuarterBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- Middle-region version of the division-free exact odd-channel cash line. -/
noncomputable def
    C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (genuineUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s

/--
The normalized exact odd-channel cash line is equivalent to the division-free
cleared cash inequality whenever the common cleared margin is positive.
-/
theorem C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget_iff_cleared
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s) :
    C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget
        K M horizontalConstant horizontalScale horizontalRatio genuineUpper s ↔
      C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
        K M horizontalConstant horizontalScale horizontalRatio genuineUpper s := by
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
  unfold c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper
  unfold c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
  unfold c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedCutoffPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
  unfold c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set A := (1 - ‖q s‖) * (1 + ‖q s‖) * genuineUpper s
  set B :=
    (1 - ‖q s‖) * (1 + ‖q s‖) *
      c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper s
  set H :=
    (1 - ‖q s‖) * 2 *
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s
  set C := (1 - ‖q s‖) * 2 * c2RawCentralCutoffNormConstant K M s
  set L := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  change
      A / Q + B / Q + H / Q + C / Q + L / Q ≤ (3 / 4 : ℝ) ↔
        A + B + H + C + L ≤ (3 / 4 : ℝ) * Q
  have hsplit :
      A / Q + B / Q + H / Q + C / Q + L / Q =
        (A + B + H + C + L) / Q := by
    ring
  constructor
  · intro hcash
    have hcash' : (A + B + H + C + L) / Q ≤ (3 / 4 : ℝ) := by
      simpa [hsplit] using hcash
    rw [div_le_iff₀ hQ_pos] at hcash'
    simpa [mul_comm] using hcash'
  · intro hcash
    have hcash' : (A + B + H + C + L) / Q ≤ (3 / 4 : ℝ) := by
      rw [div_le_iff₀ hQ_pos]
      simpa [mul_comm] using hcash
    simpa [hsplit] using hcash'

/--
On the middle, the exact odd-channel cash line is equivalent to its
division-free cleared form.
-/
theorem
    C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_iff_cleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge ↔
      C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge := by
  constructor
  · intro hcash s hs
    exact
      (C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget_iff_cleared
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (genuineUpper := genuineUpper)
        (s := s)
        (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)).1
        (hcash hs)
  · intro hcash s hs
    exact
      (C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget_iff_cleared
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (genuineUpper := genuineUpper)
        (s := s)
        (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)).2
        (hcash hs)

/--
With the exact genuine upper, the cleared cash line is exactly the overshoot
reserve budget.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddClearedCash_exactGenuine_iff_overshoot
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2GenuineCentralExactUpper s ↔
      C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudget
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudget
  rw [
    c2ExactGapAnchorCanonicalCentralPairExactOddClearedExternalDebit_exactGenuine_eq]

/--
Middle-region version: exact genuine cleared cash is exactly the overshoot
reserve budget.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddClearedCashOnMiddle_exactGenuine_iff_overshoot
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2GenuineCentralExactUpper near edge ↔
      C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hcash s hs
    exact
      (C2ExactGapAnchorCanonicalExactOddClearedCash_exactGenuine_iff_overshoot
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcash hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactOddClearedCash_exactGenuine_iff_overshoot
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- The exact genuine numerator is a no-loss genuine upper. -/
theorem C2ExactGapAnchorCanonicalGenuineCentralUpperBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalGenuineCentralUpperBound
      c2GenuineCentralExactUpper s := by
  unfold C2ExactGapAnchorCanonicalGenuineCentralUpperBound
  exact le_rfl

/-- Middle-region version of the no-loss exact genuine upper. -/
theorem C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle
      c2GenuineCentralExactUpper near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalGenuineCentralUpperBound_exact

/--
The no-loss exact odd-channel budget is exactly the genuine numerator upper
plus the remaining exact odd-channel cash line.
-/
theorem C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget_iff_cash
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget
      K M horizontalConstant horizontalScale horizontalRatio genuineUpper s ↔
      C2ExactGapAnchorCanonicalGenuineCentralUpperBound genuineUpper s ∧
        C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget
          K M horizontalConstant horizontalScale horizontalRatio
          genuineUpper s := by
  constructor
  · intro hbudget
    unfold C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget at hbudget
    exact
      ⟨hbudget.1, by
        simpa [C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget]
          using hbudget.2⟩
  · intro hbudget
    rcases hbudget with ⟨hgenuine, hcash⟩
    unfold C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget
    exact
      ⟨hgenuine, by
        simpa [C2ExactGapAnchorCanonicalCentralPairExactOddCashBudget]
          using hcash⟩

/--
On the middle, the exact odd-channel budget is equivalent to a genuine upper
and the isolated cash budget.
-/
theorem C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio genuineUpper near edge ↔
      C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle
        genuineUpper near edge ∧
        C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
          horizontalConstant horizontalScale horizontalRatio
          genuineUpper near edge := by
  constructor
  · intro hbudget
    refine ⟨?_, ?_⟩
    · intro s hs
      exact
        (C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget_iff_cash.mp
          (hbudget hs)).1
    · intro s hs
      exact
        (C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget_iff_cash.mp
          (hbudget hs)).2
  · intro hbudget s hs
    exact
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget_iff_cash.mpr
        ⟨hbudget.1 hs, hbudget.2 hs⟩

/-- Rebuild the exact odd-channel central-pair budget from its isolated cash line. -/
theorem C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_cash
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine :
      C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle
        genuineUpper near edge)
    (hcash :
      C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio genuineUpper near edge :=
  C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash.mpr
    ⟨hgenuine, hcash⟩

/-- Rebuild the exact odd-channel central-pair budget from cleared cash. -/
theorem
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_clearedCash
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine :
      C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle
        genuineUpper near edge)
    (hcash :
      C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio genuineUpper near edge :=
  C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_cash
    hgenuine
    ((C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_iff_cleared
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (genuineUpper := genuineUpper)
      (near := near)
      (edge := edge)).2 hcash)

/--
Exact genuine specialization: if the cleared exact odd-channel cash fits, the
second boleto closes with no loss on the genuine numerator.
-/
theorem
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_clearedCash_exactGenuine
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcash :
      C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2GenuineCentralExactUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2GenuineCentralExactUpper near edge :=
  C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_clearedCash
    (C2ExactGapAnchorCanonicalGenuineCentralUpperBoundOnMiddle_exact near edge)
    hcash

/--
Final exact genuine/exact odd-channel cash bridge: proving the overshoot
reserve closes the second boleto.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_overshoot
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2GenuineCentralExactUpper near edge :=
  C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_clearedCash_exactGenuine
    ((C2ExactGapAnchorCanonicalExactOddClearedCashOnMiddle_exactGenuine_iff_overshoot
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

/--
Surplus-ledger final bridge for the second boleto: if the surplus left after
the mandatory quarter reserve pays the continued overshoot, the exact
genuine/exact odd-channel share budget closes.
-/
theorem
    C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_surplusAfterQuarter
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactOddSurplusAfterQuarterBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2GenuineCentralExactUpper near edge :=
  C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_overshoot
    ((C2ExactGapAnchorCanonicalExactOddOvershootOnMiddle_iff_surplusAfterQuarter
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

/-- Extract the isolated exact odd-channel cash line from the central-pair budget. -/
theorem C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_of_shareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio genuineUpper near edge :=
  (C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash.mp
    hbudget).2

/--
The no-loss exact odd-channel central-pair budget is an odd-inherited
central-pair budget with `oddUpper = c2ContinuedOddExactUpper`.
-/
theorem C2ExactGapAnchorCanonicalCentralPairOddShareBudget_of_exactOdd
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget
        K M horizontalConstant horizontalScale horizontalRatio
        genuineUpper s) :
    C2ExactGapAnchorCanonicalCentralPairOddShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineUpper c2ContinuedOddExactUpper s := by
  unfold C2ExactGapAnchorCanonicalCentralPairExactOddShareBudget at hbudget
  unfold C2ExactGapAnchorCanonicalCentralPairOddShareBudget
  exact ⟨hbudget.1, c2ContinuedOddChannelBound_exact s, hbudget.2⟩

/--
Middle-region conversion from no-loss exact odd-channel budgets to
odd-inherited central-pair budgets.
-/
theorem
    C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle_of_exactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      genuineUpper c2ContinuedOddExactUpper near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalCentralPairOddShareBudget_of_exactOdd
      (hbudget hs)

/--
The first-bill genuine-pressure share target is a five-bill share budget with
the other four shares left exact.
-/
theorem C2ExactGapAnchorCanonicalComponentShareBudget_of_genuinePressureShare
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineShare : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudget
        K M horizontalConstant horizontalScale horizontalRatio genuineShare s) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
      K M horizontalConstant horizontalScale horizontalRatio
      genuineShare
      c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
      (c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio)
      (c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M)
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s := by
  unfold C2ExactGapAnchorCanonicalGenuinePressureShareBudget at hbudget
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
  rcases hbudget with ⟨hgenuine, hcash⟩
  exact ⟨hgenuine, le_rfl, le_rfl, le_rfl, le_rfl, hcash⟩

/--
The first-bill genuine-pressure share target on the middle gives the five-bill
share budget on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentShareBudgetOnMiddle_of_genuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      genuineShare
      c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
      (c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
        horizontalConstant horizontalScale horizontalRatio)
      (c2ExactGapAnchorCanonicalClearedCutoffPressureRatio K M)
      c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalComponentShareBudget_of_genuinePressureShare
      (hbudget hs)

/--
The first-bill genuine-pressure share target implies the component-expanded
minimal sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
    (C2ExactGapAnchorCanonicalComponentShareBudgetOnMiddle_of_genuinePressureShare
      hbudget)

/--
The refined first-bill upper-share target implies the component-expanded
minimal sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
    (C2ExactGapAnchorCanonicalGenuineShareBudgetOnMiddle_of_upperShare
      hbudget)

/--
The refined central-pair upper-share target implies the component-expanded
minimal sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
    (C2ExactGapAnchorCanonicalComponentShareBudgetOnMiddle_of_centralPairUpperShare
      hbudget)

/--
The odd-inherited central-pair target implies the component-expanded minimal
sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
    (C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle_of_oddShare
      hbudget)

/--
The no-loss exact odd-channel central-pair target implies the
component-expanded minimal sum bound on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
    (C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle_of_exactOdd
      hbudget)

/-- The component-expanded target is exactly a proof of the minimal sum bound. -/
theorem C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_componentSumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
    at hcomponent
  unfold C2ExactGapAnchorCanonicalPrototypePressureSumBound
  rw [c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum]
  exact hcomponent

/--
The component-expanded normalized target is exactly the minimal normalized sum
target.
-/
theorem C2ExactGapAnchorCanonicalComponentSumBound_iff_sumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureSumBound
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
  unfold C2ExactGapAnchorCanonicalPrototypePressureSumBound
  rw [c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum]

/--
Middle-region component-expanded bounds imply the minimal normalized sum bound.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_componentSumBound
      (hcomponent hs)

/--
On the middle, the component-expanded normalized target is exactly the minimal
normalized sum target.
-/
theorem C2ExactGapAnchorCanonicalComponentSumOnMiddle_iff_sumBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hcomponent s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_sumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hcomponent hs)
  · intro hsum s hs
    exact
      (C2ExactGapAnchorCanonicalComponentSumBound_iff_sumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hsum hs)

/-- Division-free total pressure bound against the exact cleared margin. -/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      (3 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s

/-- Middle-region version of the division-free total pressure bound. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s

/--
No-loss total pressure bound using the allowance/reserve presentation of the
cleared margin.
-/
noncomputable def C2ExactGapAnchorCanonicalAllowanceLowerTotalBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s +
    c2ExactGapAnchorCanonicalClearedLowerFactorCost s ≤
      (3 / 4 : ℝ) *
        c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s

/-- Middle-region version of the no-loss allowance-lower total pressure bound. -/
noncomputable def C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The allowance-lower total bound is exactly the cleared total bound. -/
theorem C2ExactGapAnchorCanonicalAllowanceLowerTotalBound_iff_clearedTotalBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalAllowanceLowerTotalBound
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
  rw [c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq hoff]

/--
On the middle region, the allowance-lower total bound is exactly the cleared
total pressure bound.
-/
theorem C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hallow s hs
    exact
      (C2ExactGapAnchorCanonicalAllowanceLowerTotalBound_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hallow hs)
  · intro hcleared s hs
    exact
      (C2ExactGapAnchorCanonicalAllowanceLowerTotalBound_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hcleared hs)

/--
The minimal normalized sum bound is exactly what is needed to obtain the
division-free total pressure payment.
-/
theorem C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_sumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureSumBound at hsum
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  have hsplit : D / Q + G / Q = (D + G) / Q := by ring
  have hsumDiv : (D + G) / Q ≤ (3 / 4 : ℝ) := by
    unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio at hsum
    unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio at hsum
    simpa [D, G, Q, hsplit] using hsum
  rw [div_le_iff₀ hQ_pos] at hsumDiv
  simpa [D, G, Q, mul_comm] using hsumDiv

/--
Positive cleared margin turns the division-free total pressure payment back
into the minimal normalized sum target.
-/
theorem C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_clearedTotalBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound at hbound
  unfold C2ExactGapAnchorCanonicalPrototypePressureSumBound
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  have hsumDiv : (D + G) / Q ≤ (3 / 4 : ℝ) := by
    rw [div_le_iff₀ hQ_pos]
    simpa [D, G, Q, mul_comm] using hbound
  have hsplit : D / Q + G / Q = (D + G) / Q := by ring
  unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
  simpa [D, G, Q, hsplit] using hsumDiv

/--
With positive cleared margin, the division-free total pressure payment is
exactly the minimal normalized sum target.
-/
theorem C2ExactGapAnchorCanonicalClearedTotalBound_iff_sumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureSumBound
        K M horizontalConstant horizontalScale horizontalRatio s :=
  ⟨C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_clearedTotalBound
      hmargin,
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_sumBound
      hmargin⟩

/--
With positive cleared margin, the division-free total pressure payment is
exactly the five-bill component-expanded normalized target.
-/
theorem C2ExactGapAnchorCanonicalClearedTotalBound_iff_componentSumBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBound
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorCanonicalClearedTotalBound_iff_sumBound
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hmargin).trans
    (C2ExactGapAnchorCanonicalComponentSumBound_iff_sumBound
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s)).symm

/--
Middle-region minimal normalized sum bounds imply the division-free total
pressure payment on the whole middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_sumBound
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hsum hs)

/--
On the middle, division-free total pressure and the minimal normalized sum
target are equivalent.
-/
theorem C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_sumBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbound s hs
    exact
      (C2ExactGapAnchorCanonicalClearedTotalBound_iff_sumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)
        (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)).1
        (hbound hs)
  · intro hsum s hs
    exact
      (C2ExactGapAnchorCanonicalClearedTotalBound_iff_sumBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)
        (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)).2
        (hsum hs)

/--
On the middle, division-free total pressure and the five-bill component target
are equivalent.
-/
theorem
    C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_componentSumOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_sumBoundOnMiddle
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).trans
    (C2ExactGapAnchorCanonicalComponentSumOnMiddle_iff_sumBoundOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).symm

/-- Total pressure bounds contain the minimal normalized sum bound. -/
theorem C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_totalBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact hbounds.2.2

/-- Middle-region total pressure bounds contain the minimal normalized sum bound. -/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_totalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_totalBounds
    (hbounds hs)

/-- Aggregate pressure bounds contain the minimal normalized sum bound. -/
theorem C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_aggregateBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact hbounds.2.2

/--
Middle-region aggregate pressure bounds contain the minimal normalized sum
bound.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_aggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_aggregateBounds
    (hbounds hs)

/--
Normalized total pressure bounds imply the division-free total pressure payment.
-/
theorem C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_totalBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_sumBound
      hmargin
      (C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_totalBounds
        hbounds)

/--
Middle-region normalized total pressure bounds imply the division-free total
pressure payment on the whole middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_totalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_totalBounds
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbounds hs)

/--
Normalized aggregate pressure bounds imply the division-free total pressure
payment.  Only the aggregate `3/4` line is used.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_aggregateBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_sumBound
      hmargin
      (C2ExactGapAnchorCanonicalPrototypePressureSumBound_of_aggregateBounds
        hbounds)

/--
Middle-region normalized aggregate pressure bounds imply the division-free total
pressure payment on the whole middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_aggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_aggregateBounds
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbounds hs)

/--
Normalized total pressure bounds imply the no-loss allowance-lower total
payment.
-/
theorem C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_totalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).2
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_totalBounds
      hbounds)

/--
The minimal normalized sum bound implies the no-loss allowance-lower total
payment.
-/
theorem C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).2
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
      hsum)

/--
The component-expanded minimal sum bound implies the no-loss allowance-lower
total payment.
-/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
    (C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
      hcomponent)

/--
The five-bill pressure budget implies the no-loss allowance-lower total
payment.
-/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
      hbudget)

/-- The exact no-loss component-share budget implies allowance-lower payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_exactShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    ((C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/-- The first-bill genuine-pressure share target implies allowance payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
      hbudget)

/-- The refined first-bill upper-share target implies allowance payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuineUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
      hbudget)

/-- The refined central-pair upper-share target implies allowance payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
      hbudget)

/-- The odd-inherited central-pair target implies allowance payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairOddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
      hbudget)

/-- The no-loss exact odd-channel central-pair target implies allowance payment. -/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairExactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
      hbudget)

/--
Normalized aggregate pressure bounds imply the no-loss allowance-lower total
payment.
-/
theorem
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_aggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).2
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_aggregateBounds
      hbounds)

/--
Surplus-reserve form of the prototype pressure payment: after paying external
debit and lower-factor cost, at least one quarter of the exact cleared margin
remains.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  (1 / 4 : ℝ) * c2ExactGapAnchorCanonicalClearedMargin s ≤
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Middle-region version of the surplus-reserve pressure payment. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
      K M horizontalConstant horizontalScale horizontalRatio s

/-- A one-quarter surplus reserve gives the cleared total pressure payment. -/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_surplusReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hreserve :
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
    at hreserve
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
    at hreserve
  nlinarith

/--
The cleared total pressure payment gives the equivalent one-quarter surplus
reserve form.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_clearedTotalBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
    at hbound
  unfold C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
  nlinarith

/--
The cleared total pressure payment is exactly the one-quarter surplus reserve
form.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_iff_surplusReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
        K M horizontalConstant horizontalScale horizontalRatio s :=
  ⟨C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_clearedTotalBound,
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_surplusReserve⟩

/--
A one-quarter surplus reserve on the middle gives the cleared total pressure
payment on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hreserve :
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_surplusReserve
      (hreserve hs)

/--
The cleared total pressure payment on the middle gives the equivalent
one-quarter surplus reserve form on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_clearedTotalBound
      (hbound hs)

/--
Middle-region cleared total pressure is exactly middle-region one-quarter
surplus reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_iff_surplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  ⟨C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_clearedTotalBound,
    C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve⟩

/-- Upper envelope for the exact cleared margin. -/
noncomputable def C2ExactGapAnchorCanonicalClearedMarginUpperBound
    (marginUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExactGapAnchorCanonicalClearedMargin s ≤ marginUpper s

/-- Middle-region upper envelope for the exact cleared margin. -/
noncomputable def C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalClearedMarginUpperBound marginUpper s

/-- The exact cleared margin is its own sharp upper envelope. -/
theorem C2ExactGapAnchorCanonicalClearedMarginUpperBound_exact
    {s : ℂ} :
    C2ExactGapAnchorCanonicalClearedMarginUpperBound
      c2ExactGapAnchorCanonicalClearedMargin s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginUpperBound
  exact le_rfl

/-- Global middle version of the exact cleared-margin upper. -/
theorem C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
      c2ExactGapAnchorCanonicalClearedMargin near edge := by
  intro s _hs
  exact C2ExactGapAnchorCanonicalClearedMarginUpperBound_exact

/-- The allowance/reserve presentation is also a sharp upper on middle points. -/
theorem C2ExactGapAnchorCanonicalClearedMarginUpperBound_allowanceLower
    {s : ℂ} (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalClearedMarginUpperBound
      c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginUpperBound
  rw [c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq hoff]

/--
Global middle version of the no-loss allowance/reserve cleared-margin upper.
-/
theorem
    C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle_allowanceLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
      c2ExactGapAnchorCanonicalClearedMarginAllowanceLower near edge := by
  intro s hs
  exact C2ExactGapAnchorCanonicalClearedMarginUpperBound_allowanceLower hs.1

/-- Lower envelope for the exact lower-factor cleared surplus. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      surplusLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  surplusLower s ≤
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Middle-region lower envelope for the exact lower-factor cleared surplus. -/
noncomputable def
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      surplusLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound
      K M horizontalConstant horizontalScale horizontalRatio surplusLower s

/--
Component-built lower envelope for the lower-factor cleared surplus.

This is the refined accounting choice: keep a lower envelope for the cleared
margin and upper envelopes for the two costs, then subtract them without any
constant rounding.
-/
noncomputable def
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
    (marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => marginLower s - externalDebitUpper s - lowerFactorCostUpper s

/--
Cleared margin lower plus debit/cost uppers induce a lower envelope for the
lower-factor cleared surplus.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound_of_components
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBound marginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
        lowerFactorCostUpper s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
        marginLower externalDebitUpper lowerFactorCostUpper) s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound at hcost
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
  rw [c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components]
  linarith

/--
Middle-region component envelopes induce the refined lower surplus envelope.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle_of_components
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
        marginLower externalDebitUpper lowerFactorCostUpper)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound_of_components
      (hmargin hs) (hdebit hs) (hcost hs)

/--
Bounded surplus-reserve ledger: the surplus lower envelope pays one quarter of
the margin upper envelope.
-/
noncomputable def C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
    (marginUpper surplusLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  (1 / 4 : ℝ) * marginUpper s ≤ surplusLower s

/-- Middle-region version of the bounded surplus-reserve ledger. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginUpper surplusLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
      marginUpper surplusLower s

/--
Component version of the bounded surplus-reserve ledger.  It asks the
component-built lower surplus to pay one quarter of the selected margin upper.
-/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
    (marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  (1 / 4 : ℝ) * marginUpper s ≤
    c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
      marginLower externalDebitUpper lowerFactorCostUpper s

/-- Middle-region version of the component surplus-reserve ledger. -/
noncomputable def
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
      marginUpper marginLower externalDebitUpper lowerFactorCostUpper s

/--
The component surplus-reserve ledger is the bounded ledger for the
component-built lower surplus.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger_of_componentLedger
    {marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {s : ℂ}
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
        marginUpper marginLower externalDebitUpper lowerFactorCostUpper s) :
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
      marginUpper
      (c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
        marginLower externalDebitUpper lowerFactorCostUpper) s := by
  unfold C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
    at hledger
  unfold C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
  exact hledger

/--
Middle-region component surplus-reserve ledgers induce bounded ledgers.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle_of_componentLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
        marginUpper marginLower externalDebitUpper lowerFactorCostUpper
        near edge) :
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
      marginUpper
      (c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
        marginLower externalDebitUpper lowerFactorCostUpper)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger_of_componentLedger
      (hledger hs)

/--
The sharp no-loss component ledger is exactly the division-free cleared-total
cash inequality.
-/
theorem
    C2ExactGapAnchorCanonicalExactComponentLedger_iff_clearedTotalBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
        c2ExactGapAnchorCanonicalClearedMargin
        c2ExactGapAnchorCanonicalClearedMargin
        (c2ExactGapAnchorCanonicalClearedExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio)
        c2ExactGapAnchorCanonicalClearedLowerFactorCost s ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  change (1 / 4 : ℝ) * Q ≤ Q - D - G ↔ D + G ≤ (3 / 4 : ℝ) * Q
  constructor <;> intro h <;> nlinarith

/--
On the middle, the sharp no-loss component ledger is exactly the
division-free cleared-total cash inequality.
-/
theorem
    C2ExactGapAnchorCanonicalExactComponentLedgerOnMiddle_iff_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
        c2ExactGapAnchorCanonicalClearedMargin
        c2ExactGapAnchorCanonicalClearedMargin
        (c2ExactGapAnchorCanonicalClearedExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio)
        c2ExactGapAnchorCanonicalClearedLowerFactorCost near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hledger s hs
    exact
      (C2ExactGapAnchorCanonicalExactComponentLedger_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hledger hs)
  · intro hbound s hs
    exact
      (C2ExactGapAnchorCanonicalExactComponentLedger_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbound hs)

/--
Margin upper, surplus lower, and the bounded ledger imply the one-quarter
surplus reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_boundedLedger
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginUpper surplusLower : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginUpperBound marginUpper s)
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound
        K M horizontalConstant horizontalScale horizontalRatio surplusLower s)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
        marginUpper surplusLower s) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalClearedMarginUpperBound at hmargin
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound at hsurplus
  unfold C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger
    at hledger
  unfold C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
  exact
    le_trans
      (mul_le_mul_of_nonneg_left hmargin (by norm_num))
      (le_trans hledger hsurplus)

/--
Middle-region bounded surplus-reserve ledgers imply the one-quarter surplus
reserve on the whole middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_boundedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginUpper surplusLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
        marginUpper near edge)
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio surplusLower
        near edge)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
        marginUpper surplusLower near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_boundedLedger
      (hmargin hs) (hsurplus hs) (hledger hs)

/--
Component envelopes plus the component ledger imply the one-quarter surplus
reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_componentLedger
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {s : ℂ}
    (hmarginUpper :
      C2ExactGapAnchorCanonicalClearedMarginUpperBound marginUpper s)
    (hmarginLower :
      C2ExactGapAnchorCanonicalClearedMarginLowerBound marginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
        lowerFactorCostUpper s)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedger
        marginUpper marginLower externalDebitUpper lowerFactorCostUpper s) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
      K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_boundedLedger
    hmarginUpper
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBound_of_components
      hmarginLower hdebit hcost)
    (C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedger_of_componentLedger
      hledger)

/--
Middle-region component envelopes plus the component ledger imply the
one-quarter surplus reserve on the whole middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_componentLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginUpper marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmarginUpper :
      C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
        marginUpper near edge)
    (hmarginLower :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
        marginUpper marginLower externalDebitUpper lowerFactorCostUpper
        near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_componentLedger
      (hmarginUpper hs) (hmarginLower hs) (hdebit hs) (hcost hs)
      (hledger hs)

/--
The quarter unit-reserve budget is exactly the one-quarter surplus reserve
payment.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_surplusReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
        K M horizontalConstant horizontalScale horizontalRatio s := by
  set W := c2ExactGapAnchorCanonicalLowerFactorClearedWeight s
  set F := c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s
  set R :=
    c2ExactGapAnchorCanonicalLowerFactorClearedReserve
      K M horizontalConstant horizontalScale horizontalRatio s
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  have hW_pos : 0 < W := by
    simpa [W] using
      c2ExactGapAnchorCanonicalLowerFactorClearedWeight_pos_of_offCriticalStrip
        (s := s) hoff
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
  unfold C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
  change F ≤ (R - (1 / 4 : ℝ) * Q) / W ↔
    (1 / 4 : ℝ) * Q ≤ R - W * F
  constructor
  · intro h
    rw [le_div_iff₀ hW_pos] at h
    nlinarith
  · intro h
    rw [le_div_iff₀ hW_pos]
    nlinarith

/--
On the middle region, quarter unit-reserve budget and one-quarter surplus
reserve are equivalent.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hunit s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_surplusReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hunit hs)
  · intro hreserve s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_surplusReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hreserve hs)

/--
The quarter unit-reserve budget is also exactly the division-free cleared total
pressure payment.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_clearedTotalBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_surplusReserve
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).trans
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_iff_surplusReserve
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s)).symm

/--
On the middle region, quarter unit reserve is exactly the division-free cleared
total pressure payment.
-/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hunit s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hunit hs)
  · intro hbound s hs
    exact
      (C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_clearedTotalBound
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbound hs)

/--
On the middle region, quarter unit reserve is exactly the no-loss
allowance-lower total pressure payment.
-/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_allowanceLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_clearedTotalBound
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).trans
    (C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).symm

/--
The minimal normalized sum bound implies the quarter unit-reserve budget on the
middle.
-/
theorem C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_sumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_allowanceLower
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).2
    (C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
      hsum)

/--
The component-expanded minimal sum bound implies the quarter unit-reserve
budget on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_sumBound
    (C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
      hcomponent)

/--
The five-bill pressure budget implies the quarter unit-reserve budget on the
middle.
-/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
      hbudget)

/-- The exact no-loss component-share budget implies quarter unit reserve. -/
theorem C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_exactShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    ((C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/-- The first-bill genuine-pressure share target implies quarter unit reserve. -/
theorem C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
      hbudget)

/-- The refined first-bill upper-share target implies quarter unit reserve. -/
theorem C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuineUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
      hbudget)

/-- The refined central-pair upper-share target implies quarter unit reserve. -/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
      hbudget)

/-- The odd-inherited central-pair target implies quarter unit reserve. -/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairOddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
      hbudget)

/--
The no-loss exact odd-channel central-pair target implies quarter unit reserve.
-/
theorem
    C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairExactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
      hbudget)

/--
The quarter unit-reserve budget is stronger than the old unit-reserve budget
whenever the cleared margin is positive.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_of_quarterUnitReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  set W := c2ExactGapAnchorCanonicalLowerFactorClearedWeight s
  set F := c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s
  set R :=
    c2ExactGapAnchorCanonicalLowerFactorClearedReserve
      K M horizontalConstant horizontalScale horizontalRatio s
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  have hW_pos : 0 < W := by
    simpa [W] using
      c2ExactGapAnchorCanonicalLowerFactorClearedWeight_pos_of_offCriticalStrip
        (s := s) hoff
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
    at hunit
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
    at hunit
  have hunit' : F ≤ (R - (1 / 4 : ℝ) * Q) / W := by
    simpa [F, R, Q, W] using hunit
  have hquarter_pos : 0 < (1 / 4 : ℝ) * Q := by positivity
  have hreserve_lt :
      (R - (1 / 4 : ℝ) * Q) / W < R / W := by
    exact div_lt_div_of_pos_right (by linarith) hW_pos
  unfold C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
  unfold c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
  exact lt_of_le_of_lt hunit' hreserve_lt

/--
On the middle, quarter unit-reserve budget implies the old unit-reserve budget.
-/
theorem
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle_of_quarterUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_of_quarterUnitReserve
      hs.1
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hunit hs)

/-- The canonical cleared external debit is nonnegative under scale data. -/
theorem c2ExactGapAnchorCanonicalClearedExternalDebit_nonneg_of_scaleData
    {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hscale :
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s) :
    0 ≤
      c2ExactGapAnchorCanonicalClearedExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hcomponent :
      0 ≤
        c2ExactGapAnchorCanonicalExternalDebitComponentUpper
          c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio)
          (c2RawCentralCutoffNormConstant K M) s :=
    c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper_nonneg_of_component_nonneg
      (by
        unfold c2GenuineCentralExactUpper
        exact norm_nonneg _)
      (by
        unfold c2ContinuedCentralExactUpper
        exact norm_nonneg _)
      (c2HorizontalRegularizedUpper_nonneg_of_pos
        hscale.horizontalScale_pos
        hscale.horizontalConstant_nonneg
        hscale.horizontalRatio_lt_one)
      (c2RawCentralCutoffNormConstant_nonneg K M s)
  have hgap : 0 ≤ 1 - ‖q s‖ := by
    have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
    linarith
  unfold c2ExactGapAnchorCanonicalClearedExternalDebit
  exact mul_nonneg hcomponent hgap

/-- The canonical cleared lower-factor cost is nonnegative. -/
theorem c2ExactGapAnchorCanonicalClearedLowerFactorCost_nonneg
    (s : ℂ) :
    0 ≤ c2ExactGapAnchorCanonicalClearedLowerFactorCost s := by
  have hweight :
      0 ≤ c2ExactGapAnchorCanonicalLowerFactorClearedWeight s := by
    unfold c2ExactGapAnchorCanonicalLowerFactorClearedWeight
    positivity
  have hfactor :
      0 ≤ c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s := by
    unfold c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
    exact div_nonneg (norm_nonneg _)
      (le_of_lt (c2VerticalDepthTailLower_pos s))
  unfold c2ExactGapAnchorCanonicalClearedLowerFactorCost
  exact mul_nonneg hweight hfactor

/--
Scale data and the division-free total pressure bound imply total normalized
pressure bounds.
-/
theorem C2ExactGapAnchorCanonicalPrototypePressureTotalBounds_of_clearedTotalBound
    {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hscale :
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hmargin : 0 < c2ExactGapAnchorCanonicalClearedMargin s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound at hbound
  unfold C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
  set Q := c2ExactGapAnchorCanonicalClearedMargin s
  set D :=
    c2ExactGapAnchorCanonicalClearedExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
  set G := c2ExactGapAnchorCanonicalClearedLowerFactorCost s
  have hQ_pos : 0 < Q := by simpa [Q] using hmargin
  have hD_nonneg : 0 ≤ D := by
    simpa [D] using
      c2ExactGapAnchorCanonicalClearedExternalDebit_nonneg_of_scaleData
        (K := K) (M := M) hoff hscale
  have hG_nonneg : 0 ≤ G := by
    simpa [G] using c2ExactGapAnchorCanonicalClearedLowerFactorCost_nonneg s
  have hsum : D + G ≤ (3 / 4 : ℝ) * Q := by
    simpa [D, G, Q] using hbound
  constructor
  · unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    exact div_nonneg hD_nonneg (le_of_lt hQ_pos)
  constructor
  · unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
    exact div_nonneg hG_nonneg (le_of_lt hQ_pos)
  · have hsum_ratio : (D + G) / Q ≤ (3 / 4 : ℝ) := by
      rw [div_le_iff₀ hQ_pos]
      simpa [mul_comm] using hsum
    have hsplit : D / Q + G / Q = (D + G) / Q := by ring
    unfold c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    unfold c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
    simpa [D, G, Q, hsplit]

/--
Scale data and the cleared total pressure bound imply total pressure bounds on
the middle.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle_of_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureTotalBounds_of_clearedTotalBound
      hs.1 (hscale hs)
      (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed hs)
      (hbound hs)

/--
Total prototype pressure bounds place a point in the enlarged dyadic pressure
atlas.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureAtlasRatioBounds_of_totalBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∃ idx : C2ExactGapAnchorCanonicalPressureShareIndex,
      idx ∈ c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas ∧
        C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
          K M horizontalConstant horizontalScale horizontalRatio idx s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureTotalBounds at hbounds
  set x :=
    c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s
  set y := c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s
  have hx_nonneg : 0 ≤ x := by simpa [x] using hbounds.1
  have hy_nonneg : 0 ≤ y := by simpa [y] using hbounds.2.1
  have hsum : x + y ≤ (3 / 4 : ℝ) := by
    simpa [x, y] using hbounds.2.2
  by_cases hx_eighth : x ≤ (1 / 8 : ℝ)
  · have hy_three_quarter : y ≤ (3 / 4 : ℝ) := by nlinarith
    refine
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        ?_⟩
    unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
    constructor
    · simpa [x,
        c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter]
        using hx_eighth
    · simpa [y,
        c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter]
        using hy_three_quarter
  · have hx_eighth_lt : (1 / 8 : ℝ) < x := lt_of_not_ge hx_eighth
    by_cases hx_quarter : x ≤ (1 / 4 : ℝ)
    · have hy_five_eighth : y ≤ (5 / 8 : ℝ) := by nlinarith
      refine
        ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth,
          by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
          ?_⟩
      unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
      constructor
      · simpa [x, c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth]
          using hx_quarter
      · simpa [y, c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth]
          using hy_five_eighth
    · have hx_quarter_lt : (1 / 4 : ℝ) < x := lt_of_not_ge hx_quarter
      by_cases hx_three_eighth : x ≤ (3 / 8 : ℝ)
      · have hy_half : y ≤ (1 / 2 : ℝ) := by nlinarith
        refine
          ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf,
            by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
            ?_⟩
        unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
        constructor
        · simpa [x,
            c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf]
            using hx_three_eighth
        · simpa [y,
            c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf]
            using hy_half
      · have hx_three_eighth_lt : (3 / 8 : ℝ) < x :=
          lt_of_not_ge hx_three_eighth
        by_cases hx_half : x ≤ (1 / 2 : ℝ)
        · have hy_three_eighth : y ≤ (3 / 8 : ℝ) := by nlinarith
          refine
            ⟨c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth,
              by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
              ?_⟩
          unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
          constructor
          · simpa [x,
              c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth]
              using hx_half
          · simpa [y,
              c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth]
              using hy_three_eighth
        · have hx_half_lt : (1 / 2 : ℝ) < x := lt_of_not_ge hx_half
          by_cases hx_five_eighth : x ≤ (5 / 8 : ℝ)
          · have hy_quarter : y ≤ (1 / 4 : ℝ) := by nlinarith
            refine
              ⟨c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter,
                by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
                ?_⟩
            unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
            constructor
            · simpa [x,
                c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter]
                using hx_five_eighth
            · simpa [y,
                c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter]
                using hy_quarter
          · have hx_five_eighth_lt : (5 / 8 : ℝ) < x :=
              lt_of_not_ge hx_five_eighth
            have hx_three_quarter : x ≤ (3 / 4 : ℝ) := by nlinarith
            have hy_eighth : y ≤ (1 / 8 : ℝ) := by nlinarith
            refine
              ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth,
                by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
                ?_⟩
            unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
            constructor
            · simpa [x,
                c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth]
                using hx_three_quarter
            · simpa [y,
                c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth]
                using hy_eighth

/--
Total pressure bounds on the middle imply the prototype ratio-bounds cover.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_totalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureAtlasRatioBounds_of_totalBounds
      (hbounds hs)

/--
The aggregate prototype bounds place a point in one of the dyadic pressure
windows of the prototype atlas.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureAtlasRatioBounds_of_aggregateBounds
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∃ idx : C2ExactGapAnchorCanonicalPressureShareIndex,
      idx ∈ c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas ∧
        C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
          K M horizontalConstant horizontalScale horizontalRatio idx s := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds at hbounds
  set x :=
    c2ExactGapAnchorCanonicalClearedExternalPressureRatio
      K M horizontalConstant horizontalScale horizontalRatio s
  set y := c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s
  have hx_five : x ≤ (5 / 8 : ℝ) := by simpa [x] using hbounds.1
  have hy_five : y ≤ (5 / 8 : ℝ) := by simpa [y] using hbounds.2.1
  have hsum : x + y ≤ (3 / 4 : ℝ) := by
    simpa [x, y] using hbounds.2.2
  by_cases hx_quarter : x ≤ (1 / 4 : ℝ)
  · refine
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        ?_⟩
    unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
    constructor
    · simpa [x, c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth]
        using hx_quarter
    · simpa [y, c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth]
        using hy_five
  · have hx_quarter_lt : (1 / 4 : ℝ) < x := lt_of_not_ge hx_quarter
    by_cases hx_three_eighth : x ≤ (3 / 8 : ℝ)
    · have hy_half : y ≤ (1 / 2 : ℝ) := by nlinarith
      refine
        ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf,
          by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
          ?_⟩
      unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
      constructor
      · simpa [x,
          c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf]
          using hx_three_eighth
      · simpa [y,
          c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf]
          using hy_half
    · have hx_three_eighth_lt : (3 / 8 : ℝ) < x :=
        lt_of_not_ge hx_three_eighth
      by_cases hx_half : x ≤ (1 / 2 : ℝ)
      · have hy_three_eighth : y ≤ (3 / 8 : ℝ) := by nlinarith
        refine
          ⟨c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth,
            by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
            ?_⟩
        unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
        constructor
        · simpa [x,
            c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth]
            using hx_half
        · simpa [y,
            c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth]
            using hy_three_eighth
      · have hx_half_lt : (1 / 2 : ℝ) < x := lt_of_not_ge hx_half
        have hy_quarter : y ≤ (1 / 4 : ℝ) := by nlinarith
        refine
          ⟨c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter,
            by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
            ?_⟩
        unfold C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
        constructor
        · simpa [x,
            c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter]
            using hx_five
        · simpa [y,
            c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter]
            using hy_quarter

/--
Aggregate prototype pressure bounds on the middle imply the prototype
ratio-bounds cover.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_aggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalPrototypePressureAtlasRatioBounds_of_aggregateBounds
      (hbounds hs)

/--
Cleared-margin positivity plus the prototype ratio-bounds cover induces the
prototype ratio cover.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_ratioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover_of_ratioBoundsListCover
    (atlas := c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas)
    hmargin hcover

/--
Residual-margin positivity plus the prototype ratio-bounds cover induces the
prototype ratio cover.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_ratioBoundsCover
    (C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_of_residualMarginPositive
      hmargin)
    hcover

/--
The direct allowance/reserve budget plus the prototype ratio-bounds cover
induces the prototype ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_allowanceReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
    (C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
      hbudget)
    hcover

/--
The closed allowance/reserve certificate plus the prototype ratio-bounds cover
induces the prototype ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypeRatioCover_of_allowanceReserve
    C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed
    hcover

/--
Aggregate prototype pressure bounds plus the closed allowance/reserve
certificate induce the prototype ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_aggregateBounds
      hbounds)

/--
Total prototype pressure bounds plus the closed allowance/reserve certificate
induce the prototype ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_totalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_totalBounds
      hbounds)

/--
Division-free total pressure payments plus scale data induce the prototype
ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_clearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypeRatioCover_of_totalBounds
    (C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle_of_clearedTotalBound
      hscale hbound)

/--
Analytic allowance positivity plus reserve-share control and the prototype
ratio-bounds cover induces the prototype ratio cover.
-/
theorem C2ExactGapAnchorCanonicalPrototypeRatioCover_of_reserveShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge)
    (hshare :
      C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
    (C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_reserveShareLTOne
      hallow hshare)
    hcover

/-- The prototype ratio cover induces the prototype pressure-share cover. -/
theorem C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_ratioCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPressureShareIndexListCover_of_ratioListCover
    (atlas := c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas)
    hcover

/--
A pointwise case split over the prototype dyadic atlas proves the finite list
cover.
-/
theorem
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_pointwiseCases
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcases : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
      horizontalConstant horizontalScale horizontalRatio near edge := by
  unfold C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
  unfold C2ExactGapAnchorCanonicalPressureShareIndexListCover
  intro s hs
  have hcase := hcases hs
  unfold C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
    at hcase
  rcases hcase with
    hQQ | hQ3 | h3Q | hQH | hHQ | h33 | hQ5 | h5Q | h3H | hH3
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterQuarter,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hQQ⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterThreeEighth,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hQ3⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthQuarter,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        h3Q⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterHalf,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hQH⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexHalfQuarter,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hHQ⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthThreeEighth,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        h33⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexQuarterFiveEighth,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hQ5⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexFiveEighthQuarter,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        h5Q⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexThreeEighthHalf,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        h3H⟩
  · exact
      ⟨c2ExactGapAnchorCanonicalPressureShareIndexHalfThreeEighth,
        by simp [c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas],
        hH3⟩

/--
If the prototype dyadic pressure atlas covers the middle, the exact weighted
ledger closes on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
    (atlas := c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas)
    hcover

/--
If the prototype dyadic pressure-ratio atlas covers the middle, the exact
weighted ledger closes on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasCover
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_ratioCover
      hcover)

/--
Aggregate prototype pressure bounds close the exact weighted ledger on the
middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
      hbounds)

/--
Total prototype pressure bounds close the exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeTotalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_totalBounds
      hbounds)

/--
Division-free total pressure payments plus scale data close the exact weighted
ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_clearedTotalBound
      hscale hbound)

/--
The no-loss allowance-lower total pressure payment plus scale data closes the
exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_allowanceLowerTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbound :
      C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedTotalBound
    hscale
    ((C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbound)

/--
The minimal normalized sum bound plus scale data closes the exact weighted
ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedTotalBound
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
      hsum)

/--
The component-expanded minimal sum bound plus scale data closes the exact
weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureSumBound
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
      hcomponent)

/--
The five-bill pressure budget plus scale data closes the exact weighted ledger
on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
      hbudget)

/--
The exact no-loss component-share budget plus scale data closes the exact
weighted ledger on the middle.
-/
theorem C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_exactShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    ((C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/--
The first-bill genuine-pressure share target plus scale data closes the exact
weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
      hbudget)

/--
The refined first-bill upper-share target plus scale data closes the exact
weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuineUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
      hbudget)

/--
The refined central-pair upper-share target plus scale data closes the exact
weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
      hbudget)

/--
The odd-inherited central-pair target plus scale data closes the exact weighted
ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairOddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
      hbudget)

/--
The no-loss exact odd-channel central-pair target plus scale data closes the
exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairExactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
    hscale
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
      hbudget)

/--
A one-quarter surplus reserve plus scale data closes the exact weighted ledger
on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeSurplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hreserve :
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedTotalBound
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve
      hreserve)

/--
The quarter unit-reserve budget plus scale data closes the exact weighted
ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_quarterUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeSurplusReserve
    hscale
    ((C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hunit)

/--
Division-free aggregate pressure payments close the exact weighted ledger on
the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedAggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAggregateBounds
    (C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle_of_clearedAggregateBounds
      hbounds)

/--
Cleared-margin positivity plus the prototype ratio-bounds cover closes the
exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_ratioBoundsCover
      hmargin hcover)

/--
The closed allowance/reserve certificate plus the prototype ratio-bounds cover
closes the exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
      hcover)

/--
Residual-margin positivity plus the prototype ratio-bounds cover closes the
exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeResidualMarginRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
      hmargin hcover)

/--
Allowance/reserve budget plus the prototype ratio-bounds cover closes the
exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAllowanceReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_allowanceReserve
      hbudget hcover)

/--
Allowance positivity, reserve-share control, and the prototype ratio-bounds
cover close the exact weighted ledger on the middle.
-/
theorem
    C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeReserveShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge)
    (hshare :
      C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasRatioCover
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_reserveShare
      hallow hshare hcover)

/--
The exact canonical components are their own component bounds in the base
expanded exact-gap ledger.
-/
theorem C2ExactGapAnchorCanonicalBaseComponentBoundsOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBoundsOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M)
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge := by
  intro s _hs
  exact
    C2ExactGapAnchorCanonicalExternalDebitComponentBounds_exact
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s)

set_option linter.style.longLine false

/--
The canonical anchor-residual cleared budget pays the canonical exact-gap
collected budget.
-/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcleared :
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge := by
  exact
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_componentBoundsOnMiddle_of_exactFactorUpperBoundOnMiddle_of_componentWeightedPhaseExternalClearedBudgetOnMiddle
      (hcomponents :=
        C2ExactGapAnchorCanonicalBaseComponentBoundsOnMiddle_exact
          (K := K) (M := M)
          (horizontalConstant := horizontalConstant)
          (horizontalScale := horizontalScale)
          (horizontalRatio := horizontalRatio)
          near edge)
      (hgap :=
        C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exactLowerFactorUpper
          (K := K) (M := M)
          (near := near)
          (edge := edge))
      (hbudget :=
        (C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudgetOnMiddle_exactLowerFactorUpper_iff_anchorResidualComponentClearedBudgetOnMiddle
          (K := K) (M := M)
          (genuineBudget := c2GenuineCentralExactUpper)
          (continuedBudget := c2ContinuedCentralExactUpper)
          (horizontalBudgetUpper :=
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio)
          (cutoffBudgetUpper := c2RawCentralCutoffNormConstant K M)
          (near := near)
          (edge := edge)).2 hcleared)

set_option linter.style.longLine true

/--
Direct bridge from the lower-tail factor unit reserve to the canonical collected
budget.
-/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge :=
  C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
    ((C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hunit)

/--
Direct bridge from lower-tail factor cleared surplus positivity to the canonical
collected budget.
-/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge :=
  C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
    ((C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hsurplus)

/-- Direct bridge from the cleared envelope ledger to the collected budget. -/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_clearedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorCostUpper near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge :=
  C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (marginLower := marginLower)
      (externalDebitUpper := externalDebitUpper)
      (lowerFactorCostUpper := lowerFactorCostUpper)
      (near := near)
      (edge := edge)
      hmargin hdebit hcost hledger)

/-- Direct bridge from the weighted raw-envelope ledger to collected budget. -/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_weightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge :=
  C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (marginLower := marginLower)
      (externalDebitUpper := externalDebitUpper)
      (lowerFactorUpper := lowerFactorUpper)
      (near := near)
      (edge := edge)
      hmargin hdebit hfactor hledger)

/-- Direct bridge from the no-loss exact weighted envelope ledger to collected. -/
theorem C2ExactGapAnchorCanonicalCollectedOnMiddle_of_exactWeightedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M) near edge :=
  C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
    ((C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hledger)

/--
Direct bridge from the canonical collected budget to collected slack
positivity.
-/
theorem C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcollected :
      C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).1 hcollected

/--
Direct bridge from the canonical anchor-residual cleared budget to collected
slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_anchorResidualCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcleared :
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
      hcleared)

/--
Direct bridge from the lower-tail factor unit reserve to collected slack
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorUnitReserve
      hunit)

/--
Direct bridge from lower-tail factor cleared surplus positivity to collected
slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
      hsurplus)

/-- Direct bridge from the cleared envelope ledger to collected slack. -/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_clearedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorCostUpper near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_clearedEnvelopeLedger
      hmargin hdebit hcost hledger)

/-- Direct bridge from the weighted raw-envelope ledger to collected slack. -/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_weightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_weightedLedger
      hmargin hdebit hfactor hledger)

/--
Direct bridge from the no-loss exact weighted envelope ledger to collected
slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_exactWeightedEnvelopeLedger
      hledger)

/--
Direct bridge from the closed prototype pressure-ratio-bounds cover to
collected slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_closedPrototypeRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
    (C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
      hcover)

/--
Direct bridge from the division-free prototype cleared-total pressure payment
to collected slack positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeClearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
    (C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeClearedTotalBound
      hscale hbound)

/--
Direct bridge from the one-quarter surplus reserve to collected slack
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hreserve :
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeClearedTotalBound
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve
      hreserve)

/--
Direct bridge from bounded margin/surplus envelopes to collected slack
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_boundedSurplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale marginUpper surplusLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
        marginUpper near edge)
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio surplusLower
        near edge)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
        marginUpper surplusLower near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_boundedLedger
      hmargin hsurplus hledger)

/--
Direct bridge from component margin/debit/cost envelopes to collected slack
positivity.
-/
theorem
    C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_componentSurplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale marginUpper marginLower
      externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hmarginUpper :
      C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
        marginUpper near edge)
    (hmarginLower :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
        marginUpper marginLower externalDebitUpper lowerFactorCostUpper
        near edge) :
    C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
    hscale
    (C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_componentLedger
      hmarginUpper hmarginLower hdebit hcost hledger)

/-- A half-disk radius bound gives the corresponding payment upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound_of_halfDiskBound
    {halfDiskUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhalf : C2ContinuedOddHalfDiskBound halfDiskUpper s) :
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
      (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper) s := by
  have hfactor_nonneg :
      0 ≤ 2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) := by
    have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
    have hone_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
    have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
      le_of_lt (verticalDepthTailUpper_pos_of_offCriticalStrip hoff)
    nlinarith [mul_nonneg hone_nonneg htail_nonneg]
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  unfold c2ExactGapAnchorCanonicalHalfDiskPaymentUpper
  unfold C2ContinuedOddHalfDiskBound at hhalf
  exact mul_le_mul_of_nonneg_left hhalf hfactor_nonneg

/-- Global middle payment upper induced by a half-disk upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_of_halfDisk
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
      (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound_of_halfDiskBound
      hs.1 (hhalf hs)

/-- A raw margin lower gives a weighted-margin lower off the critical strip. -/
theorem C2ExactGapAnchorCanonicalWeightedMarginLowerBound_of_marginLower
    {marginLower : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBound marginLower s) :
    C2ExactGapAnchorCanonicalWeightedMarginLowerBound
      (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin marginLower) s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by linarith
  unfold C2ExactGapAnchorCanonicalMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound
  unfold c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin
  exact mul_le_mul_of_nonneg_right hmargin hgap_nonneg

/-- Global middle weighted-margin lower induced by a raw margin lower. -/
theorem C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle_of_marginLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {marginLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge) :
    C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
      (c2ExactGapAnchorCanonicalWeightedMarginLowerFromMargin marginLower)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalWeightedMarginLowerBound_of_marginLower
      hs.1 (hmargin hs)

/-- Weighted-margin lower and debit upper give a reserve lower. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound_of_weightedMarginDebit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper : ℂ → ℝ}
    {s : ℂ}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBound
        weightedMarginLower s)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBound
        K M horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper s) :
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
        weightedMarginLower externalDebitUpper) s := by
  unfold C2ExactGapAnchorCanonicalWeightedMarginLowerBound at hmargin
  unfold C2ExactGapAnchorCanonicalExternalDebitUpperBound at hdebit
  unfold C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound
  unfold c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
  unfold c2ExactGapAnchorCanonicalExactHalfDiskReserve
  linarith

/-- Global middle reserve lower from weighted-margin lower and debit upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_weightedMarginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      weightedMarginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
        weightedMarginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromWeightedMarginDebit
        weightedMarginLower externalDebitUpper) near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound_of_weightedMarginDebit
      (hmargin hs) (hdebit hs)

/-- Global middle reserve lower from raw-margin lower and debit upper. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_marginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
        marginLower externalDebitUpper) near edge := by
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_weightedMarginDebit
      (C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle_of_marginLower
        hmargin)
      hdebit

/--
Pointwise component bridge: a payment upper below a reserve lower closes the
expanded exact half-disk budget.
-/
theorem C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget_of_upperLower
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {s : ℂ}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound
        paymentUpper s)
    (hreserve :
      C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound
        K M horizontalConstant horizontalScale horizontalRatio
        reserveLower s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
        paymentUpper reserveLower s) :
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBound at hpayment
  unfold C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBound at hreserve
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget at hbudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment at hpayment
  unfold c2ExactGapAnchorCanonicalExactHalfDiskReserve at hreserve
  exact lt_of_le_of_lt hpayment (lt_of_lt_of_le hbudget hreserve)

/-- Global middle component bridge for the expanded exact half-disk budget. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle_of_upperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget_of_upperLower
      (hpayment hs) (hreserve hs) (hbudget hs)

/-- The expanded budget is exactly the no-loss payment/reserve budget. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget_iff_paymentReserve
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
        c2ExactGapAnchorCanonicalExactHalfDiskPayment
        (c2ExactGapAnchorCanonicalExactHalfDiskReserve
          K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudget
  unfold c2ExactGapAnchorCanonicalExactHalfDiskPayment
  unfold c2ExactGapAnchorCanonicalExactHalfDiskReserve
  rfl

/-- Global middle version of the no-loss payment/reserve equivalence. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskExpandedOnMiddle_iff_paymentReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        c2ExactGapAnchorCanonicalExactHalfDiskPayment
        (c2ExactGapAnchorCanonicalExactHalfDiskReserve
          K M horizontalConstant horizontalScale horizontalRatio) near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget_iff_paymentReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget_iff_paymentReserve
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- Pointwise equivalence between radius and cleared exact half-disk budgets. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget_iff_cleared
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hweight_pos :
      0 < c2ExactGapAnchorCanonicalOddGapWeight s :=
    c2ExactGapAnchorCanonicalOddGapWeight_pos_of_offCriticalStrip hoff
  unfold C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
  unfold c2ExactGapAnchorCanonicalHalfDiskUnitReserve
    c2ExactGapAnchorCanonicalOddGapUnitReserve
  constructor
  · intro h
    rw [lt_div_iff₀ (by norm_num : (0 : ℝ) < 2)] at h
    rw [lt_div_iff₀ hweight_pos] at h
    simpa [mul_comm, mul_left_comm, mul_assoc] using h
  · intro h
    rw [lt_div_iff₀ (by norm_num : (0 : ℝ) < 2)]
    rw [lt_div_iff₀ hweight_pos]
    simpa [mul_comm, mul_left_comm, mul_assoc] using h

/-- Global middle equivalence between radius and cleared exact half-disk budgets. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskRadiusOnMiddle_iff_cleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget_iff_cleared
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget_iff_cleared
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbudget hs)

/-- The cleared and expanded exact half-disk scalar budgets are definitionally aligned. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget_iff_expanded
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
  unfold C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
  unfold c2ExactGapAnchorCanonicalOddGapWeight
  unfold c2ContinuedOddExactHalfDiskUpper
  unfold c2ExactGapAnchorCanonicalPhaseReserve
  rfl

/-- Global middle equivalence between cleared and expanded scalar budgets. -/
theorem C2ExactGapAnchorCanonicalExactHalfDiskClearedOnMiddle_iff_expanded
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget_iff_expanded
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/--
The odd-gap unit budget for the half-disk-induced gap upper is exactly the
half-disk radius budget.
-/
theorem C2ExactGapAnchorCanonicalOddGapUnitReserveBudget_iff_halfDiskUnitReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) s ↔
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper s := by
  unfold C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
  unfold C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
  unfold c2ContinuedOddGapUpperFromHalfDisk
  unfold c2ExactGapAnchorCanonicalHalfDiskUnitReserve
  constructor
  · intro h
    rw [lt_div_iff₀ (by norm_num : (0 : ℝ) < 2)]
    simpa [mul_comm, mul_left_comm, mul_assoc] using h
  · intro h
    rw [lt_div_iff₀ (by norm_num : (0 : ℝ) < 2)] at h
    simpa [mul_comm, mul_left_comm, mul_assoc] using h

/-- Global middle version of the half-disk radius equivalence. -/
theorem C2ExactGapAnchorCanonicalOddGapUnitOnMiddle_iff_halfDiskRadiusOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge ↔
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalOddGapUnitReserveBudget_iff_halfDiskUnitReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (halfDiskUpper := halfDiskUpper)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalOddGapUnitReserveBudget_iff_halfDiskUnitReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (halfDiskUpper := halfDiskUpper)
        (s := s)).2 (hbudget hs)

/--
Direct bridge from a half-disk bound and the half-disk radius reserve to the
canonical phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskRadiusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskUnitReserve
    hhalf
    ((C2ExactGapAnchorCanonicalOddGapUnitOnMiddle_iff_halfDiskRadiusOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (halfDiskUpper := halfDiskUpper)
      (near := near)
      (edge := edge)).2 hbudget)

/--
Direct bridge from the no-loss exact half-disk radius budget to the canonical
phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskRadiusReserve
    (C2ContinuedOddHalfDiskBoundOnMiddle_exactHalfDiskUpper
      (near := near) (edge := edge))
    ((C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle_iff
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/-- Direct bridge from the cleared exact half-disk budget to phase reserve. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
    ((C2ExactGapAnchorCanonicalExactHalfDiskRadiusOnMiddle_iff_cleared
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

/-- Direct bridge from the expanded exact half-disk budget to phase reserve. -/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskCleared
    ((C2ExactGapAnchorCanonicalExactHalfDiskClearedOnMiddle_iff_expanded
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

/--
Direct bridge from component payment/reserve estimates to the canonical
phase-reserve budget.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
    (C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle_of_upperLower
      hpayment hreserve hbudget)

/--
Direct bridge from a half-disk upper, raw margin lower, external-debit upper,
and final payment/reserve budget to phase reserve.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
        (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
          marginLower externalDebitUpper) near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
    (C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_of_halfDisk
      hhalf)
    (C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_marginDebit
      hmargin hdebit)
    hbudget

/--
Direct bridge from half-disk upper, raw margin lower, external-debit upper, and
the explicit final scalar budget to phase reserve.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
        halfDiskUpper marginLower externalDebitUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
    hhalf hmargin hdebit
    ((C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle_iff_paymentReserve
      (halfDiskUpper := halfDiskUpper)
      (marginLower := marginLower)
      (externalDebitUpper := externalDebitUpper)
      (near := near)
      (edge := edge)).1 hbudget)

/--
Direct bridge from a half-disk upper and the canonical half-disk phase-reserve
budget to phase reserve.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
    hhalf
    (C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_exact near edge)
    (C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_canonical
      near edge)
    ((C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle_iff_marginDebitScalar
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (halfDiskUpper := halfDiskUpper)
      (near := near)
      (edge := edge)).1 hbudget)

/--
Direct bridge from the exact-radius half-disk phase-reserve budget to phase
reserve.
-/
theorem C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
    (C2ContinuedOddHalfDiskBoundOnMiddle_exactHalfDiskUpper
      (near := near) (edge := edge))
    ((C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_halfDiskPhaseReserve
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/--
Direct bridge from payment upper, phase-reserve lower, and their strict scalar
budget to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
    (C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle_of_upperLower
      hpayment hreserve hbudget)

/--
Direct bridge from the sharp exact payment/reserve budget to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
    ((C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_phaseReserve
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/--
Direct bridge from sharp surplus positivity to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsurplus :
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpUpperLower
    ((C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_surplus
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hsurplus)

/--
Direct bridge from the no-loss weighted ledger to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
    ((C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerOnMiddle_iff_surplus
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hledger)

/--
Direct bridge from the no-loss exact component ledger to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcomponent :
      C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
    ((C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_weighted
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hcomponent)

/--
Direct bridge from the canonical exact-gap collected budget to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcollected :
      C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
    ((C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_collected
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hcollected)

/--
Direct bridge from canonical collected slack positivity to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollectedSlack
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hslack :
      C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
    ((C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hslack)

/--
Direct bridge from the canonical anchor-residual cleared budget to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hcleared :
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
    (C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
      hcleared)

/--
Direct bridge from the lower-tail factor unit reserve to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
    ((C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hunit)

/--
Direct bridge from lower-tail factor cleared surplus positivity to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
    ((C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hsurplus)

/-- Direct bridge from the cleared envelope ledger to phase reserve. -/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_clearedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorCostUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (marginLower := marginLower)
      (externalDebitUpper := externalDebitUpper)
      (lowerFactorCostUpper := lowerFactorCostUpper)
      (near := near)
      (edge := edge)
      hmargin hdebit hcost hledger)

/-- Direct bridge from the weighted raw-envelope ledger to phase reserve. -/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_weightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      marginLower externalDebitUpper lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
    (C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (marginLower := marginLower)
      (externalDebitUpper := externalDebitUpper)
      (lowerFactorUpper := lowerFactorUpper)
      (near := near)
      (edge := edge)
      hmargin hdebit hfactor hledger)

/--
Direct bridge from the no-loss exact weighted envelope ledger to phase reserve.
-/
theorem
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactWeightedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hledger :
      C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
    ((C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hledger)

/-- The canonical phase debit is nonnegative off the critical boundary. -/
theorem c2ExactGapAnchorCanonicalPhaseDebit_nonneg_of_offCriticalStrip
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    0 ≤ c2ExactGapAnchorCanonicalPhaseDebit s := by
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg (q s)
  have hp_nonneg : 0 ≤ 1 + ‖q s‖ := by linarith
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    le_of_lt (verticalDepthTailUpper_pos_of_offCriticalStrip hoff)
  have hfactor_nonneg :
      0 ≤ c2ContinuedVerticalAnchorResidualExactFactorUpper s :=
    c2ContinuedVerticalAnchorResidualExactFactorUpper_nonneg s
  unfold c2ExactGapAnchorCanonicalPhaseDebit
  exact mul_nonneg (mul_nonneg hp_nonneg htail_nonneg) hfactor_nonneg

/-- Any closed phase-reserve budget forces the canonical reserve to be positive. -/
theorem c2ExactGapAnchorCanonicalPhaseReserve_pos_of_phaseReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorCanonicalPhaseReserve
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hdebit_nonneg :
      0 ≤ c2ExactGapAnchorCanonicalPhaseDebit s :=
    c2ExactGapAnchorCanonicalPhaseDebit_nonneg_of_offCriticalStrip hoff
  unfold C2ExactGapAnchorCanonicalPhaseReserveBudget at hbudget
  exact lt_of_le_of_lt hdebit_nonneg hbudget

/-- Global middle positivity of the canonical phase reserve. -/
theorem c2ExactGapAnchorCanonicalPhaseReserve_pos_onMiddle_of_phaseReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      0 <
        c2ExactGapAnchorCanonicalPhaseReserve
          K M horizontalConstant horizontalScale horizontalRatio s := by
  intro s hs
  exact
    c2ExactGapAnchorCanonicalPhaseReserve_pos_of_phaseReserveBudget
      hs.1 (hbudget hs)

/-- Finest current no-division exact-gap budget with canonical external debit. -/
noncomputable def C2ExactGapAnchorCanonicalExternalFactorBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget
    K M
    (c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio)
    s

/-- Global middle version of the canonical external factor budget. -/
noncomputable def C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorCanonicalExternalFactorBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The canonical budget is exactly the phase-debit reserve inequality. -/
theorem C2ExactGapAnchorCanonicalExternalFactorBudget_iff_phaseReserveBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExternalFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorCanonicalPhaseReserveBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorCanonicalExternalFactorBudget
  unfold C2ExactGapAnchorCanonicalPhaseReserveBudget
  unfold C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget
  unfold c2ExactGapAnchorCanonicalPhaseDebit
    c2ExactGapAnchorCanonicalPhaseReserve
  constructor <;> intro h <;> linarith

/-- Global middle version of the phase-reserve equivalence. -/
theorem C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_phaseReserveBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExternalFactorBudget_iff_phaseReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExternalFactorBudget_iff_phaseReserveBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/-- Expanded scalar spelling of the canonical external factor budget. -/
theorem C2ExactGapAnchorCanonicalExternalFactorBudget_iff_explicit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorCanonicalExternalFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      ((1 + ‖q s‖) * verticalDepthTailUpper s) *
          c2ContinuedVerticalAnchorResidualExactFactorUpper s +
        ((1 + ‖q s‖) *
            (c2GenuineCentralExactUpper s +
              c2ContinuedCentralExactUpper s) +
          2 *
            (c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s +
              c2RawCentralCutoffNormConstant K M s)) <
        c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) := by
  rfl

/-- Global middle expanded spelling of the canonical external factor budget. -/
theorem C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_explicit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      ∀ ⦃s : ℂ⦄,
        s ∈ c2ExpandedScalarMiddleRegion near edge →
        ((1 + ‖q s‖) * verticalDepthTailUpper s) *
            c2ContinuedVerticalAnchorResidualExactFactorUpper s +
          ((1 + ‖q s‖) *
              (c2GenuineCentralExactUpper s +
                c2ContinuedCentralExactUpper s) +
            2 *
              (c2HorizontalRegularizedUpper
                  horizontalConstant horizontalScale horizontalRatio s +
                c2RawCentralCutoffNormConstant K M s)) <
          c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExternalFactorBudget_iff_explicit
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorCanonicalExternalFactorBudget_iff_explicit
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

/--
The canonical external debit bounds itself, so choosing it introduces no
additional loss.
-/
theorem C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_canonical
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
      c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2RawCentralCutoffNormConstant K M)
      (c2ExactGapAnchorCanonicalExternalDebit
        K M horizontalConstant horizontalScale horizontalRatio)
      near edge := by
  intro s _hs
  unfold C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound
  unfold c2ExactGapAnchorCanonicalExternalDebit
  exact le_rfl

/--
Finest current specialization: use the canonical exact external debit as the
reserve lower's debit envelope.
-/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
        (c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio)
        near edge) :
    C2ExactGapAnchorCanonicalUpperLowerMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        (c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio))
      near edge :=
  C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_factorReserveLower
    hscale hhorizontal
    (C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_canonical
      near edge)
    hbudget

/-- Build the canonical frontier from the named finest exact-debit budget. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalFactorBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorCanonicalUpperLowerMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
        (c2ExactGapAnchorCanonicalExternalDebit
          K M horizontalConstant horizontalScale horizontalRatio))
      near edge :=
  C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalDebit
    hscale hhorizontal hbudget

/-- The canonical frontier gives the exact tail-norm anchor residual budget. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_tailNormAnchorResidualFactorBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorCanonicalUpperLowerMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge :=
  C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
    C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exact
    data.allowance_lower data.exact_factor_upper_lower

/-- The canonical frontier is equivalent to the named phase-saving target. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorCanonicalUpperLowerMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_phaseSavingOnMiddle
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).1
      data.to_tailNormAnchorResidualFactorBudget

/-- Convert the canonical frontier to the existing exact-gap expanded package. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_exactGapExpandedMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorCanonicalUpperLowerMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_phaseSavingOnMiddle
    data.horizontalScale_pos data.horizontalConstant_nonneg
    data.horizontalRatio_nonneg data.horizontalRatio_lt_one
    data.horizontal data.to_phaseSavingOnMiddle

/-- The canonical upper/lower frontier closes nonvanishing on the middle. -/
theorem C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_ne_zero_on_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorCanonicalUpperLowerMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorUpperLowerBudget
    data.horizontalScale_pos data.horizontalConstant_nonneg
    data.horizontalRatio_nonneg data.horizontalRatio_lt_one
    data.horizontal
    C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exact
    data.allowance_lower data.exact_factor_upper_lower

/-- Direct nonvanishing wrapper for the finest current exact-debit frontier. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  (C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalFactorBudget
    hscale hhorizontal hbudget).to_ne_zero_on_middle

/-- Direct nonvanishing wrapper from the canonical phase-reserve budget. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
    hscale hhorizontal
    ((C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_phaseReserveBudgetOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

/--
Direct nonvanishing wrapper from a fine upper envelope for the canonical
weighted phase debit.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseDebitUpperReserveBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale phaseDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hupper :
      C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
        phaseDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        phaseDebitUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
      hupper hbudget)

/--
Direct nonvanishing wrapper from a normalized factor upper whose weighted phase
payment fits inside the canonical reserve.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalFactorUpperReserveBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale factorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBoundOnMiddle
        factorUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        factorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
      hfactor hbudget)

/--
Direct nonvanishing wrapper from a continued odd-gap upper and its canonical
reserve comparison.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapReserveBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
      hgap hbudget)

/-- Direct nonvanishing wrapper from a half-disk odd-channel estimate. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskReserve
      hhalf hbudget)

/--
Direct nonvanishing wrapper from a continued odd-gap upper and its unit-reserve
comparison.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio gapUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapUnitReserve
      hgap hbudget)

/-- Direct nonvanishing wrapper from a half-disk unit-reserve comparison. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskUnitReserve
      hhalf hbudget)

/-- Direct nonvanishing wrapper from the half-disk radius reserve. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskRadiusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskRadiusReserve
      hhalf hbudget)

/-- Direct nonvanishing wrapper from the exact half-disk radius reserve. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskRadius
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
      hbudget)

/-- Direct nonvanishing wrapper from the cleared exact half-disk budget. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskCleared
      hbudget)

/-- Direct nonvanishing wrapper from the expanded exact half-disk budget. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskExpanded
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
      hbudget)

/--
Direct nonvanishing wrapper from component payment/reserve estimates for the
expanded exact half-disk budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
      hpayment hreserve hbudget)

/--
Direct nonvanishing wrapper from half-disk upper, margin lower, debit upper,
and the final scalar payment/reserve budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
        (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
          marginLower externalDebitUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
      hhalf hmargin hdebit hbudget)

/--
Direct nonvanishing wrapper from half-disk upper, margin lower, debit upper, and
the explicit scalar budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebitScalar
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper marginLower externalDebitUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
        halfDiskUpper marginLower externalDebitUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
      hhalf hmargin hdebit hbudget)

/--
Direct nonvanishing wrapper from a half-disk upper and the canonical half-disk
phase-reserve budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskPhaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
      hhalf hbudget)

/--
Direct nonvanishing wrapper from the exact-radius half-disk phase-reserve
budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
      hbudget)

/--
Direct nonvanishing wrapper from payment upper, phase-reserve lower, and their
strict scalar budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale paymentUpper reserveLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hpayment :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
        paymentUpper near edge)
    (hreserve :
      C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        reserveLower near edge)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
        paymentUpper reserveLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseUpperLower
      hpayment hreserve hbudget)

/--
Direct nonvanishing wrapper from the sharp exact payment/reserve budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpUpperLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpUpperLower
      hbudget)

/--
Direct nonvanishing wrapper from sharp surplus positivity.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hsurplus :
      C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
      hsurplus)

/--
Direct nonvanishing wrapper from the no-loss weighted ledger.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskWeightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hledger :
      C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
      hledger)

/--
Direct nonvanishing wrapper from the no-loss exact component ledger.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskComponentLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcomponent :
      C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
      hcomponent)

/--
Direct nonvanishing wrapper from the canonical exact-gap collected budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollected
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcollected :
      C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2RawCentralCutoffNormConstant K M) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
      hcollected)

/--
Direct nonvanishing wrapper from canonical collected slack positivity.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollectedSlack
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hslack :
      C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollectedSlack
      hslack)

/--
Direct nonvanishing wrapper from the canonical anchor-residual cleared budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAnchorResidualCleared
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcleared :
      C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
      hcleared)

/--
Direct nonvanishing wrapper from the lower-tail factor unit reserve.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorUnitReserve
      hunit)

/--
Direct nonvanishing wrapper from lower-tail factor cleared surplus positivity.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorSurplus
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hsurplus :
      C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
      hsurplus)

/--
Direct nonvanishing wrapper from the cleared lower-factor envelope ledger.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalClearedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale marginLower externalDebitUpper
      lowerFactorCostUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hcost :
      C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
        lowerFactorCostUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorCostUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_clearedEnvelopeLedger
      hmargin hdebit hcost hledger)

/--
Direct nonvanishing wrapper from the weighted raw-envelope ledger.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalWeightedLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale marginLower externalDebitUpper
      lowerFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hmargin :
      C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
        marginLower near edge)
    (hdebit :
      C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        externalDebitUpper near edge)
    (hfactor :
      C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
        lowerFactorUpper near edge)
    (hledger :
      C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
        marginLower externalDebitUpper lowerFactorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_weightedLedger
      hmargin hdebit hfactor hledger)

/--
Direct nonvanishing wrapper from the no-loss exact weighted envelope ledger.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hledger :
      C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactWeightedEnvelopeLedger
      hledger)

/--
Direct nonvanishing wrapper from a pressure-share filter cover.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureFilterCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {ι : Type*}
    {filters : ι → ℂ → Prop}
    {externalShare lowerFactorShare : ι → ℂ → ℝ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalMiddleFilterCover filters near edge)
    (hpressure : ∀ i : ι,
      C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
        (filters i)
        horizontalConstant horizontalScale horizontalRatio
        (externalShare i) (lowerFactorShare i) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
      hcover hpressure)

/--
Direct nonvanishing wrapper from a cover by constant-share pressure windows.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalMiddleFilterCover
        (fun idx =>
          C2ExactGapAnchorCanonicalPressureShareIndexFilter
            K M horizontalConstant horizontalScale horizontalRatio idx)
        near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
      hcover)

/--
Direct nonvanishing wrapper from a finite list cover by constant-share pressure
windows.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexListCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {atlas : List C2ExactGapAnchorCanonicalPressureShareIndex}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalPressureShareIndexListCover
        atlas horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
      hcover)

/--
Direct nonvanishing wrapper from the prototype dyadic pressure-share atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexListCover
    (atlas := c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas)
    hscale hhorizontal hcover

/--
Direct nonvanishing wrapper from the prototype dyadic pressure-ratio atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_ratioCover
      hcover)

/--
Direct nonvanishing wrapper from cleared-margin positivity and the prototype
dyadic pressure-ratio-bounds atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hmargin :
      C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_ratioBoundsCover
      hmargin hcover)

/--
Direct nonvanishing wrapper from residual-margin positivity and the prototype
dyadic pressure-ratio-bounds atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeResidualRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hmargin :
      C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
      hmargin hcover)

/--
Direct nonvanishing wrapper from the allowance/reserve budget and the prototype
dyadic pressure-ratio-bounds atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAllowanceReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_allowanceReserve
      hbudget hcover)

/--
Direct nonvanishing wrapper from the closed allowance/reserve certificate and
the prototype dyadic pressure-ratio-bounds atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClosedRatioBoundsCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
      hcover)

/--
Direct nonvanishing wrapper from aggregate prototype pressure bounds.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
      hbounds)

/--
Direct nonvanishing wrapper from total prototype pressure bounds.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeTotalBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_totalBounds
      hbounds)

/--
Direct nonvanishing wrapper from the division-free total pressure payment.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbound :
      C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_clearedTotalBound
      hscale hbound)

/--
Direct nonvanishing wrapper from the no-loss allowance-lower total pressure
payment.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAllowanceLowerTotalBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbound :
      C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedTotalBound
    hscale hhorizontal
    ((C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbound)

/--
Direct nonvanishing wrapper from the minimal normalized sum bound.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hsum :
      C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedTotalBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
      hsum)

/--
Direct nonvanishing wrapper from the component-expanded minimal sum bound.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hcomponent :
      C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
      hcomponent)

/--
Direct nonvanishing wrapper from the five-bill pressure budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {genuineShare continuedShare horizontalShare cutoffShare
      lowerFactorShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineShare continuedShare horizontalShare cutoffShare
        lowerFactorShare near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
      hbudget)

/-- Direct nonvanishing wrapper from the exact no-loss component-share budget. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactShareBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    ((C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hbudget)

/-- Direct nonvanishing wrapper from the first-bill genuine-pressure share. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuinePressureShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineShare : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineShare
        near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
      hbudget)

/--
Direct nonvanishing wrapper from the refined first-bill upper-share budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuineUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio genuineUpper
        near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
      hbudget)

/--
Direct nonvanishing wrapper from the refined central-pair upper-share budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairUpperShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper continuedUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper continuedUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
      hbudget)

/--
Direct nonvanishing wrapper from the odd-inherited central-pair budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairOddShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper oddUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
      hbudget)

/--
Direct nonvanishing wrapper from the no-loss exact odd-channel central-pair
budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairExactOdd
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale genuineUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        genuineUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
      hbudget)

/--
Direct nonvanishing wrapper from a one-quarter surplus reserve.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeSurplusReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hreserve :
      C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedTotalBound
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_surplusReserve
      hreserve)

/--
Direct nonvanishing wrapper from the quarter unit-reserve budget.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hunit :
      C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeSurplusReserve
    hscale hhorizontal
    ((C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).1 hunit)

/--
Direct nonvanishing wrapper from division-free aggregate pressure payments.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedAggregateBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbounds :
      C2ExactGapAnchorCanonicalPrototypePressureClearedAggregateBoundsOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAggregateBounds
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle_of_clearedAggregateBounds
      hbounds)

/--
Direct nonvanishing wrapper from allowance positivity, residual-reserve share
control, and the prototype dyadic pressure-ratio-bounds atlas.
-/
theorem
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeReserveShare
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hscale : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedScalarScaleData
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffScale s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hallow :
      C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge)
    (hshare :
      C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge)
    (hcover :
      C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover
    hscale hhorizontal
    (C2ExactGapAnchorCanonicalPrototypeRatioCover_of_reserveShare
      hallow hshare hcover)

end GenuineMiddleAudit
end C2
