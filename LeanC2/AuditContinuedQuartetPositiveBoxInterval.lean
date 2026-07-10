import LeanC2.AuditContinuedQuartetPositiveBox

/-!
# Positive pocket interval audit

This file prepares the first interval-proof API for the selected positive
subbox.  It keeps all analytic estimates conditional, but proves the elementary
box facts needed to start replacing the fields of `PositiveBoxCertificate` by
real interval arguments.

Nothing here is promoted to the main route.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- Lower real-edge membership extracted from the selected box. -/
theorem positiveBox_re_lower {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxSigmaMin ≤ s.re :=
  hs.1

/-- Upper real-edge membership extracted from the selected box. -/
theorem positiveBox_re_upper {s : ℂ} (hs : s ∈ positiveBox) :
    s.re ≤ positiveBoxSigmaMax :=
  hs.2.1

/-- Lower imaginary-edge membership extracted from the selected box. -/
theorem positiveBox_im_lower {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxTMin ≤ s.im :=
  hs.2.2.1

/-- Upper imaginary-edge membership extracted from the selected box. -/
theorem positiveBox_im_upper {s : ℂ} (hs : s ∈ positiveBox) :
    s.im ≤ positiveBoxTMax :=
  hs.2.2.2

/-- The selected positive box lies in the right half-plane. -/
theorem positiveBox_re_pos {s : ℂ} (hs : s ∈ positiveBox) :
    0 < s.re := by
  have hmin : (0 : ℝ) < positiveBoxSigmaMin := by
    norm_num [positiveBoxSigmaMin]
  exact lt_of_lt_of_le hmin (positiveBox_re_lower hs)

/-- The selected anchor upper candidate is positive. -/
theorem positiveBoxAnchorUpperValue_pos :
    0 < positiveBoxAnchorUpperValue := by
  norm_num [positiveBoxAnchorUpperValue]

/-- The selected cutoff upper candidate is positive. -/
theorem positiveBoxCutUpperValue_pos :
    0 < positiveBoxCutUpperValue := by
  norm_num [positiveBoxCutUpperValue]

/-- The selected sector lower candidate is positive. -/
theorem positiveBoxSectorLowerValue_pos :
    0 < positiveBoxSectorLowerValue := by
  norm_num [positiveBoxSectorLowerValue]

/-- The selected sector lower candidate is below one. -/
theorem positiveBoxSectorLowerValue_lt_one :
    positiveBoxSectorLowerValue < 1 := by
  norm_num [positiveBoxSectorLowerValue]

/-- Basic nonnegativity of the C2 vertical ratio norm on the selected box. -/
theorem positiveBox_q_norm_nonneg {s : ℂ} (_hs : s ∈ positiveBox) :
    0 ≤ ‖q s‖ :=
  norm_nonneg _

/-- The C2 vertical ratio norm is below one on the selected box. -/
theorem positiveBox_q_norm_lt_one {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ < 1 :=
  q_norm_lt_one_of_re_pos s (positiveBox_re_pos hs)

/-- A stronger elementary q-bound available on any right-half-plane point. -/
theorem positiveBox_q_norm_lt_half {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ < (1 : ℝ) / 2 := by
  have htwo : 2 * ‖q s‖ < 1 :=
    two_mul_q_norm_lt_one_of_re_pos s (positiveBox_re_pos hs)
  linarith

/-- The q-ratio horizontal profile is nonnegative on the selected box. -/
theorem positiveBox_qNormHorizontalRatio_nonneg
    {s : ℂ} (_hs : s ∈ positiveBox) :
    0 ≤ qNormHorizontalRatio s :=
  qNormHorizontalRatio_nonneg s

/-- The q-ratio horizontal profile is below one on the selected box. -/
theorem positiveBox_qNormHorizontalRatio_lt_one
    {s : ℂ} (hs : s ∈ positiveBox) :
    qNormHorizontalRatio s < 1 := by
  simpa [qNormHorizontalRatio] using positiveBox_q_norm_lt_one hs

/-- The selected horizontal upper candidate for the q-ratio ledger. -/
def positiveBoxHorizontalUpperValue : ℝ :=
  (1 : ℝ) / 100

/-- The selected horizontal upper candidate is positive. -/
theorem positiveBoxHorizontalUpperValue_pos :
    0 < positiveBoxHorizontalUpperValue := by
  norm_num [positiveBoxHorizontalUpperValue]

/-- The q-ratio horizontal upper is nonnegative on the selected box. -/
theorem positiveBox_constantCoreHorizontalUpperQRatio_nonneg
    {s : ℂ} (hs : s ∈ positiveBox) :
    0 ≤ constantCoreHorizontalUpperQRatio positiveBoxN s := by
  unfold constantCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
    unitScale qNormHorizontalRatio
  have hq_lt : ‖q s‖ < 1 := positiveBox_q_norm_lt_one hs
  have hgap : 0 ≤ (1 - ‖q s‖)⁻¹ := by
    exact inv_nonneg.mpr (by linarith [norm_nonneg (q s), hq_lt])
  have hamp : 0 ≤ constantCoreHorizontalAmplitudeQRatio positiveBoxN s :=
    constantCoreHorizontalAmplitudeQRatio_nonneg positiveBoxN s
  positivity

/--
Candidate lower endpoint for a later interval proof of `‖q s‖`.

This is not used as a proof here.
-/
def positiveBoxQLowerCandidate : ℝ :=
  (27 : ℝ) / 100

/--
Candidate upper endpoint for a later interval proof of `‖q s‖`.

This is not used as a proof here.
-/
def positiveBoxQUpperCandidate : ℝ :=
  (3 : ℝ) / 10

/-- The q upper candidate is strictly below one. -/
theorem positiveBoxQUpperCandidate_lt_one :
    positiveBoxQUpperCandidate < 1 := by
  norm_num [positiveBoxQUpperCandidate]

/--
Lower endpoint for the monotonic q-norm reduction.

Since `‖q s‖ = (1 / 2) * exp (-(s.re * log 2))`, the smallest q-norm on
the box occurs at the upper real edge.
-/
def positiveBoxQNormLowerEndpoint : ℝ :=
  (1 : ℝ) / 2 *
    Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ)))

/--
Upper endpoint for the monotonic q-norm reduction.

Since `‖q s‖ = (1 / 2) * exp (-(s.re * log 2))`, the largest q-norm on
the box occurs at the lower real edge.
-/
def positiveBoxQNormUpperEndpoint : ℝ :=
  (1 : ℝ) / 2 *
    Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ)))

/--
Endpoint inequality package for the q bracket.  It is retained as a small API
boundary even though the selected positive-box endpoints are closed below.
-/
structure PositiveBoxQEndpointData : Prop where
  lower_endpoint :
    positiveBoxQLowerCandidate ≤ positiveBoxQNormLowerEndpoint
  upper_endpoint :
    positiveBoxQNormUpperEndpoint ≤ positiveBoxQUpperCandidate

/--
Closed lower endpoint for the q-norm bracket on the selected positive box.

The proof uses only audit-side scalar numerics: a lower bound for
`log (50 / 27)` from `Real.le_log_one_add_of_nonneg`, and mathlib's certified
upper decimal bound for `log 2`.
-/
theorem positiveBox_q_endpoint_lower :
    (27 : ℝ) / 100 ≤
      (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) := by
  have hlog50_27_lower :
      (46 : ℝ) / 77 ≤ Real.log ((50 : ℝ) / 27) := by
    have h :=
      Real.le_log_one_add_of_nonneg
        (x := (23 : ℝ) / 27) (by norm_num)
    norm_num at h ⊢
    exact h
  have hlog2_scaled_upper :
      ((43 : ℝ) / 50) * Real.log (2 : ℝ) ≤ (46 : ℝ) / 77 := by
    have h := Real.log_two_lt_d9
    nlinarith
  have hlog_scaled :
      ((43 : ℝ) / 50) * Real.log (2 : ℝ) ≤
        Real.log ((50 : ℝ) / 27) :=
    le_trans hlog2_scaled_upper hlog50_27_lower
  have hlog_inv :
      Real.log ((27 : ℝ) / 50) =
        -Real.log ((50 : ℝ) / 27) := by
    rw [show ((27 : ℝ) / 50) = (((50 : ℝ) / 27)⁻¹) by norm_num,
      Real.log_inv]
  have hlog_target :
      Real.log ((27 : ℝ) / 50) ≤
        -(positiveBoxSigmaMax * Real.log (2 : ℝ)) := by
    rw [hlog_inv]
    norm_num [positiveBoxSigmaMax]
    linarith
  have hexp :
      (27 : ℝ) / 50 ≤
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) :=
    (Real.log_le_iff_le_exp (by norm_num : 0 < (27 : ℝ) / 50)).mp
      hlog_target
  calc
    (27 : ℝ) / 100 = (1 : ℝ) / 2 * ((27 : ℝ) / 50) := by norm_num
    _ ≤ (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) := by
      exact mul_le_mul_of_nonneg_left hexp (by norm_num)

/--
Closed upper endpoint for the q-norm bracket on the selected positive box.

The proof bounds `log (5 / 3)` from above using the symmetric logarithm
expansion with `x = 1 / 4`, then compares against mathlib's certified lower
decimal bound for `log 2`.
-/
theorem positiveBox_q_endpoint_upper :
    (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) ≤
      (3 : ℝ) / 10 := by
  have hhalf_log53 :
      (1 : ℝ) / 2 * Real.log ((5 : ℝ) / 3) ≤
        (41 : ℝ) / 160 := by
    have h :=
      Real.log_div_le_sum_range_add
        (x := (1 : ℝ) / 4) (by norm_num) (by norm_num) 2
    norm_num at h ⊢
    exact h
  have hlog53_upper :
      Real.log ((5 : ℝ) / 3) ≤ (41 : ℝ) / 80 := by
    nlinarith
  have hlog2_scaled_lower :
      (41 : ℝ) / 80 ≤ ((21 : ℝ) / 25) * Real.log (2 : ℝ) := by
    have h := Real.log_two_gt_d9
    nlinarith
  have hlog_scaled :
      Real.log ((5 : ℝ) / 3) ≤
        ((21 : ℝ) / 25) * Real.log (2 : ℝ) :=
    le_trans hlog53_upper hlog2_scaled_lower
  have hlog_inv :
      Real.log ((3 : ℝ) / 5) =
        -Real.log ((5 : ℝ) / 3) := by
    rw [show ((3 : ℝ) / 5) = (((5 : ℝ) / 3)⁻¹) by norm_num,
      Real.log_inv]
  have hlog_target :
      -(positiveBoxSigmaMin * Real.log (2 : ℝ)) ≤
        Real.log ((3 : ℝ) / 5) := by
    rw [hlog_inv]
    norm_num [positiveBoxSigmaMin]
    linarith
  have hexp :
      Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) ≤
        (3 : ℝ) / 5 :=
    (Real.le_log_iff_exp_le (by norm_num : 0 < (3 : ℝ) / 5)).mp
      hlog_target
  calc
    (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ)))
        ≤ (1 : ℝ) / 2 * ((3 : ℝ) / 5) := by
          exact mul_le_mul_of_nonneg_left hexp (by norm_num)
    _ = (3 : ℝ) / 10 := by norm_num

/-- Closed endpoint package for the selected q bracket. -/
def positiveBoxQEndpointData : PositiveBoxQEndpointData where
  lower_endpoint := by
    simpa [positiveBoxQLowerCandidate, positiveBoxQNormLowerEndpoint]
      using positiveBox_q_endpoint_lower
  upper_endpoint := by
    simpa [positiveBoxQUpperCandidate, positiveBoxQNormUpperEndpoint]
      using positiveBox_q_endpoint_upper

/--
The lower q-bound follows from the upper real edge and one endpoint
transcendental inequality.
-/
theorem positiveBox_q_norm_lower_27_100_of_endpoint
    (hend :
      positiveBoxQLowerCandidate ≤ positiveBoxQNormLowerEndpoint)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxQLowerCandidate ≤ ‖q s‖ := by
  have hqnorm :
      ‖q s‖ =
        (1 : ℝ) / 2 * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hlog2 : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have hmul :
      s.re * Real.log (2 : ℝ) ≤
        positiveBoxSigmaMax * Real.log (2 : ℝ) := by
    exact mul_le_mul_of_nonneg_right
      (positiveBox_re_upper hs) (le_of_lt hlog2)
  have harg :
      -(positiveBoxSigmaMax * Real.log (2 : ℝ)) ≤
        -(s.re * Real.log (2 : ℝ)) := by
    linarith
  have hexp :
      Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) ≤
        Real.exp (-(s.re * Real.log (2 : ℝ))) :=
    Real.exp_le_exp.mpr harg
  have hqge : positiveBoxQNormLowerEndpoint ≤ ‖q s‖ := by
    rw [hqnorm, positiveBoxQNormLowerEndpoint]
    exact mul_le_mul_of_nonneg_left hexp (by norm_num)
  exact le_trans hend hqge

/--
The upper q-bound follows from the lower real edge and one endpoint
transcendental inequality.
-/
theorem positiveBox_q_norm_upper_3_10_of_endpoint
    (hend :
      positiveBoxQNormUpperEndpoint ≤ positiveBoxQUpperCandidate)
    {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ ≤ positiveBoxQUpperCandidate := by
  have hqnorm :
      ‖q s‖ =
        (1 : ℝ) / 2 * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hlog2 : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have hmul :
      positiveBoxSigmaMin * Real.log (2 : ℝ) ≤
        s.re * Real.log (2 : ℝ) := by
    exact mul_le_mul_of_nonneg_right
      (positiveBox_re_lower hs) (le_of_lt hlog2)
  have harg :
      -(s.re * Real.log (2 : ℝ)) ≤
        -(positiveBoxSigmaMin * Real.log (2 : ℝ)) := by
    linarith
  have hexp :
      Real.exp (-(s.re * Real.log (2 : ℝ))) ≤
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) :=
    Real.exp_le_exp.mpr harg
  have hqle : ‖q s‖ ≤ positiveBoxQNormUpperEndpoint := by
    rw [hqnorm, positiveBoxQNormUpperEndpoint]
    exact mul_le_mul_of_nonneg_left hexp (by norm_num)
  exact le_trans hqle hend

/--
Interval data for the norm of `q` over the selected box.
-/
structure PositiveBoxQBounds (qLower qUpper : ℝ) : Prop where
  q_norm_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → qLower ≤ ‖q s‖
  q_norm_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → ‖q s‖ ≤ qUpper
  q_norm_lt_one :
    qUpper < 1

/-- A conditional q-norm upper below one gives the pointwise strict bound. -/
theorem PositiveBoxQBounds.point_lt_one
    {qLower qUpper : ℝ} (data : PositiveBoxQBounds qLower qUpper)
    {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ < 1 :=
  lt_of_le_of_lt (data.q_norm_upper hs) data.q_norm_lt_one

/-- Endpoint q-data supplies the selected candidate q bracket. -/
def PositiveBoxQBounds.ofEndpointData
    (data : PositiveBoxQEndpointData) :
    PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate where
  q_norm_lower := by
    intro s hs
    exact positiveBox_q_norm_lower_27_100_of_endpoint
      data.lower_endpoint hs
  q_norm_upper := by
    intro s hs
    exact positiveBox_q_norm_upper_3_10_of_endpoint
      data.upper_endpoint hs
  q_norm_lt_one := positiveBoxQUpperCandidate_lt_one

/-- Closed q-norm bounds for the selected positive box. -/
def positiveBoxQBounds :
    PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate :=
  PositiveBoxQBounds.ofEndpointData positiveBoxQEndpointData

/-- Closed lower q-bound on the selected positive box. -/
theorem positiveBox_q_norm_lower_27_100
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxQLowerCandidate ≤ ‖q s‖ :=
  positiveBoxQBounds.q_norm_lower hs

/-- Closed upper q-bound on the selected positive box. -/
theorem positiveBox_q_norm_upper_3_10
    {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ ≤ positiveBoxQUpperCandidate :=
  positiveBoxQBounds.q_norm_upper hs

/--
Conditional horizontal envelope bound for the q-ratio ledger on the selected
box.

This is still an interval/analytic obligation; the scalar ledger below only
uses it through the conservative rational `positiveBoxHorizontalUpperValue`.
-/
structure PositiveBoxHorizontalUpperData : Prop where
  horizontal_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      constantCoreHorizontalUpperQRatio positiveBoxN s ≤
        positiveBoxHorizontalUpperValue

/--
Odd-truncation norm upper sufficient for the local horizontal q-ratio bound.

With `‖q s‖ <= 3 / 10`, the value `7 / 180` gives
`constantCoreHorizontalUpperQRatio positiveBoxN s <= 1 / 100`.
-/
def positiveBoxOddTruncationUpperValue : ℝ :=
  (7 : ℝ) / 180

/-- The selected odd-truncation upper candidate is positive. -/
theorem positiveBoxOddTruncationUpperValue_pos :
    0 < positiveBoxOddTruncationUpperValue := by
  norm_num [positiveBoxOddTruncationUpperValue]

/-- Conditional odd-truncation data for the selected positive box. -/
structure PositiveBoxOddTruncationData : Prop where
  odd_truncation_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      constantCoreOddTruncationNorm positiveBoxN s ≤
        positiveBoxOddTruncationUpperValue

/--
The selected odd-truncation norm is the raw finite odd-core sum against
`oddDirichletChannel`, not the continued odd channel.
-/
theorem positiveBox_constantCoreOddTruncationNorm_eq_rawOddChannel
    (s : ℂ) :
    constantCoreOddTruncationNorm positiveBoxN s =
      ‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖ := by
  simp [constantCoreOddTruncationNorm, c2ConcreteOddTruncationError,
    c2OddTruncationError, constantCoreCutoff]

/--
Pointwise raw odd-channel truncation control is exactly the data needed by the
positive-box ledger.
-/
def PositiveBoxOddTruncationData.ofRawOddChannelBound
    (hbound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖ ≤
          positiveBoxOddTruncationUpperValue) :
    PositiveBoxOddTruncationData where
  odd_truncation_bound := by
    intro s hs
    rw [positiveBox_constantCoreOddTruncationNorm_eq_rawOddChannel]
    exact hbound hs

/--
A q upper and an odd-truncation upper imply the horizontal q-ratio upper.
-/
def PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
    (q_bounds :
      PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate)
    (odd_data : PositiveBoxOddTruncationData) :
    PositiveBoxHorizontalUpperData where
  horizontal_upper := by
    intro s hs
    have hq' : ‖q s‖ ≤ positiveBoxQUpperCandidate :=
      q_bounds.q_norm_upper hs
    have hden_low : (7 : ℝ) / 10 ≤ 1 - ‖q s‖ := by
      norm_num [positiveBoxQUpperCandidate] at hq'
      linarith
    have hden_nonneg : 0 ≤ 1 - ‖q s‖ := by
      linarith
    have hinv_nonneg : 0 ≤ (1 - ‖q s‖)⁻¹ :=
      inv_nonneg.mpr hden_nonneg
    have hinv : (1 - ‖q s‖)⁻¹ ≤ (10 : ℝ) / 7 := by
      have htmp :=
        inv_anti₀ (show (0 : ℝ) < (7 / 10 : ℝ) by norm_num) hden_low
      norm_num at htmp ⊢
      exact htmp
    have hr2up : ‖q s‖ ^ 2 ≤ positiveBoxQUpperCandidate ^ 2 := by
      exact pow_le_pow_left₀ (norm_nonneg (q s)) hq' 2
    have hodd' := odd_data.odd_truncation_bound hs
    have hodd_nonneg : 0 ≤ constantCoreOddTruncationNorm positiveBoxN s := by
      unfold constantCoreOddTruncationNorm
      exact norm_nonneg _
    have hmul1 :
        ‖q s‖ ^ 2 * constantCoreOddTruncationNorm positiveBoxN s ≤
          positiveBoxQUpperCandidate ^ 2 * positiveBoxOddTruncationUpperValue := by
      exact mul_le_mul hr2up hodd' hodd_nonneg (by positivity)
    have htop :
        2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm positiveBoxN s ≤
          (7 : ℝ) / 1000 := by
      calc
        2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm positiveBoxN s
            = 2 * (‖q s‖ ^ 2 *
                constantCoreOddTruncationNorm positiveBoxN s) := by
              ring
        _ ≤ 2 * (positiveBoxQUpperCandidate ^ 2 *
              positiveBoxOddTruncationUpperValue) := by
            exact mul_le_mul_of_nonneg_left hmul1 (by norm_num)
        _ = (7 : ℝ) / 1000 := by
            norm_num [positiveBoxQUpperCandidate,
              positiveBoxOddTruncationUpperValue]
    unfold constantCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
      constantCoreHorizontalAmplitudeQRatio unitScale qNormHorizontalRatio
    have htop_nonneg :
        0 ≤ 2 * ‖q s‖ ^ 2 *
          constantCoreOddTruncationNorm positiveBoxN s := by
      positivity
    calc
      (2 * ‖q s‖ ^ 2 *
          constantCoreOddTruncationNorm positiveBoxN s / 1) *
          (1 - ‖q s‖)⁻¹
          =
        (2 * ‖q s‖ ^ 2 *
          constantCoreOddTruncationNorm positiveBoxN s) *
          (1 - ‖q s‖)⁻¹ := by
            ring
      _ ≤ ((7 : ℝ) / 1000) * ((10 : ℝ) / 7) := by
            exact mul_le_mul htop hinv hinv_nonneg (by norm_num)
      _ = positiveBoxHorizontalUpperValue := by
            norm_num [positiveBoxHorizontalUpperValue]

/--
Reduced data needed to prove the selected positive-box q-ratio ledger.

The arithmetic ledger itself is proved below.  The remaining hypotheses are
the interval bracket for `‖q s‖` and a local upper for the horizontal q-ratio
envelope.
-/
structure PositiveBoxLedgerBounds : Prop where
  q_bounds :
    PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate
  horizontal_upper : PositiveBoxHorizontalUpperData

/-- Short constructor for the selected positive-box ledger bounds. -/
def PositiveBoxLedgerBounds.ofQAndHorizontal
    (q_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxQLowerCandidate ≤ ‖q s‖)
    (q_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖q s‖ ≤ positiveBoxQUpperCandidate)
    (horizontal_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        constantCoreHorizontalUpperQRatio positiveBoxN s ≤
          positiveBoxHorizontalUpperValue) :
    PositiveBoxLedgerBounds where
  q_bounds := {
    q_norm_lower := q_lower
    q_norm_upper := q_upper
    q_norm_lt_one := positiveBoxQUpperCandidate_lt_one }
  horizontal_upper := {
    horizontal_upper := horizontal_upper }

/--
Endpoint q-data plus odd-truncation data are enough to produce the selected
ledger bounds.
-/
def PositiveBoxLedgerBounds.ofEndpointQAndOddTruncation
    (q_endpoint : PositiveBoxQEndpointData)
    (odd_data : PositiveBoxOddTruncationData) :
    PositiveBoxLedgerBounds where
  q_bounds := PositiveBoxQBounds.ofEndpointData q_endpoint
  horizontal_upper :=
    PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      (PositiveBoxQBounds.ofEndpointData q_endpoint) odd_data

/-- Upper bound for the left side of the positive-box scalar ledger. -/
theorem positiveBoxLedger_left_le
    {r H : ℝ}
    (_hrlow : positiveBoxQLowerCandidate ≤ r)
    (hrup : r ≤ positiveBoxQUpperCandidate)
    (_hHnonneg : 0 ≤ H)
    (hH : H ≤ positiveBoxHorizontalUpperValue) :
    ((((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue) + H) *
          (1 + r)) *
        (1 - r)⁻¹ + H + positiveBoxCutUpperValue) ≤
      (13 : ℝ) / 250 := by
  have hr_nonneg : 0 ≤ r := by
    have hupper_lt : positiveBoxQUpperCandidate < 1 :=
      positiveBoxQUpperCandidate_lt_one
    have hlower_nonneg : 0 ≤ positiveBoxQLowerCandidate := by
      norm_num [positiveBoxQLowerCandidate]
    linarith
  have hden_low : (7 : ℝ) / 10 ≤ 1 - r := by
    norm_num [positiveBoxQUpperCandidate] at hrup
    linarith
  have hinv : (1 - r)⁻¹ ≤ (10 : ℝ) / 7 := by
    have htmp :=
      inv_anti₀ (show (0 : ℝ) < (7 / 10 : ℝ) by norm_num) hden_low
    norm_num at htmp ⊢
    exact htmp
  have hsum :
      positiveBoxAnchorUpperValue + positiveBoxCutUpperValue + H ≤
        (21 : ℝ) / 1000 := by
    norm_num [positiveBoxAnchorUpperValue, positiveBoxCutUpperValue,
      positiveBoxHorizontalUpperValue] at hH ⊢
    linarith
  have hfactor : 1 + r ≤ (13 : ℝ) / 10 := by
    norm_num [positiveBoxQUpperCandidate] at hrup
    linarith
  have hprod1 :
      (positiveBoxAnchorUpperValue + positiveBoxCutUpperValue + H) *
          (1 + r) ≤
        ((21 : ℝ) / 1000) * ((13 : ℝ) / 10) := by
    exact mul_le_mul hsum hfactor (by linarith) (by norm_num)
  have hmain :
      ((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue + H) *
          (1 + r)) *
          (1 - r)⁻¹ ≤
        (273 : ℝ) / 7000 := by
    calc
      ((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue + H) *
          (1 + r)) *
          (1 - r)⁻¹
          ≤ (((21 : ℝ) / 1000) * ((13 : ℝ) / 10)) *
              ((10 : ℝ) / 7) := by
            exact mul_le_mul hprod1 hinv (by positivity) (by norm_num)
      _ = (273 : ℝ) / 7000 := by norm_num
  calc
    (((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue) + H) *
        (1 + r)) *
        (1 - r)⁻¹ + H + positiveBoxCutUpperValue
        =
      ((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue + H) *
        (1 + r)) *
        (1 - r)⁻¹ + H + positiveBoxCutUpperValue := by ring
    _ ≤ (273 : ℝ) / 7000 + (1 : ℝ) / 100 +
        positiveBoxCutUpperValue := by
          exact add_le_add (add_le_add hmain hH) (le_refl _)
    _ = (13 : ℝ) / 250 := by
          norm_num [positiveBoxCutUpperValue, positiveBoxHorizontalUpperValue]

/-- Lower bound for the right side of the positive-box scalar ledger. -/
theorem positiveBoxLedger_right_ge
    {r : ℝ}
    (hrlow : positiveBoxQLowerCandidate ≤ r)
    (hrup : r ≤ positiveBoxQUpperCandidate) :
    (14663 : ℝ) / 250000 ≤
      r ^ 2 * positiveBoxSectorLowerValue - r ^ 6 * (1 - r)⁻¹ := by
  have hr_nonneg : 0 ≤ r := by
    have hlower_nonneg : 0 ≤ positiveBoxQLowerCandidate := by
      norm_num [positiveBoxQLowerCandidate]
    linarith
  have hden_low : (7 : ℝ) / 10 ≤ 1 - r := by
    norm_num [positiveBoxQUpperCandidate] at hrup
    linarith
  have hinv : (1 - r)⁻¹ ≤ (10 : ℝ) / 7 := by
    have htmp :=
      inv_anti₀ (show (0 : ℝ) < (7 / 10 : ℝ) by norm_num) hden_low
    norm_num at htmp ⊢
    exact htmp
  have hr2low : positiveBoxQLowerCandidate ^ 2 ≤ r ^ 2 := by
    exact pow_le_pow_left₀
      (show 0 ≤ positiveBoxQLowerCandidate by
        norm_num [positiveBoxQLowerCandidate])
      hrlow 2
  have hfirst :
      positiveBoxQLowerCandidate ^ 2 * positiveBoxSectorLowerValue ≤
        r ^ 2 * positiveBoxSectorLowerValue := by
    exact mul_le_mul_of_nonneg_right hr2low
      (by norm_num [positiveBoxSectorLowerValue])
  have hr6up : r ^ 6 ≤ positiveBoxQUpperCandidate ^ 6 := by
    exact pow_le_pow_left₀ hr_nonneg hrup 6
  have htail :
      r ^ 6 * (1 - r)⁻¹ ≤
        positiveBoxQUpperCandidate ^ 6 * ((10 : ℝ) / 7) := by
    exact mul_le_mul hr6up hinv (by positivity) (by positivity)
  norm_num [positiveBoxQLowerCandidate, positiveBoxQUpperCandidate,
    positiveBoxSectorLowerValue] at hfirst htail ⊢
  nlinarith

/-- The conservative q/horizontal bounds imply the scalar q-ratio ledger. -/
theorem positiveBoxLedger_real_strict
    {r H : ℝ}
    (hrlow : positiveBoxQLowerCandidate ≤ r)
    (hrup : r ≤ positiveBoxQUpperCandidate)
    (hHnonneg : 0 ≤ H)
    (hH : H ≤ positiveBoxHorizontalUpperValue) :
    ((((positiveBoxAnchorUpperValue + positiveBoxCutUpperValue) + H) *
          (1 + r)) *
        (1 - r)⁻¹ + H + positiveBoxCutUpperValue) <
      r ^ 2 * positiveBoxSectorLowerValue - r ^ 6 * (1 - r)⁻¹ := by
  have hleft :=
    positiveBoxLedger_left_le (r := r) (H := H) hrlow hrup hHnonneg hH
  have hright :=
    positiveBoxLedger_right_ge (r := r) hrlow hrup
  have hgap : (13 : ℝ) / 250 < (14663 : ℝ) / 250000 := by
    norm_num
  exact lt_of_le_of_lt hleft (lt_of_lt_of_le hgap hright)

/--
The positive-box ledger is now reduced to q-norm interval bounds and a local
horizontal q-ratio upper.
-/
theorem PositiveBoxLedgerBounds.ledger_strict
    (data : PositiveBoxLedgerBounds)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s := by
  have hHnonneg :
      0 ≤ constantCoreHorizontalUpperQRatio positiveBoxN s :=
    positiveBox_constantCoreHorizontalUpperQRatio_nonneg hs
  have hstrict :=
    positiveBoxLedger_real_strict
      (r := ‖q s‖)
      (H := constantCoreHorizontalUpperQRatio positiveBoxN s)
      (data.q_bounds.q_norm_lower hs)
      (data.q_bounds.q_norm_upper hs)
      hHnonneg
      (data.horizontal_upper.horizontal_upper hs)
  simpa [vSplitResidualLedgerQRatio,
    c2ExpandedQuartetSectorResidualMargin, c2QuartetVerticalTailUpper,
    positiveBoxAnchorUpper, positiveBoxCutUpper, positiveBoxSectorLower]
    using hstrict

/-- Direct ledger theorem from the three reduced positive-box obligations. -/
theorem positiveBox_ledger_strict_ofQAndHorizontal
    (q_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxQLowerCandidate ≤ ‖q s‖)
    (q_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖q s‖ ≤ positiveBoxQUpperCandidate)
    (horizontal_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        constantCoreHorizontalUpperQRatio positiveBoxN s ≤
          positiveBoxHorizontalUpperValue)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  (PositiveBoxLedgerBounds.ofQAndHorizontal
    q_lower q_upper horizontal_upper).ledger_strict hs

/--
Direct ledger theorem from q endpoint inequalities and the odd-truncation
upper.
-/
theorem positiveBox_ledger_strict_ofEndpointQAndOddTruncation
    (q_endpoint : PositiveBoxQEndpointData)
    (odd_data : PositiveBoxOddTruncationData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  (PositiveBoxLedgerBounds.ofEndpointQAndOddTruncation
    q_endpoint odd_data).ledger_strict hs

/--
After the endpoint numerics above, the selected positive-box scalar ledger is
conditional only on the odd-truncation upper.
-/
theorem positiveBox_ledger_strict_ofOddTruncation
    (odd_data : PositiveBoxOddTruncationData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  positiveBox_ledger_strict_ofEndpointQAndOddTruncation
    positiveBoxQEndpointData odd_data hs

/-- Phase coordinate reserved for a later sector proof. -/
noncomputable def positiveBoxQPhase : ℂ → ℝ :=
  fun s => Complex.arg (q s)

/--
Conditional sector data for the quartet prefix over the selected box.

The phase fields are scaffolding for a future trigonometric interval proof.
The sector lower field is exactly what `PositiveBoxCertificate` needs.
-/
structure PositiveBoxSectorData (phaseLower phaseUpper : ℝ) : Prop where
  q_phase_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → phaseLower ≤ positiveBoxQPhase s
  q_phase_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → positiveBoxQPhase s ≤ phaseUpper
  sector_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖

/-- Extract the sector field in the shape required by the positive certificate. -/
theorem PositiveBoxSectorData.to_sector_lower
    {phaseLower phaseUpper : ℝ}
    (data : PositiveBoxSectorData phaseLower phaseUpper)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖ :=
  data.sector_lower hs

/-- Conditional non-ledger fields of the selected positive-box certificate. -/
structure PositiveBoxAnalyticBounds : Prop where
  anchor_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖anchor s‖ ≤ positiveBoxAnchorUpperValue
  cut_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
  sector_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖

/--
Build the positive-box certificate after the ledger has been reduced to
q/horizontal interval data.
-/
def PositiveBoxCertificate.ofAnalyticBoundsAndLedgerBounds
    (analytic : PositiveBoxAnalyticBounds)
    (ledger : PositiveBoxLedgerBounds) :
    PositiveBoxCertificate where
  anchor_bound := analytic.anchor_bound
  cut_bound := analytic.cut_bound
  sector_lower := analytic.sector_lower
  ledger_strict := by
    intro s hs
    exact ledger.ledger_strict hs

/--
Full conditional interval data intended to replace the fields of
`PositiveBoxCertificate` one by one.
-/
structure PositiveBoxIntervalData
    (qLower qUpper phaseLower phaseUpper : ℝ) : Prop where
  q_bounds : PositiveBoxQBounds qLower qUpper
  sector_data : PositiveBoxSectorData phaseLower phaseUpper
  anchor_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖anchor s‖ ≤ positiveBoxAnchorUpperValue
  cut_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
  ledger_strict :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      vSplitResidualLedgerQRatio
          positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
        c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s

/--
Turn future interval data into the existing positive-box certificate.

The q bounds are retained in the interval data because they are expected to be
used in the eventual proof of `ledger_strict`.
-/
def PositiveBoxCertificate.ofQBoundsAndIntervalBounds
    {qLower qUpper phaseLower phaseUpper : ℝ}
    (data : PositiveBoxIntervalData qLower qUpper phaseLower phaseUpper) :
    PositiveBoxCertificate where
  anchor_bound := data.anchor_bound
  cut_bound := data.cut_bound
  sector_lower := data.sector_data.sector_lower
  ledger_strict := data.ledger_strict

/--
Sector dominance from future interval data for the selected positive box.
-/
theorem positiveBox_qratio_sectorResidualDominance_of_intervalData
    {qLower qUpper phaseLower phaseUpper : ℝ}
    (data : PositiveBoxIntervalData qLower qUpper phaseLower phaseUpper)
    {s : ℂ} (hs : s ∈ positiveBox) :
    C2ExpandedQuartetSectorResidualDominance
      positiveBoxSectorLower
      (vSplitTiltConstantQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
      unitScale
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      positiveBoxCutUpper unitScale s :=
  positiveBox_qratio_sectorResidualDominance
    (PositiveBoxCertificate.ofQBoundsAndIntervalBounds data) hs

/--
True-prefix residual dominance from future interval data for the selected box.
-/
theorem positiveBox_qratio_truePrefixResidualDominance_of_intervalData
    {qLower qUpper phaseLower phaseUpper : ℝ}
    (data : PositiveBoxIntervalData qLower qUpper phaseLower phaseUpper)
    {s : ℂ} (hs : s ∈ positiveBox) :
    c2ExpandedQuartetResidualUpper
        (vSplitTiltConstantQRatio
          positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
        unitScale
        (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
        unitScale qNormHorizontalRatio
        positiveBoxCutUpper unitScale s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s :=
  positiveBox_qratio_truePrefixResidualDominance
    (PositiveBoxCertificate.ofQBoundsAndIntervalBounds data) hs

end

end ContinuedQuartetAudit
end C2
