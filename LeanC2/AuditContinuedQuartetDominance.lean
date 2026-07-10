import LeanC2.AuditContinuedQuartetHorizontal

/-!
# Constant-cutoff dominance target for the continued quartet route

This module isolates the next active mathematical obligation after the
constant-horizontal-cutoff reduction: prove the strict quartet dominance margin
on the middle region.
-/

namespace C2
namespace ContinuedQuartetAudit

/-- Constant horizontal cutoff schedule used by the active dominance audit. -/
def constantCoreCutoff (N : ℕ) : ℕ → ℕ :=
  fun _ => N

/-- Weighted horizontal envelope attached to the constant cutoff schedule. -/
noncomputable def constantCoreHorizontalEnvelope (N : ℕ) : ℂ → ℝ :=
  weightedHorizontalEnvelope (constantCoreCutoff N)

/-- Constant-cutoff odd truncation norm. -/
noncomputable def constantCoreOddTruncationNorm (N : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖

/-- Closed geometric expression for the constant-cutoff horizontal envelope. -/
noncomputable def constantCoreHorizontalEnvelopeClosed (N : ℕ) : ℂ → ℝ :=
  fun s =>
    (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
      (1 - 2 * ‖q s‖)⁻¹

theorem c2ConcreteOddTruncationError_constantCoreCutoff
    (N : ℕ) (s : ℂ) (j : ℕ) :
    c2ConcreteOddTruncationError (constantCoreCutoff N) s j =
      c2ConcreteOddTruncationError (constantCoreCutoff N) s 0 := by
  simp [constantCoreCutoff, c2ConcreteOddTruncationError,
    c2OddTruncationError]

theorem constantCoreHorizontalEnvelope_term_eq
    (N : ℕ) (s : ℂ) (j : ℕ) :
    ‖c2ConcreteOddHorizontalLayerDefect (constantCoreCutoff N) s j‖ /
        (1 / 2 : ℝ) ^ j =
      (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
        (2 * ‖q s‖) ^ j := by
  have hden : (1 / 2 : ℝ) ^ j ≠ 0 :=
    pow_ne_zero _ (by norm_num : (1 / 2 : ℝ) ≠ 0)
  rw [c2ConcreteOddHorizontalLayerDefect_norm_eq]
  rw [c2ConcreteOddTruncationError_constantCoreCutoff N s j]
  unfold constantCoreOddTruncationNorm
  rw [pow_add, mul_pow]
  field_simp [hden]
  have hcancel : (1 / 2 : ℝ) ^ j * 2 ^ j = 1 := by
    rw [← mul_pow]
    norm_num
  calc
    ‖q s‖ ^ j * ‖q s‖ ^ 2 *
        ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖ =
      ‖q s‖ ^ j * ‖q s‖ ^ 2 *
        ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖ * 1 := by
        ring
    _ =
      ‖q s‖ ^ j * ‖q s‖ ^ 2 *
        ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖ *
        ((1 / 2 : ℝ) ^ j * 2 ^ j) := by
        rw [hcancel]
    _ =
      ‖q s‖ ^ j * ‖q s‖ ^ 2 *
        ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖ *
        (1 / 2 : ℝ) ^ j * 2 ^ j := by
        ring

theorem constantCoreHorizontalEnvelope_eq_closed_of_re_pos
    (N : ℕ) {s : ℂ} (hs : 0 < s.re) :
    constantCoreHorizontalEnvelope N s =
      constantCoreHorizontalEnvelopeClosed N s := by
  have hratio_nonneg : 0 ≤ 2 * ‖q s‖ := by positivity
  have hratio_lt : 2 * ‖q s‖ < 1 :=
    two_mul_q_norm_lt_one_of_re_pos s hs
  unfold constantCoreHorizontalEnvelope weightedHorizontalEnvelope
    constantCoreHorizontalEnvelopeClosed
  calc
    (∑' j : ℕ,
        ‖c2ConcreteOddHorizontalLayerDefect (constantCoreCutoff N) s j‖ /
          (1 / 2 : ℝ) ^ j) =
      ∑' j : ℕ,
        (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
          (2 * ‖q s‖) ^ j := by
        exact tsum_congr fun j =>
          constantCoreHorizontalEnvelope_term_eq N s j
    _ =
      (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
        ∑' j : ℕ, (2 * ‖q s‖) ^ j := by
        rw [tsum_mul_left]
    _ =
      (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
        (1 - 2 * ‖q s‖)⁻¹ := by
        rw [tsum_geometric_of_lt_one hratio_nonneg hratio_lt]

/-- Exact tilt constant for the constant-cutoff profile. -/
noncomputable def constantCoreTiltConstant (N K M : ℕ) : ℂ → ℝ :=
  exactResidualTiltConstant K M (constantCoreHorizontalEnvelope N)

/-- Exact cutoff constant for the constant-cutoff profile. -/
noncomputable def constantCoreCutoffConstant (K M : ℕ) : ℂ → ℝ :=
  exactResidualCutoffConstant K M

/-- Full quartet dominance for the constant-cutoff unit/half profile. -/
def ConstantCoreCutoffFullDominance (N K M : ℕ) (s : ℂ) : Prop :=
  C2ExpandedQuartetDominance
    (constantCoreTiltConstant N K M) unitScale
    (constantCoreHorizontalEnvelope N) unitScale halfHorizontalRatio
    (constantCoreCutoffConstant K M) unitScale s

/-- Residual upper after the exact quartet vertical tail has been peeled off. -/
noncomputable def constantCoreResidualUpper (N K M : ℕ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (constantCoreTiltConstant N K M) unitScale
    (constantCoreHorizontalEnvelope N) unitScale halfHorizontalRatio
    (constantCoreCutoffConstant K M) unitScale

/-- Residual dominance for the constant-cutoff unit/half profile. -/
def ConstantCoreCutoffResidualDominance (N K M : ℕ) (s : ℂ) : Prop :=
  constantCoreResidualUpper N K M s < c2ExpandedQuartetResidualMargin s

/--
Residual dominance written against the analytic allowance after subtracting the
quartet reserve.  On the off-critical strip this is equal to residual dominance.
-/
def ConstantCoreCutoffAllowanceReserveDominance
    (N K M : ℕ) (s : ℂ) : Prop :=
  constantCoreResidualUpper N K M s <
    c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s

/-- Continued vertical anchor left after one continued central channel is peeled off. -/
noncomputable def continuedVerticalChannelAnchor : ℂ → ℂ :=
  fun s => verticalDepthTailFromTwo s - continuedCentralOddChannel s

/--
The continued vertical anchor carries the geometric cancellation factor.  Unlike
the historical `oddDirichletChannel` factorization, this version is valid
directly for the continued channel and has no `Re(s) > 1` hypothesis.
-/
theorem continuedVerticalChannelAnchor_eq_factorized (s : ℂ) :
    continuedVerticalChannelAnchor s =
      verticalDepthTailFromTwo s *
        (1 - (2 : ℂ) * continuedOddDirichletChannel s) := by
  unfold continuedVerticalChannelAnchor continuedCentralOddChannel
    centralFromOddChannel
  ring

/--
Exact structural split of the continued vertical residual.  The raw residual is
not estimated by the triangle inequality here: it is decomposed into the
continued vertical anchor and the finite rectangular cutoff error against the
same continued central channel.
-/
theorem c2ContinuedVerticalResidual_eq_anchor_add_cutoff
    (K M : ℕ) (s : ℂ) :
    c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s =
      continuedVerticalChannelAnchor s +
        c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s := by
  unfold c2ScaledSeededExplicitOddTailContinuedVerticalResidual
    continuedVerticalChannelAnchor c2ConcreteCutoffErrorFromTarget
    c2RectangularGenuineOperator
  ring

/--
The same split with the anchor factor exposed.  This is the current audited
replacement for the too-coarse triangle majorant.
-/
theorem c2ContinuedVerticalResidual_eq_factorized_anchor_add_cutoff
    (K M : ℕ) (s : ℂ) :
    c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s =
      verticalDepthTailFromTwo s *
          (1 - (2 : ℂ) * continuedOddDirichletChannel s) +
        c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s := by
  rw [c2ContinuedVerticalResidual_eq_anchor_add_cutoff K M s,
    continuedVerticalChannelAnchor_eq_factorized]

/--
Depth/core split of the continued cutoff error.  The two remaining finite
errors are the odd-core truncation error and the rectangular-depth cutoff error.
-/
theorem c2ContinuedCutoffError_eq_depth_core_split
    (K M : ℕ) (s : ℂ) :
    c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s =
      (2 : ℂ) * rectangularDepthFactor s K *
          (rectangularOddCoreSum s M - continuedOddDirichletChannel s) +
        (2 : ℂ) *
          (rectangularDepthFactor s K - verticalDepthTailFromTwo s) *
          continuedOddDirichletChannel s := by
  unfold c2ConcreteCutoffErrorFromTarget c2RectangularGenuineOperator
    continuedCentralOddChannel centralFromOddChannel
  rw [rectangularGenuine_eq_depth_core]
  ring

/--
Full geometric split of the continued vertical residual into the anchor,
odd-core truncation, and rectangular-depth cutoff pieces.
-/
theorem c2ContinuedVerticalResidual_eq_anchor_add_depth_core_errors
    (K M : ℕ) (s : ℂ) :
    c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s =
      verticalDepthTailFromTwo s *
          (1 - (2 : ℂ) * continuedOddDirichletChannel s) +
        (2 : ℂ) * rectangularDepthFactor s K *
          (rectangularOddCoreSum s M - continuedOddDirichletChannel s) +
        (2 : ℂ) *
          (rectangularDepthFactor s K - verticalDepthTailFromTwo s) *
          continuedOddDirichletChannel s := by
  rw [c2ContinuedVerticalResidual_eq_factorized_anchor_add_cutoff,
    c2ContinuedCutoffError_eq_depth_core_split]
  ring

/-- Exact norm of the continued vertical anchor. -/
noncomputable def continuedVerticalChannelAnchorExactUpper : ℂ → ℝ :=
  fun s => ‖continuedVerticalChannelAnchor s‖

theorem continuedVerticalChannelAnchorExactUpper_eq_factorized_norm
    (s : ℂ) :
    continuedVerticalChannelAnchorExactUpper s =
      ‖verticalDepthTailFromTwo s *
        (1 - (2 : ℂ) * continuedOddDirichletChannel s)‖ := by
  unfold continuedVerticalChannelAnchorExactUpper
  rw [continuedVerticalChannelAnchor_eq_factorized]

theorem c2ContinuedVerticalResidualExactUpper_le_anchor_add_cutoff
    (K M : ℕ) (s : ℂ) :
    c2ContinuedVerticalResidualExactUpper K M s ≤
      continuedVerticalChannelAnchorExactUpper s +
        c2ContinuedCutoffExactUpper K M s := by
  unfold c2ContinuedVerticalResidualExactUpper
    continuedVerticalChannelAnchorExactUpper c2ContinuedCutoffExactUpper
  rw [c2ContinuedVerticalResidual_eq_anchor_add_cutoff K M s]
  exact norm_add_le _ _

/--
Closed expression for the residual upper in the constant-cutoff profile.  This
is the formula to estimate when attacking dominance directly.
-/
noncomputable def constantCoreClosedResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualExactUpper K M s +
        2 * constantCoreHorizontalEnvelope N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelope N s +
    c2ContinuedCutoffExactUpper K M s

/--
Residual upper with the constant-cutoff horizontal envelope replaced by its
closed geometric expression.
-/
noncomputable def constantCoreGeometricResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualExactUpper K M s +
        2 * constantCoreHorizontalEnvelopeClosed N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelopeClosed N s +
    c2ContinuedCutoffExactUpper K M s

/--
Structured residual upper preserving the continued vertical anchor.  This is
coarser than the exact residual but avoids the invalid raw triangle shortcut.
-/
noncomputable def constantCoreStructuredResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    (((continuedVerticalChannelAnchorExactUpper s +
          c2ContinuedCutoffExactUpper K M s) +
        2 * constantCoreHorizontalEnvelopeClosed N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelopeClosed N s +
    c2ContinuedCutoffExactUpper K M s

/--
The irreducible scaled contribution of the continued vertical anchor.  Finite
horizontal and cutoff choices can only add to this floor in the structured
residual upper.
-/
noncomputable def continuedVerticalAnchorScaledFloor : ℂ → ℝ :=
  fun s =>
    continuedVerticalChannelAnchorExactUpper s *
      ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)

/--
Triangle-majorized residual upper.  This replaces the exact continued vertical
and cutoff norms by the existing off-critical triangle envelopes, while keeping
the constant-cutoff horizontal envelope in closed geometric form.
-/
noncomputable def constantCoreTriangleResidualUpper
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualTriangleUpper K M s +
        2 * constantCoreHorizontalEnvelopeClosed N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    2 * constantCoreHorizontalEnvelopeClosed N s +
    c2ContinuedCutoffTriangleUpper K M s

theorem constantCoreResidualUpper_eq_closed
    (N K M : ℕ) (s : ℂ) :
    constantCoreResidualUpper N K M s =
      constantCoreClosedResidualUpper N K M s := by
  simp [constantCoreResidualUpper, constantCoreClosedResidualUpper,
    constantCoreTiltConstant, constantCoreCutoffConstant,
    constantCoreHorizontalEnvelope, exactResidualTiltConstant,
    exactResidualCutoffConstant, c2ExpandedQuartetResidualUpper,
    c2TiltAnalyticRegularizedUpper, c2TiltRegularizedUpper,
    c2TiltAnalyticRatio, c2HorizontalRegularizedUpper,
    c2CutoffUpperFromScale, unitScale, halfHorizontalRatio]
  ring

theorem constantCoreClosedResidualUpper_eq_geometric_of_re_pos
    (N K M : ℕ) {s : ℂ} (hs : 0 < s.re) :
    constantCoreClosedResidualUpper N K M s =
      constantCoreGeometricResidualUpper N K M s := by
  unfold constantCoreClosedResidualUpper constantCoreGeometricResidualUpper
  rw [constantCoreHorizontalEnvelope_eq_closed_of_re_pos N hs]

theorem c2ContinuedVerticalResidualExactUpper_le_triangle_of_offCritical
    (K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    c2ContinuedVerticalResidualExactUpper K M s ≤
      c2ContinuedVerticalResidualTriangleUpper K M s := by
  simpa [C2ContinuedVerticalResidualBound,
    c2ContinuedVerticalResidualExactUpper] using
    c2ContinuedVerticalResidualBound_triangleUpper_of_offCritical K M hs

theorem c2ContinuedCutoffExactUpper_le_triangle
    (K M : ℕ) (s : ℂ) :
    c2ContinuedCutoffExactUpper K M s ≤
      c2ContinuedCutoffTriangleUpper K M s := by
  simpa [c2ContinuedCutoffExactUpper] using
    c2ContinuedCutoff_norm_le_triangle K M s

theorem constantCoreHorizontalEnvelopeClosed_nonneg_of_re_pos
    (N : ℕ) {s : ℂ} (hs : 0 < s.re) :
    0 ≤ constantCoreHorizontalEnvelopeClosed N s := by
  have hratio_lt : 2 * ‖q s‖ < 1 :=
    two_mul_q_norm_lt_one_of_re_pos s hs
  have hden_nonneg : 0 ≤ (1 - 2 * ‖q s‖)⁻¹ := by
    exact inv_nonneg.mpr (by linarith)
  unfold constantCoreHorizontalEnvelopeClosed constantCoreOddTruncationNorm
  positivity

theorem constantCoreGeometricResidualUpper_le_triangle_of_offCritical
    (N K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    constantCoreGeometricResidualUpper N K M s ≤
      constantCoreTriangleResidualUpper N K M s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hinv_nonneg : 0 ≤ (1 - ‖q s‖)⁻¹ :=
    inv_nonneg.mpr hgap_nonneg
  have hfactor_nonneg : 0 ≤ 1 + ‖q s‖ := by positivity
  have hvert :=
    c2ContinuedVerticalResidualExactUpper_le_triangle_of_offCritical K M hs
  have hcut := c2ContinuedCutoffExactUpper_le_triangle K M s
  have htop :
      c2ContinuedVerticalResidualExactUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s ≤
        c2ContinuedVerticalResidualTriangleUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s := by
    simpa [add_comm, add_left_comm, add_assoc] using
      add_le_add_right hvert (2 * constantCoreHorizontalEnvelopeClosed N s)
  have hmain :
      ((c2ContinuedVerticalResidualExactUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s) *
        (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ ≤
      ((c2ContinuedVerticalResidualTriangleUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s) *
        (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ := by
    exact mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right htop hfactor_nonneg)
      hinv_nonneg
  unfold constantCoreGeometricResidualUpper constantCoreTriangleResidualUpper
  exact add_le_add (add_le_add hmain le_rfl) hcut

theorem constantCoreGeometricResidualUpper_le_structured_of_offCritical
    (N K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    constantCoreGeometricResidualUpper N K M s ≤
      constantCoreStructuredResidualUpper N K M s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hinv_nonneg : 0 ≤ (1 - ‖q s‖)⁻¹ :=
    inv_nonneg.mpr hgap_nonneg
  have hfactor_nonneg : 0 ≤ 1 + ‖q s‖ := by positivity
  have hvert :=
    c2ContinuedVerticalResidualExactUpper_le_anchor_add_cutoff K M s
  have htop :
      c2ContinuedVerticalResidualExactUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s ≤
        (continuedVerticalChannelAnchorExactUpper s +
            c2ContinuedCutoffExactUpper K M s) +
          2 * constantCoreHorizontalEnvelopeClosed N s := by
    simpa [add_comm, add_left_comm, add_assoc] using
      add_le_add_right hvert (2 * constantCoreHorizontalEnvelopeClosed N s)
  have hmain :
      ((c2ContinuedVerticalResidualExactUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s) *
        (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ ≤
      (((continuedVerticalChannelAnchorExactUpper s +
            c2ContinuedCutoffExactUpper K M s) +
          2 * constantCoreHorizontalEnvelopeClosed N s) *
        (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ := by
    exact mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right htop hfactor_nonneg)
      hinv_nonneg
  unfold constantCoreGeometricResidualUpper constantCoreStructuredResidualUpper
  exact add_le_add (add_le_add hmain le_rfl) le_rfl

theorem continuedVerticalAnchorScaledFloor_le_structured_of_offCritical
    (N K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    continuedVerticalAnchorScaledFloor s ≤
      constantCoreStructuredResidualUpper N K M s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg (by positivity) (inv_nonneg.mpr hgap_nonneg)
  have hH_nonneg :
      0 ≤ 2 * constantCoreHorizontalEnvelopeClosed N s := by
    have hH : 0 ≤ constantCoreHorizontalEnvelopeClosed N s :=
      constantCoreHorizontalEnvelopeClosed_nonneg_of_re_pos N hs.1
    positivity
  have hcut_nonneg : 0 ≤ c2ContinuedCutoffExactUpper K M s := by
    unfold c2ContinuedCutoffExactUpper
    positivity
  have htop :
      continuedVerticalChannelAnchorExactUpper s ≤
        (continuedVerticalChannelAnchorExactUpper s +
            c2ContinuedCutoffExactUpper K M s) +
          2 * constantCoreHorizontalEnvelopeClosed N s := by
    linarith [hcut_nonneg, hH_nonneg]
  have hmain :
      continuedVerticalChannelAnchorExactUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
        (((continuedVerticalChannelAnchorExactUpper s +
              c2ContinuedCutoffExactUpper K M s) +
            2 * constantCoreHorizontalEnvelopeClosed N s) *
          (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ := by
    simpa [mul_assoc] using
      mul_le_mul_of_nonneg_right htop hcoeff_nonneg
  have hrest_nonneg :
      0 ≤ 2 * constantCoreHorizontalEnvelopeClosed N s +
        c2ContinuedCutoffExactUpper K M s := by
    exact add_nonneg hH_nonneg hcut_nonneg
  unfold continuedVerticalAnchorScaledFloor constantCoreStructuredResidualUpper
  linarith

/-
The following zeta-zero and factor-allowance lemmas are transfer-side
diagnostics for the continued channel, whose definition contains `riemannZeta`.
They must not be used as the primary geometric no-cancellation target for the
genuine C2 operator.
-/
theorem continuedOddDirichletChannel_eq_zero_of_zeta_zero
    {s : ℂ} (hz : riemannZeta s = 0) :
    continuedOddDirichletChannel s = 0 := by
  unfold continuedOddDirichletChannel
  rw [hz]
  ring

theorem continuedVerticalChannelAnchorExactUpper_eq_verticalDepthTailFromTwo_norm_of_zeta_zero
    {s : ℂ} (hz : riemannZeta s = 0) :
    continuedVerticalChannelAnchorExactUpper s =
      ‖verticalDepthTailFromTwo s‖ := by
  have hodd :
      continuedOddDirichletChannel s = 0 :=
    continuedOddDirichletChannel_eq_zero_of_zeta_zero hz
  simp [continuedVerticalChannelAnchorExactUpper, continuedVerticalChannelAnchor,
    continuedCentralOddChannel, centralFromOddChannel, hodd]

theorem c2AnalyticBulkAllowance_sub_reserve_lt_verticalDepthTailUpper_of_offCriticalStrip
    {s : ℂ} (hs : offCriticalStrip s) :
    c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s <
      verticalDepthTailUpper s := by
  have hq_pos : 0 < ‖q s‖ := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    exact norm_pos_iff.mpr hq_ne
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith
  have hplus_pos : 0 < 1 + ‖q s‖ := by
    linarith
  have hsq_lt : ‖q s‖ ^ 2 < 1 := by
    nlinarith [norm_nonneg (q s), hq_lt]
  have hsq_gap_pos : 0 < 1 - ‖q s‖ ^ 2 := by
    linarith
  have hmain :
      verticalDepthTailUpper s -
          (c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) =
        2 * ‖q s‖ ^ 3 * (1 + ‖q s‖ ^ 3) *
          ((1 - ‖q s‖)⁻¹ * (1 + ‖q s‖)⁻¹) := by
    unfold verticalDepthTailUpper c2AnalyticBulkAllowance
      c2ExpandedQuartetResidualReserve
    field_simp [ne_of_gt hgap_pos, ne_of_gt hplus_pos,
      ne_of_gt hsq_gap_pos]
    ring
  have hinv_prod_pos :
      0 < (1 - ‖q s‖)⁻¹ * (1 + ‖q s‖)⁻¹ := by
    exact mul_pos (inv_pos.mpr hgap_pos) (inv_pos.mpr hplus_pos)
  have hprod_pos :
      0 <
        2 * ‖q s‖ ^ 3 * (1 + ‖q s‖ ^ 3) *
          ((1 - ‖q s‖)⁻¹ * (1 + ‖q s‖)⁻¹) := by
    have hcube_pos : 0 < ‖q s‖ ^ 3 := by
      positivity
    have hpoly_pos : 0 < 1 + ‖q s‖ ^ 3 := by
      positivity
    exact mul_pos
      (mul_pos
        (mul_pos (by norm_num : (0 : ℝ) < 2) hcube_pos)
        hpoly_pos)
      hinv_prod_pos
  have hdiff_pos :
      0 <
        verticalDepthTailUpper s -
          (c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) := by
    simpa [hmain] using hprod_pos
  linarith

theorem verticalDepthTailUpper_le_continuedVerticalAnchorScaledFloor_of_zeta_zero
    {s : ℂ} (hs : offCriticalStrip s) (hz : riemannZeta s = 0) :
    verticalDepthTailUpper s ≤ continuedVerticalAnchorScaledFloor s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hplus_pos : 0 < 1 + ‖q s‖ := by
    linarith [norm_nonneg (q s)]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg (le_of_lt hplus_pos) (le_of_lt (inv_pos.mpr hgap_pos))
  have htail_eq :
      verticalDepthTailFromTwo s = q s ^ 2 * verticalResolvent s := by
    simpa [q] using verticalDepthTailFromTwo_eq s hs.1
  have htail_norm :
      ‖verticalDepthTailFromTwo s‖ =
        ‖q s‖ ^ 2 * ‖verticalResolvent s‖ := by
    rw [htail_eq, norm_mul, norm_pow]
  have hresolvent_lower :
      (1 / (1 + ‖q s‖) : ℝ) ≤ ‖verticalResolvent s‖ := by
    simpa [q] using verticalResolvent_norm_lower_bound_of_offCriticalStrip s hs
  have hbase :
      ‖q s‖ ^ 2 / (1 + ‖q s‖) ≤ ‖verticalDepthTailFromTwo s‖ := by
    have hmul :=
      mul_le_mul_of_nonneg_left hresolvent_lower (sq_nonneg ‖q s‖)
    rw [htail_norm]
    simpa [div_eq_mul_inv, one_div, mul_assoc, mul_comm, mul_left_comm] using
      hmul
  have hscaled :=
    mul_le_mul_of_nonneg_right hbase hcoeff_nonneg
  have hleft :
      (‖q s‖ ^ 2 / (1 + ‖q s‖)) *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) =
        verticalDepthTailUpper s := by
    unfold verticalDepthTailUpper
    field_simp [ne_of_gt hplus_pos, ne_of_gt hgap_pos]
  have hanchor :
      continuedVerticalChannelAnchorExactUpper s =
        ‖verticalDepthTailFromTwo s‖ :=
    continuedVerticalChannelAnchorExactUpper_eq_verticalDepthTailFromTwo_norm_of_zeta_zero
      hz
  unfold continuedVerticalAnchorScaledFloor
  rw [hanchor]
  simpa [hleft] using hscaled

theorem not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero
    {s : ℂ} (hs : offCriticalStrip s) (hz : riemannZeta s = 0) :
    ¬ continuedVerticalAnchorScaledFloor s <
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s := by
  intro hlt
  have hfloor :
      verticalDepthTailUpper s ≤ continuedVerticalAnchorScaledFloor s :=
    verticalDepthTailUpper_le_continuedVerticalAnchorScaledFloor_of_zeta_zero
      hs hz
  have hmargin :
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s <
        verticalDepthTailUpper s :=
    c2AnalyticBulkAllowance_sub_reserve_lt_verticalDepthTailUpper_of_offCriticalStrip
      hs
  linarith

noncomputable def continuedAnchorFactorAllowance : ℂ → ℝ :=
  fun s =>
    (c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) /
      (verticalDepthTailUpper s *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹))

theorem verticalDepthTailUpper_pos_of_offCriticalStrip
    {s : ℂ} (hs : offCriticalStrip s) :
    0 < verticalDepthTailUpper s := by
  have hq_pos : 0 < ‖q s‖ := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    exact norm_pos_iff.mpr hq_ne
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith
  unfold verticalDepthTailUpper
  exact div_pos (by positivity) hgap_pos

theorem continuedAnchorScaledTailDenominator_pos_of_offCriticalStrip
    {s : ℂ} (hs : offCriticalStrip s) :
    0 <
      verticalDepthTailUpper s *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hplus_pos : 0 < 1 + ‖q s‖ := by
    linarith [norm_nonneg (q s)]
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hs
  have hcoeff_pos :
      0 < (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ :=
    mul_pos hplus_pos (inv_pos.mpr hgap_pos)
  exact mul_pos htail_pos hcoeff_pos

theorem continuedVerticalAnchorScaledFloor_eq_factor_norm (s : ℂ) :
    continuedVerticalAnchorScaledFloor s =
      (‖verticalDepthTailFromTwo s‖ *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) := by
  unfold continuedVerticalAnchorScaledFloor
  rw [continuedVerticalChannelAnchorExactUpper_eq_factorized_norm, norm_mul]

theorem continuedVerticalAnchorScaledFloor_le_factorScaledVerticalTail_of_offCritical
    {s : ℂ} (hs : offCriticalStrip s) :
    continuedVerticalAnchorScaledFloor s ≤
      (verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg (by positivity) (inv_nonneg.mpr hgap_nonneg)
  have htail :
      ‖verticalDepthTailFromTwo s‖ ≤ verticalDepthTailUpper s :=
    verticalDepthTailFromTwo_norm_le_upper_of_offCriticalStrip s hs
  have hfactor_nonneg :
      0 ≤ ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ :=
    norm_nonneg _
  have hmul :
      ‖verticalDepthTailFromTwo s‖ *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ ≤
        verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ :=
    mul_le_mul_of_nonneg_right htail hfactor_nonneg
  rw [continuedVerticalAnchorScaledFloor_eq_factor_norm]
  exact mul_le_mul_of_nonneg_right hmul hcoeff_nonneg

set_option linter.style.longLine false in
theorem continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance
    {s : ℂ} (hs : offCriticalStrip s)
    (hfactor :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        continuedAnchorFactorAllowance s) :
    continuedVerticalAnchorScaledFloor s <
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s := by
  have hden_pos :
      0 <
        verticalDepthTailUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
    continuedAnchorScaledTailDenominator_pos_of_offCriticalStrip hs
  have hupper :
      continuedVerticalAnchorScaledFloor s ≤
        (verticalDepthTailUpper s *
            ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
    continuedVerticalAnchorScaledFloor_le_factorScaledVerticalTail_of_offCritical
      hs
  have hscaled_raw :=
    mul_lt_mul_of_pos_right hfactor hden_pos
  unfold continuedAnchorFactorAllowance at hscaled_raw
  have hscaled :
      (verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s := by
    have hright :
        ((c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) /
            (verticalDepthTailUpper s *
              ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹))) *
          (verticalDepthTailUpper s *
            ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)) =
          c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s := by
      exact div_mul_cancel₀ _ (ne_of_gt hden_pos)
    calc
      (verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
        ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)
          =
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ *
          (verticalDepthTailUpper s *
            ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)) := by
            ring
      _ <
        ((c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) /
            (verticalDepthTailUpper s *
              ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹))) *
          (verticalDepthTailUpper s *
            ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)) := by
            simpa [mul_assoc, mul_comm, mul_left_comm] using hscaled_raw
      _ = c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s :=
        hright
  exact lt_of_le_of_lt hupper hscaled

set_option linter.style.longLine false in
theorem continuedAnchorFactorAllowance_lt_one_of_offCritical
    {s : ℂ} (hs : offCriticalStrip s) :
    continuedAnchorFactorAllowance s < 1 := by
  have hden_pos :
      0 <
        verticalDepthTailUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
    continuedAnchorScaledTailDenominator_pos_of_offCriticalStrip hs
  have hmargin_lt :
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s <
        verticalDepthTailUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) := by
    rw [← c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
      hs]
    exact
      c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_linearCoefficient_of_offCriticalStrip
        hs
  unfold continuedAnchorFactorAllowance
  exact (div_lt_iff₀ hden_pos).mpr (by simpa using hmargin_lt)

theorem riemannZeta_ne_zero_of_continuedAnchorFactorAllowance
    {s : ℂ} (hs : offCriticalStrip s)
    (hfactor :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        continuedAnchorFactorAllowance s) :
    riemannZeta s ≠ 0 := by
  intro hz
  have hfloor :
      continuedVerticalAnchorScaledFloor s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s :=
    continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_factorAllowance
      hs hfactor
  exact
    not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero
      hs hz hfloor

theorem scaledVerticalDepthTail_linearCoefficient_le_constantCoreTriangleResidualUpper
    (N K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
      constantCoreTriangleResidualUpper N K M s := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hs
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg : 0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg (by positivity) (inv_nonneg.mpr hgap_nonneg)
  have hH_nonneg : 0 ≤ constantCoreHorizontalEnvelopeClosed N s :=
    constantCoreHorizontalEnvelopeClosed_nonneg_of_re_pos N hs.1
  have htwoH_nonneg :
      0 ≤ 2 * constantCoreHorizontalEnvelopeClosed N s := by
    positivity
  have htail_le_triangle :
      verticalDepthTailUpper s ≤
        c2ContinuedVerticalResidualTriangleUpper K M s := by
    have hrect_nonneg : 0 ≤ ‖rectangularGenuine s K M‖ := norm_nonneg _
    have hcentral_nonneg : 0 ≤ 2 * ‖continuedCentralOddChannel s‖ := by
      positivity
    unfold c2ContinuedVerticalResidualTriangleUpper
    linarith
  have htail_le_top :
      verticalDepthTailUpper s ≤
        c2ContinuedVerticalResidualTriangleUpper K M s +
          2 * constantCoreHorizontalEnvelopeClosed N s := by
    linarith
  have hmain :
      verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
        ((c2ContinuedVerticalResidualTriangleUpper K M s +
            2 * constantCoreHorizontalEnvelopeClosed N s) *
          (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ := by
    simpa [mul_assoc] using
      mul_le_mul_of_nonneg_right htail_le_top hcoeff_nonneg
  have hcut_nonneg : 0 ≤ c2ContinuedCutoffTriangleUpper K M s := by
    unfold c2ContinuedCutoffTriangleUpper
    positivity
  unfold constantCoreTriangleResidualUpper
  linarith

set_option linter.style.longLine false in
theorem not_constantCoreTriangleResidualUpper_lt_allowanceReserve
    (N K M : ℕ) {s : ℂ} (hs : offCriticalStrip s) :
    ¬ constantCoreTriangleResidualUpper N K M s <
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s := by
  intro hlt
  have htail_le :=
    scaledVerticalDepthTail_linearCoefficient_le_constantCoreTriangleResidualUpper
      N K M hs
  have htarget_lt :
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s <
        verticalDepthTailUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) := by
    rw [← c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
      hs]
    exact
      c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_linearCoefficient_of_offCriticalStrip
        hs
  linarith

theorem ConstantCoreCutoffFullDominance.toMiddleDominanceInputs
    {N K M : ℕ}
    (hdom : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        ConstantCoreCutoffFullDominance N K M s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M := by
  refine ⟨?_⟩
  intro s hs
  have h := hdom hs
  simpa [ConstantCoreCutoffFullDominance, C2ExpandedQuartetDominance,
    c2ExpandedQuartetLeftUpper, c2ExpandedQuartetGUpper,
    c2ExpandedQuartetEUpper, constantCoreTiltConstant,
    constantCoreHorizontalEnvelope, constantCoreCutoffConstant,
    constantCoreCutoff] using h

theorem ConstantCoreCutoffMiddleDominanceInputs.ofResidualDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        ConstantCoreCutoffResidualDominance N K M s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffFullDominance.toMiddleDominanceInputs
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      unfold ConstantCoreCutoffFullDominance
      exact c2ExpandedQuartetDominance_of_residualBound
        (by
          simpa [ConstantCoreCutoffResidualDominance,
            constantCoreResidualUpper, constantCoreTiltConstant,
            constantCoreHorizontalEnvelope, constantCoreCutoffConstant] using
            hres hs))

theorem ConstantCoreCutoffMiddleDominanceInputs.ofAllowanceReserveDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        ConstantCoreCutoffAllowanceReserveDominance N K M s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffMiddleDominanceInputs.ofResidualDominance
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      have hmargin :=
        c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
          hs.1
      unfold ConstantCoreCutoffResidualDominance
      rw [hmargin]
      simpa [ConstantCoreCutoffAllowanceReserveDominance] using hres hs)

theorem ConstantCoreCutoffMiddleDominanceInputs.ofClosedAllowanceReserveDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        constantCoreClosedResidualUpper N K M s <
          c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffMiddleDominanceInputs.ofAllowanceReserveDominance
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      unfold ConstantCoreCutoffAllowanceReserveDominance
      rw [constantCoreResidualUpper_eq_closed]
      exact hres hs)

theorem ConstantCoreCutoffMiddleDominanceInputs.ofGeometricAllowanceReserveDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        constantCoreGeometricResidualUpper N K M s <
          c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffMiddleDominanceInputs.ofClosedAllowanceReserveDominance
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      have hsre : 0 < s.re := hs.1.1
      rw [constantCoreClosedResidualUpper_eq_geometric_of_re_pos N K M hsre]
      exact hres hs)

theorem ConstantCoreCutoffMiddleDominanceInputs.ofTriangleAllowanceReserveDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        constantCoreTriangleResidualUpper N K M s <
          c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffMiddleDominanceInputs.ofGeometricAllowanceReserveDominance
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      exact lt_of_le_of_lt
        (constantCoreGeometricResidualUpper_le_triangle_of_offCritical
          N K M hs.1)
        (hres hs))

theorem ConstantCoreCutoffMiddleDominanceInputs.ofStructuredAllowanceReserveDominance
    {N K M : ℕ}
    (hres : ∀ ⦃s : ℂ⦄,
      s ∈ middleRegion (constantCoreCutoff N) K M →
        constantCoreStructuredResidualUpper N K M s <
          c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    ConstantCoreCutoffMiddleDominanceInputs N K M :=
  ConstantCoreCutoffMiddleDominanceInputs.ofGeometricAllowanceReserveDominance
    (N := N) (K := K) (M := M)
    (fun {s} hs => by
      exact lt_of_le_of_lt
        (constantCoreGeometricResidualUpper_le_structured_of_offCritical
          N K M hs.1)
        (hres hs))

theorem continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_structured
    {N K M : ℕ} {s : ℂ}
    (hs : s ∈ middleRegion (constantCoreCutoff N) K M)
    (hres :
      constantCoreStructuredResidualUpper N K M s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    continuedVerticalAnchorScaledFloor s <
      c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s :=
  lt_of_le_of_lt
    (continuedVerticalAnchorScaledFloor_le_structured_of_offCritical N K M hs.1)
    hres

theorem riemannZeta_ne_zero_of_structuredAllowanceReserveDominance
    {N K M : ℕ} {s : ℂ}
    (hs : s ∈ middleRegion (constantCoreCutoff N) K M)
    (hres :
      constantCoreStructuredResidualUpper N K M s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    riemannZeta s ≠ 0 := by
  intro hz
  have hfloor :
      continuedVerticalAnchorScaledFloor s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s :=
    continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_structured
      hs hres
  exact
    not_continuedVerticalAnchorScaledFloor_lt_allowanceReserve_of_zeta_zero
      hs.1 hz hfloor

end ContinuedQuartetAudit
end C2
