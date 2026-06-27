import LeanC2.Analytic.GenuineBulkConcrete

/-!
# Genuine middle no-cancellation audit

This module records genuine-first facts for the C2 genuine numerator.  The
continued channel is useful later as a transfer surface, but the middle
obligation tracked here is geometric: prevent cancellation in the genuine
central C2 object.
-/

namespace C2
namespace GenuineMiddleAudit

/-- Technical name for the balanced seed used by the adjusted quartet route. -/
noncomputable abbrev adjustedQuartetBalancingSeed
    (coreCutoff : ℕ → ℕ) (K M : ℕ) : ℂ → ℂ :=
  c2OddTailBalancingSeed coreCutoff K M

/-- Technical name for the balanced genuine bulk model. -/
noncomputable abbrev adjustedQuartetBalancedGenuineBulkModel
    (coreCutoff : ℕ → ℕ) (K M : ℕ) : ℂ → ℂ :=
  c2OddTailBalancingSeedBulkModel coreCutoff K M

/-- The four-floor vertical quartet prefix cannot vanish in the right half-plane. -/
theorem verticalQuartetPrefix_ne_zero_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    verticalQuartetPrefix (q s) ≠ 0 := by
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_re_pos s hs
  have hprefix_lower :
      (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2) ≤
        ‖verticalQuartetPrefix (q s)‖ :=
    verticalQuartetPrefix_norm_lower_bound_of_norm_le_one
      (z := q s) (le_of_lt hq_lt)
  have hleft_pos : 0 < (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2) := by
    have hfirst : 0 < 1 - ‖q s‖ := by linarith
    have hsecond : 0 < 1 + ‖q s‖ ^ 2 := by positivity
    exact mul_pos hfirst hsecond
  have hnorm_pos : 0 < ‖verticalQuartetPrefix (q s)‖ :=
    lt_of_lt_of_le hleft_pos hprefix_lower
  exact norm_pos_iff.mp hnorm_pos

/-- For the quartet rectangle `K = 5`, the finite depth factor is `q² P₄(q)`. -/
theorem rectangularDepthFactor_five_eq_quartet (s : ℂ) :
    rectangularDepthFactor s 5 =
      q s ^ 2 * verticalQuartetPrefix (q s) := by
  unfold rectangularDepthFactor verticalQuartetPrefix q
  norm_num [Finset.sum_Icc_succ_top]
  ring

/-- The quartet depth factor is nonzero in the right half-plane. -/
theorem rectangularDepthFactor_five_ne_zero_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularDepthFactor s 5 ≠ 0 := by
  rw [rectangularDepthFactor_five_eq_quartet]
  exact mul_ne_zero
    (pow_ne_zero 2 (by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s))
    (verticalQuartetPrefix_ne_zero_of_re_pos hs)

/--
Finite quartet genuine nonvanishing reduces to the odd-core factor.  This is the
finite geometric counterpart of the empirical detector: the vertical quartet
itself supplies no zero in `Re(s) > 0`.
-/
theorem rectangularGenuine_five_ne_zero_of_oddCore_ne_zero
    {s : ℂ} {M : ℕ} (hs : 0 < s.re)
    (hodd : rectangularOddCoreSum s M ≠ 0) :
    rectangularGenuine s 5 M ≠ 0 := by
  rw [rectangularGenuine_eq_depth_core]
  exact mul_ne_zero
    (mul_ne_zero (by norm_num)
      (rectangularDepthFactor_five_ne_zero_of_re_pos hs))
    hodd

/-- The smallest odd core is the base term `1`. -/
theorem rectangularOddCoreSum_one (s : ℂ) :
    rectangularOddCoreSum s 1 = 1 := by
  unfold rectangularOddCoreSum
  rw [show oddCoresUpTo 1 = {1} by
    ext m
    constructor
    · intro hm
      rw [mem_oddCoresUpTo] at hm
      rcases hm with ⟨hle, hodd⟩
      rcases hodd with ⟨k, hk⟩
      simp
      omega
    · intro hm
      have hm1 : m = 1 := by
        simpa using hm
      subst m
      rw [mem_oddCoresUpTo]
      exact ⟨by norm_num, ⟨0, by norm_num⟩⟩]
  simp [complexDirichletCoeff_one]

/-- On `Re(s) > 0`, the `3` core has norm strictly smaller than the base core. -/
theorem complexDirichletCoeff_three_norm_lt_one_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    ‖complexDirichletCoeff s 3‖ < 1 := by
  unfold complexDirichletCoeff
  have hre :
      (-(s * (Real.log ((3 : Nat) : ℝ) : ℂ))).re =
        -(s.re * Real.log (3 : ℝ)) := by
    simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero]
    norm_num
  rw [Complex.norm_exp, hre]
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hmul_pos : 0 < s.re * Real.log (3 : ℝ) := mul_pos hs hlog3
  rw [← Real.exp_zero]
  exact Real.exp_lt_exp.mpr (by linarith)

/-- Exact norm of the `3` odd-core coefficient in the genuine two-core block. -/
theorem complexDirichletCoeff_three_norm_eq (s : ℂ) :
    ‖complexDirichletCoeff s 3‖ =
      Real.exp (-(s.re * Real.log (3 : ℝ))) := by
  unfold complexDirichletCoeff
  have hre :
      (-(s * (Real.log ((3 : Nat) : ℝ) : ℂ))).re =
        -(s.re * Real.log (3 : ℝ)) := by
    simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero]
    norm_num
  rw [Complex.norm_exp, hre]

/-- A lower bound on `Re(s)` gives an explicit lower bound for the two-core
odd-core margin. -/
theorem complexDirichletCoeff_three_core_margin_lower_bound_of_re_ge
    {s : ℂ} {sigma0 : ℝ} (hsigma : sigma0 ≤ s.re) :
    1 - Real.exp (-(sigma0 * Real.log (3 : ℝ))) ≤
      1 - ‖complexDirichletCoeff s 3‖ := by
  rw [complexDirichletCoeff_three_norm_eq]
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hmul : sigma0 * Real.log (3 : ℝ) ≤
      s.re * Real.log (3 : ℝ) := by
    exact mul_le_mul_of_nonneg_right hsigma (le_of_lt hlog3)
  have hexp :
      Real.exp (-(s.re * Real.log (3 : ℝ))) ≤
        Real.exp (-(sigma0 * Real.log (3 : ℝ))) := by
    exact Real.exp_le_exp.mpr (by linarith)
  linarith

/-- The first two odd cores are exactly `1` and `3`. -/
theorem rectangularOddCoreSum_three_eq (s : ℂ) :
    rectangularOddCoreSum s 3 = 1 + complexDirichletCoeff s 3 := by
  unfold rectangularOddCoreSum
  rw [show oddCoresUpTo 3 = ({1, 3} : Finset ℕ) by
    ext m
    constructor
    · intro hm
      rw [mem_oddCoresUpTo] at hm
      rcases hm with ⟨hle, hodd⟩
      rcases hodd with ⟨k, hk⟩
      have hm13 : m = 1 ∨ m = 3 := by omega
      rcases hm13 with rfl | rfl <;> simp
    · intro hm
      have hm13 : m = 1 ∨ m = 3 := by
        simpa using hm
      rcases hm13 with hm | hm
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨0, by norm_num⟩⟩
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨1, by norm_num⟩⟩]
  simp [complexDirichletCoeff_one]

/--
Odd-core no-cancellation criterion around the base core.  If all non-base odd
core contributions fail to cancel the `m = 1` term, the finite odd core is
nonzero.
-/
theorem rectangularOddCoreSum_ne_zero_of_base_dominance
    {s : ℂ} {M : ℕ}
    (htail : ‖rectangularOddCoreSum s M - 1‖ < 1) :
    rectangularOddCoreSum s M ≠ 0 := by
  intro hzero
  have hnorm :
      ‖rectangularOddCoreSum s M - 1‖ = (1 : ℝ) := by
    rw [hzero]
    norm_num
  linarith

/--
Finite quartet genuine nonvanishing from a base-core dominance margin in the
odd channel.
-/
theorem rectangularGenuine_five_ne_zero_of_base_dominance
    {s : ℂ} {M : ℕ} (hs : 0 < s.re)
    (htail : ‖rectangularOddCoreSum s M - 1‖ < 1) :
    rectangularGenuine s 5 M ≠ 0 :=
  rectangularGenuine_five_ne_zero_of_oddCore_ne_zero hs
    (rectangularOddCoreSum_ne_zero_of_base_dominance htail)

/-- The minimal quartet rectangle is already nonzero throughout `Re(s) > 0`. -/
theorem rectangularGenuine_five_one_ne_zero_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularGenuine s 5 1 ≠ 0 := by
  exact rectangularGenuine_five_ne_zero_of_oddCore_ne_zero hs (by
    rw [rectangularOddCoreSum_one]
    norm_num)

/-- The two-core odd rectangle is nonzero throughout `Re(s) > 0`. -/
theorem rectangularOddCoreSum_three_ne_zero_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularOddCoreSum s 3 ≠ 0 := by
  apply rectangularOddCoreSum_ne_zero_of_base_dominance
  have htail :
      ‖rectangularOddCoreSum s 3 - 1‖ =
        ‖complexDirichletCoeff s 3‖ := by
    rw [rectangularOddCoreSum_three_eq]
    congr 1
    ring
  rw [htail]
  exact complexDirichletCoeff_three_norm_lt_one_of_re_pos hs

/-- The two-core quartet rectangle is nonzero throughout `Re(s) > 0`. -/
theorem rectangularGenuine_five_three_ne_zero_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularGenuine s 5 3 ≠ 0 :=
  rectangularGenuine_five_ne_zero_of_oddCore_ne_zero hs
    (rectangularOddCoreSum_three_ne_zero_of_re_pos hs)

/-- A finite geometric depth sum beginning at depth `2` cannot vanish when the
ratio is nonzero and strictly inside the unit disk. -/
theorem finite_geometric_depth_sum_ne_zero_of_norm_lt_one
    {z : ℂ} {K : ℕ} (hK : 2 ≤ K) (hz0 : z ≠ 0)
    (hzlt : ‖z‖ < 1) :
    (∑ k ∈ Finset.Icc 2 K, z ^ k) ≠ 0 := by
  have hz1 : z ≠ 1 := by
    intro hz
    rw [hz, norm_one] at hzlt
    linarith
  rw [depthGeometricSum_Icc_closed z hK hz1]
  refine div_ne_zero ?_ (sub_ne_zero.mpr hz1)
  have hpow_lt : ‖z ^ (K - 1)‖ < 1 := by
    rw [norm_pow]
    exact pow_lt_one₀ (norm_nonneg z) hzlt (by omega)
  have hpow_ne_one : z ^ (K - 1) ≠ 1 := by
    intro h
    rw [h, norm_one] at hpow_lt
    linarith
  have hfactor :
      z ^ (K + 1) - z ^ 2 = z ^ 2 * (z ^ (K - 1) - 1) := by
    have hKsplit : K + 1 = 2 + (K - 1) := by omega
    rw [hKsplit, pow_add]
    ring
  rw [hfactor]
  exact mul_ne_zero (pow_ne_zero 2 hz0) (sub_ne_zero.mpr hpow_ne_one)

/-- A finite geometric depth sum has a closed-form norm lower envelope inside
the unit disk.  This uses the exact geometric closed form, so it avoids the
coarse base-versus-tail estimate that degenerates near `‖z‖ = 1 / 2`. -/
theorem finite_geometric_depth_sum_norm_lower_bound_of_norm_lt_one
    {z : ℂ} {K : ℕ} (hK : 2 ≤ K) (hzlt : ‖z‖ < 1) :
    ‖z‖ ^ 2 * (1 - ‖z‖) / (1 + ‖z‖) ≤
      ‖∑ k ∈ Finset.Icc 2 K, z ^ k‖ := by
  let r : ℝ := ‖z‖
  have hr0 : 0 ≤ r := by
    dsimp [r]
    exact norm_nonneg z
  have hrlt : r < 1 := by
    dsimp [r]
    exact hzlt
  have hrle : r ≤ 1 := le_of_lt hrlt
  have hnum_nonneg : 0 ≤ 1 - r := by linarith
  have hz1 : z ≠ 1 := by
    intro hz
    rw [hz, norm_one] at hzlt
    linarith
  have hnormden_pos : 0 < ‖z - 1‖ := by
    exact norm_pos_iff.mpr (sub_ne_zero.mpr hz1)
  have hden_le : ‖z - 1‖ ≤ 1 + r := by
    calc
      ‖z - 1‖ ≤ ‖z‖ + ‖(1 : ℂ)‖ := norm_sub_le z 1
      _ = 1 + r := by
          dsimp [r]
          rw [norm_one]
          ring
  have hpow_norm_le_r : ‖z ^ (K - 1)‖ ≤ r := by
    rw [norm_pow]
    have hpow : r ^ (K - 1) ≤ r ^ 1 :=
      pow_le_pow_of_le_one hr0 hrle (by omega : 1 ≤ K - 1)
    simpa using hpow
  have hpow_lower : 1 - r ≤ ‖z ^ (K - 1) - 1‖ := by
    have htri : ‖(1 : ℂ)‖ ≤
        ‖1 - z ^ (K - 1)‖ + ‖z ^ (K - 1)‖ := by
      calc
        ‖(1 : ℂ)‖ =
            ‖(1 - z ^ (K - 1)) + z ^ (K - 1)‖ := by ring_nf
        _ ≤ ‖1 - z ^ (K - 1)‖ + ‖z ^ (K - 1)‖ := norm_add_le _ _
    rw [norm_one] at htri
    have hmain : 1 - r ≤ ‖1 - z ^ (K - 1)‖ := by linarith
    simpa [norm_sub_rev] using hmain
  have hleft_den :
      (1 - r) / (1 + r) ≤ (1 - r) / ‖z - 1‖ := by
    exact div_le_div_of_nonneg_left hnum_nonneg hnormden_pos hden_le
  have hright_num :
      (1 - r) / ‖z - 1‖ ≤
        ‖z ^ (K - 1) - 1‖ / ‖z - 1‖ := by
    exact div_le_div_of_nonneg_right hpow_lower (le_of_lt hnormden_pos)
  have hratio :
      (1 - r) / (1 + r) ≤
        ‖z ^ (K - 1) - 1‖ / ‖z - 1‖ :=
    le_trans hleft_den hright_num
  have hfactor :
      z ^ (K + 1) - z ^ 2 = z ^ 2 * (z ^ (K - 1) - 1) := by
    have hKsplit : K + 1 = 2 + (K - 1) := by omega
    rw [hKsplit, pow_add]
    ring
  rw [depthGeometricSum_Icc_closed z hK hz1]
  rw [hfactor, Complex.norm_div, norm_mul, norm_pow]
  change r ^ 2 * (1 - r) / (1 + r) ≤
    r ^ 2 * ‖z ^ (K - 1) - 1‖ / ‖z - 1‖
  calc
    r ^ 2 * (1 - r) / (1 + r)
        = r ^ 2 * ((1 - r) / (1 + r)) := by ring
    _ ≤ r ^ 2 * (‖z ^ (K - 1) - 1‖ / ‖z - 1‖) := by
        exact mul_le_mul_of_nonneg_left hratio (sq_nonneg r)
    _ = r ^ 2 * ‖z ^ (K - 1) - 1‖ / ‖z - 1‖ := by ring

/-- The finite C2 vertical depth factor is nonzero for every nonempty
right-half-plane rectangle, not only for the first quartet. -/
theorem rectangularDepthFactor_ne_zero_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularDepthFactor s K ≠ 0 := by
  unfold rectangularDepthFactor
  exact finite_geometric_depth_sum_ne_zero_of_norm_lt_one
    hK (by
      unfold verticalRatio
      exact complexDirichletDepthRatio_ne_zero s)
    (verticalRatio_norm_lt_one_of_re_pos s hs)

/-- General finite genuine rectangle reduction: once the odd-core channel is
nonzero, no finite vertical depth cutoff `K >= 2` can create cancellation. -/
theorem rectangularGenuine_ne_zero_of_re_pos_of_oddCore_ne_zero
    {s : ℂ} {K M : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K)
    (hodd : rectangularOddCoreSum s M ≠ 0) :
    rectangularGenuine s K M ≠ 0 := by
  rw [rectangularGenuine_eq_depth_core]
  exact mul_ne_zero
    (mul_ne_zero (by norm_num)
      (rectangularDepthFactor_ne_zero_of_re_pos hs hK))
    hodd

/-- The base-core genuine rectangle is nonzero for every finite depth cutoff
`K >= 2` in the right half-plane. -/
theorem rectangularGenuine_one_ne_zero_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularGenuine s K 1 ≠ 0 :=
  rectangularGenuine_ne_zero_of_re_pos_of_oddCore_ne_zero hs hK (by
    rw [rectangularOddCoreSum_one]
    norm_num)

/-- The two-core genuine rectangle is nonzero for every finite depth cutoff
`K >= 2` in the right half-plane. -/
theorem rectangularGenuine_three_ne_zero_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularGenuine s K 3 ≠ 0 :=
  rectangularGenuine_ne_zero_of_re_pos_of_oddCore_ne_zero hs hK
    (rectangularOddCoreSum_three_ne_zero_of_re_pos hs)

/-- In the open right half-plane the C2 vertical ratio has norm below `1 / 2`. -/
theorem q_norm_lt_half_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    ‖q s‖ < (1 / 2 : ℝ) := by
  rw [q, verticalRatio_norm]
  have hlog2 : 0 < Real.log (2 : ℝ) := Real.log_pos (by norm_num)
  have hmul_pos : 0 < s.re * Real.log (2 : ℝ) := mul_pos hs hlog2
  have hexp_lt_one : Real.exp (-(s.re * Real.log (2 : ℝ))) < 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_lt_exp.mpr (by linarith)
  nlinarith [Real.exp_pos (-(s.re * Real.log (2 : ℝ)))]

/-- In the unit real strip, the C2 vertical ratio has norm at least `1 / 4`.
Together with `q_norm_lt_half_of_re_pos`, this pins the raw finite vertical
margin to a compact geometric bracket. -/
theorem q_norm_ge_quarter_of_re_le_one
    {s : ℂ} (hsle : s.re ≤ 1) :
    (1 / 4 : ℝ) ≤ ‖q s‖ := by
  rw [q, verticalRatio_norm]
  have hlog2 : 0 < Real.log (2 : ℝ) := Real.log_pos (by norm_num)
  have hmul : s.re * Real.log (2 : ℝ) ≤ Real.log (2 : ℝ) := by
    simpa using mul_le_mul_of_nonneg_right hsle (le_of_lt hlog2)
  have hexp :
      Real.exp (-(Real.log (2 : ℝ))) ≤
        Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    exact Real.exp_le_exp.mpr (by linarith)
  have hhalf : Real.exp (-(Real.log (2 : ℝ))) = (1 / 2 : ℝ) := by
    rw [Real.exp_neg, Real.exp_log (by norm_num : (0 : ℝ) < 2)]
    norm_num
  nlinarith

/-- Cubic tail controlled by the strict `‖q‖ < 1 / 2` vertical margin. -/
theorem cubic_tail_norm_bound_of_norm_lt_half
    {z : ℂ} (hz : ‖z‖ < (1 / 2 : ℝ)) :
    ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 < 1 := by
  let r : ℝ := ‖z‖
  have hr0 : 0 ≤ r := norm_nonneg z
  have hr : r < (1 / 2 : ℝ) := hz
  have hr2_le : r ^ 2 ≤ r / 2 := by
    have hnonneg : 0 ≤ r * ((1 / 2 : ℝ) - r) := by
      exact mul_nonneg hr0 (by linarith)
    nlinarith
  have hr3_le : r ^ 3 ≤ r ^ 2 / 2 := by
    have hnonneg : 0 ≤ r ^ 2 * ((1 / 2 : ℝ) - r) := by
      exact mul_nonneg (sq_nonneg r) (by linarith)
    nlinarith
  nlinarith

/-- Sharp enough cubic-tail bound at the `‖q‖ < 1 / 2` barrier. -/
theorem cubic_tail_norm_lt_seven_eighth_of_norm_lt_half
    {z : ℂ} (hz : ‖z‖ < (1 / 2 : ℝ)) :
    ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 < (7 / 8 : ℝ) := by
  let r : ℝ := ‖z‖
  have hr0 : 0 ≤ r := norm_nonneg z
  have hr : r < (1 / 2 : ℝ) := hz
  have hr2_le : r ^ 2 ≤ r / 2 := by
    have hnonneg : 0 ≤ r * ((1 / 2 : ℝ) - r) := by
      exact mul_nonneg hr0 (by linarith)
    nlinarith
  have hr3_le : r ^ 3 ≤ r ^ 2 / 2 := by
    have hnonneg : 0 ≤ r ^ 2 * ((1 / 2 : ℝ) - r) := by
      exact mul_nonneg (sq_nonneg r) (by linarith)
    nlinarith
  have hr3_le_quarter : r ^ 3 ≤ r / 4 := by
    nlinarith
  nlinarith

/-- The weighted quartet tail leaves a uniform `1 / 8` bracket margin. -/
theorem one_eighth_lt_one_sub_cubic_tail_of_norm_lt_half
    {z : ℂ} (hz : ‖z‖ < (1 / 2 : ℝ)) :
    (1 / 8 : ℝ) < 1 - (‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3) := by
  have htail :=
    cubic_tail_norm_lt_seven_eighth_of_norm_lt_half (z := z) hz
  linarith

/-- Right-half-plane specialization of the uniform `1 / 8` bracket margin. -/
theorem one_eighth_le_one_sub_q_cubic_tail_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    (1 / 8 : ℝ) ≤ 1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3) := by
  exact le_of_lt (one_eighth_lt_one_sub_cubic_tail_of_norm_lt_half
    (z := q s) (q_norm_lt_half_of_re_pos hs))

/--
Weighted quartet prefix no-cancellation.  If the three non-base vertical floors
are only damped by coefficients of norm at most `1`, they still cannot cancel
the base floor.
-/
theorem weightedQuartetPrefix_ne_zero_of_norm_lt_half
    {z a b c : ℂ} (hz : ‖z‖ < (1 / 2 : ℝ))
    (ha : ‖a‖ ≤ 1) (hb : ‖b‖ ≤ 1) (hc : ‖c‖ ≤ 1) :
    1 + z * a + z ^ 2 * b + z ^ 3 * c ≠ 0 := by
  let tail : ℂ := z * a + z ^ 2 * b + z ^ 3 * c
  have hza : ‖z * a‖ ≤ ‖z‖ := by
    rw [norm_mul]
    simpa using mul_le_mul_of_nonneg_left ha (norm_nonneg z)
  have hzb : ‖z ^ 2 * b‖ ≤ ‖z‖ ^ 2 := by
    rw [norm_mul, norm_pow]
    simpa using mul_le_mul_of_nonneg_left hb (pow_nonneg (norm_nonneg z) 2)
  have hzc : ‖z ^ 3 * c‖ ≤ ‖z‖ ^ 3 := by
    rw [norm_mul, norm_pow]
    simpa using mul_le_mul_of_nonneg_left hc (pow_nonneg (norm_nonneg z) 3)
  have htail_le :
      ‖tail‖ ≤ ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 := by
    calc
      ‖tail‖ =
          ‖z * a + z ^ 2 * b + z ^ 3 * c‖ := by rfl
      _ ≤ ‖z * a + z ^ 2 * b‖ + ‖z ^ 3 * c‖ := norm_add_le _ _
      _ ≤ (‖z * a‖ + ‖z ^ 2 * b‖) + ‖z ^ 3 * c‖ := by
          exact add_le_add (norm_add_le (z * a) (z ^ 2 * b)) le_rfl
      _ ≤ (‖z‖ + ‖z‖ ^ 2) + ‖z‖ ^ 3 := by
          exact add_le_add (add_le_add hza hzb) hzc
      _ = ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 := by ring
  have htail_lt : ‖tail‖ < 1 :=
    lt_of_le_of_lt htail_le (cubic_tail_norm_bound_of_norm_lt_half hz)
  intro hzero
  have htail_eq : tail = -1 := by
    have h : (1 : ℂ) + tail = 0 := by
      simpa [tail, add_assoc] using hzero
    calc
      tail = (1 : ℂ) + tail - 1 := by ring
      _ = 0 - 1 := by rw [h]
      _ = -1 := by ring
  have htail_norm : ‖tail‖ = 1 := by
    rw [htail_eq, norm_neg, norm_one]
  linarith

/-- Quantitative version of the weighted quartet barrier.  The base floor
dominates the three weighted upper floors by the cubic tail. -/
theorem weightedQuartetPrefix_norm_lower_bound
    {z a b c : ℂ}
    (ha : ‖a‖ ≤ 1) (hb : ‖b‖ ≤ 1) (hc : ‖c‖ ≤ 1) :
    1 - (‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3) ≤
      ‖1 + z * a + z ^ 2 * b + z ^ 3 * c‖ := by
  let tail : ℂ := z * a + z ^ 2 * b + z ^ 3 * c
  have hza : ‖z * a‖ ≤ ‖z‖ := by
    rw [norm_mul]
    simpa using mul_le_mul_of_nonneg_left ha (norm_nonneg z)
  have hzb : ‖z ^ 2 * b‖ ≤ ‖z‖ ^ 2 := by
    rw [norm_mul, norm_pow]
    simpa using mul_le_mul_of_nonneg_left hb (pow_nonneg (norm_nonneg z) 2)
  have hzc : ‖z ^ 3 * c‖ ≤ ‖z‖ ^ 3 := by
    rw [norm_mul, norm_pow]
    simpa using mul_le_mul_of_nonneg_left hc (pow_nonneg (norm_nonneg z) 3)
  have htail_le :
      ‖tail‖ ≤ ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 := by
    calc
      ‖tail‖ = ‖z * a + z ^ 2 * b + z ^ 3 * c‖ := by rfl
      _ ≤ ‖z * a + z ^ 2 * b‖ + ‖z ^ 3 * c‖ := norm_add_le _ _
      _ ≤ (‖z * a‖ + ‖z ^ 2 * b‖) + ‖z ^ 3 * c‖ := by
          exact add_le_add (norm_add_le (z * a) (z ^ 2 * b)) le_rfl
      _ ≤ (‖z‖ + ‖z‖ ^ 2) + ‖z‖ ^ 3 := by
          exact add_le_add (add_le_add hza hzb) hzc
      _ = ‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3 := by ring
  have hbase : (1 : ℝ) ≤ ‖(1 : ℂ) + tail‖ + ‖tail‖ := by
    calc
      (1 : ℝ) = ‖(1 : ℂ)‖ := by simp
      _ = ‖((1 : ℂ) + tail) - tail‖ := by ring_nf
      _ ≤ ‖(1 : ℂ) + tail‖ + ‖tail‖ := norm_sub_le _ _
  have hmain :
      1 - (‖z‖ + ‖z‖ ^ 2 + ‖z‖ ^ 3) ≤
        ‖(1 : ℂ) + tail‖ := by
    linarith
  simpa [tail, add_assoc] using hmain

/-- Right-half-plane spelling of the weighted quartet prefix barrier. -/
theorem weightedQuartetPrefix_ne_zero_of_re_pos
    {s a b c : ℂ} (hs : 0 < s.re)
    (ha : ‖a‖ ≤ 1) (hb : ‖b‖ ≤ 1) (hc : ‖c‖ ≤ 1) :
    1 + q s * a + q s ^ 2 * b + q s ^ 3 * c ≠ 0 :=
  weightedQuartetPrefix_ne_zero_of_norm_lt_half
    (q_norm_lt_half_of_re_pos hs) ha hb hc

/-- A perturbation of `1` by a vector of norm below `1` cannot vanish. -/
theorem one_add_ne_zero_of_norm_lt_one {z : ℂ} (hz : ‖z‖ < 1) :
    (1 : ℂ) + z ≠ 0 := by
  intro hzero
  have hz_eq : z = -1 := by
    calc
      z = (1 : ℂ) + z - 1 := by ring
      _ = 0 - 1 := by rw [hzero]
      _ = -1 := by ring
  have hnorm : ‖z‖ = 1 := by
    rw [hz_eq, norm_neg, norm_one]
  linarith

/-- The cutoff weight is never zero. -/
theorem exponentialCutoffWeight_ne_zero (X : ℝ) (n : ℕ) :
    exponentialCutoffWeight X n ≠ 0 := by
  unfold exponentialCutoffWeight
  exact Complex.exp_ne_zero _

/-- The note-style cutoff weight is a positive real exponential. -/
theorem exponentialCutoffWeight_eq_ofReal (X : ℝ) (n : ℕ) :
    exponentialCutoffWeight X n =
      (Real.exp (-((n : ℝ) / X)) : ℂ) := by
  unfold exponentialCutoffWeight
  rw [Complex.ofReal_exp]
  congr 1
  rw [Complex.ofReal_neg, Complex.ofReal_div]
  norm_num

/-- Norm of the note-style cutoff weight. -/
theorem exponentialCutoffWeight_norm (X : ℝ) (n : ℕ) :
    ‖exponentialCutoffWeight X n‖ =
      Real.exp (-((n : ℝ) / X)) := by
  unfold exponentialCutoffWeight
  have harg :
      -((n : ℂ) / (X : ℂ)) =
        ((-((n : ℝ) / X) : ℝ) : ℂ) := by
    rw [Complex.ofReal_neg, Complex.ofReal_div]
    norm_num
  rw [harg, Complex.norm_exp]
  simp

/-- Positive cutoffs damp larger addresses relative to smaller addresses. -/
theorem exponentialCutoffWeight_ratio_norm_le_one
    {X : ℝ} (hX : 0 < X) {n m : ℕ} (hnm : n ≤ m) :
    ‖exponentialCutoffWeight X m / exponentialCutoffWeight X n‖ ≤ 1 := by
  rw [Complex.norm_div, exponentialCutoffWeight_norm,
    exponentialCutoffWeight_norm]
  have hcast : (n : ℝ) ≤ (m : ℝ) := by exact_mod_cast hnm
  have hdiv : (n : ℝ) / X ≤ (m : ℝ) / X :=
    div_le_div_of_nonneg_right hcast (le_of_lt hX)
  have hexp :
      Real.exp (-((m : ℝ) / X)) ≤ Real.exp (-((n : ℝ) / X)) :=
    Real.exp_le_exp.mpr (by linarith)
  exact div_le_one_of_le₀ hexp (le_of_lt (Real.exp_pos _))

/-- A cutoff center term on the base odd core is a vertically weighted `q` power. -/
theorem centerGeometricTerm_exponentialCutoffCoeff_one_eq
    (s : ℂ) (X : ℝ) (k : ℕ) :
    centerGeometricTerm (exponentialCutoffCoeff s X) k 1 =
      (2 : ℂ) * q s ^ k * exponentialCutoffWeight X (2 ^ k) := by
  unfold centerGeometricTerm exponentialCutoffCoeff q verticalRatio
  simp [complexDirichletCoeff_two_pow, depthGeometricRatio,
    dyadicWeight_eq_inv_pow, map_pow, mul_pow]
  ring

/-- A cutoff center term on the `m = 3` odd core is the same vertical power
weighted by the core coefficient and the cutoff at `3 * 2^k`. -/
theorem centerGeometricTerm_exponentialCutoffCoeff_three_eq
    (s : ℂ) (X : ℝ) (k : ℕ) :
    centerGeometricTerm (exponentialCutoffCoeff s X) k 3 =
      (2 : ℂ) * q s ^ k * complexDirichletCoeff s 3 *
        exponentialCutoffWeight X (2 ^ k * 3) := by
  unfold centerGeometricTerm exponentialCutoffCoeff q verticalRatio
  rw [complexDirichletCoeff_mul s
    (pow_ne_zero k (by norm_num : (2 : ℕ) ≠ 0)) (by norm_num)]
  rw [complexDirichletCoeff_two_pow]
  simp [depthGeometricRatio, dyadicWeight_eq_inv_pow, map_pow, mul_pow]
  ring

/-- The cutoff base quartet is exactly a nonzero scalar times a weighted prefix. -/
theorem rectangularExponentialGenuine_five_one_eq_weighted_prefix
    (s : ℂ) (X : ℝ) :
    rectangularExponentialGenuine s 5 1 X =
      ((2 : ℂ) * q s ^ 2 * exponentialCutoffWeight X 4) *
        (1 +
          q s * (exponentialCutoffWeight X 8 /
            exponentialCutoffWeight X 4) +
          q s ^ 2 * (exponentialCutoffWeight X 16 /
            exponentialCutoffWeight X 4) +
          q s ^ 3 * (exponentialCutoffWeight X 32 /
            exponentialCutoffWeight X 4)) := by
  have hodd : oddCoresUpTo 1 = ({1} : Finset ℕ) := by
    ext m
    constructor
    · intro hm
      rw [mem_oddCoresUpTo] at hm
      rcases hm with ⟨hle, hodd⟩
      rcases hodd with ⟨k, hk⟩
      simp
      omega
    · intro hm
      have hm1 : m = 1 := by
        simpa using hm
      subst m
      rw [mem_oddCoresUpTo]
      exact ⟨by norm_num, ⟨0, by norm_num⟩⟩
  rw [rectangularExponentialGenuine_eq_geometric, hodd]
  norm_num [Finset.sum_Icc_succ_top,
    centerGeometricTerm_exponentialCutoffCoeff_one_eq]
  field_simp [exponentialCutoffWeight_ne_zero X 4]

/--
The exponentially cut off base quartet is nonzero in the right half-plane for
positive cutoff scale.  This avoids the coarse triangular residual route in
the minimal odd-core case.
-/
theorem rectangularExponentialGenuine_five_one_ne_zero_of_re_pos_of_cutoff_pos
    {s : ℂ} {X : ℝ} (hs : 0 < s.re) (hX : 0 < X) :
    rectangularExponentialGenuine s 5 1 X ≠ 0 := by
  rw [rectangularExponentialGenuine_five_one_eq_weighted_prefix]
  have hprefix :
      1 +
          q s * (exponentialCutoffWeight X 8 /
            exponentialCutoffWeight X 4) +
          q s ^ 2 * (exponentialCutoffWeight X 16 /
            exponentialCutoffWeight X 4) +
          q s ^ 3 * (exponentialCutoffWeight X 32 /
            exponentialCutoffWeight X 4) ≠ 0 :=
    weightedQuartetPrefix_ne_zero_of_re_pos hs
      (exponentialCutoffWeight_ratio_norm_le_one hX (by norm_num))
      (exponentialCutoffWeight_ratio_norm_le_one hX (by norm_num))
      (exponentialCutoffWeight_ratio_norm_le_one hX (by norm_num))
  exact mul_ne_zero
    (mul_ne_zero
      (mul_ne_zero (by norm_num)
        (pow_ne_zero 2 (by
          unfold q verticalRatio
          exact complexDirichletDepthRatio_ne_zero s)))
      (exponentialCutoffWeight_ne_zero X 4))
    hprefix

/-- The two-core cutoff fiber at a dyadic address, normalized by the base
cutoff weight at `4`. -/
noncomputable def twoCoreCutoffFiber (s : ℂ) (X : ℝ) (n : ℕ) : ℂ :=
  exponentialCutoffWeight X n / exponentialCutoffWeight X 4 +
    complexDirichletCoeff s 3 *
      (exponentialCutoffWeight X (3 * n) / exponentialCutoffWeight X 4)

/-- The base two-core cutoff fiber cannot vanish in the right half-plane. -/
theorem twoCoreCutoffFiber_four_ne_zero
    {s : ℂ} {X : ℝ} (hs : 0 < s.re) (hX : 0 < X) :
    twoCoreCutoffFiber s X 4 ≠ 0 := by
  unfold twoCoreCutoffFiber
  rw [div_self (exponentialCutoffWeight_ne_zero X 4)]
  apply one_add_ne_zero_of_norm_lt_one
  have hratio :
      ‖exponentialCutoffWeight X (3 * 4) /
          exponentialCutoffWeight X 4‖ ≤ 1 :=
    exponentialCutoffWeight_ratio_norm_le_one hX (by norm_num)
  have hcoeff : ‖complexDirichletCoeff s 3‖ < 1 :=
    complexDirichletCoeff_three_norm_lt_one_of_re_pos hs
  rw [norm_mul]
  exact mul_lt_one_of_nonneg_of_lt_one_left (norm_nonneg _)
    hcoeff hratio

/-- Exact two-core factorization of the `K = 5, M = 3` cutoff block. -/
theorem rectangularExponentialGenuine_five_three_eq_twoCore_fibers
    (s : ℂ) (X : ℝ) :
    rectangularExponentialGenuine s 5 3 X =
      ((2 : ℂ) * q s ^ 2 * exponentialCutoffWeight X 4) *
        (twoCoreCutoffFiber s X 4 +
          q s * twoCoreCutoffFiber s X 8 +
          q s ^ 2 * twoCoreCutoffFiber s X 16 +
          q s ^ 3 * twoCoreCutoffFiber s X 32) := by
  have hodd : oddCoresUpTo 3 = ({1, 3} : Finset ℕ) := by
    ext m
    constructor
    · intro hm
      rw [mem_oddCoresUpTo] at hm
      rcases hm with ⟨hle, hodd⟩
      rcases hodd with ⟨k, hk⟩
      have hm13 : m = 1 ∨ m = 3 := by omega
      rcases hm13 with rfl | rfl <;> simp
    · intro hm
      have hm13 : m = 1 ∨ m = 3 := by
        simpa using hm
      rcases hm13 with hm | hm
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨0, by norm_num⟩⟩
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨1, by norm_num⟩⟩
  rw [rectangularExponentialGenuine_eq_geometric, hodd]
  norm_num [Finset.sum_Icc_succ_top,
    centerGeometricTerm_exponentialCutoffCoeff_one_eq,
    centerGeometricTerm_exponentialCutoffCoeff_three_eq,
    twoCoreCutoffFiber]
  field_simp [exponentialCutoffWeight_ne_zero X 4]

/-- The exact normalized two-core fiber prefix left by the `K = 5, M = 3`
cutoff block after removing the nonzero scalar. -/
noncomputable def twoCoreCutoffFiberPrefix (s : ℂ) (X : ℝ) : ℂ :=
  twoCoreCutoffFiber s X 4 +
    q s * twoCoreCutoffFiber s X 8 +
    q s ^ 2 * twoCoreCutoffFiber s X 16 +
    q s ^ 3 * twoCoreCutoffFiber s X 32

/-- A four-floor cutoff prefix starting at a concrete C2 address, normalized by
the base cutoff weight at address `4`. -/
noncomputable def cutoffAddressQuartetPrefix (s : ℂ) (X : ℝ) (n : ℕ) : ℂ :=
  exponentialCutoffWeight X n / exponentialCutoffWeight X 4 +
    q s * (exponentialCutoffWeight X (2 * n) / exponentialCutoffWeight X 4) +
    q s ^ 2 * (exponentialCutoffWeight X (4 * n) / exponentialCutoffWeight X 4) +
    q s ^ 3 * (exponentialCutoffWeight X (8 * n) / exponentialCutoffWeight X 4)

/-- The `K = 5, M = 3` cutoff block is exactly a nonzero scalar times the
two-core fiber prefix. -/
theorem rectangularExponentialGenuine_five_three_eq_twoCore_fiberPrefix
    (s : ℂ) (X : ℝ) :
    rectangularExponentialGenuine s 5 3 X =
      ((2 : ℂ) * q s ^ 2 * exponentialCutoffWeight X 4) *
        twoCoreCutoffFiberPrefix s X := by
  rw [rectangularExponentialGenuine_five_three_eq_twoCore_fibers]
  rfl

/-- The two-core fiber prefix splits into the address-`4` and address-`12`
cutoff quartet prefixes.  This is the active finite genuine object: prove this
sum cannot vanish, using the phase coupling between `q s` and the `3`-core. -/
theorem twoCoreCutoffFiberPrefix_eq_address_prefixes
    (s : ℂ) (X : ℝ) :
    twoCoreCutoffFiberPrefix s X =
      cutoffAddressQuartetPrefix s X 4 +
        complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12 := by
  unfold twoCoreCutoffFiberPrefix twoCoreCutoffFiber cutoffAddressQuartetPrefix
  norm_num
  ring

/-- Any address quartet prefix factors into its own base cutoff weight times a
weighted vertical quartet prefix. -/
theorem cutoffAddressQuartetPrefix_eq_weighted_prefix
    (s : ℂ) (X : ℝ) (n : ℕ) :
    cutoffAddressQuartetPrefix s X n =
      (exponentialCutoffWeight X n / exponentialCutoffWeight X 4) *
        (1 +
          q s * (exponentialCutoffWeight X (2 * n) /
            exponentialCutoffWeight X n) +
          q s ^ 2 * (exponentialCutoffWeight X (4 * n) /
            exponentialCutoffWeight X n) +
          q s ^ 3 * (exponentialCutoffWeight X (8 * n) /
            exponentialCutoffWeight X n)) := by
  unfold cutoffAddressQuartetPrefix
  field_simp [exponentialCutoffWeight_ne_zero X 4,
    exponentialCutoffWeight_ne_zero X n]

/-- A single address quartet prefix cannot vanish in the right half-plane under
positive cutoff.  The remaining two-core obstruction is therefore only
cross-core cancellation between nonzero address prefixes. -/
theorem cutoffAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos
    {s : ℂ} {X : ℝ} (n : ℕ) (hs : 0 < s.re) (hX : 0 < X) :
    cutoffAddressQuartetPrefix s X n ≠ 0 := by
  rw [cutoffAddressQuartetPrefix_eq_weighted_prefix]
  have hprefix :
      1 +
          q s * (exponentialCutoffWeight X (2 * n) /
            exponentialCutoffWeight X n) +
          q s ^ 2 * (exponentialCutoffWeight X (4 * n) /
            exponentialCutoffWeight X n) +
          q s ^ 3 * (exponentialCutoffWeight X (8 * n) /
            exponentialCutoffWeight X n) ≠ 0 :=
    weightedQuartetPrefix_ne_zero_of_re_pos hs
      (exponentialCutoffWeight_ratio_norm_le_one hX (by omega))
      (exponentialCutoffWeight_ratio_norm_le_one hX (by omega))
      (exponentialCutoffWeight_ratio_norm_le_one hX (by omega))
  exact mul_ne_zero
    (div_ne_zero (exponentialCutoffWeight_ne_zero X n)
      (exponentialCutoffWeight_ne_zero X 4))
    hprefix

/-- Exact address-collision obstruction for the two-core cutoff prefix. -/
def twoCoreCutoffAddressCollision (s : ℂ) (X : ℝ) : Prop :=
  cutoffAddressQuartetPrefix s X 4 =
    -complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12

/-- The two-core fiber prefix is nonzero exactly when the address-`4` prefix
does not collide with the `3`-core multiple of the address-`12` prefix. -/
theorem twoCoreCutoffFiberPrefix_ne_zero_iff_no_address_collision
    (s : ℂ) (X : ℝ) :
    twoCoreCutoffFiberPrefix s X ≠ 0 ↔
      ¬ twoCoreCutoffAddressCollision s X := by
  rw [twoCoreCutoffFiberPrefix_eq_address_prefixes]
  unfold twoCoreCutoffAddressCollision
  constructor
  · intro hprefix hcollision
    apply hprefix
    rw [hcollision]
    ring
  · intro hno hzero
    apply hno
    calc
      cutoffAddressQuartetPrefix s X 4 =
          (cutoffAddressQuartetPrefix s X 4 +
              complexDirichletCoeff s 3 *
                cutoffAddressQuartetPrefix s X 12) -
            complexDirichletCoeff s 3 *
              cutoffAddressQuartetPrefix s X 12 := by ring
      _ = 0 -
            complexDirichletCoeff s 3 *
              cutoffAddressQuartetPrefix s X 12 := by rw [hzero]
      _ = -complexDirichletCoeff s 3 *
            cutoffAddressQuartetPrefix s X 12 := by ring

/-- Address collision is impossible under strict address-prefix norm dominance.
This is only a local sufficient criterion; it is not the global finite target. -/
theorem twoCoreCutoffFiberPrefix_ne_zero_of_address_norm_dominance
    {s : ℂ} {X : ℝ}
    (hdom :
      ‖complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12‖ <
        ‖cutoffAddressQuartetPrefix s X 4‖) :
    twoCoreCutoffFiberPrefix s X ≠ 0 := by
  rw [twoCoreCutoffFiberPrefix_ne_zero_iff_no_address_collision]
  intro hcollision
  unfold twoCoreCutoffAddressCollision at hcollision
  have hnorm :
      ‖cutoffAddressQuartetPrefix s X 4‖ =
        ‖complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12‖ := by
    rw [hcollision, norm_mul, norm_neg, ← norm_mul]
  linarith

/-- The two-core cutoff target is exactly the nonvanishing of the normalized
four-floor two-core fiber prefix. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_iff_twoCore_fibers
    (s : ℂ) (X : ℝ) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 ↔
      twoCoreCutoffFiber s X 4 +
          q s * twoCoreCutoffFiber s X 8 +
          q s ^ 2 * twoCoreCutoffFiber s X 16 +
          q s ^ 3 * twoCoreCutoffFiber s X 32 ≠ 0 := by
  rw [rectangularExponentialGenuine_five_three_eq_twoCore_fibers]
  constructor
  · intro htotal hprefix
    apply htotal
    rw [hprefix]
    ring
  · intro hprefix
    exact mul_ne_zero
      (mul_ne_zero
        (mul_ne_zero (by norm_num)
          (pow_ne_zero 2 (by
            unfold q verticalRatio
            exact complexDirichletDepthRatio_ne_zero s)))
        (exponentialCutoffWeight_ne_zero X 4))
      hprefix

/-- Named prefix version of the exact `K = 5, M = 3` cutoff nonvanishing
reduction. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_iff_twoCore_fiberPrefix
    (s : ℂ) (X : ℝ) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 ↔
      twoCoreCutoffFiberPrefix s X ≠ 0 := by
  rw [rectangularExponentialGenuine_five_three_eq_twoCore_fiberPrefix]
  constructor
  · intro htotal hprefix
    apply htotal
    rw [hprefix]
    ring
  · intro hprefix
    exact mul_ne_zero
      (mul_ne_zero
        (mul_ne_zero (by norm_num)
          (pow_ne_zero 2 (by
            unfold q verticalRatio
            exact complexDirichletDepthRatio_ne_zero s)))
        (exponentialCutoffWeight_ne_zero X 4))
      hprefix

/-- Exact collision-free criterion for the `K = 5, M = 3` cutoff block. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_no_address_collision
    {s : ℂ} {X : ℝ}
    (hcollision : ¬ twoCoreCutoffAddressCollision s X) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 := by
  rw [rectangularExponentialGenuine_five_three_ne_zero_iff_twoCore_fiberPrefix,
    twoCoreCutoffFiberPrefix_ne_zero_iff_no_address_collision]
  exact hcollision

/-- Local address-dominance criterion for the `K = 5, M = 3` cutoff block. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_address_norm_dominance
    {s : ℂ} {X : ℝ}
    (hdom :
      ‖complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12‖ <
        ‖cutoffAddressQuartetPrefix s X 4‖) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 := by
  exact rectangularExponentialGenuine_five_three_ne_zero_of_no_address_collision
    ((twoCoreCutoffFiberPrefix_ne_zero_iff_no_address_collision s X).mp
      (twoCoreCutoffFiberPrefix_ne_zero_of_address_norm_dominance hdom))

/-- A two-variable region for cutoff statements: point `s` and cutoff scale `X`. -/
abbrev CutoffRegion : Type :=
  ℂ → ℝ → Prop

/-- Region-level no-collision package for the two-core cutoff obstruction. -/
def TwoCoreCutoffNoAddressCollisionOn (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X → ¬ twoCoreCutoffAddressCollision s X

/-- Region-level nonvanishing package for the two-core cutoff block. -/
def TwoCoreCutoffNonvanishingOn (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X → rectangularExponentialGenuine s 5 3 X ≠ 0

/-- The region-level finite cutoff target is exactly a no-address-collision
package on the chosen region. -/
theorem twoCoreCutoffNonvanishingOn_of_noAddressCollisionOn
    {region : CutoffRegion}
    (hregion : TwoCoreCutoffNoAddressCollisionOn region) :
    TwoCoreCutoffNonvanishingOn region := by
  intro s X hs
  exact rectangularExponentialGenuine_five_three_ne_zero_of_no_address_collision
    (hregion hs)

/-- The unrestricted positive-cutoff right half-plane.  The audit records that
this is too large for the two-core finite cutoff target. -/
def positiveCutoffRightHalfPlaneRegion : CutoffRegion :=
  fun s X => 0 < s.re ∧ 0 < X

/-!
## Candidate regularizer interface

The exponential cutoff above is only one finite regularization of the genuine
address geometry.  The following definitions isolate the same two-core
address-collision obligation for an arbitrary candidate cutoff weight `W`.
Instantiating `W` with a super-Gaussian profile is a later proof step; these
lemmas only record the regularizer-independent shape.
-/

/-- Generic normalized address quartet for a candidate cutoff weight. -/
noncomputable def candidateCutoffAddressQuartetPrefix
    (W : ℕ → ℂ) (s : ℂ) (n : ℕ) : ℂ :=
  W n / W 4 +
    q s * (W (2 * n) / W 4) +
    q s ^ 2 * (W (4 * n) / W 4) +
    q s ^ 3 * (W (8 * n) / W 4)

/-- Generic two-core prefix for a candidate cutoff weight. -/
noncomputable def candidateTwoCoreCutoffPrefix
    (W : ℕ → ℂ) (s : ℂ) : ℂ :=
  candidateCutoffAddressQuartetPrefix W s 4 +
    complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix W s 12

/-- Generic address-collision obstruction for a candidate cutoff weight. -/
def candidateTwoCoreCutoffAddressCollision
    (W : ℕ → ℂ) (s : ℂ) : Prop :=
  candidateCutoffAddressQuartetPrefix W s 4 =
    -complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix W s 12

/-- A candidate address quartet factors through its own base weight. -/
theorem candidateCutoffAddressQuartetPrefix_eq_weighted_prefix
    {W : ℕ → ℂ} {s : ℂ} {n : ℕ}
    (h4 : W 4 ≠ 0) (hn : W n ≠ 0) :
    candidateCutoffAddressQuartetPrefix W s n =
      (W n / W 4) *
        (1 +
          q s * (W (2 * n) / W n) +
          q s ^ 2 * (W (4 * n) / W n) +
          q s ^ 3 * (W (8 * n) / W n)) := by
  unfold candidateCutoffAddressQuartetPrefix
  field_simp [h4, hn]

/-- Generic single-address no-cancellation from monotone relative weights. -/
theorem candidateCutoffAddressQuartetPrefix_ne_zero_of_ratio_bounds
    {W : ℕ → ℂ} {s : ℂ} {n : ℕ} (hs : 0 < s.re)
    (h4 : W 4 ≠ 0) (hn : W n ≠ 0)
    (h2 : ‖W (2 * n) / W n‖ ≤ 1)
    (h4n : ‖W (4 * n) / W n‖ ≤ 1)
    (h8 : ‖W (8 * n) / W n‖ ≤ 1) :
    candidateCutoffAddressQuartetPrefix W s n ≠ 0 := by
  rw [candidateCutoffAddressQuartetPrefix_eq_weighted_prefix h4 hn]
  exact mul_ne_zero
    (div_ne_zero hn h4)
    (weightedQuartetPrefix_ne_zero_of_re_pos hs h2 h4n h8)

/-- Generic quantitative lower bound for a single candidate address quartet
from monotone relative weights. -/
theorem candidateCutoffAddressQuartetPrefix_norm_lower_bound_of_ratio_bounds
    {W : ℕ → ℂ} {s : ℂ} {n : ℕ}
    (h4 : W 4 ≠ 0) (hn : W n ≠ 0)
    (h2 : ‖W (2 * n) / W n‖ ≤ 1)
    (h4n : ‖W (4 * n) / W n‖ ≤ 1)
    (h8 : ‖W (8 * n) / W n‖ ≤ 1) :
    ‖W n / W 4‖ *
        (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3)) ≤
      ‖candidateCutoffAddressQuartetPrefix W s n‖ := by
  rw [candidateCutoffAddressQuartetPrefix_eq_weighted_prefix h4 hn]
  rw [norm_mul]
  exact mul_le_mul_of_nonneg_left
    (weightedQuartetPrefix_norm_lower_bound h2 h4n h8)
    (norm_nonneg (W n / W 4))

/-- The generic two-core prefix is nonzero exactly away from address collision. -/
theorem candidateTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision
    (W : ℕ → ℂ) (s : ℂ) :
    candidateTwoCoreCutoffPrefix W s ≠ 0 ↔
      ¬ candidateTwoCoreCutoffAddressCollision W s := by
  unfold candidateTwoCoreCutoffPrefix candidateTwoCoreCutoffAddressCollision
  constructor
  · intro hprefix hcollision
    apply hprefix
    rw [hcollision]
    ring
  · intro hno hzero
    apply hno
    calc
      candidateCutoffAddressQuartetPrefix W s 4 =
          (candidateCutoffAddressQuartetPrefix W s 4 +
              complexDirichletCoeff s 3 *
                candidateCutoffAddressQuartetPrefix W s 12) -
            complexDirichletCoeff s 3 *
              candidateCutoffAddressQuartetPrefix W s 12 := by ring
      _ = 0 -
            complexDirichletCoeff s 3 *
              candidateCutoffAddressQuartetPrefix W s 12 := by rw [hzero]
      _ = -complexDirichletCoeff s 3 *
            candidateCutoffAddressQuartetPrefix W s 12 := by ring

/-- A complex number cannot satisfy `z + 1 = 0` if its norm is not `1`. -/
theorem complex_add_one_ne_zero_of_norm_ne_one
    {z : ℂ} (h : ‖z‖ ≠ 1) :
    z + 1 ≠ 0 := by
  intro hzero
  have hz : z = -1 := by
    calc
      z = z + 1 - 1 := by ring
      _ = 0 - 1 := by rw [hzero]
      _ = -1 := by ring
  apply h
  rw [hz, norm_neg, norm_one]

/-- A complex number cannot satisfy `z + 1 = 0` if its real part is not `-1`. -/
theorem complex_add_one_ne_zero_of_re_ne_neg_one
    {z : ℂ} (h : z.re ≠ -1) :
    z + 1 ≠ 0 := by
  intro hzero
  have hz : z = -1 := by
    calc
      z = z + 1 - 1 := by ring
      _ = 0 - 1 := by rw [hzero]
      _ = -1 := by ring
  apply h
  rw [hz]
  simp

/-- A complex number cannot satisfy `z + 1 = 0` if its imaginary part is nonzero. -/
theorem complex_add_one_ne_zero_of_im_ne_zero
    {z : ℂ} (h : z.im ≠ 0) :
    z + 1 ≠ 0 := by
  intro hzero
  have hz : z = -1 := by
    calc
      z = z + 1 - 1 := by ring
      _ = 0 - 1 := by rw [hzero]
      _ = -1 := by ring
  apply h
  rw [hz]
  simp

/-- Scalar collision ratio for the generic two-core candidate.  The collision
gap is this ratio shifted by `1`; collision can occur only at ratio `-1`. -/
noncomputable def candidateTwoCoreCutoffCollisionRatio
    (W : ℕ → ℂ) (s : ℂ) : ℂ :=
  candidateCutoffAddressQuartetPrefix W s 4 /
    (complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix W s 12)

/-- Scalar collision gap for the generic two-core candidate.  It is zero
exactly when the address-`4` quartet collides with the `3`-core address-`12`
quartet, provided the denominator is nonzero. -/
noncomputable def candidateTwoCoreCutoffCollisionGap
    (W : ℕ → ℂ) (s : ℂ) : ℂ :=
  candidateCutoffAddressQuartetPrefix W s 4 /
    (complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix W s 12) + 1

/-- The generic two-core collision gap is the collision ratio shifted by `1`. -/
theorem candidateTwoCoreCutoffCollisionGap_eq_ratio_add_one
    (W : ℕ → ℂ) (s : ℂ) :
    candidateTwoCoreCutoffCollisionGap W s =
      candidateTwoCoreCutoffCollisionRatio W s + 1 := rfl

/-- Norm separation of the collision ratio is sufficient for a nonzero
generic collision gap. -/
theorem candidateTwoCoreCutoffCollisionGap_ne_zero_of_ratio_norm_ne_one
    {W : ℕ → ℂ} {s : ℂ}
    (h : ‖candidateTwoCoreCutoffCollisionRatio W s‖ ≠ 1) :
    candidateTwoCoreCutoffCollisionGap W s ≠ 0 := by
  rw [candidateTwoCoreCutoffCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_norm_ne_one h

/-- Real-part separation of the collision ratio is sufficient for a nonzero
generic collision gap. -/
theorem candidateTwoCoreCutoffCollisionGap_ne_zero_of_ratio_re_ne_neg_one
    {W : ℕ → ℂ} {s : ℂ}
    (h : (candidateTwoCoreCutoffCollisionRatio W s).re ≠ -1) :
    candidateTwoCoreCutoffCollisionGap W s ≠ 0 := by
  rw [candidateTwoCoreCutoffCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_re_ne_neg_one h

/-- Imaginary-part separation of the collision ratio is sufficient for a
nonzero generic collision gap. -/
theorem candidateTwoCoreCutoffCollisionGap_ne_zero_of_ratio_im_ne_zero
    {W : ℕ → ℂ} {s : ℂ}
    (h : (candidateTwoCoreCutoffCollisionRatio W s).im ≠ 0) :
    candidateTwoCoreCutoffCollisionGap W s ≠ 0 := by
  rw [candidateTwoCoreCutoffCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_im_ne_zero h

/-- The two-core candidate prefix is nonzero exactly when the scalar collision
gap is nonzero.  This turns the remaining cross-core obstruction into a single
auditable complex scalar. -/
theorem candidateTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero
    (W : ℕ → ℂ) (s : ℂ)
    (hden :
      complexDirichletCoeff s 3 *
        candidateCutoffAddressQuartetPrefix W s 12 ≠ 0) :
    candidateTwoCoreCutoffPrefix W s ≠ 0 ↔
      candidateTwoCoreCutoffCollisionGap W s ≠ 0 := by
  let den :=
    complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix W s 12
  have hcoeff : complexDirichletCoeff s 3 ≠ 0 :=
    complexDirichletCoeff_ne_zero s 3
  have hprefix12 : candidateCutoffAddressQuartetPrefix W s 12 ≠ 0 := by
    intro hzero
    apply hden
    rw [hzero, mul_zero]
  have hfactor :
      den * candidateTwoCoreCutoffCollisionGap W s =
        candidateTwoCoreCutoffPrefix W s := by
    unfold den candidateTwoCoreCutoffCollisionGap
      candidateTwoCoreCutoffPrefix
    field_simp [hcoeff, hprefix12]
  constructor
  · intro hprefix hgapzero
    apply hprefix
    rw [← hfactor, hgapzero, mul_zero]
  · intro hgap hprefixzero
    apply hgap
    have hzero : den * candidateTwoCoreCutoffCollisionGap W s = 0 := by
      rw [hfactor, hprefixzero]
    exact (mul_eq_zero.mp hzero).resolve_left hden

/-- A nonzero collision gap rules out the generic two-core address collision. -/
theorem candidateTwoCoreCutoff_noAddressCollision_of_collisionGap_ne_zero
    {W : ℕ → ℂ} {s : ℂ}
    (hden :
      complexDirichletCoeff s 3 *
        candidateCutoffAddressQuartetPrefix W s 12 ≠ 0)
    (hgap : candidateTwoCoreCutoffCollisionGap W s ≠ 0) :
    ¬ candidateTwoCoreCutoffAddressCollision W s := by
  exact (candidateTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision W s).mp
    ((candidateTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero
      W s hden).mpr hgap)

/-!
## Super-Gaussian candidate cutoff

This is the finite genuine regularizer suggested by the numerical audit:

`W_p(n, X) = exp(-((n / X)^p))`.

The lemmas below do not prove two-core non-cancellation.  They prove that this
candidate has the structural properties needed by the four-floor C2 address
barrier: the weights are nonzero and larger addresses have relative norm at
most one for positive `X`.
-/

/-- Super-Gaussian cutoff family for candidate finite genuine regularization.
The case `p = 1` is the ordinary exponential cutoff; `p > 1` gives sharper
super-Gaussian cutoffs. -/
noncomputable def superGaussianCutoffWeight
    (p : ℕ) (X : ℝ) (n : ℕ) : ℂ :=
  (Real.exp (-(((n : ℝ) / X) ^ p)) : ℂ)

/-- Super-Gaussian cutoff weights never vanish. -/
theorem superGaussianCutoffWeight_ne_zero (p : ℕ) (X : ℝ) (n : ℕ) :
    superGaussianCutoffWeight p X n ≠ 0 := by
  unfold superGaussianCutoffWeight
  exact Complex.ofReal_ne_zero.mpr (ne_of_gt (Real.exp_pos _))

/-- Norm of a super-Gaussian cutoff weight. -/
theorem superGaussianCutoffWeight_norm (p : ℕ) (X : ℝ) (n : ℕ) :
    ‖superGaussianCutoffWeight p X n‖ =
      Real.exp (-(((n : ℝ) / X) ^ p)) := by
  unfold superGaussianCutoffWeight
  rw [Complex.norm_real, Real.norm_eq_abs]
  exact abs_of_pos (Real.exp_pos _)

/-- Positive cutoff scale makes super-Gaussian weights monotone along C2
addresses: larger addresses have no larger relative norm. -/
theorem superGaussianCutoffWeight_ratio_norm_le_one
    {p : ℕ} {X : ℝ} (hX : 0 < X) {n m : ℕ} (hnm : n ≤ m) :
    ‖superGaussianCutoffWeight p X m /
        superGaussianCutoffWeight p X n‖ ≤ 1 := by
  rw [Complex.norm_div, superGaussianCutoffWeight_norm,
    superGaussianCutoffWeight_norm]
  have hcast : (n : ℝ) ≤ (m : ℝ) := by exact_mod_cast hnm
  have hdiv : (n : ℝ) / X ≤ (m : ℝ) / X :=
    div_le_div_of_nonneg_right hcast (le_of_lt hX)
  have hnonneg : 0 ≤ (n : ℝ) / X := by positivity
  have hpow : ((n : ℝ) / X) ^ p ≤ ((m : ℝ) / X) ^ p :=
    pow_le_pow_left₀ hnonneg hdiv p
  have hexp :
      Real.exp (-(((m : ℝ) / X) ^ p)) ≤
        Real.exp (-(((n : ℝ) / X) ^ p)) :=
    Real.exp_le_exp.mpr (by linarith)
  exact div_le_one_of_le₀ hexp (le_of_lt (Real.exp_pos _))

/-- If the address-`12` versus address-`4` exponent gap is at most `log 2`,
the normalized cutoff base ratio is at least `1 / 2`. -/
theorem superGaussianCutoffWeight_ratio_norm_ge_half_of_gap_le_log_two
    {p : ℕ} {X : ℝ}
    (hgap : ((12 : ℝ) / X) ^ p - ((4 : ℝ) / X) ^ p ≤ Real.log 2) :
    (1 / 2 : ℝ) ≤
      ‖superGaussianCutoffWeight p X 12 /
          superGaussianCutoffWeight p X 4‖ := by
  let A : ℝ := ((12 : ℝ) / X) ^ p
  let B : ℝ := ((4 : ℝ) / X) ^ p
  have hgapAB : A - B ≤ Real.log 2 := by
    simpa [A, B] using hgap
  rw [Complex.norm_div, superGaussianCutoffWeight_norm,
    superGaussianCutoffWeight_norm]
  change (1 / 2 : ℝ) ≤ Real.exp (-A) / Real.exp (-B)
  have hratio_eq : Real.exp (-A) / Real.exp (-B) = Real.exp (-(A - B)) := by
    rw [← Real.exp_sub]
    congr 1
    ring
  rw [hratio_eq]
  have hhalf_eq : (1 / 2 : ℝ) = Real.exp (-(Real.log 2)) := by
    rw [Real.exp_neg, Real.exp_log (by norm_num : (0 : ℝ) < 2)]
    norm_num
  rw [hhalf_eq]
  exact Real.exp_le_exp.mpr (by linarith)

/-- Elementary numerical lower bound used to make the cutoff-ratio floor
automatic from the scalar core-scale margin. -/
theorem one_div_thirty_two_lt_log_two :
    (1 / 32 : ℝ) < Real.log 2 := by
  have h := Real.lt_log_one_add_of_pos (by norm_num : (0 : ℝ) < 1)
  norm_num at h
  nlinarith

/-- Elementary lower bound for the positive exponential margin. -/
theorem one_sub_exp_neg_lower_bound_fraction
    {x : ℝ} (hx : 0 ≤ x) :
    x / (1 + x) ≤ 1 - Real.exp (-x) := by
  have hden_pos : 0 < 1 + x := by linarith
  have hle_exp : 1 + x ≤ Real.exp x := by
    simpa [add_comm] using Real.add_one_le_exp x
  have hexp_neg_le : Real.exp (-x) ≤ 1 / (1 + x) := by
    rw [Real.exp_neg]
    simpa [one_div] using one_div_le_one_div_of_le hden_pos hle_exp
  have hfrac : x / (1 + x) = 1 - 1 / (1 + x) := by
    field_simp [hden_pos.ne']
    ring
  rw [hfrac]
  linarith

/-- Pointwise lower bound for the two-core odd margin in terms of
`Re(s) * log 3`. -/
theorem complexDirichletCoeff_three_core_margin_lower_bound_pointwise
    {s : ℂ} (hs : 0 ≤ s.re) :
    (s.re * Real.log (3 : ℝ)) /
        (1 + s.re * Real.log (3 : ℝ)) ≤
      1 - ‖complexDirichletCoeff s 3‖ := by
  rw [complexDirichletCoeff_three_norm_eq]
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hx : 0 ≤ s.re * Real.log (3 : ℝ) :=
    mul_nonneg hs (le_of_lt hlog3)
  exact one_sub_exp_neg_lower_bound_fraction hx

/-- The scale term decreases as the cutoff scale `X` increases. -/
theorem superGaussianScaleTerm_le_of_cutoff_ge
    {p : ℕ} {X X0 : ℝ} (hX0 : 0 < X0) (hX : X0 ≤ X) :
    ((96 : ℝ) / X) ^ p ≤ ((96 : ℝ) / X0) ^ p := by
  have hXpos : 0 < X := lt_of_lt_of_le hX0 hX
  have hdiv : (96 : ℝ) / X ≤ (96 : ℝ) / X0 := by
    exact div_le_div_of_nonneg_left (by norm_num) hX0 hX
  have hnonneg : 0 ≤ (96 : ℝ) / X := by positivity
  exact pow_le_pow_left₀ hnonneg hdiv p

/-- Named reciprocal-scale barrier for the unit-strip `p = 2` route. -/
noncomputable def superGaussianTwoCoreUnitStripScaleBarrier : ℝ :=
  32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)

/-- Elementary lower bound for the odd-core logarithm used by the concrete
unit-strip scale profile. -/
theorem one_lt_log_three : (1 : ℝ) < Real.log (3 : ℝ) := by
  have hExp : Real.exp (1 : ℝ) < (3 : ℝ) := by
    exact lt_trans Real.exp_one_lt_d9 (by norm_num)
  exact (Real.lt_log_iff_exp_lt (by norm_num : (0 : ℝ) < 3)).mpr hExp

/-- The unit-strip reciprocal-scale barrier is below `768^2`. -/
theorem superGaussianTwoCoreUnitStripScaleBarrier_lt_768_sq :
    superGaussianTwoCoreUnitStripScaleBarrier < (768 : ℝ) ^ 2 := by
  have hlog3 : (1 : ℝ) < Real.log (3 : ℝ) := one_lt_log_three
  have hlog3_pos : 0 < Real.log (3 : ℝ) := by linarith
  have hratio :
      (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ) < (2 : ℝ) := by
    field_simp [hlog3_pos.ne']
    linarith
  unfold superGaussianTwoCoreUnitStripScaleBarrier
  calc
    32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)
        = 32 * (96 : ℝ) ^ 2 *
            ((1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)) := by ring
    _ < 32 * (96 : ℝ) ^ 2 * 2 := by
      exact mul_lt_mul_of_pos_left hratio (by positivity)
    _ = (768 : ℝ) ^ 2 := by norm_num

/-- Super-Gaussian address quartet as an instance of the candidate interface. -/
noncomputable def superGaussianAddressQuartetPrefix
    (p : ℕ) (X : ℝ) (s : ℂ) (n : ℕ) : ℂ :=
  candidateCutoffAddressQuartetPrefix
    (superGaussianCutoffWeight p X) s n

/-- Quantitative lower bound for a super-Gaussian address quartet prefix. -/
theorem superGaussianAddressQuartetPrefix_norm_lower_bound
    {p : ℕ} {X : ℝ} {s : ℂ} {n : ℕ} (hX : 0 < X) :
    ‖superGaussianCutoffWeight p X n / superGaussianCutoffWeight p X 4‖ *
        (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3)) ≤
      ‖superGaussianAddressQuartetPrefix p X s n‖ := by
  unfold superGaussianAddressQuartetPrefix
  exact candidateCutoffAddressQuartetPrefix_norm_lower_bound_of_ratio_bounds
    (superGaussianCutoffWeight_ne_zero p X 4)
    (superGaussianCutoffWeight_ne_zero p X n)
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))

/-- Normalized floor-difference for the address quartet cutoff weights. -/
noncomputable def superGaussianAddressFloorDiff
    (p : ℕ) (X : ℝ) (a b : ℕ) : ℝ :=
  ‖superGaussianCutoffWeight p X a / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X b / superGaussianCutoffWeight p X 4‖

/-- The maximum of the four floor-differences used by the two-core
address-`4` versus address-`12` obstruction. -/
noncomputable def superGaussianAddressFloorMax
    (p : ℕ) (X : ℝ) : ℝ :=
  max (superGaussianAddressFloorDiff p X 4 12)
    (max (superGaussianAddressFloorDiff p X 8 24)
      (max (superGaussianAddressFloorDiff p X 16 48)
        (superGaussianAddressFloorDiff p X 32 96)))

/-- Algebraic exponent gap associated to a normalized super-Gaussian floor
difference. -/
noncomputable def superGaussianAddressPowerGap
    (p : ℕ) (X : ℝ) (a b : ℕ) : ℝ :=
  ((b : ℝ) / X) ^ p - ((a : ℝ) / X) ^ p

/-- The maximum of the four algebraic exponent gaps controlling the two-core
floor differences. -/
noncomputable def superGaussianAddressPowerGapMax
    (p : ℕ) (X : ℝ) : ℝ :=
  max (superGaussianAddressPowerGap p X 4 12)
    (max (superGaussianAddressPowerGap p X 8 24)
      (max (superGaussianAddressPowerGap p X 16 48)
        (superGaussianAddressPowerGap p X 32 96)))

/-- The four two-core floor-differences are bounded by their recorded maximum. -/
theorem superGaussianAddressFloorDiff_le_floorMax
    (p : ℕ) (X : ℝ) :
    superGaussianAddressFloorDiff p X 4 12 ≤
        superGaussianAddressFloorMax p X ∧
      superGaussianAddressFloorDiff p X 8 24 ≤
        superGaussianAddressFloorMax p X ∧
      superGaussianAddressFloorDiff p X 16 48 ≤
        superGaussianAddressFloorMax p X ∧
      superGaussianAddressFloorDiff p X 32 96 ≤
        superGaussianAddressFloorMax p X := by
  dsimp [superGaussianAddressFloorMax]
  constructor
  · exact le_max_left _ _
  constructor
  · exact le_trans (le_max_left _ _) (le_max_right _ _)
  constructor
  · exact le_trans (le_trans (le_max_left _ _) (le_max_right _ _))
      (le_max_right _ _)
  · exact le_trans (le_trans (le_max_right _ _) (le_max_right _ _))
      (le_max_right _ _)

/-- The recorded floor maximum is nonnegative. -/
theorem superGaussianAddressFloorMax_nonneg
    (p : ℕ) (X : ℝ) :
    0 ≤ superGaussianAddressFloorMax p X := by
  exact le_trans (norm_nonneg
    (superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4))
    (by
      simpa [superGaussianAddressFloorDiff] using
        (superGaussianAddressFloorDiff_le_floorMax p X).1)

/-- A real exponential difference is bounded by the difference of ordered
nonnegative exponents. -/
theorem real_exp_neg_sub_exp_neg_le_sub
    {u v : ℝ} (hu : 0 ≤ u) (huv : u ≤ v) :
    Real.exp (-u) - Real.exp (-v) ≤ v - u := by
  let x : ℝ := v - u
  have hx : 0 ≤ x := by dsimp [x]; linarith
  have h_exp_neg_u_le_one : Real.exp (-u) ≤ 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_le_exp.mpr (by linarith)
  have h_exp_neg_x_le_one : Real.exp (-x) ≤ 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_le_exp.mpr (by linarith)
  have hone_sub_nonneg : 0 ≤ 1 - Real.exp (-x) := by linarith
  have hone_sub_le : 1 - Real.exp (-x) ≤ x := by
    have h := Real.one_sub_le_exp_neg x
    linarith
  calc
    Real.exp (-u) - Real.exp (-v)
        = Real.exp (-u) * (1 - Real.exp (-x)) := by
          dsimp [x]
          rw [show -v = -u + -(v - u) by ring, Real.exp_add]
          ring
    _ ≤ 1 * (1 - Real.exp (-x)) := by
          exact mul_le_mul_of_nonneg_right h_exp_neg_u_le_one hone_sub_nonneg
    _ ≤ x := by linarith
    _ = v - u := by dsimp [x]

/-- Each normalized super-Gaussian floor difference is bounded by its algebraic
exponent gap. -/
theorem superGaussianAddressFloorDiff_le_powerGap
    {p : ℕ} {X : ℝ} {a b : ℕ}
    (hX : 0 < X) (ha : 4 ≤ a) (hab : a ≤ b) :
    superGaussianAddressFloorDiff p X a b ≤
      superGaussianAddressPowerGap p X a b := by
  let A : ℝ := ((a : ℝ) / X) ^ p
  let B : ℝ := ((b : ℝ) / X) ^ p
  let C : ℝ := ((4 : ℝ) / X) ^ p
  have h4a : (4 : ℝ) ≤ (a : ℝ) := by exact_mod_cast ha
  have habr : (a : ℝ) ≤ (b : ℝ) := by exact_mod_cast hab
  have h4div : (4 : ℝ) / X ≤ (a : ℝ) / X :=
    div_le_div_of_nonneg_right h4a (le_of_lt hX)
  have habdiv : (a : ℝ) / X ≤ (b : ℝ) / X :=
    div_le_div_of_nonneg_right habr (le_of_lt hX)
  have h4nonneg : 0 ≤ (4 : ℝ) / X := by positivity
  have hanonneg : 0 ≤ (a : ℝ) / X := by positivity
  have hC_le_A : C ≤ A := by
    dsimp [C, A]
    exact pow_le_pow_left₀ h4nonneg h4div p
  have hA_le_B : A ≤ B := by
    dsimp [A, B]
    exact pow_le_pow_left₀ hanonneg habdiv p
  have hAminusC_nonneg : 0 ≤ A - C := by linarith
  have hAminusC_le_BminusC : A - C ≤ B - C := by linarith
  have hreal_nonneg :
      0 ≤ Real.exp (-(A - C)) - Real.exp (-(B - C)) := by
    have hexp : Real.exp (-(B - C)) ≤ Real.exp (-(A - C)) :=
      Real.exp_le_exp.mpr (by linarith)
    linarith
  have hreal_le :
      Real.exp (-(A - C)) - Real.exp (-(B - C)) ≤ B - A := by
    have h := real_exp_neg_sub_exp_neg_le_sub
      hAminusC_nonneg hAminusC_le_BminusC
    nlinarith
  have hratioA : Real.exp (-A) / Real.exp (-C) = Real.exp (-(A - C)) := by
    rw [← Real.exp_sub]
    congr 1
    ring
  have hratioB : Real.exp (-B) / Real.exp (-C) = Real.exp (-(B - C)) := by
    rw [← Real.exp_sub]
    congr 1
    ring
  have hnorm_eq :
      ‖(Real.exp (-A) : ℂ) / (Real.exp (-C) : ℂ) -
          (Real.exp (-B) : ℂ) / (Real.exp (-C) : ℂ)‖ =
        Real.exp (-(A - C)) - Real.exp (-(B - C)) := by
    rw [← Complex.ofReal_div, ← Complex.ofReal_div, ← Complex.ofReal_sub]
    rw [Complex.norm_real, Real.norm_eq_abs]
    rw [hratioA, hratioB, abs_of_nonneg hreal_nonneg]
  unfold superGaussianAddressFloorDiff superGaussianCutoffWeight
  change ‖(Real.exp (-A) : ℂ) / (Real.exp (-C) : ℂ) -
          (Real.exp (-B) : ℂ) / (Real.exp (-C) : ℂ)‖ ≤ B - A
  rw [hnorm_eq]
  exact hreal_le

/-- The recorded floor maximum is bounded by the maximum of the four algebraic
exponent gaps on positive cutoff scale. -/
theorem superGaussianAddressFloorMax_le_powerGapMax
    {p : ℕ} {X : ℝ} (hX : 0 < X) :
    superGaussianAddressFloorMax p X ≤
      superGaussianAddressPowerGapMax p X := by
  have h0 :
      superGaussianAddressFloorDiff p X 4 12 ≤
        superGaussianAddressPowerGap p X 4 12 :=
    superGaussianAddressFloorDiff_le_powerGap hX (by norm_num) (by norm_num)
  have h1 :
      superGaussianAddressFloorDiff p X 8 24 ≤
        superGaussianAddressPowerGap p X 8 24 :=
    superGaussianAddressFloorDiff_le_powerGap hX (by norm_num) (by norm_num)
  have h2 :
      superGaussianAddressFloorDiff p X 16 48 ≤
        superGaussianAddressPowerGap p X 16 48 :=
    superGaussianAddressFloorDiff_le_powerGap hX (by norm_num) (by norm_num)
  have h3 :
      superGaussianAddressFloorDiff p X 32 96 ≤
        superGaussianAddressPowerGap p X 32 96 :=
    superGaussianAddressFloorDiff_le_powerGap hX (by norm_num) (by norm_num)
  dsimp [superGaussianAddressFloorMax, superGaussianAddressPowerGapMax]
  exact max_le
    (le_trans h0 (le_max_left _ _))
    (max_le
      (le_trans h1
        (le_trans (le_max_left _ _) (le_max_right _ _)))
      (max_le
        (le_trans h2
          (le_trans
            (le_max_left
              (superGaussianAddressPowerGap p X 16 48)
              (superGaussianAddressPowerGap p X 32 96))
            (le_trans
              (le_max_right
                (superGaussianAddressPowerGap p X 8 24)
                (max (superGaussianAddressPowerGap p X 16 48)
                  (superGaussianAddressPowerGap p X 32 96)))
              (le_max_right _ _))))
        (le_trans h3
          (le_trans
            (le_max_right
              (superGaussianAddressPowerGap p X 16 48)
              (superGaussianAddressPowerGap p X 32 96))
            (le_trans
              (le_max_right
                (superGaussianAddressPowerGap p X 8 24)
                (max (superGaussianAddressPowerGap p X 16 48)
                  (superGaussianAddressPowerGap p X 32 96)))
              (le_max_right _ _))))))

/-- Each algebraic exponent gap is bounded by the largest address scale
appearing in the two-core quartet comparison. -/
theorem superGaussianAddressPowerGap_le_topScale
    {p : ℕ} {X : ℝ} {a b : ℕ}
    (hX : 0 < X) (hb : b ≤ 96) :
    superGaussianAddressPowerGap p X a b ≤ ((96 : ℝ) / X) ^ p := by
  have hb96 : (b : ℝ) ≤ (96 : ℝ) := by exact_mod_cast hb
  have hdiv : (b : ℝ) / X ≤ (96 : ℝ) / X :=
    div_le_div_of_nonneg_right hb96 (le_of_lt hX)
  have hbnonneg : 0 ≤ (b : ℝ) / X := by positivity
  have hanonneg : 0 ≤ ((a : ℝ) / X) ^ p := by positivity
  have hpow : ((b : ℝ) / X) ^ p ≤ ((96 : ℝ) / X) ^ p :=
    pow_le_pow_left₀ hbnonneg hdiv p
  dsimp [superGaussianAddressPowerGap]
  linarith

/-- The four-gap maximum is bounded by the single scale term `(96 / X)^p`. -/
theorem superGaussianAddressPowerGapMax_le_topScale
    {p : ℕ} {X : ℝ} (hX : 0 < X) :
    superGaussianAddressPowerGapMax p X ≤ ((96 : ℝ) / X) ^ p := by
  dsimp [superGaussianAddressPowerGapMax]
  exact max_le
    (superGaussianAddressPowerGap_le_topScale hX (by norm_num))
    (max_le
      (superGaussianAddressPowerGap_le_topScale hX (by norm_num))
      (max_le
        (superGaussianAddressPowerGap_le_topScale hX (by norm_num))
        (superGaussianAddressPowerGap_le_topScale hX (by norm_num))))

/-- Explicit four-floor upper for the address-`4` versus address-`12`
super-Gaussian quartet difference. -/
noncomputable def superGaussianAddressClosenessUpper
    (p : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ‖superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4‖ +
    ‖q s‖ *
      ‖superGaussianCutoffWeight p X 8 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 24 / superGaussianCutoffWeight p X 4‖ +
    ‖q s‖ ^ 2 *
      ‖superGaussianCutoffWeight p X 16 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 48 / superGaussianCutoffWeight p X 4‖ +
    ‖q s‖ ^ 3 *
      ‖superGaussianCutoffWeight p X 32 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 96 / superGaussianCutoffWeight p X 4‖

/-- The address quartet difference is controlled by the explicit four-floor
weight-difference upper. -/
theorem superGaussianAddressQuartetPrefix_sub_norm_le_closenessUpper
    (p : ℕ) (X : ℝ) (s : ℂ) :
    ‖superGaussianAddressQuartetPrefix p X s 4 -
        superGaussianAddressQuartetPrefix p X s 12‖ ≤
      superGaussianAddressClosenessUpper p X s := by
  let d0 :=
    superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4
  let d1 :=
    superGaussianCutoffWeight p X 8 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 24 / superGaussianCutoffWeight p X 4
  let d2 :=
    superGaussianCutoffWeight p X 16 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 48 / superGaussianCutoffWeight p X 4
  let d3 :=
    superGaussianCutoffWeight p X 32 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 96 / superGaussianCutoffWeight p X 4
  have hrewrite :
      superGaussianAddressQuartetPrefix p X s 4 -
          superGaussianAddressQuartetPrefix p X s 12 =
        d0 + q s * d1 + q s ^ 2 * d2 + q s ^ 3 * d3 := by
    dsimp [d0, d1, d2, d3, superGaussianAddressQuartetPrefix,
      candidateCutoffAddressQuartetPrefix]
    ring
  rw [hrewrite]
  have htri1 :
      ‖d0 + q s * d1 + q s ^ 2 * d2 + q s ^ 3 * d3‖ ≤
        ‖d0 + q s * d1 + q s ^ 2 * d2‖ + ‖q s ^ 3 * d3‖ := by
    convert norm_add_le
      (d0 + q s * d1 + q s ^ 2 * d2) (q s ^ 3 * d3) using 1
  have htri2 :
      ‖d0 + q s * d1 + q s ^ 2 * d2‖ ≤
        ‖d0 + q s * d1‖ + ‖q s ^ 2 * d2‖ := by
    convert norm_add_le (d0 + q s * d1) (q s ^ 2 * d2) using 1
  have htri3 : ‖d0 + q s * d1‖ ≤ ‖d0‖ + ‖q s * d1‖ :=
    norm_add_le d0 (q s * d1)
  have htri :
      ‖d0 + q s * d1 + q s ^ 2 * d2 + q s ^ 3 * d3‖ ≤
        ‖d0‖ + ‖q s * d1‖ + ‖q s ^ 2 * d2‖ + ‖q s ^ 3 * d3‖ := by
    nlinarith
  calc
    ‖d0 + q s * d1 + q s ^ 2 * d2 + q s ^ 3 * d3‖
        ≤ ‖d0‖ + ‖q s * d1‖ + ‖q s ^ 2 * d2‖ + ‖q s ^ 3 * d3‖ := htri
    _ = superGaussianAddressClosenessUpper p X s := by
      dsimp [superGaussianAddressClosenessUpper, d0, d1, d2, d3]
      rw [norm_mul, norm_mul, norm_mul, norm_pow, norm_pow]

/-- If each of the four cutoff floor differences is at most `δ`, then the
explicit address-closeness upper is below `2δ` in the right half-plane. -/
theorem superGaussianAddressClosenessUpper_lt_two_mul_of_floor_bounds
    {p : ℕ} {X : ℝ} {s : ℂ} {δ : ℝ} (hs : 0 < s.re) (hδ : 0 < δ)
    (h0 :
      ‖superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4‖ ≤ δ)
    (h1 :
      ‖superGaussianCutoffWeight p X 8 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 24 / superGaussianCutoffWeight p X 4‖ ≤ δ)
    (h2 :
      ‖superGaussianCutoffWeight p X 16 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 48 / superGaussianCutoffWeight p X 4‖ ≤ δ)
    (h3 :
      ‖superGaussianCutoffWeight p X 32 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 96 / superGaussianCutoffWeight p X 4‖ ≤ δ) :
    superGaussianAddressClosenessUpper p X s < 2 * δ := by
  let r : ℝ := ‖q s‖
  have htail : r + r ^ 2 + r ^ 3 < 1 := by
    dsimp [r]
    exact cubic_tail_norm_bound_of_norm_lt_half
      (q_norm_lt_half_of_re_pos hs)
  have hupper_le :
      superGaussianAddressClosenessUpper p X s ≤
        δ + r * δ + r ^ 2 * δ + r ^ 3 * δ := by
    dsimp [superGaussianAddressClosenessUpper, r]
    gcongr
  have hδ_nonneg : 0 ≤ δ := le_of_lt hδ
  nlinarith

/-- The explicit four-floor closeness upper is controlled by the single
recorded floor maximum. -/
theorem superGaussianAddressClosenessUpper_le_floorMax
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianAddressClosenessUpper p X s ≤
      (1 + ‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3) *
        superGaussianAddressFloorMax p X := by
  let D := superGaussianAddressFloorMax p X
  rcases superGaussianAddressFloorDiff_le_floorMax p X with
    ⟨h0, h1, h2, h3⟩
  have h0' :
      ‖superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4‖ ≤
        D := by
    simpa [D, superGaussianAddressFloorDiff] using h0
  have h1' :
      ‖superGaussianCutoffWeight p X 8 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 24 / superGaussianCutoffWeight p X 4‖ ≤
        D := by
    simpa [D, superGaussianAddressFloorDiff] using h1
  have h2' :
      ‖superGaussianCutoffWeight p X 16 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 48 / superGaussianCutoffWeight p X 4‖ ≤
        D := by
    simpa [D, superGaussianAddressFloorDiff] using h2
  have h3' :
      ‖superGaussianCutoffWeight p X 32 / superGaussianCutoffWeight p X 4 -
        superGaussianCutoffWeight p X 96 / superGaussianCutoffWeight p X 4‖ ≤
        D := by
    simpa [D, superGaussianAddressFloorDiff] using h3
  calc
    superGaussianAddressClosenessUpper p X s
        ≤ D + ‖q s‖ * D + ‖q s‖ ^ 2 * D + ‖q s‖ ^ 3 * D := by
          dsimp [superGaussianAddressClosenessUpper]
          gcongr
    _ = (1 + ‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3) *
          superGaussianAddressFloorMax p X := by
          dsimp [D]
          ring

/-- If twice the recorded floor maximum is below the core margin, then the
explicit address-closeness upper is below that margin in the right half-plane. -/
theorem superGaussianAddressClosenessUpper_lt_margin_of_floorMax
    {p : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re)
    (hmargin :
      2 * superGaussianAddressFloorMax p X <
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖) :
    superGaussianAddressClosenessUpper p X s <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖ := by
  let D := superGaussianAddressFloorMax p X
  let r : ℝ := ‖q s‖
  have htail : r + r ^ 2 + r ^ 3 < 1 := by
    dsimp [r]
    exact cubic_tail_norm_bound_of_norm_lt_half
      (q_norm_lt_half_of_re_pos hs)
  have hcoeff : 1 + r + r ^ 2 + r ^ 3 ≤ 2 := by
    nlinarith
  have hD_nonneg : 0 ≤ D := by
    dsimp [D]
    exact superGaussianAddressFloorMax_nonneg p X
  have hupper :
      superGaussianAddressClosenessUpper p X s ≤
        (1 + r + r ^ 2 + r ^ 3) * D := by
    simpa [D, r] using superGaussianAddressClosenessUpper_le_floorMax p X s
  have hprod : (1 + r + r ^ 2 + r ^ 3) * D ≤ 2 * D :=
    mul_le_mul_of_nonneg_right hcoeff hD_nonneg
  exact lt_of_le_of_lt (le_trans hupper hprod) hmargin

/-- Reverse-triangle lower bound for a two-channel sum.  If `a` is close to
`b`, then `a + c * b` keeps at least the core margin
`(1 - ‖c‖) * ‖b‖`, up to the closeness error. -/
theorem norm_add_mul_lower_bound_of_sub_norm_le
    {a b c : ℂ} {E : ℝ} (hE : ‖a - b‖ ≤ E) :
    (1 - ‖c‖) * ‖b‖ - E ≤ ‖a + c * b‖ := by
  have hunit :
      (1 : ℝ) - ‖c‖ ≤ ‖(1 : ℂ) + c‖ := by
    have htri :
        ‖(1 : ℂ)‖ ≤ ‖(1 : ℂ) + c‖ + ‖c‖ := by
      calc
        ‖(1 : ℂ)‖ = ‖((1 : ℂ) + c) - c‖ := by ring_nf
        _ ≤ ‖(1 : ℂ) + c‖ + ‖c‖ := norm_sub_le _ _
    norm_num at htri
    linarith
  have hb_nonneg : 0 ≤ ‖b‖ := norm_nonneg _
  have hcore :
      (1 - ‖c‖) * ‖b‖ ≤ ‖(1 : ℂ) + c‖ * ‖b‖ :=
    mul_le_mul_of_nonneg_right hunit hb_nonneg
  have hrewrite :
      ((1 : ℂ) + c) * b = (a + c * b) + (b - a) := by
    ring
  have htri :
      ‖((1 : ℂ) + c) * b‖ ≤ ‖a + c * b‖ + ‖b - a‖ := by
    rw [hrewrite]
    exact norm_add_le _ _
  have hmain :
      (1 - ‖c‖) * ‖b‖ ≤ ‖a + c * b‖ + ‖a - b‖ := by
    calc
      (1 - ‖c‖) * ‖b‖
          ≤ ‖(1 : ℂ) + c‖ * ‖b‖ := hcore
      _ = ‖((1 : ℂ) + c) * b‖ := by rw [norm_mul]
      _ ≤ ‖a + c * b‖ + ‖b - a‖ := htri
      _ = ‖a + c * b‖ + ‖a - b‖ := by
        rw [show b - a = -(a - b) by ring, norm_neg]
  have hmain_E :
      (1 - ‖c‖) * ‖b‖ ≤ ‖a + c * b‖ + E :=
    le_trans hmain (by linarith)
  linarith

/-- Super-Gaussian two-core prefix as an instance of the candidate interface. -/
noncomputable def superGaussianTwoCoreCutoffPrefix
    (p : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  candidateTwoCoreCutoffPrefix (superGaussianCutoffWeight p X) s

/-- Explicit lower envelope for the normalized super-Gaussian two-core prefix.
It is the core address-`12` margin minus the address-closeness error. -/
noncomputable def superGaussianTwoCoreCutoffPrefixNormLower
    (p : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  (1 - ‖complexDirichletCoeff s 3‖) *
      ‖superGaussianAddressQuartetPrefix p X s 12‖ -
    superGaussianAddressClosenessUpper p X s

/-- Super-Gaussian two-core finite genuine block after restoring the nonzero
geometric scalar removed by the normalized prefix. -/
noncomputable def superGaussianTwoCoreGenuineBlock
    (p : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  ((2 : ℂ) * q s ^ 2 * superGaussianCutoffWeight p X 4) *
    superGaussianTwoCoreCutoffPrefix p X s

/-- Explicit lower envelope for the restored finite two-core genuine block. -/
noncomputable def superGaussianTwoCoreGenuineBlockNormLower
    (p : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ‖(2 : ℂ) * q s ^ 2 * superGaussianCutoffWeight p X 4‖ *
    superGaussianTwoCoreCutoffPrefixNormLower p X s

/-- Region-compatible profile form of the restored two-core block lower
envelope. -/
noncomputable def superGaussianTwoCoreGenuineBlockNormLowerProfile
    (p : ℕ) : ℂ → ℝ → ℝ :=
  fun s X => superGaussianTwoCoreGenuineBlockNormLower p X s

/-- A genuine-first middle extension decomposed into the certified two-core
block plus a remainder/tail term.  Future middle models should instantiate the
remainder with the actual geometric tail, not with transfer data. -/
noncomputable def superGaussianTwoCoreGenuineExtension
    (p : ℕ) (remainder : ℂ → ℝ → ℂ) (X : ℝ) (s : ℂ) : ℂ :=
  superGaussianTwoCoreGenuineBlock p X s + remainder s X

/-- A single super-Gaussian regularized central C2 address term.  This is the
finite genuine geometry before any transfer identity: depth `k`, odd core `m`,
vertical ratio `q(s)^k`, odd coefficient `m^{-s}`, and cutoff at `2^k m`. -/
noncomputable def superGaussianGenuineAddressTerm
    (p : ℕ) (X : ℝ) (s : ℂ) (k m : ℕ) : ℂ :=
  (2 : ℂ) * q s ^ k * complexDirichletCoeff s m *
    superGaussianCutoffWeight p X (2 ^ k * m)

/-- Address-set form of a finite C2 rectangle. -/
def superGaussianFiniteGenuineAddressSet (K M : ℕ) : Finset C2Address :=
  Finset.Icc 2 K ×ˢ oddCoresUpTo M

/-- Address-pair spelling of a single super-Gaussian genuine term. -/
noncomputable def superGaussianGenuineAddressTermAt
    (p : ℕ) (X : ℝ) (s : ℂ) (a : C2Address) : ℂ :=
  superGaussianGenuineAddressTerm p X s a.1 a.2

/-- Address-pair spelling of the raw finite genuine term, before cutoff. -/
noncomputable def genuineAddressTermAt (s : ℂ) (a : C2Address) : ℂ :=
  (2 : ℂ) * q s ^ a.1 * complexDirichletCoeff s a.2

/-- One address contribution to the cutoff residual between the super-Gaussian
finite rectangle and the raw finite genuine rectangle. -/
noncomputable def superGaussianFiniteGenuineCutoffResidualAddressTerm
    (p : ℕ) (X : ℝ) (s : ℂ) (a : C2Address) : ℂ :=
  genuineAddressTermAt s a *
    (superGaussianCutoffWeight p X (2 ^ a.1 * a.2) - 1)

/-- Explicit real upper bound for the cutoff residual against the raw finite
genuine rectangle of the same `K,M`. -/
noncomputable def superGaussianFiniteGenuineCutoffResidualNormUpper
    (p K M : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑ a ∈ superGaussianFiniteGenuineAddressSet K M,
    ‖superGaussianFiniteGenuineCutoffResidualAddressTerm p X s a‖

/-- Fully algebraic finite upper bound for the cutoff residual against the raw
finite genuine rectangle.  It replaces `‖exp(-u) - 1‖` by `u`. -/
noncomputable def superGaussianFiniteGenuineCutoffResidualAlgebraicUpper
    (p K M : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑ a ∈ superGaussianFiniteGenuineAddressSet K M,
    2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
      (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ p

/-- Exact norm of one raw finite genuine address term. -/
theorem genuineAddressTermAt_norm_eq (s : ℂ) (a : C2Address) :
    ‖genuineAddressTermAt s a‖ =
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ := by
  unfold genuineAddressTermAt
  rw [norm_mul, norm_mul, norm_pow]
  norm_num

/-- A super-Gaussian cutoff weight differs from `1` by at most its algebraic
exponent when the cutoff scale is positive. -/
theorem superGaussianCutoffWeight_sub_one_norm_le_power
    {p n : ℕ} {X : ℝ} (hX : 0 < X) :
    ‖superGaussianCutoffWeight p X n - 1‖ ≤
      (((n : ℝ) / X) ^ p) := by
  let u : ℝ := ((n : ℝ) / X) ^ p
  have hbase_nonneg : 0 ≤ (n : ℝ) / X := by positivity
  have hu : 0 ≤ u := by
    dsimp [u]
    exact pow_nonneg hbase_nonneg p
  have hexp_le_one : Real.exp (-u) ≤ 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_le_exp.mpr (by linarith)
  have hnorm :
      ‖superGaussianCutoffWeight p X n - 1‖ =
        1 - Real.exp (-u) := by
    unfold superGaussianCutoffWeight
    dsimp [u]
    rw [← Complex.ofReal_one, ← Complex.ofReal_sub]
    rw [Complex.norm_real, Real.norm_eq_abs]
    rw [abs_of_nonpos (by linarith : Real.exp (-u) - 1 ≤ 0)]
    ring
  rw [hnorm]
  have h := Real.one_sub_le_exp_neg u
  linarith

/-- One residual address term is bounded by the algebraic cutoff exponent. -/
theorem superGaussianFiniteGenuineCutoffResidualAddressTerm_norm_le_algebraic
    {p : ℕ} {X : ℝ} (hX : 0 < X) (s : ℂ) (a : C2Address) :
    ‖superGaussianFiniteGenuineCutoffResidualAddressTerm p X s a‖ ≤
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
        (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ p := by
  unfold superGaussianFiniteGenuineCutoffResidualAddressTerm
  rw [norm_mul, genuineAddressTermAt_norm_eq]
  exact mul_le_mul_of_nonneg_left
    (superGaussianCutoffWeight_sub_one_norm_le_power
      (p := p) (n := 2 ^ a.1 * a.2) hX)
    (by positivity)

/-- The explicit residual norm upper is itself bounded by the algebraic finite
sum. -/
theorem superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper
    {p K M : ℕ} {X : ℝ} (hX : 0 < X) (s : ℂ) :
    superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s ≤
      superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K M X s := by
  unfold superGaussianFiniteGenuineCutoffResidualNormUpper
    superGaussianFiniteGenuineCutoffResidualAlgebraicUpper
  exact Finset.sum_le_sum (fun a _ha =>
    superGaussianFiniteGenuineCutoffResidualAddressTerm_norm_le_algebraic
      hX s a)

/-- Exact norm of one finite genuine address term. -/
theorem superGaussianGenuineAddressTerm_norm_eq
    (p : ℕ) (X : ℝ) (s : ℂ) (k m : ℕ) :
    ‖superGaussianGenuineAddressTerm p X s k m‖ =
      2 * ‖q s‖ ^ k * ‖complexDirichletCoeff s m‖ *
        ‖superGaussianCutoffWeight p X (2 ^ k * m)‖ := by
  unfold superGaussianGenuineAddressTerm
  rw [norm_mul, norm_mul, norm_mul, norm_pow]
  norm_num

/-- Explicit real norm of one finite genuine address term. -/
noncomputable def superGaussianGenuineAddressTermNorm
    (p : ℕ) (X : ℝ) (s : ℂ) (a : C2Address) : ℝ :=
  2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
    ‖superGaussianCutoffWeight p X (2 ^ a.1 * a.2)‖

/-- Finite super-Gaussian genuine central rectangle over C2 depths and odd
cores.  This is the finite middle model whose tails/remainders are to be
compared with the certified two-core block. -/
noncomputable def superGaussianFiniteGenuineRectangle
    (p : ℕ) (X : ℝ) (s : ℂ) (K M : ℕ) : ℂ :=
  ∑ k ∈ Finset.Icc 2 K, ∑ m ∈ oddCoresUpTo M,
    superGaussianGenuineAddressTerm p X s k m

/-- The finite rectangle can equivalently be summed over address pairs. -/
theorem superGaussianFiniteGenuineRectangle_eq_addressSet_sum
    (p : ℕ) (X : ℝ) (s : ℂ) (K M : ℕ) :
    superGaussianFiniteGenuineRectangle p X s K M =
      ∑ a ∈ superGaussianFiniteGenuineAddressSet K M,
        superGaussianGenuineAddressTermAt p X s a := by
  unfold superGaussianFiniteGenuineRectangle
    superGaussianFiniteGenuineAddressSet
    superGaussianGenuineAddressTermAt
  rw [Finset.sum_product]

/-- The raw finite genuine rectangle can also be summed over C2 address pairs. -/
theorem rectangularGenuine_eq_addressSet_sum
    (s : ℂ) (K M : ℕ) :
    rectangularGenuine s K M =
      ∑ a ∈ superGaussianFiniteGenuineAddressSet K M,
        genuineAddressTermAt s a := by
  rw [rectangularGenuine_eq_depth_core]
  unfold rectangularDepthFactor rectangularOddCoreSum
    superGaussianFiniteGenuineAddressSet genuineAddressTermAt
  rw [Finset.sum_product]
  symm
  calc
    (∑ k ∈ Finset.Icc 2 K, ∑ m ∈ oddCoresUpTo M,
          (2 : ℂ) * verticalRatio s ^ k *
            complexDirichletCoeff s m)
        = ∑ k ∈ Finset.Icc 2 K,
          (2 : ℂ) * verticalRatio s ^ k *
            (∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m) := by
          refine Finset.sum_congr rfl ?_
          intro k _hk
          rw [Finset.mul_sum]
    _ = (∑ k ∈ Finset.Icc 2 K, (2 : ℂ) * verticalRatio s ^ k) *
          (∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m) := by
          rw [Finset.sum_mul]
    _ = (2 : ℂ) * (∑ k ∈ Finset.Icc 2 K, verticalRatio s ^ k) *
        (∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m) := by
          rw [← Finset.mul_sum, Finset.mul_sum]

/-- The cutoff residual against the raw finite genuine rectangle is exactly
the sum of addresswise cutoff residuals. -/
theorem superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_eq_cutoffResidual_sum
    (p : ℕ) (X : ℝ) (s : ℂ) (K M : ℕ) :
    superGaussianFiniteGenuineRectangle p X s K M -
        rectangularGenuine s K M =
      ∑ a ∈ superGaussianFiniteGenuineAddressSet K M,
        superGaussianFiniteGenuineCutoffResidualAddressTerm p X s a := by
  rw [superGaussianFiniteGenuineRectangle_eq_addressSet_sum]
  rw [rectangularGenuine_eq_addressSet_sum]
  rw [← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl ?_
  intro a _ha
  unfold superGaussianFiniteGenuineCutoffResidualAddressTerm
  unfold superGaussianGenuineAddressTermAt superGaussianGenuineAddressTerm
    genuineAddressTermAt
  rw [Nat.mul_comm (2 ^ a.1) a.2]
  ring

/-- The cutoff residual against the raw finite genuine rectangle is bounded by
the explicit sum of addresswise residual norms. -/
theorem superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_norm_le_cutoffResidualUpper
    (p : ℕ) (X : ℝ) (s : ℂ) (K M : ℕ) :
    ‖superGaussianFiniteGenuineRectangle p X s K M -
        rectangularGenuine s K M‖ ≤
      superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s := by
  rw [superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_eq_cutoffResidual_sum]
  unfold superGaussianFiniteGenuineCutoffResidualNormUpper
  simpa using
    (norm_sum_le (superGaussianFiniteGenuineAddressSet K M)
      (superGaussianFiniteGenuineCutoffResidualAddressTerm p X s))

/-- Raw-dominance criterion for finite super-Gaussian genuine rectangles.  If
the cutoff residual is smaller than the corresponding raw genuine rectangle,
the regularized finite rectangle cannot vanish. -/
theorem superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw
    {p K M : ℕ} {X : ℝ} {s : ℂ}
    (hres :
      superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s <
        ‖rectangularGenuine s K M‖) :
    superGaussianFiniteGenuineRectangle p X s K M ≠ 0 := by
  intro hzero
  have hdist :
      ‖superGaussianFiniteGenuineRectangle p X s K M -
          rectangularGenuine s K M‖ =
        ‖rectangularGenuine s K M‖ := by
    rw [hzero]
    simp
  have hle :=
    superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_norm_le_cutoffResidualUpper
      p X s K M
  rw [hdist] at hle
  linarith

/-- Canonical remainder of a finite super-Gaussian genuine rectangle after the
certified two-core block has been removed. -/
noncomputable def superGaussianFiniteGenuineRectangleRemainder
    (p K M : ℕ) : ℂ → ℝ → ℂ :=
  fun s X =>
    superGaussianFiniteGenuineRectangle p X s K M -
      superGaussianTwoCoreGenuineBlock p X s

/-- Explicit finite real upper bound for the canonical finite-rectangle
remainder: sum the norms of every address outside the certified `5 x 3`
two-core block. -/
noncomputable def superGaussianFiniteGenuineRectangleRemainderNormUpper
    (p K M : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑ a ∈
      superGaussianFiniteGenuineAddressSet K M \
        superGaussianFiniteGenuineAddressSet 5 3,
    superGaussianGenuineAddressTermNorm p X s a

/-- Monotonicity of finite odd-core cutoffs. -/
theorem oddCoresUpTo_subset_of_le {M N : ℕ} (hMN : M ≤ N) :
    oddCoresUpTo M ⊆ oddCoresUpTo N := by
  intro m hm
  rw [mem_oddCoresUpTo] at hm ⊢
  exact ⟨le_trans hm.1 hMN, hm.2⟩

/-- Monotonicity of the finite depth interval with fixed lower endpoint `2`. -/
theorem depthIcc_two_subset_of_le {K L : ℕ} (hKL : K ≤ L) :
    Finset.Icc 2 K ⊆ Finset.Icc 2 L := by
  intro k hk
  rw [Finset.mem_Icc] at hk ⊢
  exact ⟨hk.1, le_trans hk.2 hKL⟩

/-- The certified `5 x 3` two-core block is a subset of every larger finite
rectangle. -/
theorem superGaussianFiniteGenuineAddressSet_five_three_subset
    {K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M) :
    superGaussianFiniteGenuineAddressSet 5 3 ⊆
      superGaussianFiniteGenuineAddressSet K M := by
  unfold superGaussianFiniteGenuineAddressSet
  exact Finset.product_subset_product
    (depthIcc_two_subset_of_le hK)
    (oddCoresUpTo_subset_of_le hM)

/-- The minimal finite super-Gaussian genuine rectangle `K = 5`, `M = 3` is
exactly the certified restored two-core block. -/
theorem superGaussianFiniteGenuineRectangle_five_three_eq_block
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangle p X s 5 3 =
      superGaussianTwoCoreGenuineBlock p X s := by
  have hodd : oddCoresUpTo 3 = ({1, 3} : Finset ℕ) := by
    ext m
    constructor
    · intro hm
      rw [mem_oddCoresUpTo] at hm
      rcases hm with ⟨hle, hodd⟩
      rcases hodd with ⟨k, hk⟩
      have hm13 : m = 1 ∨ m = 3 := by omega
      rcases hm13 with rfl | rfl <;> simp
    · intro hm
      have hm13 : m = 1 ∨ m = 3 := by
        simpa using hm
      rcases hm13 with hm | hm
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨0, by norm_num⟩⟩
      · subst m
        rw [mem_oddCoresUpTo]
        exact ⟨by norm_num, ⟨1, by norm_num⟩⟩
  rw [superGaussianFiniteGenuineRectangle, hodd]
  unfold superGaussianGenuineAddressTerm superGaussianTwoCoreGenuineBlock
    superGaussianTwoCoreCutoffPrefix candidateTwoCoreCutoffPrefix
    candidateCutoffAddressQuartetPrefix
  norm_num [Finset.sum_Icc_succ_top, complexDirichletCoeff_one]
  field_simp [superGaussianCutoffWeight_ne_zero p X 4]
  ring

/-- The canonical finite-rectangle remainder turns the finite rectangle into
the generic two-core block-plus-remainder extension. -/
theorem superGaussianFiniteGenuineRectangle_eq_extension
    (p K M : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangle p X s K M =
      superGaussianTwoCoreGenuineExtension p
        (superGaussianFiniteGenuineRectangleRemainder p K M) X s := by
  unfold superGaussianTwoCoreGenuineExtension
    superGaussianFiniteGenuineRectangleRemainder
  ring

/-- The minimal `K = 5`, `M = 3` finite-rectangle remainder is exactly zero. -/
theorem superGaussianFiniteGenuineRectangleRemainder_five_three_eq_zero
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangleRemainder p 5 3 s X = 0 := by
  unfold superGaussianFiniteGenuineRectangleRemainder
  rw [superGaussianFiniteGenuineRectangle_five_three_eq_block]
  ring

/-- For a larger finite rectangle, the canonical remainder is exactly the sum
of the genuine address terms outside the certified `5 x 3` block. -/
theorem superGaussianFiniteGenuineRectangleRemainder_eq_address_sdiff_sum
    {p K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangleRemainder p K M s X =
      ∑ a ∈
          superGaussianFiniteGenuineAddressSet K M \
            superGaussianFiniteGenuineAddressSet 5 3,
        superGaussianGenuineAddressTermAt p X s a := by
  unfold superGaussianFiniteGenuineRectangleRemainder
  rw [← superGaussianFiniteGenuineRectangle_five_three_eq_block p X s]
  rw [superGaussianFiniteGenuineRectangle_eq_addressSet_sum]
  rw [superGaussianFiniteGenuineRectangle_eq_addressSet_sum]
  have hsubset :
      superGaussianFiniteGenuineAddressSet 5 3 ⊆
        superGaussianFiniteGenuineAddressSet K M :=
    superGaussianFiniteGenuineAddressSet_five_three_subset hK hM
  have hsum :=
    Finset.sum_sdiff
      (s₁ := superGaussianFiniteGenuineAddressSet 5 3)
      (s₂ := superGaussianFiniteGenuineAddressSet K M)
      (f := superGaussianGenuineAddressTermAt p X s) hsubset
  rw [← hsum]
  abel

/-- The canonical finite-rectangle remainder is bounded by the explicit sum of
norms over every address outside the certified `5 x 3` block. -/
theorem superGaussianFiniteGenuineRectangleRemainder_norm_le_upper
    {p K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M) (X : ℝ) (s : ℂ) :
    ‖superGaussianFiniteGenuineRectangleRemainder p K M s X‖ ≤
      superGaussianFiniteGenuineRectangleRemainderNormUpper p K M X s := by
  rw [superGaussianFiniteGenuineRectangleRemainder_eq_address_sdiff_sum
    hK hM X s]
  unfold superGaussianFiniteGenuineRectangleRemainderNormUpper
    superGaussianGenuineAddressTermNorm
  simpa [superGaussianGenuineAddressTermAt,
    superGaussianGenuineAddressTerm_norm_eq] using
    (norm_sum_le
      (superGaussianFiniteGenuineAddressSet K M \
        superGaussianFiniteGenuineAddressSet 5 3)
      (superGaussianGenuineAddressTermAt p X s))

/-- The super-Gaussian two-core finite block is the nonzero scalar times the
address-`4` plus `3`-core address-`12` prefix. -/
theorem superGaussianTwoCoreGenuineBlock_eq_address_prefixes
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreGenuineBlock p X s =
      ((2 : ℂ) * q s ^ 2 * superGaussianCutoffWeight p X 4) *
        (superGaussianAddressQuartetPrefix p X s 4 +
          complexDirichletCoeff s 3 *
            superGaussianAddressQuartetPrefix p X s 12) := by
  rfl

/-- The finite genuine block is nonzero exactly when its normalized two-core
prefix is nonzero. -/
theorem superGaussianTwoCoreGenuineBlock_ne_zero_iff_prefix_ne_zero
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreGenuineBlock p X s ≠ 0 ↔
      superGaussianTwoCoreCutoffPrefix p X s ≠ 0 := by
  unfold superGaussianTwoCoreGenuineBlock
  constructor
  · intro hblock hprefix
    apply hblock
    rw [hprefix]
    ring
  · intro hprefix
    exact mul_ne_zero
      (mul_ne_zero
        (mul_ne_zero (by norm_num)
          (pow_ne_zero 2 (by
            unfold q verticalRatio
            exact complexDirichletDepthRatio_ne_zero s)))
        (superGaussianCutoffWeight_ne_zero p X 4))
      hprefix

/-- The named two-core prefix lower envelope is a genuine lower bound. -/
theorem superGaussianTwoCoreCutoffPrefix_norm_lower_bound
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreCutoffPrefixNormLower p X s ≤
      ‖superGaussianTwoCoreCutoffPrefix p X s‖ := by
  unfold superGaussianTwoCoreCutoffPrefixNormLower
    superGaussianTwoCoreCutoffPrefix candidateTwoCoreCutoffPrefix
  exact norm_add_mul_lower_bound_of_sub_norm_le
    (superGaussianAddressQuartetPrefix_sub_norm_le_closenessUpper p X s)

/-- The named restored two-core block lower envelope is a genuine lower bound. -/
theorem superGaussianTwoCoreGenuineBlock_norm_lower_bound
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreGenuineBlockNormLower p X s ≤
      ‖superGaussianTwoCoreGenuineBlock p X s‖ := by
  have h :=
    mul_le_mul_of_nonneg_left
      (superGaussianTwoCoreCutoffPrefix_norm_lower_bound p X s)
      (norm_nonneg
        ((2 : ℂ) * q s ^ 2 * superGaussianCutoffWeight p X 4))
  simpa [superGaussianTwoCoreGenuineBlockNormLower,
    superGaussianTwoCoreGenuineBlock, norm_mul, mul_assoc] using h

/-- The named prefix lower envelope is strictly positive once the explicit
address-closeness upper is below the core margin. -/
theorem superGaussianTwoCoreCutoffPrefixNormLower_pos_of_closenessUpper_lt
    {p : ℕ} {X : ℝ} {s : ℂ}
    (hupper :
      superGaussianAddressClosenessUpper p X s <
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖) :
    0 < superGaussianTwoCoreCutoffPrefixNormLower p X s := by
  unfold superGaussianTwoCoreCutoffPrefixNormLower
  linarith

/-- The restored scalar multiplying the normalized two-core prefix is never
zero, so its norm is strictly positive. -/
theorem superGaussianTwoCoreGenuineBlockScalar_norm_pos
    (p : ℕ) (X : ℝ) (s : ℂ) :
    0 < ‖(2 : ℂ) * q s ^ 2 * superGaussianCutoffWeight p X 4‖ := by
  exact norm_pos_iff.mpr
    (mul_ne_zero
      (mul_ne_zero
        (by norm_num : (2 : ℂ) ≠ 0)
        (pow_ne_zero 2 (by
          unfold q verticalRatio
          exact complexDirichletDepthRatio_ne_zero s)))
      (superGaussianCutoffWeight_ne_zero p X 4))

/-- The restored two-core block lower envelope is strictly positive under the
same address-closeness margin used by the non-cancellation route. -/
theorem superGaussianTwoCoreGenuineBlockNormLower_pos_of_closenessUpper_lt
    {p : ℕ} {X : ℝ} {s : ℂ}
    (hupper :
      superGaussianAddressClosenessUpper p X s <
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖) :
    0 < superGaussianTwoCoreGenuineBlockNormLower p X s := by
  unfold superGaussianTwoCoreGenuineBlockNormLower
  exact mul_pos
    (superGaussianTwoCoreGenuineBlockScalar_norm_pos p X s)
    (superGaussianTwoCoreCutoffPrefixNormLower_pos_of_closenessUpper_lt
      hupper)

/-- The extension is exactly the certified two-core block plus the named
remainder. -/
theorem superGaussianTwoCoreGenuineExtension_eq_block_add_remainder
    (p : ℕ) (remainder : ℂ → ℝ → ℂ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreGenuineExtension p remainder X s =
      superGaussianTwoCoreGenuineBlock p X s + remainder s X := by
  rfl

/-- A remainder strictly smaller than the certified block cannot cancel that
block.  This is the local tail-dominance bridge for the genuine-first middle
route. -/
theorem superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt
    {p : ℕ} {remainder : ℂ → ℝ → ℂ} {X : ℝ} {s : ℂ}
    (hrem :
      ‖remainder s X‖ < ‖superGaussianTwoCoreGenuineBlock p X s‖) :
    superGaussianTwoCoreGenuineExtension p remainder X s ≠ 0 := by
  unfold superGaussianTwoCoreGenuineExtension
  intro hzero
  have hrem_eq :
      remainder s X = -superGaussianTwoCoreGenuineBlock p X s := by
    calc
      remainder s X =
          superGaussianTwoCoreGenuineBlock p X s + remainder s X -
            superGaussianTwoCoreGenuineBlock p X s := by ring
      _ = 0 - superGaussianTwoCoreGenuineBlock p X s := by rw [hzero]
      _ = -superGaussianTwoCoreGenuineBlock p X s := by ring
  have hnorm :
      ‖remainder s X‖ = ‖superGaussianTwoCoreGenuineBlock p X s‖ := by
    rw [hrem_eq, norm_neg]
  linarith

/-- A computable lower bound for the certified block is enough for the same
tail-dominance bridge. -/
theorem superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt_lower
    {p : ℕ} {remainder : ℂ → ℝ → ℂ} {X lower : ℝ} {s : ℂ}
    (hlower : lower ≤ ‖superGaussianTwoCoreGenuineBlock p X s‖)
    (hrem : ‖remainder s X‖ < lower) :
    superGaussianTwoCoreGenuineExtension p remainder X s ≠ 0 :=
  superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt
    (lt_of_lt_of_le hrem hlower)

/-- Super-Gaussian address collision obstruction for the two-core prefix. -/
def superGaussianTwoCoreCutoffAddressCollision
    (p : ℕ) (X : ℝ) (s : ℂ) : Prop :=
  candidateTwoCoreCutoffAddressCollision (superGaussianCutoffWeight p X) s

/-- Scalar collision ratio for the super-Gaussian two-core candidate. -/
noncomputable def superGaussianTwoCoreCollisionRatio
    (p : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  candidateTwoCoreCutoffCollisionRatio (superGaussianCutoffWeight p X) s

/-- Scalar collision gap for the super-Gaussian two-core candidate. -/
noncomputable def superGaussianTwoCoreCollisionGap
    (p : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  candidateTwoCoreCutoffCollisionGap (superGaussianCutoffWeight p X) s

/-- The super-Gaussian two-core collision gap is the collision ratio shifted by
`1`. -/
theorem superGaussianTwoCoreCollisionGap_eq_ratio_add_one
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreCollisionGap p X s =
      superGaussianTwoCoreCollisionRatio p X s + 1 := rfl

/-- Norm separation of the super-Gaussian collision ratio is sufficient for a
nonzero collision gap. -/
theorem superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_norm_ne_one
    {p : ℕ} {X : ℝ} {s : ℂ}
    (h : ‖superGaussianTwoCoreCollisionRatio p X s‖ ≠ 1) :
    superGaussianTwoCoreCollisionGap p X s ≠ 0 := by
  rw [superGaussianTwoCoreCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_norm_ne_one h

/-- Real-part separation of the super-Gaussian collision ratio is sufficient
for a nonzero collision gap. -/
theorem superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_re_ne_neg_one
    {p : ℕ} {X : ℝ} {s : ℂ}
    (h : (superGaussianTwoCoreCollisionRatio p X s).re ≠ -1) :
    superGaussianTwoCoreCollisionGap p X s ≠ 0 := by
  rw [superGaussianTwoCoreCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_re_ne_neg_one h

/-- Imaginary-part separation of the super-Gaussian collision ratio is
sufficient for a nonzero collision gap. -/
theorem superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_im_ne_zero
    {p : ℕ} {X : ℝ} {s : ℂ}
    (h : (superGaussianTwoCoreCollisionRatio p X s).im ≠ 0) :
    superGaussianTwoCoreCollisionGap p X s ≠ 0 := by
  rw [superGaussianTwoCoreCollisionGap_eq_ratio_add_one]
  exact complex_add_one_ne_zero_of_im_ne_zero h

/-- If the address-`4` and address-`12` quartet prefixes are close enough, the
core modulus gap `‖3^(-s)‖ < 1` forces the collision ratio to have norm
strictly larger than `1`.  This is the large-cutoff norm-separation route. -/
theorem superGaussianTwoCoreCollisionRatio_norm_gt_one_of_address_closeness
    {p : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X)
    (hclose :
      ‖superGaussianAddressQuartetPrefix p X s 4 -
          superGaussianAddressQuartetPrefix p X s 12‖ <
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖) :
    1 < ‖superGaussianTwoCoreCollisionRatio p X s‖ := by
  let a := superGaussianAddressQuartetPrefix p X s 4
  let b := superGaussianAddressQuartetPrefix p X s 12
  let c := complexDirichletCoeff s 3
  have hb_ne : b ≠ 0 := by
    dsimp [b, superGaussianAddressQuartetPrefix]
    exact candidateCutoffAddressQuartetPrefix_ne_zero_of_ratio_bounds hs
      (superGaussianCutoffWeight_ne_zero p X 4)
      (superGaussianCutoffWeight_ne_zero p X 12)
      (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
      (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
      (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
  have hc_ne : c ≠ 0 := by
    dsimp [c]
    exact complexDirichletCoeff_ne_zero s 3
  have hb_pos : 0 < ‖b‖ := norm_pos_iff.mpr hb_ne
  have hc_pos : 0 < ‖c‖ := norm_pos_iff.mpr hc_ne
  have hb_le : ‖b‖ ≤ ‖a‖ + ‖b - a‖ := by
    calc
      ‖b‖ = ‖a + (b - a)‖ := by ring_nf
      _ ≤ ‖a‖ + ‖b - a‖ := norm_add_le _ _
  have hclose' : ‖b - a‖ < (1 - ‖c‖) * ‖b‖ := by
    dsimp [a, b, c] at hclose ⊢
    simpa [norm_sub_rev] using hclose
  have hden_lt_num : ‖c‖ * ‖b‖ < ‖a‖ := by
    nlinarith
  have hden_pos : 0 < ‖c‖ * ‖b‖ := mul_pos hc_pos hb_pos
  dsimp [a, b, c] at hden_lt_num hden_pos
  dsimp [superGaussianTwoCoreCollisionRatio, candidateTwoCoreCutoffCollisionRatio,
    superGaussianAddressQuartetPrefix]
  rw [Complex.norm_div, norm_mul]
  exact (one_lt_div hden_pos).mpr hden_lt_num

/-- Address-prefix closeness is sufficient for a nonzero super-Gaussian
collision gap by norm separation. -/
theorem superGaussianTwoCoreCollisionGap_ne_zero_of_address_closeness
    {p : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X)
    (hclose :
      ‖superGaussianAddressQuartetPrefix p X s 4 -
          superGaussianAddressQuartetPrefix p X s 12‖ <
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖) :
    superGaussianTwoCoreCollisionGap p X s ≠ 0 := by
  exact superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_norm_ne_one
    (ne_of_gt
      (superGaussianTwoCoreCollisionRatio_norm_gt_one_of_address_closeness
        hs hX hclose))

/-- Each super-Gaussian address quartet is individually nonzero in the right
half-plane.  The remaining two-core obstruction is only cross-core address
collision. -/
theorem superGaussianAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos
    {p : ℕ} {X : ℝ} {s : ℂ} (n : ℕ) (hs : 0 < s.re) (hX : 0 < X) :
    superGaussianAddressQuartetPrefix p X s n ≠ 0 := by
  unfold superGaussianAddressQuartetPrefix
  exact candidateCutoffAddressQuartetPrefix_ne_zero_of_ratio_bounds hs
    (superGaussianCutoffWeight_ne_zero p X 4)
    (superGaussianCutoffWeight_ne_zero p X n)
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))
    (superGaussianCutoffWeight_ratio_norm_le_one hX (by omega))

/-- Super-Gaussian two-core nonvanishing is exactly absence of the named
address collision. -/
theorem superGaussianTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianTwoCoreCutoffPrefix p X s ≠ 0 ↔
      ¬ superGaussianTwoCoreCutoffAddressCollision p X s := by
  unfold superGaussianTwoCoreCutoffPrefix
    superGaussianTwoCoreCutoffAddressCollision
  exact candidateTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision
    (superGaussianCutoffWeight p X) s

/-- Collision-free criterion for the super-Gaussian two-core candidate prefix. -/
theorem superGaussianTwoCoreCutoffPrefix_ne_zero_of_no_address_collision
    {p : ℕ} {X : ℝ} {s : ℂ}
    (hcollision : ¬ superGaussianTwoCoreCutoffAddressCollision p X s) :
    superGaussianTwoCoreCutoffPrefix p X s ≠ 0 := by
  rw [superGaussianTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision]
  exact hcollision

/-- The denominator used by the super-Gaussian collision gap is nonzero in the
right half-plane with positive cutoff scale. -/
theorem superGaussianTwoCoreCollisionGap_denominator_ne_zero
    {p : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X) :
    complexDirichletCoeff s 3 *
      candidateCutoffAddressQuartetPrefix
        (superGaussianCutoffWeight p X) s 12 ≠ 0 := by
  exact mul_ne_zero (complexDirichletCoeff_ne_zero s 3)
    (by
      simpa [superGaussianAddressQuartetPrefix] using
        superGaussianAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos
          (p := p) (X := X) (s := s) 12 hs hX)

/-- Super-Gaussian two-core nonvanishing is equivalent to a nonzero scalar
collision gap on the positive-cutoff right half-plane. -/
theorem superGaussianTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero
    {p : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X) :
    superGaussianTwoCoreCutoffPrefix p X s ≠ 0 ↔
      superGaussianTwoCoreCollisionGap p X s ≠ 0 := by
  unfold superGaussianTwoCoreCutoffPrefix superGaussianTwoCoreCollisionGap
  exact candidateTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero
    (superGaussianCutoffWeight p X) s
    (superGaussianTwoCoreCollisionGap_denominator_ne_zero hs hX)

/-- A nonzero super-Gaussian collision gap closes the finite two-core candidate
at that point. -/
theorem superGaussianTwoCoreCutoffPrefix_ne_zero_of_collisionGap_ne_zero
    {p : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X)
    (hgap : superGaussianTwoCoreCollisionGap p X s ≠ 0) :
    superGaussianTwoCoreCutoffPrefix p X s ≠ 0 := by
  exact (superGaussianTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero
    hs hX).mpr hgap

/-- Region-level no-collision package for the super-Gaussian two-core candidate. -/
def SuperGaussianTwoCoreNoAddressCollisionOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ¬ superGaussianTwoCoreCutoffAddressCollision p X s

/-- Region-level nonvanishing package for the super-Gaussian two-core candidate. -/
def SuperGaussianTwoCoreNonvanishingOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    superGaussianTwoCoreCutoffPrefix p X s ≠ 0

/-- Region-level nonvanishing package for the restored finite genuine
two-core block. -/
def SuperGaussianTwoCoreGenuineBlockNonvanishingOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    superGaussianTwoCoreGenuineBlock p X s ≠ 0

/-- Region-level nonvanishing package for a genuine middle extension written
as certified two-core block plus a named remainder. -/
def SuperGaussianTwoCoreGenuineExtensionNonvanishingOn
    (p : ℕ) (region : CutoffRegion) (remainder : ℂ → ℝ → ℂ) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    superGaussianTwoCoreGenuineExtension p remainder X s ≠ 0

/-- Region-level tail-dominance package: the named remainder is strictly
smaller than the restored finite two-core genuine block. -/
def SuperGaussianTwoCoreGenuineRemainderDominatedOn
    (p : ℕ) (region : CutoffRegion) (remainder : ℂ → ℝ → ℂ) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ‖remainder s X‖ < ‖superGaussianTwoCoreGenuineBlock p X s‖

/-- Region-level lower bound for the restored finite two-core genuine block. -/
def SuperGaussianTwoCoreGenuineBlockNormLowerOn
    (p : ℕ) (region : CutoffRegion) (lower : ℂ → ℝ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    lower s X ≤ ‖superGaussianTwoCoreGenuineBlock p X s‖

/-- Region-level strict positivity for a candidate lower bound for the
restored finite two-core genuine block. -/
def SuperGaussianTwoCoreGenuineBlockNormLowerPositiveOn
    (region : CutoffRegion) (lower : ℂ → ℝ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X → 0 < lower s X

/-- Region-level remainder estimate against a candidate lower bound for the
restored finite two-core genuine block. -/
def SuperGaussianTwoCoreGenuineRemainderBelowOn
    (region : CutoffRegion) (remainder : ℂ → ℝ → ℂ)
    (lower : ℂ → ℝ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ‖remainder s X‖ < lower s X

/-- Region-level nonzero collision-gap package for the super-Gaussian two-core
candidate. -/
def SuperGaussianTwoCoreCollisionGapNonzeroOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    superGaussianTwoCoreCollisionGap p X s ≠ 0

/-- Region-level address-closeness package for the large-cutoff
super-Gaussian route.  It asks that the cutoff deformation between address `4`
and address `12` be smaller than the core modulus margin. -/
def SuperGaussianTwoCoreAddressClosenessOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ‖superGaussianAddressQuartetPrefix p X s 4 -
        superGaussianAddressQuartetPrefix p X s 12‖ <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level upper-bound package for the large-cutoff address-closeness
route. -/
def SuperGaussianTwoCoreAddressClosenessUpperOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    superGaussianAddressClosenessUpper p X s <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level uniform floor-closeness package for the address-`4` versus
address-`12` cutoff weights. -/
def SuperGaussianTwoCoreUniformFloorClosenessOn
    (p : ℕ) (δ : ℝ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ‖superGaussianCutoffWeight p X 4 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 12 / superGaussianCutoffWeight p X 4‖ ≤ δ ∧
    ‖superGaussianCutoffWeight p X 8 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 24 / superGaussianCutoffWeight p X 4‖ ≤ δ ∧
    ‖superGaussianCutoffWeight p X 16 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 48 / superGaussianCutoffWeight p X 4‖ ≤ δ ∧
    ‖superGaussianCutoffWeight p X 32 / superGaussianCutoffWeight p X 4 -
      superGaussianCutoffWeight p X 96 / superGaussianCutoffWeight p X 4‖ ≤ δ

/-- Region-level core-margin domination package for a uniform floor-closeness
constant `δ`. -/
def SuperGaussianTwoCoreCoreMarginDominatesOn
    (p : ℕ) (δ : ℝ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * δ <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level core-margin domination package using the actual maximum of
the four cutoff floor-differences. -/
def SuperGaussianTwoCoreFloorMaxMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * superGaussianAddressFloorMax p X <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level core-margin domination package using only algebraic exponent
gaps of the super-Gaussian cutoff. -/
def SuperGaussianTwoCorePowerGapMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * superGaussianAddressPowerGapMax p X <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level core-margin domination package using only the largest address
scale in the two-core quartet comparison. -/
def SuperGaussianTwoCoreScaleMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * ((96 : ℝ) / X) ^ p <
      (1 - ‖complexDirichletCoeff s 3‖) *
        ‖superGaussianAddressQuartetPrefix p X s 12‖

/-- Region-level scale domination using the explicit lower bound for the
address-`12` quartet prefix. -/
def SuperGaussianTwoCoreScaleLowerMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * ((96 : ℝ) / X) ^ p <
      (1 - ‖complexDirichletCoeff s 3‖) *
        (‖superGaussianCutoffWeight p X 12 /
            superGaussianCutoffWeight p X 4‖ *
          (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3)))

/-- Region-level scale domination using only the core margin, the cutoff base
ratio, and the uniform `1 / 8` bracket margin. -/
def SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * ((96 : ℝ) / X) ^ p <
      (1 - ‖complexDirichletCoeff s 3‖) *
        (‖superGaussianCutoffWeight p X 12 /
            superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ))

/-- Region-level lower bound for the super-Gaussian base cutoff ratio. -/
def SuperGaussianTwoCoreCutoffBaseRatioHalfOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ((12 : ℝ) / X) ^ p - ((4 : ℝ) / X) ^ p ≤ Real.log 2

/-- Region-level scale domination after replacing the cutoff base ratio by its
`1 / 2` lower bound and the bracket margin by `1 / 8`. -/
def SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    2 * ((96 : ℝ) / X) ^ p <
      (1 - ‖complexDirichletCoeff s 3‖) * (1 / 16 : ℝ)

/-- Region-level scalar core margin against the scale term, with the constants
cleared from the `1 / 16` lower-margin route. -/
def SuperGaussianTwoCoreScaleCoreMarginDominatesOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    32 * ((96 : ℝ) / X) ^ p <
      1 - ‖complexDirichletCoeff s 3‖

/-- Region-level lower bounds for reducing the scalar core-scale margin to
two explicit constants. -/
def SuperGaussianTwoCoreScaleCoreLowerBoundsOn
    (sigma0 X0 : ℝ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X → sigma0 ≤ s.re ∧ X0 ≤ X

/-- Constant-only margin obligation induced by lower bounds
`sigma0 ≤ Re(s)` and `X0 ≤ X`. -/
def SuperGaussianTwoCoreScaleCoreConstantMargin
    (p : ℕ) (sigma0 X0 : ℝ) : Prop :=
  32 * ((96 : ℝ) / X0) ^ p <
    1 - Real.exp (-(sigma0 * Real.log (3 : ℝ)))

/-- Rational sufficient version of the constant-only core-scale margin. -/
def SuperGaussianTwoCoreScaleCoreRationalConstantMargin
    (p : ℕ) (sigma0 X0 : ℝ) : Prop :=
  32 * ((96 : ℝ) / X0) ^ p <
    (sigma0 * Real.log (3 : ℝ)) /
      (1 + sigma0 * Real.log (3 : ℝ))

/-- Fraction-free constant margin specialized to the first useful
super-Gaussian profile `p = 2`. -/
def SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin
    (sigma0 X0 : ℝ) : Prop :=
  32 * (96 : ℝ) ^ 2 *
      (1 + sigma0 * Real.log (3 : ℝ)) <
    (sigma0 * Real.log (3 : ℝ)) * X0 ^ 2

/-- Pointwise fraction-free margin specialized to the first useful
super-Gaussian profile `p = 2`.  Unlike the constant route, this lets the
cutoff scale `X` compensate for small `Re(s)` locally on the region. -/
def SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn
    (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    32 * (96 : ℝ) ^ 2 *
        (1 + s.re * Real.log (3 : ℝ)) <
      (s.re * Real.log (3 : ℝ)) * X ^ 2

/-- A simpler unit-strip reciprocal-scale package implying the pointwise
quadratic margin.  It separates the geometric strip bound `Re(s) ≤ 1` from
the cutoff-scale growth condition. -/
def SuperGaussianTwoCoreUnitStripReciprocalScaleOn
    (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    s.re ≤ 1 ∧
      32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) /
          Real.log (3 : ℝ) < s.re * X ^ 2

/-- Region-level norm separation package for the super-Gaussian collision
ratio.  This excludes the only possible collision value `-1` by norm. -/
def SuperGaussianTwoCoreCollisionRatioNormSeparatedOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    ‖superGaussianTwoCoreCollisionRatio p X s‖ ≠ 1

/-- Region-level real-part separation package for the super-Gaussian collision
ratio.  This excludes the only possible collision value `-1` by real part. -/
def SuperGaussianTwoCoreCollisionRatioRealSeparatedOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    (superGaussianTwoCoreCollisionRatio p X s).re ≠ -1

/-- Region-level imaginary-part separation package for the super-Gaussian
collision ratio.  This excludes the only possible collision value `-1` by
showing the ratio is not real. -/
def SuperGaussianTwoCoreCollisionRatioImagSeparatedOn
    (p : ℕ) (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X →
    (superGaussianTwoCoreCollisionRatio p X s).im ≠ 0

/-- Region-level positivity package for candidate cutoff regions. -/
def PositiveCutoffRegionOn (region : CutoffRegion) : Prop :=
  ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄, region s X → 0 < s.re ∧ 0 < X

/-- Concrete clean region where the `p = 2` super-Gaussian two-core
non-cancellation route closes by the unit-strip reciprocal-scale barrier. -/
def superGaussianTwoCoreUnitStripScaleRegion : CutoffRegion :=
  fun s X =>
    0 < s.re ∧ 0 < X ∧ s.re ≤ 1 ∧
      32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) /
          Real.log (3 : ℝ) < s.re * X ^ 2

/-- The concrete unit-strip scale region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianTwoCoreUnitStripScaleRegion :
    PositiveCutoffRegionOn superGaussianTwoCoreUnitStripScaleRegion := by
  intro s X hs
  exact ⟨hs.1, hs.2.1⟩

/-- The concrete unit-strip scale region satisfies the reciprocal-scale
package. -/
theorem superGaussianTwoCoreUnitStripReciprocalScaleOn_unitStripScaleRegion :
    SuperGaussianTwoCoreUnitStripReciprocalScaleOn
      superGaussianTwoCoreUnitStripScaleRegion := by
  intro s X hs
  exact ⟨hs.2.2.1, hs.2.2.2⟩

/-- Reciprocal cutoff scale profile.  In the unit strip this grows as the
point approaches the vertical boundary `Re(s) = 0`. -/
noncomputable def superGaussianTwoCoreReciprocalCutoffScale
    (A : ℝ) (s : ℂ) : ℝ :=
  A / s.re

/-- Any reciprocal scale whose square dominates the unit-strip barrier lands
inside the concrete unit-strip scale region. -/
theorem superGaussianTwoCoreUnitStripScaleRegion_of_reciprocalCutoffScale
    {A : ℝ} (hApos : 0 < A)
    (hA : superGaussianTwoCoreUnitStripScaleBarrier < A ^ 2)
    {s : ℂ} (hspos : 0 < s.re) (hsle : s.re ≤ 1) :
    superGaussianTwoCoreUnitStripScaleRegion s
      (superGaussianTwoCoreReciprocalCutoffScale A s) := by
  refine ⟨hspos, ?_, hsle, ?_⟩
  · unfold superGaussianTwoCoreReciprocalCutoffScale
    exact div_pos hApos hspos
  · have hscale_ge :
        A ^ 2 ≤ s.re * (A / s.re) ^ 2 := by
      field_simp [ne_of_gt hspos]
      nlinarith [sq_nonneg A, hspos, hsle]
    change superGaussianTwoCoreUnitStripScaleBarrier <
      s.re * superGaussianTwoCoreReciprocalCutoffScale A s ^ 2
    unfold superGaussianTwoCoreReciprocalCutoffScale
    exact lt_of_lt_of_le hA hscale_ge

/-- The concrete reciprocal scale `X = 768 / Re(s)` lands inside the explicit
unit-strip scale region. -/
theorem superGaussianTwoCoreUnitStripScaleRegion_reciprocal768_of_re_pos_of_re_le_one
    {s : ℂ} (hspos : 0 < s.re) (hsle : s.re ≤ 1) :
    superGaussianTwoCoreUnitStripScaleRegion s
      (superGaussianTwoCoreReciprocalCutoffScale 768 s) :=
  superGaussianTwoCoreUnitStripScaleRegion_of_reciprocalCutoffScale
    (by norm_num : (0 : ℝ) < 768)
    superGaussianTwoCoreUnitStripScaleBarrier_lt_768_sq
    hspos hsle

/-- Any cutoff scale above a reciprocal scale whose square dominates the
unit-strip barrier also lands inside the concrete unit-strip scale region. -/
theorem superGaussianTwoCoreUnitStripScaleRegion_of_cutoff_ge_reciprocalCutoffScale
    {A : ℝ} (hApos : 0 < A)
    (hA : superGaussianTwoCoreUnitStripScaleBarrier < A ^ 2)
    {s : ℂ} {X : ℝ} (hspos : 0 < s.re) (hsle : s.re ≤ 1)
    (hXge : superGaussianTwoCoreReciprocalCutoffScale A s ≤ X) :
    superGaussianTwoCoreUnitStripScaleRegion s X := by
  have hrecip_region :
      superGaussianTwoCoreUnitStripScaleRegion s
        (superGaussianTwoCoreReciprocalCutoffScale A s) :=
    superGaussianTwoCoreUnitStripScaleRegion_of_reciprocalCutoffScale
      hApos hA hspos hsle
  have hscale_pos : 0 < superGaussianTwoCoreReciprocalCutoffScale A s :=
    hrecip_region.2.1
  have hXpos : 0 < X := lt_of_lt_of_le hscale_pos hXge
  refine ⟨hspos, hXpos, hsle, ?_⟩
  have hsquare :
      superGaussianTwoCoreReciprocalCutoffScale A s ^ 2 ≤ X ^ 2 := by
    exact pow_le_pow_left₀ (le_of_lt hscale_pos) hXge 2
  have hprod :
      s.re * superGaussianTwoCoreReciprocalCutoffScale A s ^ 2 ≤
        s.re * X ^ 2 := by
    exact mul_le_mul_of_nonneg_left hsquare (le_of_lt hspos)
  exact lt_of_lt_of_le hrecip_region.2.2.2 hprod

/-- Any cutoff scale above `768 / Re(s)` lands inside the explicit unit-strip
scale region. -/
theorem superGaussianTwoCoreUnitStripScaleRegion_of_reciprocal768_le_cutoff
    {s : ℂ} {X : ℝ} (hspos : 0 < s.re) (hsle : s.re ≤ 1)
    (hXge : superGaussianTwoCoreReciprocalCutoffScale 768 s ≤ X) :
    superGaussianTwoCoreUnitStripScaleRegion s X :=
  superGaussianTwoCoreUnitStripScaleRegion_of_cutoff_ge_reciprocalCutoffScale
    (by norm_num : (0 : ℝ) < 768)
    superGaussianTwoCoreUnitStripScaleBarrier_lt_768_sq
    hspos hsle hXge

/-- Practical named unit-strip region: the cutoff scale is at least
`768 / Re(s)`. -/
def superGaussianTwoCoreReciprocal768ScaleRegion : CutoffRegion :=
  fun s X =>
    0 < s.re ∧ s.re ≤ 1 ∧
      superGaussianTwoCoreReciprocalCutoffScale 768 s ≤ X

/-- The reciprocal-768 region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianTwoCoreReciprocal768ScaleRegion :
    PositiveCutoffRegionOn superGaussianTwoCoreReciprocal768ScaleRegion := by
  intro s X hs
  have hunit :
      superGaussianTwoCoreUnitStripScaleRegion s X :=
    superGaussianTwoCoreUnitStripScaleRegion_of_reciprocal768_le_cutoff
      hs.1 hs.2.1 hs.2.2
  exact ⟨hunit.1, hunit.2.1⟩

/-- The reciprocal-768 region satisfies the unit-strip reciprocal-scale
package. -/
theorem superGaussianTwoCoreUnitStripReciprocalScaleOn_reciprocal768ScaleRegion :
    SuperGaussianTwoCoreUnitStripReciprocalScaleOn
      superGaussianTwoCoreReciprocal768ScaleRegion := by
  intro s X hs
  exact
    superGaussianTwoCoreUnitStripReciprocalScaleOn_unitStripScaleRegion
      (superGaussianTwoCoreUnitStripScaleRegion_of_reciprocal768_le_cutoff
        hs.1 hs.2.1 hs.2.2)

/-- An explicit four-floor closeness upper below the core margin gives
address-prefix closeness on the whole region. -/
theorem superGaussianTwoCoreAddressClosenessOn_of_closenessUpperOn
    {p : ℕ} {region : CutoffRegion}
    (hupper : SuperGaussianTwoCoreAddressClosenessUpperOn p region) :
    SuperGaussianTwoCoreAddressClosenessOn p region := by
  intro s X hs
  exact lt_of_le_of_lt
    (superGaussianAddressQuartetPrefix_sub_norm_le_closenessUpper p X s)
    (hupper hs)

/-- Uniform floor closeness plus core-margin domination gives the explicit
four-floor closeness upper on a positive region. -/
theorem superGaussianTwoCoreAddressClosenessUpperOn_of_uniformFloorClosenessOn
    {p : ℕ} {δ : ℝ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region) (hδ : 0 < δ)
    (hfloor : SuperGaussianTwoCoreUniformFloorClosenessOn p δ region)
    (hmargin : SuperGaussianTwoCoreCoreMarginDominatesOn p δ region) :
    SuperGaussianTwoCoreAddressClosenessUpperOn p region := by
  intro s X hs
  rcases hfloor hs with ⟨h0, h1, h2, h3⟩
  exact lt_trans
    (superGaussianAddressClosenessUpper_lt_two_mul_of_floor_bounds
      (hpositive hs).1 hδ h0 h1 h2 h3)
    (hmargin hs)

/-- The pointwise floor-maximum margin package gives the explicit four-floor
closeness upper on a positive region. -/
theorem superGaussianTwoCoreAddressClosenessUpperOn_of_floorMaxMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreFloorMaxMarginDominatesOn p region) :
    SuperGaussianTwoCoreAddressClosenessUpperOn p region := by
  intro s X hs
  exact superGaussianAddressClosenessUpper_lt_margin_of_floorMax
    (hpositive hs).1 (hmargin hs)

/-- Algebraic power-gap margin domination implies floor-maximum margin
domination on a positive cutoff region. -/
theorem superGaussianTwoCoreFloorMaxMarginDominatesOn_of_powerGapMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCorePowerGapMarginDominatesOn p region) :
    SuperGaussianTwoCoreFloorMaxMarginDominatesOn p region := by
  intro s X hs
  have hle :
      superGaussianAddressFloorMax p X ≤
        superGaussianAddressPowerGapMax p X :=
    superGaussianAddressFloorMax_le_powerGapMax (hpositive hs).2
  exact lt_of_le_of_lt
    (mul_le_mul_of_nonneg_left hle (by norm_num : (0 : ℝ) ≤ 2))
    (hmargin hs)

/-- Scale margin domination implies algebraic power-gap margin domination on a
positive cutoff region. -/
theorem superGaussianTwoCorePowerGapMarginDominatesOn_of_scaleMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleMarginDominatesOn p region) :
    SuperGaussianTwoCorePowerGapMarginDominatesOn p region := by
  intro s X hs
  have hle :
      superGaussianAddressPowerGapMax p X ≤ ((96 : ℝ) / X) ^ p :=
    superGaussianAddressPowerGapMax_le_topScale (hpositive hs).2
  exact lt_of_le_of_lt
    (mul_le_mul_of_nonneg_left hle (by norm_num : (0 : ℝ) ≤ 2))
    (hmargin hs)

/-- The explicit address-prefix lower margin implies the actual scale margin
on a positive region. -/
theorem superGaussianTwoCoreScaleMarginDominatesOn_of_scaleLowerMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleLowerMarginDominatesOn p region) :
    SuperGaussianTwoCoreScaleMarginDominatesOn p region := by
  intro s X hs
  have hprefix_lower :
      ‖superGaussianCutoffWeight p X 12 /
          superGaussianCutoffWeight p X 4‖ *
          (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3)) ≤
        ‖superGaussianAddressQuartetPrefix p X s 12‖ :=
    superGaussianAddressQuartetPrefix_norm_lower_bound
      (p := p) (X := X) (s := s) (n := 12) (hpositive hs).2
  have hcoeff_nonneg : 0 ≤ 1 - ‖complexDirichletCoeff s 3‖ := by
    have hlt := complexDirichletCoeff_three_norm_lt_one_of_re_pos
      (hpositive hs).1
    linarith
  have hmargin_lower :
      (1 - ‖complexDirichletCoeff s 3‖) *
          (‖superGaussianCutoffWeight p X 12 /
              superGaussianCutoffWeight p X 4‖ *
            (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3))) ≤
        (1 - ‖complexDirichletCoeff s 3‖) *
          ‖superGaussianAddressQuartetPrefix p X s 12‖ :=
    mul_le_mul_of_nonneg_left hprefix_lower hcoeff_nonneg
  exact lt_of_lt_of_le (hmargin hs) hmargin_lower

/-- The uniform `1 / 8` bracket margin implies the explicit lower-margin
obligation on a positive region. -/
theorem superGaussianTwoCoreScaleLowerMarginDominatesOn_of_scaleCoreCutoffMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn p region) :
    SuperGaussianTwoCoreScaleLowerMarginDominatesOn p region := by
  intro s X hs
  have htail :
      (1 / 8 : ℝ) ≤ 1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3) :=
    one_eighth_le_one_sub_q_cubic_tail_of_re_pos (hpositive hs).1
  have hcutoff_nonneg :
      0 ≤ ‖superGaussianCutoffWeight p X 12 /
          superGaussianCutoffWeight p X 4‖ :=
    norm_nonneg _
  have hfactor_lower :
      ‖superGaussianCutoffWeight p X 12 /
          superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ) ≤
        ‖superGaussianCutoffWeight p X 12 /
          superGaussianCutoffWeight p X 4‖ *
          (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3)) :=
    mul_le_mul_of_nonneg_left htail hcutoff_nonneg
  have hcoeff_nonneg : 0 ≤ 1 - ‖complexDirichletCoeff s 3‖ := by
    have hlt := complexDirichletCoeff_three_norm_lt_one_of_re_pos
      (hpositive hs).1
    linarith
  have hmargin_lower :
      (1 - ‖complexDirichletCoeff s 3‖) *
          (‖superGaussianCutoffWeight p X 12 /
              superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ)) ≤
        (1 - ‖complexDirichletCoeff s 3‖) *
          (‖superGaussianCutoffWeight p X 12 /
              superGaussianCutoffWeight p X 4‖ *
            (1 - (‖q s‖ + ‖q s‖ ^ 2 + ‖q s‖ ^ 3))) :=
    mul_le_mul_of_nonneg_left hfactor_lower hcoeff_nonneg
  exact lt_of_lt_of_le (hmargin hs) hmargin_lower

/-- A `log 2` exponent-gap bound reduces the cutoff base ratio to a uniform
`1 / 2` lower bound, leaving only the core margin and scale term. -/
theorem superGaussianTwoCoreScaleCoreCutoffMarginDominatesOn_of_cutoffBaseRatioHalfOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hratio : SuperGaussianTwoCoreCutoffBaseRatioHalfOn p region)
    (hmargin : SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region) :
    SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn p region := by
  intro s X hs
  have hhalf :
      (1 / 2 : ℝ) ≤
        ‖superGaussianCutoffWeight p X 12 /
            superGaussianCutoffWeight p X 4‖ :=
    superGaussianCutoffWeight_ratio_norm_ge_half_of_gap_le_log_two
      (hratio hs)
  have hfactor_lower :
      (1 / 16 : ℝ) ≤
        ‖superGaussianCutoffWeight p X 12 /
            superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ) := by
    nlinarith
  have hcoeff_nonneg : 0 ≤ 1 - ‖complexDirichletCoeff s 3‖ := by
    have hlt := complexDirichletCoeff_three_norm_lt_one_of_re_pos
      (hpositive hs).1
    linarith
  have hmargin_lower :
      (1 - ‖complexDirichletCoeff s 3‖) * (1 / 16 : ℝ) ≤
        (1 - ‖complexDirichletCoeff s 3‖) *
          (‖superGaussianCutoffWeight p X 12 /
              superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ)) :=
    mul_le_mul_of_nonneg_left hfactor_lower hcoeff_nonneg
  exact lt_of_lt_of_le (hmargin hs) hmargin_lower

/-- The scalar core-scale margin is already strong enough to force the
address-`12` versus address-`4` exponent gap below `log 2`. -/
theorem superGaussianTwoCoreCutoffBaseRatioHalfOn_of_scaleCoreHalfMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region) :
    SuperGaussianTwoCoreCutoffBaseRatioHalfOn p region := by
  intro s X hs
  have hscale_le_gap :
      ((12 : ℝ) / X) ^ p - ((4 : ℝ) / X) ^ p ≤
        ((96 : ℝ) / X) ^ p := by
    simpa [superGaussianAddressPowerGap] using
      (superGaussianAddressPowerGap_le_topScale
        (p := p) (X := X) (a := 4) (b := 12)
        (hpositive hs).2 (by norm_num))
  have hcore_le_one : 1 - ‖complexDirichletCoeff s 3‖ ≤ 1 := by
    have hnorm_nonneg : 0 ≤ ‖complexDirichletCoeff s 3‖ := norm_nonneg _
    linarith
  have hscale_lt : ((96 : ℝ) / X) ^ p < (1 / 32 : ℝ) := by
    have h := hmargin hs
    nlinarith
  exact le_trans hscale_le_gap
    (le_of_lt (lt_trans hscale_lt one_div_thirty_two_lt_log_two))

/-- Clearing constants: the scalar core-scale dominance implies the `1 / 16`
half-margin package. -/
theorem superGaussianTwoCoreScaleCoreHalfMarginDominatesOn_of_scaleCoreMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hmargin : SuperGaussianTwoCoreScaleCoreMarginDominatesOn p region) :
    SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region := by
  intro s X hs
  have h := hmargin hs
  nlinarith

/-- Region lower bounds plus a constant-only margin inequality imply the
clean scalar core-scale dominance on the whole region. -/
theorem superGaussianTwoCoreScaleCoreMarginDominatesOn_of_lowerBoundsOn
    {p : ℕ} {sigma0 X0 : ℝ} {region : CutoffRegion}
    (hX0 : 0 < X0)
    (hbounds : SuperGaussianTwoCoreScaleCoreLowerBoundsOn sigma0 X0 region)
    (hconstant : SuperGaussianTwoCoreScaleCoreConstantMargin p sigma0 X0) :
    SuperGaussianTwoCoreScaleCoreMarginDominatesOn p region := by
  intro s X hs
  rcases hbounds hs with ⟨hsigma, hX⟩
  have hscale_base :
      ((96 : ℝ) / X) ^ p ≤ ((96 : ℝ) / X0) ^ p :=
    superGaussianScaleTerm_le_of_cutoff_ge hX0 hX
  have hscale :
      32 * ((96 : ℝ) / X) ^ p ≤ 32 * ((96 : ℝ) / X0) ^ p :=
    mul_le_mul_of_nonneg_left hscale_base (by norm_num : (0 : ℝ) ≤ 32)
  have hcore :
      1 - Real.exp (-(sigma0 * Real.log (3 : ℝ))) ≤
        1 - ‖complexDirichletCoeff s 3‖ :=
    complexDirichletCoeff_three_core_margin_lower_bound_of_re_ge hsigma
  exact lt_of_lt_of_le (lt_of_le_of_lt hscale hconstant) hcore

/-- The rational constant margin is a sufficient condition for the exponential
constant margin. -/
theorem superGaussianTwoCoreScaleCoreConstantMargin_of_rationalConstantMargin
    {p : ℕ} {sigma0 X0 : ℝ} (hsigma0 : 0 ≤ sigma0)
    (hmargin :
      SuperGaussianTwoCoreScaleCoreRationalConstantMargin p sigma0 X0) :
    SuperGaussianTwoCoreScaleCoreConstantMargin p sigma0 X0 := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hx : 0 ≤ sigma0 * Real.log (3 : ℝ) :=
    mul_nonneg hsigma0 (le_of_lt hlog3)
  have hfrac :
      (sigma0 * Real.log (3 : ℝ)) /
          (1 + sigma0 * Real.log (3 : ℝ)) ≤
        1 - Real.exp (-(sigma0 * Real.log (3 : ℝ))) :=
    one_sub_exp_neg_lower_bound_fraction hx
  exact lt_of_lt_of_le hmargin hfrac

/-- The fraction-free quadratic constant margin implies the rational constant
margin for the super-Gaussian profile `p = 2`. -/
theorem superGaussianTwoCoreScaleCoreRationalConstantMargin_two_of_quadraticConstantMargin
    {sigma0 X0 : ℝ} (hX0 : 0 < X0) (hsigma0 : 0 ≤ sigma0)
    (hquad :
      SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin sigma0 X0) :
    SuperGaussianTwoCoreScaleCoreRationalConstantMargin 2 sigma0 X0 := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hA_nonneg : 0 ≤ sigma0 * Real.log (3 : ℝ) :=
    mul_nonneg hsigma0 (le_of_lt hlog3)
  have hden_pos : 0 < 1 + sigma0 * Real.log (3 : ℝ) := by
    linarith
  unfold SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin at hquad
  unfold SuperGaussianTwoCoreScaleCoreRationalConstantMargin
  field_simp [hX0.ne', hden_pos.ne']
  ring_nf at *
  nlinarith

/-- The pointwise quadratic margin implies the clean scalar core-scale
dominance for the profile `p = 2`. -/
theorem superGaussianTwoCoreScaleCoreMarginDominatesOn_two_of_pointwiseQuadratic
    {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hquad :
      SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn region) :
    SuperGaussianTwoCoreScaleCoreMarginDominatesOn 2 region := by
  intro s X hs
  have hsre_nonneg : 0 ≤ s.re := le_of_lt (hpositive hs).1
  have hrat :
      SuperGaussianTwoCoreScaleCoreRationalConstantMargin 2 s.re X :=
    superGaussianTwoCoreScaleCoreRationalConstantMargin_two_of_quadraticConstantMargin
      (hpositive hs).2 hsre_nonneg (hquad hs)
  have hconst :
      SuperGaussianTwoCoreScaleCoreConstantMargin 2 s.re X :=
    superGaussianTwoCoreScaleCoreConstantMargin_of_rationalConstantMargin
      hsre_nonneg hrat
  unfold SuperGaussianTwoCoreScaleCoreConstantMargin at hconst
  rw [complexDirichletCoeff_three_norm_eq]
  exact hconst

/-- The unit-strip reciprocal-scale package implies the pointwise quadratic
margin for the profile `p = 2`. -/
theorem superGaussianTwoCorePointwiseQuadratic_of_unitStripReciprocalScaleOn
    {region : CutoffRegion}
    (hscale : SuperGaussianTwoCoreUnitStripReciprocalScaleOn region) :
    SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn region := by
  intro s X hs
  rcases hscale hs with ⟨hsre_le_one, hrecip⟩
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hfactor :
      1 + s.re * Real.log (3 : ℝ) ≤ 1 + Real.log (3 : ℝ) := by
    nlinarith
  have hleft_le :
      32 * (96 : ℝ) ^ 2 * (1 + s.re * Real.log (3 : ℝ)) ≤
        32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) := by
    exact mul_le_mul_of_nonneg_left hfactor (by positivity)
  have hright :
      32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) <
        (s.re * X ^ 2) * Real.log (3 : ℝ) := by
    have h := mul_lt_mul_of_pos_right hrecip hlog3
    have hcancel :
        (32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) /
            Real.log (3 : ℝ)) * Real.log (3 : ℝ) =
          32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) := by
      field_simp [hlog3.ne']
    simpa [hcancel] using h
  have hright' :
      32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ)) <
        (s.re * Real.log (3 : ℝ)) * X ^ 2 := by
    calc
      32 * (96 : ℝ) ^ 2 * (1 + Real.log (3 : ℝ))
          < (s.re * X ^ 2) * Real.log (3 : ℝ) := hright
      _ = (s.re * Real.log (3 : ℝ)) * X ^ 2 := by ring
  exact lt_of_le_of_lt hleft_le hright'

/-- Norm separation of the collision ratio gives a nonzero collision gap on
the whole region. -/
theorem superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioNormSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hratio : SuperGaussianTwoCoreCollisionRatioNormSeparatedOn p region) :
    SuperGaussianTwoCoreCollisionGapNonzeroOn p region := by
  intro s X hs
  exact superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_norm_ne_one
    (hratio hs)

/-- Real-part separation of the collision ratio gives a nonzero collision gap
on the whole region. -/
theorem superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioRealSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hratio : SuperGaussianTwoCoreCollisionRatioRealSeparatedOn p region) :
    SuperGaussianTwoCoreCollisionGapNonzeroOn p region := by
  intro s X hs
  exact superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_re_ne_neg_one
    (hratio hs)

/-- Imaginary-part separation of the collision ratio gives a nonzero collision
gap on the whole region. -/
theorem superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioImagSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hratio : SuperGaussianTwoCoreCollisionRatioImagSeparatedOn p region) :
    SuperGaussianTwoCoreCollisionGapNonzeroOn p region := by
  intro s X hs
  exact superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_im_ne_zero
    (hratio hs)

/-- Address-closeness on a positive region gives norm separation of the
super-Gaussian collision ratio. -/
theorem superGaussianTwoCoreCollisionRatioNormSeparatedOn_of_addressClosenessOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hclose : SuperGaussianTwoCoreAddressClosenessOn p region) :
    SuperGaussianTwoCoreCollisionRatioNormSeparatedOn p region := by
  intro s X hs
  exact ne_of_gt
    (superGaussianTwoCoreCollisionRatio_norm_gt_one_of_address_closeness
      (hpositive hs).1 (hpositive hs).2 (hclose hs))

/-- Region-level super-Gaussian two-core target reduced to no address collision. -/
theorem superGaussianTwoCoreNonvanishingOn_of_noAddressCollisionOn
    {p : ℕ} {region : CutoffRegion}
    (hregion : SuperGaussianTwoCoreNoAddressCollisionOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region := by
  intro s X hs
  exact superGaussianTwoCoreCutoffPrefix_ne_zero_of_no_address_collision
    (hregion hs)

/-- Restoring the nonzero geometric scalar lifts prefix nonvanishing to the
finite genuine block. -/
theorem superGaussianTwoCoreGenuineBlockNonvanishingOn_of_prefix
    {p : ℕ} {region : CutoffRegion}
    (hprefix : SuperGaussianTwoCoreNonvanishingOn p region) :
    SuperGaussianTwoCoreGenuineBlockNonvanishingOn p region := by
  intro s X hs
  exact (superGaussianTwoCoreGenuineBlock_ne_zero_iff_prefix_ne_zero
    p X s).mpr (hprefix hs)

/-- Region-level tail domination lifts the restored finite two-core block to
the corresponding genuine middle extension. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_remainderDominatedOn
    {p : ℕ} {region : CutoffRegion} {remainder : ℂ → ℝ → ℂ}
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderDominatedOn p region remainder) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn
      p region remainder := by
  intro s X hs
  exact superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt
    (hrem hs)

/-- A certified lower bound for the restored finite block plus a remainder
estimate below that lower bound closes the genuine middle extension. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_blockNormLowerOn
    {p : ℕ} {region : CutoffRegion} {remainder : ℂ → ℝ → ℂ}
    {lower : ℂ → ℝ → ℝ}
    (hlower :
      SuperGaussianTwoCoreGenuineBlockNormLowerOn p region lower)
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderBelowOn region remainder lower) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn
      p region remainder := by
  intro s X hs
  exact
    superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt_lower
      (hlower hs) (hrem hs)

/-- The restored two-core lower-envelope profile is a valid block-norm lower
bound on every cutoff region. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerOn_profile
    (p : ℕ) (region : CutoffRegion) :
    SuperGaussianTwoCoreGenuineBlockNormLowerOn p region
      (superGaussianTwoCoreGenuineBlockNormLowerProfile p) := by
  intro s X hs
  exact superGaussianTwoCoreGenuineBlock_norm_lower_bound p X s

/-- The restored two-core lower-envelope profile is strictly positive on any
region where the explicit address-closeness upper is below the core margin. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_profile_of_closenessUpperOn
    {p : ℕ} {region : CutoffRegion}
    (hupper : SuperGaussianTwoCoreAddressClosenessUpperOn p region) :
    SuperGaussianTwoCoreGenuineBlockNormLowerPositiveOn region
      (superGaussianTwoCoreGenuineBlockNormLowerProfile p) := by
  intro s X hs
  exact
    superGaussianTwoCoreGenuineBlockNormLower_pos_of_closenessUpper_lt
      (hupper hs)

/-- Region-level super-Gaussian two-core target reduced to the scalar collision
gap.  This is the preferred audit shape for the next cutoff obligation. -/
theorem superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hgap : SuperGaussianTwoCoreCollisionGapNonzeroOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region := by
  intro s X hs
  exact superGaussianTwoCoreCutoffPrefix_ne_zero_of_collisionGap_ne_zero
    (hpositive hs).1 (hpositive hs).2 (hgap hs)

/-- Region-level super-Gaussian two-core target reduced to norm separation of
the collision ratio. -/
theorem superGaussianTwoCoreNonvanishingOn_of_ratioNormSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hratio : SuperGaussianTwoCoreCollisionRatioNormSeparatedOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn hpositive
    (superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioNormSeparatedOn hratio)

/-- Region-level super-Gaussian two-core target reduced to real-part separation
of the collision ratio. -/
theorem superGaussianTwoCoreNonvanishingOn_of_ratioRealSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hratio : SuperGaussianTwoCoreCollisionRatioRealSeparatedOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn hpositive
    (superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioRealSeparatedOn hratio)

/-- Region-level super-Gaussian two-core target reduced to imaginary-part
separation of the collision ratio. -/
theorem superGaussianTwoCoreNonvanishingOn_of_ratioImagSeparatedOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hratio : SuperGaussianTwoCoreCollisionRatioImagSeparatedOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn hpositive
    (superGaussianTwoCoreCollisionGapNonzeroOn_of_ratioImagSeparatedOn hratio)

/-- Region-level super-Gaussian two-core target reduced to address-prefix
closeness. -/
theorem superGaussianTwoCoreNonvanishingOn_of_addressClosenessOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hclose : SuperGaussianTwoCoreAddressClosenessOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_ratioNormSeparatedOn hpositive
    (superGaussianTwoCoreCollisionRatioNormSeparatedOn_of_addressClosenessOn
      hpositive hclose)

/-- Region-level super-Gaussian two-core target reduced to the explicit
four-floor closeness upper. -/
theorem superGaussianTwoCoreNonvanishingOn_of_closenessUpperOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hupper : SuperGaussianTwoCoreAddressClosenessUpperOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_addressClosenessOn hpositive
    (superGaussianTwoCoreAddressClosenessOn_of_closenessUpperOn hupper)

/-- Region-level super-Gaussian two-core target reduced to uniform floor
closeness and core-margin domination. -/
theorem superGaussianTwoCoreNonvanishingOn_of_uniformFloorClosenessOn
    {p : ℕ} {δ : ℝ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region) (hδ : 0 < δ)
    (hfloor : SuperGaussianTwoCoreUniformFloorClosenessOn p δ region)
    (hmargin : SuperGaussianTwoCoreCoreMarginDominatesOn p δ region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_closenessUpperOn hpositive
    (superGaussianTwoCoreAddressClosenessUpperOn_of_uniformFloorClosenessOn
      hpositive hδ hfloor hmargin)

/-- Region-level super-Gaussian two-core target reduced to a single pointwise
floor-maximum margin inequality. -/
theorem superGaussianTwoCoreNonvanishingOn_of_floorMaxMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreFloorMaxMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_closenessUpperOn hpositive
    (superGaussianTwoCoreAddressClosenessUpperOn_of_floorMaxMarginDominatesOn
      hpositive hmargin)

/-- Region-level super-Gaussian two-core target reduced to algebraic cutoff
power-gap margin domination. -/
theorem superGaussianTwoCoreNonvanishingOn_of_powerGapMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCorePowerGapMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_floorMaxMarginDominatesOn hpositive
    (superGaussianTwoCoreFloorMaxMarginDominatesOn_of_powerGapMarginDominatesOn
      hpositive hmargin)

/-- Region-level super-Gaussian two-core target reduced to the largest address
scale margin inequality. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_powerGapMarginDominatesOn hpositive
    (superGaussianTwoCorePowerGapMarginDominatesOn_of_scaleMarginDominatesOn
      hpositive hmargin)

/-- Region-level super-Gaussian two-core target reduced to the explicit lower
margin for the address-`12` quartet prefix. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleLowerMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleLowerMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleMarginDominatesOn hpositive
    (superGaussianTwoCoreScaleMarginDominatesOn_of_scaleLowerMarginDominatesOn
      hpositive hmargin)

/-- Region-level super-Gaussian two-core target reduced to core margin, cutoff
base ratio, and the uniform `1 / 8` bracket margin. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleCoreCutoffMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleLowerMarginDominatesOn hpositive
    (superGaussianTwoCoreScaleLowerMarginDominatesOn_of_scaleCoreCutoffMarginDominatesOn
      hpositive hmargin)

/-- Region-level super-Gaussian two-core target reduced to a cutoff exponent-gap
bound and the scalar core-scale margin. -/
theorem superGaussianTwoCoreNonvanishingOn_of_cutoffBaseRatioHalfOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hratio : SuperGaussianTwoCoreCutoffBaseRatioHalfOn p region)
    (hmargin : SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreCutoffMarginDominatesOn
    hpositive
    (superGaussianTwoCoreScaleCoreCutoffMarginDominatesOn_of_cutoffBaseRatioHalfOn
      hpositive hratio hmargin)

/-- Region-level super-Gaussian two-core target reduced to the single scalar
core-scale margin with constant `1 / 16`. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleCoreHalfMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_cutoffBaseRatioHalfOn hpositive
    (superGaussianTwoCoreCutoffBaseRatioHalfOn_of_scaleCoreHalfMarginDominatesOn
      hpositive hmargin)
    hmargin

/-- Region-level super-Gaussian two-core target reduced to the clean scalar
core-scale dominance inequality. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleCoreMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreMarginDominatesOn p region) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreHalfMarginDominatesOn hpositive
    (superGaussianTwoCoreScaleCoreHalfMarginDominatesOn_of_scaleCoreMarginDominatesOn
      hmargin)

/-- The clean scalar core-scale dominance package also gives the explicit
address-closeness upper needed for quantitative lower envelopes. -/
theorem superGaussianTwoCoreAddressClosenessUpperOn_of_scaleCoreMarginDominatesOn
    {p : ℕ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hmargin : SuperGaussianTwoCoreScaleCoreMarginDominatesOn p region) :
    SuperGaussianTwoCoreAddressClosenessUpperOn p region := by
  have hhalf :
      SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn p region :=
    superGaussianTwoCoreScaleCoreHalfMarginDominatesOn_of_scaleCoreMarginDominatesOn
      hmargin
  have hratio :
      SuperGaussianTwoCoreCutoffBaseRatioHalfOn p region :=
    superGaussianTwoCoreCutoffBaseRatioHalfOn_of_scaleCoreHalfMarginDominatesOn
      hpositive hhalf
  have hcutoff :
      SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn p region :=
    superGaussianTwoCoreScaleCoreCutoffMarginDominatesOn_of_cutoffBaseRatioHalfOn
      hpositive hratio hhalf
  have hlower :
      SuperGaussianTwoCoreScaleLowerMarginDominatesOn p region :=
    superGaussianTwoCoreScaleLowerMarginDominatesOn_of_scaleCoreCutoffMarginDominatesOn
      hpositive hcutoff
  have hscale :
      SuperGaussianTwoCoreScaleMarginDominatesOn p region :=
    superGaussianTwoCoreScaleMarginDominatesOn_of_scaleLowerMarginDominatesOn
      hpositive hlower
  have hpower :
      SuperGaussianTwoCorePowerGapMarginDominatesOn p region :=
    superGaussianTwoCorePowerGapMarginDominatesOn_of_scaleMarginDominatesOn
      hpositive hscale
  have hfloor :
      SuperGaussianTwoCoreFloorMaxMarginDominatesOn p region :=
    superGaussianTwoCoreFloorMaxMarginDominatesOn_of_powerGapMarginDominatesOn
      hpositive hpower
  exact
    superGaussianTwoCoreAddressClosenessUpperOn_of_floorMaxMarginDominatesOn
      hpositive hfloor

/-- Region-level super-Gaussian two-core target reduced to lower bounds
`sigma0 ≤ Re(s)`, `X0 ≤ X`, and a constant-only scalar margin. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn
    {p : ℕ} {sigma0 X0 : ℝ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hX0 : 0 < X0)
    (hbounds : SuperGaussianTwoCoreScaleCoreLowerBoundsOn sigma0 X0 region)
    (hconstant : SuperGaussianTwoCoreScaleCoreConstantMargin p sigma0 X0) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreMarginDominatesOn hpositive
    (superGaussianTwoCoreScaleCoreMarginDominatesOn_of_lowerBoundsOn
      hX0 hbounds hconstant)

/-- Region-level super-Gaussian two-core target reduced to lower bounds
`sigma0 ≤ Re(s)`, `X0 ≤ X`, and a rational constant-only scalar margin. -/
theorem superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn_rationalMargin
    {p : ℕ} {sigma0 X0 : ℝ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hX0 : 0 < X0) (hsigma0 : 0 ≤ sigma0)
    (hbounds : SuperGaussianTwoCoreScaleCoreLowerBoundsOn sigma0 X0 region)
    (hconstant :
      SuperGaussianTwoCoreScaleCoreRationalConstantMargin p sigma0 X0) :
    SuperGaussianTwoCoreNonvanishingOn p region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn hpositive hX0
    hbounds
    (superGaussianTwoCoreScaleCoreConstantMargin_of_rationalConstantMargin
      hsigma0 hconstant)

/-- Region-level super-Gaussian two-core target for `p = 2`, reduced to
lower bounds `sigma0 ≤ Re(s)`, `X0 ≤ X`, and a fraction-free quadratic margin. -/
theorem superGaussianTwoCoreNonvanishingOn_two_of_scaleCoreLowerBoundsOn_quadraticMargin
    {sigma0 X0 : ℝ} {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hX0 : 0 < X0) (hsigma0 : 0 ≤ sigma0)
    (hbounds : SuperGaussianTwoCoreScaleCoreLowerBoundsOn sigma0 X0 region)
    (hquad :
      SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin sigma0 X0) :
    SuperGaussianTwoCoreNonvanishingOn 2 region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn_rationalMargin
    hpositive hX0 hsigma0 hbounds
    (superGaussianTwoCoreScaleCoreRationalConstantMargin_two_of_quadraticConstantMargin
      hX0 hsigma0 hquad)

/-- Region-level super-Gaussian two-core target for `p = 2`, reduced to the
pointwise fraction-free quadratic margin. -/
theorem superGaussianTwoCoreNonvanishingOn_two_of_pointwiseQuadratic
    {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hquad :
      SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn region) :
    SuperGaussianTwoCoreNonvanishingOn 2 region :=
  superGaussianTwoCoreNonvanishingOn_of_scaleCoreMarginDominatesOn hpositive
    (superGaussianTwoCoreScaleCoreMarginDominatesOn_two_of_pointwiseQuadratic
      hpositive hquad)

/-- Region-level super-Gaussian two-core target for `p = 2`, reduced to the
unit-strip reciprocal-scale package. -/
theorem superGaussianTwoCoreNonvanishingOn_two_of_unitStripReciprocalScaleOn
    {region : CutoffRegion}
    (hpositive : PositiveCutoffRegionOn region)
    (hscale : SuperGaussianTwoCoreUnitStripReciprocalScaleOn region) :
    SuperGaussianTwoCoreNonvanishingOn 2 region :=
  superGaussianTwoCoreNonvanishingOn_two_of_pointwiseQuadratic hpositive
    (superGaussianTwoCorePointwiseQuadratic_of_unitStripReciprocalScaleOn
      hscale)

/-- The reciprocal-768 region satisfies the clean scalar core-scale margin for
the restored `p = 2` super-Gaussian two-core route. -/
theorem superGaussianTwoCoreScaleCoreMarginDominatesOn_two_reciprocal768 :
    SuperGaussianTwoCoreScaleCoreMarginDominatesOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion :=
  superGaussianTwoCoreScaleCoreMarginDominatesOn_two_of_pointwiseQuadratic
    positiveCutoffRegionOn_superGaussianTwoCoreReciprocal768ScaleRegion
    (superGaussianTwoCorePointwiseQuadratic_of_unitStripReciprocalScaleOn
      superGaussianTwoCoreUnitStripReciprocalScaleOn_reciprocal768ScaleRegion)

/-- The reciprocal-768 region has the explicit address-closeness upper below
the two-core margin. -/
theorem superGaussianTwoCoreAddressClosenessUpperOn_two_reciprocal768 :
    SuperGaussianTwoCoreAddressClosenessUpperOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion :=
  superGaussianTwoCoreAddressClosenessUpperOn_of_scaleCoreMarginDominatesOn
    positiveCutoffRegionOn_superGaussianTwoCoreReciprocal768ScaleRegion
    superGaussianTwoCoreScaleCoreMarginDominatesOn_two_reciprocal768

/-- Closed concrete `p = 2` super-Gaussian two-core non-cancellation theorem
on the unit-strip reciprocal-scale region. -/
theorem superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion :
    SuperGaussianTwoCoreNonvanishingOn 2
      superGaussianTwoCoreUnitStripScaleRegion :=
  superGaussianTwoCoreNonvanishingOn_two_of_unitStripReciprocalScaleOn
    positiveCutoffRegionOn_superGaussianTwoCoreUnitStripScaleRegion
    superGaussianTwoCoreUnitStripReciprocalScaleOn_unitStripScaleRegion

/-- Pointwise closed form of the `p = 2` unit-strip route using the concrete
reciprocal cutoff scale `X = 768 / Re(s)`. -/
theorem superGaussianTwoCoreCutoffPrefix_two_reciprocal768_ne_zero_of_re_pos_of_re_le_one
    {s : ℂ} (hspos : 0 < s.re) (hsle : s.re ≤ 1) :
    superGaussianTwoCoreCutoffPrefix 2
      (superGaussianTwoCoreReciprocalCutoffScale 768 s) s ≠ 0 :=
  superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion
    (superGaussianTwoCoreUnitStripScaleRegion_reciprocal768_of_re_pos_of_re_le_one
      hspos hsle)

/-- Pointwise closed form of the `p = 2` unit-strip route for every cutoff
scale satisfying `768 / Re(s) ≤ X`. -/
theorem superGaussianTwoCoreCutoffPrefix_two_ne_zero_of_reciprocal768_le_cutoff
    {s : ℂ} {X : ℝ} (hspos : 0 < s.re) (hsle : s.re ≤ 1)
    (hXge : superGaussianTwoCoreReciprocalCutoffScale 768 s ≤ X) :
    superGaussianTwoCoreCutoffPrefix 2 X s ≠ 0 :=
  superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion
    (superGaussianTwoCoreUnitStripScaleRegion_of_reciprocal768_le_cutoff
      hspos hsle hXge)

/-- Pointwise closed form for the restored finite genuine block under every
cutoff scale satisfying `768 / Re(s) ≤ X`. -/
theorem superGaussianTwoCoreGenuineBlock_two_ne_zero_of_reciprocal768_le_cutoff
    {s : ℂ} {X : ℝ} (hspos : 0 < s.re) (hsle : s.re ≤ 1)
    (hXge : superGaussianTwoCoreReciprocalCutoffScale 768 s ≤ X) :
    superGaussianTwoCoreGenuineBlock 2 X s ≠ 0 :=
  (superGaussianTwoCoreGenuineBlock_ne_zero_iff_prefix_ne_zero 2 X s).mpr
    (superGaussianTwoCoreCutoffPrefix_two_ne_zero_of_reciprocal768_le_cutoff
      hspos hsle hXge)

/-- Closed region-level form of the `p = 2` reciprocal-768 unit-strip route. -/
theorem superGaussianTwoCoreNonvanishingOn_two_reciprocal768ScaleRegion :
    SuperGaussianTwoCoreNonvanishingOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion := by
  intro s X hs
  exact superGaussianTwoCoreCutoffPrefix_two_ne_zero_of_reciprocal768_le_cutoff
    hs.1 hs.2.1 hs.2.2

/-- Closed region-level restored finite genuine block form of the `p = 2`
reciprocal-768 unit-strip route. -/
theorem superGaussianTwoCoreGenuineBlockNonvanishingOn_two_reciprocal768 :
    SuperGaussianTwoCoreGenuineBlockNonvanishingOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion :=
  superGaussianTwoCoreGenuineBlockNonvanishingOn_of_prefix
    superGaussianTwoCoreNonvanishingOn_two_reciprocal768ScaleRegion

/-- Closed reciprocal-768 lower-bound package for the restored finite
two-core genuine block. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerOn_two_reciprocal768 :
    SuperGaussianTwoCoreGenuineBlockNormLowerOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) :=
  superGaussianTwoCoreGenuineBlockNormLowerOn_profile 2
    superGaussianTwoCoreReciprocal768ScaleRegion

/-- Closed reciprocal-768 positivity package for the restored finite two-core
genuine block lower envelope. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768 :
    SuperGaussianTwoCoreGenuineBlockNormLowerPositiveOn
      superGaussianTwoCoreReciprocal768ScaleRegion
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) :=
  superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_profile_of_closenessUpperOn
    superGaussianTwoCoreAddressClosenessUpperOn_two_reciprocal768

/-- Closed reciprocal-768 extension criterion: any genuine middle extension
whose remainder is strictly smaller than the certified restored two-core block
is nonzero on the whole reciprocal-768 unit-strip region. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768
    {remainder : ℂ → ℝ → ℂ}
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderDominatedOn 2
        superGaussianTwoCoreReciprocal768ScaleRegion remainder) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion remainder :=
  superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_remainderDominatedOn
    hrem

/-- Lower-bound form of the reciprocal-768 extension criterion.  This is the
preferred target for explicit tail estimates: prove a computable lower bound
for the restored two-core block, then prove the middle remainder is below it. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_lower
    {remainder : ℂ → ℝ → ℂ} {lower : ℂ → ℝ → ℝ}
    (hlower :
      SuperGaussianTwoCoreGenuineBlockNormLowerOn 2
        superGaussianTwoCoreReciprocal768ScaleRegion lower)
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderBelowOn
        superGaussianTwoCoreReciprocal768ScaleRegion remainder lower) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion remainder :=
  superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_blockNormLowerOn
    hlower hrem

/-- Concrete lower-envelope form of the reciprocal-768 extension criterion.
The remaining middle obligation is now exactly to place the genuine geometric
remainder below `superGaussianTwoCoreGenuineBlockNormLowerProfile 2`. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_profileLower
    {remainder : ℂ → ℝ → ℂ}
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderBelowOn
        superGaussianTwoCoreReciprocal768ScaleRegion remainder
        (superGaussianTwoCoreGenuineBlockNormLowerProfile 2)) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn 2
      superGaussianTwoCoreReciprocal768ScaleRegion remainder :=
  superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_lower
    superGaussianTwoCoreGenuineBlockNormLowerOn_two_reciprocal768 hrem

/-- Concrete finite-rectangle form of the reciprocal-768 extension criterion.
The remaining finite middle task is to bound the canonical geometric remainder
of the chosen rectangle below the certified positive two-core margin. -/
theorem superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_remainderBelow
    {K M : ℕ}
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderBelowOn
        superGaussianTwoCoreReciprocal768ScaleRegion
        (superGaussianFiniteGenuineRectangleRemainder 2 K M)
        (superGaussianTwoCoreGenuineBlockNormLowerProfile 2)) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianTwoCoreReciprocal768ScaleRegion s X →
        superGaussianFiniteGenuineRectangle 2 X s K M ≠ 0 := by
  intro s X hs
  rw [superGaussianFiniteGenuineRectangle_eq_extension]
  exact
    superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_profileLower
      hrem hs

/-- Explicit finite-sum upper-bound criterion for finite regularized genuine
rectangles.  This is the audit-ready finite middle target: prove the real sum
of address norms outside the certified `5 x 3` block is below the positive
two-core lower envelope. -/
theorem superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_normUpperBelow
    {K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M)
    (hupper :
      ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
        superGaussianTwoCoreReciprocal768ScaleRegion s X →
          superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s <
            superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianTwoCoreReciprocal768ScaleRegion s X →
        superGaussianFiniteGenuineRectangle 2 X s K M ≠ 0 :=
  superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_remainderBelow
    (by
      intro s X hs
      exact lt_of_le_of_lt
        (superGaussianFiniteGenuineRectangleRemainder_norm_le_upper
          hK hM X s)
        (hupper hs))

/-- The explicit finite remainder norm upper is zero on the minimal certified
`5 x 3` rectangle. -/
theorem superGaussianFiniteGenuineRectangleRemainderNormUpper_five_three_eq_zero
    (p : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangleRemainderNormUpper p 5 3 X s = 0 := by
  unfold superGaussianFiniteGenuineRectangleRemainderNormUpper
  simp

/-- The minimal finite rectangle also closes through the explicit norm-upper
criterion. -/
theorem superGaussianFiniteGenuineRectangle_five_three_ne_zero_of_normUpper :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianTwoCoreReciprocal768ScaleRegion s X →
        superGaussianFiniteGenuineRectangle 2 X s 5 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_normUpperBelow
    (by norm_num) (by norm_num)
    (by
      intro s X hs
      rw [superGaussianFiniteGenuineRectangleRemainderNormUpper_five_three_eq_zero]
      simpa using
        (superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768 hs))

/-- The minimal finite rectangle has zero canonical remainder, hence satisfies
the positive-margin remainder obligation on reciprocal-768. -/
theorem superGaussianFiniteGenuineRectangleRemainderBelowOn_five_three_reciprocal768 :
    SuperGaussianTwoCoreGenuineRemainderBelowOn
      superGaussianTwoCoreReciprocal768ScaleRegion
      (superGaussianFiniteGenuineRectangleRemainder 2 5 3)
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) := by
  intro s X hs
  rw [superGaussianFiniteGenuineRectangleRemainder_five_three_eq_zero]
  simpa using
    (superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768 hs)

/-- Closed finite-rectangle spelling of the certified two-core genuine block on
the reciprocal-768 region. -/
theorem superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_two_reciprocal768 :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianTwoCoreReciprocal768ScaleRegion s X →
        superGaussianFiniteGenuineRectangle 2 X s 5 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_remainderBelow
    superGaussianFiniteGenuineRectangleRemainderBelowOn_five_three_reciprocal768

/--
Two-core cutoff non-cancellation reduced to three normalized fiber-ratio
bounds.  This is a local sufficient criterion only; empirical checks show the
ratio hypotheses are too strong to be used as the global middle obligation.
-/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_fiber_ratio_bounds
    {s : ℂ} {X : ℝ} (hs : 0 < s.re) (hX : 0 < X)
    (h8 : ‖twoCoreCutoffFiber s X 8 / twoCoreCutoffFiber s X 4‖ ≤ 1)
    (h16 : ‖twoCoreCutoffFiber s X 16 / twoCoreCutoffFiber s X 4‖ ≤ 1)
    (h32 : ‖twoCoreCutoffFiber s X 32 / twoCoreCutoffFiber s X 4‖ ≤ 1) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 := by
  rw [rectangularExponentialGenuine_five_three_eq_twoCore_fibers]
  have hbase : twoCoreCutoffFiber s X 4 ≠ 0 :=
    twoCoreCutoffFiber_four_ne_zero hs hX
  have hprefix :
      1 +
          q s * (twoCoreCutoffFiber s X 8 /
            twoCoreCutoffFiber s X 4) +
          q s ^ 2 * (twoCoreCutoffFiber s X 16 /
            twoCoreCutoffFiber s X 4) +
          q s ^ 3 * (twoCoreCutoffFiber s X 32 /
            twoCoreCutoffFiber s X 4) ≠ 0 :=
    weightedQuartetPrefix_ne_zero_of_re_pos hs h8 h16 h32
  have hfiber :
      twoCoreCutoffFiber s X 4 +
          q s * twoCoreCutoffFiber s X 8 +
          q s ^ 2 * twoCoreCutoffFiber s X 16 +
          q s ^ 3 * twoCoreCutoffFiber s X 32 ≠ 0 := by
    intro hzero
    have hfactor :
        twoCoreCutoffFiber s X 4 *
          (1 +
              q s * (twoCoreCutoffFiber s X 8 /
                twoCoreCutoffFiber s X 4) +
              q s ^ 2 * (twoCoreCutoffFiber s X 16 /
                twoCoreCutoffFiber s X 4) +
              q s ^ 3 * (twoCoreCutoffFiber s X 32 /
                twoCoreCutoffFiber s X 4)) = 0 := by
      field_simp [hbase]
      exact hzero
    exact hprefix (mul_eq_zero.mp hfactor |>.resolve_left hbase)
  exact mul_ne_zero
    (mul_ne_zero
      (mul_ne_zero (by norm_num)
        (pow_ne_zero 2 (by
          unfold q verticalRatio
          exact complexDirichletDepthRatio_ne_zero s)))
      (exponentialCutoffWeight_ne_zero X 4))
    hfiber

/-- Uniform lower envelope for every finite C2 vertical depth cutoff `K >= 2`
in the right half-plane. -/
noncomputable def finiteDepthVerticalNormLower (s : ℂ) : ℝ :=
  ‖q s‖ ^ 2 * (1 - ‖q s‖) / (1 + ‖q s‖)

/-- Uniform lower envelope for raw finite genuine rectangles with only the
base odd core. -/
noncomputable def rectangularGenuineUniformDepthOneNormLower (s : ℂ) : ℝ :=
  2 * finiteDepthVerticalNormLower s

/-- Uniform lower envelope for raw finite genuine rectangles with odd cores
`1` and `3`. -/
noncomputable def rectangularGenuineUniformDepthThreeNormLower (s : ℂ) : ℝ :=
  2 * finiteDepthVerticalNormLower s *
    (1 - ‖complexDirichletCoeff s 3‖)

/-- The uniform vertical lower envelope is positive in the right half-plane. -/
theorem finiteDepthVerticalNormLower_pos_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    0 < finiteDepthVerticalNormLower s := by
  unfold finiteDepthVerticalNormLower
  have hq_ne : q s ≠ 0 := by
    unfold q verticalRatio
    exact complexDirichletDepthRatio_ne_zero s
  have hq_pos : 0 < ‖q s‖ := norm_pos_iff.mpr hq_ne
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_re_pos s hs
  have hnum_pos : 0 < ‖q s‖ ^ 2 * (1 - ‖q s‖) :=
    mul_pos (pow_pos hq_pos 2) (by linarith)
  have hden_pos : 0 < 1 + ‖q s‖ := by
    have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
    linarith
  exact div_pos hnum_pos hden_pos

/-- On the unit real strip, the uniform finite-depth vertical lower envelope
has a concrete positive floor. -/
theorem finiteDepthVerticalNormLower_ge_three_div_eighty_of_unit_strip
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    (3 / 80 : ℝ) ≤ finiteDepthVerticalNormLower s := by
  unfold finiteDepthVerticalNormLower
  let r : ℝ := ‖q s‖
  have hr1 : (1 / 4 : ℝ) ≤ r := by
    dsimp [r]
    exact q_norm_ge_quarter_of_re_le_one hsle
  have hr2 : r ≤ (1 / 2 : ℝ) := by
    dsimp [r]
    exact le_of_lt (q_norm_lt_half_of_re_pos hs)
  have hden_pos : 0 < 1 + r := by nlinarith
  rw [show ‖q s‖ ^ 2 * (1 - ‖q s‖) / (1 + ‖q s‖) =
      r ^ 2 * (1 - r) / (1 + r) by rfl]
  rw [le_div_iff₀ hden_pos]
  nlinarith [sq_nonneg (r - (1 / 4 : ℝ)),
    sq_nonneg (r - (1 / 2 : ℝ)), sq_nonneg r]

/-- Every finite vertical depth cutoff has the same explicit lower envelope.
This is stronger than mere nonvanishing and is the raw side of the
cutoff-to-raw genuine route. -/
theorem rectangularDepthFactor_norm_lower_bound_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    finiteDepthVerticalNormLower s ≤ ‖rectangularDepthFactor s K‖ := by
  unfold finiteDepthVerticalNormLower rectangularDepthFactor q
  exact finite_geometric_depth_sum_norm_lower_bound_of_norm_lt_one
    hK (verticalRatio_norm_lt_one_of_re_pos s hs)

/-- Explicit lower bound for the certified four-floor vertical factor. -/
noncomputable def quartetVerticalNormLower (s : ℂ) : ℝ :=
  ‖q s‖ ^ 2 * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

/-- Explicit lower bound for the certified `K = 5, M = 1` finite genuine block. -/
noncomputable def rectangularGenuineFiveOneNormLower (s : ℂ) : ℝ :=
  2 * quartetVerticalNormLower s

/-- Explicit lower bound for the certified `K = 5, M = 3` finite genuine block. -/
noncomputable def rectangularGenuineFiveThreeNormLower (s : ℂ) : ℝ :=
  2 * quartetVerticalNormLower s * (1 - ‖complexDirichletCoeff s 3‖)

/-- The four-floor finite depth factor has the explicit quartet lower bound. -/
theorem rectangularDepthFactor_five_norm_lower_bound_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    quartetVerticalNormLower s ≤ ‖rectangularDepthFactor s 5‖ := by
  rw [rectangularDepthFactor_five_eq_quartet]
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_re_pos s hs
  have hprefix :
      (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2) ≤
        ‖verticalQuartetPrefix (q s)‖ :=
    verticalQuartetPrefix_norm_lower_bound_of_norm_le_one
      (z := q s) (le_of_lt hq_lt)
  have hq2_nonneg : 0 ≤ ‖q s‖ ^ 2 := by positivity
  calc
    quartetVerticalNormLower s
        = ‖q s‖ ^ 2 * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2)) := by
            rfl
    _ ≤ ‖q s‖ ^ 2 * ‖verticalQuartetPrefix (q s)‖ := by
        exact mul_le_mul_of_nonneg_left hprefix hq2_nonneg
    _ = ‖q s ^ 2 * verticalQuartetPrefix (q s)‖ := by
        rw [norm_mul, norm_pow]

/-- The `M = 3` odd core has the explicit base-core lower bound. -/
theorem rectangularOddCoreSum_three_norm_lower_bound (s : ℂ) :
    1 - ‖complexDirichletCoeff s 3‖ ≤ ‖rectangularOddCoreSum s 3‖ := by
  rw [rectangularOddCoreSum_three_eq]
  have htri :
      ‖(1 : ℂ)‖ ≤
        ‖(1 : ℂ) + complexDirichletCoeff s 3‖ +
          ‖complexDirichletCoeff s 3‖ := by
    calc
      ‖(1 : ℂ)‖ =
          ‖((1 : ℂ) + complexDirichletCoeff s 3) -
            complexDirichletCoeff s 3‖ := by ring_nf
      _ ≤ ‖(1 : ℂ) + complexDirichletCoeff s 3‖ +
            ‖complexDirichletCoeff s 3‖ := norm_sub_le _ _
  norm_num at htri
  linarith

/-- The base-core raw genuine rectangle has a uniform explicit lower bound for
every finite depth cutoff `K >= 2`. -/
theorem rectangularGenuine_one_norm_lower_bound_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularGenuineUniformDepthOneNormLower s ≤
      ‖rectangularGenuine s K 1‖ := by
  have hdepth := rectangularDepthFactor_norm_lower_bound_of_re_pos hs hK
  rw [rectangularGenuine_eq_depth_core, rectangularOddCoreSum_one]
  calc
    rectangularGenuineUniformDepthOneNormLower s
        = 2 * finiteDepthVerticalNormLower s := by rfl
    _ ≤ 2 * ‖rectangularDepthFactor s K‖ := by
        exact mul_le_mul_of_nonneg_left hdepth (by norm_num)
    _ = ‖(2 : ℂ) * rectangularDepthFactor s K * 1‖ := by
        rw [norm_mul, norm_mul]
        norm_num

/-- The two-core raw genuine rectangle has a uniform explicit lower bound for
every finite depth cutoff `K >= 2`. -/
theorem rectangularGenuine_three_norm_lower_bound_of_re_pos
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularGenuineUniformDepthThreeNormLower s ≤
      ‖rectangularGenuine s K 3‖ := by
  have hdepth := rectangularDepthFactor_norm_lower_bound_of_re_pos hs hK
  have hodd := rectangularOddCoreSum_three_norm_lower_bound s
  have hodd_nonneg : 0 ≤ 1 - ‖complexDirichletCoeff s 3‖ := by
    have hlt := complexDirichletCoeff_three_norm_lt_one_of_re_pos hs
    linarith
  have hdepth_norm_nonneg : 0 ≤ ‖rectangularDepthFactor s K‖ := norm_nonneg _
  have hmul :
      finiteDepthVerticalNormLower s *
          (1 - ‖complexDirichletCoeff s 3‖) ≤
        ‖rectangularDepthFactor s K‖ * ‖rectangularOddCoreSum s 3‖ :=
    mul_le_mul hdepth hodd hodd_nonneg hdepth_norm_nonneg
  rw [rectangularGenuine_eq_depth_core]
  calc
    rectangularGenuineUniformDepthThreeNormLower s
        =
          2 * (finiteDepthVerticalNormLower s *
            (1 - ‖complexDirichletCoeff s 3‖)) := by
            unfold rectangularGenuineUniformDepthThreeNormLower
            ring
    _ ≤ 2 *
          (‖rectangularDepthFactor s K‖ * ‖rectangularOddCoreSum s 3‖) := by
        exact mul_le_mul_of_nonneg_left hmul (by norm_num)
    _ = ‖(2 : ℂ) * rectangularDepthFactor s K *
          rectangularOddCoreSum s 3‖ := by
        rw [norm_mul, norm_mul]
        norm_num
        ring

/-- Unit-strip lower bound for the uniform two-core raw envelope, with the
vertical geometry discharged to the concrete constant `3 / 80`. -/
theorem rectangularGenuineUniformDepthThreeNormLower_ge_unitStripCoreMargin
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    (3 / 40 : ℝ) *
        ((s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ))) ≤
      rectangularGenuineUniformDepthThreeNormLower s := by
  have hvertical :
      (3 / 80 : ℝ) ≤ finiteDepthVerticalNormLower s :=
    finiteDepthVerticalNormLower_ge_three_div_eighty_of_unit_strip hs hsle
  have hcore :
      (s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ)) ≤
        1 - ‖complexDirichletCoeff s 3‖ :=
    complexDirichletCoeff_three_core_margin_lower_bound_pointwise
      (le_of_lt hs)
  have hcore_nonneg :
      0 ≤ (s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ)) := by
    have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
    have hnum_nonneg : 0 ≤ s.re * Real.log (3 : ℝ) :=
      mul_nonneg (le_of_lt hs) (le_of_lt hlog3)
    have hden_pos : 0 < 1 + s.re * Real.log (3 : ℝ) := by
      nlinarith
    exact div_nonneg hnum_nonneg (le_of_lt hden_pos)
  have hvertical_nonneg : 0 ≤ finiteDepthVerticalNormLower s :=
    le_of_lt (finiteDepthVerticalNormLower_pos_of_re_pos hs)
  have hmul :
      (3 / 80 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ))) ≤
        finiteDepthVerticalNormLower s *
          (1 - ‖complexDirichletCoeff s 3‖) :=
    mul_le_mul hvertical hcore hcore_nonneg hvertical_nonneg
  calc
    (3 / 40 : ℝ) *
        ((s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ)))
        =
          2 * ((3 / 80 : ℝ) *
            ((s.re * Real.log (3 : ℝ)) /
              (1 + s.re * Real.log (3 : ℝ)))) := by ring
    _ ≤ 2 * (finiteDepthVerticalNormLower s *
          (1 - ‖complexDirichletCoeff s 3‖)) := by
        exact mul_le_mul_of_nonneg_left hmul (by norm_num)
    _ = rectangularGenuineUniformDepthThreeNormLower s := by
        unfold rectangularGenuineUniformDepthThreeNormLower
        ring

/-- Unit-strip lower bound for every raw two-core finite rectangle. -/
theorem rectangularGenuine_three_norm_lower_bound_of_unitStripCoreMargin
    {s : ℂ} {K : ℕ} (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) :
    (3 / 40 : ℝ) *
        ((s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ))) ≤
      ‖rectangularGenuine s K 3‖ :=
  le_trans
    (rectangularGenuineUniformDepthThreeNormLower_ge_unitStripCoreMargin
      hs hsle)
    (rectangularGenuine_three_norm_lower_bound_of_re_pos hs hK)

/-- Cutoff-to-raw criterion using the uniform raw lower envelope for the
base-core finite rectangle. -/
theorem superGaussianFiniteGenuineRectangle_one_ne_zero_of_cutoffResidual_lt_uniformRaw
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hK : 2 ≤ K)
    (hres :
      superGaussianFiniteGenuineCutoffResidualNormUpper p K 1 X s <
        rectangularGenuineUniformDepthOneNormLower s) :
    superGaussianFiniteGenuineRectangle p X s K 1 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw
    (lt_of_lt_of_le hres
      (rectangularGenuine_one_norm_lower_bound_of_re_pos hs hK))

/-- Cutoff-to-raw criterion using the uniform raw lower envelope for the
two-core finite rectangle. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hK : 2 ≤ K)
    (hres :
      superGaussianFiniteGenuineCutoffResidualNormUpper p K 3 X s <
        rectangularGenuineUniformDepthThreeNormLower s) :
    superGaussianFiniteGenuineRectangle p X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw
    (lt_of_lt_of_le hres
      (rectangularGenuine_three_norm_lower_bound_of_re_pos hs hK))

/-- Algebraic cutoff-to-raw criterion for the base-core finite rectangle. -/
theorem superGaussianFiniteGenuineRectangle_one_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hK : 2 ≤ K)
    (hX : 0 < X)
    (hupper :
      superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K 1 X s <
        rectangularGenuineUniformDepthOneNormLower s) :
    superGaussianFiniteGenuineRectangle p X s K 1 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_one_ne_zero_of_cutoffResidual_lt_uniformRaw
    hs hK
    (lt_of_le_of_lt
      (superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper
        hX s)
      hupper)

/-- Algebraic cutoff-to-raw criterion for the two-core finite rectangle. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hK : 2 ≤ K)
    (hX : 0 < X)
    (hupper :
      superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K 3 X s <
        rectangularGenuineUniformDepthThreeNormLower s) :
    superGaussianFiniteGenuineRectangle p X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw
    hs hK
    (lt_of_le_of_lt
      (superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper
        hX s)
      hupper)

/-- Unit-strip algebraic cutoff-to-raw criterion for the two-core finite
rectangle.  The remaining inequality contains only the explicit algebraic
residual sum and the scalar core-scale margin. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_algebraic_unitStrip
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K 3 X s <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteGenuineRectangle p X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw
    hs hK hX
    (lt_of_lt_of_le hupper
      (rectangularGenuineUniformDepthThreeNormLower_ge_unitStripCoreMargin
        hs hsle))

/-- Unit-strip dyadic scale upper for the finite two-core `p = 2` cutoff
residual.  The bound is independent of `s`: it uses only `‖q(s)‖ <= 1 / 2`,
`‖1‖ = 1`, `‖3^{-s}‖ <= 1`, and the address inequality `m <= 3`. -/
noncomputable def superGaussianFiniteTwoCoreUnitStripScaleUpper
    (K : ℕ) (X : ℝ) : ℝ :=
  ∑ a ∈ superGaussianFiniteGenuineAddressSet K 3,
    2 * ((1 / 2 : ℝ) ^ a.1) *
      ((((2 ^ a.1 * 3 : ℕ) : ℝ) / X) ^ 2)

/-- The two-core odd set is exactly `{1, 3}`. -/
theorem oddCoresUpTo_three_eq :
    oddCoresUpTo 3 = ({1, 3} : Finset ℕ) := by
  ext m
  constructor
  · intro hm
    rw [mem_oddCoresUpTo] at hm
    rcases hm with ⟨hle, hodd⟩
    rcases hodd with ⟨j, hj⟩
    have hm13 : m = 1 ∨ m = 3 := by omega
    rcases hm13 with rfl | rfl <;> simp
  · intro hm
    have hm13 : m = 1 ∨ m = 3 := by
      simpa using hm
    rcases hm13 with hm | hm
    · subst m
      rw [mem_oddCoresUpTo]
      exact ⟨by norm_num, ⟨0, by norm_num⟩⟩
    · subst m
      rw [mem_oddCoresUpTo]
      exact ⟨by norm_num, ⟨1, by norm_num⟩⟩

/-- The dyadic scale upper is just a depth sum; the two odd cores contribute
the same conservative address bound. -/
theorem superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_depthSum
    (K : ℕ) (X : ℝ) :
    superGaussianFiniteTwoCoreUnitStripScaleUpper K X =
      ∑ k ∈ Finset.Icc 2 K, 36 * ((2 : ℝ) ^ k) * X⁻¹ ^ 2 := by
  unfold superGaussianFiniteTwoCoreUnitStripScaleUpper
    superGaussianFiniteGenuineAddressSet
  rw [Finset.sum_product]
  rw [oddCoresUpTo_three_eq]
  simp only [one_div, inv_pow, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat,
    Finset.sum_const, Finset.mem_singleton, OfNat.one_ne_ofNat,
    not_false_eq_true, Finset.card_insert_of_notMem, Finset.card_singleton,
    Nat.reduceAdd, nsmul_eq_mul]
  apply Finset.sum_congr rfl
  intro k _hk
  field_simp [pow_ne_zero k (by norm_num : (2 : ℝ) ≠ 0)]
  ring_nf

/-- Closed form for the dyadic depth sum starting at C2 depth `2`. -/
theorem dyadic_depth_sum_Icc_two_closed
    {K : ℕ} (hK : 2 ≤ K) :
    (∑ k ∈ Finset.Icc 2 K, (2 : ℝ) ^ k) =
      (2 : ℝ) ^ (K + 1) - 4 := by
  have hIcc : Finset.Icc 2 K = Finset.Ico 2 (K + 1) := by
    ext k
    simp
  have htwo_ne : (2 : ℝ) ≠ 1 := by norm_num
  have hle : 2 ≤ K + 1 := by omega
  rw [hIcc]
  rw [geom_sum_Ico (x := (2 : ℝ)) htwo_ne hle]
  ring_nf

/-- Closed form of the finite two-core dyadic scale upper. -/
theorem superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_closedForm
    {K : ℕ} (hK : 2 ≤ K) (X : ℝ) :
    superGaussianFiniteTwoCoreUnitStripScaleUpper K X =
      36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2 := by
  rw [superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_depthSum]
  rw [← Finset.sum_mul]
  rw [← Finset.mul_sum]
  rw [dyadic_depth_sum_Icc_two_closed hK]

/-- In the two-core set `oddCoresUpTo 3`, every core coefficient has norm at
most `1` in the open right half-plane. -/
theorem complexDirichletCoeff_norm_le_one_of_mem_oddCoresUpTo_three
    {s : ℂ} {m : ℕ} (hs : 0 < s.re) (hm : m ∈ oddCoresUpTo 3) :
    ‖complexDirichletCoeff s m‖ ≤ 1 := by
  rw [mem_oddCoresUpTo] at hm
  rcases hm with ⟨hle, hodd⟩
  rcases hodd with ⟨j, hj⟩
  have hm13 : m = 1 ∨ m = 3 := by omega
  rcases hm13 with rfl | rfl
  · rw [complexDirichletCoeff_one, norm_one]
  · exact le_of_lt (complexDirichletCoeff_three_norm_lt_one_of_re_pos hs)

/-- Addresswise dyadic scale domination for the finite two-core algebraic
residual when the super-Gaussian profile is `p = 2`. -/
theorem superGaussianFiniteGenuineCutoffResidualAlgebraicTerm_le_unitStripScale
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X)
    {a : C2Address} (ha : a ∈ superGaussianFiniteGenuineAddressSet K 3) :
    2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
        (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2 ≤
      2 * ((1 / 2 : ℝ) ^ a.1) *
        ((((2 ^ a.1 * 3 : ℕ) : ℝ) / X) ^ 2) := by
  rw [superGaussianFiniteGenuineAddressSet, Finset.mem_product] at ha
  rcases ha with ⟨_hk, hm⟩
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hq_half : ‖q s‖ ≤ (1 / 2 : ℝ) :=
    le_of_lt (q_norm_lt_half_of_re_pos hs)
  have hqpow : ‖q s‖ ^ a.1 ≤ ((1 / 2 : ℝ) ^ a.1) :=
    pow_le_pow_left₀ hq_nonneg hq_half a.1
  have hcoeff : ‖complexDirichletCoeff s a.2‖ ≤ 1 :=
    complexDirichletCoeff_norm_le_one_of_mem_oddCoresUpTo_three hs hm
  have hcore_le : a.2 ≤ 3 := by
    rw [mem_oddCoresUpTo] at hm
    exact hm.1
  have haddr_nat : 2 ^ a.1 * a.2 ≤ 2 ^ a.1 * 3 := by
    exact Nat.mul_le_mul_left (2 ^ a.1) hcore_le
  have haddr_real :
      ((2 ^ a.1 * a.2 : ℕ) : ℝ) ≤
        ((2 ^ a.1 * 3 : ℕ) : ℝ) := by
    exact_mod_cast haddr_nat
  have haddr_div :
      ((2 ^ a.1 * a.2 : ℕ) : ℝ) / X ≤
        ((2 ^ a.1 * 3 : ℕ) : ℝ) / X :=
    div_le_div_of_nonneg_right haddr_real (le_of_lt hX)
  have haddr_div_nonneg :
      0 ≤ ((2 ^ a.1 * a.2 : ℕ) : ℝ) / X := by positivity
  have haddr_sq :
      (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2 ≤
        (((2 ^ a.1 * 3 : ℕ) : ℝ) / X) ^ 2 :=
    pow_le_pow_left₀ haddr_div_nonneg haddr_div 2
  have hcoeff_nonneg : 0 ≤ ‖complexDirichletCoeff s a.2‖ := norm_nonneg _
  have haddr_sq_nonneg :
      0 ≤ (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2 := by positivity
  have htwo_qpow :
      2 * ‖q s‖ ^ a.1 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) :=
    mul_le_mul_of_nonneg_left hqpow (by norm_num)
  have hreplace_q :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) *
          ‖complexDirichletCoeff s a.2‖ :=
    mul_le_mul_of_nonneg_right htwo_qpow hcoeff_nonneg
  have htwo_half_nonneg : 0 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) := by positivity
  have hreplace_coeff :
      2 * ((1 / 2 : ℝ) ^ a.1) * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    mul_le_mul_of_nonneg_left hcoeff htwo_half_nonneg
  have hreplace_left :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    le_trans hreplace_q hreplace_coeff
  calc
    2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
        (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2
        ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) *
            (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2 := by
          exact mul_le_mul_of_nonneg_right hreplace_left haddr_sq_nonneg
    _ ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) *
            (((2 ^ a.1 * 3 : ℕ) : ℝ) / X) ^ 2 := by
          exact mul_le_mul_of_nonneg_left haddr_sq (by positivity)
    _ = 2 * ((1 / 2 : ℝ) ^ a.1) *
            ((((2 ^ a.1 * 3 : ℕ) : ℝ) / X) ^ 2) := by ring

/-- The two-core `p = 2` algebraic residual is bounded by the dyadic scale
upper, eliminating the point `s` from the upper side of the finite obligation. -/
theorem superGaussianFiniteGenuineCutoffResidualAlgebraicUpper_two_three_le_unitStripScale
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hX : 0 < X) :
    superGaussianFiniteGenuineCutoffResidualAlgebraicUpper 2 K 3 X s ≤
      superGaussianFiniteTwoCoreUnitStripScaleUpper K X := by
  unfold superGaussianFiniteGenuineCutoffResidualAlgebraicUpper
    superGaussianFiniteTwoCoreUnitStripScaleUpper
  exact Finset.sum_le_sum (fun a ha =>
    superGaussianFiniteGenuineCutoffResidualAlgebraicTerm_le_unitStripScale
      hs hX ha)

/-- Quantitative cutoff-to-raw lower bound for the finite two-core
super-Gaussian rectangle.  This upgrades the qualitative nonzero criterion to
a reusable norm margin. -/
theorem superGaussianFiniteGenuineRectangle_three_norm_lower_of_cutoffResidualUpper
    {p K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hK : 2 ≤ K) :
    rectangularGenuineUniformDepthThreeNormLower s -
        superGaussianFiniteGenuineCutoffResidualNormUpper p K 3 X s ≤
      ‖superGaussianFiniteGenuineRectangle p X s K 3‖ := by
  have hraw :
      rectangularGenuineUniformDepthThreeNormLower s ≤
        ‖rectangularGenuine s K 3‖ :=
    rectangularGenuine_three_norm_lower_bound_of_re_pos hs hK
  have hdist :
      ‖superGaussianFiniteGenuineRectangle p X s K 3 -
          rectangularGenuine s K 3‖ ≤
        superGaussianFiniteGenuineCutoffResidualNormUpper p K 3 X s :=
    superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_norm_le_cutoffResidualUpper
      p X s K 3
  have htri :
      ‖rectangularGenuine s K 3‖ ≤
        ‖superGaussianFiniteGenuineRectangle p X s K 3‖ +
          ‖superGaussianFiniteGenuineRectangle p X s K 3 -
            rectangularGenuine s K 3‖ := by
    calc
      ‖rectangularGenuine s K 3‖
          = ‖superGaussianFiniteGenuineRectangle p X s K 3 -
              (superGaussianFiniteGenuineRectangle p X s K 3 -
                rectangularGenuine s K 3)‖ := by ring_nf
      _ ≤ ‖superGaussianFiniteGenuineRectangle p X s K 3‖ +
            ‖superGaussianFiniteGenuineRectangle p X s K 3 -
              rectangularGenuine s K 3‖ := norm_sub_le _ _
  have hmain :
      rectangularGenuineUniformDepthThreeNormLower s ≤
        ‖superGaussianFiniteGenuineRectangle p X s K 3‖ +
          superGaussianFiniteGenuineCutoffResidualNormUpper p K 3 X s :=
    le_trans hraw (le_trans htri (add_le_add (le_refl _) hdist))
  linarith

/-- Unit-strip finite two-core lower profile: the explicit raw scalar margin
minus the dyadic cutoff residual scale upper. -/
noncomputable def superGaussianFiniteTwoCoreUnitStripNormLower
    (K : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  (3 / 40 : ℝ) *
      ((s.re * Real.log (3 : ℝ)) /
        (1 + s.re * Real.log (3 : ℝ))) -
    superGaussianFiniteTwoCoreUnitStripScaleUpper K X

/-- The unit-strip finite two-core lower profile is a genuine norm lower bound
for the full finite-depth two-core rectangle. -/
theorem superGaussianFiniteGenuineRectangle_three_norm_lower_of_unitStripScale
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X) :
    superGaussianFiniteTwoCoreUnitStripNormLower K X s ≤
      ‖superGaussianFiniteGenuineRectangle 2 X s K 3‖ := by
  have hres_le_scale :
      superGaussianFiniteGenuineCutoffResidualNormUpper 2 K 3 X s ≤
        superGaussianFiniteTwoCoreUnitStripScaleUpper K X :=
    le_trans
      (superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper
        hX s)
      (superGaussianFiniteGenuineCutoffResidualAlgebraicUpper_two_three_le_unitStripScale
        hs hX)
  have hraw_lower :=
    superGaussianFiniteGenuineRectangle_three_norm_lower_of_cutoffResidualUpper
      (p := 2) (K := K) (X := X) hs hK
  have hmargin :
      (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ))) ≤
        rectangularGenuineUniformDepthThreeNormLower s :=
    rectangularGenuineUniformDepthThreeNormLower_ge_unitStripCoreMargin
      hs hsle
  unfold superGaussianFiniteTwoCoreUnitStripNormLower
  linarith

/-- Positivity criterion for the finite full-depth two-core lower profile. -/
theorem superGaussianFiniteTwoCoreUnitStripNormLower_pos_of_scaleUpper_lt_margin
    {K : ℕ} {X : ℝ} {s : ℂ}
    (hupper :
      superGaussianFiniteTwoCoreUnitStripScaleUpper K X <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    0 < superGaussianFiniteTwoCoreUnitStripNormLower K X s := by
  unfold superGaussianFiniteTwoCoreUnitStripNormLower
  linarith

/-- If a complex block has norm at least `lower` and the added remainder has
norm below `lower`, then the block-plus-remainder sum cannot vanish. -/
theorem add_ne_zero_of_remainder_norm_lt_lower_bound
    {block remainder : ℂ} {lower : ℝ}
    (hlower : lower ≤ ‖block‖) (hrem : ‖remainder‖ < lower) :
    block + remainder ≠ 0 := by
  intro hzero
  have hblock_eq : block = -remainder := by
    calc
      block = block + remainder - remainder := by ring
      _ = 0 - remainder := by rw [hzero]
      _ = -remainder := by ring
  have hnorm : ‖block‖ = ‖remainder‖ := by
    rw [hblock_eq, norm_neg]
  linarith

/-- Minimal bookkeeping lemma: three visible saldos cannot cancel a certified
block if the sum of their norms is smaller than the block norm. -/
theorem add_three_ne_zero_of_norm_sum_lt
    {block r1 r2 r3 : ℂ}
    (hbudget : ‖r1‖ + ‖r2‖ + ‖r3‖ < ‖block‖) :
    block + r1 + r2 + r3 ≠ 0 := by
  have hrem :
      ‖r1 + r2 + r3‖ < ‖block‖ := by
    have htri :
        ‖r1 + r2 + r3‖ ≤ ‖r1‖ + ‖r2‖ + ‖r3‖ := by
      have h12 : ‖r1 + r2‖ ≤ ‖r1‖ + ‖r2‖ := norm_add_le r1 r2
      calc
        ‖r1 + r2 + r3‖ = ‖(r1 + r2) + r3‖ := by ring_nf
        _ ≤ ‖r1 + r2‖ + ‖r3‖ := norm_add_le _ _
        _ ≤ (‖r1‖ + ‖r2‖) + ‖r3‖ := by linarith
        _ = ‖r1‖ + ‖r2‖ + ‖r3‖ := by ring
    exact lt_of_le_of_lt htri hbudget
  have hnonzero :
      block + (r1 + r2 + r3) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound
      (le_refl ‖block‖) hrem
  simpa [add_assoc] using hnonzero

/-- Quantitative reverse-triangle lower bound: if a certified block has norm at
least `lower` and the added remainder has norm at most `upper`, then the sum
retains at least `lower - upper` norm. -/
theorem norm_add_lower_bound_of_remainder_norm_le
    {block remainder : ℂ} {lower upper : ℝ}
    (hlower : lower ≤ ‖block‖) (hrem : ‖remainder‖ ≤ upper) :
    lower - upper ≤ ‖block + remainder‖ := by
  have htri :
      ‖block‖ ≤ ‖block + remainder‖ + ‖remainder‖ := by
    calc
      ‖block‖
          = ‖block + remainder - remainder‖ := by ring_nf
      _ ≤ ‖block + remainder‖ + ‖remainder‖ := norm_sub_le _ _
  linarith

/-- Four-term triangular upper bound used by the middle ledger: every debt is
recorded at its worst possible norm, with no phase optimism. -/
theorem norm_add_four_le (a b c d : ℂ) :
    ‖a + b + c + d‖ ≤ ‖a‖ + ‖b‖ + ‖c‖ + ‖d‖ := by
  calc
    ‖a + b + c + d‖ = ‖((a + b) + c) + d‖ := by ring_nf
    _ ≤ ‖(a + b) + c‖ + ‖d‖ := norm_add_le _ _
    _ ≤ (‖a + b‖ + ‖c‖) + ‖d‖ := by
          linarith [norm_add_le (a + b) c]
    _ ≤ ((‖a‖ + ‖b‖) + ‖c‖) + ‖d‖ := by
          linarith [norm_add_le a b]
    _ = ‖a‖ + ‖b‖ + ‖c‖ + ‖d‖ := by ring

/-- The concrete quartet has the canonical C2 lower envelope:
`K₂` times the four-floor vertical prefix is bounded below by the quartet
margin used in `quartet_dominance`. -/
theorem c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2ExpandedQuartetK2Margin s ≤
      ‖c2ConcreteAntiMiracleQuartet s‖ := by
  have hprefix :
      (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2) ≤
        ‖verticalQuartetPrefix (q s)‖ :=
    verticalQuartetPrefix_norm_lower_bound_of_offCriticalStrip s hoff
  have hk2_nonneg : 0 ≤ c2QuartetBulkK2Lower s := by
    rw [c2QuartetBulkK2Lower_eq_norm]
    exact norm_nonneg _
  calc
    c2ExpandedQuartetK2Margin s =
        c2QuartetBulkK2Lower s *
          ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2)) := by
          rfl
    _ ≤ c2QuartetBulkK2Lower s * ‖verticalQuartetPrefix (q s)‖ := by
          exact mul_le_mul_of_nonneg_left hprefix hk2_nonneg
    _ = ‖c2QuartetBulkK2 s‖ * ‖verticalQuartetPrefix (q s)‖ := by
          rw [c2QuartetBulkK2Lower_eq_norm]
    _ = ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ := by
          rw [norm_mul]
    _ = ‖c2ConcreteAntiMiracleQuartet s‖ := by
          rfl

theorem c2ExpandedQuartetK2Margin_pos_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    0 < c2ExpandedQuartetK2Margin s := by
  have hq_ne : q s ≠ 0 := by
    unfold q verticalRatio
    exact complexDirichletDepthRatio_ne_zero s
  have hq_pos : 0 < ‖q s‖ := norm_pos_iff.mpr hq_ne
  have hq_lt : ‖q s‖ < 1 :=
    q_norm_lt_one_of_offCriticalStrip s hoff
  have hk2_pos : 0 < c2QuartetBulkK2Lower s := by
    unfold c2QuartetBulkK2Lower
    exact pow_pos hq_pos 2
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith
  have hquad_pos : 0 < 1 + ‖q s‖ ^ 2 := by
    positivity
  unfold c2ExpandedQuartetK2Margin
  exact mul_pos hk2_pos (mul_pos hgap_pos hquad_pos)

theorem c2ConcreteAntiMiracleQuartet_norm_pos_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    0 < ‖c2ConcreteAntiMiracleQuartet s‖ := by
  exact lt_of_lt_of_le
    (c2ExpandedQuartetK2Margin_pos_of_offCriticalStrip hoff)
    (c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin hoff)

theorem c2ConcreteAntiMiracleQuartet_ne_zero_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2ConcreteAntiMiracleQuartet s ≠ 0 :=
  norm_pos_iff.mp
    (c2ConcreteAntiMiracleQuartet_norm_pos_of_offCriticalStrip hoff)

theorem c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData
      coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData
      coreCutoff K M}
    {s : ℂ}
    (hs : s ∈ c2ExpandedScalarMiddleRegion near edge) :
    c2ExpandedQuartetK2Margin s ≤
      ‖c2ConcreteAntiMiracleQuartet s‖ :=
  c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin hs.1

theorem c2ExpandedQuartetK2Margin_pos_of_mem_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData
      coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData
      coreCutoff K M}
    {s : ℂ}
    (hs : s ∈ c2ExpandedScalarMiddleRegion near edge) :
    0 < c2ExpandedQuartetK2Margin s :=
  c2ExpandedQuartetK2Margin_pos_of_offCriticalStrip hs.1

theorem c2ConcreteAntiMiracleQuartet_norm_pos_of_mem_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData
      coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData
      coreCutoff K M}
    {s : ℂ}
    (hs : s ∈ c2ExpandedScalarMiddleRegion near edge) :
    0 < ‖c2ConcreteAntiMiracleQuartet s‖ :=
  c2ConcreteAntiMiracleQuartet_norm_pos_of_offCriticalStrip hs.1

theorem c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData
      coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData
      coreCutoff K M}
    {s : ℂ}
    (hs : s ∈ c2ExpandedScalarMiddleRegion near edge) :
    c2ConcreteAntiMiracleQuartet s ≠ 0 :=
  c2ConcreteAntiMiracleQuartet_ne_zero_of_offCriticalStrip hs.1

/-- The note-style middle residual is bounded by the four visible debts:
vertical debt, tilt, horizontal, and cutoff. -/
theorem c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltUpper horizontalUpper cutoffUpper : ℂ → ℝ}
    {s : ℂ} (hs : 0 < s.re)
    (htilt :
      ‖c2TiltRegularizedResidual
          (c2SeededTiltLayerResidual tiltSeed) s‖ ≤ tiltUpper s)
    (hhorizontal :
      ‖c2ConcreteOddHorizontalDefect coreCutoff s‖ ≤ horizontalUpper s)
    (hcutoff :
      ‖c2ConcreteCutoffError K M s‖ ≤ cutoffUpper s) :
    ‖c2ConcreteAntiMiracleTail tiltSeed coreCutoff K M s‖ ≤
      c2QuartetVerticalTailUpper s +
        tiltUpper s + horizontalUpper s + cutoffUpper s := by
  rw [c2ConcreteAntiMiracleTail_eq_expanded]
  have htri :
      ‖c2QuartetVerticalTail s +
          c2TiltRegularizedResidual
            (c2SeededTiltLayerResidual tiltSeed) s +
          c2ConcreteOddHorizontalDefect coreCutoff s +
          c2ConcreteCutoffError K M s‖ ≤
        ‖c2QuartetVerticalTail s‖ +
          ‖c2TiltRegularizedResidual
            (c2SeededTiltLayerResidual tiltSeed) s‖ +
          ‖c2ConcreteOddHorizontalDefect coreCutoff s‖ +
          ‖c2ConcreteCutoffError K M s‖ :=
    norm_add_four_le _ _ _ _
  have hvertical :
      ‖c2QuartetVerticalTail s‖ ≤ c2QuartetVerticalTailUpper s :=
    c2QuartetVerticalTail_norm_le_upper_of_re_pos s hs
  linarith

/-- Finite middle ledger: if the sum of the four visible debts is below the
canonical quartet lower envelope, then the concrete genuine finite model cannot
vanish. -/
theorem c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltUpper horizontalUpper cutoffUpper : ℂ → ℝ}
    {s : ℂ} (hoff : offCriticalStrip s)
    (htilt :
      ‖c2TiltRegularizedResidual
          (c2SeededTiltLayerResidual tiltSeed) s‖ ≤ tiltUpper s)
    (hhorizontal :
      ‖c2ConcreteOddHorizontalDefect coreCutoff s‖ ≤ horizontalUpper s)
    (hcutoff :
      ‖c2ConcreteCutoffError K M s‖ ≤ cutoffUpper s)
    (hdominance :
      c2QuartetVerticalTailUpper s +
        tiltUpper s + horizontalUpper s + cutoffUpper s <
          c2ExpandedQuartetK2Margin s) :
    c2ConcreteAntiMiracleFiniteModel tiltSeed coreCutoff K M s ≠ 0 := by
  have hsplit :=
    c2ConcreteAntiMiracleFiniteModel_eq_quartet_add_tail_of_re_pos
      tiltSeed coreCutoff K M hoff.1
  rw [hsplit]
  exact
    add_ne_zero_of_remainder_norm_lt_lower_bound
      (c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin hoff)
      (lt_of_le_of_lt
        (c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
          (tiltSeed := tiltSeed) (coreCutoff := coreCutoff)
          (K := K) (M := M) (s := s)
          hoff.1 htilt hhorizontal hcutoff)
        hdominance)

/-- A norm lower bound that holds eventually along a convergent complex
sequence passes to the limit. -/
theorem norm_lower_bound_of_tendsto_of_eventually_norm_lower
    {u : ℕ → ℂ} {z : ℂ} {lower : ℝ}
    (htendsto : Filter.Tendsto u Filter.atTop (nhds z))
    (hlower_eventually : ∀ᶠ n : ℕ in Filter.atTop, lower ≤ ‖u n‖) :
    lower ≤ ‖z‖ := by
  by_contra hnot
  have hlt : ‖z‖ < lower := lt_of_not_ge hnot
  let eps : ℝ := (lower - ‖z‖) / 2
  have heps_pos : 0 < eps := by
    dsimp [eps]
    linarith
  have hclose_eventually :
      ∀ᶠ n : ℕ in Filter.atTop, dist (u n) z < eps :=
    (Metric.tendsto_nhds.mp htendsto) eps heps_pos
  rw [Filter.eventually_atTop] at hclose_eventually
  rw [Filter.eventually_atTop] at hlower_eventually
  obtain ⟨Nclose, hNclose⟩ := hclose_eventually
  obtain ⟨Nlower, hNlower⟩ := hlower_eventually
  let N : ℕ := max Nclose Nlower
  have hNc : Nclose ≤ N := le_max_left Nclose Nlower
  have hNl : Nlower ≤ N := le_max_right Nclose Nlower
  have hclose : dist (u N) z < eps := hNclose N hNc
  have hlower : lower ≤ ‖u N‖ := hNlower N hNl
  have hnormdiff : ‖u N - z‖ < eps := by
    simpa [dist_eq_norm] using hclose
  have htri : ‖u N‖ ≤ ‖z‖ + ‖u N - z‖ := by
    calc
      ‖u N‖ = ‖z + (u N - z)‖ := by ring_nf
      _ ≤ ‖z‖ + ‖u N - z‖ := norm_add_le _ _
  have hupper : ‖u N‖ < ‖z‖ + eps := by linarith
  have hzeps : ‖z‖ + eps < lower := by
    dsimp [eps]
    linarith
  linarith

/-- Full-depth finite two-core extension: use the whole finite `K x 3`
regularized rectangle as the certified block, instead of only the minimal
`5 x 3` block. -/
noncomputable def superGaussianFiniteTwoCoreFullDepthExtension
    (K : ℕ) (remainder : ℂ → ℝ → ℂ) (X : ℝ) (s : ℂ) : ℂ :=
  superGaussianFiniteGenuineRectangle 2 X s K 3 + remainder s X

/-- Full-depth finite two-core extension criterion on the unit strip.  This is
the natural next accounting shape: prove the post-`K` remainder is below the
full finite block margin. -/
theorem superGaussianFiniteTwoCoreFullDepthExtension_ne_zero_of_remainder_norm_lt_unitStripLower
    {K : ℕ} {remainder : ℂ → ℝ → ℂ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hX : 0 < X)
    (hrem :
      ‖remainder s X‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s) :
    superGaussianFiniteTwoCoreFullDepthExtension K remainder X s ≠ 0 := by
  unfold superGaussianFiniteTwoCoreFullDepthExtension
  exact add_ne_zero_of_remainder_norm_lt_lower_bound
    (superGaussianFiniteGenuineRectangle_three_norm_lower_of_unitStripScale
      hs hsle hK hX)
    hrem

/-- Unit-strip dyadic tail upper for the finite two-core remainder outside the
certified `5 x 3` block.  Unlike the cutoff residual scale upper, this bounds
the actual geometric remainder terms and therefore does not decay with `X`. -/
noncomputable def superGaussianFiniteTwoCoreRemainderUnitStripTailUpper
    (K : ℕ) : ℝ :=
  ∑ a ∈
      superGaussianFiniteGenuineAddressSet K 3 \
        superGaussianFiniteGenuineAddressSet 5 3,
    2 * ((1 / 2 : ℝ) ^ a.1)

/-- Every positive Dirichlet core has norm at most `1` in the open right
half-plane. -/
theorem complexDirichletCoeff_norm_le_one_of_re_pos_of_one_le
    {s : ℂ} (hs : 0 < s.re) {m : ℕ} (hm : 1 ≤ m) :
    ‖complexDirichletCoeff s m‖ ≤ 1 := by
  unfold complexDirichletCoeff
  have hre :
      (-(s * (Real.log ((m : Nat) : ℝ) : ℂ))).re =
        -(s.re * Real.log (m : ℝ)) := by
    simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero]
  rw [Complex.norm_exp, hre]
  have hlog_nonneg : 0 ≤ Real.log (m : ℝ) := by
    exact Real.log_nonneg (by exact_mod_cast hm)
  have hmul_nonneg : 0 ≤ s.re * Real.log (m : ℝ) := by
    exact mul_nonneg (le_of_lt hs) hlog_nonneg
  exact Real.exp_le_one_iff.mpr (by linarith)

/-- The quadratic super-Gaussian cutoff never enlarges norms. -/
theorem superGaussianCutoffWeight_two_norm_le_one
    (X : ℝ) (n : ℕ) :
    ‖superGaussianCutoffWeight 2 X n‖ ≤ 1 := by
  rw [superGaussianCutoffWeight_norm]
  have hsq_nonneg : 0 ≤ (((n : ℝ) / X) ^ 2) := by
    exact sq_nonneg _
  exact Real.exp_le_one_iff.mpr (by linarith)

/-- Any positive-core super-Gaussian address term is bounded by its dyadic
unit-strip depth weight. -/
theorem superGaussianGenuineAddressTermNorm_le_unitStripCoreTerm
    {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    {a : C2Address} (hm : 1 ≤ a.2) :
    superGaussianGenuineAddressTermNorm 2 X s a ≤
      2 * ((1 / 2 : ℝ) ^ a.1) := by
  unfold superGaussianGenuineAddressTermNorm
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hq_half : ‖q s‖ ≤ (1 / 2 : ℝ) :=
    le_of_lt (q_norm_lt_half_of_re_pos hs)
  have hqpow : ‖q s‖ ^ a.1 ≤ ((1 / 2 : ℝ) ^ a.1) :=
    pow_le_pow_left₀ hq_nonneg hq_half a.1
  have hcoeff : ‖complexDirichletCoeff s a.2‖ ≤ 1 :=
    complexDirichletCoeff_norm_le_one_of_re_pos_of_one_le hs hm
  have hcutoff :
      ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ ≤ 1 :=
    superGaussianCutoffWeight_two_norm_le_one X (2 ^ a.1 * a.2)
  have hcoeff_nonneg : 0 ≤ ‖complexDirichletCoeff s a.2‖ := norm_nonneg _
  have hcutoff_nonneg :
      0 ≤ ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ :=
    norm_nonneg _
  have htwo_qpow :
      2 * ‖q s‖ ^ a.1 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) :=
    mul_le_mul_of_nonneg_left hqpow (by norm_num)
  have hreplace_q :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) *
          ‖complexDirichletCoeff s a.2‖ :=
    mul_le_mul_of_nonneg_right htwo_qpow hcoeff_nonneg
  have htwo_half_nonneg : 0 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) := by
    positivity
  have hreplace_coeff :
      2 * ((1 / 2 : ℝ) ^ a.1) * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    mul_le_mul_of_nonneg_left hcoeff htwo_half_nonneg
  have hreplace_left :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    le_trans hreplace_q hreplace_coeff
  calc
    2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
        ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖
        ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) *
            ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ :=
          mul_le_mul_of_nonneg_right hreplace_left hcutoff_nonneg
    _ ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) * 1 := by
          exact mul_le_mul_of_nonneg_left hcutoff
            (by positivity)
    _ = 2 * ((1 / 2 : ℝ) ^ a.1) := by ring

/-- One finite two-core super-Gaussian address term is bounded by its dyadic
unit-strip tail weight. -/
theorem superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    {a : C2Address} (ha : a ∈ superGaussianFiniteGenuineAddressSet K 3) :
    superGaussianGenuineAddressTermNorm 2 X s a ≤
      2 * ((1 / 2 : ℝ) ^ a.1) := by
  rw [superGaussianFiniteGenuineAddressSet, Finset.mem_product] at ha
  rcases ha with ⟨_hk, hm⟩
  unfold superGaussianGenuineAddressTermNorm
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hq_half : ‖q s‖ ≤ (1 / 2 : ℝ) :=
    le_of_lt (q_norm_lt_half_of_re_pos hs)
  have hqpow : ‖q s‖ ^ a.1 ≤ ((1 / 2 : ℝ) ^ a.1) :=
    pow_le_pow_left₀ hq_nonneg hq_half a.1
  have hcoeff : ‖complexDirichletCoeff s a.2‖ ≤ 1 :=
    complexDirichletCoeff_norm_le_one_of_mem_oddCoresUpTo_three hs hm
  have hcutoff :
      ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ ≤ 1 := by
    rw [superGaussianCutoffWeight_norm]
    have hsq_nonneg :
        0 ≤ (((2 ^ a.1 * a.2 : ℕ) : ℝ) / X) ^ 2 := by
      exact sq_nonneg _
    exact Real.exp_le_one_iff.mpr (by linarith)
  have hcoeff_nonneg : 0 ≤ ‖complexDirichletCoeff s a.2‖ := norm_nonneg _
  have hcutoff_nonneg :
      0 ≤ ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ :=
    norm_nonneg _
  have htwo_qpow :
      2 * ‖q s‖ ^ a.1 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) :=
    mul_le_mul_of_nonneg_left hqpow (by norm_num)
  have hreplace_q :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) *
          ‖complexDirichletCoeff s a.2‖ :=
    mul_le_mul_of_nonneg_right htwo_qpow hcoeff_nonneg
  have htwo_half_nonneg : 0 ≤ 2 * ((1 / 2 : ℝ) ^ a.1) := by
    positivity
  have hreplace_coeff :
      2 * ((1 / 2 : ℝ) ^ a.1) * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    mul_le_mul_of_nonneg_left hcoeff htwo_half_nonneg
  have hreplace_left :
      2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ ≤
        2 * ((1 / 2 : ℝ) ^ a.1) * 1 :=
    le_trans hreplace_q hreplace_coeff
  calc
    2 * ‖q s‖ ^ a.1 * ‖complexDirichletCoeff s a.2‖ *
        ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖
        ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) *
            ‖superGaussianCutoffWeight 2 X (2 ^ a.1 * a.2)‖ := by
          exact mul_le_mul_of_nonneg_right hreplace_left hcutoff_nonneg
    _ ≤ (2 * ((1 / 2 : ℝ) ^ a.1) * 1) * 1 := by
          exact mul_le_mul_of_nonneg_left hcutoff (by positivity)
    _ = 2 * ((1 / 2 : ℝ) ^ a.1) := by ring

/-- The canonical finite two-core remainder upper is dominated by the dyadic
unit-strip tail upper. -/
theorem superGaussianFiniteGenuineRectangleRemainderNormUpper_two_three_le_unitStripTailUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K 3 X s ≤
      superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K := by
  unfold superGaussianFiniteGenuineRectangleRemainderNormUpper
    superGaussianFiniteTwoCoreRemainderUnitStripTailUpper
  exact Finset.sum_le_sum (fun a ha => by
    have haK : a ∈ superGaussianFiniteGenuineAddressSet K 3 :=
      (Finset.mem_sdiff.mp ha).1
    exact
      superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm
        hs haK)

/-- The dyadic tail upper is zero for the certified minimal `5 x 3` block. -/
theorem superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_five_eq_zero :
    superGaussianFiniteTwoCoreRemainderUnitStripTailUpper 5 = 0 := by
  unfold superGaussianFiniteTwoCoreRemainderUnitStripTailUpper
  simp

/-- For `M = 3`, removing the certified `5 x 3` block leaves exactly the
depth tail `6..K` with the same two odd cores. -/
theorem superGaussianFiniteGenuineAddressSet_three_sdiff_five_three_eq_depthTail
    {K : ℕ} :
    superGaussianFiniteGenuineAddressSet K 3 \
        superGaussianFiniteGenuineAddressSet 5 3 =
      Finset.Icc 6 K ×ˢ oddCoresUpTo 3 := by
  ext a
  constructor
  · intro ha
    simp only [superGaussianFiniteGenuineAddressSet, Finset.mem_sdiff,
      Finset.mem_product, Finset.mem_Icc] at ha ⊢
    rcases ha with ⟨⟨⟨h2, hK⟩, hm⟩, hnot⟩
    refine ⟨⟨?_, hK⟩, hm⟩
    by_contra hlt
    have hle5 : a.1 ≤ 5 := by omega
    exact hnot ⟨⟨h2, hle5⟩, hm⟩
  · intro ha
    simp only [superGaussianFiniteGenuineAddressSet, Finset.mem_sdiff,
      Finset.mem_product, Finset.mem_Icc] at ha ⊢
    rcases ha with ⟨⟨h6, hK⟩, hm⟩
    refine ⟨⟨⟨by omega, hK⟩, hm⟩, ?_⟩
    rintro ⟨⟨_h2, h5⟩, _hm⟩
    omega

/-- Depth-sum form of the finite two-core dyadic tail upper. -/
theorem superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_eq_depthSum
    (K : ℕ) :
    superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K =
      ∑ k ∈ Finset.Icc 6 K, 4 * ((1 / 2 : ℝ) ^ k) := by
  unfold superGaussianFiniteTwoCoreRemainderUnitStripTailUpper
  rw [superGaussianFiniteGenuineAddressSet_three_sdiff_five_three_eq_depthTail]
  rw [Finset.sum_product]
  rw [oddCoresUpTo_three_eq]
  simp only [one_div, inv_pow, Finset.sum_const, Finset.mem_singleton,
    OfNat.one_ne_ofNat, not_false_eq_true, Finset.card_insert_of_notMem,
    Finset.card_singleton, Nat.reduceAdd, nsmul_eq_mul, Nat.cast_ofNat]
  apply Finset.sum_congr rfl
  intro k _hk
  ring

/-- Uniform dyadic cap for the finite two-core remainder tail outside the
certified `5 x 3` block. -/
theorem superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_le_one_eighth
    (K : ℕ) :
    superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K ≤ (1 / 8 : ℝ) := by
  rw [superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_eq_depthSum]
  by_cases hK6 : 6 ≤ K
  · have hIcc : Finset.Icc 6 K = Finset.Ico 6 (K + 1) := by
      ext k
      simp
    rw [hIcc]
    rw [← Finset.mul_sum]
    have hhalf_ne : (1 / 2 : ℝ) ≠ 1 := by norm_num
    have hle : 6 ≤ K + 1 := by omega
    rw [geom_sum_Ico (x := (1 / 2 : ℝ)) hhalf_ne hle]
    have hpow_nonneg : 0 ≤ (1 / 2 : ℝ) ^ (K + 1) := by positivity
    have hpowK_nonneg : 0 ≤ (1 / 2 : ℝ) ^ K := by positivity
    ring_nf
    nlinarith
  · have hempty : Finset.Icc 6 K = ∅ := by
      exact Finset.Icc_eq_empty_of_lt (by omega)
    simp [hempty]

/-- Monotonicity of finite genuine address rectangles in the depth cutoff. -/
theorem superGaussianFiniteGenuineAddressSet_subset_of_depth_le
    {K L M : ℕ} (hKL : K ≤ L) :
    superGaussianFiniteGenuineAddressSet K M ⊆
      superGaussianFiniteGenuineAddressSet L M := by
  unfold superGaussianFiniteGenuineAddressSet
  exact Finset.product_subset_product
    (depthIcc_two_subset_of_le hKL) (by intro m hm; exact hm)

/-- For fixed two-core odd set, the address difference between depths `K` and
`L` is exactly the depth interval `K+1..L`. -/
theorem superGaussianFiniteGenuineAddressSet_three_sdiff_depth_eq
    {K L : ℕ} (hK : 1 ≤ K) :
    superGaussianFiniteGenuineAddressSet L 3 \
        superGaussianFiniteGenuineAddressSet K 3 =
      Finset.Icc (K + 1) L ×ˢ oddCoresUpTo 3 := by
  ext a
  constructor
  · intro ha
    simp only [superGaussianFiniteGenuineAddressSet, Finset.mem_sdiff,
      Finset.mem_product, Finset.mem_Icc] at ha ⊢
    rcases ha with ⟨⟨⟨h2, hL⟩, hm⟩, hnot⟩
    refine ⟨⟨?_, hL⟩, hm⟩
    by_contra hlt
    have hleK : a.1 ≤ K := by omega
    exact hnot ⟨⟨h2, hleK⟩, hm⟩
  · intro ha
    simp only [superGaussianFiniteGenuineAddressSet, Finset.mem_sdiff,
      Finset.mem_product, Finset.mem_Icc] at ha ⊢
    rcases ha with ⟨⟨hK1, hL⟩, hm⟩
    refine ⟨⟨⟨by omega, hL⟩, hm⟩, ?_⟩
    rintro ⟨⟨_h2, hleK⟩, _hm⟩
    omega

/-- Post-depth finite two-core remainder: the extra regularized two-core block
added when the depth cutoff is extended from `K` to `L`. -/
noncomputable def superGaussianFiniteTwoCorePostDepthRemainder
    (K L : ℕ) : ℂ → ℝ → ℂ :=
  fun s X =>
    superGaussianFiniteGenuineRectangle 2 X s L 3 -
      superGaussianFiniteGenuineRectangle 2 X s K 3

/-- Phase-free dyadic upper for the post-depth finite two-core remainder. -/
noncomputable def superGaussianFiniteTwoCorePostDepthTailUpper
    (K L : ℕ) : ℝ :=
  ∑ a ∈
      superGaussianFiniteGenuineAddressSet L 3 \
        superGaussianFiniteGenuineAddressSet K 3,
    2 * ((1 / 2 : ℝ) ^ a.1)

/-- The post-depth finite two-core remainder is exactly the address sum over
the depth difference. -/
theorem superGaussianFiniteTwoCorePostDepthRemainder_eq_address_sdiff_sum
    {K L : ℕ} (hKL : K ≤ L) (X : ℝ) (s : ℂ) :
    superGaussianFiniteTwoCorePostDepthRemainder K L s X =
      ∑ a ∈
          superGaussianFiniteGenuineAddressSet L 3 \
            superGaussianFiniteGenuineAddressSet K 3,
        superGaussianGenuineAddressTermAt 2 X s a := by
  unfold superGaussianFiniteTwoCorePostDepthRemainder
  rw [superGaussianFiniteGenuineRectangle_eq_addressSet_sum]
  rw [superGaussianFiniteGenuineRectangle_eq_addressSet_sum]
  have hsubset :
      superGaussianFiniteGenuineAddressSet K 3 ⊆
        superGaussianFiniteGenuineAddressSet L 3 :=
    superGaussianFiniteGenuineAddressSet_subset_of_depth_le hKL
  have hsum :=
    Finset.sum_sdiff
      (s₁ := superGaussianFiniteGenuineAddressSet K 3)
      (s₂ := superGaussianFiniteGenuineAddressSet L 3)
      (f := superGaussianGenuineAddressTermAt 2 X s) hsubset
  rw [← hsum]
  abel

/-- The post-depth finite two-core remainder is bounded by its phase-free
dyadic tail upper. -/
theorem superGaussianFiniteTwoCorePostDepthRemainder_norm_le_tailUpper
    {K L : ℕ} (hKL : K ≤ L) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    ‖superGaussianFiniteTwoCorePostDepthRemainder K L s X‖ ≤
      superGaussianFiniteTwoCorePostDepthTailUpper K L := by
  rw [superGaussianFiniteTwoCorePostDepthRemainder_eq_address_sdiff_sum
    hKL X s]
  unfold superGaussianFiniteTwoCorePostDepthTailUpper
  calc
    ‖∑ a ∈ superGaussianFiniteGenuineAddressSet L 3 \
          superGaussianFiniteGenuineAddressSet K 3,
        superGaussianGenuineAddressTermAt 2 X s a‖
        ≤ ∑ a ∈ superGaussianFiniteGenuineAddressSet L 3 \
            superGaussianFiniteGenuineAddressSet K 3,
          ‖superGaussianGenuineAddressTermAt 2 X s a‖ := by
          exact norm_sum_le _ _
    _ ≤ ∑ a ∈ superGaussianFiniteGenuineAddressSet L 3 \
            superGaussianFiniteGenuineAddressSet K 3,
          2 * ((1 / 2 : ℝ) ^ a.1) := by
          exact Finset.sum_le_sum (fun a ha => by
            have haL : a ∈ superGaussianFiniteGenuineAddressSet L 3 :=
              (Finset.mem_sdiff.mp ha).1
            simpa [superGaussianGenuineAddressTermAt,
              superGaussianGenuineAddressTerm_norm_eq] using
              (superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm
                (K := L) (X := X) hs haL))

/-- Depth-sum form of the post-depth two-core dyadic tail upper. -/
theorem superGaussianFiniteTwoCorePostDepthTailUpper_eq_depthSum
    {K L : ℕ} (hK : 1 ≤ K) :
    superGaussianFiniteTwoCorePostDepthTailUpper K L =
      ∑ k ∈ Finset.Icc (K + 1) L, 4 * ((1 / 2 : ℝ) ^ k) := by
  unfold superGaussianFiniteTwoCorePostDepthTailUpper
  rw [superGaussianFiniteGenuineAddressSet_three_sdiff_depth_eq hK]
  rw [Finset.sum_product]
  rw [oddCoresUpTo_three_eq]
  simp only [one_div, inv_pow, Finset.sum_const, Finset.mem_singleton,
    OfNat.one_ne_ofNat, not_false_eq_true, Finset.card_insert_of_notMem,
    Finset.card_singleton, Nat.reduceAdd, nsmul_eq_mul, Nat.cast_ofNat]
  apply Finset.sum_congr rfl
  intro k _hk
  ring

/-- The finite post-depth tail is bounded by the infinite dyadic tail starting
at depth `K+1`. -/
theorem superGaussianFiniteTwoCorePostDepthTailUpper_le_infiniteTail
    {K L : ℕ} (hK : 1 ≤ K) :
    superGaussianFiniteTwoCorePostDepthTailUpper K L ≤
      8 * ((1 / 2 : ℝ) ^ (K + 1)) := by
  rw [superGaussianFiniteTwoCorePostDepthTailUpper_eq_depthSum hK]
  by_cases hrange : K + 1 ≤ L
  · have hIcc : Finset.Icc (K + 1) L = Finset.Ico (K + 1) (L + 1) := by
      ext k
      simp
    rw [hIcc]
    rw [← Finset.mul_sum]
    have hhalf_ne : (1 / 2 : ℝ) ≠ 1 := by norm_num
    have hle : K + 1 ≤ L + 1 := by omega
    rw [geom_sum_Ico (x := (1 / 2 : ℝ)) hhalf_ne hle]
    have hpowL_nonneg : 0 ≤ (1 / 2 : ℝ) ^ (L + 1) := by positivity
    have hpowL0_nonneg : 0 ≤ (1 / 2 : ℝ) ^ L := by positivity
    ring_nf
    nlinarith
  · have hempty : Finset.Icc (K + 1) L = ∅ := by
      exact Finset.Icc_eq_empty hrange
    simp [hempty]

/-- Extending a finite two-core rectangle from depth `K` to `L` is exactly the
full-depth extension by the post-depth remainder. -/
theorem superGaussianFiniteGenuineRectangle_three_eq_fullDepthExtension_postDepth
    (K L : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteGenuineRectangle 2 X s L 3 =
      superGaussianFiniteTwoCoreFullDepthExtension K
        (superGaussianFiniteTwoCorePostDepthRemainder K L) X s := by
  unfold superGaussianFiniteTwoCoreFullDepthExtension
    superGaussianFiniteTwoCorePostDepthRemainder
  ring

/-- Finite-depth extension criterion: if the post-`K` dyadic tail is below the
full finite `K x 3` lower profile, then every larger finite depth `L` is
nonzero. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_postDepthTail_lt_unitStripLower
    {K L : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hKL : K ≤ L)
    (hX : 0 < X)
    (htail :
      superGaussianFiniteTwoCorePostDepthTailUpper K L <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s) :
    superGaussianFiniteGenuineRectangle 2 X s L 3 ≠ 0 := by
  rw [superGaussianFiniteGenuineRectangle_three_eq_fullDepthExtension_postDepth]
  exact
    superGaussianFiniteTwoCoreFullDepthExtension_ne_zero_of_remainder_norm_lt_unitStripLower
      hs hsle hK hX
      (lt_of_le_of_lt
        (superGaussianFiniteTwoCorePostDepthRemainder_norm_le_tailUpper
          hKL hs)
        htail)

/-- A simpler sufficient finite-depth extension criterion using the closed
infinite dyadic tail cap `8 * (1/2)^(K+1)`. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_infiniteTail_lt_unitStripLower
    {K L : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hKL : K ≤ L)
    (hX : 0 < X)
    (htail :
      8 * ((1 / 2 : ℝ) ^ (K + 1)) <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s) :
    superGaussianFiniteGenuineRectangle 2 X s L 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_postDepthTail_lt_unitStripLower
    hs hsle hK hKL hX
    (lt_of_le_of_lt
      (superGaussianFiniteTwoCorePostDepthTailUpper_le_infiniteTail
        (by omega : 1 ≤ K))
      htail)

/-- Quantitative finite-depth lower bound: extending from depth `K` to `L`
can reduce the certified `K x 3` lower profile by at most the post-depth tail
upper. -/
theorem superGaussianFiniteGenuineRectangle_three_norm_lower_of_postDepthTail
    {K L : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hKL : K ≤ L)
    (hX : 0 < X) :
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
        superGaussianFiniteTwoCorePostDepthTailUpper K L ≤
      ‖superGaussianFiniteGenuineRectangle 2 X s L 3‖ := by
  rw [superGaussianFiniteGenuineRectangle_three_eq_fullDepthExtension_postDepth]
  change
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
        superGaussianFiniteTwoCorePostDepthTailUpper K L ≤
      ‖superGaussianFiniteGenuineRectangle 2 X s K 3 +
        superGaussianFiniteTwoCorePostDepthRemainder K L s X‖
  exact
    norm_add_lower_bound_of_remainder_norm_le
      (superGaussianFiniteGenuineRectangle_three_norm_lower_of_unitStripScale
        hs hsle hK hX)
      (superGaussianFiniteTwoCorePostDepthRemainder_norm_le_tailUpper
        hKL hs)

/-- Quantitative lower bound using the closed infinite dyadic tail cap. -/
theorem superGaussianFiniteGenuineRectangle_three_norm_lower_of_infiniteTail
    {K L : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hKL : K ≤ L)
    (hX : 0 < X) :
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
        8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
      ‖superGaussianFiniteGenuineRectangle 2 X s L 3‖ := by
  have htail :
      superGaussianFiniteTwoCorePostDepthTailUpper K L ≤
        8 * ((1 / 2 : ℝ) ^ (K + 1)) :=
    superGaussianFiniteTwoCorePostDepthTailUpper_le_infiniteTail
      (by omega : 1 ≤ K)
  have hfinite :=
    superGaussianFiniteGenuineRectangle_three_norm_lower_of_postDepthTail
      hs hsle hK hKL hX
  linarith

/-- Unit-strip finite two-core nonvanishing from the dyadic scale upper.  This
is the clean `p = 2` finite cutoff obligation: compare one explicit scale sum
in `K,X` against the raw genuine scalar margin. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      superGaussianFiniteTwoCoreUnitStripScaleUpper K X <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_algebraic_unitStrip
    hs hsle hK hX
    (lt_of_le_of_lt
      (superGaussianFiniteGenuineCutoffResidualAlgebraicUpper_two_three_le_unitStripScale
        hs hX)
      hupper)

/-- Closed-form version of the unit-strip finite two-core scale criterion. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClosedScaleUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2 <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleUpper
    hs hsle hK hX
    (by
      rwa [superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_closedForm hK X])

/-- Cleared-scale version of the unit-strip finite two-core criterion.  The
remaining finite cutoff obligation is now a direct comparison against `X^2`. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClearedScaleUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      36 * ((2 : ℝ) ^ (K + 1) - 4) <
        ((3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) * X ^ 2) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  have hinv_sq_pos : 0 < X⁻¹ ^ 2 := by positivity
  have hscaled := mul_lt_mul_of_pos_right hupper hinv_sq_pos
  have hcancel :
      (((3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) * X ^ 2) * X⁻¹ ^ 2 =
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ))) := by
    field_simp [hX.ne']
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClosedScaleUpper
      hs hsle hK hX
      (by
        calc
          36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2
              < (((3 / 40 : ℝ) *
                  ((s.re * Real.log (3 : ℝ)) /
                    (1 + s.re * Real.log (3 : ℝ)))) *
                    X ^ 2) * X⁻¹ ^ 2 := hscaled
          _ = (3 / 40 : ℝ) *
                ((s.re * Real.log (3 : ℝ)) /
                  (1 + s.re * Real.log (3 : ℝ))) := hcancel)

/-- Fraction-free version of the unit-strip finite two-core scale criterion. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripFractionFreeScaleUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + s.re * Real.log (3 : ℝ)) <
        (s.re * Real.log (3 : ℝ)) * X ^ 2) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hden_pos : 0 < 1 + s.re * Real.log (3 : ℝ) := by
    nlinarith [mul_pos hs hlog3]
  have hmargin :
      36 * ((2 : ℝ) ^ (K + 1) - 4) <
        ((3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) * X ^ 2 := by
    have hdiv := div_lt_div_of_pos_right hupper hden_pos
    field_simp [hden_pos.ne'] at hdiv ⊢
    ring_nf at hdiv ⊢
    nlinarith
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClearedScaleUpper
      hs hsle hK hX hmargin

/-- Uniform unit-strip finite two-core scale criterion.  The left side now
depends only on `K`; the point enters only through `Re(s) * X^2`. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripUniformScaleUpper
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ) <
        s.re * X ^ 2) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hpow_ge : (4 : ℝ) ≤ (2 : ℝ) ^ (K + 1) := by
    calc
      (4 : ℝ) = (2 : ℝ) ^ 2 := by norm_num
      _ ≤ (2 : ℝ) ^ (K + 1) := by
          exact pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2)
            (by omega : 2 ≤ K + 1)
  have hA_nonneg : 0 ≤ (2 : ℝ) ^ (K + 1) - 4 := by
    linarith
  have hfactor :
      1 + s.re * Real.log (3 : ℝ) ≤ 1 + Real.log (3 : ℝ) := by
    have hmul : s.re * Real.log (3 : ℝ) ≤ Real.log (3 : ℝ) := by
      simpa using mul_le_mul_of_nonneg_right hsle (le_of_lt hlog3)
    linarith
  have hleft_factor_nonneg :
      0 ≤ 480 * ((2 : ℝ) ^ (K + 1) - 4) := by
    positivity
  have hleft_le :
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + s.re * Real.log (3 : ℝ)) ≤
        480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + Real.log (3 : ℝ)) :=
    mul_le_mul_of_nonneg_left hfactor hleft_factor_nonneg
  have hscaled :
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + Real.log (3 : ℝ)) <
        (s.re * X ^ 2) * Real.log (3 : ℝ) := by
    have h := mul_lt_mul_of_pos_right hupper hlog3
    have hcancel :
        (480 * ((2 : ℝ) ^ (K + 1) - 4) *
            (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)) *
            Real.log (3 : ℝ) =
          480 * ((2 : ℝ) ^ (K + 1) - 4) *
            (1 + Real.log (3 : ℝ)) := by
      field_simp [hlog3.ne']
    simpa [hcancel] using h
  have hfractionFree :
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + s.re * Real.log (3 : ℝ)) <
        (s.re * Real.log (3 : ℝ)) * X ^ 2 := by
    calc
      480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + s.re * Real.log (3 : ℝ))
          ≤ 480 * ((2 : ℝ) ^ (K + 1) - 4) *
              (1 + Real.log (3 : ℝ)) := hleft_le
      _ < (s.re * X ^ 2) * Real.log (3 : ℝ) := hscaled
      _ = (s.re * Real.log (3 : ℝ)) * X ^ 2 := by ring
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripFractionFreeScaleUpper
      hs hsle hK hX hfractionFree

/-- Named finite two-core unit-strip scale barrier.  The sufficient cutoff
condition is `barrier K < Re(s) * X^2`. -/
noncomputable def superGaussianFiniteTwoCoreUnitStripScaleBarrier
    (K : ℕ) : ℝ :=
  480 * ((2 : ℝ) ^ (K + 1) - 4) *
    (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)

/-- The finite two-core unit-strip scale barrier is positive for every
nonempty C2 depth range. -/
theorem superGaussianFiniteTwoCoreUnitStripScaleBarrier_pos
    {K : ℕ} (hK : 2 ≤ K) :
    0 < superGaussianFiniteTwoCoreUnitStripScaleBarrier K := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hlog3_factor : 0 < 1 + Real.log (3 : ℝ) := by nlinarith
  have hpow_gt : (4 : ℝ) < (2 : ℝ) ^ (K + 1) := by
    calc
      (4 : ℝ) = (2 : ℝ) ^ 2 := by norm_num
      _ < (2 : ℝ) ^ (K + 1) := by
          exact pow_lt_pow_right₀ (by norm_num : (1 : ℝ) < 2)
            (by omega : 2 < K + 1)
  have hA_pos : 0 < (2 : ℝ) ^ (K + 1) - 4 := by linarith
  have hnum_pos :
      0 < 480 * ((2 : ℝ) ^ (K + 1) - 4) *
        (1 + Real.log (3 : ℝ)) :=
    mul_pos (mul_pos (by norm_num) hA_pos) hlog3_factor
  unfold superGaussianFiniteTwoCoreUnitStripScaleBarrier
  exact div_pos hnum_pos hlog3

/-- Barrier form of the finite two-core unit-strip scale criterion. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleBarrier
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hX : 0 < X)
    (hupper :
      superGaussianFiniteTwoCoreUnitStripScaleBarrier K < s.re * X ^ 2) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripUniformScaleUpper
    hs hsle hK hX
    (by
      simpa [superGaussianFiniteTwoCoreUnitStripScaleBarrier] using hupper)

/-- The finite unit-strip barrier is dominated by a simple dyadic quadratic
scale.  This turns the closed-form residual estimate into a practical cutoff
profile depending only on the C2 depth `K`. -/
theorem superGaussianFiniteTwoCoreUnitStripScaleBarrier_lt_dyadic64_sq
    {K : ℕ} (hK : 2 ≤ K) :
    superGaussianFiniteTwoCoreUnitStripScaleBarrier K <
      (64 * (2 : ℝ) ^ (K + 1)) ^ 2 := by
  have hlog3 : (1 : ℝ) < Real.log (3 : ℝ) := one_lt_log_three
  have hlog3_pos : 0 < Real.log (3 : ℝ) := by linarith
  have hratio :
      (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ) < (2 : ℝ) := by
    field_simp [hlog3_pos.ne']
    linarith
  have hpow_ge_eight : (8 : ℝ) ≤ (2 : ℝ) ^ (K + 1) := by
    calc
      (8 : ℝ) = (2 : ℝ) ^ 3 := by norm_num
      _ ≤ (2 : ℝ) ^ (K + 1) := by
          exact pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2)
            (by omega : 3 ≤ K + 1)
  have hpow_gt_four : (4 : ℝ) < (2 : ℝ) ^ (K + 1) := by
    linarith
  have htail_pos : 0 < (2 : ℝ) ^ (K + 1) - 4 := by linarith
  have htail_le : (2 : ℝ) ^ (K + 1) - 4 ≤ (2 : ℝ) ^ (K + 1) := by
    linarith
  unfold superGaussianFiniteTwoCoreUnitStripScaleBarrier
  calc
    480 * ((2 : ℝ) ^ (K + 1) - 4) *
          (1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)
        = 480 * ((2 : ℝ) ^ (K + 1) - 4) *
            ((1 + Real.log (3 : ℝ)) / Real.log (3 : ℝ)) := by ring
    _ < 480 * ((2 : ℝ) ^ (K + 1) - 4) * 2 := by
        exact mul_lt_mul_of_pos_left hratio
          (mul_pos (by norm_num) htail_pos)
    _ = 960 * ((2 : ℝ) ^ (K + 1) - 4) := by ring
    _ ≤ 960 * (2 : ℝ) ^ (K + 1) := by
        exact mul_le_mul_of_nonneg_left htail_le (by norm_num)
    _ < (64 * (2 : ℝ) ^ (K + 1)) ^ 2 := by
        nlinarith [hpow_ge_eight]

/-- Finite two-core reciprocal cutoff scale.  The profile grows as
`2^(K+1) / Re(s)`, matching the finite dyadic depth of the residual envelope. -/
noncomputable def superGaussianFiniteTwoCoreReciprocalCutoffScale
    (K : ℕ) (s : ℂ) : ℝ :=
  superGaussianTwoCoreReciprocalCutoffScale
    (64 * (2 : ℝ) ^ (K + 1)) s

/-- Reciprocal cutoff package for the finite `p = 2`, `M = 3` genuine
rectangle.  In the unit strip, any cutoff above
`64 * 2^(K+1) / Re(s)` closes the finite middle no-cancellation criterion. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_reciprocalDyadic64
    {K : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K)
    (hXge : superGaussianFiniteTwoCoreReciprocalCutoffScale K s ≤ X) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  have hApos : 0 < 64 * (2 : ℝ) ^ (K + 1) := by positivity
  have hrecip_pos :
      0 < superGaussianFiniteTwoCoreReciprocalCutoffScale K s := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact div_pos hApos hs
  have hXpos : 0 < X := lt_of_lt_of_le hrecip_pos hXge
  have hbarrierA :
      superGaussianFiniteTwoCoreUnitStripScaleBarrier K <
        (64 * (2 : ℝ) ^ (K + 1)) ^ 2 :=
    superGaussianFiniteTwoCoreUnitStripScaleBarrier_lt_dyadic64_sq hK
  have hscale_ge :
      (64 * (2 : ℝ) ^ (K + 1)) ^ 2 ≤
        s.re * ((64 * (2 : ℝ) ^ (K + 1)) / s.re) ^ 2 := by
    field_simp [ne_of_gt hs]
    nlinarith [sq_nonneg (64 * (2 : ℝ) ^ (K + 1)), hs, hsle]
  have hrecip_barrier :
      superGaussianFiniteTwoCoreUnitStripScaleBarrier K <
        s.re * superGaussianFiniteTwoCoreReciprocalCutoffScale K s ^ 2 := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact lt_of_lt_of_le hbarrierA hscale_ge
  have hsquare :
      superGaussianFiniteTwoCoreReciprocalCutoffScale K s ^ 2 ≤ X ^ 2 := by
    exact pow_le_pow_left₀ (le_of_lt hrecip_pos) hXge 2
  have hupper :
      superGaussianFiniteTwoCoreUnitStripScaleBarrier K < s.re * X ^ 2 := by
    exact lt_of_lt_of_le hrecip_barrier
      (mul_le_mul_of_nonneg_left hsquare (le_of_lt hs))
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleBarrier
      hs hsle hK hXpos hupper

/-- Finite audited cutoff region for the `p = 2`, `M = 3` genuine rectangle.
It keeps the depth parameter `K` visible instead of hiding it in an informal
middle hypothesis. -/
def superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
    (K : ℕ) : CutoffRegion :=
  fun s X =>
    0 < s.re ∧ s.re ≤ 1 ∧
      superGaussianFiniteTwoCoreReciprocalCutoffScale K s ≤ X

/-- The finite dyadic reciprocal region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
    {K : ℕ} :
    PositiveCutoffRegionOn
      (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K) := by
  intro s X hs
  refine ⟨hs.1, ?_⟩
  have hApos : 0 < 64 * (2 : ℝ) ^ (K + 1) := by positivity
  have hscale_pos :
      0 < superGaussianFiniteTwoCoreReciprocalCutoffScale K s := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact div_pos hApos hs.1
  exact lt_of_lt_of_le hscale_pos hs.2.2

/-- The canonical finite dyadic reciprocal cutoff scale is itself a point of
the corresponding finite cutoff region. -/
theorem superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion_at_scale
    {K : ℕ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) := by
  exact ⟨hs, hsle, le_rfl⟩

/-- Region-level finite genuine no-cancellation on the dyadic reciprocal
large-cutoff region. -/
theorem superGaussianFiniteGenuineRectangle_three_nonvanishingOn_reciprocalDyadic64
    {K : ℕ} (hK : 2 ≤ K) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
        superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  intro s X hs
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_reciprocalDyadic64
      hs.1 hs.2.1 hK hs.2.2

/-- Pointwise finite two-core certificate at the canonical finite dyadic
reciprocal cutoff scale. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_at_reciprocalDyadic64
    {K : ℕ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) :
    superGaussianFiniteGenuineRectangle 2
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_nonvanishingOn_reciprocalDyadic64
    hK
    (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion_at_scale
      hs hsle)

/-- Every unit-strip point admits an explicit finite two-core super-Gaussian
genuine certificate at the dyadic reciprocal scale. -/
theorem exists_superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStrip
    {K : ℕ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) :
    ∃ X : ℝ,
      0 < X ∧ superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  refine ⟨superGaussianFiniteTwoCoreReciprocalCutoffScale K s, ?_, ?_⟩
  · have hApos : 0 < 64 * (2 : ℝ) ^ (K + 1) := by positivity
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact div_pos hApos hs
  · exact
      superGaussianFiniteGenuineRectangle_three_ne_zero_at_reciprocalDyadic64
        hs hsle hK

/-- No unit-strip zero exists for the finite two-core super-Gaussian genuine
rectangle at its canonical dyadic reciprocal cutoff scale. -/
theorem no_zero_superGaussianFiniteGenuineRectangle_three_at_reciprocalDyadic64
    {K : ℕ} (hK : 2 ≤ K) :
    ¬ ∃ s : ℂ,
      0 < s.re ∧ s.re ≤ 1 ∧
        superGaussianFiniteGenuineRectangle 2
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s K 3 = 0 := by
  rintro ⟨s, hspos, hsle, hzero⟩
  exact
    (superGaussianFiniteGenuineRectangle_three_ne_zero_at_reciprocalDyadic64
      hspos hsle hK) hzero

/-- Named region for the full-depth accounting route: dyadic cutoff plus a
post-`K` remainder below the full finite two-core lower profile. -/
def superGaussianFiniteTwoCoreFullDepthRemainderControlledRegion
    (K : ℕ) (remainder : ℂ → ℝ → ℂ) : CutoffRegion :=
  fun s X =>
    superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X ∧
      ‖remainder s X‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s

/-- Non-cancellation of the full-depth extension on its controlled region. -/
theorem superGaussianFiniteTwoCoreFullDepthExtension_nonvanishingOn_controlledRegion
    {K : ℕ} {remainder : ℂ → ℝ → ℂ} (hK : 2 ≤ K) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreFullDepthRemainderControlledRegion
        K remainder s X →
        superGaussianFiniteTwoCoreFullDepthExtension K remainder X s ≠ 0 := by
  intro s X hs
  exact
    superGaussianFiniteTwoCoreFullDepthExtension_ne_zero_of_remainder_norm_lt_unitStripLower
      hs.1.1 hs.1.2.1 hK
      (positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
        hs.1).2
      hs.2

/-- On the dyadic64 reciprocal region, the finite two-core cutoff scale error
is bounded by one post-depth dyadic unit.  This turns the cutoff loss into the
same geometric currency as the post-`K` tail. -/
theorem superGaussianFiniteTwoCoreUnitStripScaleUpper_le_reciprocalDyadic64_tailUnit
    {K : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hs :
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X) :
    superGaussianFiniteTwoCoreUnitStripScaleUpper K X ≤
      (1 / 2 : ℝ) ^ (K + 1) := by
  have hsig_pos : 0 < s.re := hs.1
  have hsig_le : s.re ≤ 1 := hs.2.1
  have hApos : 0 < (2 : ℝ) ^ (K + 1) := by positivity
  have hA64pos : 0 < 64 * (2 : ℝ) ^ (K + 1) := by positivity
  have hrecip_pos :
      0 < superGaussianFiniteTwoCoreReciprocalCutoffScale K s := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact div_pos hA64pos hsig_pos
  have hXpos : 0 < X := lt_of_lt_of_le hrecip_pos hs.2.2
  have hinv_le :
      X⁻¹ ≤
        (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)⁻¹ := by
    rw [inv_le_inv₀ hXpos hrecip_pos]
    exact hs.2.2
  have hrecip_inv :
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)⁻¹ =
        s.re / (64 * (2 : ℝ) ^ (K + 1)) := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    field_simp [hA64pos.ne', hsig_pos.ne']
  have hinv_scale :
      X⁻¹ ≤ s.re / (64 * (2 : ℝ) ^ (K + 1)) := by
    simpa [hrecip_inv] using hinv_le
  have hinv_sq :
      X⁻¹ ^ 2 ≤
        (s.re / (64 * (2 : ℝ) ^ (K + 1))) ^ 2 := by
    exact pow_le_pow_left₀ (by positivity) hinv_scale 2
  have hsig_sq_le_one : s.re ^ 2 ≤ 1 := by
    nlinarith [hsig_pos, hsig_le]
  have hscaled :
      36 * (2 : ℝ) ^ (K + 1) *
          (s.re / (64 * (2 : ℝ) ^ (K + 1))) ^ 2 ≤
        ((2 : ℝ) ^ (K + 1))⁻¹ := by
    field_simp [hApos.ne']
    nlinarith [sq_nonneg s.re, hsig_sq_le_one, hApos]
  have htail_inv :
      ((2 : ℝ) ^ (K + 1))⁻¹ = (1 / 2 : ℝ) ^ (K + 1) := by
    rw [← inv_pow]
    norm_num
  rw [superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_closedForm hK X]
  calc
    36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2
        ≤ 36 * (2 : ℝ) ^ (K + 1) * X⁻¹ ^ 2 := by
          have htail_le :
              (2 : ℝ) ^ (K + 1) - 4 ≤ (2 : ℝ) ^ (K + 1) := by
            linarith
          have hmul :
              ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2 ≤
                (2 : ℝ) ^ (K + 1) * X⁻¹ ^ 2 :=
            mul_le_mul_of_nonneg_right htail_le (by positivity)
          nlinarith
    _ ≤ 36 * (2 : ℝ) ^ (K + 1) *
          (s.re / (64 * (2 : ℝ) ^ (K + 1))) ^ 2 := by
        exact mul_le_mul_of_nonneg_left hinv_sq (by positivity)
    _ ≤ (1 / 2 : ℝ) ^ (K + 1) := by
        rw [← htail_inv]
        exact hscaled

/-- Depth-stable finite two-core region: dyadic cutoff at depth `K` plus a
post-`K` infinite dyadic tail cap below the full finite `K x 3` lower profile. -/
def superGaussianFiniteTwoCoreDepthStableRegion
    (K : ℕ) : CutoffRegion :=
  fun s X =>
    superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X ∧
      8 * ((1 / 2 : ℝ) ^ (K + 1)) <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s

/-- The depth-stable region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianFiniteTwoCoreDepthStableRegion
    {K : ℕ} :
    PositiveCutoffRegionOn
      (superGaussianFiniteTwoCoreDepthStableRegion K) := by
  intro s X hs
  exact positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
    hs.1

/-- On the depth-stable region, every larger finite two-core depth cutoff is
nonzero.  This is the finite depth accounting closure: the post-`K` dyadic
tail cannot cancel the certified full-depth `K x 3` block. -/
theorem superGaussianFiniteGenuineRectangle_three_nonvanishingOn_depthStableRegion
    {K L : ℕ} (hK : 2 ≤ K) (hKL : K ≤ L) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreDepthStableRegion K s X →
        superGaussianFiniteGenuineRectangle 2 X s L 3 ≠ 0 := by
  intro s X hs
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_of_infiniteTail_lt_unitStripLower
      hs.1.1 hs.1.2.1 hK hKL
      (positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
        hs.1).2
      hs.2

/-- On the depth-stable region, all larger finite depths have a uniform
positive norm floor, not merely nonzero value. -/
theorem superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
    {K L : ℕ} (hK : 2 ≤ K) (hKL : K ≤ L) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreDepthStableRegion K s X →
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K X s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
          ‖superGaussianFiniteGenuineRectangle 2 X s L 3‖ := by
  intro s X hs
  have hgap :
      0 <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1)) := by
    linarith [hs.2]
  have hnorm :=
    superGaussianFiniteGenuineRectangle_three_norm_lower_of_infiniteTail
      hs.1.1 hs.1.2.1 hK hKL
      (positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
        hs.1).2
  exact ⟨hgap, hnorm⟩

/-- Explicit sufficient condition for the depth-stable region: once the genuine
scalar margin dominates nine dyadic units at depth `K`, the dyadic64 cutoff
loss and the whole post-`K` tail are both absorbed. -/
theorem superGaussianFiniteTwoCoreDepthStableRegion_of_dyadic64_marginNine
    {K : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hs :
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X)
    (hmargin :
      9 * ((1 / 2 : ℝ) ^ (K + 1)) <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteTwoCoreDepthStableRegion K s X := by
  refine ⟨hs, ?_⟩
  have hscale :
      superGaussianFiniteTwoCoreUnitStripScaleUpper K X ≤
        (1 / 2 : ℝ) ^ (K + 1) :=
    superGaussianFiniteTwoCoreUnitStripScaleUpper_le_reciprocalDyadic64_tailUnit
      hK hs
  have hsum :
      8 * ((1 / 2 : ℝ) ^ (K + 1)) +
          superGaussianFiniteTwoCoreUnitStripScaleUpper K X <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ))) := by
    calc
      8 * ((1 / 2 : ℝ) ^ (K + 1)) +
          superGaussianFiniteTwoCoreUnitStripScaleUpper K X
          ≤ 8 * ((1 / 2 : ℝ) ^ (K + 1)) +
              (1 / 2 : ℝ) ^ (K + 1) := by
            exact add_le_add_right hscale _
      _ = 9 * ((1 / 2 : ℝ) ^ (K + 1)) := by ring
      _ < (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ))) := hmargin
  unfold superGaussianFiniteTwoCoreUnitStripNormLower
  linarith

/-- Region-level consequence of the explicit nine-unit margin criterion:
every larger finite two-core depth cutoff is nonzero. -/
theorem superGaussianFiniteGenuineRectangle_three_nonvanishingOn_dyadic64_marginNine
    {K L : ℕ} (hK : 2 ≤ K) (hKL : K ≤ L) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
        9 * ((1 / 2 : ℝ) ^ (K + 1)) <
          (3 / 40 : ℝ) *
            ((s.re * Real.log (3 : ℝ)) /
              (1 + s.re * Real.log (3 : ℝ))) →
        superGaussianFiniteGenuineRectangle 2 X s L 3 ≠ 0 := by
  intro s X hs hmargin
  exact
    superGaussianFiniteGenuineRectangle_three_nonvanishingOn_depthStableRegion
      hK hKL
      (superGaussianFiniteTwoCoreDepthStableRegion_of_dyadic64_marginNine
        hK hs hmargin)

/-- Canonical-cutoff version of the explicit depth-stability criterion. -/
theorem superGaussianFiniteTwoCoreDepthStableRegion_at_dyadic64_of_marginNine
    {K : ℕ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K)
    (hmargin :
      9 * ((1 / 2 : ℝ) ^ (K + 1)) <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteTwoCoreDepthStableRegion K s
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) :=
  superGaussianFiniteTwoCoreDepthStableRegion_of_dyadic64_marginNine
    hK
    (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion_at_scale
      hs hsle)
    hmargin

/-- Canonical-cutoff finite-depth non-cancellation under the explicit
nine-unit margin criterion. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_at_dyadic64_of_marginNine
    {K L : ℕ} {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    (hK : 2 ≤ K) (hKL : K ≤ L)
    (hmargin :
      9 * ((1 / 2 : ℝ) ^ (K + 1)) <
        (3 / 40 : ℝ) *
          ((s.re * Real.log (3 : ℝ)) /
            (1 + s.re * Real.log (3 : ℝ)))) :
    superGaussianFiniteGenuineRectangle 2
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_nonvanishingOn_depthStableRegion
    hK hKL
    (superGaussianFiniteTwoCoreDepthStableRegion_at_dyadic64_of_marginNine
      hs hsle hK hmargin)

/-- The unit-strip scalar margin used by the finite two-core route is positive
throughout the open right half-plane. -/
theorem superGaussianFiniteTwoCoreUnitStripScalarMargin_pos
    {s : ℂ} (hs : 0 < s.re) :
    0 <
      (3 / 40 : ℝ) *
        ((s.re * Real.log (3 : ℝ)) /
          (1 + s.re * Real.log (3 : ℝ))) := by
  have hlog3 : 0 < Real.log (3 : ℝ) := Real.log_pos (by norm_num)
  have hnum : 0 < s.re * Real.log (3 : ℝ) := mul_pos hs hlog3
  have hden : 0 < 1 + s.re * Real.log (3 : ℝ) := by
    nlinarith
  exact mul_pos (by norm_num) (div_pos hnum hden)

/-- For every point with positive real part, some depth makes the dyadic
post-`K` unit small enough to fit below the explicit scalar genuine margin. -/
theorem exists_superGaussianFiniteTwoCore_marginDominatingDepth
    {s : ℂ} (hs : 0 < s.re) :
    ∃ K : ℕ,
      2 ≤ K ∧
        9 * ((1 / 2 : ℝ) ^ (K + 1)) <
          (3 / 40 : ℝ) *
            ((s.re * Real.log (3 : ℝ)) /
              (1 + s.re * Real.log (3 : ℝ))) := by
  let margin : ℝ :=
    (3 / 40 : ℝ) *
      ((s.re * Real.log (3 : ℝ)) /
        (1 + s.re * Real.log (3 : ℝ)))
  have hmargin_pos : 0 < margin := by
    simpa [margin] using
      (superGaussianFiniteTwoCoreUnitStripScalarMargin_pos hs)
  obtain ⟨n, hn⟩ :=
    exists_pow_lt_of_lt_one
      (show 0 < margin / 9 by positivity)
      (by norm_num : (1 / 2 : ℝ) < 1)
  refine ⟨n + 2, by omega, ?_⟩
  have hpow_le :
      (1 / 2 : ℝ) ^ ((n + 2) + 1) ≤ (1 / 2 : ℝ) ^ n := by
    exact pow_le_pow_of_le_one
      (by norm_num : 0 ≤ (1 / 2 : ℝ))
      (by norm_num : (1 / 2 : ℝ) ≤ 1)
      (by omega : n ≤ (n + 2) + 1)
  have hsmall :
      (1 / 2 : ℝ) ^ ((n + 2) + 1) < margin / 9 :=
    lt_of_le_of_lt hpow_le hn
  change
    9 * ((1 / 2 : ℝ) ^ ((n + 2) + 1)) < margin
  nlinarith

/-- Every unit-strip point admits a canonical dyadic64 depth that is already in
the depth-stable finite two-core region. -/
theorem exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianFiniteTwoCoreDepthStableRegion K s
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) := by
  obtain ⟨K, hK, hmargin⟩ :=
    exists_superGaussianFiniteTwoCore_marginDominatingDepth hs
  exact
    ⟨K, hK,
      superGaussianFiniteTwoCoreDepthStableRegion_at_dyadic64_of_marginNine
        hs hsle hK hmargin⟩

/-- Pointwise finite tail-stability: for every unit-strip point, there is a
canonical dyadic64 depth `K` such that all larger finite two-core depths are
nonzero at that same canonical cutoff. -/
theorem exists_superGaussianFiniteGenuineRectangle_three_tailStable_at_reciprocalDyadic64
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        ∀ L : ℕ,
          K ≤ L →
            superGaussianFiniteGenuineRectangle 2
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L 3 ≠ 0 := by
  obtain ⟨K, hK, hmargin⟩ :=
    exists_superGaussianFiniteTwoCore_marginDominatingDepth hs
  refine ⟨K, hK, ?_⟩
  intro L hKL
  exact
    superGaussianFiniteGenuineRectangle_three_ne_zero_at_dyadic64_of_marginNine
      hs hsle hK hKL hmargin

/-- Pointwise quantitative finite tail-stability: for every unit-strip point,
there is a canonical dyadic64 depth whose positive norm gap works uniformly for
all larger finite two-core depths. -/
theorem exists_superGaussianFiniteGenuineRectangle_three_tailStable_normLower_at_reciprocalDyadic64
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        ∀ L : ℕ,
          K ≤ L →
            superGaussianFiniteTwoCoreUnitStripNormLower K
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
                8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
              ‖superGaussianFiniteGenuineRectangle 2
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L 3‖ := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro L hKL
    exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK hKL hstable).2

/-- One depth layer of the regularized finite two-core genuine geometry.  The
index `j` represents the actual C2 depth `j + 2`. -/
noncomputable def superGaussianTwoCoreDepthLayer
    (X : ℝ) (s : ℂ) (j : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo 3,
    superGaussianGenuineAddressTerm 2 X s (j + 2) m

/-- Infinite-depth regularized two-core limit at a fixed cutoff.  This is not
the full central object; it is the honest limit of the finite `M = 3`
rectangles as depth grows. -/
noncomputable def superGaussianTwoCoreDepthLimit
    (X : ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, superGaussianTwoCoreDepthLayer X s j

/-- The regularized two-core depth layers are absolutely summable in the right
half-plane, uniformly dominated by the dyadic depth tail. -/
theorem summable_superGaussianTwoCoreDepthLayer_norm
    {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ‖superGaussianTwoCoreDepthLayer X s j‖ := by
  unfold superGaussianTwoCoreDepthLayer
  have hbound : ∀ j : ℕ,
      ‖∑ m ∈ oddCoresUpTo 3,
          superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ ≤
        4 * ((1 / 2 : ℝ) ^ (j + 2)) := by
    intro j
    calc
      ‖∑ m ∈ oddCoresUpTo 3,
          superGaussianGenuineAddressTerm 2 X s (j + 2) m‖
          ≤ ∑ m ∈ oddCoresUpTo 3,
              ‖superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ :=
            norm_sum_le _ _
      _ ≤ ∑ m ∈ oddCoresUpTo 3,
              2 * ((1 / 2 : ℝ) ^ (j + 2)) := by
            refine Finset.sum_le_sum ?_
            intro m hm
            have ha : ((j + 2, m) : C2Address) ∈
                superGaussianFiniteGenuineAddressSet (j + 2) 3 := by
              rw [superGaussianFiniteGenuineAddressSet, Finset.mem_product]
              exact ⟨by rw [Finset.mem_Icc]; omega, hm⟩
            have hnorm_eq :
                ‖superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ =
                  superGaussianGenuineAddressTermNorm 2 X s
                    (j + 2, m) := by
              unfold superGaussianGenuineAddressTermNorm
              rw [superGaussianGenuineAddressTerm_norm_eq]
            rw [hnorm_eq]
            exact
              superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm
                hs ha
      _ = 4 * ((1 / 2 : ℝ) ^ (j + 2)) := by
            rw [oddCoresUpTo_three_eq]
            norm_num
            ring
  have hgeom : Summable fun j : ℕ => (1 / 2 : ℝ) ^ j :=
    summable_geometric_of_lt_one (by norm_num) (by norm_num)
  have hshift : Summable fun j : ℕ => (1 / 2 : ℝ) ^ (j + 2) := by
    have hmul := hgeom.mul_left ((1 / 2 : ℝ) ^ 2)
    simpa [pow_add, mul_assoc, mul_comm, mul_left_comm] using hmul
  have hmajor : Summable fun j : ℕ =>
      4 * ((1 / 2 : ℝ) ^ (j + 2)) :=
    hshift.mul_left 4
  exact
    Summable.of_nonneg_of_le
      (fun _ => norm_nonneg _)
      hbound
      hmajor

/-- The regularized two-core depth layers are summable in the right
half-plane. -/
theorem summable_superGaussianTwoCoreDepthLayer
    {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ => superGaussianTwoCoreDepthLayer X s j :=
  (summable_superGaussianTwoCoreDepthLayer_norm hs).of_norm

/-- Reindex the finite `M = 3` rectangle by shifted depth `j = k - 2`. -/
theorem superGaussianFiniteGenuineRectangle_three_eq_depthLayer_sum
    (X : ℝ) (s : ℂ) (N : ℕ) :
    superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3 =
      ∑ j ∈ Finset.range N, superGaussianTwoCoreDepthLayer X s j := by
  symm
  unfold superGaussianTwoCoreDepthLayer superGaussianFiniteGenuineRectangle
  refine Finset.sum_bij (fun j _hj => j + 2) ?hmem ?hinj ?hsurj ?hterm
  · intro j hj
    rw [Finset.mem_Icc]
    rw [Finset.mem_range] at hj
    change 2 ≤ j + 2 ∧ j + 2 ≤ N + 1
    omega
  · intro a _ha b _hb hab
    change a + 2 = b + 2 at hab
    omega
  · intro k hk
    rw [Finset.mem_Icc] at hk
    refine ⟨k - 2, ?_, ?_⟩
    · rw [Finset.mem_range]
      omega
    · change k - 2 + 2 = k
      omega
  · intro j _hj
    rfl

/-- Finite regularized two-core rectangles converge in depth to the
regularized two-core depth limit. -/
theorem tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
    {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Filter.Tendsto
      (fun N : ℕ => superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3)
      Filter.atTop
      (nhds (superGaussianTwoCoreDepthLimit X s)) := by
  have hhas :
      HasSum (fun j : ℕ => superGaussianTwoCoreDepthLayer X s j)
        (superGaussianTwoCoreDepthLimit X s) := by
    simpa [superGaussianTwoCoreDepthLimit] using
      (summable_superGaussianTwoCoreDepthLayer hs).hasSum
  have ht := hhas.tendsto_sum_nat
  simpa [superGaussianFiniteGenuineRectangle_three_eq_depthLayer_sum]
    using ht

/-- The positive finite norm floor survives the passage to the regularized
two-core depth limit. -/
theorem superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion
    {K : ℕ} (hK : 2 ≤ K) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreDepthStableRegion K s X →
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
  intro s X hstable
  refine
    norm_lower_bound_of_tendsto_of_eventually_norm_lower
      (tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
        hstable.1.1) ?_
  rw [Filter.eventually_atTop]
  refine ⟨K, ?_⟩
  intro N hKN
  have hKL : K ≤ N + 1 := le_trans hKN (Nat.le_succ N)
  exact
    (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
      hK hKL hstable).2

/-- The regularized two-core depth limit itself is nonzero on every
depth-stable point. -/
theorem superGaussianTwoCoreDepthLimit_ne_zero_on_depthStableRegion
    {K : ℕ} (hK : 2 ≤ K) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreDepthStableRegion K s X →
        superGaussianTwoCoreDepthLimit X s ≠ 0 := by
  intro s X hstable
  have hgap :
      0 <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1)) :=
    (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
      hK (le_refl K) hstable).1
  have hnorm :=
    superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion
      hK hstable
  exact norm_pos_iff.mp (lt_of_lt_of_le hgap hnorm)

/-- Pointwise infinite-depth two-core certificate: every unit-strip point has
a canonical dyadic64 depth whose positive gap lower-bounds the regularized
two-core depth limit, hence that limit is nonzero. -/
theorem exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
          ‖superGaussianTwoCoreDepthLimit
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · exact
      superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion
        hK hstable
  · exact
      superGaussianTwoCoreDepthLimit_ne_zero_on_depthStableRegion
        hK hstable

/-- One depth layer of a regularized finite-core genuine channel.  The depth
index `j` represents the actual C2 depth `j + 2`; the horizontal core cutoff is
the finite odd set `oddCoresUpTo M`. -/
noncomputable def superGaussianFiniteCoreDepthLayer
    (M : ℕ) (X : ℝ) (s : ℂ) (j : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo M,
    superGaussianGenuineAddressTerm 2 X s (j + 2) m

/-- Infinite-depth regularized finite-core limit at a fixed cutoff. -/
noncomputable def superGaussianFiniteCoreDepthLimit
    (M : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, superGaussianFiniteCoreDepthLayer M X s j

/-- Finite-core regularized depth layers are summable in the right half-plane.
The domination is purely geometric in depth because the horizontal core set is
finite. -/
theorem summable_superGaussianFiniteCoreDepthLayer_norm
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreDepthLayer M X s j‖ := by
  unfold superGaussianFiniteCoreDepthLayer
  let C : ℝ := 2 * (oddCoresUpTo M).card
  have hbound : ∀ j : ℕ,
      ‖∑ m ∈ oddCoresUpTo M,
          superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ ≤
        C * ((1 / 2 : ℝ) ^ (j + 2)) := by
    intro j
    calc
      ‖∑ m ∈ oddCoresUpTo M,
          superGaussianGenuineAddressTerm 2 X s (j + 2) m‖
          ≤ ∑ m ∈ oddCoresUpTo M,
              ‖superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ :=
            norm_sum_le _ _
      _ ≤ ∑ m ∈ oddCoresUpTo M,
              2 * ((1 / 2 : ℝ) ^ (j + 2)) := by
            refine Finset.sum_le_sum ?_
            intro m hm
            have hm_pos : 1 ≤ m := by
              rw [mem_oddCoresUpTo] at hm
              rcases hm.2 with ⟨r, hr⟩
              omega
            have hnorm_eq :
                ‖superGaussianGenuineAddressTerm 2 X s (j + 2) m‖ =
                  superGaussianGenuineAddressTermNorm 2 X s
                    (j + 2, m) := by
              unfold superGaussianGenuineAddressTermNorm
              rw [superGaussianGenuineAddressTerm_norm_eq]
            rw [hnorm_eq]
            exact
              superGaussianGenuineAddressTermNorm_le_unitStripCoreTerm
                hs hm_pos
      _ = C * ((1 / 2 : ℝ) ^ (j + 2)) := by
            simp [C, Finset.sum_const, nsmul_eq_mul]
            ring
  have hgeom : Summable fun j : ℕ => (1 / 2 : ℝ) ^ j :=
    summable_geometric_of_lt_one (by norm_num) (by norm_num)
  have hshift : Summable fun j : ℕ => (1 / 2 : ℝ) ^ (j + 2) := by
    have hmul := hgeom.mul_left ((1 / 2 : ℝ) ^ 2)
    simpa [pow_add, mul_assoc, mul_comm, mul_left_comm] using hmul
  have hmajor : Summable fun j : ℕ =>
      C * ((1 / 2 : ℝ) ^ (j + 2)) :=
    hshift.mul_left C
  exact
    Summable.of_nonneg_of_le
      (fun _ => norm_nonneg _)
      hbound
      hmajor

/-- Finite-core regularized depth layers are summable in the right
half-plane. -/
theorem summable_superGaussianFiniteCoreDepthLayer
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ => superGaussianFiniteCoreDepthLayer M X s j :=
  (summable_superGaussianFiniteCoreDepthLayer_norm M hs).of_norm

/-- Reindex the finite regularized rectangle with a finite horizontal core
cutoff by shifted depth `j = k - 2`. -/
theorem superGaussianFiniteGenuineRectangle_eq_finiteCoreDepthLayer_sum
    (M : ℕ) (X : ℝ) (s : ℂ) (N : ℕ) :
    superGaussianFiniteGenuineRectangle 2 X s (N + 1) M =
      ∑ j ∈ Finset.range N, superGaussianFiniteCoreDepthLayer M X s j := by
  symm
  unfold superGaussianFiniteCoreDepthLayer superGaussianFiniteGenuineRectangle
  refine Finset.sum_bij (fun j _hj => j + 2) ?hmem ?hinj ?hsurj ?hterm
  · intro j hj
    rw [Finset.mem_Icc]
    rw [Finset.mem_range] at hj
    change 2 ≤ j + 2 ∧ j + 2 ≤ N + 1
    omega
  · intro a _ha b _hb hab
    change a + 2 = b + 2 at hab
    omega
  · intro k hk
    rw [Finset.mem_Icc] at hk
    refine ⟨k - 2, ?_, ?_⟩
    · rw [Finset.mem_range]
      omega
    · change k - 2 + 2 = k
      omega
  · intro j _hj
    rfl

/-- Finite horizontal-core regularized rectangles converge in depth to their
finite-core depth limit. -/
theorem tendsto_superGaussianFiniteGenuineRectangle_succ_to_finiteCoreDepthLimit
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Filter.Tendsto
      (fun N : ℕ => superGaussianFiniteGenuineRectangle 2 X s (N + 1) M)
      Filter.atTop
      (nhds (superGaussianFiniteCoreDepthLimit M X s)) := by
  have hhas :
      HasSum (fun j : ℕ => superGaussianFiniteCoreDepthLayer M X s j)
        (superGaussianFiniteCoreDepthLimit M X s) := by
    simpa [superGaussianFiniteCoreDepthLimit] using
      (summable_superGaussianFiniteCoreDepthLayer M hs).hasSum
  have ht := hhas.tendsto_sum_nat
  simpa [superGaussianFiniteGenuineRectangle_eq_finiteCoreDepthLayer_sum]
    using ht

/-- Layerwise depth-tail norm upper for a finite horizontal-core limit after
the first `N` shifted depth layers.  This is the finite-core analogue of the
visible band/extra saldo uppers: it keeps the central approximation tail in the
actual regularized C2 layers. -/
noncomputable def superGaussianFiniteCoreDepthTailNormUpper
    (M : ℕ) (X : ℝ) (s : ℂ) (N : ℕ) : ℝ :=
  ∑' j : ℕ, ‖superGaussianFiniteCoreDepthLayer M X s (N + j)‖

/-- The finite-core depth-tail norm upper tends to zero as the depth cutoff
moves to infinity. -/
theorem superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero
    (M : ℕ) (X : ℝ) (s : ℂ) :
    Filter.Tendsto
      (fun N : ℕ => superGaussianFiniteCoreDepthTailNormUpper M X s N)
      Filter.atTop (nhds 0) := by
  unfold superGaussianFiniteCoreDepthTailNormUpper
  simpa [Nat.add_comm] using
    tendsto_sum_nat_add
      (fun j : ℕ => ‖superGaussianFiniteCoreDepthLayer M X s j‖)

/-- Any positive real budget eventually absorbs the finite-core depth-tail norm
upper. -/
theorem exists_superGaussianFiniteCoreDepthTailNormUpper_lt
    (M : ℕ) (X : ℝ) (s : ℂ) {eps : ℝ} (heps : 0 < eps) :
    ∃ N : ℕ, superGaussianFiniteCoreDepthTailNormUpper M X s N < eps := by
  have htendsto :=
    superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero M X s
  have heventually :
      ∀ᶠ N : ℕ in Filter.atTop,
        dist (superGaussianFiniteCoreDepthTailNormUpper M X s N) 0 < eps :=
    (Metric.tendsto_nhds.mp htendsto) eps heps
  rw [Filter.eventually_atTop] at heventually
  obtain ⟨N, hN⟩ := heventually
  refine ⟨N, ?_⟩
  have hdist := hN N (le_refl N)
  rw [Real.dist_eq] at hdist
  have habs :
      |superGaussianFiniteCoreDepthTailNormUpper M X s N| < eps := by
    simpa using hdist
  exact lt_of_le_of_lt (le_abs_self _) habs

/-- The finite-core depth limit differs from its finite depth prefix by no more
than the visible layerwise depth-tail norm upper. -/
theorem superGaussianFiniteCoreDepthLimit_sub_rectangle_norm_le_depthTail
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) (N : ℕ) :
    ‖superGaussianFiniteCoreDepthLimit M X s -
        superGaussianFiniteGenuineRectangle 2 X s (N + 1) M‖ ≤
      superGaussianFiniteCoreDepthTailNormUpper M X s N := by
  have hsum := summable_superGaussianFiniteCoreDepthLayer M (X := X) hs
  have hnorm :=
    summable_superGaussianFiniteCoreDepthLayer_norm M (X := X) hs
  have htail_norm : Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreDepthLayer M X s (N + j)‖ :=
    hnorm.comp_injective (by
      intro a b h
      exact Nat.add_left_cancel h)
  have hsplit :
      superGaussianFiniteCoreDepthLimit M X s =
        (∑ j ∈ Finset.range N,
          superGaussianFiniteCoreDepthLayer M X s j) +
          ∑' j : ℕ,
            superGaussianFiniteCoreDepthLayer M X s (N + j) := by
    unfold superGaussianFiniteCoreDepthLimit
    simpa [Nat.add_comm] using (hsum.sum_add_tsum_nat_add N).symm
  have hrect :
      superGaussianFiniteGenuineRectangle 2 X s (N + 1) M =
        ∑ j ∈ Finset.range N,
          superGaussianFiniteCoreDepthLayer M X s j :=
    superGaussianFiniteGenuineRectangle_eq_finiteCoreDepthLayer_sum
      M X s N
  calc
    ‖superGaussianFiniteCoreDepthLimit M X s -
        superGaussianFiniteGenuineRectangle 2 X s (N + 1) M‖
        = ‖∑' j : ℕ,
            superGaussianFiniteCoreDepthLayer M X s (N + j)‖ := by
          rw [hsplit, hrect]
          ring_nf
    _ ≤ ∑' j : ℕ,
          ‖superGaussianFiniteCoreDepthLayer M X s (N + j)‖ :=
        norm_tsum_le_tsum_norm htail_norm

/-- Symmetric spelling of the finite-core depth-tail bound. -/
theorem superGaussianFiniteCoreRectangle_sub_depthLimit_norm_le_depthTail
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) (N : ℕ) :
    ‖superGaussianFiniteGenuineRectangle 2 X s (N + 1) M -
        superGaussianFiniteCoreDepthLimit M X s‖ ≤
      superGaussianFiniteCoreDepthTailNormUpper M X s N := by
  simpa [dist_eq_norm, norm_sub_rev] using
    superGaussianFiniteCoreDepthLimit_sub_rectangle_norm_le_depthTail
      M (X := X) hs N

/-- The central-to-finite-core saldo can be paid by a finite genuine
approximation error plus the visible regularized depth tail. -/
theorem genuineCentral_sub_finiteCoreDepthLimit_norm_le_approx_add_depthTail
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) (N : ℕ) :
    ‖genuineCentralDoubleSeries s -
        superGaussianFiniteCoreDepthLimit M X s‖ ≤
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (N + 1) M‖ +
        superGaussianFiniteCoreDepthTailNormUpper M X s N := by
  have htail :=
    superGaussianFiniteCoreRectangle_sub_depthLimit_norm_le_depthTail
      M (X := X) hs N
  have htri :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ ≤
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) M‖ +
          ‖superGaussianFiniteGenuineRectangle 2 X s (N + 1) M -
            superGaussianFiniteCoreDepthLimit M X s‖ := by
    calc
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖
          =
        ‖(genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) M) +
          (superGaussianFiniteGenuineRectangle 2 X s (N + 1) M -
            superGaussianFiniteCoreDepthLimit M X s)‖ := by
            ring_nf
      _ ≤
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) M‖ +
          ‖superGaussianFiniteGenuineRectangle 2 X s (N + 1) M -
            superGaussianFiniteCoreDepthLimit M X s‖ := norm_add_le _ _
  linarith

/-- The finite-core depth limit with `M = 3` is exactly the already certified
two-core depth limit. -/
theorem superGaussianFiniteCoreDepthLimit_three_eq_twoCoreDepthLimit
    (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreDepthLimit 3 X s =
      superGaussianTwoCoreDepthLimit X s := by
  rfl

/-- Exact layerwise saldo upper between a finite horizontal-core depth limit and
the certified two-core depth limit.  This is intentionally not closed-form: it
keeps the real geometric saldo visible as the sum of the norms of the actual
layer differences. -/
noncomputable def superGaussianFiniteCoreSaldoNormUpper
    (M : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑' j : ℕ,
    ‖superGaussianFiniteCoreDepthLayer M X s j -
      superGaussianTwoCoreDepthLayer X s j‖

/-- The visible extra-core layer above the certified two-core channel.  For
`M >= 3`, this is exactly the layerwise saldo between the finite-core channel
and the two-core channel. -/
noncomputable def superGaussianFiniteCoreExtraDepthLayer
    (M : ℕ) (X : ℝ) (s : ℂ) (j : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo M \ oddCoresUpTo 3,
    superGaussianGenuineAddressTerm 2 X s (j + 2) m

/-- The finite-core layer splits into the certified two-core layer plus the
visible extra-core layer. -/
theorem superGaussianFiniteCoreDepthLayer_eq_twoCore_add_extra
    {M : ℕ} (hM : 3 ≤ M) (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreDepthLayer M X s j =
      superGaussianTwoCoreDepthLayer X s j +
        superGaussianFiniteCoreExtraDepthLayer M X s j := by
  unfold superGaussianFiniteCoreDepthLayer superGaussianTwoCoreDepthLayer
    superGaussianFiniteCoreExtraDepthLayer
  have hsubset : oddCoresUpTo 3 ⊆ oddCoresUpTo M :=
    oddCoresUpTo_subset_of_le hM
  rw [← Finset.sum_sdiff hsubset]
  ring

/-- The layerwise finite-core/two-core saldo is exactly the visible extra-core
layer. -/
theorem superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra
    {M : ℕ} (hM : 3 ≤ M) (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreDepthLayer M X s j -
      superGaussianTwoCoreDepthLayer X s j =
        superGaussianFiniteCoreExtraDepthLayer M X s j := by
  rw [superGaussianFiniteCoreDepthLayer_eq_twoCore_add_extra hM]
  ring

/-- The visible extra-core saldo upper: sum of norms of the actual extra-core
layers above the certified two-core channel. -/
noncomputable def superGaussianFiniteCoreExtraSaldoNormUpper
    (M : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑' j : ℕ, ‖superGaussianFiniteCoreExtraDepthLayer M X s j‖

/-- For `M >= 3`, the abstract layerwise saldo upper is exactly the visible
extra-core saldo upper. -/
theorem superGaussianFiniteCoreSaldoNormUpper_eq_extraSaldoNormUpper
    {M : ℕ} (hM : 3 ≤ M) (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreSaldoNormUpper M X s =
      superGaussianFiniteCoreExtraSaldoNormUpper M X s := by
  unfold superGaussianFiniteCoreSaldoNormUpper
    superGaussianFiniteCoreExtraSaldoNormUpper
  congr
  funext j
  rw [superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra hM]

/-- The layerwise finite-core/two-core saldo is summable in the right
half-plane. -/
theorem summable_superGaussianFiniteCoreSaldoLayer_norm
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreDepthLayer M X s j -
        superGaussianTwoCoreDepthLayer X s j‖ := by
  have hM :=
    summable_superGaussianFiniteCoreDepthLayer_norm M (X := X) hs
  have h3 := summable_superGaussianTwoCoreDepthLayer_norm (X := X) hs
  have hmajor : Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreDepthLayer M X s j‖ +
        ‖superGaussianTwoCoreDepthLayer X s j‖ :=
    hM.add h3
  refine Summable.of_nonneg_of_le (fun _ => norm_nonneg _) ?_ hmajor
  intro j
  exact norm_sub_le _ _

/-- Infinite-depth limit of the visible extra-core saldo above the certified
two-core channel. -/
noncomputable def superGaussianFiniteCoreExtraDepthLimit
    (M : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, superGaussianFiniteCoreExtraDepthLayer M X s j

/-- The visible extra-core layers are summable whenever `M >= 3`. -/
theorem summable_superGaussianFiniteCoreExtraDepthLayer_norm
    {M : ℕ} (hM : 3 ≤ M) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreExtraDepthLayer M X s j‖ := by
  have hsaldo := summable_superGaussianFiniteCoreSaldoLayer_norm M (X := X) hs
  refine hsaldo.congr ?_
  intro j
  rw [superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra hM]

/-- The visible extra-core layers are summable as complex terms whenever
`M >= 3`. -/
theorem summable_superGaussianFiniteCoreExtraDepthLayer
    {M : ℕ} (hM : 3 ≤ M) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      superGaussianFiniteCoreExtraDepthLayer M X s j :=
  (summable_superGaussianFiniteCoreExtraDepthLayer_norm hM hs).of_norm

/-- The finite-core/two-core depth-limit saldo is exactly the infinite sum of
the visible extra-core layers. -/
theorem superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra
    {M : ℕ} (hM : 3 ≤ M) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteCoreDepthLimit M X s -
        superGaussianTwoCoreDepthLimit X s =
      superGaussianFiniteCoreExtraDepthLimit M X s := by
  have hMsum := summable_superGaussianFiniteCoreDepthLayer M (X := X) hs
  have h3 := summable_superGaussianTwoCoreDepthLayer (X := X) hs
  have hsub := hMsum.tsum_sub h3
  unfold superGaussianFiniteCoreDepthLimit superGaussianTwoCoreDepthLimit
    superGaussianFiniteCoreExtraDepthLimit
  rw [← hsub]
  congr
  funext j
  rw [superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra hM]

/-- Exact decomposition of a finite horizontal-core depth limit into the
certified two-core depth limit plus the visible extra-core saldo limit. -/
theorem superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra
    {M : ℕ} (hM : 3 ≤ M) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteCoreDepthLimit M X s =
      superGaussianTwoCoreDepthLimit X s +
        superGaussianFiniteCoreExtraDepthLimit M X s := by
  have h :=
    superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra
      hM (X := X) hs
  rw [← h]
  ring

/-- The visible extra-core saldo upper bounds the norm of the exact extra-core
saldo limit. -/
theorem superGaussianFiniteCoreExtraDepthLimit_norm_le_extraSaldoUpper
    {M : ℕ} (hM : 3 ≤ M) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ ≤
      superGaussianFiniteCoreExtraSaldoNormUpper M X s := by
  have hextra :=
    summable_superGaussianFiniteCoreExtraDepthLayer_norm hM (X := X) hs
  unfold superGaussianFiniteCoreExtraDepthLimit
    superGaussianFiniteCoreExtraSaldoNormUpper
  exact norm_tsum_le_tsum_norm hextra

/-- At the certified two-core horizontal cutoff there is no extra-core layer. -/
theorem superGaussianFiniteCoreExtraDepthLayer_three_eq_zero
    (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreExtraDepthLayer 3 X s j = 0 := by
  unfold superGaussianFiniteCoreExtraDepthLayer
  simp

/-- At the certified two-core horizontal cutoff there is no extra-core saldo. -/
theorem superGaussianFiniteCoreExtraDepthLimit_three_eq_zero
    (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreExtraDepthLimit 3 X s = 0 := by
  unfold superGaussianFiniteCoreExtraDepthLimit
  simp [superGaussianFiniteCoreExtraDepthLayer_three_eq_zero]

/-- At the certified two-core horizontal cutoff there is no extra-core saldo
upper either. -/
theorem superGaussianFiniteCoreExtraSaldoNormUpper_three_eq_zero
    (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreExtraSaldoNormUpper 3 X s = 0 := by
  unfold superGaussianFiniteCoreExtraSaldoNormUpper
  simp [superGaussianFiniteCoreExtraDepthLayer_three_eq_zero]

/-- The finite horizontal band between two odd-core cutoffs.  This is the
visible layerwise saldo added when the horizontal cutoff moves from `M` to
`N`. -/
noncomputable def superGaussianFiniteCoreBandDepthLayer
    (M N : ℕ) (X : ℝ) (s : ℂ) (j : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo N \ oddCoresUpTo M,
    superGaussianGenuineAddressTerm 2 X s (j + 2) m

/-- Increasing the finite horizontal cutoff from `M` to `N` adds exactly the
finite horizontal band. -/
theorem superGaussianFiniteCoreDepthLayer_eq_lower_add_band
    {M N : ℕ} (hMN : M ≤ N) (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreDepthLayer N X s j =
      superGaussianFiniteCoreDepthLayer M X s j +
        superGaussianFiniteCoreBandDepthLayer M N X s j := by
  unfold superGaussianFiniteCoreDepthLayer
    superGaussianFiniteCoreBandDepthLayer
  have hsubset : oddCoresUpTo M ⊆ oddCoresUpTo N :=
    oddCoresUpTo_subset_of_le hMN
  rw [← Finset.sum_sdiff hsubset]
  ring

/-- The layerwise finite-core saldo between two horizontal cutoffs is exactly
the finite horizontal band. -/
theorem superGaussianFiniteCoreDepthLayer_sub_lower_eq_band
    {M N : ℕ} (hMN : M ≤ N) (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreDepthLayer N X s j -
      superGaussianFiniteCoreDepthLayer M X s j =
        superGaussianFiniteCoreBandDepthLayer M N X s j := by
  rw [superGaussianFiniteCoreDepthLayer_eq_lower_add_band hMN]
  ring

/-- The visible finite horizontal band saldo upper. -/
noncomputable def superGaussianFiniteCoreBandSaldoNormUpper
    (M N : ℕ) (X : ℝ) (s : ℂ) : ℝ :=
  ∑' j : ℕ, ‖superGaussianFiniteCoreBandDepthLayer M N X s j‖

/-- The finite horizontal band layers are summable in the right half-plane. -/
theorem summable_superGaussianFiniteCoreBandDepthLayer_norm
    {M N : ℕ} (hMN : M ≤ N) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreBandDepthLayer M N X s j‖ := by
  have hN := summable_superGaussianFiniteCoreDepthLayer_norm N (X := X) hs
  have hM := summable_superGaussianFiniteCoreDepthLayer_norm M (X := X) hs
  have hmajor : Summable fun j : ℕ =>
      ‖superGaussianFiniteCoreDepthLayer N X s j‖ +
        ‖superGaussianFiniteCoreDepthLayer M X s j‖ :=
    hN.add hM
  refine Summable.of_nonneg_of_le (fun _ => norm_nonneg _) ?_ hmajor
  intro j
  calc
    ‖superGaussianFiniteCoreBandDepthLayer M N X s j‖ =
        ‖superGaussianFiniteCoreDepthLayer N X s j -
          superGaussianFiniteCoreDepthLayer M X s j‖ := by
          rw [superGaussianFiniteCoreDepthLayer_sub_lower_eq_band hMN]
    _ ≤
        ‖superGaussianFiniteCoreDepthLayer N X s j‖ +
          ‖superGaussianFiniteCoreDepthLayer M X s j‖ := norm_sub_le _ _

/-- The finite horizontal band layers are summable as complex terms in the
right half-plane. -/
theorem summable_superGaussianFiniteCoreBandDepthLayer
    {M N : ℕ} (hMN : M ≤ N) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      superGaussianFiniteCoreBandDepthLayer M N X s j :=
  (summable_superGaussianFiniteCoreBandDepthLayer_norm hMN hs).of_norm

/-- Infinite-depth limit of the visible finite horizontal band. -/
noncomputable def superGaussianFiniteCoreBandDepthLimit
    (M N : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, superGaussianFiniteCoreBandDepthLayer M N X s j

/-- The finite-core depth-limit saldo between two horizontal cutoffs is exactly
the infinite-depth limit of the finite horizontal band. -/
theorem superGaussianFiniteCoreDepthLimit_sub_lower_eq_band
    {M N : ℕ} (hMN : M ≤ N) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteCoreDepthLimit N X s -
        superGaussianFiniteCoreDepthLimit M X s =
      superGaussianFiniteCoreBandDepthLimit M N X s := by
  have hN := summable_superGaussianFiniteCoreDepthLayer N (X := X) hs
  have hM := summable_superGaussianFiniteCoreDepthLayer M (X := X) hs
  have hsub := hN.tsum_sub hM
  unfold superGaussianFiniteCoreDepthLimit
    superGaussianFiniteCoreBandDepthLimit
  rw [← hsub]
  congr
  funext j
  rw [superGaussianFiniteCoreDepthLayer_sub_lower_eq_band hMN]

/-- Exact decomposition of a larger finite horizontal-core depth limit into a
smaller finite-core depth limit plus the visible finite horizontal band. -/
theorem superGaussianFiniteCoreDepthLimit_eq_lower_add_band
    {M N : ℕ} (hMN : M ≤ N) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteCoreDepthLimit N X s =
      superGaussianFiniteCoreDepthLimit M X s +
        superGaussianFiniteCoreBandDepthLimit M N X s := by
  have h :=
    superGaussianFiniteCoreDepthLimit_sub_lower_eq_band
      hMN (X := X) hs
  rw [← h]
  ring

/-- The finite horizontal band saldo upper bounds the norm of the exact band
depth limit. -/
theorem superGaussianFiniteCoreBandDepthLimit_norm_le_bandSaldoUpper
    {M N : ℕ} (hMN : M ≤ N) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ ≤
      superGaussianFiniteCoreBandSaldoNormUpper M N X s := by
  have hband :=
    summable_superGaussianFiniteCoreBandDepthLayer_norm hMN (X := X) hs
  unfold superGaussianFiniteCoreBandDepthLimit
    superGaussianFiniteCoreBandSaldoNormUpper
  exact norm_tsum_le_tsum_norm hband

/-- There is no finite band between a horizontal cutoff and itself. -/
theorem superGaussianFiniteCoreBandDepthLayer_self_eq_zero
    (M : ℕ) (X : ℝ) (s : ℂ) (j : ℕ) :
    superGaussianFiniteCoreBandDepthLayer M M X s j = 0 := by
  unfold superGaussianFiniteCoreBandDepthLayer
  simp

/-- The exact finite band saldo vanishes when the two horizontal cutoffs agree. -/
theorem superGaussianFiniteCoreBandDepthLimit_self_eq_zero
    (M : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreBandDepthLimit M M X s = 0 := by
  unfold superGaussianFiniteCoreBandDepthLimit
  simp [superGaussianFiniteCoreBandDepthLayer_self_eq_zero]

/-- The finite band saldo upper also vanishes when the two horizontal cutoffs
agree. -/
theorem superGaussianFiniteCoreBandSaldoNormUpper_self_eq_zero
    (M : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteCoreBandSaldoNormUpper M M X s = 0 := by
  unfold superGaussianFiniteCoreBandSaldoNormUpper
  simp [superGaussianFiniteCoreBandDepthLayer_self_eq_zero]

/-- Exact two-step decomposition from the certified two-core limit to any
larger finite horizontal cutoff, through an intermediate cutoff `M`. -/
theorem superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N)
    {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    superGaussianFiniteCoreDepthLimit N X s =
      superGaussianTwoCoreDepthLimit X s +
        superGaussianFiniteCoreExtraDepthLimit M X s +
          superGaussianFiniteCoreBandDepthLimit M N X s := by
  rw [superGaussianFiniteCoreDepthLimit_eq_lower_add_band hMN hs]
  rw [superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra hM hs]

/-- A larger finite horizontal-core limit cannot cancel if the exact
intermediate extra saldo plus the exact outer finite band stays below the
certified two-core norm. -/
theorem superGaussianFiniteCoreDepthLimit_ne_zero_of_extra_band_lt_twoCoreNorm
    {M N : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    superGaussianFiniteCoreDepthLimit N X s ≠ 0 := by
  have hdefect :
      ‖superGaussianFiniteCoreDepthLimit N X s -
          superGaussianTwoCoreDepthLimit X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖ := by
    have htri :
        ‖superGaussianFiniteCoreDepthLimit N X s -
            superGaussianTwoCoreDepthLimit X s‖ ≤
          ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ := by
      calc
        ‖superGaussianFiniteCoreDepthLimit N X s -
            superGaussianTwoCoreDepthLimit X s‖ =
          ‖superGaussianFiniteCoreExtraDepthLimit M X s +
            superGaussianFiniteCoreBandDepthLimit M N X s‖ := by
              rw [
                superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band
                  hM hMN hs]
              ring_nf
        _ ≤
          ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ := norm_add_le _ _
    linarith
  have hnonzero :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit N X s -
            superGaussianTwoCoreDepthLimit X s) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound
      (le_refl ‖superGaussianTwoCoreDepthLimit X s‖)
      hdefect
  have hsum :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit N X s -
            superGaussianTwoCoreDepthLimit X s) =
        superGaussianFiniteCoreDepthLimit N X s := by
    ring
  rwa [hsum] at hnonzero

/-- The norm of the finite-core/two-core depth-limit saldo is bounded by the
sum of the norms of the actual layerwise saldos. -/
theorem superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_norm_le_saldo
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    ‖superGaussianFiniteCoreDepthLimit M X s -
      superGaussianTwoCoreDepthLimit X s‖ ≤
        superGaussianFiniteCoreSaldoNormUpper M X s := by
  have hM := summable_superGaussianFiniteCoreDepthLayer M (X := X) hs
  have h3 := summable_superGaussianTwoCoreDepthLayer (X := X) hs
  have hsaldo :=
    summable_superGaussianFiniteCoreSaldoLayer_norm M (X := X) hs
  have htsum :
      (∑' j : ℕ,
        (superGaussianFiniteCoreDepthLayer M X s j -
          superGaussianTwoCoreDepthLayer X s j)) =
        superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s := by
    rw [hM.tsum_sub h3]
    rfl
  rw [← htsum]
  simpa [superGaussianFiniteCoreSaldoNormUpper] using
    norm_tsum_le_tsum_norm hsaldo

/-- Direct non-cancellation for a finite horizontal-core depth limit from the
visible saldo upper: if the extra finite-core saldo is smaller than the actual
two-core norm, it cannot cancel the certified two-core block. -/
theorem superGaussianFiniteCoreDepthLimit_ne_zero_of_saldoUpper_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (hupper :
      superGaussianFiniteCoreSaldoNormUpper M X s <
        ‖superGaussianTwoCoreDepthLimit X s‖) :
    superGaussianFiniteCoreDepthLimit M X s ≠ 0 := by
  have hdefect :
      ‖superGaussianFiniteCoreDepthLimit M X s -
        superGaussianTwoCoreDepthLimit X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ :=
    lt_of_le_of_lt
      (superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_norm_le_saldo
        M hs)
      hupper
  have hnonzero :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit M X s -
            superGaussianTwoCoreDepthLimit X s) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound
      (le_refl ‖superGaussianTwoCoreDepthLimit X s‖)
      hdefect
  have hsum :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit M X s -
            superGaussianTwoCoreDepthLimit X s) =
        superGaussianFiniteCoreDepthLimit M X s := by
    ring
  rwa [hsum] at hnonzero

/-- Direct non-cancellation for a finite horizontal-core depth limit from the
visible extra-core saldo. -/
theorem superGaussianFiniteCoreDepthLimit_ne_zero_of_extraSaldo_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hM : 3 ≤ M) (hs : 0 < s.re)
    (hupper :
      superGaussianFiniteCoreExtraSaldoNormUpper M X s <
        ‖superGaussianTwoCoreDepthLimit X s‖) :
    superGaussianFiniteCoreDepthLimit M X s ≠ 0 := by
  exact
    superGaussianFiniteCoreDepthLimit_ne_zero_of_saldoUpper_lt_twoCoreNorm
      hs
      (by
        simpa [superGaussianFiniteCoreSaldoNormUpper_eq_extraSaldoNormUpper
          hM X s] using hupper)

/-- If a finite horizontal-core depth limit stays within the certified
two-core gap, then that finite-core limit cannot cancel. -/
theorem superGaussianFiniteCoreDepthLimit_ne_zero_of_twoCoreDefect_lt_gap
    {K M : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (hdefect :
      ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1))) :
    superGaussianFiniteCoreDepthLimit M X s ≠ 0 := by
  let gap : ℝ :=
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
      8 * ((1 / 2 : ℝ) ^ (K + 1))
  have hfloor : gap ≤ ‖superGaussianTwoCoreDepthLimit X s‖ := by
    simpa [gap] using
      superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion
        hK hstable
  have hnonzero :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit M X s -
            superGaussianTwoCoreDepthLimit X s) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound hfloor
      (by simpa [gap] using hdefect)
  have hsum :
      superGaussianTwoCoreDepthLimit X s +
          (superGaussianFiniteCoreDepthLimit M X s -
            superGaussianTwoCoreDepthLimit X s) =
        superGaussianFiniteCoreDepthLimit M X s := by
    ring
  rwa [hsum] at hnonzero

/-- Pointwise finite-core extension criterion at the canonical dyadic64 depth:
after Lean chooses the depth-stable two-core gap, any finite horizontal-core
limit whose distance from the two-core limit is below that gap is nonzero. -/
theorem exists_tailStableDyadic64_finiteCoreDepthLimitCriterion
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) (M : ℕ) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        (‖superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) →
          superGaussianFiniteCoreDepthLimit M
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0) := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro hdefect
    exact
      superGaussianFiniteCoreDepthLimit_ne_zero_of_twoCoreDefect_lt_gap
        hK hstable hdefect

/-- For depths `K >= 3`, the finite dyadic reciprocal region is contained in
the earlier reciprocal-768 region.  This lets the new finite-depth package reuse
older restored-block and remainder bridges when those hypotheses are needed. -/
theorem superGaussianTwoCoreReciprocal768ScaleRegion_of_finiteDyadic64
    {K : ℕ} (hK : 3 ≤ K) {s : ℂ} {X : ℝ}
    (hs :
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X) :
    superGaussianTwoCoreReciprocal768ScaleRegion s X := by
  have hpow_ge : (16 : ℝ) ≤ (2 : ℝ) ^ (K + 1) := by
    calc
      (16 : ℝ) = (2 : ℝ) ^ 4 := by norm_num
      _ ≤ (2 : ℝ) ^ (K + 1) := by
          exact pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2)
            (by omega : 4 ≤ K + 1)
  have hA :
      (768 : ℝ) ≤ 64 * (2 : ℝ) ^ (K + 1) := by
    nlinarith
  have hscale_le :
      superGaussianTwoCoreReciprocalCutoffScale 768 s ≤
        superGaussianFiniteTwoCoreReciprocalCutoffScale K s := by
    unfold superGaussianFiniteTwoCoreReciprocalCutoffScale
      superGaussianTwoCoreReciprocalCutoffScale
    exact div_le_div_of_nonneg_right hA (le_of_lt hs.1)
  exact ⟨hs.1, hs.2.1, le_trans hscale_le hs.2.2⟩

/-- The restored two-core lower envelope is available on the finite dyadic
reciprocal region as soon as `K >= 3`, because that region is contained in the
reciprocal-768 region. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerOn_finiteDyadic64
    {K : ℕ} (hK : 3 ≤ K) :
    SuperGaussianTwoCoreGenuineBlockNormLowerOn 2
      (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K)
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) := by
  intro s X hs
  exact superGaussianTwoCoreGenuineBlockNormLowerOn_two_reciprocal768
    (superGaussianTwoCoreReciprocal768ScaleRegion_of_finiteDyadic64 hK hs)

/-- The restored two-core lower envelope is strictly positive on the finite
dyadic reciprocal region.  This is the finite-depth margin against which the
remaining genuine middle remainder should be compared. -/
theorem superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64
    {K : ℕ} (hK : 3 ≤ K) :
    SuperGaussianTwoCoreGenuineBlockNormLowerPositiveOn
      (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K)
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) := by
  intro s X hs
  exact superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768
    (superGaussianTwoCoreReciprocal768ScaleRegion_of_finiteDyadic64 hK hs)

/-- Finite dyadic reciprocal extension criterion: on the natural finite-depth
cutoff region, any genuine middle extension whose remainder is below the
restored two-core lower profile is nonzero. -/
theorem superGaussianTwoCoreGenuineExtensionNonvanishingOn_finiteDyadic64_of_profileLower
    {K : ℕ} (hK : 3 ≤ K) {remainder : ℂ → ℝ → ℂ}
    (hrem :
      SuperGaussianTwoCoreGenuineRemainderBelowOn
        (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K)
        remainder
        (superGaussianTwoCoreGenuineBlockNormLowerProfile 2)) :
    SuperGaussianTwoCoreGenuineExtensionNonvanishingOn 2
      (superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K)
      remainder :=
  superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_blockNormLowerOn
    (superGaussianTwoCoreGenuineBlockNormLowerOn_finiteDyadic64 hK)
    hrem

/-- Explicit finite middle region where the geometric remainder is controlled
by the restored two-core lower profile.  This is only genuine bookkeeping:
finite dyadic cutoff plus the real address-sum remainder inequality. -/
def superGaussianFiniteGenuineRectangleRemainderControlledRegion
    (K M : ℕ) : CutoffRegion :=
  fun s X =>
    superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X ∧
      superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s <
        superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X

/-- A pointwise remainder-upper estimate upgrades the finite dyadic reciprocal
region into the named remainder-controlled region. -/
theorem superGaussianFiniteGenuineRectangleRemainderControlledRegion_of_finiteDyadic64
    {K M : ℕ}
    (hupper :
      ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
        superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
          superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s <
            superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
        superGaussianFiniteGenuineRectangleRemainderControlledRegion K M
          s X := by
  intro s X hs
  exact ⟨hs, hupper hs⟩

/-- The minimal finite two-core block lies in the remainder-controlled region
on its whole finite dyadic reciprocal cutoff region. -/
theorem superGaussianFiniteGenuineRectangleRemainderControlledRegion_five_three_of_finiteDyadic64 :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion 5 s X →
        superGaussianFiniteGenuineRectangleRemainderControlledRegion 5 3
          s X := by
  apply
    superGaussianFiniteGenuineRectangleRemainderControlledRegion_of_finiteDyadic64
  intro s X hs
  rw [superGaussianFiniteGenuineRectangleRemainderNormUpper_five_three_eq_zero]
  simpa using
    (superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64
      (K := 5) (by norm_num) hs)

/-- Simpler finite two-core tail-dominated region: finite dyadic cutoff plus a
pointwise comparison of the dyadic tail upper against the restored lower
profile.  This replaces the address-sum remainder upper by a phase-free C2
tail envelope. -/
def superGaussianFiniteTwoCoreTailDominatedRegion
    (K : ℕ) : CutoffRegion :=
  fun s X =>
    superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X ∧
      superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K <
        superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X

/-- Tail domination implies membership in the remainder-controlled region for
the finite two-core rectangle. -/
theorem superGaussianFiniteTwoCoreTailDominatedRegion_subset_remainderControlled
    {K : ℕ} :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreTailDominatedRegion K s X →
        superGaussianFiniteGenuineRectangleRemainderControlledRegion K 3
          s X := by
  intro s X hs
  exact ⟨hs.1,
    lt_of_le_of_lt
      (superGaussianFiniteGenuineRectangleRemainderNormUpper_two_three_le_unitStripTailUpper
        hs.1.1)
      hs.2⟩

/-- The minimal `5 x 3` block belongs to the tail-dominated region throughout
the finite dyadic reciprocal cutoff region. -/
theorem superGaussianFiniteTwoCoreTailDominatedRegion_five_of_finiteDyadic64 :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion 5 s X →
        superGaussianFiniteTwoCoreTailDominatedRegion 5 s X := by
  intro s X hs
  refine ⟨hs, ?_⟩
  rw [superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_five_eq_zero]
  simpa using
    (superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64
      (K := 5) (by norm_num) hs)

/-- A concrete sufficient condition for tail domination: the restored lower
profile is bigger than the universal dyadic tail cap `1 / 8`. -/
theorem superGaussianFiniteTwoCoreTailDominatedRegion_of_lowerProfile_gt_one_eighth
    {K : ℕ} {s : ℂ} {X : ℝ}
    (hs : superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X)
    (hlower :
      (1 / 8 : ℝ) <
        superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X) :
    superGaussianFiniteTwoCoreTailDominatedRegion K s X := by
  exact ⟨hs,
    lt_of_le_of_lt
      (superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_le_one_eighth K)
      hlower⟩

/-- The tail-dominated finite two-core region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianFiniteTwoCoreTailDominatedRegion
    {K : ℕ} :
    PositiveCutoffRegionOn
      (superGaussianFiniteTwoCoreTailDominatedRegion K) := by
  intro s X hs
  exact positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
    hs.1

/-- The remainder-controlled finite region is a positive cutoff region. -/
theorem positiveCutoffRegionOn_superGaussianFiniteGenuineRectangleRemainderControlledRegion
    {K M : ℕ} :
    PositiveCutoffRegionOn
      (superGaussianFiniteGenuineRectangleRemainderControlledRegion K M) := by
  intro s X hs
  exact positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion
    hs.1

/-- The named remainder-controlled finite region supplies the remainder-below
package expected by the extension bridge. -/
theorem superGaussianFiniteGenuineRectangleRemainderBelowOn_controlledRegion
    {K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M) :
    SuperGaussianTwoCoreGenuineRemainderBelowOn
      (superGaussianFiniteGenuineRectangleRemainderControlledRegion K M)
      (superGaussianFiniteGenuineRectangleRemainder 2 K M)
      (superGaussianTwoCoreGenuineBlockNormLowerProfile 2) := by
  intro s X hs
  exact lt_of_le_of_lt
    (superGaussianFiniteGenuineRectangleRemainder_norm_le_upper hK hM X s)
    hs.2

/-- Non-cancellation on the named finite remainder-controlled region. -/
theorem superGaussianFiniteGenuineRectangle_nonvanishingOn_remainderControlledRegion
    {K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteGenuineRectangleRemainderControlledRegion K M s X →
        superGaussianFiniteGenuineRectangle 2 X s K M ≠ 0 := by
  intro s X hs
  rw [superGaussianFiniteGenuineRectangle_eq_extension]
  exact
    superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt_lower
      (superGaussianTwoCoreGenuineBlock_norm_lower_bound 2 X s)
      (lt_of_le_of_lt
        (superGaussianFiniteGenuineRectangleRemainder_norm_le_upper
          hK hM X s)
        hs.2)

/-- Non-cancellation for finite two-core rectangles on the tail-dominated
region. -/
theorem superGaussianFiniteGenuineRectangle_three_nonvanishingOn_tailDominatedRegion
    {K : ℕ} (hK : 5 ≤ K) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreTailDominatedRegion K s X →
        superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 := by
  intro s X hs
  exact
    superGaussianFiniteGenuineRectangle_nonvanishingOn_remainderControlledRegion
      hK (by norm_num)
      (superGaussianFiniteTwoCoreTailDominatedRegion_subset_remainderControlled
        hs)

/-- Pointwise finite two-core non-cancellation from the concrete `1 / 8`
tail-cap comparison. -/
theorem superGaussianFiniteGenuineRectangle_three_ne_zero_of_lowerProfile_gt_one_eighth
    {K : ℕ} {s : ℂ} {X : ℝ} (hK : 5 ≤ K)
    (hs : superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X)
    (hlower :
      (1 / 8 : ℝ) <
        superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X) :
    superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangle_three_nonvanishingOn_tailDominatedRegion
    hK
    (superGaussianFiniteTwoCoreTailDominatedRegion_of_lowerProfile_gt_one_eighth
      hs hlower)

/-- Finite-sum upper-bound criterion on the finite dyadic reciprocal region.
This is the depth-aware finite middle target: prove the explicit address-sum
remainder upper is below the restored two-core lower profile on the same
finite-depth cutoff region. -/
theorem superGaussianFiniteGenuineRectangleNonvanishingOn_finiteDyadic64_of_normUpperBelow
    {K M : ℕ} (hK : 5 ≤ K) (hM : 3 ≤ M)
    (hupper :
      ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
        superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
          superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s <
            superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X) :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K s X →
        superGaussianFiniteGenuineRectangle 2 X s K M ≠ 0 := by
  intro s X hs
  rw [superGaussianFiniteGenuineRectangle_eq_extension]
  exact
    superGaussianTwoCoreGenuineExtensionNonvanishingOn_finiteDyadic64_of_profileLower
      (by omega : 3 ≤ K)
      (by
        intro s X hs
        exact lt_of_le_of_lt
          (superGaussianFiniteGenuineRectangleRemainder_norm_le_upper
            hK hM X s)
          (hupper hs))
      hs

/-- Minimal `5 x 3` finite rectangle on its natural finite dyadic reciprocal
region.  The canonical remainder upper is zero, so the positive restored
two-core profile closes the criterion directly. -/
theorem superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_finiteDyadic64 :
    ∀ ⦃s : ℂ⦄ ⦃X : ℝ⦄,
      superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion 5 s X →
        superGaussianFiniteGenuineRectangle 2 X s 5 3 ≠ 0 :=
  superGaussianFiniteGenuineRectangleNonvanishingOn_finiteDyadic64_of_normUpperBelow
    (by norm_num) (by norm_num)
    (by
      intro s X hs
      rw [superGaussianFiniteGenuineRectangleRemainderNormUpper_five_three_eq_zero]
      simpa using
        (superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64
          (K := 5) (by norm_num) hs))

/-- The base quartet block has a fully explicit positive geometric lower bound. -/
theorem rectangularGenuine_five_one_norm_lower_bound_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularGenuineFiveOneNormLower s ≤ ‖rectangularGenuine s 5 1‖ := by
  have hdepth := rectangularDepthFactor_five_norm_lower_bound_of_re_pos hs
  rw [rectangularGenuine_eq_depth_core, rectangularOddCoreSum_one]
  calc
    rectangularGenuineFiveOneNormLower s
        = 2 * quartetVerticalNormLower s := by rfl
    _ ≤ 2 * ‖rectangularDepthFactor s 5‖ := by
        exact mul_le_mul_of_nonneg_left hdepth (by norm_num)
    _ = ‖(2 : ℂ) * rectangularDepthFactor s 5 * 1‖ := by
        rw [norm_mul, norm_mul]
        norm_num

/-- The two-core quartet block has a fully explicit positive geometric lower bound. -/
theorem rectangularGenuine_five_three_norm_lower_bound_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    rectangularGenuineFiveThreeNormLower s ≤ ‖rectangularGenuine s 5 3‖ := by
  have hdepth := rectangularDepthFactor_five_norm_lower_bound_of_re_pos hs
  have hodd := rectangularOddCoreSum_three_norm_lower_bound s
  have hodd_nonneg : 0 ≤ 1 - ‖complexDirichletCoeff s 3‖ := by
    have hlt := complexDirichletCoeff_three_norm_lt_one_of_re_pos hs
    linarith
  have hdepth_norm_nonneg : 0 ≤ ‖rectangularDepthFactor s 5‖ := norm_nonneg _
  have hmul :
      quartetVerticalNormLower s * (1 - ‖complexDirichletCoeff s 3‖) ≤
        ‖rectangularDepthFactor s 5‖ * ‖rectangularOddCoreSum s 3‖ :=
    mul_le_mul hdepth hodd hodd_nonneg hdepth_norm_nonneg
  rw [rectangularGenuine_eq_depth_core]
  calc
    rectangularGenuineFiveThreeNormLower s
        =
          2 * (quartetVerticalNormLower s *
            (1 - ‖complexDirichletCoeff s 3‖)) := by
            unfold rectangularGenuineFiveThreeNormLower
            ring
    _ ≤ 2 *
          (‖rectangularDepthFactor s 5‖ * ‖rectangularOddCoreSum s 3‖) := by
        exact mul_le_mul_of_nonneg_left hmul (by norm_num)
    _ = ‖(2 : ℂ) * rectangularDepthFactor s 5 *
          rectangularOddCoreSum s 3‖ := by
        rw [norm_mul, norm_mul]
        norm_num
        ring

/--
Cutoff residual dominance criterion for the finite genuine operator.  This is
the finite regularized analogue of the middle no-cancellation target: the
cutoff residual is not allowed enough norm to cancel the uncut genuine block.
-/
theorem rectangularExponentialGenuine_ne_zero_of_residual_dominance
    {s : ℂ} {K M : ℕ} {X : ℝ}
    (hres : ‖rectangularExponentialResidual s K M X‖ <
      ‖rectangularGenuine s K M‖) :
    rectangularExponentialGenuine s K M X ≠ 0 := by
  intro hzero
  have hsum :
      rectangularExponentialResidual s K M X +
        rectangularGenuine s K M = 0 := by
    have h :=
      rectangularExponentialGenuine_eq_residual_add_rectangularGenuine s K M X
    rw [hzero] at h
    exact h.symm
  have hres_neg :
      rectangularExponentialResidual s K M X =
        -rectangularGenuine s K M := by
    calc
      rectangularExponentialResidual s K M X =
          rectangularExponentialResidual s K M X +
              rectangularGenuine s K M -
            rectangularGenuine s K M := by ring
      _ = 0 - rectangularGenuine s K M := by rw [hsum]
      _ = -rectangularGenuine s K M := by ring
  have hnorm :
      ‖rectangularExponentialResidual s K M X‖ =
        ‖rectangularGenuine s K M‖ := by
    rw [hres_neg, norm_neg]
  linarith

/--
Same criterion with a certified upper bound for the cutoff residual.  This is
the auditable shape needed for explicit middle estimates.
-/
theorem rectangularExponentialGenuine_ne_zero_of_residual_upper_lt
    {s : ℂ} {K M : ℕ} {X : ℝ} {residualUpper : ℝ}
    (hbound : ‖rectangularExponentialResidual s K M X‖ ≤ residualUpper)
    (hupper : residualUpper < ‖rectangularGenuine s K M‖) :
    rectangularExponentialGenuine s K M X ≠ 0 :=
  rectangularExponentialGenuine_ne_zero_of_residual_dominance
    (lt_of_le_of_lt hbound hupper)

/--
Pointwise oscillatory cutoff witness specialized as a no-cancellation
criterion for the finite genuine operator.
-/
theorem rectangularExponentialGenuine_ne_zero_of_oscillatory_upper_lt
    {s : ℂ} {K M J : ℕ} {X : ℝ} (hJ : 1 ≤ J)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s K M J X <
        ‖rectangularGenuine s K M‖) :
    rectangularExponentialGenuine s K M X ≠ 0 :=
  rectangularExponentialGenuine_ne_zero_of_residual_upper_lt
    (rectangularExponentialResidual_norm_le_pointwiseOscillatoryUpper
      s K M J X hJ)
    hupper

/-- Cutoff no-cancellation for the certified base quartet block. -/
theorem rectangularExponentialGenuine_five_one_ne_zero_of_oscillatory_upper_lt
    {s : ℂ} {J : ℕ} {X : ℝ} (hJ : 1 ≤ J)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 1 J X <
        ‖rectangularGenuine s 5 1‖) :
    rectangularExponentialGenuine s 5 1 X ≠ 0 :=
  rectangularExponentialGenuine_ne_zero_of_oscillatory_upper_lt hJ hupper

/--
Base quartet cutoff no-cancellation from the explicit geometric lower bound.
This is the preferred audit target for estimates.
-/
theorem rectangularExponentialGenuine_five_one_ne_zero_of_oscillatory_upper_lt_lower
    {s : ℂ} {J : ℕ} {X : ℝ} (hs : 0 < s.re) (hJ : 1 ≤ J)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 1 J X <
        rectangularGenuineFiveOneNormLower s) :
    rectangularExponentialGenuine s 5 1 X ≠ 0 :=
  rectangularExponentialGenuine_five_one_ne_zero_of_oscillatory_upper_lt hJ
    (lt_of_lt_of_le hupper
      (rectangularGenuine_five_one_norm_lower_bound_of_re_pos hs))

/-- Default `J = 24` version of the base quartet cutoff criterion. -/
theorem rectangularExponentialGenuine_five_one_ne_zero_of_oscillatory_upper24_lt_lower
    {s : ℂ} {X : ℝ} (hs : 0 < s.re)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 1 24 X <
        rectangularGenuineFiveOneNormLower s) :
    rectangularExponentialGenuine s 5 1 X ≠ 0 :=
  rectangularExponentialGenuine_five_one_ne_zero_of_oscillatory_upper_lt_lower
    hs (by decide) hupper

/-- Cutoff no-cancellation for the certified two-core quartet block. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt
    {s : ℂ} {J : ℕ} {X : ℝ} (hJ : 1 ≤ J)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 3 J X <
        ‖rectangularGenuine s 5 3‖) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 :=
  rectangularExponentialGenuine_ne_zero_of_oscillatory_upper_lt hJ hupper

/--
Two-core quartet cutoff no-cancellation from the explicit geometric lower
bound.  This is the current finite regularized middle target.
-/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt_lower
    {s : ℂ} {J : ℕ} {X : ℝ} (hs : 0 < s.re) (hJ : 1 ≤ J)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 3 J X <
        rectangularGenuineFiveThreeNormLower s) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 :=
  rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt hJ
    (lt_of_lt_of_le hupper
      (rectangularGenuine_five_three_norm_lower_bound_of_re_pos hs))

/-- Default `J = 24` version of the two-core quartet cutoff criterion. -/
theorem rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper24_lt_lower
    {s : ℂ} {X : ℝ} (hs : 0 < s.re)
    (hupper :
      rectangularExponentialPointwiseOscillatoryUpper s 5 3 24 X <
        rectangularGenuineFiveThreeNormLower s) :
    rectangularExponentialGenuine s 5 3 X ≠ 0 :=
  rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt_lower
    hs (by decide) hupper

/-- The balanced genuine bulk model is exactly the genuine central C2 double
series throughout the open right half-plane. -/
theorem adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos
    (coreCutoff : ℕ → ℕ) (K M : ℕ) {s : ℂ} (hs : 0 < s.re) :
    adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s =
      genuineCentralDoubleSeries s := by
  simpa [adjustedQuartetBalancedGenuineBulkModel] using
    c2OddTailBalancingSeedBulkModel_eq_central_of_re_pos
      coreCutoff K M (s := s) hs

/-- Nonvanishing of the balanced genuine bulk model is exactly central nonvanishing. -/
theorem adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero
    (coreCutoff : ℕ → ℕ) (K M : ℕ) {s : ℂ} (hs : 0 < s.re) :
    adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0 ↔
      genuineCentralDoubleSeries s ≠ 0 := by
  rw [adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos
    coreCutoff K M hs]

/--
Current genuine middle obligation isolated without transfer language: prove the
central C2 object cannot vanish at the audited middle point.

This is the raw Lean `tsum` central object.  If the middle proof replaces it by
a certified regularized genuine channel, the same no-cancellation shape should
be reused for that channel.
-/
def GenuineCentralNoCancellation (s : ℂ) : Prop :=
  0 < s.re ∧ genuineCentralDoubleSeries s ≠ 0

/-- The transfer-free regularized genuine middle channel used when the raw central
`tsum` is too coarse: the infinite-depth super-Gaussian two-core geometry. -/
noncomputable def genuineRegularizedTwoCoreMiddle (X : ℝ) (s : ℂ) : ℂ :=
  superGaussianTwoCoreDepthLimit X s

/-- No-cancellation statement for the regularized genuine two-core middle
channel. -/
def GenuineRegularizedTwoCoreNoCancellation (X : ℝ) (s : ℂ) : Prop :=
  0 < s.re ∧ genuineRegularizedTwoCoreMiddle X s ≠ 0

/-- The depth-stable two-core geometry proves no-cancellation for the
regularized genuine middle channel. -/
theorem genuineRegularizedTwoCoreNoCancellation_on_depthStableRegion
    {K : ℕ} (hK : 2 ≤ K) {X : ℝ} {s : ℂ}
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X) :
    GenuineRegularizedTwoCoreNoCancellation X s := by
  refine ⟨hstable.1.1, ?_⟩
  simpa [genuineRegularizedTwoCoreMiddle] using
    superGaussianTwoCoreDepthLimit_ne_zero_on_depthStableRegion
      hK hstable

/-- Pointwise dyadic64 closure for the regularized genuine two-core middle
channel.  Lean chooses the canonical depth-stable scale and the channel is
already nonzero there. -/
theorem exists_tailStableDyadic64_genuineRegularizedTwoCoreNoCancellation
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        GenuineRegularizedTwoCoreNoCancellation
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  exact
    ⟨K, hK,
      genuineRegularizedTwoCoreNoCancellation_on_depthStableRegion
        hK hstable⟩

/-- Finite-core regularized genuine middle channel, keeping a finite
horizontal cutoff but infinite regularized depth. -/
noncomputable def genuineRegularizedFiniteCoreMiddle
    (M : ℕ) (X : ℝ) (s : ℂ) : ℂ :=
  superGaussianFiniteCoreDepthLimit M X s

/-- No-cancellation statement for a finite-core regularized genuine middle
channel. -/
def GenuineRegularizedFiniteCoreNoCancellation
    (M : ℕ) (X : ℝ) (s : ℂ) : Prop :=
  0 < s.re ∧ genuineRegularizedFiniteCoreMiddle M X s ≠ 0

/-- The same visible band/extra saldo accounting closes no-cancellation for a
regularized finite-core genuine channel. -/
theorem genuineRegularizedFiniteCoreNoCancellation_of_extra_band_lt_twoCoreNorm
    {M N : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineRegularizedFiniteCoreNoCancellation N X s := by
  refine ⟨hs, ?_⟩
  simpa [genuineRegularizedFiniteCoreMiddle] using
    superGaussianFiniteCoreDepthLimit_ne_zero_of_extra_band_lt_twoCoreNorm
      hM hMN hs hbudget

/-- Pointwise dyadic64 finite-core regularized criterion using exactly the
visible extra and band saldos against the certified two-core norm. -/
theorem exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellationCriterion_bandExtra
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖superGaussianFiniteCoreExtraDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreBandDepthLimit M N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineRegularizedFiniteCoreNoCancellation N
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineRegularizedFiniteCoreNoCancellation_of_extra_band_lt_twoCoreNorm
      hM hMN hs hbudget

/-- Minimal finite-core regularized closure: at `M = 3`, the finite-core
regularized channel is exactly the certified two-core channel. -/
theorem exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellation_three
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        GenuineRegularizedFiniteCoreNoCancellation 3
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s := by
  obtain ⟨K, hK, hreg⟩ :=
    exists_tailStableDyadic64_genuineRegularizedTwoCoreNoCancellation
      hs hsle
  refine ⟨K, hK, hreg.1, ?_⟩
  simpa [GenuineRegularizedTwoCoreNoCancellation,
    genuineRegularizedTwoCoreMiddle, genuineRegularizedFiniteCoreMiddle,
    superGaussianFiniteCoreDepthLimit_three_eq_twoCoreDepthLimit] using hreg.2

/-- Central genuine remainder after removing the certified finite two-core
rectangle.  This names the final genuine-first middle obstruction as a direct
distance from the central object to the stable finite geometry. -/
noncomputable def superGaussianFiniteTwoCoreCentralRemainder
    (K : ℕ) : ℂ → ℝ → ℂ :=
  fun s X =>
    genuineCentralDoubleSeries s -
      superGaussianFiniteGenuineRectangle 2 X s K 3

/-- Adding the named central remainder back to the finite two-core rectangle
recovers the central genuine object exactly. -/
theorem superGaussianFiniteTwoCoreFullDepthExtension_centralRemainder_eq
    (K : ℕ) (X : ℝ) (s : ℂ) :
    superGaussianFiniteTwoCoreFullDepthExtension K
        (superGaussianFiniteTwoCoreCentralRemainder K) X s =
      genuineCentralDoubleSeries s := by
  unfold superGaussianFiniteTwoCoreFullDepthExtension
    superGaussianFiniteTwoCoreCentralRemainder
  ring

/-- Final distance-form middle criterion: if the central genuine remainder is
smaller than the certified finite two-core lower profile, then the central
genuine object cannot cancel. -/
theorem genuineCentralNoCancellation_of_centralRemainder_lt_unitStripLower
    {K : ℕ} {X : ℝ} {s : ℂ}
    (hs : 0 < s.re) (hsle : s.re ≤ 1) (hK : 2 ≤ K) (hX : 0 < X)
    (hrem :
      ‖superGaussianFiniteTwoCoreCentralRemainder K s X‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s) :
    GenuineCentralNoCancellation s := by
  refine ⟨hs, ?_⟩
  have hcentral :
      superGaussianFiniteTwoCoreFullDepthExtension K
          (superGaussianFiniteTwoCoreCentralRemainder K) X s ≠ 0 :=
    superGaussianFiniteTwoCoreFullDepthExtension_ne_zero_of_remainder_norm_lt_unitStripLower
      hs hsle hK hX hrem
  simpa [superGaussianFiniteTwoCoreFullDepthExtension_centralRemainder_eq]
    using hcentral

/-- Depth-stable central criterion in finite-approximation form.  Once a
stable finite rectangle has a positive uniform norm floor, the central object
cannot vanish if it lies closer than that floor to any later finite rectangle.

This is the natural bridge for the final middle limit estimate: compare the
central double series directly to a large finite genuine rectangle, using the
finite gap already certified by the C2 geometry. -/
theorem genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap
    {K L : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K) (hKL : K ≤ L)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (happrox :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s L 3‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1))) :
    GenuineCentralNoCancellation s := by
  refine ⟨hstable.1.1, ?_⟩
  have hfloor :
      superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1)) ≤
        ‖superGaussianFiniteGenuineRectangle 2 X s L 3‖ :=
    (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
      hK hKL hstable).2
  have hcentral :
      superGaussianFiniteGenuineRectangle 2 X s L 3 +
          (genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s L 3) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound hfloor happrox
  have hsum :
      superGaussianFiniteGenuineRectangle 2 X s L 3 +
          (genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s L 3) =
        genuineCentralDoubleSeries s := by
    ring
  rw [hsum] at hcentral
  exact hcentral

/-- Limit-form central criterion.  On a depth-stable point, it is enough to
prove that the finite genuine rectangles approach the central object: the
positive finite gap then provides one large finite rectangle close enough to
force central no-cancellation. -/
theorem genuineCentralNoCancellation_of_depthStableApprox_tendsto_zero
    {K : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (htendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s L 3)
        Filter.atTop (nhds 0)) :
    GenuineCentralNoCancellation s := by
  let gap : ℝ :=
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
      8 * ((1 / 2 : ℝ) ^ (K + 1))
  have hgap_pos : 0 < gap := by
    dsimp [gap]
    exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  have heventually :
      ∀ᶠ L : ℕ in Filter.atTop,
        dist
          (genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s L 3)
          0 < gap :=
    (Metric.tendsto_nhds.mp htendsto) gap hgap_pos
  rw [Filter.eventually_atTop] at heventually
  obtain ⟨N, hN⟩ := heventually
  let L : ℕ := max K N
  have hKL : K ≤ L := le_max_left K N
  have hNL : N ≤ L := le_max_right K N
  have hdist :
      dist
        (genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s L 3)
        0 < gap :=
    hN L hNL
  have happrox :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s L 3‖ < gap := by
    simpa [dist_eq_norm] using hdist
  exact
    genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap
      hK hKL hstable (by simpa [gap] using happrox)

/-- Limit-form central criterion with a nonzero limiting defect.  On a
depth-stable point, it is enough for the finite approximation defect to converge
to a complex number whose norm is still below the certified finite gap. -/
theorem genuineCentralNoCancellation_of_depthStableSuccApprox_tendsto_lt_gap
    {K : ℕ} {X : ℝ} {s defect : ℂ} (hK : 2 ≤ K)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (htendsto :
      Filter.Tendsto
        (fun N : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3)
        Filter.atTop (nhds defect))
    (hdefect :
      ‖defect‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1))) :
    GenuineCentralNoCancellation s := by
  let gap : ℝ :=
    superGaussianFiniteTwoCoreUnitStripNormLower K X s -
      8 * ((1 / 2 : ℝ) ^ (K + 1))
  have hgap_pos : 0 < gap := by
    dsimp [gap]
    exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  have hdefect_gap : ‖defect‖ < gap := by
    simpa [gap] using hdefect
  have heps_pos : 0 < gap - ‖defect‖ := by
    linarith
  have heventually :
      ∀ᶠ N : ℕ in Filter.atTop,
        dist
          (genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3)
          defect < gap - ‖defect‖ :=
    (Metric.tendsto_nhds.mp htendsto) (gap - ‖defect‖) heps_pos
  rw [Filter.eventually_atTop] at heventually
  obtain ⟨N₀, hN₀⟩ := heventually
  let N : ℕ := max K N₀
  let L : ℕ := N + 1
  have hKL : K ≤ L := by
    dsimp [L, N]
    exact le_trans (le_max_left K N₀) (Nat.le_succ _)
  have hN₀N : N₀ ≤ N := le_max_right K N₀
  have hdist :
      dist
        (genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3)
        defect < gap - ‖defect‖ :=
    hN₀ N hN₀N
  have hnorm_diff :
      ‖(genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3) -
          defect‖ < gap - ‖defect‖ := by
    simpa [dist_eq_norm] using hdist
  have happrox :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s L 3‖ < gap := by
    have htri :
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3‖ ≤
          ‖(genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3) -
              defect‖ + ‖defect‖ := by
      calc
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3‖
            = ‖((genuineCentralDoubleSeries s -
                superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3) -
                defect) + defect‖ := by ring_nf
        _ ≤ ‖(genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3) -
              defect‖ + ‖defect‖ := norm_add_le _ _
    have hlt :
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3‖ < gap := by
      linarith
    simpa [L] using hlt
  exact
    genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap
      hK hKL hstable (by simpa [gap] using happrox)

/-- Concrete two-core limit-defect criterion.  Since the finite `M = 3`
rectangles converge to the regularized two-core depth limit, central
no-cancellation follows once the full central object is closer to that limit
than the certified finite gap. -/
theorem genuineCentralNoCancellation_of_twoCoreDepthLimitDefect_lt_gap
    {K : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1))) :
    GenuineCentralNoCancellation s := by
  have hrect :=
    tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
      (X := X) (s := s) hstable.1.1
  have hdiff :
      Filter.Tendsto
        (fun N : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3)
        Filter.atTop
        (nhds (genuineCentralDoubleSeries s -
          superGaussianTwoCoreDepthLimit X s)) :=
    hrect.const_sub (genuineCentralDoubleSeries s)
  exact
    genuineCentralNoCancellation_of_depthStableSuccApprox_tendsto_lt_gap
      hK hstable hdiff hdefect

/-- Direct two-core accounting criterion.  This is the minimal no-cancellation
shape: the central object is a certified two-core limit plus a saldo; if that
saldo is strictly smaller than the norm of the certified block, cancellation is
impossible. -/
theorem genuineCentralNoCancellation_of_twoCoreDefect_lt_twoCoreNorm
    {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  refine ⟨hs, ?_⟩
  have hcentral :
      superGaussianTwoCoreDepthLimit X s +
          (genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit X s) ≠ 0 :=
    add_ne_zero_of_remainder_norm_lt_lower_bound
      (le_refl ‖superGaussianTwoCoreDepthLimit X s‖)
      hdefect
  have hsum :
      superGaussianTwoCoreDepthLimit X s +
          (genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit X s) =
        genuineCentralDoubleSeries s := by
    ring
  rwa [hsum] at hcentral

/-- Split-budget central criterion.  The single central-to-two-core defect can
be attacked through any finite horizontal-core depth limit: if the central
object is close to that finite-core limit and that finite-core limit is close to
the certified two-core limit, with total budget below the gap, then the central
object cannot cancel. -/
theorem genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_gap
    {K M : ℕ} {X : ℝ} {s : ℂ} (hK : 2 ≤ K)
    (hstable : superGaussianFiniteTwoCoreDepthStableRegion K s X)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ <
          superGaussianFiniteTwoCoreUnitStripNormLower K X s -
            8 * ((1 / 2 : ℝ) ^ (K + 1))) :
    GenuineCentralNoCancellation s := by
  have hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        superGaussianFiniteTwoCoreUnitStripNormLower K X s -
          8 * ((1 / 2 : ℝ) ^ (K + 1)) := by
    have htri :
        ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s‖ := by
      calc
        ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖
            =
          ‖(genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s) +
            (superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s)‖ := by
              ring_nf
        _ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s‖ := norm_add_le _ _
    linarith
  exact
    genuineCentralNoCancellation_of_twoCoreDepthLimitDefect_lt_gap
      hK hstable hdefect

/-- Direct split-budget criterion through a finite horizontal-core depth limit.
This avoids replacing the certified block by a weaker explicit gap: if the two
saldos through any finite-core limit add to less than the actual two-core norm,
the central object cannot cancel. -/
theorem genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖ := by
    have htri :
        ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s‖ := by
      calc
        ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖
            =
          ‖(genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s) +
            (superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s)‖ := by
              ring_nf
        _ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit M X s‖ +
            ‖superGaussianFiniteCoreDepthLimit M X s -
              superGaussianTwoCoreDepthLimit X s‖ := norm_add_le _ _
    linarith
  exact
    genuineCentralNoCancellation_of_twoCoreDefect_lt_twoCoreNorm
      hs hdefect

/-- Direct central criterion using the exact visible extra-core saldo limit. -/
theorem genuineCentralNoCancellation_of_extraDepthLimit_budget_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hM : 3 ≤ M) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hbudget' :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    rw [superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra
      hM (X := X) hs]
    exact hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm
      hs hbudget'

/-- Direct visible-saldo central criterion.  Instead of asking for the actual
finite-core/two-core defect, it is enough to bound the visible layerwise saldo
upper and add the remaining central-to-finite-core distance. -/
theorem genuineCentralNoCancellation_of_finiteCoreSaldoUpper_budget_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        superGaussianFiniteCoreSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hsaldo :
      ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ ≤
        superGaussianFiniteCoreSaldoNormUpper M X s :=
    superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_norm_le_saldo
      M hs
  have hbudget' :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreDepthLimit M X s -
          superGaussianTwoCoreDepthLimit X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    linarith
  exact
    genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm
      hs hbudget'

/-- Direct central criterion in the visible extra-core currency: central
distance to a finite horizontal-core limit plus the sum of the actual extra-core
saldos must be smaller than the certified two-core norm. -/
theorem genuineCentralNoCancellation_of_extraSaldo_budget_lt_twoCoreNorm
    {M : ℕ} {X : ℝ} {s : ℂ} (hM : 3 ≤ M) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        superGaussianFiniteCoreExtraSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hbudget_saldo :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        superGaussianFiniteCoreSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    rw [superGaussianFiniteCoreSaldoNormUpper_eq_extraSaldoNormUpper hM X s]
    exact hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreSaldoUpper_budget_lt_twoCoreNorm
      hs hbudget_saldo

/-- Direct central criterion through a larger finite horizontal cutoff.  The
central object may be compared to `N`; the exact finite band from `M` to `N`
and the exact extra-core saldo from the two-core channel to `M` are then paid
separately against the certified two-core norm. -/
theorem genuineCentralNoCancellation_of_finiteCoreBand_extraDepthLimit_budget_lt_twoCoreNorm
    {M N : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hbudgetM :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    have htri :
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M X s‖ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit N X s‖ +
            ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ := by
      calc
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M X s‖ =
          ‖(genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit N X s) +
            superGaussianFiniteCoreBandDepthLimit M N X s‖ := by
              rw [
                superGaussianFiniteCoreDepthLimit_eq_lower_add_band
                  hMN hs]
              ring_nf
        _ ≤
          ‖genuineCentralDoubleSeries s -
              superGaussianFiniteCoreDepthLimit N X s‖ +
            ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ :=
              norm_add_le _ _
    linarith
  exact
    genuineCentralNoCancellation_of_extraDepthLimit_budget_lt_twoCoreNorm
      hM hs hbudgetM

/-- Direct central criterion through a larger finite horizontal cutoff using
visible layerwise upper bounds for both saldos. -/
theorem genuineCentralNoCancellation_of_finiteCoreBandSaldo_extraSaldo_budget_lt_twoCoreNorm
    {M N : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        superGaussianFiniteCoreBandSaldoNormUpper M N X s +
        superGaussianFiniteCoreExtraSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hband :
      ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ ≤
        superGaussianFiniteCoreBandSaldoNormUpper M N X s :=
    superGaussianFiniteCoreBandDepthLimit_norm_le_bandSaldoUpper
      hMN (X := X) hs
  have hextra :
      ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ ≤
        superGaussianFiniteCoreExtraSaldoNormUpper M X s :=
    superGaussianFiniteCoreExtraDepthLimit_norm_le_extraSaldoUpper
      hM (X := X) hs
  have hbudget_exact :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    linarith
  exact
    genuineCentralNoCancellation_of_finiteCoreBand_extraDepthLimit_budget_lt_twoCoreNorm
      hM hMN hs hbudget_exact

/-- The same two-cutoff central criterion in the most basic bookkeeping form:
the certified two-core block plus three visible saldos cannot vanish when the
three saldo norms add to less than the block norm. -/
theorem genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
    {M N : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  refine ⟨hs, ?_⟩
  let centralTail : ℂ :=
    genuineCentralDoubleSeries s -
      superGaussianFiniteCoreDepthLimit N X s
  let band : ℂ := superGaussianFiniteCoreBandDepthLimit M N X s
  let extra : ℂ := superGaussianFiniteCoreExtraDepthLimit M X s
  let block : ℂ := superGaussianTwoCoreDepthLimit X s
  have hdecomp :
      genuineCentralDoubleSeries s =
        block + centralTail + band + extra := by
    dsimp [block, centralTail, band, extra]
    rw [
      superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band
        hM hMN hs]
    ring
  have hbasic : block + centralTail + band + extra ≠ 0 := by
    exact
      add_three_ne_zero_of_norm_sum_lt
        (block := block)
        (r1 := centralTail)
        (r2 := band)
        (r3 := extra)
        (by simpa [block, centralTail, band, extra] using hbudget)
  rw [hdecomp]
  exact hbasic

/-- Finite-approximation version of the basic three-saldo criterion.  The
central-to-`N` saldo is paid by a finite genuine rectangle error plus the
visible regularized depth tail of the same finite horizontal core. -/
theorem genuineCentralNoCancellation_of_finiteCoreApprox_band_extra_depthTail_budget_lt_twoCoreNorm
    {M N L : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
        superGaussianFiniteCoreDepthTailNormUpper N X s L +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hcentral :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ ≤
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
          superGaussianFiniteCoreDepthTailNormUpper N X s L :=
    genuineCentral_sub_finiteCoreDepthLimit_norm_le_approx_add_depthTail
      N (X := X) hs L
  have hbudget_exact :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    linarith
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
      hM hMN hs hbudget_exact

/-- Same finite-approximation criterion using visible layerwise upper bounds
for the finite horizontal band and the extra-core saldo. -/
theorem genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo
    {M N L : ℕ} {X : ℝ} {s : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
        superGaussianFiniteCoreDepthTailNormUpper N X s L +
        superGaussianFiniteCoreBandSaldoNormUpper M N X s +
        superGaussianFiniteCoreExtraSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have hcentral :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ ≤
        ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
          superGaussianFiniteCoreDepthTailNormUpper N X s L :=
    genuineCentral_sub_finiteCoreDepthLimit_norm_le_approx_add_depthTail
      N (X := X) hs L
  have hband :
      ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ ≤
        superGaussianFiniteCoreBandSaldoNormUpper M N X s :=
    superGaussianFiniteCoreBandDepthLimit_norm_le_bandSaldoUpper
      hMN (X := X) hs
  have hextra :
      ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ ≤
        superGaussianFiniteCoreExtraSaldoNormUpper M X s :=
    superGaussianFiniteCoreExtraDepthLimit_norm_le_extraSaldoUpper
      hM (X := X) hs
  have hbudget_exact :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit N X s‖ +
        ‖superGaussianFiniteCoreBandDepthLimit M N X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    linarith
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
      hM hMN hs hbudget_exact

/-- Fine limiting-defect closure for the two-cutoff middle budget.  If the
finite genuine approximation error converges to a limiting genuine defect, and
that defect plus the visible horizontal saldos remains below the certified
two-core norm, then the genuine central object cannot cancel. -/
theorem genuineCentralNoCancellation_of_fineLimitDefect_budget
    {M N : ℕ} {X : ℝ} {s defect : ℂ}
    (hM : 3 ≤ M) (hMN : M ≤ N) (hs : 0 < s.re)
    (htendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N)
        Filter.atTop (nhds defect))
    (hbudget :
      ‖defect‖ +
        superGaussianFiniteCoreBandSaldoNormUpper M N X s +
        superGaussianFiniteCoreExtraSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  have happrox_tendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖)
        Filter.atTop (nhds ‖defect‖) := by
    simpa using htendsto.norm
  have htail_tendsto :
      Filter.Tendsto
        (fun L : ℕ => superGaussianFiniteCoreDepthTailNormUpper N X s L)
        Filter.atTop (nhds 0) :=
    superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero N X s
  have hsum_tendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
          superGaussianFiniteCoreDepthTailNormUpper N X s L)
        Filter.atTop (nhds (‖defect‖ + 0)) := by
    exact happrox_tendsto.add htail_tendsto
  have hband_tendsto :
      Filter.Tendsto
        (fun _L : ℕ => superGaussianFiniteCoreBandSaldoNormUpper M N X s)
        Filter.atTop
        (nhds (superGaussianFiniteCoreBandSaldoNormUpper M N X s)) :=
    tendsto_const_nhds
  have hextra_tendsto :
      Filter.Tendsto
        (fun _L : ℕ => superGaussianFiniteCoreExtraSaldoNormUpper M X s)
        Filter.atTop
        (nhds (superGaussianFiniteCoreExtraSaldoNormUpper M X s)) :=
    tendsto_const_nhds
  have htotal_tendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
          superGaussianFiniteCoreDepthTailNormUpper N X s L +
          superGaussianFiniteCoreBandSaldoNormUpper M N X s +
          superGaussianFiniteCoreExtraSaldoNormUpper M X s)
        Filter.atTop
        (nhds
          (‖defect‖ + 0 +
            superGaussianFiniteCoreBandSaldoNormUpper M N X s +
            superGaussianFiniteCoreExtraSaldoNormUpper M X s)) := by
    simpa [add_assoc] using (hsum_tendsto.add hband_tendsto).add
      hextra_tendsto
  let limitBudget : ℝ :=
    ‖defect‖ +
      superGaussianFiniteCoreBandSaldoNormUpper M N X s +
      superGaussianFiniteCoreExtraSaldoNormUpper M X s
  let target : ℝ := ‖superGaussianTwoCoreDepthLimit X s‖
  have hmargin_pos : 0 < target - limitBudget := by
    dsimp [target, limitBudget]
    linarith
  have heventually :
      ∀ᶠ L : ℕ in Filter.atTop,
        dist
          (‖genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
            superGaussianFiniteCoreDepthTailNormUpper N X s L +
            superGaussianFiniteCoreBandSaldoNormUpper M N X s +
            superGaussianFiniteCoreExtraSaldoNormUpper M X s)
          limitBudget < target - limitBudget :=
    (Metric.tendsto_nhds.mp
      (by
        simpa [limitBudget, add_assoc] using htotal_tendsto))
      (target - limitBudget) hmargin_pos
  rw [Filter.eventually_atTop] at heventually
  obtain ⟨L, hL⟩ := heventually
  have hdist := hL L (le_refl L)
  rw [Real.dist_eq] at hdist
  have hcur_lt :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (L + 1) N‖ +
        superGaussianFiniteCoreDepthTailNormUpper N X s L +
        superGaussianFiniteCoreBandSaldoNormUpper M N X s +
        superGaussianFiniteCoreExtraSaldoNormUpper M X s <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    have hupper := (abs_lt.mp hdist).2
    dsimp [target, limitBudget] at hupper
    linarith
  exact
    genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo
      hM hMN hs hcur_lt

/-- Minimal fine-depth-tail closure.  If the certified two-core finite genuine
rectangles converge to the genuine central object, then the finite
approximation error and the finite-core depth tail are eventually too small to
cancel the certified two-core depth limit.  In the minimal horizontal cutoff
`M = N = 3`, the band and extra saldos are exactly zero. -/
theorem genuineCentralNoCancellation_of_fineDepthTail_three_tendsto
    {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (htwo :
      superGaussianTwoCoreDepthLimit X s ≠ 0)
    (htendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3)
        Filter.atTop (nhds 0)) :
    GenuineCentralNoCancellation s := by
  have happrox_tendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖)
        Filter.atTop (nhds 0) := by
    simpa using htendsto.norm
  have htail_tendsto :
      Filter.Tendsto
        (fun L : ℕ => superGaussianFiniteCoreDepthTailNormUpper 3 X s L)
        Filter.atTop (nhds 0) :=
    superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero 3 X s
  have hsum_tendsto :
      Filter.Tendsto
        (fun L : ℕ =>
          ‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖ +
          superGaussianFiniteCoreDepthTailNormUpper 3 X s L)
        Filter.atTop (nhds 0) := by
    simpa using happrox_tendsto.add htail_tendsto
  have hnorm_pos : 0 < ‖superGaussianTwoCoreDepthLimit X s‖ :=
    norm_pos_iff.mpr htwo
  have heventually :
      ∀ᶠ L : ℕ in Filter.atTop,
        dist
          (‖genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖ +
            superGaussianFiniteCoreDepthTailNormUpper 3 X s L)
          0 < ‖superGaussianTwoCoreDepthLimit X s‖ :=
    (Metric.tendsto_nhds.mp hsum_tendsto)
      ‖superGaussianTwoCoreDepthLimit X s‖ hnorm_pos
  rw [Filter.eventually_atTop] at heventually
  obtain ⟨L, hL⟩ := heventually
  have hdist := hL L (le_refl L)
  rw [Real.dist_eq] at hdist
  have hsmall :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖ +
        superGaussianFiniteCoreDepthTailNormUpper 3 X s L <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    have habs :
        |‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖ +
          superGaussianFiniteCoreDepthTailNormUpper 3 X s L| <
            ‖superGaussianTwoCoreDepthLimit X s‖ := by
      simpa using hdist
    exact lt_of_le_of_lt (le_abs_self _) habs
  have hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3‖ +
        superGaussianFiniteCoreDepthTailNormUpper 3 X s L +
        superGaussianFiniteCoreBandSaldoNormUpper 3 3 X s +
        superGaussianFiniteCoreExtraSaldoNormUpper 3 X s <
          ‖superGaussianTwoCoreDepthLimit X s‖ := by
    rw [superGaussianFiniteCoreBandSaldoNormUpper_self_eq_zero]
    rw [superGaussianFiniteCoreExtraSaldoNormUpper_three_eq_zero]
    simpa [add_assoc] using hsmall
  exact
    genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo
      (M := 3) (N := 3) (L := L) (X := X) (s := s)
      (by norm_num) (by norm_num) hs hbudget

/-- In the minimal horizontal cutoff, convergence of the finite two-core
regularized rectangles to the genuine central object is exactly the assertion
that the genuine central object equals the two-core depth limit at that cutoff.
This keeps the remaining obligation honest: it is not a free depth-tail fact. -/
theorem fineTail_three_tendsto_iff_central_eq_twoCoreDepthLimit
    {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Filter.Tendsto
        (fun L : ℕ =>
          genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3)
        Filter.atTop (nhds 0) ↔
      genuineCentralDoubleSeries s = superGaussianTwoCoreDepthLimit X s := by
  constructor
  · intro htendsto
    have hrect :=
      tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
        (X := X) (s := s) hs
    have hdiff :
        Filter.Tendsto
          (fun L : ℕ =>
            genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3)
          Filter.atTop
          (nhds (genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit X s)) :=
      hrect.const_sub (genuineCentralDoubleSeries s)
    have hzero :
        genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit X s = 0 :=
      tendsto_nhds_unique hdiff htendsto
    exact sub_eq_zero.mp hzero
  · intro hcentral
    have hrect :=
      tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
        (X := X) (s := s) hs
    have hdiff :
        Filter.Tendsto
          (fun L : ℕ =>
            genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2 X s (L + 1) 3)
          Filter.atTop
          (nhds (genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit X s)) :=
      hrect.const_sub (genuineCentralDoubleSeries s)
    simpa [hcentral] using hdiff

/-- Minimal `N = M` saldo budget: the finite band is empty, so the three-saldo
inequality reduces to central-to-`M` plus the exact extra-core saldo. -/
theorem basic_threeSaldo_budget_self_of_extraDepthLimit_budget
    {M : ℕ} {X : ℝ} {s : ℂ}
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    ‖genuineCentralDoubleSeries s -
        superGaussianFiniteCoreDepthLimit M X s‖ +
      ‖superGaussianFiniteCoreBandDepthLimit M M X s‖ +
      ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖ := by
  rw [superGaussianFiniteCoreBandDepthLimit_self_eq_zero]
  simpa [add_assoc] using hbudget

/-- The basic three-saldo criterion with equal horizontal cutoffs is the direct
two-saldo comparison: central-to-`M` plus exact extra-core saldo. -/
theorem genuineCentralNoCancellation_of_basic_threeSaldo_self
    {M : ℕ} {X : ℝ} {s : ℂ} (hM : 3 ≤ M) (hs : 0 < s.re)
    (hbudget :
      ‖genuineCentralDoubleSeries s -
          superGaussianFiniteCoreDepthLimit M X s‖ +
        ‖superGaussianFiniteCoreExtraDepthLimit M X s‖ <
          ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
      (M := M) (N := M) (X := X) (s := s)
      hM (le_refl M) hs
      (basic_threeSaldo_budget_self_of_extraDepthLimit_budget
        (M := M) (X := X) (s := s) hbudget)

/-- Minimal `M = N = 3` saldo budget: the band and extra saldos are empty, so
the three-saldo inequality reduces to the single central-to-two-core defect. -/
theorem basic_threeSaldo_budget_three_three_of_twoCoreDefect
    {X : ℝ} {s : ℂ}
    (hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖) :
    ‖genuineCentralDoubleSeries s -
        superGaussianFiniteCoreDepthLimit 3 X s‖ +
      ‖superGaussianFiniteCoreBandDepthLimit 3 3 X s‖ +
      ‖superGaussianFiniteCoreExtraDepthLimit 3 X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖ := by
  rw [superGaussianFiniteCoreDepthLimit_three_eq_twoCoreDepthLimit]
  rw [superGaussianFiniteCoreBandDepthLimit_self_eq_zero]
  rw [superGaussianFiniteCoreExtraDepthLimit_three_eq_zero]
  simpa using hdefect

/-- The basic three-saldo criterion at the minimal horizontal cutoffs is exactly
the direct one-saldo comparison against the certified two-core block. -/
theorem genuineCentralNoCancellation_of_basic_threeSaldo_three_three
    {X : ℝ} {s : ℂ} (hs : 0 < s.re)
    (hdefect :
      ‖genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s‖ <
        ‖superGaussianTwoCoreDepthLimit X s‖) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
      (M := 3) (N := 3) (X := X) (s := s)
      (by norm_num) (by norm_num) hs
      (basic_threeSaldo_budget_three_three_of_twoCoreDefect
        (X := X) (s := s) hdefect)

/-- Pointwise tail-stable central criterion: for every unit-strip point there
is a canonical dyadic64 finite depth where the only remaining central middle
obligation is the named distance estimate against the finite lower profile. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianFiniteTwoCoreDepthStableRegion K s
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) ∧
        (‖superGaussianFiniteTwoCoreCentralRemainder K s
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)‖ <
            superGaussianFiniteTwoCoreUnitStripNormLower K
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hstable, ?_⟩
  intro hrem
  exact
    genuineCentralNoCancellation_of_centralRemainder_lt_unitStripLower
      hs hsle hK
      (positiveCutoffRegionOn_superGaussianFiniteTwoCoreDepthStableRegion
        hstable).2
      hrem

/-- Pointwise central criterion in finite-approximation form.  For every
unit-strip point there is a canonical dyadic64 depth `K` with a positive gap
such that any sufficiently close later finite rectangle proves central
no-cancellation. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_normGap
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        ∀ L : ℕ,
          K ≤ L →
            ‖genuineCentralDoubleSeries s -
                superGaussianFiniteGenuineRectangle 2
                  (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
                  s L 3‖ <
              superGaussianFiniteTwoCoreUnitStripNormLower K
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
                8 * ((1 / 2 : ℝ) ^ (K + 1)) →
              GenuineCentralNoCancellation s := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro L hKL happrox
    exact
      genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap
        hK hKL hstable happrox

/-- Pointwise limit-form central criterion.  For every unit-strip point, Lean
chooses a canonical depth-stable dyadic64 cutoff; after that, proving that the
finite genuine rectangles converge to the central object closes the middle
no-cancellation target. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_tendsto
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        (Filter.Tendsto
          (fun L : ℕ =>
            genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
                s L 3)
          Filter.atTop (nhds 0) →
            GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro htendsto
    exact
      genuineCentralNoCancellation_of_depthStableApprox_tendsto_zero
        hK hstable htendsto

/-- Pointwise two-core limit-defect central criterion.  For every unit-strip
point, Lean chooses a canonical dyadic64 depth with positive finite gap; the
remaining central obligation is only to bound the distance from the full central
object to the regularized two-core depth limit at that cutoff. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_twoCoreLimit
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro hdefect
    exact
      genuineCentralNoCancellation_of_twoCoreDepthLimitDefect_lt_gap
        hK hstable hdefect

/-- Direct pointwise two-core accounting criterion.  At the dyadic64 depth
chosen by Lean, it is enough to prove that the full central saldo relative to
the certified two-core limit is smaller than the actual norm of that two-core
limit. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_direct
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
          ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hdefect
  exact
    genuineCentralNoCancellation_of_twoCoreDefect_lt_twoCoreNorm
      hs hdefect

/-- Pointwise split-budget central criterion.  For every unit-strip point and
every finite horizontal cutoff `M`, Lean chooses a depth-stable dyadic64 scale.
At that scale the remaining middle obligation may be split into the distance
from the central object to the finite-core depth limit and the finite-core
distance back to the certified two-core depth limit. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) (M : ℕ) :
    ∃ K : ℕ,
      2 ≤ K ∧
        0 <
          superGaussianFiniteTwoCoreUnitStripNormLower K
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            8 * ((1 / 2 : ℝ) ^ (K + 1)) ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            superGaussianFiniteTwoCoreUnitStripNormLower K
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
              8 * ((1 / 2 : ℝ) ^ (K + 1)) →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, hstable⟩ :=
    exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, ?_, ?_⟩
  · exact
      (superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
        hK (le_refl K) hstable).1
  · intro hbudget
    exact
      genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_gap
        hK hstable hbudget

/-- Direct pointwise split-budget criterion through a finite horizontal cutoff.
At the dyadic64 depth chosen by Lean, the two saldos through `M` only need to
sum below the actual norm of the certified two-core limit. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore_direct
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) (M : ℕ) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm
      hs hbudget

/-- Direct pointwise criterion using the exact visible extra-core saldo limit. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraLimit
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M : ℕ} (hM : 3 ≤ M) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreExtraDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_extraDepthLimit_budget_lt_twoCoreNorm
      hM hs hbudget

/-- Direct pointwise visible-saldo criterion.  At the dyadic64 depth chosen by
Lean, the only numerical/geometric budget left is the central-to-finite-core
distance plus the visible layerwise finite-core/two-core saldo upper. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_saldoUpper
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) (M : ℕ) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          superGaussianFiniteCoreSaldoNormUpper M
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreSaldoUpper_budget_lt_twoCoreNorm
      hs hbudget

/-- Direct pointwise criterion in visible extra-core currency.  This is the
plain geometric bookkeeping target: central-to-finite-core distance plus the
sum of the actual extra-core saldos must be below the certified two-core norm. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraSaldo
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M : ℕ} (hM : 3 ≤ M) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          superGaussianFiniteCoreExtraSaldoNormUpper M
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_extraSaldo_budget_lt_twoCoreNorm
      hM hs hbudget

/-- Direct pointwise criterion through two finite horizontal cutoffs.  At the
dyadic64 scale chosen by Lean, the middle budget is split into: distance from
the central object to the larger finite cutoff `N`, the exact finite band
`M..N`, and the exact extra-core saldo from the two-core channel to `M`. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandExtra
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreBandDepthLimit M N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreExtraDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreBand_extraDepthLimit_budget_lt_twoCoreNorm
      hM hMN hs hbudget

/-- Same pointwise two-cutoff criterion, routed through the minimal three-saldo
bookkeeping lemma. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreBandDepthLimit M N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          ‖superGaussianFiniteCoreExtraDepthLimit M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
      hM hMN hs hbudget

/-- Minimal pointwise dyadic64 criterion obtained from the three-saldo
bookkeeping with `M = N = 3`: the two geometric saldos are empty, and only the
central-to-two-core defect remains. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo_three_three
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ <
          ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hdefect
  exact
    genuineCentralNoCancellation_of_basic_threeSaldo_three_three
      hs hdefect

/-- Direct pointwise criterion through two finite horizontal cutoffs using
visible layerwise upper bounds for the finite band and the extra-core saldo. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandSaldo
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteCoreDepthLimit N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ +
          superGaussianFiniteCoreBandSaldoNormUpper M N
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s +
          superGaussianFiniteCoreExtraSaldoNormUpper M
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_finiteCoreBandSaldo_extraSaldo_budget_lt_twoCoreNorm
      hM hMN hs hbudget

/-- Pointwise dyadic64 finite-approximation criterion with the correct fine
saldo currency: finite genuine approximation error, finite-core depth tail,
finite horizontal band saldo, and extra-core saldo, all paid against the actual
two-core norm. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineDepthTail
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N L : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (‖genuineCentralDoubleSeries s -
            superGaussianFiniteGenuineRectangle 2
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
              s (L + 1) N‖ +
          superGaussianFiniteCoreDepthTailNormUpper N
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L +
          superGaussianFiniteCoreBandSaldoNormUpper M N
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s +
          superGaussianFiniteCoreExtraSaldoNormUpper M
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s <
            ‖superGaussianTwoCoreDepthLimit
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro hbudget
  exact
    genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo
      hM hMN hs hbudget

/-- Pointwise dyadic64 limiting-defect criterion in the fine saldo currency.
At the chosen genuine two-core scale, the remaining middle obligation is the
single quantitative statement that the limiting central finite-approximation
defect, plus the visible band and extra saldos, is below the actual two-core
norm. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineLimitDefect
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1)
    {M N : ℕ} (hM : 3 ≤ M) (hMN : M ≤ N) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (∀ defect : ℂ,
          Filter.Tendsto
            (fun L : ℕ =>
              genuineCentralDoubleSeries s -
                superGaussianFiniteGenuineRectangle 2
                  (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
                  s (L + 1) N)
            Filter.atTop (nhds defect) →
          ‖defect‖ +
            superGaussianFiniteCoreBandSaldoNormUpper M N
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s +
            superGaussianFiniteCoreExtraSaldoNormUpper M
              (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s <
              ‖superGaussianTwoCoreDepthLimit
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s‖ →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro defect htendsto hbudget
  exact
    genuineCentralNoCancellation_of_fineLimitDefect_budget
      hM hMN hs htendsto hbudget

/-- Pointwise dyadic64 version of the minimal fine-depth-tail closure.  The
remaining input is exactly convergence of the certified two-core finite genuine
rectangles to the genuine central object at the dyadic64 scale chosen by Lean. -/
theorem exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineTailTendsto
    {s : ℂ} (hs : 0 < s.re) (hsle : s.re ≤ 1) :
    ∃ K : ℕ,
      2 ≤ K ∧
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s ≠ 0 ∧
        (Filter.Tendsto
          (fun L : ℕ =>
            genuineCentralDoubleSeries s -
              superGaussianFiniteGenuineRectangle 2
                (superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
                s (L + 1) 3)
          Filter.atTop (nhds 0) →
          GenuineCentralNoCancellation s) := by
  obtain ⟨K, hK, _hgap, _hfloor, hne⟩ :=
    exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
      hs hsle
  refine ⟨K, hK, hne, ?_⟩
  intro htendsto
  exact
    genuineCentralNoCancellation_of_fineDepthTail_three_tendsto
      (X := superGaussianFiniteTwoCoreReciprocalCutoffScale K s)
      (s := s) hs hne htendsto

/-- Raw genuine quartet-concrete certificate for the balanced bulk model.  This
keeps the active middle target on the genuine central object: the fields are
only the balanced seed, horizontal defect, raw cutoff error, and quartet
dominance. -/
structure AdjustedQuartetBalancedGenuineBulkConcreteEstimates
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ)
    (s : ℂ) : Prop where
  offCritical : offCriticalStrip s
  tiltScale_pos : 0 < tiltScale s
  tiltConstant_nonneg : 0 ≤ tiltConstant s
  tilt_scaled_bound :
    ‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤
      tiltConstant s
  horizontalScale_pos : 0 < horizontalScale s
  horizontalConstant_nonneg : 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : horizontalRatio s < 1
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
  cutoffScale_pos : 0 < cutoffScale s
  cutoff_scaled_bound :
    ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤ cutoffConstant s
  quartet_dominance :
    c2QuartetBulkGUpper
        (c2BulkGUpper
          (c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio)) s +
      c2BulkEUpper (c2CutoffUpperFromScale cutoffConstant cutoffScale) s <
        c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

/-- Region spelling for the raw genuine quartet-concrete certificate. -/
def adjustedQuartetBalancedGenuineBulkConcreteRegion
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ) : Set ℂ :=
  {s | AdjustedQuartetBalancedGenuineBulkConcreteEstimates
    coreCutoff K M
    tiltConstant tiltScale
    horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale s}

/-- The raw genuine quartet-concrete certificate is exactly the generic quartet
bulk-error region for the balanced seed and the raw central cutoff error. -/
theorem adjustedQuartetBalancedGenuineBulkConcrete_mem_quartetRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    s ∈ c2QuartetBulkErrorRegion
      (c2TiltRegularizedResidual
        (c2SeededTiltLayerResidual
          (c2OddTailBalancingSeed coreCutoff K M)))
      (c2ConcreteOddHorizontalDefect coreCutoff)
      (c2ConcreteCutoffError K M)
      (c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (c2CutoffUpperFromScale cutoffConstant cutoffScale) := by
  have hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ ≤
        tiltConstant s / tiltScale s :=
    c2TiltSeed_bound_from_scaled hs.tiltScale_pos hs.tilt_scaled_bound
  have htiltLayer : ∀ j : ℕ,
      ‖c2SeededTiltLayerResidual
          (c2OddTailBalancingSeed coreCutoff K M) s j‖ ≤
        (tiltConstant s / tiltScale s) * c2TiltAnalyticRatio s ^ j :=
    c2SeededTiltLayerResidual_bound hseed
  have htilt :
      ‖c2TiltRegularizedResidual
          (c2SeededTiltLayerResidual
            (c2OddTailBalancingSeed coreCutoff K M)) s‖ ≤
        c2TiltAnalyticRegularizedUpper tiltConstant tiltScale s :=
    c2TiltRegularizedResidual_bound_of_analytic_geometric
      hs.offCritical hs.tiltScale_pos hs.tiltConstant_nonneg htiltLayer
  have hhorizontal :
      ‖c2ConcreteOddHorizontalDefect coreCutoff s‖ ≤
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s := by
    unfold c2ConcreteOddHorizontalDefect
    exact c2HorizontalRegularizedDefect_bound
      hs.horizontalScale_pos hs.horizontalConstant_nonneg
      hs.horizontalRatio_nonneg hs.horizontalRatio_lt_one
      hs.horizontalLayer_bound
  have hG :
      ‖c2BulkGdelta
          (c2TiltRegularizedResidual
            (c2SeededTiltLayerResidual
              (c2OddTailBalancingSeed coreCutoff K M)))
          (c2ConcreteOddHorizontalDefect coreCutoff) s‖ ≤
        c2BulkGUpper
          (c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio) s := by
    unfold c2BulkGdelta c2BulkGUpper
    exact le_trans (norm_add_le _ _) (add_le_add htilt hhorizontal)
  have hcutoff :
      ‖c2BulkEdelta (c2ConcreteCutoffError K M) s‖ ≤
        c2BulkEUpper (c2CutoffUpperFromScale cutoffConstant cutoffScale) s := by
    simpa [c2BulkEdelta, c2BulkEUpper] using
      c2Cutoff_bound_from_scaled hs.cutoffScale_pos hs.cutoff_scaled_bound
  exact ⟨hs.offCritical, hG, hcutoff, hs.quartet_dominance⟩

/-- The raw genuine quartet-concrete certificate proves non-cancellation of the
balanced bulk model. -/
theorem adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0 := by
  have hq :
      s ∈ c2QuartetBulkErrorRegion
        (c2TiltRegularizedResidual
          (c2SeededTiltLayerResidual
            (c2OddTailBalancingSeed coreCutoff K M)))
        (c2ConcreteOddHorizontalDefect coreCutoff)
        (c2ConcreteCutoffError K M)
        (c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (c2CutoffUpperFromScale cutoffConstant cutoffScale) :=
    adjustedQuartetBalancedGenuineBulkConcrete_mem_quartetRegion hs
  have hnonzero :
      c2AnalyticBulkF
        (c2BulkGdelta
          (c2TiltRegularizedResidual
            (c2SeededTiltLayerResidual
              (c2OddTailBalancingSeed coreCutoff K M)))
          (c2ConcreteOddHorizontalDefect coreCutoff))
        (c2BulkEdelta (c2ConcreteCutoffError K M)) s ≠ 0 :=
    c2QuartetBulkErrors_nonvanishing_of_mem hq
  simpa [adjustedQuartetBalancedGenuineBulkModel,
    c2OddTailBalancingSeedBulkModel,
    c2ScaledSeededExplicitOddTailBulkModel] using hnonzero

/-- Same raw genuine closure, but routed through the explicit four-debt ledger:
vertical debt, tilt, horizontal, and cutoff are paid against the quartet lower
envelope encoded by `quartet_dominance`. -/
theorem adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0 := by
  have hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ ≤
        tiltConstant s / tiltScale s :=
    c2TiltSeed_bound_from_scaled hs.tiltScale_pos hs.tilt_scaled_bound
  have htiltLayer : ∀ j : ℕ,
      ‖c2SeededTiltLayerResidual
          (c2OddTailBalancingSeed coreCutoff K M) s j‖ ≤
        (tiltConstant s / tiltScale s) * c2TiltAnalyticRatio s ^ j :=
    c2SeededTiltLayerResidual_bound hseed
  have htilt :
      ‖c2TiltRegularizedResidual
          (c2SeededTiltLayerResidual
            (c2OddTailBalancingSeed coreCutoff K M)) s‖ ≤
        c2TiltAnalyticRegularizedUpper tiltConstant tiltScale s :=
    c2TiltRegularizedResidual_bound_of_analytic_geometric
      hs.offCritical hs.tiltScale_pos hs.tiltConstant_nonneg htiltLayer
  have hhorizontal :
      ‖c2ConcreteOddHorizontalDefect coreCutoff s‖ ≤
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s := by
    unfold c2ConcreteOddHorizontalDefect
    exact c2HorizontalRegularizedDefect_bound
      hs.horizontalScale_pos hs.horizontalConstant_nonneg
      hs.horizontalRatio_nonneg hs.horizontalRatio_lt_one
      hs.horizontalLayer_bound
  have hcutoff :
      ‖c2ConcreteCutoffError K M s‖ ≤
        c2CutoffUpperFromScale cutoffConstant cutoffScale s := by
    simpa [c2CutoffUpperFromScale] using
      c2Cutoff_bound_from_scaled hs.cutoffScale_pos hs.cutoff_scaled_bound
  have hdominance :
      c2QuartetVerticalTailUpper s +
          c2TiltAnalyticRegularizedUpper tiltConstant tiltScale s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s +
          c2CutoffUpperFromScale cutoffConstant cutoffScale s <
        c2ExpandedQuartetK2Margin s := by
    simpa [c2QuartetBulkGUpper, c2BulkGUpper, c2BulkEUpper,
      c2ExpandedQuartetK2Margin, add_assoc, add_left_comm, add_comm]
      using hs.quartet_dominance
  have hfinite :
      c2ConcreteAntiMiracleFiniteModel
        (c2OddTailBalancingSeed coreCutoff K M) coreCutoff K M s ≠ 0 :=
    c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
      (tiltSeed := c2OddTailBalancingSeed coreCutoff K M)
      (coreCutoff := coreCutoff) (K := K) (M := M)
      (tiltUpper := c2TiltAnalyticRegularizedUpper tiltConstant tiltScale)
      (horizontalUpper :=
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
      (cutoffUpper := c2CutoffUpperFromScale cutoffConstant cutoffScale)
      hs.offCritical htilt hhorizontal hcutoff hdominance
  simpa [adjustedQuartetBalancedGenuineBulkModel,
    c2OddTailBalancingSeedBulkModel, c2ConcreteAntiMiracleFiniteModel,
    c2ScaledSeededExplicitOddTailBulkModel] using hfinite

theorem adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_noCancellation
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ}
    (h : GenuineCentralNoCancellation s) :
    adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0 := by
  exact
    (adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero
      coreCutoff K M h.1).mpr h.2

/-- Genuine-first bridge back to the raw central target: once the balanced bulk
model is shown nonzero at a right-half-plane point, the central genuine object
is nonzero there as well. -/
theorem genuineCentralNoCancellation_of_adjustedQuartetBalancedGenuineBulkModel_ne_zero
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} (hs : 0 < s.re)
    (hbulk : adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0) :
    GenuineCentralNoCancellation s := by
  exact
    ⟨hs,
      (adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero
        coreCutoff K M hs).mp hbulk⟩

/-- Literal genuine `neq zero` bridge: nonvanishing of the balanced bulk model
is exactly nonvanishing of the raw central genuine object in the right
half-plane. -/
theorem genuineCentral_ne_zero_of_bulkModel_ne_zero
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} (hs : 0 < s.re)
    (hbulk : adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0) :
    genuineCentralDoubleSeries s ≠ 0 :=
  (adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero
    coreCutoff K M hs).mp hbulk

/-- Direct raw genuine middle closure from the quartet-concrete balanced-bulk
certificate, routed through the explicit four-debt ledger. -/
theorem genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion_ledger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_adjustedQuartetBalancedGenuineBulkModel_ne_zero
      hs.offCritical.1
      (adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
        hs)

/-- Literal genuine `neq zero` from the concrete raw quartet certificate,
routed through the explicit four-debt ledger. -/
theorem genuineCentral_ne_zero_of_mem_concreteRegion_ledger
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_bulkModel_ne_zero
    hs.offCritical.1
    (adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
      hs)

/-- Direct raw genuine middle closure from the quartet-concrete balanced-bulk
certificate. -/
theorem genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (hs : s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion_ledger
      hs

/-- Build the raw genuine quartet-concrete region from the active local middle
package plus the two raw bounds that are not part of the continued calibration:
the balanced seed and the raw central cutoff error. -/
theorem adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤
        tiltConstant s)
    (hcutoff :
      ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤
        cutoffConstant s) :
    s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale := by
  exact {
    offCritical := data.offCritical
    tiltScale_pos := data.scale.tiltScale_pos
    tiltConstant_nonneg := data.scale.tiltConstant_nonneg
    tilt_scaled_bound := hseed
    horizontalScale_pos := data.scale.horizontalScale_pos
    horizontalConstant_nonneg := data.scale.horizontalConstant_nonneg
    horizontalRatio_nonneg := data.scale.horizontalRatio_nonneg
    horizontalRatio_lt_one := data.scale.horizontalRatio_lt_one
    horizontalLayer_bound := data.horizontal.layer_bound
    cutoffScale_pos := data.scale.cutoffScale_pos
    cutoff_scaled_bound := hcutoff
    quartet_dominance := by
      simpa [C2ExpandedQuartetDominance, c2ExpandedQuartetLeftUpper,
        c2ExpandedQuartetGUpper, c2ExpandedQuartetEUpper,
        c2ExpandedQuartetK2Margin] using data.main.dominance
  }

/-- Active local middle package plus raw seed/cutoff bounds closes the central
genuine no-cancellation target. -/
theorem genuineCentralNoCancellation_of_localBulkData_rawBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤
        tiltConstant s)
    (hcutoff :
      ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤
        cutoffConstant s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
      (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
        data hseed hcutoff)

/-- Literal genuine `neq zero` from active local middle data plus raw seed and
cutoff bounds. -/
theorem genuineCentral_ne_zero_of_localBulkData_rawBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤
        tiltConstant s)
    (hcutoff :
      ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤
        cutoffConstant s) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_mem_concreteRegion_ledger
    (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
      data hseed hcutoff)

/-- Raw central cutoff budget in the same scaled currency used by the bulk
middle package. -/
def C2RawCentralCutoffScaledBound
    (K M : ℕ) (cutoffConstant cutoffScale : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤ cutoffConstant s

/-- Triangle upper for the raw vertical/rectangular saldo in the balanced
genuine seed. -/
noncomputable def c2RawTriangleVerticalRectangularUpper
    (K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ‖verticalDepthTailFromTwo s‖ + ‖rectangularGenuine s K M‖ +
      2 * ‖genuineCentralDoubleSeries s‖

/-- Raw tilt budget whose value is exactly the triangle vertical/rectangular
saldo plus the local horizontal envelope, times the canonical resolvent gap. -/
noncomputable def c2RawTriangleSeedTiltConstant
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (c2RawTriangleVerticalRectangularUpper K M s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) *
      (1 + ‖q s‖)

/-- Raw cutoff budget chosen as the actual norm of the cutoff error. -/
noncomputable def c2RawCentralCutoffNormConstant
    (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ConcreteCutoffError K M s‖

/-- Quartet dominance for the raw triangle budgets.  This is the remaining
numeric middle inequality after the seed and cutoff saldos are budgeted
definitionally. -/
def C2RawTriangleQuartetDominance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2QuartetBulkGUpper
      (c2BulkGUpper
        (c2TiltAnalyticRegularizedUpper
          (c2RawTriangleSeedTiltConstant
            K M horizontalConstant horizontalScale horizontalRatio)
          (fun _ => (1 : ℝ)))
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)) s +
    c2BulkEUpper
      (c2CutoffUpperFromScale
        (c2RawCentralCutoffNormConstant K M)
        (fun _ => (1 : ℝ))) s <
      c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

/-- Explicit residual upper left after the exact quartet tail has been
reserved. -/
noncomputable def c2RawTriangleResidualUpper
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2RawTriangleSeedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio s *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s

/-- Residual form of the raw triangle dominance inequality. -/
def C2RawTriangleResidualDominance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2RawTriangleResidualUpper
      K M horizontalConstant horizontalScale horizontalRatio s <
    c2ExpandedQuartetResidualMargin s

theorem C2RawTriangleQuartetDominance_of_residualDominance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hdominance :
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2RawTriangleQuartetDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  have hexpanded :
      C2ExpandedQuartetDominance
        (c2RawTriangleSeedTiltConstant
          K M horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ))
        horizontalConstant horizontalScale horizontalRatio
        (c2RawCentralCutoffNormConstant K M)
        (fun _ => (1 : ℝ)) s := by
    apply c2ExpandedQuartetDominance_of_residualBound
    simpa [C2RawTriangleResidualDominance,
      c2RawTriangleResidualUpper, c2ExpandedQuartetResidualUpper,
      c2TiltAnalyticRegularizedUpper, c2TiltRegularizedUpper,
      c2TiltAnalyticRatio, c2CutoffUpperFromScale] using hdominance
  simpa [C2RawTriangleQuartetDominance, C2ExpandedQuartetDominance,
    c2ExpandedQuartetLeftUpper, c2ExpandedQuartetGUpper,
    c2ExpandedQuartetEUpper, c2ExpandedQuartetK2Margin] using hexpanded

/-- Expanded scalar form of the raw residual upper. -/
theorem c2RawTriangleResidualUpper_eq_expanded
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    c2RawTriangleResidualUpper
        K M horizontalConstant horizontalScale horizontalRatio s =
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s := by
  simp [c2RawTriangleResidualUpper, c2RawTriangleSeedTiltConstant]

/-- A fully scalar budget criterion for the raw residual dominance. -/
theorem C2RawTriangleResidualDominance_of_scalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    C2RawTriangleResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  simpa [C2RawTriangleResidualDominance,
    c2RawTriangleResidualUpper_eq_expanded] using hbudget

/-- Monotone scalar budget criterion: any external upper bounds for the three
raw saldos may be used, provided their combined residual budget fits below the
quartet residual margin. -/
theorem C2RawTriangleResidualDominance_of_upperBudgets
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget horizontalBudget cutoffBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hvertical :
      c2RawTriangleVerticalRectangularUpper K M s ≤ verticalBudget)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget)
    (hbudget :
      ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget <
          c2ExpandedQuartetResidualMargin s) :
    C2RawTriangleResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2RawTriangleResidualDominance_of_scalarBudget
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg
      (add_nonneg zero_le_one (norm_nonneg _))
      (inv_nonneg.mpr hgap_nonneg)
  have hsum :
      c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s ≤
        verticalBudget + horizontalBudget :=
    add_le_add hvertical hhorizontal
  have hmain :
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ := by
    simpa [mul_assoc] using
      mul_le_mul_of_nonneg_right hsum hcoeff_nonneg
  have hsum₂ :
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget :=
    add_le_add hmain hhorizontal
  have hsum₃ :
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget :=
    add_le_add hsum₂ hcutoff
  exact lt_of_le_of_lt hsum₃ hbudget

/-- Conditional obstruction for the raw triangle budget: if the raw vertical
triangle already dominates the standard vertical tail envelope, then the raw
triangle residual cannot fit below the quartet residual margin. -/
theorem not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hvertical :
      verticalDepthTailUpper s ≤
        c2RawTriangleVerticalRectangularUpper K M s) :
    ¬ C2RawTriangleResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  intro hdominance
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg
      (add_nonneg zero_le_one (norm_nonneg _))
      (inv_nonneg.mpr hgap_nonneg)
  have hhorizontal_nonneg :
      0 ≤ c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s :=
    c2HorizontalRegularizedUpper_nonneg_of_pos
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have hcutoff_nonneg :
      0 ≤ c2RawCentralCutoffNormConstant K M s := by
    unfold c2RawCentralCutoffNormConstant
    exact norm_nonneg _
  have hvertical_plus :
      verticalDepthTailUpper s ≤
        c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s := by
    linarith
  have htail_le_residual :
      verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
        c2RawTriangleResidualUpper
          K M horizontalConstant horizontalScale horizontalRatio s := by
    have hmain :
        verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
          (c2RawTriangleVerticalRectangularUpper K M s +
              c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s) *
            ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
      mul_le_mul_of_nonneg_right hvertical_plus hcoeff_nonneg
    rw [c2RawTriangleResidualUpper_eq_expanded]
    have hrest_nonneg :
        0 ≤ c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s +
            c2RawCentralCutoffNormConstant K M s :=
      add_nonneg hhorizontal_nonneg hcutoff_nonneg
    nlinarith [hmain]
  have htarget_lt :
      c2ExpandedQuartetResidualMargin s <
        verticalDepthTailUpper s *
          ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
    c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_linearCoefficient_of_offCriticalStrip
      hoff
  have hres_lt :
      c2RawTriangleResidualUpper
          K M horizontalConstant horizontalScale horizontalRatio s <
        c2ExpandedQuartetResidualMargin s := by
    simpa [C2RawTriangleResidualDominance] using hdominance
  linarith

/-- The raw triangle residual dominance cannot hold at points where the
vertical depth-tail upper is already sharp enough to be below the actual
vertical tail norm.  Thus any successful raw proof must contain a genuine
vertical saving, not only the plain geometric tail envelope. -/
theorem not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (htail : verticalDepthTailUpper s ≤ ‖verticalDepthTailFromTwo s‖) :
    ¬ C2RawTriangleResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle
    hoff hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_lt_one
  unfold c2RawTriangleVerticalRectangularUpper
  have hrect_nonneg : 0 ≤ ‖rectangularGenuine s K M‖ := norm_nonneg _
  have hcentral_nonneg :
      0 ≤ 2 * ‖genuineCentralDoubleSeries s‖ := by positivity
  linarith

/-- Necessary condition for the raw triangle residual dominance: the actual
vertical depth tail must be strictly smaller than its plain geometric upper.
This isolates the missing genuine saving in the raw budget route. -/
theorem C2RawTriangleResidualDominance_forces_verticalTail_strict_saving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hdominance :
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ‖verticalDepthTailFromTwo s‖ < verticalDepthTailUpper s := by
  by_contra hnot
  have htail : verticalDepthTailUpper s ≤ ‖verticalDepthTailFromTwo s‖ :=
    le_of_not_gt hnot
  exact
    (not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one htail)
      hdominance

lemma c2RawTriangleVerticalRectangularUpper_nonneg
    (K M : ℕ) (s : ℂ) :
    0 ≤ c2RawTriangleVerticalRectangularUpper K M s := by
  unfold c2RawTriangleVerticalRectangularUpper
  exact
    add_nonneg
      (add_nonneg (norm_nonneg _) (norm_nonneg _))
      (mul_nonneg (show (0 : ℝ) ≤ 2 by norm_num) (norm_nonneg _))

lemma c2RawTriangleSeedTiltConstant_nonneg
    (K M : ℕ)
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1) :
    0 ≤ c2RawTriangleSeedTiltConstant
      K M horizontalConstant horizontalScale horizontalRatio s := by
  have hvertical :
      0 ≤ c2RawTriangleVerticalRectangularUpper K M s :=
    c2RawTriangleVerticalRectangularUpper_nonneg K M s
  have hhorizontal :
      0 ≤ c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s :=
    c2HorizontalRegularizedUpper_nonneg_of_pos
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have hgap : 0 ≤ 1 + ‖q s‖ :=
    add_nonneg zero_le_one (norm_nonneg _)
  unfold c2RawTriangleSeedTiltConstant
  exact mul_nonneg (add_nonneg hvertical hhorizontal) hgap

/-- With the raw triangle tilt budget and unit scale, the seed-factor
inequality is definitional. -/
theorem c2RawTriangleSeedFactorScaledBound_unit
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    C2BalancingSeedFactorScaledBound
      (c2RawTriangleVerticalRectangularUpper K M)
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (fun z => 1 + ‖q z‖)
      (c2RawTriangleSeedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ)) s := by
  unfold C2BalancingSeedFactorScaledBound c2RawTriangleSeedTiltConstant
  simp

/-- The raw cutoff norm budget closes the scaled cutoff inequality with unit
scale. -/
theorem c2RawCentralCutoffScaledBound_unit_norm
    (K M : ℕ) (s : ℂ) :
    C2RawCentralCutoffScaledBound
      K M (c2RawCentralCutoffNormConstant K M) (fun _ => (1 : ℝ)) s := by
  unfold C2RawCentralCutoffScaledBound c2RawCentralCutoffNormConstant
  simp

/-- The balanced seed itself is bounded by the raw triangle tilt budget.  This
is the direct saldo inequality behind the raw quartet accounting. -/
theorem c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j) :
    ‖c2OddTailBalancingSeed coreCutoff K M s‖ * (fun _ => (1 : ℝ)) s ≤
      c2RawTriangleSeedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hvertical_nonneg :
      0 ≤ c2RawTriangleVerticalRectangularUpper K M s :=
    c2RawTriangleVerticalRectangularUpper_nonneg K M s
  have hgap_nonneg : 0 ≤ (fun z : ℂ => 1 + ‖q z‖) s :=
    add_nonneg zero_le_one (norm_nonneg _)
  have hvertical :
      C2VerticalRectangularResidualBound K M
        (c2RawTriangleVerticalRectangularUpper K M) s := by
    simpa [c2RawTriangleVerticalRectangularUpper] using
      c2VerticalRectangularResidualBound_triangle K M s
  have hhorizontal :
      C2OddHorizontalDefectBound coreCutoff
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio) s := by
    unfold C2OddHorizontalDefectBound
    unfold c2ConcreteOddHorizontalDefect
    exact
      c2HorizontalRegularizedDefect_bound
        hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_nonneg hhorizontalRatio_lt_one
        hhorizontalLayer_bound
  have hseedFactor :
      C2BalancingSeedFactorScaledBound
        (c2RawTriangleVerticalRectangularUpper K M)
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun z => 1 + ‖q z‖)
        (c2RawTriangleSeedTiltConstant
          K M horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ)) s :=
    c2RawTriangleSeedFactorScaledBound_unit
      K M horizontalConstant horizontalScale horizontalRatio s
  have hseedBudget :
      C2OddTailBalancingSeedScaledBound
        coreCutoff K M
        (c2RawTriangleSeedTiltConstant
          K M horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ)) s :=
    c2OddTailBalancingSeed_scaledBound_of_componentBounds
      hvertical_nonneg hgap_nonneg
      (by norm_num : 0 ≤ (fun _ : ℂ => (1 : ℝ)) s)
      hvertical hhorizontal (c2ResolventGapBound_one_add_norm_q s)
      hseedFactor
  exact
    c2OddTailBalancingSeed_scaled_bound
      (by norm_num : 0 ≤ (fun _ : ℂ => (1 : ℝ)) s)
      hseedBudget

/-- Raw triangle budgets produce the concrete raw genuine quartet certificate:
the seed and cutoff are paid definitionally, and the only remaining numerical
input is quartet dominance for the raw budgets. -/
theorem adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleQuartetDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      (c2RawTriangleSeedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ))
      horizontalConstant horizontalScale horizontalRatio
      (c2RawCentralCutoffNormConstant K M)
      (fun _ => (1 : ℝ)) := by
  have hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * (fun _ => (1 : ℝ)) s ≤
        c2RawTriangleSeedTiltConstant
          K M horizontalConstant horizontalScale horizontalRatio s :=
    c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
  have hcutoff :
      ‖c2ConcreteCutoffError K M s‖ * (fun _ => (1 : ℝ)) s ≤
        c2RawCentralCutoffNormConstant K M s := by
    simpa [C2RawCentralCutoffScaledBound] using
      c2RawCentralCutoffScaledBound_unit_norm K M s
  exact
    {
      offCritical := hoff
      tiltScale_pos := by norm_num
      tiltConstant_nonneg :=
        c2RawTriangleSeedTiltConstant_nonneg
          K M hhorizontalScale_pos hhorizontalConstant_nonneg
          hhorizontalRatio_lt_one
      tilt_scaled_bound := hseed
      horizontalScale_pos := hhorizontalScale_pos
      horizontalConstant_nonneg := hhorizontalConstant_nonneg
      horizontalRatio_nonneg := hhorizontalRatio_nonneg
      horizontalRatio_lt_one := hhorizontalRatio_lt_one
      horizontalLayer_bound := hhorizontalLayer_bound
      cutoffScale_pos := by norm_num
      cutoff_scaled_bound := hcutoff
      quartet_dominance := by
        simpa [C2RawTriangleQuartetDominance] using hdominance
    }

/-- Residual raw triangle budgets also produce the concrete raw genuine
quartet certificate, after translating residual dominance to quartet
dominance. -/
theorem adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      (c2RawTriangleSeedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ))
      horizontalConstant horizontalScale horizontalRatio
      (c2RawCentralCutoffNormConstant K M)
      (fun _ => (1 : ℝ)) := by
  exact
    adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2RawTriangleQuartetDominance_of_residualDominance hdominance)

/-- Raw triangle middle closure: after the seed and cutoff saldos are budgeted
directly, the only remaining quantitative input is quartet dominance for those
raw budgets. -/
theorem genuineCentralNoCancellation_of_rawTriangleQuartetDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleQuartetDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
      (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance
        hoff hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_nonneg hhorizontalRatio_lt_one
        hhorizontalLayer_bound hdominance)

/-- Literal genuine `neq zero` from raw triangle quartet dominance. -/
theorem genuineCentral_ne_zero_of_rawTriangleQuartetDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleQuartetDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_mem_concreteRegion_ledger
    (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound hdominance)

/-- Same closure, stated in the residual inequality form: raw tilt residual,
local horizontal envelope, and raw cutoff norm are smaller than the residual
quartet margin. -/
theorem genuineCentralNoCancellation_of_rawTriangleResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
      (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleResidualDominance
        hoff hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_nonneg hhorizontalRatio_lt_one
        hhorizontalLayer_bound hdominance)

/-- Literal genuine `neq zero` from raw triangle residual dominance. -/
theorem genuineCentral_ne_zero_of_rawTriangleResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_mem_concreteRegion_ledger
    (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound hdominance)

/--
Global middle wrapper for the raw-triangle route.  Once the pointwise horizontal
budget and raw residual dominance are supplied on the whole middle region, every
middle point has literal genuine central nonvanishing.
-/
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  intro s hs
  exact
    genuineCentral_ne_zero_of_rawTriangleResidualDominance
      hs.1
      (hhorizontalScale_pos hs)
      (hhorizontalConstant_nonneg hs)
      (hhorizontalRatio_nonneg hs)
      (hhorizontalRatio_lt_one hs)
      ((hhorizontal hs).layer_bound)
      (hdominance hs)

/--
Global middle wrapper in the fully expanded scalar budget form.  This exposes
the exact real inequality left by the raw-triangle route at every middle point.
-/
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_rawTriangleResidualDominance
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2RawTriangleResidualDominance_of_scalarBudget
          (hbudget hs))

/--
Global middle wrapper using external real upper budgets for the raw vertical,
horizontal, and cutoff saldos.  This is the most modular target for the next
middle estimates.
-/
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleUpperBudgets
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    {verticalBudget horizontalBudget cutoffBudget : ℂ → ℝ}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hvertical : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawTriangleVerticalRectangularUpper K M s ≤ verticalBudget s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalBudget s + horizontalBudget s) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget s + cutoffBudget s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_rawTriangleResidualDominance
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2RawTriangleResidualDominance_of_upperBudgets
          hs.1
          (hvertical hs)
          (hhorizontalBudget hs)
          (hcutoff hs)
          (hbudget hs))

/-- Refined raw-genuine tilt budget: the vertical/rectangular saldo is supplied
by an external genuine upper instead of the coarse triangle ledger. -/
noncomputable def c2RefinedVerticalSeedTiltConstant
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (verticalRectangularUpper s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) *
      (1 + ‖q s‖)

/-- Refined residual upper left after the exact quartet tail has been
reserved. -/
noncomputable def c2RefinedVerticalResidualUpper
    (K M : ℕ)
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2RefinedVerticalSeedTiltConstant
        verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s

/-- Refined residual dominance: same genuine quartet ledger, but with a
sharper vertical/rectangular budget supplied externally. -/
def C2RefinedVerticalResidualDominance
    (K M : ℕ)
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2RefinedVerticalResidualUpper
      K M verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s <
    c2ExpandedQuartetResidualMargin s

theorem c2RefinedVerticalResidualUpper_eq_expanded
    (K M : ℕ)
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    c2RefinedVerticalResidualUpper
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s =
      ((verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s := by
  simp [c2RefinedVerticalResidualUpper,
    c2RefinedVerticalSeedTiltConstant]

/-- Fully scalar criterion for refined vertical residual dominance. -/
theorem C2RefinedVerticalResidualDominance_of_scalarBudget
    {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      ((verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    C2RefinedVerticalResidualDominance
      K M verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s := by
  simpa [C2RefinedVerticalResidualDominance,
    c2RefinedVerticalResidualUpper_eq_expanded] using hbudget

/-- Monotone scalar budget criterion for the refined vertical route.  External
upper bounds for the refined vertical saldo, horizontal envelope, and cutoff
may be supplied in any convenient closed form. -/
theorem C2RefinedVerticalResidualDominance_of_upperBudgets
    {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget horizontalBudget cutoffBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hvertical : verticalRectangularUpper s ≤ verticalBudget)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget)
    (hbudget :
      ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget <
          c2ExpandedQuartetResidualMargin s) :
    C2RefinedVerticalResidualDominance
      K M verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s := by
  apply C2RefinedVerticalResidualDominance_of_scalarBudget
  have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_nonneg : 0 ≤ 1 - ‖q s‖ := by
    linarith [norm_nonneg (q s), hq_lt]
  have hcoeff_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    exact mul_nonneg
      (add_nonneg zero_le_one (norm_nonneg _))
      (inv_nonneg.mpr hgap_nonneg)
  have hsum :
      verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s ≤
        verticalBudget + horizontalBudget :=
    add_le_add hvertical hhorizontal
  have hmain :
      ((verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ := by
    simpa [mul_assoc] using
      mul_le_mul_of_nonneg_right hsum hcoeff_nonneg
  have hsum₂ :
      ((verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget :=
    add_le_add hmain hhorizontal
  have hsum₃ :
      ((verticalRectangularUpper s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s ≤
        ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget :=
    add_le_add hsum₂ hcutoff
  exact lt_of_le_of_lt hsum₃ hbudget

/-- Quartet dominance produced by the refined vertical budget. -/
def C2RefinedVerticalQuartetDominance
    (K M : ℕ)
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2QuartetBulkGUpper
      (c2BulkGUpper
        (c2TiltAnalyticRegularizedUpper
          (c2RefinedVerticalSeedTiltConstant
            verticalRectangularUpper
            horizontalConstant horizontalScale horizontalRatio)
          (fun _ => (1 : ℝ)))
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)) s +
    c2BulkEUpper
      (c2CutoffUpperFromScale
        (c2RawCentralCutoffNormConstant K M)
        (fun _ => (1 : ℝ))) s <
      c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

theorem C2RefinedVerticalQuartetDominance_of_residualDominance
    {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hdominance :
      C2RefinedVerticalResidualDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s) :
    C2RefinedVerticalQuartetDominance
      K M verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s := by
  have hexpanded :
      C2ExpandedQuartetDominance
        (c2RefinedVerticalSeedTiltConstant
          verticalRectangularUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ))
        horizontalConstant horizontalScale horizontalRatio
        (c2RawCentralCutoffNormConstant K M)
        (fun _ => (1 : ℝ)) s := by
    apply c2ExpandedQuartetDominance_of_residualBound
    simpa [C2RefinedVerticalResidualDominance,
      c2RefinedVerticalResidualUpper, c2ExpandedQuartetResidualUpper,
      c2TiltAnalyticRegularizedUpper, c2TiltRegularizedUpper,
      c2TiltAnalyticRatio, c2CutoffUpperFromScale] using hdominance
  simpa [C2RefinedVerticalQuartetDominance, C2ExpandedQuartetDominance,
    c2ExpandedQuartetLeftUpper, c2ExpandedQuartetGUpper,
    c2ExpandedQuartetEUpper, c2ExpandedQuartetK2Margin] using hexpanded

theorem C2RefinedVerticalResidualDominance_of_quartetDominance
    {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hdominance :
      C2RefinedVerticalQuartetDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s) :
    C2RefinedVerticalResidualDominance
      K M verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s := by
  rw [C2RefinedVerticalResidualDominance]
  rw [c2RefinedVerticalResidualUpper_eq_expanded]
  rw [C2RefinedVerticalQuartetDominance] at hdominance
  simp [c2QuartetBulkGUpper, c2BulkGUpper, c2BulkEUpper,
    c2CutoffUpperFromScale, c2TiltAnalyticRegularizedUpper,
    c2TiltRegularizedUpper, c2TiltAnalyticRatio,
    c2ExpandedQuartetResidualMargin,
    c2ExpandedQuartetK2Margin,
    c2RefinedVerticalSeedTiltConstant] at hdominance ⊢
  linarith

theorem C2RefinedVerticalResidualDominance_iff_quartetDominance
    (K M : ℕ)
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    C2RefinedVerticalResidualDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s ↔
      C2RefinedVerticalQuartetDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · exact C2RefinedVerticalQuartetDominance_of_residualDominance
  · exact C2RefinedVerticalResidualDominance_of_quartetDominance

lemma c2RefinedVerticalSeedTiltConstant_nonneg
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1) :
    0 ≤ c2RefinedVerticalSeedTiltConstant
      verticalRectangularUpper
      horizontalConstant horizontalScale horizontalRatio s := by
  have hhorizontal :
      0 ≤ c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s :=
    c2HorizontalRegularizedUpper_nonneg_of_pos
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have hgap : 0 ≤ 1 + ‖q s‖ :=
    add_nonneg zero_le_one (norm_nonneg _)
  unfold c2RefinedVerticalSeedTiltConstant
  exact mul_nonneg (add_nonneg hvertical_nonneg hhorizontal) hgap

/-- With a refined vertical budget and unit tilt scale, the seed-factor
inequality is definitional. -/
theorem c2RefinedVerticalSeedFactorScaledBound_unit
    (verticalRectangularUpper : ℂ → ℝ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    C2BalancingSeedFactorScaledBound
      verticalRectangularUpper
      (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio)
      (fun z => 1 + ‖q z‖)
      (c2RefinedVerticalSeedTiltConstant
        verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ)) s := by
  unfold C2BalancingSeedFactorScaledBound
    c2RefinedVerticalSeedTiltConstant
  simp

/-- A sharpened genuine vertical/rectangular upper plus the existing horizontal
envelope gives the raw balanced-seed inequality. -/
theorem c2OddTailBalancingSeed_scaled_bound_refinedVerticalUnit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j) :
    ‖c2OddTailBalancingSeed coreCutoff K M s‖ * (fun _ => (1 : ℝ)) s ≤
      c2RefinedVerticalSeedTiltConstant
        verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s := by
  have hgap_nonneg : 0 ≤ (fun z : ℂ => 1 + ‖q z‖) s :=
    add_nonneg zero_le_one (norm_nonneg _)
  have hhorizontal :
      C2OddHorizontalDefectBound coreCutoff
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio) s := by
    unfold C2OddHorizontalDefectBound
    unfold c2ConcreteOddHorizontalDefect
    exact
      c2HorizontalRegularizedDefect_bound
        hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_nonneg hhorizontalRatio_lt_one
        hhorizontalLayer_bound
  have hseedFactor :
      C2BalancingSeedFactorScaledBound
        verticalRectangularUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun z => 1 + ‖q z‖)
        (c2RefinedVerticalSeedTiltConstant
          verticalRectangularUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ)) s :=
    c2RefinedVerticalSeedFactorScaledBound_unit
      verticalRectangularUpper horizontalConstant horizontalScale
      horizontalRatio s
  have hseedBudget :
      C2OddTailBalancingSeedScaledBound
        coreCutoff K M
        (c2RefinedVerticalSeedTiltConstant
          verticalRectangularUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun _ => (1 : ℝ)) s :=
    c2OddTailBalancingSeed_scaledBound_of_componentBounds
      hvertical_nonneg hgap_nonneg
      (by norm_num : 0 ≤ (fun _ : ℂ => (1 : ℝ)) s)
      hvertical hhorizontal (c2ResolventGapBound_one_add_norm_q s)
      hseedFactor
  exact
    c2OddTailBalancingSeed_scaled_bound
      (by norm_num : 0 ≤ (fun _ : ℂ => (1 : ℝ)) s)
      hseedBudget

/-- Refined vertical budgets produce the concrete raw genuine quartet
certificate.  The remaining numerical input is the refined residual dominance
against the quartet margin. -/
theorem adjustedQuartetBalancedGenuineBulkConcrete_mem_of_refinedVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RefinedVerticalResidualDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s) :
    s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion
      coreCutoff K M
      (c2RefinedVerticalSeedTiltConstant
        verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ))
      horizontalConstant horizontalScale horizontalRatio
      (c2RawCentralCutoffNormConstant K M)
      (fun _ => (1 : ℝ)) := by
  have hseed :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * (fun _ => (1 : ℝ)) s ≤
        c2RefinedVerticalSeedTiltConstant
          verticalRectangularUpper
          horizontalConstant horizontalScale horizontalRatio s :=
    c2OddTailBalancingSeed_scaled_bound_refinedVerticalUnit
      hvertical_nonneg hvertical hhorizontalScale_pos
      hhorizontalConstant_nonneg hhorizontalRatio_nonneg
      hhorizontalRatio_lt_one hhorizontalLayer_bound
  have hcutoff :
      ‖c2ConcreteCutoffError K M s‖ * (fun _ => (1 : ℝ)) s ≤
        c2RawCentralCutoffNormConstant K M s := by
    simpa [C2RawCentralCutoffScaledBound] using
      c2RawCentralCutoffScaledBound_unit_norm K M s
  exact
    {
      offCritical := hoff
      tiltScale_pos := by norm_num
      tiltConstant_nonneg :=
        c2RefinedVerticalSeedTiltConstant_nonneg
          hvertical_nonneg hhorizontalScale_pos
          hhorizontalConstant_nonneg hhorizontalRatio_lt_one
      tilt_scaled_bound := hseed
      horizontalScale_pos := hhorizontalScale_pos
      horizontalConstant_nonneg := hhorizontalConstant_nonneg
      horizontalRatio_nonneg := hhorizontalRatio_nonneg
      horizontalRatio_lt_one := hhorizontalRatio_lt_one
      horizontalLayer_bound := hhorizontalLayer_bound
      cutoffScale_pos := by norm_num
      cutoff_scaled_bound := hcutoff
      quartet_dominance := by
        simpa [C2RefinedVerticalQuartetDominance] using
          C2RefinedVerticalQuartetDominance_of_residualDominance hdominance
    }

/-- Genuine central no-cancellation from a refined vertical residual budget. -/
theorem genuineCentralNoCancellation_of_refinedVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RefinedVerticalResidualDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
      (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_refinedVerticalResidualDominance
        hoff hvertical_nonneg hvertical hhorizontalScale_pos
        hhorizontalConstant_nonneg hhorizontalRatio_nonneg
        hhorizontalRatio_lt_one hhorizontalLayer_bound hdominance)

/-- Literal genuine `neq zero` from a refined vertical residual budget. -/
theorem genuineCentral_ne_zero_of_refinedVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {verticalRectangularUpper : ℂ → ℝ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2RefinedVerticalResidualDominance
        K M verticalRectangularUpper
        horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_mem_concreteRegion_ledger
    (adjustedQuartetBalancedGenuineBulkConcrete_mem_of_refinedVerticalResidualDominance
      hoff hvertical_nonneg hvertical hhorizontalScale_pos
      hhorizontalConstant_nonneg hhorizontalRatio_nonneg
      hhorizontalRatio_lt_one hhorizontalLayer_bound hdominance)

/-- Sharpest pointwise refined vertical/rectangular upper: the actual genuine
vertical/rectangular residual norm. -/
noncomputable def c2ExactVerticalRectangularResidualNormUpper
    (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖

lemma c2ExactVerticalRectangularResidualNormUpper_nonneg
    (K M : ℕ) (s : ℂ) :
    0 ≤ c2ExactVerticalRectangularResidualNormUpper K M s := by
  unfold c2ExactVerticalRectangularResidualNormUpper
  exact norm_nonneg _

theorem C2VerticalRectangularResidualBound_exactNorm
    (K M : ℕ) (s : ℂ) :
    C2VerticalRectangularResidualBound K M
      (c2ExactVerticalRectangularResidualNormUpper K M) s := by
  unfold C2VerticalRectangularResidualBound
    c2ExactVerticalRectangularResidualNormUpper
  exact le_rfl

/-- Refined dominance specialized to the exact genuine vertical residual norm.
This is the no-slack vertical ledger left after abandoning the coarse triangle
upper. -/
def C2ExactVerticalResidualDominance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2RefinedVerticalResidualDominance
    K M (c2ExactVerticalRectangularResidualNormUpper K M)
    horizontalConstant horizontalScale horizontalRatio s

/-- Remaining room available for the exact genuine vertical residual after the
horizontal and cutoff debits are paid and the resolvent factor is undone. -/
noncomputable def c2ExactVerticalResidualNormAllowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (c2ExpandedQuartetResidualMargin s -
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s -
        c2RawCentralCutoffNormConstant K M s) *
      ((1 - ‖q s‖) * (1 + ‖q s‖)⁻¹) -
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s

/-- Remaining room for the fixed genuine vertical anchor after also paying the
cutoff part that sits inside the exact vertical residual. -/
noncomputable def c2ExactVerticalAnchorResidualNormAllowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2ExactVerticalResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s -
      c2RawCentralCutoffNormConstant K M s

/-- Anchor residual rebased against the continued odd channel. -/
noncomputable def c2ContinuedVerticalAnchorResidual : ℂ → ℂ :=
  fun s => verticalDepthTailFromTwo s - continuedCentralOddChannel s

/-- Remaining anchor allowance after paying a pointwise central rebasing defect. -/
noncomputable def c2ContinuedVerticalAnchorResidualNormAllowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s -
      centralDefectUpper s

theorem c2ExactVerticalResidual_norm_le_anchor_add_cutoff
    (K M : ℕ) (s : ℂ) :
    ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
      ‖c2VerticalRectangularAnchorResidual s‖ +
        c2RawCentralCutoffNormConstant K M s := by
  rw [c2ScaledSeededExplicitOddTailVerticalRectangularResidual_eq_anchor_add_cutoff]
  unfold c2RawCentralCutoffNormConstant
  exact norm_add_le _ _

theorem exactVerticalAnchorBudget_iff_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    (‖c2VerticalRectangularAnchorResidual s‖ +
        c2RawCentralCutoffNormConstant K M s <
      c2ExactVerticalResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s) ↔
      ‖c2VerticalRectangularAnchorResidual s‖ <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold c2ExactVerticalAnchorResidualNormAllowance
  constructor <;> intro h <;> linarith

/-- The genuine anchor is the continued anchor plus the rebasing defect. -/
theorem c2VerticalRectangularAnchorResidual_eq_continuedAnchor_add_defect
    (s : ℂ) :
    c2VerticalRectangularAnchorResidual s =
      c2ContinuedVerticalAnchorResidual s +
        (continuedCentralOddChannel s - genuineCentralDoubleSeries s) := by
  unfold c2VerticalRectangularAnchorResidual
    c2ContinuedVerticalAnchorResidual
  ring

/-- Triangle bound for the anchor after rebasing through the continued channel. -/
theorem c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_add_defect
    (s : ℂ) :
    ‖c2VerticalRectangularAnchorResidual s‖ ≤
      ‖c2ContinuedVerticalAnchorResidual s‖ +
        ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ := by
  rw [c2VerticalRectangularAnchorResidual_eq_continuedAnchor_add_defect]
  have hsymm :
      continuedCentralOddChannel s - genuineCentralDoubleSeries s =
        -(genuineCentralDoubleSeries s - continuedCentralOddChannel s) := by
    ring
  calc
    ‖c2ContinuedVerticalAnchorResidual s +
        (continuedCentralOddChannel s - genuineCentralDoubleSeries s)‖ ≤
      ‖c2ContinuedVerticalAnchorResidual s‖ +
        ‖continuedCentralOddChannel s - genuineCentralDoubleSeries s‖ := by
          exact norm_add_le _ _
    _ = ‖c2ContinuedVerticalAnchorResidual s‖ +
        ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ := by
          rw [hsymm, norm_neg]

theorem c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_upper
    {centralDefectUpper : ℂ → ℝ} {s : ℂ}
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s) :
    ‖c2VerticalRectangularAnchorResidual s‖ ≤
      ‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s := by
  exact le_trans
    (c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_add_defect s)
    (add_le_add_right hcentralDefect _)

theorem continuedVerticalAnchorBudget_iff_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ} :
    (‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s <
      c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s) ↔
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio
          centralDefectUpper s := by
  unfold c2ContinuedVerticalAnchorResidualNormAllowance
  constructor <;> intro h <;> linarith

/-- Genuine-first triangular majorant for the rebasing defect. -/
noncomputable def c2GenuineRebasingDefectTriangleUpper
    (genuineCentralUpper continuedCentralUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => genuineCentralUpper s + continuedCentralUpper s

/-- The rebasing defect is paid by separate genuine and continued central uppers. -/
theorem c2GenuineRebasingDefect_norm_le_triangleUpper_of_bounds
    {genuineCentralUpper continuedCentralUpper : ℂ → ℝ} {s : ℂ}
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s) :
    ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
      c2GenuineRebasingDefectTriangleUpper
        genuineCentralUpper continuedCentralUpper s := by
  unfold C2GenuineCentralBound C2ContinuedCentralBound
    c2GenuineRebasingDefectTriangleUpper at *
  calc
    ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        ‖genuineCentralDoubleSeries s‖ + ‖continuedCentralOddChannel s‖ :=
      norm_sub_le _ _
    _ ≤ genuineCentralUpper s + continuedCentralUpper s :=
      add_le_add hgenuine hcontinued

/-- Exact genuine-first triangular majorant for the rebasing defect. -/
noncomputable def c2GenuineRebasingDefectExactTriangleUpper : ℂ → ℝ :=
  c2GenuineRebasingDefectTriangleUpper
    c2GenuineCentralExactUpper c2ContinuedCentralExactUpper

theorem c2GenuineRebasingDefect_norm_le_exactTriangleUpper
    (s : ℂ) :
    ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
      c2GenuineRebasingDefectExactTriangleUpper s := by
  exact
    c2GenuineRebasingDefect_norm_le_triangleUpper_of_bounds
      (c2GenuineCentralBound_exact s)
      (c2ContinuedCentralBound_exact s)

lemma c2GenuineRebasingDefectExactTriangleUpper_nonneg
    (s : ℂ) :
    0 ≤ c2GenuineRebasingDefectExactTriangleUpper s := by
  unfold c2GenuineRebasingDefectExactTriangleUpper
    c2GenuineRebasingDefectTriangleUpper c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper
  positivity

/-- Anchor allowance after paying the exact triangular rebasing-defect majorant. -/
noncomputable def c2ContinuedVerticalAnchorExactDefectNormAllowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  c2ContinuedVerticalAnchorResidualNormAllowance
    K M horizontalConstant horizontalScale horizontalRatio
    c2GenuineRebasingDefectExactTriangleUpper

/-- Exact upper envelope for the continued odd channel, kept local to the
genuine-first anchor ledger. -/
noncomputable def c2ContinuedOddExactUpper : ℂ → ℝ :=
  fun s => ‖continuedOddDirichletChannel s‖

theorem c2ContinuedOddChannelBound_exact (s : ℂ) :
    C2ContinuedOddChannelBound c2ContinuedOddExactUpper s := by
  unfold C2ContinuedOddChannelBound c2ContinuedOddExactUpper
  exact le_rfl

/-- Global middle version of a continued odd-channel norm upper. -/
def C2ContinuedOddChannelBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ContinuedOddChannelBound oddUpper s

theorem c2ContinuedOddChannelBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedOddChannelBoundOnMiddle
      c2ContinuedOddExactUpper near edge := by
  intro s _hs
  exact c2ContinuedOddChannelBound_exact s

/-- Odd-channel upper for the continued vertical anchor. -/
noncomputable def c2ContinuedVerticalAnchorOddUpper
    (oddUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => verticalDepthTailUpper s * (1 + 2 * oddUpper s)

/-- Exact odd-channel instance of the continued vertical-anchor upper. -/
noncomputable def c2ContinuedVerticalAnchorExactOddUpper : ℂ → ℝ :=
  c2ContinuedVerticalAnchorOddUpper c2ContinuedOddExactUpper

/-- The continued anchor factors as the vertical tail times the odd-channel
gap. -/
theorem c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap
    (s : ℂ) :
    c2ContinuedVerticalAnchorResidual s =
      verticalDepthTailFromTwo s *
        (1 - (2 : ℂ) * continuedOddDirichletChannel s) := by
  unfold c2ContinuedVerticalAnchorResidual
    continuedCentralOddChannel centralFromOddChannel
  ring

theorem c2ContinuedVerticalAnchorResidual_norm_le_oddUpper
    {oddUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s) :
    ‖c2ContinuedVerticalAnchorResidual s‖ ≤
      c2ContinuedVerticalAnchorOddUpper oddUpper s := by
  have htail :
      ‖verticalDepthTailFromTwo s‖ ≤ verticalDepthTailUpper s :=
    verticalDepthTailFromTwo_norm_le_upper_of_offCriticalStrip s hoff
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    verticalDepthTailUpper_nonneg_of_re_pos s hoff.1
  have hodd_gap :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ ≤
        1 + 2 * ‖continuedOddDirichletChannel s‖ := by
    have h := norm_sub_le (1 : ℂ) ((2 : ℂ) * continuedOddDirichletChannel s)
    simpa [norm_mul] using h
  have hodd_gap_upper :
      1 + 2 * ‖continuedOddDirichletChannel s‖ ≤
        1 + 2 * oddUpper s := by
    unfold C2ContinuedOddChannelBound at hodd
    nlinarith
  calc
    ‖c2ContinuedVerticalAnchorResidual s‖ =
        ‖verticalDepthTailFromTwo s *
          (1 - (2 : ℂ) * continuedOddDirichletChannel s)‖ := by
          rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap]
    _ = ‖verticalDepthTailFromTwo s‖ *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
          rw [norm_mul]
    _ ≤ verticalDepthTailUpper s *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
          exact mul_le_mul_of_nonneg_right htail (norm_nonneg _)
    _ ≤ verticalDepthTailUpper s *
        (1 + 2 * ‖continuedOddDirichletChannel s‖) := by
          exact mul_le_mul_of_nonneg_left hodd_gap htail_nonneg
    _ ≤ verticalDepthTailUpper s * (1 + 2 * oddUpper s) := by
          exact mul_le_mul_of_nonneg_left hodd_gap_upper htail_nonneg
    _ = c2ContinuedVerticalAnchorOddUpper oddUpper s := by
          rfl

theorem c2ContinuedVerticalAnchorResidual_norm_le_exactOddUpper
    {s : ℂ} (hoff : offCriticalStrip s) :
    ‖c2ContinuedVerticalAnchorResidual s‖ ≤
      c2ContinuedVerticalAnchorExactOddUpper s := by
  exact
    c2ContinuedVerticalAnchorResidual_norm_le_oddUpper
      hoff (c2ContinuedOddChannelBound_exact s)

/-- Direct upper for the continued odd gap.  Unlike the norm-only odd-channel
upper, this can record phase cancellation in `1 - 2 * continuedOdd`. -/
def C2ContinuedOddGapBound (gapUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ ≤ gapUpper s

/-- Global middle version of the continued odd-gap upper bound. -/
def C2ContinuedOddGapBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (gapUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ContinuedOddGapBound gapUpper s

/-- Exact upper for the continued odd gap. -/
noncomputable def c2ContinuedOddExactGapUpper : ℂ → ℝ :=
  fun s => ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖

theorem c2ContinuedOddGapBound_exact (s : ℂ) :
    C2ContinuedOddGapBound c2ContinuedOddExactGapUpper s := by
  unfold C2ContinuedOddGapBound c2ContinuedOddExactGapUpper
  exact le_rfl

theorem c2ContinuedOddGapBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedOddGapBoundOnMiddle
      c2ContinuedOddExactGapUpper near edge := by
  intro s _hs
  exact c2ContinuedOddGapBound_exact s

/-- Continued vertical-anchor upper from a direct odd-gap estimate. -/
noncomputable def c2ContinuedVerticalAnchorGapUpper
    (gapUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => verticalDepthTailUpper s * gapUpper s

theorem c2ContinuedVerticalAnchorResidual_norm_le_gapUpper
    {gapUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap : C2ContinuedOddGapBound gapUpper s) :
    ‖c2ContinuedVerticalAnchorResidual s‖ ≤
      c2ContinuedVerticalAnchorGapUpper gapUpper s := by
  have htail :
      ‖verticalDepthTailFromTwo s‖ ≤ verticalDepthTailUpper s :=
    verticalDepthTailFromTwo_norm_le_upper_of_offCriticalStrip s hoff
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    verticalDepthTailUpper_nonneg_of_re_pos s hoff.1
  calc
    ‖c2ContinuedVerticalAnchorResidual s‖ =
        ‖verticalDepthTailFromTwo s *
          (1 - (2 : ℂ) * continuedOddDirichletChannel s)‖ := by
          rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap]
    _ = ‖verticalDepthTailFromTwo s‖ *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
          rw [norm_mul]
    _ ≤ verticalDepthTailUpper s * gapUpper s := by
          exact mul_le_mul htail hgap (norm_nonneg _) htail_nonneg
    _ = c2ContinuedVerticalAnchorGapUpper gapUpper s := by
          rfl

/-- Combined upper: continued-anchor odd envelope plus rebasing-defect envelope. -/
noncomputable def c2ContinuedAnchorOddRebasingTriangleUpper
    (oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    c2ContinuedVerticalAnchorOddUpper oddUpper s +
      c2GenuineRebasingDefectTriangleUpper
        genuineCentralUpper continuedCentralUpper s

/-- Combined upper when the continued central envelope is inherited from the
same odd-channel envelope. -/
noncomputable def c2ContinuedAnchorOddGenuineTriangleUpper
    (oddUpper genuineCentralUpper : ℂ → ℝ) : ℂ → ℝ :=
  c2ContinuedAnchorOddRebasingTriangleUpper
    oddUpper genuineCentralUpper (c2ContinuedCentralFromOddUpper oddUpper)

/-- Combined upper from a direct continued odd-gap envelope plus rebasing
envelopes. -/
noncomputable def c2ContinuedAnchorGapRebasingTriangleUpper
    (gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    c2ContinuedVerticalAnchorGapUpper gapUpper s +
      c2GenuineRebasingDefectTriangleUpper
        genuineCentralUpper continuedCentralUpper s

/-- Final scalar budget for the odd-anchor ledger with separated rebasing
envelopes.  This is the pointwise real inequality left after the quartet
credit, horizontal debit, and cutoff debit have already been folded into the
anchor allowance. -/
def C2GenuineOddAnchorFinalBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedAnchorOddRebasingTriangleUpper
      oddUpper genuineCentralUpper continuedCentralUpper s <
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Final scalar budget when the continued central upper is inherited from the
same odd-channel upper. -/
def C2GenuineOddAnchorInheritedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedAnchorOddGenuineTriangleUpper oddUpper genuineCentralUpper s <
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Final scalar budget for the gap-aware odd-anchor ledger. -/
def C2GenuineGapAnchorFinalBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ContinuedAnchorGapRebasingTriangleUpper
      gapUpper genuineCentralUpper continuedCentralUpper s <
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Final scalar budget for the exact gap-aware anchor ledger. -/
noncomputable def C2GenuineExactGapAnchorFinalBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2GenuineGapAnchorFinalBudget
    K M horizontalConstant horizontalScale horizontalRatio
    c2ContinuedOddExactGapUpper
    c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper s

/-- Fully expanded form of the exact gap-aware anchor budget. -/
theorem C2GenuineExactGapAnchorFinalBudget_iff_explicit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
        ‖genuineCentralDoubleSeries s‖ +
        ‖continuedCentralOddChannel s‖ <
          c2ExactVerticalAnchorResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2GenuineExactGapAnchorFinalBudget
    C2GenuineGapAnchorFinalBudget
    c2ContinuedAnchorGapRebasingTriangleUpper
    c2ContinuedVerticalAnchorGapUpper
    c2ContinuedOddExactGapUpper
    c2GenuineRebasingDefectTriangleUpper
    c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper
  constructor <;> intro h <;> linarith

theorem C2GenuineExactGapAnchorFinalBudget_of_explicit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
        ‖genuineCentralDoubleSeries s‖ +
        ‖continuedCentralOddChannel s‖ <
          c2ExactVerticalAnchorResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2GenuineExactGapAnchorFinalBudget_iff_explicit).2 hbudget

/--
Pointwise allowance for the exact continued-odd gap after the central debits are
paid and the vertical tail upper is divided out.
-/
noncomputable def c2ExactGapAnchorFactorAllowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    (c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s -
      c2GenuineCentralExactUpper s -
      c2ContinuedCentralExactUpper s) /
      verticalDepthTailUpper s

/--
Residual-margin budget equivalent to positivity of the exact gap allowance.
It says that, before dividing by the positive vertical-tail upper, the exact
vertical residual allowance still has room for the raw cutoff and the two
central rebasing envelopes.
-/
def C2ExactGapAnchorPositiveAllowanceBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s +
      c2RawCentralCutoffNormConstant K M s <
    c2ExactVerticalResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the positive exact gap allowance budget. -/
def C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPositiveAllowanceBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Fully scalar version of positive exact gap allowance.  This is the same
positivity budget before the residual allowance has been compressed into
`c2ExactVerticalResidualNormAllowance`.
-/
def C2ExactGapAnchorPositiveAllowanceScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((c2GenuineCentralExactUpper s +
          c2ContinuedCentralExactUpper s +
          c2RawCentralCutoffNormConstant K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s <
      c2ExpandedQuartetResidualMargin s

/-- Global middle version of the scalar positive exact gap allowance budget. -/
def C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPositiveAllowanceScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
External-upper version of the positive exact gap allowance scalar budget.  It
separates the analytic bounds from the final real scalar inequality.
-/
def C2ExactGapAnchorPositiveAllowanceUpperBudget
    (_K _M : ℕ)
    (genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((genuineCentralUpper s +
          continuedCentralUpper s +
          cutoffBudget s +
          horizontalBudget s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    horizontalBudget s + cutoffBudget s <
      c2ExpandedQuartetResidualMargin s

/-- Global middle version of the external-upper positive allowance budget. -/
def C2ExactGapAnchorPositiveAllowanceUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPositiveAllowanceUpperBudget
      K M genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget s

/-- Pointwise exact phase-saving obligation for the continued odd gap. -/
def C2ExactGapAnchorPhaseSaving
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the exact phase-saving obligation. -/
def C2ExactGapAnchorPhaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Pointwise disk form of the exact phase-saving target.  Centering the continued
odd channel at `1/2` converts the gap `1 - 2 * odd` into a radius condition.
-/
def C2ExactGapAnchorPhaseDisk
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s / 2

/-- Global middle version of the exact phase disk condition. -/
def C2ExactGapAnchorPhaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Upper bound for the distance from the continued odd channel to `1/2`. -/
def C2ContinuedOddHalfDiskBound (halfDiskUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ ≤ halfDiskUpper s

/-- Global middle version of the half-disk upper bound. -/
def C2ContinuedOddHalfDiskBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (halfDiskUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ContinuedOddHalfDiskBound halfDiskUpper s

/-- Metric half-disk upper inherited from a norm upper for the odd channel. -/
noncomputable def c2HalfDiskUpperFromOddUpper
    (oddUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => (1 / 2 : ℝ) + oddUpper s

/-- Scalar budget that converts a half-disk upper into the exact phase disk. -/
def C2ExactGapAnchorPhaseDiskBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * halfDiskUpper s <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the half-disk scalar budget. -/
def C2ExactGapAnchorPhaseDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPhaseDiskBudget
      K M horizontalConstant horizontalScale horizontalRatio halfDiskUpper s

/-- Exact phase-disk budget without an external half-disk upper. -/
def C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
      2 * ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s

/-- Lower envelope for the exact vertical tail norm on the off-critical strip. -/
noncomputable def c2VerticalDepthTailLower : ℂ → ℝ :=
  fun s => ‖q s‖ ^ 2 / (1 + ‖q s‖)

/-- Upper bound for the continued vertical anchor residual. -/
def C2ContinuedVerticalAnchorResidualBound
    (anchorUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ ≤ anchorUpper s

/-- Global middle version of the continued vertical anchor residual bound. -/
def C2ContinuedVerticalAnchorResidualBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (anchorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ContinuedVerticalAnchorResidualBound anchorUpper s

/--
Half-disk upper inherited from an anchor residual upper by dividing by the
off-critical lower envelope for `2 * ‖verticalDepthTailFromTwo s‖`.
-/
noncomputable def c2HalfDiskUpperFromAnchor
    (anchorUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => anchorUpper s / (2 * c2VerticalDepthTailLower s)

/-- Exact upper for the continued vertical anchor residual. -/
noncomputable def c2ContinuedVerticalAnchorResidualExactUpper : ℂ → ℝ :=
  fun s => ‖c2ContinuedVerticalAnchorResidual s‖

theorem C2ContinuedVerticalAnchorResidualBound_exact
    (s : ℂ) :
    C2ContinuedVerticalAnchorResidualBound
      c2ContinuedVerticalAnchorResidualExactUpper s := by
  unfold C2ContinuedVerticalAnchorResidualBound
    c2ContinuedVerticalAnchorResidualExactUpper
  exact le_rfl

theorem C2ContinuedVerticalAnchorResidualBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedVerticalAnchorResidualBoundOnMiddle
      c2ContinuedVerticalAnchorResidualExactUpper near edge := by
  intro s _hs
  exact C2ContinuedVerticalAnchorResidualBound_exact s

/-- Exact operator-side anchor residual budget after division by the tail lower. -/
noncomputable def C2ExactGapAnchorExactAnchorResidualBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorPhaseDiskBudget
    K M horizontalConstant horizontalScale horizontalRatio
    (c2HalfDiskUpperFromAnchor
      c2ContinuedVerticalAnchorResidualExactUpper) s

/-- Global middle version of the exact lower-envelope anchor residual budget. -/
noncomputable def C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorExactAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Lossless operator-side anchor budget using the exact vertical-tail norm instead
of the off-critical lower envelope.
-/
def C2ExactGapAnchorTailNormAnchorResidualBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ <
    ‖verticalDepthTailFromTwo s‖ *
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the lossless operator-side anchor budget. -/
def C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/--
External-upper version of the lossless operator-side anchor budget.  It keeps
the exact vertical-tail norm and separates the residual estimate from the final
strict scalar inequality.
-/
def C2ExactGapAnchorTailNormAnchorResidualUpperBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  anchorUpper s <
    ‖verticalDepthTailFromTwo s‖ *
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s

/--
Global middle version of the external-upper lossless operator-side anchor
budget.
-/
def C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailNormAnchorResidualUpperBudget
      K M horizontalConstant horizontalScale horizontalRatio anchorUpper s

/--
Normalized operator-side bound for the continued vertical anchor residual.  The
factor upper is dimensionless because the exact vertical-tail norm is kept on
the right.
-/
def C2ContinuedVerticalAnchorResidualFactorBound
    (anchorFactorUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ ≤
    ‖verticalDepthTailFromTwo s‖ * anchorFactorUpper s

/-- Global middle version of the normalized anchor residual bound. -/
def C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (anchorFactorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ContinuedVerticalAnchorResidualFactorBound anchorFactorUpper s

/-- Scalar factor budget for the normalized lossless anchor residual route. -/
def C2ExactGapAnchorTailNormAnchorResidualFactorBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  anchorFactorUpper s <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the normalized lossless anchor factor budget. -/
def C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget
      K M horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper s

/-- Exact normalized anchor residual factor. -/
noncomputable def c2ContinuedVerticalAnchorResidualExactFactorUpper :
    ℂ → ℝ :=
  fun s =>
    ‖c2ContinuedVerticalAnchorResidual s‖ /
      ‖verticalDepthTailFromTwo s‖

/-- Distortion introduced by replacing the exact vertical tail norm by the C2
lower envelope. -/
noncomputable def c2VerticalTailLowerDistortion : ℂ → ℝ :=
  fun s => ‖verticalDepthTailFromTwo s‖ / c2VerticalDepthTailLower s

/-- Explicit vertical upper for the lower-envelope distortion. -/
noncomputable def c2VerticalTailLowerDistortionExplicitUpper : ℂ → ℝ :=
  fun s => (1 + ‖q s‖) / (1 - ‖q s‖)

/-- Exact anchor residual factor after normalizing by the C2 lower tail
envelope. -/
noncomputable def c2ContinuedVerticalAnchorResidualExactLowerFactorUpper :
    ℂ → ℝ :=
  fun s =>
    ‖c2ContinuedVerticalAnchorResidual s‖ /
      c2VerticalDepthTailLower s

/-- Tail-lower distorted exact-gap budget for the operator-side anchor route. -/
def C2ExactGapAnchorTailLowerDistortedGapBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2VerticalTailLowerDistortion s *
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the tail-lower distorted exact-gap budget. -/
def C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedGapBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Sufficient explicit vertical-upper version of the tail-lower distorted
exact-gap budget. -/
def C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2VerticalTailLowerDistortionExplicitUpper s *
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the explicit vertical-upper distorted-gap budget. -/
def C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Disk form of the explicit vertical-upper distorted-gap budget. -/
def C2ExactGapAnchorTailLowerDistortedPhaseDisk
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
    c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s /
      (2 * c2VerticalTailLowerDistortionExplicitUpper s)

/-- Global middle version of the distorted phase disk target. -/
def C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Scalar budget that converts a half-disk upper around `1 / 2` into the distorted
phase-disk target.
-/
def C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * c2VerticalTailLowerDistortionExplicitUpper s * halfDiskUpper s <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the distorted half-disk scalar budget. -/
def C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
      K M horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper s

/-- Payment upper for the distorted half-disk route. -/
noncomputable def c2TailLowerDistortedHalfDiskPaymentUpper
    (halfDiskUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => 2 * c2VerticalTailLowerDistortionExplicitUpper s * halfDiskUpper s

/--
Two-sided scalar payment budget for the distorted half-disk route: the explicit
vertical distortion times the half-disk radius is strictly below an external
lower bound for the allowance.
-/
def C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
    (halfDiskUpper allowanceLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2TailLowerDistortedHalfDiskPaymentUpper halfDiskUpper s <
    allowanceLower s

/-- Global middle version of the distorted half-disk payment budget. -/
def C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (halfDiskUpper allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
      halfDiskUpper allowanceLower s

/--
Cleared scalar payment budget for the distorted half-disk route.  This is the
same payment comparison after multiplying by the positive denominator
`1 - ‖q s‖`.
-/
def C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
    (halfDiskUpper allowanceLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * (1 + ‖q s‖) * halfDiskUpper s <
    allowanceLower s * (1 - ‖q s‖)

/-- Global middle version of the cleared distorted half-disk payment budget. -/
def C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (halfDiskUpper allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
      halfDiskUpper allowanceLower s

/--
Cleared scalar payment budget for the metric half-disk induced by an odd-channel
norm upper.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
    (oddUpper allowanceLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  (1 + ‖q s‖) * (1 + 2 * oddUpper s) <
    allowanceLower s * (1 - ‖q s‖)

/-- Global middle version of the odd-metric cleared payment budget. -/
def C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
      oddUpper allowanceLower s

/--
Canonical allowance lower for the odd-metric payment route, with a positive
slack inserted after clearing the denominator.
-/
noncomputable def c2TailLowerDistortedOddMetricAllowanceLower
    (oddUpper paymentSlack : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    ((1 + ‖q s‖) * (1 + 2 * oddUpper s) + paymentSlack s) /
      (1 - ‖q s‖)

/--
Scalar budget saying that the canonical odd-metric allowance lower still fits
inside the exact vertical-anchor allowance.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
      verticalDepthTailUpper s +
    c2GenuineCentralExactUpper s +
    c2ContinuedCentralExactUpper s ≤
      c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the canonical odd-metric slack allowance budget. -/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s

/--
Fully expanded scalar version of the canonical odd-metric slack allowance
budget.  This opens the exact vertical-anchor allowance into quartet margin,
horizontal regularization, cutoff, and the off-critical resolvent factor.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
          verticalDepthTailUpper s +
          c2GenuineCentralExactUpper s +
          c2ContinuedCentralExactUpper s +
          c2RawCentralCutoffNormConstant K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s ≤
      c2ExpandedQuartetResidualMargin s

/--
Global middle version of the expanded canonical odd-metric slack allowance
budget.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s

/--
Denominator-cleared scalar version of the expanded odd-metric slack allowance
budget.  The common denominator is `(1 - ‖q s‖) ^ 3`.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (s : ℂ) : Prop :=
  (1 + ‖q s‖) *
      ((((1 + ‖q s‖) * (1 + 2 * oddUpper s) + paymentSlack s) *
          ‖q s‖ ^ 2) +
        (c2GenuineCentralExactUpper s +
            c2ContinuedCentralExactUpper s +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 - ‖q s‖) ^ 2) +
    (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s) *
      (1 - ‖q s‖) ^ 3 ≤
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 3

/-- Global middle version of the denominator-cleared expanded budget. -/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s

/--
External-upper version of the expanded odd-metric slack allowance budget.  It
separates the allowance-tail product, central, horizontal, and cutoff estimates
from the final real scalar inequality.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
    (_K _M : ℕ)
    (tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((tailAllowanceBudget s +
          genuineCentralUpper s +
          continuedCentralUpper s +
          cutoffBudget s +
          horizontalBudget s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    horizontalBudget s + cutoffBudget s ≤
      c2ExpandedQuartetResidualMargin s

/--
Global middle version of the external-upper expanded odd-metric slack allowance
budget.
-/
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
      K M tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget s

/-- Upper bound for the canonical odd-metric allowance lower. -/
def C2TailLowerDistortedOddMetricAllowanceUpperBound
    (oddUpper paymentSlack allowanceUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s ≤
    allowanceUpper s

/-- Global middle version of the canonical odd-metric allowance upper bound. -/
def C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper paymentSlack allowanceUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2TailLowerDistortedOddMetricAllowanceUpperBound
      oddUpper paymentSlack allowanceUpper s

/-- External upper bound for the C2 vertical depth-tail envelope. -/
def C2VerticalDepthTailUpperBound
    (verticalTailBudget : ℂ → ℝ) (s : ℂ) : Prop :=
  verticalDepthTailUpper s ≤ verticalTailBudget s

/-- Global middle version of the vertical depth-tail upper bound. -/
def C2VerticalDepthTailUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (verticalTailBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2VerticalDepthTailUpperBound verticalTailBudget s

/--
Scalar product budget that turns separate allowance and vertical-tail envelopes
into the tail-allowance budget used by the expanded upper route.
-/
def C2TailLowerDistortedOddMetricAllowanceTailProductBudget
    (allowanceUpper verticalTailBudget tailAllowanceBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  allowanceUpper s * verticalTailBudget s ≤ tailAllowanceBudget s

/-- Global middle version of the tail-allowance product budget. -/
def C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (allowanceUpper verticalTailBudget tailAllowanceBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2TailLowerDistortedOddMetricAllowanceTailProductBudget
      allowanceUpper verticalTailBudget tailAllowanceBudget s

/-- Direct tail-allowance product bound required by the expanded upper route. -/
def C2TailLowerDistortedOddMetricAllowanceTailProductBound
    (oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
    verticalDepthTailUpper s ≤ tailAllowanceBudget s

/-- Global middle version of the direct tail-allowance product bound. -/
def C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2TailLowerDistortedOddMetricAllowanceTailProductBound
      oddUpper paymentSlack tailAllowanceBudget s

/--
Canonical explicit upper for the odd-metric allowance lower multiplied by the
C2 vertical depth-tail upper.
-/
noncomputable def c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
    (oddUpper paymentSlack : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (((1 + ‖q s‖) * (1 + 2 * oddUpper s) + paymentSlack s) *
        ‖q s‖ ^ 2) *
      (1 - ‖q s‖)⁻¹ * (1 - ‖q s‖)⁻¹

/-- Pointwise budget for the canonical explicit tail-allowance product upper. -/
def C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget
    (oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
      oddUpper paymentSlack s ≤ tailAllowanceBudget s

/-- Global middle version of the canonical tail-allowance product budget. -/
def C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget
      oddUpper paymentSlack tailAllowanceBudget s

theorem C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle_self
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (oddUpper paymentSlack : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
      oddUpper paymentSlack
      (c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
        oddUpper paymentSlack)
      near edge := by
  intro s _hs
  exact le_rfl

/-- External upper bound for the exact normalized anchor residual factor. -/
def C2ExactGapAnchorExactFactorUpperBound
    (anchorFactorUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  c2ContinuedVerticalAnchorResidualExactFactorUpper s ≤ anchorFactorUpper s

/-- Global middle version of the exact normalized factor upper bound. -/
def C2ExactGapAnchorExactFactorUpperBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (anchorFactorUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorExactFactorUpperBound anchorFactorUpper s

/-- External lower bound for the exact gap-anchor factor allowance. -/
def C2ExactGapAnchorFactorAllowanceLowerBound
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  allowanceLower s ≤
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the allowance lower bound. -/
def C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorFactorAllowanceLowerBound
      K M horizontalConstant horizontalScale horizontalRatio allowanceLower s

/-- Positivity of an external lower bound for the exact gap-anchor allowance. -/
def C2ExactGapAnchorFactorAllowanceLowerPositive
    (allowanceLower : ℂ → ℝ) (s : ℂ) : Prop :=
  0 < allowanceLower s

/-- Global middle version of external allowance-lower positivity. -/
def C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorFactorAllowanceLowerPositive allowanceLower s

/--
Scalar numerator budget sufficient for an allowance lower bound.  It avoids
division by keeping the positive vertical-tail upper on the left.
-/
def C2ExactGapAnchorFactorAllowanceLowerScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ)
    (s : ℂ) : Prop :=
  allowanceLower s * verticalDepthTailUpper s +
      c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s ≤
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the scalar allowance-lower budget. -/
def C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorFactorAllowanceLowerScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio allowanceLower s

/--
Direct scalar budget from an external continued odd-gap upper.  This is the
compressed pointwise inequality left after the exact gap is bounded by
`gapUpper`, but before any artificial allowance-lower envelope is introduced.
-/
def C2ExactGapAnchorGapUpperScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  verticalDepthTailUpper s * gapUpper s +
      c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s <
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Global middle version of the direct gap-upper scalar budget. -/
def C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorGapUpperScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/--
Fully expanded scalar version of the direct gap-upper budget.  This opens the
anchor allowance back into quartet margin, horizontal regularization, cutoff,
and the off-critical resolvent factor.
-/
def C2ExactGapAnchorGapUpperExpandedScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((verticalDepthTailUpper s * gapUpper s +
          c2GenuineCentralExactUpper s +
          c2ContinuedCentralExactUpper s +
          c2RawCentralCutoffNormConstant K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s <
      c2ExpandedQuartetResidualMargin s

/-- Global middle version of the fully expanded direct gap-upper budget. -/
def C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorGapUpperExpandedScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/--
External-upper version of the expanded direct gap-upper budget.  It separates
the `tail * gap`, central, horizontal, and cutoff estimates from the final real
scalar inequality.
-/
def C2ExactGapAnchorGapUpperExpandedUpperBudget
    (_K _M : ℕ)
    (tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((tailGapBudget s +
          genuineCentralUpper s +
          continuedCentralUpper s +
          cutoffBudget s +
          horizontalBudget s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    horizontalBudget s + cutoffBudget s <
      c2ExpandedQuartetResidualMargin s

/-- Global middle version of the external-upper expanded gap budget. -/
def C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorGapUpperExpandedUpperBudget
      K M tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget s

/-- Exact `tail * gap` budget for the canonical exact-gap route. -/
noncomputable def c2ExactGapAnchorExactTailGapBudget : ℂ → ℝ :=
  fun s => verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s

/-- Canonical exact-gap expanded scalar budget. -/
noncomputable def C2ExactGapAnchorExactGapExpandedScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorGapUpperExpandedScalarBudget
    K M horizontalConstant horizontalScale horizontalRatio
    c2ContinuedOddExactGapUpper s

/-- Global middle version of the canonical exact-gap expanded scalar budget. -/
noncomputable def C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
    horizontalConstant horizontalScale horizontalRatio
    c2ContinuedOddExactGapUpper near edge

/--
External-upper version of the canonical exact-gap expanded budget.  The tail-gap
budget is fixed to the exact `verticalDepthTailUpper * exactGap` envelope.
-/
noncomputable def C2ExactGapAnchorExactGapExpandedUpperBudget
    (K M : ℕ)
    (genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorGapUpperExpandedUpperBudget
    K M c2ExactGapAnchorExactTailGapBudget
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s

/-- Global middle version of the canonical exact-gap external-upper budget. -/
noncomputable def C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle
    c2ExactGapAnchorExactTailGapBudget
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget near edge

/--
Self-contained pointwise exact-gap local data for the genuine middle ledger.
The analytic content is the expanded exact-gap scalar budget; the remaining
fields are the horizontal geometry needed by the quartet ledger.
-/
structure C2ExactGapAnchorExactGapExpandedLocalData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  offCritical : offCriticalStrip s
  horizontalScale_pos : 0 < horizontalScale s
  horizontalConstant_nonneg : 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : horizontalRatio s < 1
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
  exact_gap_expanded_budget :
    C2ExactGapAnchorExactGapExpandedScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio s

/-- Build the pointwise exact-gap local package from the horizontal budget. -/
theorem C2ExactGapAnchorExactGapExpandedLocalData.of_horizontalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontal :
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorExactGapExpandedLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s where
  offCritical := hoff
  horizontalScale_pos := hhorizontalScale_pos
  horizontalConstant_nonneg := hhorizontalConstant_nonneg
  horizontalRatio_nonneg := hhorizontalRatio_nonneg
  horizontalRatio_lt_one := hhorizontalRatio_lt_one
  horizontalLayer_bound := hhorizontal.layer_bound
  exact_gap_expanded_budget := hbudget

/-- Build the pointwise exact-gap package from existing expanded scale data. -/
theorem C2ExactGapAnchorExactGapExpandedLocalData.of_scaleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
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
    (hhorizontal :
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorExactGapExpandedLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactGapAnchorExactGapExpandedLocalData.of_horizontalBudget
    hoff hscale.horizontalScale_pos hscale.horizontalConstant_nonneg
    hscale.horizontalRatio_nonneg hscale.horizontalRatio_lt_one
    hhorizontal hbudget

/-- Global middle package for the canonical exact-gap expanded route. -/
structure C2ExactGapAnchorExactGapExpandedMiddleData
    {coreCutoff : ℕ → ℕ} (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
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
  exact_gap_expanded_budget :
    C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge

/- Two-sided scalar budget: external factor upper is strictly below an external
allowance lower. -/
def C2ExactGapAnchorFactorUpperLowerBudget
    (anchorFactorUpper allowanceLower : ℂ → ℝ) (s : ℂ) : Prop :=
  anchorFactorUpper s < allowanceLower s

/-- Global middle version of the two-sided factor/allowance budget. -/
def C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (anchorFactorUpper allowanceLower : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorFactorUpperLowerBudget
      anchorFactorUpper allowanceLower s

lemma norm_one_sub_two_mul_eq_two_norm_half_sub (z : ℂ) :
    ‖(1 : ℂ) - (2 : ℂ) * z‖ =
      2 * ‖(1 / 2 : ℂ) - z‖ := by
  have hrewrite :
      (1 : ℂ) - (2 : ℂ) * z =
        (2 : ℂ) * ((1 / 2 : ℂ) - z) := by
    ring
  rw [hrewrite, norm_mul]
  norm_num

/-- Pointwise conversion from a half-disk upper plus its scalar budget. -/
theorem C2ExactGapAnchorPhaseDisk_of_halfDiskBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {s : ℂ}
    (hbound : C2ContinuedOddHalfDiskBound halfDiskUpper s)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudget
        K M horizontalConstant horizontalScale horizontalRatio halfDiskUpper s) :
    C2ExactGapAnchorPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ContinuedOddHalfDiskBound
    C2ExactGapAnchorPhaseDiskBudget C2ExactGapAnchorPhaseDisk at *
  nlinarith

/-- Global middle conversion from half-disk estimates to the phase disk target. -/
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbound :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorPhaseDisk_of_halfDiskBound
    (hbound hs) (hbudget hs)

theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_exactHalfDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  unfold C2ExactGapAnchorPhaseDisk
  rw [lt_div_iff₀ (by norm_num : (0 : ℝ) < 2)]
  simpa [mul_comm] using hbudget hs

theorem C2ContinuedOddHalfDiskBound_of_oddChannelBound
    {oddUpper : ℂ → ℝ} {s : ℂ}
    (hodd : C2ContinuedOddChannelBound oddUpper s) :
    C2ContinuedOddHalfDiskBound
      (c2HalfDiskUpperFromOddUpper oddUpper) s := by
  unfold C2ContinuedOddHalfDiskBound c2HalfDiskUpperFromOddUpper
    C2ContinuedOddChannelBound at *
  have htri :
      ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ ≤
        ‖(1 / 2 : ℂ)‖ + ‖continuedOddDirichletChannel s‖ :=
    norm_sub_le (1 / 2 : ℂ) (continuedOddDirichletChannel s)
  have hhalf_norm : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by
    norm_num
  nlinarith

theorem C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hodd : C2ContinuedOddChannelBoundOnMiddle oddUpper near edge) :
    C2ContinuedOddHalfDiskBoundOnMiddle
      (c2HalfDiskUpperFromOddUpper oddUpper) near edge := by
  intro s hs
  exact C2ContinuedOddHalfDiskBound_of_oddChannelBound
    (hodd hs)

theorem C2ContinuedOddHalfDiskBoundOnMiddle_exactMetric
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedOddHalfDiskBoundOnMiddle
      (c2HalfDiskUpperFromOddUpper c2ContinuedOddExactUpper) near edge :=
  C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle
    c2ContinuedOddChannelBoundOnMiddle_exact

/-- The phase disk condition implies the normalized exact phase-saving target. -/
theorem C2ExactGapAnchorPhaseSaving_of_phaseDisk
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hdisk :
      C2ExactGapAnchorPhaseDisk
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorPhaseSaving C2ExactGapAnchorPhaseDisk at *
  have hrewrite :
      (1 : ℂ) - (2 : ℂ) * continuedOddDirichletChannel s =
        (2 : ℂ) * ((1 / 2 : ℂ) - continuedOddDirichletChannel s) := by
    ring
  rw [hrewrite, norm_mul]
  have hnorm_two : ‖(2 : ℂ)‖ = (2 : ℝ) := by
    norm_num
  rw [hnorm_two]
  nlinarith

/-- Global middle phase disk data implies global middle phase saving. -/
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hdisk :
      C2ExactGapAnchorPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorPhaseSaving_of_phaseDisk (hdisk hs)

theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_exactHalfDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
    (C2ExactGapAnchorPhaseDiskOnMiddle_of_exactHalfDiskBudgetOnMiddle
      hbudget)

theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_of_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  have hpoint := hphase hs
  unfold C2ExactGapAnchorPhaseSaving at hpoint
  rw [norm_one_sub_two_mul_eq_two_norm_half_sub] at hpoint
  exact hpoint

theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_iff_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · exact C2ExactGapAnchorPhaseSavingOnMiddle_of_exactHalfDiskBudgetOnMiddle
  · exact C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_of_phaseSavingOnMiddle

/-- Local middle wrapper from half-disk data directly to phase-saving. -/
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_halfDiskBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbound :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
    (C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
      hbound hbudget)

/-- Self-contained pointwise local data for the refined genuine odd-anchor
middle ledger. -/
structure C2GenuineOddAnchorLocalData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ)
    (s : ℂ) : Prop where
  offCritical : offCriticalStrip s
  horizontalScale_pos : 0 < horizontalScale s
  horizontalConstant_nonneg : 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : horizontalRatio s < 1
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
  odd_bound : C2ContinuedOddChannelBound oddUpper s
  genuine_bound : C2GenuineCentralBound genuineCentralUpper s
  final_budget :
    C2GenuineOddAnchorInheritedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s

theorem C2GenuineOddAnchorLocalData.of_horizontalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontal :
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hbudget :
      C2GenuineOddAnchorInheritedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper genuineCentralUpper s) :
    C2GenuineOddAnchorLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s where
  offCritical := hoff
  horizontalScale_pos := hhorizontalScale_pos
  horizontalConstant_nonneg := hhorizontalConstant_nonneg
  horizontalRatio_nonneg := hhorizontalRatio_nonneg
  horizontalRatio_lt_one := hhorizontalRatio_lt_one
  horizontalLayer_bound := hhorizontal.layer_bound
  odd_bound := hodd
  genuine_bound := hgenuine
  final_budget := hbudget

lemma c2RawCentralCutoffNormConstant_nonneg
    (K M : ℕ) (s : ℂ) :
    0 ≤ c2RawCentralCutoffNormConstant K M s := by
  unfold c2RawCentralCutoffNormConstant
  exact norm_nonneg _

theorem verticalDepthTailUpper_pos_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    0 < verticalDepthTailUpper s := by
  have hq_pos : 0 < ‖q s‖ := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    exact norm_pos_iff.mpr hq_ne
  have hq_lt : ‖q s‖ < 1 :=
    q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - ‖q s‖ := by
    linarith
  unfold verticalDepthTailUpper
  exact div_pos (by positivity) hgap_pos

theorem c2VerticalDepthTailLower_pos
    (s : ℂ) :
    0 < c2VerticalDepthTailLower s := by
  have hq_pos : 0 < ‖q s‖ := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    exact norm_pos_iff.mpr hq_ne
  have hden_pos : 0 < 1 + ‖q s‖ := by
    linarith [norm_nonneg (q s)]
  unfold c2VerticalDepthTailLower
  exact div_pos (pow_pos hq_pos 2) hden_pos

theorem c2VerticalDepthTailLower_le_norm_verticalDepthTailFromTwo_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2VerticalDepthTailLower s ≤ ‖verticalDepthTailFromTwo s‖ := by
  have htail_eq :
      verticalDepthTailFromTwo s = q s ^ 2 * verticalResolvent s := by
    simpa [q] using verticalDepthTailFromTwo_eq s hoff.1
  have htail_norm :
      ‖verticalDepthTailFromTwo s‖ =
        ‖q s‖ ^ 2 * ‖verticalResolvent s‖ := by
    rw [htail_eq, norm_mul, norm_pow]
  have hresolvent_lower :
      (1 / (1 + ‖q s‖) : ℝ) ≤ ‖verticalResolvent s‖ := by
    simpa [q] using verticalResolvent_norm_lower_bound_of_offCriticalStrip s hoff
  have hmul :=
    mul_le_mul_of_nonneg_left hresolvent_lower (sq_nonneg ‖q s‖)
  unfold c2VerticalDepthTailLower
  rw [htail_norm]
  simpa [div_eq_mul_inv, one_div, mul_assoc, mul_comm, mul_left_comm] using
    hmul

theorem verticalDepthTailFromTwo_ne_zero_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    verticalDepthTailFromTwo s ≠ 0 := by
  have htail_eq :
      verticalDepthTailFromTwo s = q s ^ 2 * verticalResolvent s := by
    simpa [q] using verticalDepthTailFromTwo_eq s hoff.1
  have hq_ne : q s ≠ 0 := by
    unfold q verticalRatio
    exact complexDirichletDepthRatio_ne_zero s
  have hres_ne : verticalResolvent s ≠ 0 := by
    have hden : 1 - verticalRatio s ≠ 0 :=
      verticalResolvent_den_ne_zero_of_re_pos s hoff.1
    unfold verticalResolvent
    exact inv_ne_zero hden
  rw [htail_eq]
  exact mul_ne_zero (pow_ne_zero 2 hq_ne) hres_ne

theorem verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    0 < ‖verticalDepthTailFromTwo s‖ :=
  norm_pos_iff.mpr (verticalDepthTailFromTwo_ne_zero_of_offCriticalStrip hoff)

theorem C2ContinuedOddHalfDiskBound_of_anchorResidualBound
    {anchorUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hanchor : C2ContinuedVerticalAnchorResidualBound anchorUpper s) :
    C2ContinuedOddHalfDiskBound
      (c2HalfDiskUpperFromAnchor anchorUpper) s := by
  unfold C2ContinuedOddHalfDiskBound c2HalfDiskUpperFromAnchor
  set d := ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖
  set T := ‖verticalDepthTailFromTwo s‖
  set L := c2VerticalDepthTailLower s
  have hd_nonneg : 0 ≤ d := by
    simp [d]
  have hL_pos : 0 < L := by
    simpa [L] using c2VerticalDepthTailLower_pos s
  have hL_le_T : L ≤ T := by
    simpa [L, T] using
      c2VerticalDepthTailLower_le_norm_verticalDepthTailFromTwo_of_offCriticalStrip
        hoff
  have hfactor :
      c2ContinuedVerticalAnchorResidual s =
        (2 : ℂ) * verticalDepthTailFromTwo s *
          ((1 / 2 : ℂ) - continuedOddDirichletChannel s) := by
    rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap]
    ring
  have hnorm :
      ‖c2ContinuedVerticalAnchorResidual s‖ = 2 * T * d := by
    rw [hfactor, norm_mul, norm_mul]
    norm_num [T, d, mul_comm, mul_left_comm]
  have hanchor_le : 2 * T * d ≤ anchorUpper s := by
    simpa [C2ContinuedVerticalAnchorResidualBound, hnorm] using hanchor
  have hscaled : 2 * L * d ≤ anchorUpper s := by
    have hleft : 2 * L * d ≤ 2 * T * d := by
      nlinarith
    exact le_trans hleft hanchor_le
  have hden_pos : 0 < 2 * L := by
    nlinarith
  rw [le_div_iff₀ hden_pos]
  nlinarith

theorem C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge) :
    C2ContinuedOddHalfDiskBoundOnMiddle
      (c2HalfDiskUpperFromAnchor anchorUpper) near edge := by
  intro s hs
  exact C2ContinuedOddHalfDiskBound_of_anchorResidualBound
    hs.1 (hanchor hs)

theorem C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2VerticalDepthTailLower s *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
  set L := c2VerticalDepthTailLower s
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hL_pos : 0 < L := by
    simpa [L] using c2VerticalDepthTailLower_pos s
  have hleft_eq :
      2 * (‖c2ContinuedVerticalAnchorResidual s‖ / (2 * L)) =
        ‖c2ContinuedVerticalAnchorResidual s‖ / L := by
    field_simp [ne_of_gt hL_pos]
  unfold C2ExactGapAnchorExactAnchorResidualBudget
    C2ExactGapAnchorPhaseDiskBudget
    c2HalfDiskUpperFromAnchor
    c2ContinuedVerticalAnchorResidualExactUpper
  change
      2 * (‖c2ContinuedVerticalAnchorResidual s‖ / (2 * L)) < A ↔
        ‖c2ContinuedVerticalAnchorResidual s‖ < L * A
  rw [hleft_eq]
  constructor
  · intro h
    rw [div_lt_iff₀ hL_pos] at h
    simpa [mul_comm] using h
  · intro h
    rw [div_lt_iff₀ hL_pos]
    simpa [mul_comm] using h

theorem C2ExactGapAnchorExactAnchorResidualBudget_of_norm_lt_lower_mul_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2VerticalDepthTailLower s *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorExactAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s)).2 hbudget

theorem c2ContinuedVerticalAnchorResidualExactLowerFactorUpper_eq_tailLowerDistortion_mul_exactOddGap
    (s : ℂ) :
    c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s =
      c2VerticalTailLowerDistortion s *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
  unfold c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
    c2VerticalTailLowerDistortion
  rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap, norm_mul]
  ring

theorem C2ExactGapAnchorExactAnchorResidualBudget_iff_exactLowerFactorUpper_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  rw [C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance]
  unfold c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
  set L := c2VerticalDepthTailLower s
  set R := ‖c2ContinuedVerticalAnchorResidual s‖
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hL_pos : 0 < L := by
    simpa [L] using c2VerticalDepthTailLower_pos s
  constructor
  · intro h
    rw [div_lt_iff₀ hL_pos]
    simpa [L, R, A, mul_comm] using h
  · intro h
    rw [div_lt_iff₀ hL_pos] at h
    simpa [L, R, A, mul_comm] using h

theorem C2ExactGapAnchorExactAnchorResidualBudget_iff_tailLowerDistortedGapBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorTailLowerDistortedGapBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  rw [C2ExactGapAnchorExactAnchorResidualBudget_iff_exactLowerFactorUpper_lt_allowance]
  unfold C2ExactGapAnchorTailLowerDistortedGapBudget
  rw [c2ContinuedVerticalAnchorResidualExactLowerFactorUpper_eq_tailLowerDistortion_mul_exactOddGap]

theorem C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle_iff_tailLowerDistortedGapBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorExactAnchorResidualBudget_iff_tailLowerDistortedGapBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorExactAnchorResidualBudget_iff_tailLowerDistortedGapBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

theorem verticalDepthTailUpper_div_c2VerticalDepthTailLower_eq_explicit
    {s : ℂ} (hoff : offCriticalStrip s) :
    verticalDepthTailUpper s / c2VerticalDepthTailLower s =
      c2VerticalTailLowerDistortionExplicitUpper s := by
  set r := ‖q s‖
  have hr_pos : 0 < r := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    simpa [r] using norm_pos_iff.mpr hq_ne
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hden_sub : 1 - r ≠ 0 := by
    linarith
  have hden_add : 1 + r ≠ 0 := by
    linarith
  have hr_sq : r ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hr_pos)
  unfold verticalDepthTailUpper c2VerticalDepthTailLower
    c2VerticalTailLowerDistortionExplicitUpper
  change (r ^ 2 / (1 - r)) / (r ^ 2 / (1 + r)) =
    (1 + r) / (1 - r)
  field_simp [hden_sub, hden_add, hr_sq]

theorem c2VerticalTailLowerDistortion_le_explicitUpper_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    c2VerticalTailLowerDistortion s ≤
      c2VerticalTailLowerDistortionExplicitUpper s := by
  unfold c2VerticalTailLowerDistortion
  have htail :
      ‖verticalDepthTailFromTwo s‖ ≤ verticalDepthTailUpper s :=
    verticalDepthTailFromTwo_norm_le_upper_of_offCriticalStrip s hoff
  have hlower_nonneg : 0 ≤ c2VerticalDepthTailLower s :=
    le_of_lt (c2VerticalDepthTailLower_pos s)
  have hdiv :
      ‖verticalDepthTailFromTwo s‖ / c2VerticalDepthTailLower s ≤
        verticalDepthTailUpper s / c2VerticalDepthTailLower s :=
    div_le_div_of_nonneg_right htail hlower_nonneg
  exact le_trans hdiv
    (le_of_eq (verticalDepthTailUpper_div_c2VerticalDepthTailLower_eq_explicit
      hoff))

theorem C2ExactGapAnchorTailLowerDistortedGapBudget_of_explicitUpperBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorTailLowerDistortedGapBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget at hbudget
  unfold C2ExactGapAnchorTailLowerDistortedGapBudget
  have hdistortion :
      c2VerticalTailLowerDistortion s ≤
        c2VerticalTailLowerDistortionExplicitUpper s :=
    c2VerticalTailLowerDistortion_le_explicitUpper_of_offCriticalStrip hoff
  have hgap_nonneg :
      0 ≤ ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ :=
    norm_nonneg _
  exact lt_of_le_of_lt
    (mul_le_mul_of_nonneg_right hdistortion hgap_nonneg)
    hbudget

theorem C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle_of_explicitUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorTailLowerDistortedGapBudget_of_explicitUpperBudget
    hs.1 (hbudget hs)

theorem c2VerticalTailLowerDistortionExplicitUpper_pos_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    0 < c2VerticalTailLowerDistortionExplicitUpper s := by
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hnum_pos : 0 < 1 + r := by
    linarith
  have hden_pos : 0 < 1 - r := by
    linarith
  unfold c2VerticalTailLowerDistortionExplicitUpper
  exact div_pos hnum_pos hden_pos

theorem one_le_c2VerticalTailLowerDistortionExplicitUpper_of_offCriticalStrip
    {s : ℂ} (hoff : offCriticalStrip s) :
    1 ≤ c2VerticalTailLowerDistortionExplicitUpper s := by
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hden_pos : 0 < 1 - r := by
    linarith
  unfold c2VerticalTailLowerDistortionExplicitUpper
  rw [le_div_iff₀ hden_pos]
  nlinarith

theorem C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorTailLowerDistortedPhaseDisk
        K M horizontalConstant horizontalScale horizontalRatio s := by
  set D := c2VerticalTailLowerDistortionExplicitUpper s
  set d := ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hD_pos : 0 < D := by
    simpa [D] using
      c2VerticalTailLowerDistortionExplicitUpper_pos_of_offCriticalStrip
        hoff
  have htwoD_pos : 0 < 2 * D := by
    nlinarith
  have hgap_eq :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ = 2 * d := by
    have hrewrite :
        (1 : ℂ) - (2 : ℂ) * continuedOddDirichletChannel s =
          (2 : ℂ) * ((1 / 2 : ℂ) - continuedOddDirichletChannel s) := by
      ring
    rw [hrewrite, norm_mul]
    have hnorm_two : ‖(2 : ℂ)‖ = (2 : ℝ) := by
      norm_num
    rw [hnorm_two]
  constructor
  · intro hbudget
    unfold C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget at hbudget
    unfold C2ExactGapAnchorTailLowerDistortedPhaseDisk
    rw [lt_div_iff₀ htwoD_pos]
    have hmain : D * (2 * d) < A := by
      simpa [D, d, A, hgap_eq] using hbudget
    simpa [D, d, A, mul_assoc, mul_comm, mul_left_comm] using hmain
  · intro hdisk
    unfold C2ExactGapAnchorTailLowerDistortedPhaseDisk at hdisk
    unfold C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
    rw [lt_div_iff₀ htwoD_pos] at hdisk
    rw [hgap_eq]
    have hmain : d * (2 * D) < A := by
      simpa [D, d, A, mul_assoc, mul_comm, mul_left_comm] using hdisk
    simpa [D, d, A, mul_assoc, mul_comm, mul_left_comm] using hmain

theorem C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle_iff_phaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hdisk s hs
    exact
      (C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hdisk hs)

theorem C2ExactGapAnchorTailLowerDistortedPhaseDisk_of_halfDiskBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhalf : C2ContinuedOddHalfDiskBound halfDiskUpper s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
        K M horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper s) :
    C2ExactGapAnchorTailLowerDistortedPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ContinuedOddHalfDiskBound at hhalf
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget at hbudget
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDisk
  set D := c2VerticalTailLowerDistortionExplicitUpper s
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hD_pos : 0 < D := by
    simpa [D] using
      c2VerticalTailLowerDistortionExplicitUpper_pos_of_offCriticalStrip
        hoff
  have htwoD_pos : 0 < 2 * D := by
    nlinarith
  have hupper_lt :
      halfDiskUpper s < A / (2 * D) := by
    rw [lt_div_iff₀ htwoD_pos]
    simpa [D, A, mul_assoc, mul_comm, mul_left_comm] using hbudget
  exact lt_of_le_of_lt hhalf hupper_lt

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorTailLowerDistortedPhaseDisk_of_halfDiskBound
    hs.1 (hhalf hs) (hbudget hs)

theorem C2ExactGapAnchorPhaseDisk_of_tailLowerDistortedPhaseDisk
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hdist :
      C2ExactGapAnchorTailLowerDistortedPhaseDisk
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDisk
    C2ExactGapAnchorPhaseDisk at *
  set D := c2VerticalTailLowerDistortionExplicitUpper s
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hD_pos : 0 < D := by
    simpa [D] using
      c2VerticalTailLowerDistortionExplicitUpper_pos_of_offCriticalStrip
        hoff
  have hD_ge_one : 1 ≤ D := by
    simpa [D] using
      one_le_c2VerticalTailLowerDistortionExplicitUpper_of_offCriticalStrip
        hoff
  have htwoD_pos : 0 < 2 * D := by
    nlinarith
  have hA_pos : 0 < A := by
    have hquot_pos : 0 < A / (2 * D) :=
      lt_of_le_of_lt (norm_nonneg _) hdist
    rw [div_pos_iff_of_pos_right htwoD_pos] at hquot_pos
    exact hquot_pos
  have hdistorted_le_phase : A / (2 * D) ≤ A / 2 := by
    exact div_le_div_of_nonneg_left
      (le_of_lt hA_pos)
      (by norm_num : 0 < (2 : ℝ))
      (by nlinarith : (2 : ℝ) ≤ 2 * D)
  exact lt_of_lt_of_le hdist hdistorted_le_phase

theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hdist :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorPhaseDisk_of_tailLowerDistortedPhaseDisk
    hs.1 (hdist hs)

theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hdist :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
    (C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
      hdist)

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget_of_upperLowerBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBound
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
        halfDiskUpper allowanceLower s) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
      K M horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper s := by
  unfold C2ExactGapAnchorFactorAllowanceLowerBound at hallow
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
    c2TailLowerDistortedHalfDiskPaymentUpper at hbudget
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
  exact lt_of_lt_of_le hbudget hallow

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_upperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
        halfDiskUpper allowanceLower near edge) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper near edge := by
  intro s hs
  exact C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget_of_upperLowerBudget
    (hallow hs) (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget_of_metricPaymentClearedBudget
    {halfDiskUpper allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
        halfDiskUpper allowanceLower s) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
      halfDiskUpper allowanceLower s := by
  unfold C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget at hbudget
  unfold C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
    c2TailLowerDistortedHalfDiskPaymentUpper
    c2VerticalTailLowerDistortionExplicitUpper
  set r := ‖q s‖
  set H := halfDiskUpper s
  set A := allowanceLower s
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hden_pos : 0 < 1 - r := by
    linarith
  have hpay_eq :
      2 * ((1 + r) / (1 - r)) * H =
        (2 * (1 + r) * H) / (1 - r) := by
    field_simp [ne_of_gt hden_pos]
  have hcleared : 2 * (1 + r) * H < A * (1 - r) := by
    simpa [r, H, A] using hbudget
  rw [hpay_eq]
  rw [div_lt_iff₀ hden_pos]
  simpa [A, mul_assoc, mul_comm, mul_left_comm] using hcleared

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_metricPaymentClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {halfDiskUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle
        halfDiskUpper allowanceLower near edge) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
      halfDiskUpper allowanceLower near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget_of_metricPaymentClearedBudget
      hs.1 (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget_of_oddMetricPaymentClearedBudget
    {oddUpper allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
        oddUpper allowanceLower s) :
    C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
      (c2HalfDiskUpperFromOddUpper oddUpper) allowanceLower s := by
  unfold C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget at hbudget
  unfold C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
    c2HalfDiskUpperFromOddUpper
  have hrewrite :
      2 * (1 + ‖q s‖) * ((1 / 2 : ℝ) + oddUpper s) =
        (1 + ‖q s‖) * (1 + 2 * oddUpper s) := by
    ring
  rw [hrewrite]
  exact hbudget

theorem C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
        oddUpper allowanceLower near edge) :
    C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle
      (c2HalfDiskUpperFromOddUpper oddUpper) allowanceLower near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget_of_oddMetricPaymentClearedBudget
      (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
        oddUpper allowanceLower near edge) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
      (c2HalfDiskUpperFromOddUpper oddUpper) allowanceLower near edge :=
  C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_metricPaymentClearedBudgetOnMiddle
    (C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
      hbudget)

theorem C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget_of_slackAllowanceLower
    {oddUpper paymentSlack : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hslack_pos : 0 < paymentSlack s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
      oddUpper
      (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
      s := by
  unfold C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
    c2TailLowerDistortedOddMetricAllowanceLower
  set r := ‖q s‖
  set P := (1 + r) * (1 + 2 * oddUpper s)
  set eps := paymentSlack s
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hden_pos : 0 < 1 - r := by
    linarith
  have hmul_eq :
      ((P + eps) / (1 - r)) * (1 - r) = P + eps := by
    field_simp [ne_of_gt hden_pos]
  have heps_pos : 0 < eps := by
    simpa [eps] using hslack_pos
  change P < ((P + eps) / (1 - r)) * (1 - r)
  rw [hmul_eq]
  linarith

theorem C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle_of_slackAllowanceLower
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
      oddUpper
      (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
      near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget_of_slackAllowanceLower
      hs.1 (hslack_pos hs)

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_anchorResidualBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {s : ℂ}
    (hanchor : C2ContinuedVerticalAnchorResidualBound anchorUpper s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualUpperBudget
        K M horizontalConstant horizontalScale horizontalRatio
        anchorUpper s) :
    C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ContinuedVerticalAnchorResidualBound
    C2ExactGapAnchorTailNormAnchorResidualUpperBudget
    C2ExactGapAnchorTailNormAnchorResidualBudget at *
  exact lt_of_le_of_lt hanchor hbudget

theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_anchorResidualBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailNormAnchorResidualBudget_of_anchorResidualBound
      (hanchor hs) (hbudget hs)

theorem C2ExactGapAnchorTailNormAnchorResidualUpperBudget_of_factorBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper anchorFactorUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hupper :
      anchorUpper s ≤
        ‖verticalDepthTailFromTwo s‖ * anchorFactorUpper s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        anchorFactorUpper s) :
    C2ExactGapAnchorTailNormAnchorResidualUpperBudget
      K M horizontalConstant horizontalScale horizontalRatio
      anchorUpper s := by
  unfold C2ExactGapAnchorTailNormAnchorResidualFactorBudget
    C2ExactGapAnchorTailNormAnchorResidualUpperBudget at *
  have htail_pos : 0 < ‖verticalDepthTailFromTwo s‖ :=
    verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  exact lt_of_le_of_lt hupper
    (mul_lt_mul_of_pos_left hbudget htail_pos)

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorBound
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hfactor :
      C2ContinuedVerticalAnchorResidualFactorBound anchorFactorUpper s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        anchorFactorUpper s) :
    C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ContinuedVerticalAnchorResidualFactorBound at hfactor
  unfold C2ExactGapAnchorTailNormAnchorResidualFactorBudget at hbudget
  unfold C2ExactGapAnchorTailNormAnchorResidualBudget
  have htail_pos : 0 < ‖verticalDepthTailFromTwo s‖ :=
    verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  exact lt_of_le_of_lt hfactor
    (mul_lt_mul_of_pos_left hbudget htail_pos)

theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_factorBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hfactor :
      C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle
        anchorFactorUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        anchorFactorUpper near edge) :
    C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorBound
      hs.1 (hfactor hs) (hbudget hs)

theorem C2ContinuedVerticalAnchorResidualFactorBound_exact
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ContinuedVerticalAnchorResidualFactorBound
      c2ContinuedVerticalAnchorResidualExactFactorUpper s := by
  unfold C2ContinuedVerticalAnchorResidualFactorBound
    c2ContinuedVerticalAnchorResidualExactFactorUpper
  have htail_pos : 0 < ‖verticalDepthTailFromTwo s‖ :=
    verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  field_simp [ne_of_gt htail_pos]
  exact le_rfl

theorem C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge := by
  intro s hs
  exact C2ContinuedVerticalAnchorResidualFactorBound_exact hs.1

theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_exactOddGap
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    c2ContinuedVerticalAnchorResidualExactFactorUpper s =
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ := by
  unfold c2ContinuedVerticalAnchorResidualExactFactorUpper
  rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap, norm_mul]
  have htail_pos : 0 < ‖verticalDepthTailFromTwo s‖ :=
    verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  field_simp [ne_of_gt htail_pos]

theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_two_norm_half_sub
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    c2ContinuedVerticalAnchorResidualExactFactorUpper s =
      2 * ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ := by
  rw [c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_exactOddGap hoff]
  exact norm_one_sub_two_mul_eq_two_norm_half_sub
    (continuedOddDirichletChannel s)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_pointwise
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper s ↔
      c2ContinuedVerticalAnchorResidualExactFactorUpper s <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  rfl

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_pointwise
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper near edge ↔
      ∀ ⦃s : ℂ⦄,
        s ∈ c2ExpandedScalarMiddleRegion near edge →
        c2ContinuedVerticalAnchorResidualExactFactorUpper s <
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
  rfl

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper s ↔
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailNormAnchorResidualFactorBudget
    C2ExactGapAnchorTailNormAnchorResidualBudget
    c2ContinuedVerticalAnchorResidualExactFactorUpper
  have htail_pos : 0 < ‖verticalDepthTailFromTwo s‖ :=
    verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  rw [div_lt_iff₀ htail_pos]
  rw [mul_comm]

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper near edge ↔
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbudget hs)

theorem C2ExactGapAnchorExactFactorUpperBound_exact
    (s : ℂ) :
    C2ExactGapAnchorExactFactorUpperBound
      c2ContinuedVerticalAnchorResidualExactFactorUpper s := by
  unfold C2ExactGapAnchorExactFactorUpperBound
  exact le_rfl

theorem C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorExactFactorUpperBoundOnMiddle
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge := by
  intro s _hs
  exact C2ExactGapAnchorExactFactorUpperBound_exact s

theorem C2ExactGapAnchorExactFactorUpperBound_of_gapBound
    {gapUpper : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap : C2ContinuedOddGapBound gapUpper s) :
    C2ExactGapAnchorExactFactorUpperBound gapUpper s := by
  unfold C2ExactGapAnchorExactFactorUpperBound
  rw [c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_exactOddGap hoff]
  exact hgap

theorem C2ExactGapAnchorExactFactorUpperBoundOnMiddle_of_gapBoundOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgap : C2ContinuedOddGapBoundOnMiddle gapUpper near edge) :
    C2ExactGapAnchorExactFactorUpperBoundOnMiddle
      gapUpper near edge := by
  intro s hs
  exact C2ExactGapAnchorExactFactorUpperBound_of_gapBound
    hs.1 (hgap hs)

theorem C2ExactGapAnchorFactorAllowanceLowerBound_exact
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (s : ℂ) :
    C2ExactGapAnchorFactorAllowanceLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio) s := by
  unfold C2ExactGapAnchorFactorAllowanceLowerBound
  exact le_rfl

theorem C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio)
      near edge := by
  intro s _hs
  exact
    C2ExactGapAnchorFactorAllowanceLowerBound_exact
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio) s

theorem C2ExactGapAnchorFactorAllowanceLowerBound_of_scalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower s) :
    C2ExactGapAnchorFactorAllowanceLowerBound
      K M horizontalConstant horizontalScale horizontalRatio
      allowanceLower s := by
  unfold C2ExactGapAnchorFactorAllowanceLowerScalarBudget at hbudget
  unfold C2ExactGapAnchorFactorAllowanceLowerBound
    c2ExactGapAnchorFactorAllowance
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  rw [le_div_iff₀ htail_pos]
  linarith

theorem C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge) :
    C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      allowanceLower near edge := by
  intro s hs
  exact
    C2ExactGapAnchorFactorAllowanceLowerBound_of_scalarBudget
      hs.1 (hbudget hs)

theorem c2ExactGapAnchorFactorAllowance_pos_of_allowanceLowerPositive
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBound
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower s)
    (hpos :
      C2ExactGapAnchorFactorAllowanceLowerPositive allowanceLower s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorFactorAllowanceLowerBound at hallow
  unfold C2ExactGapAnchorFactorAllowanceLowerPositive at hpos
  exact lt_of_lt_of_le hpos hallow

theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_allowanceLowerPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hpos :
      C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle
        allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  intro s hs
  exact c2ExactGapAnchorFactorAllowance_pos_of_allowanceLowerPositive
    (hallow hs) (hpos hs)

theorem C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
      near edge := by
  intro s hs
  simpa [C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget,
    C2ExactGapAnchorFactorAllowanceLowerScalarBudget] using
    hbudget hs

theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
        halfDiskUpper allowanceLower near edge) :
    C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper near edge :=
  C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_upperLowerBudgetOnMiddle
    (C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle
      hallow)
    hbudget

theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle
        (c2HalfDiskUpperFromOddUpper oddUpper) near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hallow :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  have hallow_scalar :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
        near edge :=
    C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
      hallow
  have hpayment :
      C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
        oddUpper
        (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
        near edge :=
    C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle_of_slackAllowanceLower
      hslack_pos
  have hupper_lower :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
        (c2HalfDiskUpperFromOddUpper oddUpper)
        (c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack)
        near edge :=
    C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
      hpayment
  have hdist_budget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2HalfDiskUpperFromOddUpper oddUpper) near edge :=
    C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
      hallow_scalar hupper_lower
  exact
    C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
      (C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
        hhalf hdist_budget)

theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
    (C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle hodd)
    hslack_pos hbudget

theorem C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap : C2ContinuedOddGapBound gapUpper s)
    (hbudget :
      C2ExactGapAnchorGapUpperScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper s) :
    C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2GenuineExactGapAnchorFinalBudget_of_explicit
  unfold C2ExactGapAnchorGapUpperScalarBudget at hbudget
  unfold C2ContinuedOddGapBound at hgap
  unfold c2GenuineCentralExactUpper c2ContinuedCentralExactUpper at hbudget
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    verticalDepthTailUpper_nonneg_of_re_pos s hoff.1
  have hmul :
      verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ ≤
        verticalDepthTailUpper s * gapUpper s := by
    exact mul_le_mul_of_nonneg_left hgap htail_nonneg
  nlinarith

theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_of_gapUpperScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgap : C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  intro s hs
  exact
    C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget
      hs.1 (hgap hs) (hbudget hs)

theorem C2ExactGapAnchorGapUpperScalarBudget_of_allowanceLowerScalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower s)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudget
        gapUpper allowanceLower s) :
    C2ExactGapAnchorGapUpperScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio
      gapUpper s := by
  unfold C2ExactGapAnchorFactorAllowanceLowerScalarBudget at hallow
  unfold C2ExactGapAnchorFactorUpperLowerBudget at hbudget
  unfold C2ExactGapAnchorGapUpperScalarBudget
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  have hmul_lt :
      verticalDepthTailUpper s * gapUpper s <
        verticalDepthTailUpper s * allowanceLower s := by
    exact mul_lt_mul_of_pos_left hbudget htail_pos
  nlinarith

theorem C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        gapUpper allowanceLower near edge) :
    C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      gapUpper near edge := by
  intro s hs
  exact
    C2ExactGapAnchorGapUpperScalarBudget_of_allowanceLowerScalarBudget
      hs.1 (hallow hs) (hbudget hs)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_of_upperLowerBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper allowanceLower : ℂ → ℝ}
    {s : ℂ}
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBound anchorFactorUpper s)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBound
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower s)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudget
        anchorFactorUpper allowanceLower s) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper s := by
  unfold C2ExactGapAnchorExactFactorUpperBound
    C2ExactGapAnchorFactorAllowanceLowerBound
    C2ExactGapAnchorFactorUpperLowerBudget
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget at *
  exact lt_of_le_of_lt hfactor (lt_of_lt_of_le hbudget hallow)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBoundOnMiddle
        anchorFactorUpper near edge)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        anchorFactorUpper allowanceLower near edge) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_of_upperLowerBudget
      (hfactor hs) (hallow hs) (hbudget hs)

theorem C2ExactGapAnchorTailNormAnchorResidualUpperBudget_exact_iff_tailNormAnchorResidualBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorTailNormAnchorResidualUpperBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactUpper s ↔
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailNormAnchorResidualUpperBudget
    C2ExactGapAnchorTailNormAnchorResidualBudget
    c2ContinuedVerticalAnchorResidualExactUpper
  rfl

theorem C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactUpper near edge ↔
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailNormAnchorResidualUpperBudget_exact_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailNormAnchorResidualUpperBudget_exact_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).2 (hbudget hs)

theorem C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailNormAnchorResidualBudget at hbudget
  unfold C2ExactGapAnchorPhaseSaving
  set T := ‖verticalDepthTailFromTwo s‖
  set G := ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖
  set A :=
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
  have hT_pos : 0 < T := by
    simpa [T] using verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff
  have hnorm :
      ‖c2ContinuedVerticalAnchorResidual s‖ = T * G := by
    rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap, norm_mul]
  have hmul : T * G < T * A := by
    simpa [T, G, A, hnorm] using hbudget
  have hgap : G < A := by
    nlinarith
  simpa [G, A]

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hphase :
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorTailNormAnchorResidualBudget
  unfold C2ExactGapAnchorPhaseSaving at hphase
  rw [c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap, norm_mul]
  exact
    mul_lt_mul_of_pos_left hphase
      (verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip hoff)

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_iff_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · exact C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget hoff
  · exact C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving hoff

theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_tailNormAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
    hs.1 (hbudget hs)

theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving
    hs.1 (hphase hs)

theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_iff_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · exact C2ExactGapAnchorPhaseSavingOnMiddle_of_tailNormAnchorResidualBudgetOnMiddle
  · exact C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_phaseSavingOnMiddle

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper s ↔
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).trans
    (C2ExactGapAnchorTailNormAnchorResidualBudget_iff_phaseSaving
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper near edge ↔
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge :=
  (C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle
    (K := K)
    (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near)
    (edge := edge)).trans
    (C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_iff_phaseSavingOnMiddle
      (K := K)
      (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge))

theorem C2GenuineExactGapAnchorFinalBudget_iff_exactOddGap_lt_factorAllowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  constructor
  · intro hbudget
    have hbudget' :=
      (C2GenuineExactGapAnchorFinalBudget_iff_explicit
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 hbudget
    unfold c2ExactGapAnchorFactorAllowance
    rw [lt_div_iff₀ htail_pos]
    unfold c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
    nlinarith
  · intro hgap
    apply C2GenuineExactGapAnchorFinalBudget_of_explicit
    unfold c2ExactGapAnchorFactorAllowance at hgap
    rw [lt_div_iff₀ htail_pos] at hgap
    unfold c2GenuineCentralExactUpper c2ContinuedCentralExactUpper at hgap
    nlinarith

theorem C2GenuineExactGapAnchorFinalBudget_of_exactOddGap_lt_factorAllowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2GenuineExactGapAnchorFinalBudget_iff_exactOddGap_lt_factorAllowance
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).2 hgap

theorem C2GenuineExactGapAnchorFinalBudget_of_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hphase :
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2GenuineExactGapAnchorFinalBudget_of_exactOddGap_lt_factorAllowance
    hoff
  simpa [C2ExactGapAnchorPhaseSaving] using hphase

theorem C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s := by
  simpa [C2ExactGapAnchorPhaseSaving] using
    C2GenuineExactGapAnchorFinalBudget_iff_exactOddGap_lt_factorAllowance
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff

theorem C2ExactGapAnchorPhaseSaving_of_exactGapAnchorFinalBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).1 hbudget

theorem C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hbudget
    exact
      C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving
        hoff
        ((C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
          (K := K) (M := M)
          (horizontalConstant := horizontalConstant)
          (horizontalScale := horizontalScale)
          (horizontalRatio := horizontalRatio)
          (s := s) hoff).1 hbudget)
  · intro hbudget
    exact
      C2GenuineExactGapAnchorFinalBudget_of_phaseSaving
        hoff
        (C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
          hoff hbudget)

theorem C2GenuineExactGapAnchorFinalBudget_of_tailNormAnchorResidualBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).2 hbudget

theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    (∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) ↔
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      C2ExactGapAnchorPhaseSaving_of_exactGapAnchorFinalBudget
        hs.1 (hbudget hs)
  · intro hphase s hs
    exact
      C2GenuineExactGapAnchorFinalBudget_of_phaseSaving
        hs.1 (hphase hs)

theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    (∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) ↔
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbudget hs)

theorem C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualFactorBudget_exact
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorTailNormAnchorResidualFactorBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper s :=
  (C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).trans
    (C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_phaseSaving
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff).symm

theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualFactorBudgetOnMiddle_exact
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    (∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) ↔
      C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualFactorBudget_exact
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hbudget s hs
    exact
      (C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualFactorBudget_exact
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbudget hs)

theorem C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hphase :
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hnorm_nonneg :
      0 ≤ ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ :=
    norm_nonneg _
  have hlt :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
    simpa [C2ExactGapAnchorPhaseSaving] using hphase
  exact lt_of_le_of_lt hnorm_nonneg hlt

theorem not_C2ExactGapAnchorPhaseSaving_of_factorAllowance_nonpos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hallow :
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s ≤ 0) :
    ¬ C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s := by
  intro hphase
  have hpos :
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s :=
    C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos hphase
  linarith

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_forces_factorAllowance_pos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos
    (C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
      hoff hbudget)

theorem not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorAllowance_nonpos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hallow :
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s ≤ 0) :
    ¬ C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  intro hbudget
  exact
    not_C2ExactGapAnchorPhaseSaving_of_factorAllowance_nonpos hallow
      (C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
        hoff hbudget)

theorem C2GenuineExactGapAnchorFinalBudget_forces_factorAllowance_pos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos
    (C2ExactGapAnchorPhaseSaving_of_exactGapAnchorFinalBudget
      hoff hbudget)

theorem c2ExactGapAnchorFactorAllowance_pos_iff_positiveAllowanceBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorPositiveAllowanceBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  unfold c2ExactGapAnchorFactorAllowance
    C2ExactGapAnchorPositiveAllowanceBudget
    c2ExactVerticalAnchorResidualNormAllowance
  constructor
  · intro hallow
    rw [div_pos_iff_of_pos_right htail_pos] at hallow
    linarith
  · intro hbudget
    rw [div_pos_iff_of_pos_right htail_pos]
    linarith

theorem c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (c2ExactGapAnchorFactorAllowance_pos_iff_positiveAllowanceBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).2 hbudget

theorem C2ExactGapAnchorPositiveAllowanceBudget_of_factorAllowance_pos
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hallow :
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorPositiveAllowanceBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (c2ExactGapAnchorFactorAllowance_pos_iff_positiveAllowanceBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).1 hallow

theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  intro s hs
  exact c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceBudget
    hs.1 (hbudget hs)

theorem C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_allowanceLowerPositiveOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hpos :
      C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle
        allowanceLower near edge) :
    C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorPositiveAllowanceBudget_of_factorAllowance_pos
      hs.1
      (c2ExactGapAnchorFactorAllowance_pos_of_allowanceLowerPositive
        (hallow hs) (hpos hs))

theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_nonneg
    (s : ℂ) :
    0 ≤ c2ContinuedVerticalAnchorResidualExactFactorUpper s := by
  unfold c2ContinuedVerticalAnchorResidualExactFactorUpper
  exact div_nonneg (norm_nonneg _) (norm_nonneg _)

theorem C2ExactGapAnchorFactorUpperLowerBudget_exact_iff
    {allowanceLower : ℂ → ℝ} {s : ℂ} :
    C2ExactGapAnchorFactorUpperLowerBudget
        c2ContinuedVerticalAnchorResidualExactFactorUpper allowanceLower s ↔
      c2ContinuedVerticalAnchorResidualExactFactorUpper s <
        allowanceLower s := by
  rfl

theorem C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_exact_iff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge ↔
      ∀ ⦃s : ℂ⦄,
        s ∈ c2ExpandedScalarMiddleRegion near edge →
        c2ContinuedVerticalAnchorResidualExactFactorUpper s <
          allowanceLower s := by
  rfl

theorem C2ExactGapAnchorFactorAllowanceLowerPositive_of_exactFactorUpperLowerBudget
    {allowanceLower : ℂ → ℝ} {s : ℂ}
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudget
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower s) :
    C2ExactGapAnchorFactorAllowanceLowerPositive allowanceLower s := by
  unfold C2ExactGapAnchorFactorUpperLowerBudget at hbudget
  unfold C2ExactGapAnchorFactorAllowanceLowerPositive
  exact lt_of_le_of_lt
    (c2ContinuedVerticalAnchorResidualExactFactorUpper_nonneg s)
    hbudget

theorem C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge) :
    C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle
      allowanceLower near edge := by
  intro s hs
  exact
    C2ExactGapAnchorFactorAllowanceLowerPositive_of_exactFactorUpperLowerBudget
      (hbudget hs)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactFactorUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge :=
  C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
    C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exact hallow hbudget

theorem C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        c2ContinuedVerticalAnchorResidualExactFactorUpper
        allowanceLower near edge) :
    C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_allowanceLowerPositiveOnMiddle
    hallow
    (C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle
      hbudget)

theorem c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1) :
    c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s <
      verticalDepthTailUpper s := by
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set C := c2RawCentralCutoffNormConstant K M s
  set Q := c2ExpandedQuartetResidualMargin s
  set r := ‖q s‖
  set a := (1 - r) * (1 + r)⁻¹
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - r := by
    linarith
  have hsum_pos : 0 < 1 + r := by
    linarith
  have ha_pos : 0 < a := by
    exact mul_pos hgap_pos (inv_pos.mpr hsum_pos)
  have hH_nonneg : 0 ≤ H := by
    simpa [H] using
      c2HorizontalRegularizedUpper_nonneg_of_pos
        hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_lt_one
  have hC_nonneg : 0 ≤ C := by
    simpa [C] using c2RawCentralCutoffNormConstant_nonneg K M s
  have hr_pos : 0 < r := by
    have hq_ne : q s ≠ 0 := by
      unfold q verticalRatio
      exact complexDirichletDepthRatio_ne_zero s
    simpa [r] using norm_pos_iff.mpr hq_ne
  have htwo_minus_pos : 0 < 2 - r := by
    linarith
  have hpoly_decomp :
      2 - 2 * r + 2 * r ^ 2 - r ^ 3 =
        2 * (1 - r) + r ^ 2 * (2 - r) := by
    ring
  have hpoly_pos :
      0 < 2 - 2 * r + 2 * r ^ 2 - r ^ 3 := by
    rw [hpoly_decomp]
    exact add_pos_of_pos_of_nonneg
      (mul_pos (by norm_num : (0 : ℝ) < 2) hgap_pos)
      (mul_nonneg (sq_nonneg _) (le_of_lt htwo_minus_pos))
  have hQ_scaled :
      Q * a < verticalDepthTailUpper s := by
    have hmain :
        verticalDepthTailUpper s - Q * a =
          2 * r ^ 3 *
            (2 - 2 * r + 2 * r ^ 2 - r ^ 3) *
            ((1 - r)⁻¹ * (1 + r)⁻¹) := by
      simp [Q, r, a, verticalDepthTailUpper,
        c2ExpandedQuartetResidualMargin, c2ExpandedQuartetK2Margin,
        c2QuartetBulkK2Lower, c2QuartetVerticalTailUpper]
      field_simp [ne_of_gt hgap_pos, ne_of_gt hsum_pos]
      ring
    have hinv_prod_pos :
        0 < (1 - r)⁻¹ * (1 + r)⁻¹ :=
      mul_pos (inv_pos.mpr hgap_pos) (inv_pos.mpr hsum_pos)
    have hcube_pos : 0 < r ^ 3 := by
      positivity
    have hprod_pos :
        0 < 2 * r ^ 3 *
            (2 - 2 * r + 2 * r ^ 2 - r ^ 3) *
            ((1 - r)⁻¹ * (1 + r)⁻¹) := by
      exact mul_pos
        (mul_pos
          (mul_pos (by norm_num : (0 : ℝ) < 2) hcube_pos)
          hpoly_pos)
        hinv_prod_pos
    have hdiff_pos :
        0 < verticalDepthTailUpper s - Q * a := by
      simpa [hmain] using hprod_pos
    linarith
  unfold c2ExactVerticalAnchorResidualNormAllowance
    c2ExactVerticalResidualNormAllowance
  change (Q - H - C) * a - H - C < verticalDepthTailUpper s
  nlinarith [hQ_scaled, hH_nonneg, hC_nonneg, ha_pos]

theorem c2ExactGapAnchorFactorAllowance_lt_one_of_offCritical
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1) :
    c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s < 1 := by
  have hallow_lt :
      c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s <
        verticalDepthTailUpper s :=
    c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  have hgenuine_nonneg : 0 ≤ c2GenuineCentralExactUpper s := by
    unfold c2GenuineCentralExactUpper
    exact norm_nonneg _
  have hcontinued_nonneg : 0 ≤ c2ContinuedCentralExactUpper s := by
    unfold c2ContinuedCentralExactUpper
    exact norm_nonneg _
  unfold c2ExactGapAnchorFactorAllowance
  rw [div_lt_iff₀ htail_pos]
  nlinarith

theorem C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hphase :
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 := by
  have hallow :
      c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s < 1 :=
    c2ExactGapAnchorFactorAllowance_lt_one_of_offCritical
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  exact lt_trans (by simpa [C2ExactGapAnchorPhaseSaving] using hphase) hallow

theorem C2ExactGapAnchorTailNormAnchorResidualBudget_forces_exactOddGap_lt_one
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 := by
  exact
    C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
      (C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
        hoff hbudget)

theorem not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_one_le_exactOddGap
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hgap :
      1 ≤ ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) :
    ¬ C2ExactGapAnchorTailNormAnchorResidualBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  intro hbudget
  have hlt :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 :=
    C2ExactGapAnchorTailNormAnchorResidualBudget_forces_exactOddGap_lt_one
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one hbudget
  linarith

theorem C2ExactGapAnchorPhaseDisk_forces_exactOddGap_lt_one
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hdisk :
      C2ExactGapAnchorPhaseDisk
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 := by
  exact
    C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
      (C2ExactGapAnchorPhaseSaving_of_phaseDisk hdisk)

theorem C2GenuineExactGapAnchorFinalBudget_forces_tail_gap_saving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hbudget :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s +
        c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s <
      verticalDepthTailUpper s := by
  have hallow_lt :
      c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s <
        verticalDepthTailUpper s :=
    c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have hleft_allow :
      verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s +
          c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
    simpa [C2GenuineExactGapAnchorFinalBudget_iff_explicit,
      c2ContinuedOddExactGapUpper, c2GenuineCentralExactUpper,
      c2ContinuedCentralExactUpper] using
        (C2GenuineExactGapAnchorFinalBudget_iff_explicit
          (K := K) (M := M)
          (horizontalConstant := horizontalConstant)
          (horizontalScale := horizontalScale)
          (horizontalRatio := horizontalRatio)
          (s := s)).1 hbudget
  exact lt_trans hleft_allow hallow_lt

theorem C2GenuineExactGapAnchorFinalBudget_forces_exactOddGap_lt_one
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hbudget :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 := by
  have hsaving :=
    C2GenuineExactGapAnchorFinalBudget_forces_tail_gap_saving
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one hbudget
  have hgenuine_nonneg : 0 ≤ c2GenuineCentralExactUpper s := by
    unfold c2GenuineCentralExactUpper
    exact norm_nonneg _
  have hcontinued_nonneg : 0 ≤ c2ContinuedCentralExactUpper s := by
    unfold c2ContinuedCentralExactUpper
    exact norm_nonneg _
  have hgap_tail_lt :
      verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s <
        verticalDepthTailUpper s := by
    linarith
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  have hgap_lt :
      c2ContinuedOddExactGapUpper s < 1 := by
    nlinarith [hgap_tail_lt, htail_pos]
  simpa [c2ContinuedOddExactGapUpper] using hgap_lt

theorem not_C2GenuineExactGapAnchorFinalBudget_of_one_le_exactOddGap
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hgap :
      1 ≤ ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) :
    ¬ C2GenuineExactGapAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  intro hbudget
  have hlt :
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 :=
    C2GenuineExactGapAnchorFinalBudget_forces_exactOddGap_lt_one
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one hbudget
  linarith

theorem not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hodd_nonneg : 0 ≤ oddUpper s)
    (hgenuine_nonneg : 0 ≤ genuineCentralUpper s)
    (hcontinued_nonneg : 0 ≤ continuedCentralUpper s) :
    ¬ C2GenuineOddAnchorFinalBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper s := by
  intro hbudget
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    verticalDepthTailUpper_nonneg_of_re_pos s hoff.1
  have hallow_lt :
      c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s <
        verticalDepthTailUpper s :=
    c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one
  have htail_le_left :
      verticalDepthTailUpper s ≤
        c2ContinuedAnchorOddRebasingTriangleUpper
          oddUpper genuineCentralUpper continuedCentralUpper s := by
    unfold c2ContinuedAnchorOddRebasingTriangleUpper
      c2ContinuedVerticalAnchorOddUpper
      c2GenuineRebasingDefectTriangleUpper
    nlinarith [htail_nonneg, hodd_nonneg, hgenuine_nonneg,
      hcontinued_nonneg]
  unfold C2GenuineOddAnchorFinalBudget at hbudget
  linarith

theorem not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hodd_nonneg : 0 ≤ oddUpper s)
    (hgenuine_nonneg : 0 ≤ genuineCentralUpper s) :
    ¬ C2GenuineOddAnchorInheritedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s := by
  intro hbudget
  have htail_nonneg : 0 ≤ verticalDepthTailUpper s :=
    verticalDepthTailUpper_nonneg_of_re_pos s hoff.1
  have hcontinued_nonneg :
      0 ≤ c2ContinuedCentralFromOddUpper oddUpper s := by
    unfold c2ContinuedCentralFromOddUpper
    nlinarith [htail_nonneg, hodd_nonneg]
  exact
    (not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_lt_one hodd_nonneg hgenuine_nonneg
      hcontinued_nonneg)
      (by
        simpa [C2GenuineOddAnchorInheritedBudget,
          C2GenuineOddAnchorFinalBudget,
          c2ContinuedAnchorOddGenuineTriangleUpper] using hbudget)

theorem not_C2GenuineOddAnchorLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ} :
    ¬ C2GenuineOddAnchorLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s := by
  intro data
  have hodd_nonneg : 0 ≤ oddUpper s := by
    have hodd := data.odd_bound
    unfold C2ContinuedOddChannelBound at hodd
    exact le_trans (norm_nonneg _) hodd
  have hgenuine_nonneg : 0 ≤ genuineCentralUpper s := by
    have hgenuine := data.genuine_bound
    unfold C2GenuineCentralBound at hgenuine
    exact le_trans (norm_nonneg _) hgenuine
  exact
    (not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers
      data.offCritical data.horizontalScale_pos
      data.horizontalConstant_nonneg data.horizontalRatio_lt_one
      hodd_nonneg hgenuine_nonneg)
      data.final_budget

theorem exactVerticalScalarBudget_iff_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    (((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) ↔
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  set V :=
    ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set C := c2RawCentralCutoffNormConstant K M s
  set Q := c2ExpandedQuartetResidualMargin s
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - r := by
    linarith
  have hsum_pos : 0 < 1 + r := by
    linarith
  have hrescale_pos :
      0 < (1 + r) * (1 - r)⁻¹ := by
    exact mul_pos hsum_pos (inv_pos.mpr hgap_pos)
  have hundo_pos :
      0 < (1 - r) * (1 + r)⁻¹ := by
    exact mul_pos hgap_pos (inv_pos.mpr hsum_pos)
  have hundo_mul_rescale :
      ((1 - r) * (1 + r)⁻¹) *
          ((1 + r) * (1 - r)⁻¹) = 1 := by
    field_simp [ne_of_gt hgap_pos, ne_of_gt hsum_pos]
  have hrescale_mul_undo :
      ((1 + r) * (1 - r)⁻¹) *
          ((1 - r) * (1 + r)⁻¹) = 1 := by
    rw [mul_comm]
    exact hundo_mul_rescale
  constructor
  · intro hbudget
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C < Q := by
      simpa [V, H, C, Q, r, mul_assoc] using hbudget
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) < Q - H - C := by
      linarith
    have hmul :=
      mul_lt_mul_of_pos_right hmain hundo_pos
    have hleft :
        ((V + H) * ((1 + r) * (1 - r)⁻¹)) *
            ((1 - r) * (1 + r)⁻¹) = V + H := by
      rw [mul_assoc, hrescale_mul_undo, mul_one]
    have hright :
        (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H =
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      simp [c2ExactVerticalResidualNormAllowance, H, C, Q, r]
    have hVplus :
        V + H <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      simpa [hleft] using hmul
    have hV :
        V <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      linarith
    simpa [V, hright]
  · intro hresidual
    have hresidual' :
        V <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      simpa [c2ExactVerticalResidualNormAllowance, V, H, C, Q, r]
        using hresidual
    have hVplus :
        V + H <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      linarith
    have hmul :=
      mul_lt_mul_of_pos_right hVplus hrescale_pos
    have hright :
        ((Q - H - C) * ((1 - r) * (1 + r)⁻¹)) *
            ((1 + r) * (1 - r)⁻¹) = Q - H - C := by
      rw [mul_assoc, hundo_mul_rescale, mul_one]
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) < Q - H - C := by
      simpa [hright] using hmul
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C < Q := by
      linarith
    simpa [V, H, C, Q, r, mul_assoc] using hbudget'

theorem exactVerticalScalarBudget_iff_budget_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (verticalBudget : ℝ) :
    (((verticalBudget +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) ↔
      verticalBudget <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  set V := verticalBudget
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set C := c2RawCentralCutoffNormConstant K M s
  set Q := c2ExpandedQuartetResidualMargin s
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - r := by
    linarith
  have hsum_pos : 0 < 1 + r := by
    linarith
  have hrescale_pos :
      0 < (1 + r) * (1 - r)⁻¹ := by
    exact mul_pos hsum_pos (inv_pos.mpr hgap_pos)
  have hundo_pos :
      0 < (1 - r) * (1 + r)⁻¹ := by
    exact mul_pos hgap_pos (inv_pos.mpr hsum_pos)
  have hundo_mul_rescale :
      ((1 - r) * (1 + r)⁻¹) *
          ((1 + r) * (1 - r)⁻¹) = 1 := by
    field_simp [ne_of_gt hgap_pos, ne_of_gt hsum_pos]
  have hrescale_mul_undo :
      ((1 + r) * (1 - r)⁻¹) *
          ((1 - r) * (1 + r)⁻¹) = 1 := by
    rw [mul_comm]
    exact hundo_mul_rescale
  constructor
  · intro hbudget
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C < Q := by
      simpa [V, H, C, Q, r, mul_assoc] using hbudget
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) < Q - H - C := by
      linarith
    have hmul :=
      mul_lt_mul_of_pos_right hmain hundo_pos
    have hleft :
        ((V + H) * ((1 + r) * (1 - r)⁻¹)) *
            ((1 - r) * (1 + r)⁻¹) = V + H := by
      rw [mul_assoc, hrescale_mul_undo, mul_one]
    have hright :
        (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H =
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      simp [c2ExactVerticalResidualNormAllowance, H, C, Q, r]
    have hVplus :
        V + H <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      simpa [hleft] using hmul
    have hV :
        V <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      linarith
    simpa [V, hright]
  · intro hresidual
    have hresidual' :
        V <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      simpa [c2ExactVerticalResidualNormAllowance, V, H, C, Q, r]
        using hresidual
    have hVplus :
        V + H <
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      linarith
    have hmul :=
      mul_lt_mul_of_pos_right hVplus hrescale_pos
    have hright :
        ((Q - H - C) * ((1 - r) * (1 + r)⁻¹)) *
            ((1 + r) * (1 - r)⁻¹) = Q - H - C := by
      rw [mul_assoc, hundo_mul_rescale, mul_one]
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) < Q - H - C := by
      simpa [hright] using hmul
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C < Q := by
      linarith
    simpa [V, H, C, Q, r, mul_assoc] using hbudget'

theorem exactVerticalScalarBudget_iff_budget_le_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (verticalBudget : ℝ) :
    (((verticalBudget +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s ≤
          c2ExpandedQuartetResidualMargin s) ↔
      verticalBudget ≤
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  set V := verticalBudget
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set C := c2RawCentralCutoffNormConstant K M s
  set Q := c2ExpandedQuartetResidualMargin s
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hgap_pos : 0 < 1 - r := by
    linarith
  have hsum_pos : 0 < 1 + r := by
    linarith
  have hrescale_pos :
      0 < (1 + r) * (1 - r)⁻¹ := by
    exact mul_pos hsum_pos (inv_pos.mpr hgap_pos)
  have hundo_pos :
      0 < (1 - r) * (1 + r)⁻¹ := by
    exact mul_pos hgap_pos (inv_pos.mpr hsum_pos)
  have hundo_mul_rescale :
      ((1 - r) * (1 + r)⁻¹) *
          ((1 + r) * (1 - r)⁻¹) = 1 := by
    field_simp [ne_of_gt hgap_pos, ne_of_gt hsum_pos]
  have hrescale_mul_undo :
      ((1 + r) * (1 - r)⁻¹) *
          ((1 - r) * (1 + r)⁻¹) = 1 := by
    rw [mul_comm]
    exact hundo_mul_rescale
  constructor
  · intro hbudget
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C ≤ Q := by
      simpa [V, H, C, Q, r, mul_assoc] using hbudget
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) ≤ Q - H - C := by
      linarith
    have hmul :=
      mul_le_mul_of_nonneg_right hmain (le_of_lt hundo_pos)
    have hleft :
        ((V + H) * ((1 + r) * (1 - r)⁻¹)) *
            ((1 - r) * (1 + r)⁻¹) = V + H := by
      rw [mul_assoc, hrescale_mul_undo, mul_one]
    have hright :
        (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H =
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      simp [c2ExactVerticalResidualNormAllowance, H, C, Q, r]
    have hVplus :
        V + H ≤
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      simpa [hleft] using hmul
    have hV :
        V ≤
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      linarith
    simpa [V, hright]
  · intro hresidual
    have hresidual' :
        V ≤
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) - H := by
      simpa [c2ExactVerticalResidualNormAllowance, V, H, C, Q, r]
        using hresidual
    have hVplus :
        V + H ≤
          (Q - H - C) * ((1 - r) * (1 + r)⁻¹) := by
      linarith
    have hmul :=
      mul_le_mul_of_nonneg_right hVplus (le_of_lt hrescale_pos)
    have hright :
        ((Q - H - C) * ((1 - r) * (1 + r)⁻¹)) *
            ((1 + r) * (1 - r)⁻¹) = Q - H - C := by
      rw [mul_assoc, hundo_mul_rescale, mul_one]
    have hmain :
        (V + H) * ((1 + r) * (1 - r)⁻¹) ≤ Q - H - C := by
      simpa [hright] using hmul
    have hbudget' :
        (V + H) * ((1 + r) * (1 - r)⁻¹) + H + C ≤ Q := by
      linarith
    simpa [V, H, C, Q, r, mul_assoc] using hbudget'

theorem C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorGapUpperExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper s ↔
      C2ExactGapAnchorGapUpperScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper s := by
  set V :=
    verticalDepthTailUpper s * gapUpper s +
      c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s +
      c2RawCentralCutoffNormConstant K M s
  constructor
  · intro hbudget
    have hexpanded :
        (((V +
              c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s) *
            (1 + ‖q s‖)) *
              (1 - ‖q s‖)⁻¹ +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s +
            c2RawCentralCutoffNormConstant K M s <
              c2ExpandedQuartetResidualMargin s) := by
      simpa [C2ExactGapAnchorGapUpperExpandedScalarBudget, V,
        add_assoc, add_comm, add_left_comm] using hbudget
    have hv :
        V <
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s :=
      (exactVerticalScalarBudget_iff_budget_lt_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hoff V).1 hexpanded
    unfold C2ExactGapAnchorGapUpperScalarBudget
      c2ExactVerticalAnchorResidualNormAllowance
    dsimp [V] at hv
    linarith
  · intro hbudget
    have hv :
        V <
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      unfold C2ExactGapAnchorGapUpperScalarBudget
        c2ExactVerticalAnchorResidualNormAllowance at hbudget
      dsimp [V]
      linarith
    have hexpanded :=
      (exactVerticalScalarBudget_iff_budget_lt_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hoff V).2 hv
    simpa [C2ExactGapAnchorGapUpperExpandedScalarBudget, V,
      add_assoc, add_comm, add_left_comm] using hexpanded

theorem C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper s) :
    C2ExactGapAnchorGapUpperScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio
      gapUpper s :=
  (C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (gapUpper := gapUpper)
    (s := s) hoff).1 hbudget

theorem C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_expandedScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge) :
    C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      gapUpper near edge := by
  intro s hs
  exact
    C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget
      hs.1 (hbudget hs)

theorem C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_iff_gapUpperScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge ↔
      C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge := by
  constructor
  · exact C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_expandedScalarBudgetOnMiddle
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (gapUpper := gapUpper)
        (s := s) hs.1).2 (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_iff_slackAllowanceBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack s ↔
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack s := by
  set V :=
    c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
      verticalDepthTailUpper s +
      c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s +
      c2RawCentralCutoffNormConstant K M s
  constructor
  · intro hbudget
    have hexpanded :
        (((V +
              c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s) *
            (1 + ‖q s‖)) *
              (1 - ‖q s‖)⁻¹ +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s +
            c2RawCentralCutoffNormConstant K M s ≤
              c2ExpandedQuartetResidualMargin s) := by
      simpa [
        C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget,
        V, add_assoc, add_comm, add_left_comm] using hbudget
    have hv :
        V ≤
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s :=
      (exactVerticalScalarBudget_iff_budget_le_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hoff V).1 hexpanded
    unfold C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
      c2ExactVerticalAnchorResidualNormAllowance
    dsimp [V] at hv
    linarith
  · intro hbudget
    have hv :
        V ≤
          c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      unfold C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
        c2ExactVerticalAnchorResidualNormAllowance at hbudget
      dsimp [V]
      linarith
    have hexpanded :=
      (exactVerticalScalarBudget_iff_budget_le_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hoff V).2 hv
    simpa [
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget,
      V, add_assoc, add_comm, add_left_comm] using hexpanded

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget_of_expandedBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s :=
  (C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_iff_slackAllowanceBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (oddUpper := oddUpper)
    (paymentSlack := paymentSlack)
    (s := s) hoff).1 hbudget

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle_of_expandedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget_of_expandedBudget
      hs.1 (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_iff_slackAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge ↔
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge := by
  constructor
  · exact
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle_of_expandedBudgetOnMiddle
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_iff_slackAllowanceBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (oddUpper := oddUpper)
        (paymentSlack := paymentSlack)
        (s := s) hs.1).2 (hbudget hs)

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_clearedBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s := by
  set r := ‖q s‖
  set A := (1 + r) * (1 + 2 * oddUpper s) + paymentSlack s
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set C := c2RawCentralCutoffNormConstant K M s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set D := G + Cc + C + H
  set Q := c2ExpandedQuartetResidualMargin s
  set g := 1 - r
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hg_pos : 0 < g := by
    dsimp [g]
    linarith
  have hg_ne : g ≠ 0 := ne_of_gt hg_pos
  have hg3_pos : 0 < g ^ 3 := pow_pos hg_pos 3
  have hg3_ne : g ^ 3 ≠ 0 := ne_of_gt hg3_pos
  have hcleared :
      (1 + r) * (A * r ^ 2 + D * g ^ 2) +
          (H + C) * g ^ 3 ≤ Q * g ^ 3 := by
    simpa [
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget,
      r, A, G, Cc, C, H, D, Q, g, add_assoc, add_comm, add_left_comm]
      using hbudget
  have hdiv :
      ((1 + r) * (A * r ^ 2 + D * g ^ 2) +
          (H + C) * g ^ 3) / g ^ 3 ≤ Q := by
    rw [div_le_iff₀ hg3_pos]
    simpa [mul_assoc] using hcleared
  have hmain :
      ((1 + r) * (A * r ^ 2 + D * g ^ 2)) * (g ^ 3)⁻¹ +
          H + C ≤ Q := by
    have hsplit :
        ((1 + r) * (A * r ^ 2 + D * g ^ 2) +
            (H + C) * g ^ 3) / g ^ 3 =
          ((1 + r) * (A * r ^ 2 + D * g ^ 2)) *
              (g ^ 3)⁻¹ + H + C := by
      field_simp [hg3_ne]
      ring
    rw [hsplit] at hdiv
    simpa [add_assoc, add_comm, add_left_comm] using hdiv
  have htarget :
      (((A / g) * (r ^ 2 / g) + D) * (1 + r)) * g⁻¹ +
          H + C ≤ Q := by
    have hrewrite :
        (((A / g) * (r ^ 2 / g) + D) * (1 + r)) * g⁻¹ +
            H + C =
          ((1 + r) * (A * r ^ 2 + D * g ^ 2)) *
              (g ^ 3)⁻¹ + H + C := by
      field_simp [hg_ne]
    simpa [hrewrite] using hmain
  simpa [
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget,
    c2TailLowerDistortedOddMetricAllowanceLower,
    verticalDepthTailUpper,
    r, A, G, Cc, C, H, D, Q, g,
    add_assoc, add_comm, add_left_comm]
    using htarget

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_clearedBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_clearedBudget
      hs.1 (hbudget hs)

lemma c2_cleared_tail_min_gt_cleared_quartet_margin_scalar
    {r : ℝ} (hr0 : 0 < r) (hr1 : r < 1) :
    r ^ 2 * (1 + r) ^ 2 >
      r ^ 2 * (1 - r) ^ 4 * (1 + r ^ 2) := by
  have hr_nonneg : 0 ≤ r := le_of_lt hr0
  have hgap_pos : 0 < 1 - r := by linarith
  have hgap_nonneg : 0 ≤ 1 - r := le_of_lt hgap_pos
  have hgap_le_one : 1 - r ≤ 1 := by linarith
  have hgap4_le_one : (1 - r) ^ 4 ≤ 1 :=
    pow_le_one₀ hgap_nonneg hgap_le_one
  have hone_plus_sq_pos : 0 ≤ 1 + r ^ 2 := by positivity
  have hfactor_le :
      (1 - r) ^ 4 * (1 + r ^ 2) ≤ 1 * (1 + r ^ 2) :=
    mul_le_mul_of_nonneg_right hgap4_le_one hone_plus_sq_pos
  have hstrict : 1 + r ^ 2 < (1 + r) ^ 2 := by
    nlinarith
  have hinner :
      (1 - r) ^ 4 * (1 + r ^ 2) < (1 + r) ^ 2 :=
    lt_of_le_of_lt (by simpa using hfactor_le) hstrict
  have hr_sq_pos : 0 < r ^ 2 := pow_pos hr0 2
  have hmul :=
    mul_lt_mul_of_pos_left hinner hr_sq_pos
  simpa [mul_assoc, mul_comm, mul_left_comm] using hmul

theorem not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {s : ℂ}
    (hr0 : 0 < ‖q s‖)
    (hr1 : ‖q s‖ < 1)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hodd_nonneg : 0 ≤ oddUpper s)
    (hslack_nonneg : 0 ≤ paymentSlack s)
    (hmargin_le :
      c2ExpandedQuartetResidualMargin s ≤
        ‖q s‖ ^ 2 * (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2)) :
    ¬ C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack s := by
  intro hbudget
  set r := ‖q s‖
  set A := (1 + r) * (1 + 2 * oddUpper s) + paymentSlack s
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set C := c2RawCentralCutoffNormConstant K M s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set D := G + Cc + C + H
  set Q := c2ExpandedQuartetResidualMargin s
  set g := 1 - r
  have hr0' : 0 < r := by simpa [r] using hr0
  have hr1' : r < 1 := by simpa [r] using hr1
  have hg_pos : 0 < g := by
    dsimp [g]
    linarith
  have hg3_nonneg : 0 ≤ g ^ 3 := le_of_lt (pow_pos hg_pos 3)
  have hG_nonneg : 0 ≤ G := by
    simp [G, c2GenuineCentralExactUpper]
  have hCc_nonneg : 0 ≤ Cc := by
    simp [Cc, c2ContinuedCentralExactUpper]
  have hC_nonneg : 0 ≤ C := by
    simpa [C] using c2RawCentralCutoffNormConstant_nonneg K M s
  have hH_nonneg : 0 ≤ H := by
    simpa [H] using
      c2HorizontalRegularizedUpper_nonneg_of_pos
        hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_lt_one
  have hD_nonneg : 0 ≤ D := by
    dsimp [D]
    nlinarith
  have hHC_nonneg : 0 ≤ H + C := by
    nlinarith
  have hone_plus_r_nonneg : 0 ≤ 1 + r := by
    linarith
  have hodd_factor : 1 ≤ 1 + 2 * oddUpper s := by
    nlinarith
  have hprod_ge :
      (1 + r) * 1 ≤ (1 + r) * (1 + 2 * oddUpper s) :=
    mul_le_mul_of_nonneg_left hodd_factor hone_plus_r_nonneg
  have hA_ge : 1 + r ≤ A := by
    dsimp [A]
    nlinarith
  have hA_tail :
      (1 + r) * r ^ 2 ≤ A * r ^ 2 :=
    mul_le_mul_of_nonneg_right hA_ge (sq_nonneg r)
  have hDterm_nonneg : 0 ≤ D * g ^ 2 :=
    mul_nonneg hD_nonneg (sq_nonneg g)
  have hinside :
      (1 + r) * r ^ 2 ≤ A * r ^ 2 + D * g ^ 2 := by
    nlinarith
  have hscaled :
      (1 + r) * ((1 + r) * r ^ 2) ≤
        (1 + r) * (A * r ^ 2 + D * g ^ 2) :=
    mul_le_mul_of_nonneg_left hinside hone_plus_r_nonneg
  have htailpost_nonneg : 0 ≤ (H + C) * g ^ 3 :=
    mul_nonneg hHC_nonneg hg3_nonneg
  have hleft_min :
      r ^ 2 * (1 + r) ^ 2 ≤
        (1 + r) * (A * r ^ 2 + D * g ^ 2) +
          (H + C) * g ^ 3 := by
    calc
      r ^ 2 * (1 + r) ^ 2 = (1 + r) * ((1 + r) * r ^ 2) := by
        ring
      _ ≤ (1 + r) * (A * r ^ 2 + D * g ^ 2) := hscaled
      _ ≤ (1 + r) * (A * r ^ 2 + D * g ^ 2) +
          (H + C) * g ^ 3 := le_add_of_nonneg_right htailpost_nonneg
  have hcleared :
      (1 + r) * (A * r ^ 2 + D * g ^ 2) +
          (H + C) * g ^ 3 ≤ Q * g ^ 3 := by
    simpa [
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget,
      r, A, G, Cc, C, H, D, Q, g, add_assoc, add_comm, add_left_comm]
      using hbudget
  have hQ_le : Q ≤ r ^ 2 * g * (1 + r ^ 2) := by
    simpa [Q, r, g, mul_assoc, mul_comm, mul_left_comm] using hmargin_le
  have hright_le :
      Q * g ^ 3 ≤ r ^ 2 * g ^ 4 * (1 + r ^ 2) := by
    have hmul := mul_le_mul_of_nonneg_right hQ_le hg3_nonneg
    calc
      Q * g ^ 3 ≤ (r ^ 2 * g * (1 + r ^ 2)) * g ^ 3 := hmul
      _ = r ^ 2 * g ^ 4 * (1 + r ^ 2) := by ring
  have hle :
      r ^ 2 * (1 + r) ^ 2 ≤ r ^ 2 * g ^ 4 * (1 + r ^ 2) :=
    le_trans hleft_min (le_trans hcleared hright_le)
  have hgt :
      r ^ 2 * (1 + r) ^ 2 >
        r ^ 2 * g ^ 4 * (1 + r ^ 2) := by
    simpa [g] using
      c2_cleared_tail_min_gt_cleared_quartet_margin_scalar
        hr0' hr1'
  linarith

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_upperBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (htailAllowance :
      c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
          verticalDepthTailUpper s ≤ tailAllowanceBudget s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
        K M tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget s) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
      K M horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack s := by
  set T :=
    c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
      verticalDepthTailUpper s
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set C := c2RawCentralCutoffNormConstant K M s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set Tu := tailAllowanceBudget s
  set Gu := genuineCentralUpper s
  set Cu := continuedCentralUpper s
  set Bu := cutoffBudget s
  set Hu := horizontalBudget s
  set R := (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹
  have hR_nonneg : 0 ≤ R := by
    have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
    have hgap_pos : 0 < 1 - ‖q s‖ := by linarith
    have hsum_pos : 0 < 1 + ‖q s‖ := by
      linarith [norm_nonneg (q s)]
    exact le_of_lt (mul_pos hsum_pos (inv_pos.mpr hgap_pos))
  have hT_le : T ≤ Tu := by
    simpa [T, Tu] using htailAllowance
  have hG_le : G ≤ Gu := by
    simpa [G, Gu, c2GenuineCentralExactUpper, C2GenuineCentralBound] using
      hgenuine
  have hCc_le : Cc ≤ Cu := by
    simpa [Cc, Cu, c2ContinuedCentralExactUpper,
      C2ContinuedCentralBound] using hcontinued
  have hC_le : C ≤ Bu := by
    simpa [C, Bu] using hcutoff
  have hH_le : H ≤ Hu := by
    simpa [H, Hu] using hhorizontal
  have hsum_le :
      T + G + Cc + C + H ≤ Tu + Gu + Cu + Bu + Hu := by
    linarith
  have hscaled_le :
      (T + G + Cc + C + H) * R ≤
        (Tu + Gu + Cu + Bu + Hu) * R :=
    mul_le_mul_of_nonneg_right hsum_le hR_nonneg
  have hupper :
      (Tu + Gu + Cu + Bu + Hu) * R + Hu + Bu ≤
        c2ExpandedQuartetResidualMargin s := by
    simpa [
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget,
      Tu, Gu, Cu, Bu, Hu, R, mul_assoc] using hbudget
  unfold C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
  have hmain :
      (T + G + Cc + C + H) * R + H + C ≤
        c2ExpandedQuartetResidualMargin s := by
    linarith
  simpa [T, G, Cc, C, H, R, mul_assoc, add_assoc, add_comm,
    add_left_comm] using hmain

theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_upperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack : ℂ → ℝ}
    {tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (htailAllowance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
          verticalDepthTailUpper s ≤ tailAllowanceBudget s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      oddUpper paymentSlack near edge := by
  intro s hs
  exact
    C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_upperBudget
      hs.1 (htailAllowance hs) (hgenuine hs) (hcontinued hs)
      (hhorizontal hs) (hcutoff hs) (hbudget hs)

theorem oddUpper_nonneg_of_continuedOddChannelBound
    {oddUpper : ℂ → ℝ} {s : ℂ}
    (hodd : C2ContinuedOddChannelBound oddUpper s) :
    0 ≤ oddUpper s := by
  unfold C2ContinuedOddChannelBound at hodd
  exact le_trans (norm_nonneg _) hodd

theorem c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_nonneg
    {oddUpper paymentSlack : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd_nonneg : 0 ≤ oddUpper s)
    (hslack_nonneg : 0 ≤ paymentSlack s) :
    0 ≤ c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s := by
  set r := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    simp [r]
  have hr_lt : r < 1 := by
    simpa [r] using q_norm_lt_one_of_offCriticalStrip s hoff
  have hden_pos : 0 < 1 - r := by
    linarith
  have hleft_nonneg : 0 ≤ 1 + r := by
    linarith
  have hright_nonneg : 0 ≤ 1 + 2 * oddUpper s := by
    nlinarith
  have hprod_nonneg :
      0 ≤ (1 + r) * (1 + 2 * oddUpper s) :=
    mul_nonneg hleft_nonneg hright_nonneg
  have hnum_nonneg :
      0 ≤ (1 + r) * (1 + 2 * oddUpper s) + paymentSlack s := by
    linarith
  unfold c2TailLowerDistortedOddMetricAllowanceLower
  exact div_nonneg (by simpa [r] using hnum_nonneg) (le_of_lt hden_pos)

theorem c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_oddBound
    {oddUpper paymentSlack : ℂ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hslack_nonneg : 0 ≤ paymentSlack s) :
    0 ≤ c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s :=
  c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_nonneg
    hoff (oddUpper_nonneg_of_continuedOddChannelBound hodd) hslack_nonneg

theorem C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_upperBounds
    {oddUpper paymentSlack allowanceUpper verticalTailBudget
      tailAllowanceBudget : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hslack_nonneg : 0 ≤ paymentSlack s)
    (hallow :
      C2TailLowerDistortedOddMetricAllowanceUpperBound
        oddUpper paymentSlack allowanceUpper s)
    (hvertical :
      C2VerticalDepthTailUpperBound verticalTailBudget s)
    (hproduct :
      C2TailLowerDistortedOddMetricAllowanceTailProductBudget
        allowanceUpper verticalTailBudget tailAllowanceBudget s) :
    C2TailLowerDistortedOddMetricAllowanceTailProductBound
      oddUpper paymentSlack tailAllowanceBudget s := by
  set A :=
    c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s
  set T := verticalDepthTailUpper s
  set Au := allowanceUpper s
  set Tu := verticalTailBudget s
  have hA_nonneg : 0 ≤ A := by
    simpa [A] using
      c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_oddBound
        hoff hodd hslack_nonneg
  have hT_nonneg : 0 ≤ T := by
    simpa [T] using le_of_lt (verticalDepthTailUpper_pos_of_offCriticalStrip hoff)
  have hA_le : A ≤ Au := by
    simpa [C2TailLowerDistortedOddMetricAllowanceUpperBound, A, Au]
      using hallow
  have hT_le : T ≤ Tu := by
    simpa [C2VerticalDepthTailUpperBound, T, Tu] using hvertical
  have hAu_nonneg : 0 ≤ Au := le_trans hA_nonneg hA_le
  have hmul :
      A * T ≤ Au * Tu :=
    mul_le_mul hA_le hT_le hT_nonneg hAu_nonneg
  unfold C2TailLowerDistortedOddMetricAllowanceTailProductBound
  have hbudget : Au * Tu ≤ tailAllowanceBudget s := by
    simpa [C2TailLowerDistortedOddMetricAllowanceTailProductBudget, Au, Tu]
      using hproduct
  exact le_trans (by simpa [A, T, Au, Tu] using hmul) hbudget

theorem C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_upperBoundsOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper paymentSlack allowanceUpper verticalTailBudget
      tailAllowanceBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ paymentSlack s)
    (hallow :
      C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle
        oddUpper paymentSlack allowanceUpper near edge)
    (hvertical :
      C2VerticalDepthTailUpperBoundOnMiddle verticalTailBudget near edge)
    (hproduct :
      C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle
        allowanceUpper verticalTailBudget tailAllowanceBudget near edge) :
    C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
      oddUpper paymentSlack tailAllowanceBudget near edge := by
  intro s hs
  exact
    C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_upperBounds
      hs.1 (hodd hs) (hslack_nonneg hs)
      (hallow hs) (hvertical hs) (hproduct hs)

theorem c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper_eq
    (oddUpper paymentSlack : ℂ → ℝ) (s : ℂ) :
    c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
        verticalDepthTailUpper s =
      c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
        oddUpper paymentSlack s := by
  unfold c2TailLowerDistortedOddMetricAllowanceLower
    verticalDepthTailUpper
    c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
  ring

theorem C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_canonicalBudget
    {oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget
        oddUpper paymentSlack tailAllowanceBudget s) :
    C2TailLowerDistortedOddMetricAllowanceTailProductBound
      oddUpper paymentSlack tailAllowanceBudget s := by
  unfold C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget at hbudget
  unfold C2TailLowerDistortedOddMetricAllowanceTailProductBound
  rw [c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper_eq]
  exact hbudget

theorem C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_canonicalBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddUpper paymentSlack tailAllowanceBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
        oddUpper paymentSlack tailAllowanceBudget near edge) :
    C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
      oddUpper paymentSlack tailAllowanceBudget near edge := by
  intro s hs
  exact
    C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_canonicalBudget
      (hbudget hs)

theorem C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorPositiveAllowanceScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorPositiveAllowanceBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  unfold C2ExactGapAnchorPositiveAllowanceScalarBudget
    C2ExactGapAnchorPositiveAllowanceBudget
  simpa [add_assoc, add_comm, add_left_comm] using
    (exactVerticalScalarBudget_iff_budget_lt_allowance
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff
      (c2GenuineCentralExactUpper s +
        c2ContinuedCentralExactUpper s +
        c2RawCentralCutoffNormConstant K M s))

theorem c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceScalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    0 <
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s :=
  c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceBudget
    hoff
    ((C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff).1 hbudget)

theorem C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_scalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    (C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hs.1).1 (hbudget hs)

theorem C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_iff_positiveAllowanceBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · exact C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_scalarBudgetOnMiddle
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hbudget hs)

theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  intro s hs
  exact c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceScalarBudget
    hs.1 (hbudget hs)

theorem C2ExactGapAnchorPositiveAllowanceScalarBudget_of_upperBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceUpperBudget
        K M genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget s) :
    C2ExactGapAnchorPositiveAllowanceScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio s := by
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set C := c2RawCentralCutoffNormConstant K M s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set Gu := genuineCentralUpper s
  set Cu := continuedCentralUpper s
  set Bu := cutoffBudget s
  set Hu := horizontalBudget s
  set R := (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹
  have hR_nonneg : 0 ≤ R := by
    have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
    have hgap_pos : 0 < 1 - ‖q s‖ := by linarith
    have hsum_pos : 0 < 1 + ‖q s‖ := by
      linarith [norm_nonneg (q s)]
    exact le_of_lt (mul_pos hsum_pos (inv_pos.mpr hgap_pos))
  have hG_le : G ≤ Gu := by
    simpa [G, Gu, c2GenuineCentralExactUpper, C2GenuineCentralBound] using
      hgenuine
  have hCc_le : Cc ≤ Cu := by
    simpa [Cc, Cu, c2ContinuedCentralExactUpper,
      C2ContinuedCentralBound] using hcontinued
  have hC_le : C ≤ Bu := by
    simpa [C, Bu] using hcutoff
  have hH_le : H ≤ Hu := by
    simpa [H, Hu] using hhorizontal
  have hsum_le :
      G + Cc + C + H ≤ Gu + Cu + Bu + Hu := by
    linarith
  have hscaled_le :
      (G + Cc + C + H) * R ≤ (Gu + Cu + Bu + Hu) * R :=
    mul_le_mul_of_nonneg_right hsum_le hR_nonneg
  have hupper :
      (Gu + Cu + Bu + Hu) * R + Hu + Bu <
        c2ExpandedQuartetResidualMargin s := by
    simpa [C2ExactGapAnchorPositiveAllowanceUpperBudget,
      Gu, Cu, Bu, Hu, R, mul_assoc] using hbudget
  unfold C2ExactGapAnchorPositiveAllowanceScalarBudget
  have hmain :
      (G + Cc + C + H) * R + H + C <
        c2ExpandedQuartetResidualMargin s := by
    linarith
  simpa [G, Cc, C, H, R, mul_assoc, add_assoc, add_comm, add_left_comm]
    using hmain

theorem C2ExactGapAnchorGapUpperExpandedScalarBudget_of_upperBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (htailGap :
      verticalDepthTailUpper s * gapUpper s ≤ tailGapBudget s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedUpperBudget
        K M tailGapBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget s) :
    C2ExactGapAnchorGapUpperExpandedScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio
      gapUpper s := by
  set T := verticalDepthTailUpper s * gapUpper s
  set G := c2GenuineCentralExactUpper s
  set Cc := c2ContinuedCentralExactUpper s
  set C := c2RawCentralCutoffNormConstant K M s
  set H :=
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s
  set Tu := tailGapBudget s
  set Gu := genuineCentralUpper s
  set Cu := continuedCentralUpper s
  set Bu := cutoffBudget s
  set Hu := horizontalBudget s
  set R := (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹
  have hR_nonneg : 0 ≤ R := by
    have hq_lt : ‖q s‖ < 1 := q_norm_lt_one_of_offCriticalStrip s hoff
    have hgap_pos : 0 < 1 - ‖q s‖ := by linarith
    have hsum_pos : 0 < 1 + ‖q s‖ := by
      linarith [norm_nonneg (q s)]
    exact le_of_lt (mul_pos hsum_pos (inv_pos.mpr hgap_pos))
  have hT_le : T ≤ Tu := by
    simpa [T, Tu] using htailGap
  have hG_le : G ≤ Gu := by
    simpa [G, Gu, c2GenuineCentralExactUpper, C2GenuineCentralBound] using
      hgenuine
  have hCc_le : Cc ≤ Cu := by
    simpa [Cc, Cu, c2ContinuedCentralExactUpper,
      C2ContinuedCentralBound] using hcontinued
  have hC_le : C ≤ Bu := by
    simpa [C, Bu] using hcutoff
  have hH_le : H ≤ Hu := by
    simpa [H, Hu] using hhorizontal
  have hsum_le :
      T + G + Cc + C + H ≤ Tu + Gu + Cu + Bu + Hu := by
    linarith
  have hscaled_le :
      (T + G + Cc + C + H) * R ≤
        (Tu + Gu + Cu + Bu + Hu) * R :=
    mul_le_mul_of_nonneg_right hsum_le hR_nonneg
  have hupper :
      (Tu + Gu + Cu + Bu + Hu) * R + Hu + Bu <
        c2ExpandedQuartetResidualMargin s := by
    simpa [C2ExactGapAnchorGapUpperExpandedUpperBudget,
      Tu, Gu, Cu, Bu, Hu, R, mul_assoc] using hbudget
  unfold C2ExactGapAnchorGapUpperExpandedScalarBudget
  have hmain :
      (T + G + Cc + C + H) * R + H + C <
        c2ExpandedQuartetResidualMargin s := by
    linarith
  simpa [T, G, Cc, C, H, R, mul_assoc, add_assoc, add_comm, add_left_comm]
    using hmain

theorem C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (htailGap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      verticalDepthTailUpper s * gapUpper s ≤ tailGapBudget s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle
        tailGapBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      gapUpper near edge := by
  intro s hs
  exact
    C2ExactGapAnchorGapUpperExpandedScalarBudget_of_upperBudget
      hs.1 (htailGap hs) (hgenuine hs) (hcontinued hs)
      (hhorizontal hs) (hcutoff hs) (hbudget hs)

theorem c2ExactGapAnchorExactTailGapBudget_bound
    (s : ℂ) :
    verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s ≤
      c2ExactGapAnchorExactTailGapBudget s := by
  unfold c2ExactGapAnchorExactTailGapBudget
  exact le_rfl

theorem c2ExactGapAnchorExactTailGapBudget_bound_onMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s ≤
        c2ExactGapAnchorExactTailGapBudget s := by
  intro s _hs
  exact c2ExactGapAnchorExactTailGapBudget_bound s

theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  exact
    C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
      c2ExactGapAnchorExactTailGapBudget_bound_onMiddle
      hgenuine hcontinued hhorizontal hcutoff hbudget

theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_explicit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} :
    C2ExactGapAnchorExactGapExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s := by
  unfold C2ExactGapAnchorExactGapExpandedScalarBudget
    C2ExactGapAnchorGapUpperExpandedScalarBudget
    c2ContinuedOddExactGapUpper
    c2GenuineCentralExactUpper
    c2ContinuedCentralExactUpper
  rfl

theorem C2ExactGapAnchorExactGapExpandedScalarBudget_of_explicit
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExactGapAnchorExactGapExpandedScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorExactGapExpandedScalarBudget_iff_explicit).2 hbudget

theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact C2ExactGapAnchorExactGapExpandedScalarBudget_of_explicit
    (hbudget hs)

theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_finalBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorExactGapExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s := by
  have hiff :=
    C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (gapUpper := c2ContinuedOddExactGapUpper)
      (s := s) hoff
  constructor
  · intro hbudget
    have hscalar :
        C2ExactGapAnchorGapUpperScalarBudget
          K M horizontalConstant horizontalScale horizontalRatio
          c2ContinuedOddExactGapUpper s :=
      hiff.1 hbudget
    have hexplicit :
        verticalDepthTailUpper s *
            ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
          ‖genuineCentralDoubleSeries s‖ +
          ‖continuedCentralOddChannel s‖ <
            c2ExactVerticalAnchorResidualNormAllowance
              K M horizontalConstant horizontalScale horizontalRatio s := by
      simpa [C2ExactGapAnchorGapUpperScalarBudget,
        c2ContinuedOddExactGapUpper, c2GenuineCentralExactUpper,
        c2ContinuedCentralExactUpper] using hscalar
    exact C2GenuineExactGapAnchorFinalBudget_of_explicit hexplicit
  · intro hbudget
    have hexplicit :=
      (C2GenuineExactGapAnchorFinalBudget_iff_explicit
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s)).1 hbudget
    have hscalar :
        C2ExactGapAnchorGapUpperScalarBudget
          K M horizontalConstant horizontalScale horizontalRatio
          c2ContinuedOddExactGapUpper s := by
      simpa [C2ExactGapAnchorGapUpperScalarBudget,
        c2ContinuedOddExactGapUpper, c2GenuineCentralExactUpper,
        c2ContinuedCentralExactUpper] using hexplicit
    exact hiff.2 hscalar

theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_phaseSaving
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactGapAnchorExactGapExpandedScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s :=
  (C2ExactGapAnchorExactGapExpandedScalarBudget_iff_finalBudget
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (s := s) hoff).trans
    (C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (s := s) hoff)

theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M} :
    C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge ↔
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge := by
  constructor
  · intro hbudget s hs
    exact
      (C2ExactGapAnchorExactGapExpandedScalarBudget_iff_phaseSaving
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).1 (hbudget hs)
  · intro hphase s hs
    exact
      (C2ExactGapAnchorExactGapExpandedScalarBudget_iff_phaseSaving
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) hs.1).2 (hphase hs)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedScalarBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hbudget :
      C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge :=
  (C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_phaseSavingOnMiddle
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (near := near) (edge := edge)).2
    ((C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near) (edge := edge)).1 hbudget)

theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactFactorUpper near edge :=
  C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedScalarBudgetOnMiddle
    (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
      hgenuine hcontinued hhorizontal hcutoff hbudget)

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge where
  horizontalScale_pos := hhorizontalScale_pos
  horizontalConstant_nonneg := hhorizontalConstant_nonneg
  horizontalRatio_nonneg := hhorizontalRatio_nonneg
  horizontalRatio_lt_one := hhorizontalRatio_lt_one
  horizontal := hhorizontal
  exact_gap_expanded_budget := hbudget

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData
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
      C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
    (fun {s} hs => (hscale (s := s) hs).horizontalScale_pos)
    (fun {s} hs => (hscale (s := s) hs).horizontalConstant_nonneg)
    (fun {s} hs => (hscale (s := s) hs).horizontalRatio_nonneg)
    (fun {s} hs => (hscale (s := s) hs).horizontalRatio_lt_one)
    hhorizontal hbudget

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
    hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
    ((C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hphase)

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData_phaseSavingOnMiddle
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
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData
    hscale hhorizontal
    ((C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hphase)

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_explicit
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
    hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
    (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit
      hbudget)

theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_upperBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoffBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
    hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
    (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
      hgenuine hcontinued hhorizontalBudget hcutoffBudget hbudget)

theorem C2ExactGapAnchorExactGapExpandedMiddleData.to_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorExactGapExpandedMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  have hscalar :
      C2ExactGapAnchorGapUpperScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedOddExactGapUpper s :=
    C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget
      hs.1 (data.exact_gap_expanded_budget hs)
  have hfinal :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s :=
    C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget
      hs.1 (c2ContinuedOddGapBound_exact s) hscalar
  exact
    C2ExactGapAnchorPhaseSaving_of_exactGapAnchorFinalBudget hs.1 hfinal

theorem C2ExactGapAnchorExactGapExpandedMiddleData.forces_exactOddGap_lt_one
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorExactGapExpandedMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ < 1 := by
  intro s hs
  have hphase :
      C2ExactGapAnchorPhaseSaving
        K M horizontalConstant horizontalScale horizontalRatio s :=
    (C2ExactGapAnchorExactGapExpandedMiddleData.to_phaseSavingOnMiddle data)
      hs
  exact
    C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one
      hs.1 (data.horizontalScale_pos hs) (data.horizontalConstant_nonneg hs)
      (data.horizontalRatio_lt_one hs) hphase

/-- Geometric middle package: the continued odd channel lies in the exact
phase disk around `1 / 2`, with the horizontal C2 data needed downstream. -/
structure C2ExactGapAnchorPhaseDiskMiddleData
    {coreCutoff : ℕ → ℕ} (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
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
  phase_disk :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge

theorem C2ExactGapAnchorPhaseDiskMiddleData.of_scaleData
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
    (hphase_disk :
      C2ExactGapAnchorPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseDiskMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge where
  horizontalScale_pos := fun {s} hs =>
    (hscale (s := s) hs).horizontalScale_pos
  horizontalConstant_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalConstant_nonneg
  horizontalRatio_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_nonneg
  horizontalRatio_lt_one := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_lt_one
  horizontal := hhorizontal
  phase_disk := hphase_disk

theorem C2ExactGapAnchorPhaseDiskMiddleData.to_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorPhaseDiskMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle data.phase_disk

theorem C2ExactGapAnchorPhaseDiskMiddleData.to_exactGapExpandedMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorPhaseDiskMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  C2ExactGapAnchorExactGapExpandedMiddleData.of_phaseSavingOnMiddle
    data.horizontalScale_pos data.horizontalConstant_nonneg
    data.horizontalRatio_nonneg data.horizontalRatio_lt_one
    data.horizontal data.to_phaseSavingOnMiddle

/-- Operator-side geometric middle package: an anchor residual upper and its
phase-disk budget generate the disk condition around `1 / 2`. -/
structure C2ExactGapAnchorAnchorResidualMiddleData
    {coreCutoff : ℕ → ℕ} (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ)
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
  anchor :
    C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge
  phase_disk_budget :
    C2ExactGapAnchorPhaseDiskBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio
      (c2HalfDiskUpperFromAnchor anchorUpper) near edge

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale anchorUpper : ℂ → ℝ}
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
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2HalfDiskUpperFromAnchor anchorUpper) near edge) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      anchorUpper near edge where
  horizontalScale_pos := fun {s} hs =>
    (hscale (s := s) hs).horizontalScale_pos
  horizontalConstant_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalConstant_nonneg
  horizontalRatio_nonneg := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_nonneg
  horizontalRatio_lt_one := fun {s} hs =>
    (hscale (s := s) hs).horizontalRatio_lt_one
  horizontal := hhorizontal
  anchor := hanchor
  phase_disk_budget := hbudget

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_exactAnchorResidualBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge where
  horizontalScale_pos := hhorizontalScale_pos
  horizontalConstant_nonneg := hhorizontalConstant_nonneg
  horizontalRatio_nonneg := hhorizontalRatio_nonneg
  horizontalRatio_lt_one := hhorizontalRatio_lt_one
  horizontal := hhorizontal
  anchor := C2ContinuedVerticalAnchorResidualBoundOnMiddle_exact
  phase_disk_budget := fun {s} hs => by
    simpa [C2ExactGapAnchorExactAnchorResidualBudget] using hbudget hs

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_exactAnchorResidualBudget
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
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge :=
  C2ExactGapAnchorAnchorResidualMiddleData.of_exactAnchorResidualBudget
    (fun {s} hs => (hscale (s := s) hs).horizontalScale_pos)
    (fun {s} hs => (hscale (s := s) hs).horizontalConstant_nonneg)
    (fun {s} hs => (hscale (s := s) hs).horizontalRatio_nonneg)
    (fun {s} hs => (hscale (s := s) hs).horizontalRatio_lt_one)
    hhorizontal hbudget

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_tailLowerDistortedGapBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge :=
  C2ExactGapAnchorAnchorResidualMiddleData.of_exactAnchorResidualBudget
    hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
    ((C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle_iff_tailLowerDistortedGapBudgetOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapBudget
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
      C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge :=
  C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_exactAnchorResidualBudget
    hscale hhorizontal
    ((C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle_iff_tailLowerDistortedGapBudgetOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hbudget)

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapExplicitUpperBudget
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
      C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge :=
  C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapBudget
    hscale hhorizontal
    (C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle_of_explicitUpperBudgetOnMiddle
      hbudget)

theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedPhaseDisk
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
    (hdisk :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    C2ExactGapAnchorAnchorResidualMiddleData
      K M horizontalConstant horizontalScale horizontalRatio
      c2ContinuedVerticalAnchorResidualExactUpper near edge :=
  C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapExplicitUpperBudget
    hscale hhorizontal
    ((C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle_iff_phaseDiskOnMiddle
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (near := near)
      (edge := edge)).2 hdisk)

theorem C2ExactGapAnchorAnchorResidualMiddleData.to_phaseDiskMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorAnchorResidualMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    C2ExactGapAnchorPhaseDiskMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge where
  horizontalScale_pos := data.horizontalScale_pos
  horizontalConstant_nonneg := data.horizontalConstant_nonneg
  horizontalRatio_nonneg := data.horizontalRatio_nonneg
  horizontalRatio_lt_one := data.horizontalRatio_lt_one
  horizontal := data.horizontal
  phase_disk :=
    C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
      (C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle
        data.anchor)
      data.phase_disk_budget

theorem C2ExactGapAnchorAnchorResidualMiddleData.to_phaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorAnchorResidualMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge :=
  data.to_phaseDiskMiddleData.to_phaseSavingOnMiddle

theorem C2ExactGapAnchorAnchorResidualMiddleData.to_exactGapExpandedMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorAnchorResidualMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    C2ExactGapAnchorExactGapExpandedMiddleData
      K M horizontalConstant horizontalScale horizontalRatio near edge :=
  data.to_phaseDiskMiddleData.to_exactGapExpandedMiddleData

theorem C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_of_upperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge := by
  intro s hs
  exact
    C2ExactGapAnchorPositiveAllowanceScalarBudget_of_upperBudget
      hs.1 (hgenuine hs) (hcontinued hs)
      (hhorizontal hs) (hcutoff hs) (hbudget hs)

theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceUpperBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorPositiveAllowanceUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      0 <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceScalarBudgetOnMiddle
      (C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_of_upperBudgetOnMiddle
        hgenuine hcontinued hhorizontal hcutoff hbudget)

theorem C2ExactVerticalResidualDominance_of_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hresidual :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  have hbudget :
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s :=
    (exactVerticalScalarBudget_iff_norm_lt_allowance
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      hoff).2 hresidual
  rw [C2ExactVerticalResidualDominance,
    C2RefinedVerticalResidualDominance]
  rw [c2RefinedVerticalResidualUpper_eq_expanded]
  simpa [c2ExactVerticalRectangularResidualNormUpper] using hbudget

theorem C2ExactVerticalResidualDominance_of_upper_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hvertical :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget)
    (hbudget :
      verticalBudget <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactVerticalResidualDominance_of_norm_lt_allowance
    hoff (lt_of_le_of_lt hvertical hbudget)

theorem C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ +
          c2RawCentralCutoffNormConstant K M s <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s :=
  C2ExactVerticalResidualDominance_of_upper_lt_allowance
    hoff
    (c2ExactVerticalResidual_norm_le_anchor_add_cutoff K M s)
    hbudget

theorem C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance hoff
  exact
    (exactVerticalAnchorBudget_iff_norm_lt_allowance
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)).2 hbudget

theorem C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance hoff
  exact lt_of_le_of_lt
    (c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_upper
      hcentralDefect)
    hbudget

theorem C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio
          centralDefectUpper s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply
    C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
      (centralDefectUpper := centralDefectUpper) hoff hcentralDefect
  exact
    (continuedVerticalAnchorBudget_iff_norm_lt_allowance
      (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      (centralDefectUpper := centralDefectUpper)).2 hbudget

theorem C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectTriangleUpper
            genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
      (centralDefectUpper :=
        c2GenuineRebasingDefectTriangleUpper
          genuineCentralUpper continuedCentralUpper)
      hoff
      (c2GenuineRebasingDefect_norm_le_triangleUpper_of_bounds
        hgenuine hcontinued)
      hbudget

theorem C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
      (centralDefectUpper := c2GenuineRebasingDefectExactTriangleUpper)
      hoff
      (c2GenuineRebasingDefect_norm_le_exactTriangleUpper s)
      hbudget

theorem C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_norm
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorExactDefectNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance
      (centralDefectUpper := c2GenuineRebasingDefectExactTriangleUpper)
      hoff
      (c2GenuineRebasingDefect_norm_le_exactTriangleUpper s)
      (by
        simpa [c2ContinuedVerticalAnchorExactDefectNormAllowance]
          using hbudget)

theorem C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddRebasingTriangleUpper
          oddUpper genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply
    C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
      hoff hgenuine hcontinued
  have hupper :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectTriangleUpper
            genuineCentralUpper continuedCentralUpper s ≤
        c2ContinuedAnchorOddRebasingTriangleUpper
          oddUpper genuineCentralUpper continuedCentralUpper s := by
    unfold c2ContinuedAnchorOddRebasingTriangleUpper
    exact add_le_add_left
      (c2ContinuedVerticalAnchorResidual_norm_le_oddUpper hoff hodd)
      _
  exact lt_of_le_of_lt hupper hbudget

theorem C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddGenuineTriangleUpper
          oddUpper genuineCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply
    C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
      (oddUpper := oddUpper)
      (genuineCentralUpper := genuineCentralUpper)
      (continuedCentralUpper := c2ContinuedCentralFromOddUpper oddUpper)
      hoff hodd hgenuine
      (c2ContinuedCentralBound_of_oddChannelBound hoff hodd)
  simpa [c2ContinuedAnchorOddGenuineTriangleUpper] using hbudget

theorem C2ExactVerticalResidualDominance_of_exactOdd_exactDefect_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hbudget :
      c2ContinuedVerticalAnchorExactOddUpper s +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance
    hoff
  have hupper :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectExactTriangleUpper s ≤
        c2ContinuedVerticalAnchorExactOddUpper s +
          c2GenuineRebasingDefectExactTriangleUpper s := by
    exact add_le_add_left
      (c2ContinuedVerticalAnchorResidual_norm_le_exactOddUpper hoff)
      _
  exact lt_of_le_of_lt hupper hbudget

theorem C2ExactVerticalResidualDominance_of_gap_rebasing_triangle_lt_allowance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap : C2ContinuedOddGapBound gapUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      c2ContinuedAnchorGapRebasingTriangleUpper
          gapUpper genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply
    C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
      hoff hgenuine hcontinued
  have hupper :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectTriangleUpper
            genuineCentralUpper continuedCentralUpper s ≤
        c2ContinuedAnchorGapRebasingTriangleUpper
          gapUpper genuineCentralUpper continuedCentralUpper s := by
    unfold c2ContinuedAnchorGapRebasingTriangleUpper
    exact add_le_add
      (c2ContinuedVerticalAnchorResidual_norm_le_gapUpper hoff hgap)
      le_rfl
  exact lt_of_le_of_lt hupper hbudget

theorem C2ExactVerticalResidualDominance_of_oddAnchorFinalBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      C2GenuineOddAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper genuineCentralUpper continuedCentralUpper s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
      hoff hodd hgenuine hcontinued
      (by
        simpa [C2GenuineOddAnchorFinalBudget] using hbudget)

theorem C2ExactVerticalResidualDominance_of_oddAnchorInheritedBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hbudget :
      C2GenuineOddAnchorInheritedBudget
        K M horizontalConstant horizontalScale horizontalRatio
        oddUpper genuineCentralUpper s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance
      hoff hodd hgenuine
      (by
        simpa [C2GenuineOddAnchorInheritedBudget] using hbudget)

theorem C2ExactVerticalResidualDominance_of_gapAnchorFinalBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hgap : C2ContinuedOddGapBound gapUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      C2GenuineGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper genuineCentralUpper continuedCentralUpper s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_gap_rebasing_triangle_lt_allowance
      hoff hgap hgenuine hcontinued
      (by
        simpa [C2GenuineGapAnchorFinalBudget] using hbudget)

theorem C2GenuineOddAnchorLocalData.to_exactVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (data : C2GenuineOddAnchorLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  exact
    C2ExactVerticalResidualDominance_of_oddAnchorInheritedBudget
      data.offCritical data.odd_bound data.genuine_bound data.final_budget

theorem C2ExactVerticalResidualDominance_iff_norm_lt_allowance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    {s : ℂ}
    (hoff : offCriticalStrip s) :
    C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
  constructor
  · intro hdominance
    have hbudget :
        ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
            (1 - ‖q s‖)⁻¹ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s +
          c2RawCentralCutoffNormConstant K M s <
            c2ExpandedQuartetResidualMargin s := by
      rw [C2ExactVerticalResidualDominance,
        C2RefinedVerticalResidualDominance] at hdominance
      rw [c2RefinedVerticalResidualUpper_eq_expanded] at hdominance
      simpa [c2ExactVerticalRectangularResidualNormUpper] using hdominance
    exact
      (exactVerticalScalarBudget_iff_norm_lt_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        hoff).1 hbudget
  · exact C2ExactVerticalResidualDominance_of_norm_lt_allowance hoff

theorem C2ExactVerticalResidualDominance_of_scalarBudget
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hbudget :
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2RefinedVerticalResidualDominance_of_scalarBudget
  simpa [c2ExactVerticalRectangularResidualNormUpper] using hbudget

theorem C2ExactVerticalResidualDominance_of_upperBudgets
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget horizontalBudget cutoffBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hvertical :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget)
    (hbudget :
      ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget <
          c2ExpandedQuartetResidualMargin s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2RefinedVerticalResidualDominance_of_upperBudgets
    (verticalRectangularUpper :=
      c2ExactVerticalRectangularResidualNormUpper K M)
    hoff
  · simpa [c2ExactVerticalRectangularResidualNormUpper] using hvertical
  · exact hhorizontal
  · exact hcutoff
  · exact hbudget

theorem C2ExactVerticalResidualDominance_of_quartetDominance
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hdominance :
      C2RefinedVerticalQuartetDominance
        K M (c2ExactVerticalRectangularResidualNormUpper K M)
        horizontalConstant horizontalScale horizontalRatio s) :
    C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s :=
  C2RefinedVerticalResidualDominance_of_quartetDominance hdominance

theorem C2ExactVerticalResidualDominance_iff_quartetDominance
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) :
    C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s ↔
      C2RefinedVerticalQuartetDominance
        K M (c2ExactVerticalRectangularResidualNormUpper K M)
        horizontalConstant horizontalScale horizontalRatio s :=
  C2RefinedVerticalResidualDominance_iff_quartetDominance
    K M (c2ExactVerticalRectangularResidualNormUpper K M)
    horizontalConstant horizontalScale horizontalRatio s

/-- Genuine central no-cancellation from exact vertical residual dominance. -/
theorem genuineCentralNoCancellation_of_exactVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_refinedVerticalResidualDominance
      hoff
      (c2ExactVerticalRectangularResidualNormUpper_nonneg K M s)
      (C2VerticalRectangularResidualBound_exactNorm K M s)
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound hdominance

/-- Literal genuine `neq zero` from exact vertical residual dominance. -/
theorem genuineCentral_ne_zero_of_exactVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hdominance :
      C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 :=
  genuineCentral_ne_zero_of_refinedVerticalResidualDominance
    hoff
    (c2ExactVerticalRectangularResidualNormUpper_nonneg K M s)
    (C2VerticalRectangularResidualBound_exactNorm K M s)
    hhorizontalScale_pos hhorizontalConstant_nonneg
    hhorizontalRatio_nonneg hhorizontalRatio_lt_one
    hhorizontalLayer_bound hdominance

/-- Genuine no-cancellation from the final residual allowance inequality. -/
theorem genuineCentralNoCancellation_of_exactVerticalResidualNorm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hresidual :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_norm_lt_allowance
        hoff hresidual)

/-- Literal genuine `neq zero` from the final residual allowance inequality. -/
theorem genuineCentral_ne_zero_of_exactVerticalResidualNorm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hresidual :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_norm_lt_allowance
        hoff hresidual)

/-- Genuine no-cancellation after splitting the exact residual into the fixed
vertical anchor plus the cutoff term. -/
theorem genuineCentralNoCancellation_of_anchor_cutoff_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ +
          c2RawCentralCutoffNormConstant K M s <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance
        hoff hbudget)

/-- Literal genuine `neq zero` after splitting the exact residual into the fixed
vertical anchor plus the cutoff term. -/
theorem genuineCentral_ne_zero_of_anchor_cutoff_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ +
          c2RawCentralCutoffNormConstant K M s <
        c2ExactVerticalResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance
        hoff hbudget)

/-- Genuine no-cancellation from the anchor-only allowance inequality. -/
theorem genuineCentralNoCancellation_of_anchor_norm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance
        hoff hbudget)

/-- Literal genuine `neq zero` from the anchor-only allowance inequality. -/
theorem genuineCentral_ne_zero_of_anchor_norm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2VerticalRectangularAnchorResidual s‖ <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance
        hoff hbudget)

/-- Genuine no-cancellation from a continued-anchor budget plus a central
rebasing-defect upper. -/
theorem genuineCentralNoCancellation_of_continued_anchor_defect_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
        (centralDefectUpper := centralDefectUpper)
        hoff hcentralDefect hbudget)

/-- Literal genuine `neq zero` from a continued-anchor budget plus a central
rebasing-defect upper. -/
theorem genuineCentral_ne_zero_of_continued_anchor_defect_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
        (centralDefectUpper := centralDefectUpper)
        hoff hcentralDefect hbudget)

/-- Genuine no-cancellation from the continued-anchor normalized allowance. -/
theorem genuineCentralNoCancellation_of_continued_anchor_norm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio
          centralDefectUpper s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance
        (centralDefectUpper := centralDefectUpper)
        hoff hcentralDefect hbudget)

/-- Literal genuine `neq zero` from the continued-anchor normalized allowance. -/
theorem genuineCentral_ne_zero_of_continued_anchor_norm_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio centralDefectUpper :
      ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hcentralDefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio
          centralDefectUpper s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance
        (centralDefectUpper := centralDefectUpper)
        hoff hcentralDefect hbudget)

/-- Genuine no-cancellation from separated central envelopes for the rebasing
defect. -/
theorem genuineCentralNoCancellation_of_continued_anchor_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectTriangleUpper
            genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
        hoff hgenuine hcontinued hbudget)

/-- Literal genuine `neq zero` from separated central envelopes for the rebasing
defect. -/
theorem genuineCentral_ne_zero_of_continued_anchor_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectTriangleUpper
            genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
        hoff hgenuine hcontinued hbudget)

/-- Genuine no-cancellation using the exact triangular rebasing-defect majorant. -/
theorem genuineCentralNoCancellation_of_continued_anchor_exactDefect
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance
        hoff hbudget)

/-- Literal genuine `neq zero` using the exact triangular rebasing-defect
majorant. -/
theorem genuineCentral_ne_zero_of_continued_anchor_exactDefect
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance
        hoff hbudget)

/-- Genuine no-cancellation from the normalized exact-defect allowance. -/
theorem genuineCentralNoCancellation_of_continued_anchor_exactDefect_norm
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorExactDefectNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_norm
        hoff hbudget)

/-- Literal genuine `neq zero` from the normalized exact-defect allowance. -/
theorem genuineCentral_ne_zero_of_continued_anchor_exactDefect_norm
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2ContinuedVerticalAnchorExactDefectNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_norm
        hoff hbudget)

/-- Genuine no-cancellation from an odd-channel anchor upper plus separated
rebasing envelopes. -/
theorem genuineCentralNoCancellation_of_odd_rebasing_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddRebasingTriangleUpper
          oddUpper genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
        hoff hodd hgenuine hcontinued hbudget)

/-- Literal genuine `neq zero` from an odd-channel anchor upper plus separated
rebasing envelopes. -/
theorem genuineCentral_ne_zero_of_odd_rebasing_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddRebasingTriangleUpper
          oddUpper genuineCentralUpper continuedCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
        hoff hodd hgenuine hcontinued hbudget)

/-- Genuine no-cancellation when the continued-central rebasing envelope is
inherited from the same odd-channel upper. -/
theorem genuineCentralNoCancellation_of_odd_genuine_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddGenuineTriangleUpper
          oddUpper genuineCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance
        hoff hodd hgenuine hbudget)

/-- Literal genuine `neq zero` when the continued-central rebasing envelope is
inherited from the same odd-channel upper. -/
theorem genuineCentral_ne_zero_of_odd_genuine_triangle_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hodd : C2ContinuedOddChannelBound oddUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hbudget :
      c2ContinuedAnchorOddGenuineTriangleUpper
          oddUpper genuineCentralUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance
        hoff hodd hgenuine hbudget)

/-- Genuine no-cancellation from the exact odd-anchor upper and exact
rebasing-defect upper. -/
theorem genuineCentralNoCancellation_of_exactOdd_exactDefect_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      c2ContinuedVerticalAnchorExactOddUpper s +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_exactOdd_exactDefect_lt_allowance
        hoff hbudget)

/-- Literal genuine `neq zero` from the exact odd-anchor upper and exact
rebasing-defect upper. -/
theorem genuineCentral_ne_zero_of_exactOdd_exactDefect_lt_allowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      c2ContinuedVerticalAnchorExactOddUpper s +
          c2GenuineRebasingDefectExactTriangleUpper s <
        c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_exactOdd_exactDefect_lt_allowance
        hoff hbudget)

/-- Genuine no-cancellation from the refined odd-anchor local data package. -/
theorem genuineCentralNoCancellation_of_oddAnchorLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (data : C2GenuineOddAnchorLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      data.offCritical data.horizontalScale_pos
      data.horizontalConstant_nonneg data.horizontalRatio_nonneg
      data.horizontalRatio_lt_one data.horizontalLayer_bound
      data.to_exactVerticalResidualDominance

/-- Literal genuine `neq zero` from the refined odd-anchor local data package. -/
theorem genuineCentral_ne_zero_of_oddAnchorLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (data : C2GenuineOddAnchorLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio
      oddUpper genuineCentralUpper s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      data.offCritical data.horizontalScale_pos
      data.horizontalConstant_nonneg data.horizontalRatio_nonneg
      data.horizontalRatio_lt_one data.horizontalLayer_bound
      data.to_exactVerticalResidualDominance

/-- Genuine no-cancellation from the gap-aware odd-anchor final budget. -/
theorem genuineCentralNoCancellation_of_gapAnchorFinalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hgap : C2ContinuedOddGapBound gapUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      C2GenuineGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper genuineCentralUpper continuedCentralUpper s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_gapAnchorFinalBudget
        hoff hgap hgenuine hcontinued hbudget)

/-- Literal genuine `neq zero` from the gap-aware odd-anchor final budget. -/
theorem genuineCentral_ne_zero_of_gapAnchorFinalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hgap : C2ContinuedOddGapBound gapUpper s)
    (hgenuine : C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget :
      C2GenuineGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper genuineCentralUpper continuedCentralUpper s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_gapAnchorFinalBudget
        hoff hgap hgenuine hcontinued hbudget)

/-- Literal genuine `neq zero` from the exact gap-aware anchor budget. -/
theorem genuineCentral_ne_zero_of_exactGapAnchorFinalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_gapAnchorFinalBudget
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (c2ContinuedOddGapBound_exact s)
      (c2GenuineCentralBound_exact s)
      (c2ContinuedCentralBound_exact s)
      (by
        simpa [C2GenuineExactGapAnchorFinalBudget] using hbudget)

/-- Literal genuine `neq zero` from the pointwise exact-gap expanded package. -/
theorem genuineCentral_ne_zero_of_exactGapAnchorExactGapExpandedLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (data :
      C2ExactGapAnchorExactGapExpandedLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  have hscalar :
      C2ExactGapAnchorGapUpperScalarBudget
        K M horizontalConstant horizontalScale horizontalRatio
        c2ContinuedOddExactGapUpper s :=
    C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget
      data.offCritical data.exact_gap_expanded_budget
  have hfinal :
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s :=
    C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget
      data.offCritical (c2ContinuedOddGapBound_exact s) hscalar
  exact
    genuineCentral_ne_zero_of_exactGapAnchorFinalBudget
      data.offCritical data.horizontalScale_pos
      data.horizontalConstant_nonneg data.horizontalRatio_nonneg
      data.horizontalRatio_lt_one data.horizontalLayer_bound hfinal

/--
Global middle wrapper for the gap-aware anchor route.  The odd norm-only
anchor package is obstructed, so this is the reusable middle target for a
direct bound on the continued odd gap.
-/
theorem genuineCentral_ne_zero_on_middle_of_gapAnchorFinalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper genuineCentralUpper continuedCentralUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedOddGapBound gapUpper s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper genuineCentralUpper continuedCentralUpper s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  intro s hs
  exact
    genuineCentral_ne_zero_of_gapAnchorFinalBudget
      hs.1
      (hhorizontalScale_pos hs)
      (hhorizontalConstant_nonneg hs)
      (hhorizontalRatio_nonneg hs)
      (hhorizontalRatio_lt_one hs)
      ((hhorizontal hs).layer_bound)
      (hgap hs)
      (hgenuine hs)
      (hcontinued hs)
      (hbudget hs)

/--
Global middle wrapper for the exact gap-aware anchor budget.  This leaves a
single pointwise scalar budget as the remaining obligation after the horizontal
middle geometry is supplied.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  intro s hs
  exact
    genuineCentral_ne_zero_of_exactGapAnchorFinalBudget
      hs.1
      (hhorizontalScale_pos hs)
      (hhorizontalConstant_nonneg hs)
      (hhorizontalRatio_nonneg hs)
      (hhorizontalRatio_lt_one hs)
      ((hhorizontal hs).layer_bound)
      (hbudget hs)

/--
Global middle wrapper from a direct phase-saving estimate for the continued odd
gap.  This is the normalized target produced by dividing the exact gap budget
by the positive vertical tail upper.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorAllowance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2GenuineExactGapAnchorFinalBudget_of_exactOddGap_lt_factorAllowance
          hs.1 (hgap hs))

/--
Global middle wrapper using the named exact phase-saving obligation.  This is
the canonical target surface for closing the genuine middle route.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorAllowance
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs => by
        simpa [C2ExactGapAnchorPhaseSaving] using hphase hs)

/--
Global middle wrapper from the phase disk condition centered at `1/2`.  This is
the most geometric current target for the continued odd channel.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDisk
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdisk :
      C2ExactGapAnchorPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle hdisk)

/--
Global middle wrapper from a modular half-disk estimate and its scalar budget.
This is the most flexible current surface for proving the phase disk target.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorHalfDiskBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbound :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDisk
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
        hbound hbudget)

/--
Global middle wrapper from an upper bound on the continued vertical anchor
residual.  The lower envelope for `‖verticalDepthTailFromTwo s‖` converts this
operator-side residual estimate into the half-disk condition for the odd
channel.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2HalfDiskUpperFromAnchor anchorUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorHalfDiskBound
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle
        hanchor)
      hbudget

/--
Global middle wrapper from the exact continued-anchor residual budget.  This
removes the arbitrary `anchorUpper` and leaves one operator-side scalar budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactGapAnchorExactAnchorResidualBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualBound
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      C2ContinuedVerticalAnchorResidualBoundOnMiddle_exact
      (fun {s} hs => by
        simpa [C2ExactGapAnchorExactAnchorResidualBudget] using hbudget hs)

/--
Global middle wrapper from the expanded exact anchor residual inequality.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualNorm
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2VerticalDepthTailLower s *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2ExactGapAnchorExactAnchorResidualBudget_of_norm_lt_lower_mul_allowance
          (hbudget hs))

/--
Global middle wrapper from the lossless operator-side anchor residual budget.
This uses the exact vertical-tail norm, so it avoids the extra lower-envelope
slack in `genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualNorm`.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorPhaseSavingOnMiddle_of_tailNormAnchorResidualBudgetOnMiddle
        hbudget)

/--
Global middle wrapper from the literal lossless operator-side anchor residual
inequality.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExplicitBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        ‖verticalDepthTailFromTwo s‖ *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs => by
        simpa [C2ExactGapAnchorTailNormAnchorResidualBudget] using
          hbudget hs)

/--
Global middle wrapper from a lossless external upper bound on the continued
vertical anchor residual.  This keeps the exact vertical-tail norm in the final
budget and avoids the lower-envelope slack.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualUpperBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_anchorResidualBoundOnMiddle
        hanchor hbudget)

/--
Global middle wrapper from a normalized lossless factor bound for the continued
vertical anchor residual.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualFactorBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hfactor :
      C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle
        anchorFactorUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        anchorFactorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_factorBoundOnMiddle
        hfactor hbudget)

/--
Global middle wrapper from the exact normalized anchor residual factor budget.
This is the most compressed operator-side version of the phase-saving target.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExactFactorBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        c2ContinuedVerticalAnchorResidualExactFactorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualFactorBound
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle_exact hbudget

/--
Global middle wrapper from separated upper/lower scalar data: an external upper
for the exact normalized factor, an external lower for the allowance, and a
strict comparison between them.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorUpperLowerBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hfactor :
      C2ExactGapAnchorExactFactorUpperBoundOnMiddle
        anchorFactorUpper near edge)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        anchorFactorUpper allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExactFactorBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
        hfactor hallow hbudget)

/--
Global middle wrapper from a continued odd-gap upper and the direct scalar
gap-upper budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2GenuineExactGapAnchorFinalBudgetOnMiddle_of_gapUpperScalarBudgetOnMiddle
        hgap hbudget)

/--
Global middle wrapper from a continued odd-gap upper and the fully expanded
gap-upper scalar budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        gapUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      hgap
      (C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_expandedScalarBudgetOnMiddle
        hbudget)

/--
Global middle wrapper from separated external upper estimates for the expanded
gap-upper scalar budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedUpperBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ}
    {tailGapBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (htailGap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      verticalDepthTailUpper s * gapUpper s ≤ tailGapBudget s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoffBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle
        tailGapBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      hgap
      (C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
        htailGap hgenuine hcontinued hhorizontalBudget hcutoffBudget hbudget)

/--
Global middle wrapper from the canonical exact-gap expanded scalar budget.
This is the direct fully expanded scalar target for the genuine middle route.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      c2ContinuedOddGapBoundOnMiddle_exact
      hbudget

/--
Global middle wrapper from canonical exact-gap external upper budgets.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedUpperBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoffBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
        hgenuine hcontinued hhorizontalBudget hcutoffBudget hbudget)

/--
Global middle wrapper from the fully literal expanded exact-gap inequality.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedExplicitBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit
        hbudget)

/-- Global middle `neq zero` from the compressed exact-gap middle data package. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorExactGapExpandedMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
      data.horizontalScale_pos data.horizontalConstant_nonneg
      data.horizontalRatio_nonneg data.horizontalRatio_lt_one
      data.horizontal data.exact_gap_expanded_budget

/-- Global middle `neq zero` from the geometric phase-disk middle package. -/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDiskMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorPhaseDiskMiddleData
        K M horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
      data.to_exactGapExpandedMiddleData

/--
Global middle `neq zero` from the operator-side anchor-residual geometry
package.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (data :
      C2ExactGapAnchorAnchorResidualMiddleData
        K M horizontalConstant horizontalScale horizontalRatio
        anchorUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
      data.to_exactGapExpandedMiddleData

/--
Global middle `neq zero` from the tail-lower distorted exact-gap budget.  This
is the C2 lower-envelope version of the operator-side anchor residual target.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailLowerDistortedGapBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
      (C2ExactGapAnchorAnchorResidualMiddleData.of_tailLowerDistortedGapBudget
        hhorizontalScale_pos hhorizontalConstant_nonneg
        hhorizontalRatio_nonneg hhorizontalRatio_lt_one
        hhorizontal hbudget)

/--
Global middle `neq zero` from scale data, horizontal data, and the tail-lower
distorted exact-gap budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapBudget
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
      C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
      (C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapBudget
        hscale hhorizontal hbudget)

/--
Global middle `neq zero` from scale data, horizontal data, and the explicit
vertical-upper form of the tail-lower distorted exact-gap budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapExplicitUpperBudget
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
      C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
      (C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapExplicitUpperBudget
        hscale hhorizontal hbudget)

/--
Global middle `neq zero` from scale data, horizontal data, and the disk form of
the explicit vertical-upper distorted-gap budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedPhaseDisk
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
    (hdisk :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
      (C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedPhaseDisk
        hscale hhorizontal hdisk)

/--
Global middle `neq zero` from scale data, horizontal data, a half-disk bound
around `1 / 2`, and the distorted scalar budget that pays the explicit vertical
factor.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedHalfDiskBound
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
      C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        halfDiskUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedPhaseDisk
      hscale hhorizontal
      (C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
        hhalf hbudget)

/--
Global middle `neq zero` from scale data, horizontal data, an odd-channel norm
upper, and the distorted scalar budget for the induced metric half-disk.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2HalfDiskUpperFromOddUpper oddUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedHalfDiskBound
      hscale hhorizontal
      (C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle
        hodd)
      hbudget

/--
Global middle `neq zero` from the metric odd-channel half-disk route after
paying the distorted half-disk upper against an allowance lower envelope.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelAllowanceLowerBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper allowanceLower : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
        (c2HalfDiskUpperFromOddUpper oddUpper) allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelBound
      hscale hhorizontal hodd
      (C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
        hallow hbudget)

/--
Global middle `neq zero` from the cleaned metric-payment inequality:
`(1 + ‖q‖) * (1 + 2 * oddUpper) < allowanceLower * (1 - ‖q‖)`.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricPaymentClearedBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper allowanceLower : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
        oddUpper allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelAllowanceLowerBudget
      hscale hhorizontal hodd hallow
      (C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
        hbudget)

/--
Global middle `neq zero` after choosing the canonical odd-metric allowance lower
with a positive payment slack.  The remaining scalar work is that this chosen
allowance lower fits inside the exact vertical-anchor allowance.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hallow :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricPaymentClearedBudget
      hscale hhorizontal hodd
      (C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
        hallow)
      (C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle_of_slackAllowanceLower
        hslack_pos)

/--
Global middle `neq zero` from the fully expanded canonical odd-metric slack
allowance budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hallow :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceBudget
      hscale hhorizontal hodd hslack_pos
      (C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle_of_expandedBudgetOnMiddle
        hallow)

/--
Global middle `neq zero` from external uppers feeding the fully expanded
canonical odd-metric slack allowance budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
    {tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (htailAllowance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
          verticalDepthTailUpper s ≤ tailAllowanceBudget s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
      hscale hhorizontal hodd hslack_pos
      (C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_upperBudgetOnMiddle
        htailAllowance hgenuine hcontinued hhorizontalBudget hcutoff hbudget)

/--
Global middle `neq zero` from the expanded upper route when the tail-allowance
product bound is packaged as an `OnMiddle` predicate.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
    {tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (htailAllowance :
      C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
        oddUpper paymentSlack tailAllowanceBudget near edge)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
      hscale hhorizontal hodd hslack_pos
      (fun {s} hs => htailAllowance (s := s) hs)
      hgenuine hcontinued hhorizontalBudget hcutoff hbudget

/--
Global middle `neq zero` from separate allowance, vertical-tail, and product
envelopes feeding the expanded upper route.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductUpperBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
    {allowanceUpper verticalTailBudget tailAllowanceBudget
      genuineCentralUpper continuedCentralUpper horizontalBudget
      cutoffBudget : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hallow :
      C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle
        oddUpper paymentSlack allowanceUpper near edge)
    (hvertical :
      C2VerticalDepthTailUpperBoundOnMiddle verticalTailBudget near edge)
    (htailProduct :
      C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle
        allowanceUpper verticalTailBudget tailAllowanceBudget near edge)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductBound
      hscale hhorizontal hodd hslack_pos
      (C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_upperBoundsOnMiddle
        hodd (fun {s} hs => le_of_lt (hslack_pos hs))
        hallow hvertical htailProduct)
      hgenuine hcontinued hhorizontalBudget hcutoff hbudget

/--
Global middle `neq zero` from the canonical explicit tail-allowance product
budget feeding the expanded upper route.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductCanonicalBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
    {tailAllowanceBudget genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (htailProduct :
      C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
        oddUpper paymentSlack tailAllowanceBudget near edge)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        tailAllowanceBudget genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductBound
      hscale hhorizontal hodd hslack_pos
      (C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_canonicalBudgetOnMiddle
        htailProduct)
      hgenuine hcontinued hhorizontalBudget hcutoff hbudget

/--
Global middle `neq zero` from the expanded upper route with the tail-allowance
budget specialized to the canonical explicit product.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedCanonicalUpperBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffScale oddUpper paymentSlack : ℂ → ℝ}
    {genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ}
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
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
        (c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
          oddUpper paymentSlack)
        genuineCentralUpper continuedCentralUpper
        horizontalBudget cutoffBudget near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductCanonicalBudget
      hscale hhorizontal hodd hslack_pos
      (C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle_self
        oddUpper paymentSlack near edge)
      hgenuine hcontinued hhorizontalBudget hcutoff hbudget

/--
Global middle `neq zero` from expanded scale data, horizontal data, and the
canonical exact-gap expanded scalar budget.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleData
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
      C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
      (C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData
        hscale hhorizontal hbudget)

/--
Global middle `neq zero` from horizontal data and the exact phase-saving
obligation on the middle.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      ((C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (near := near)
        (edge := edge)).2 hphase)

/--
Global middle `neq zero` from expanded scale data, horizontal data, and the
exact phase-saving obligation on the middle.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataPhaseSavingOnMiddle
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
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
      (C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData_phaseSavingOnMiddle
        hscale hhorizontal hphase)

/--
Global middle `neq zero` from expanded scale data, horizontal data, and the
fully literal exact-gap expanded inequality.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleDataExplicitBudget
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
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalDepthTailUpper s *
              ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
            ‖genuineCentralDoubleSeries s‖ +
            ‖continuedCentralOddChannel s‖ +
            c2RawCentralCutoffNormConstant K M s +
            c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s <
        c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleData
      hscale hhorizontal
      (C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit
        hbudget)

/--
Global middle wrapper from a continued odd-gap upper, a scalar lower budget for
the allowance, and a strict comparison between the two external envelopes.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperAllowanceLowerBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      gapUpper allowanceLower : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hgap :
      C2ContinuedOddGapBoundOnMiddle gapUpper near edge)
    (hallow :
      C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        allowanceLower near edge)
    (hbudget :
      C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
        gapUpper allowanceLower near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperScalarBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      hgap
      (C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
        hallow hbudget)

/--
Global middle wrapper from the fully expanded exact gap-aware anchor budget.
This is the scalar inequality to attack when studying the final phase saving
directly.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExplicitBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
        ‖genuineCentralDoubleSeries s‖ +
        ‖continuedCentralOddChannel s‖ <
          c2ExactVerticalAnchorResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2GenuineExactGapAnchorFinalBudget_of_explicit
          (hbudget hs))

/-- Pointwise genuine no-cancellation from the no-slack scalar residual budget. -/
theorem genuineCentralNoCancellation_of_exactVerticalScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_scalarBudget hbudget)

/-- Literal genuine `neq zero` from the no-slack scalar residual budget. -/
theorem genuineCentral_ne_zero_of_exactVerticalScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hbudget :
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_scalarBudget hbudget)

/-- Pointwise genuine no-cancellation from external upper budgets for the exact
vertical residual, horizontal envelope, and cutoff norm. -/
theorem genuineCentralNoCancellation_of_exactVerticalUpperBudgets
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget horizontalBudget cutoffBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hvertical :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget)
    (hbudget :
      ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget <
          c2ExpandedQuartetResidualMargin s) :
    GenuineCentralNoCancellation s := by
  exact
    genuineCentralNoCancellation_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_upperBudgets
        hoff hvertical hhorizontal hcutoff hbudget)

/-- Literal genuine `neq zero` from external upper budgets for the exact
vertical residual, horizontal envelope, and cutoff norm. -/
theorem genuineCentral_ne_zero_of_exactVerticalUpperBudgets
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    {verticalBudget horizontalBudget cutoffBudget : ℝ}
    (hoff : offCriticalStrip s)
    (hhorizontalScale_pos : 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : horizontalRatio s < 1)
    (hhorizontalLayer_bound : ∀ j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
        (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j)
    (hvertical :
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget)
    (hhorizontal :
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget)
    (hcutoff :
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget)
    (hbudget :
      ((verticalBudget + horizontalBudget) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget + cutoffBudget <
          c2ExpandedQuartetResidualMargin s) :
    genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hoff hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one
      hhorizontalLayer_bound
      (C2ExactVerticalResidualDominance_of_upperBudgets
        hoff hvertical hhorizontal hcutoff hbudget)

/--
Global middle wrapper for the exact-vertical route.  Once exact vertical
residual dominance is supplied pointwise on the middle region, every middle
point has literal genuine central nonvanishing.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  intro s hs
  exact
    genuineCentral_ne_zero_of_exactVerticalResidualDominance
      hs.1
      (hhorizontalScale_pos hs)
      (hhorizontalConstant_nonneg hs)
      (hhorizontalRatio_nonneg hs)
      (hhorizontalRatio_lt_one hs)
      ((hhorizontal hs).layer_bound)
      (hdominance hs)

/--
Global middle wrapper for the exact-vertical scalar budget.  This is the
no-slack counterpart of the raw-triangle scalar wrapper, with the vertical
saldo measured by its actual residual norm.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalScalarBudget
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactVerticalResidualDominance
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2ExactVerticalResidualDominance_of_scalarBudget
          (hbudget hs))

/--
Global middle wrapper for exact-vertical external upper budgets.  This is the
preferred pivot when the raw triangle vertical budget is too coarse.
-/
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalUpperBudgets
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    {verticalBudget horizontalBudget cutoffBudget : ℂ → ℝ}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hvertical : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalBudget s + horizontalBudget s) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget s + cutoffBudget s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0 := by
  exact
    genuineCentral_ne_zero_on_middle_of_exactVerticalResidualDominance
      hhorizontalScale_pos hhorizontalConstant_nonneg
      hhorizontalRatio_nonneg hhorizontalRatio_lt_one hhorizontal
      (fun {s} hs =>
        C2ExactVerticalResidualDominance_of_upperBudgets
          hs.1
          (hvertical hs)
          (hhorizontalBudget hs)
          (hcutoff hs)
          (hbudget hs))

/-- Local middle closure where the raw seed bound is supplied in the native
`C2OddTailBalancingSeedScaledBound` form. -/
theorem genuineCentralNoCancellation_of_localBulkData_rawSeedBudget_rawCutoff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hseed :
      C2OddTailBalancingSeedScaledBound
        coreCutoff K M tiltConstant tiltScale s)
    (hcutoff :
      C2RawCentralCutoffScaledBound K M cutoffConstant cutoffScale s) :
    GenuineCentralNoCancellation s := by
  have hseed' :
      ‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤
        tiltConstant s :=
    c2OddTailBalancingSeed_scaled_bound
      (le_of_lt data.scale.tiltScale_pos) hseed
  exact
    genuineCentralNoCancellation_of_localBulkData_rawBounds
      data hseed' hcutoff

/-- Local middle closure from fully explicit raw seed components plus the raw
central cutoff budget. -/
theorem genuineCentralNoCancellation_of_localBulkData_rawComponentBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale
      verticalRectangularUpper horizontalDefectUpper
      resolventGapUpper : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hgap_nonneg : 0 ≤ resolventGapUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hhorizontal :
      C2OddHorizontalDefectBound
        coreCutoff horizontalDefectUpper s)
    (hgap : C2ResolventGapBound resolventGapUpper s)
    (hseed :
      C2BalancingSeedFactorScaledBound
        verticalRectangularUpper horizontalDefectUpper resolventGapUpper
        tiltConstant tiltScale s)
    (hcutoff :
      C2RawCentralCutoffScaledBound K M cutoffConstant cutoffScale s) :
    GenuineCentralNoCancellation s := by
  have hseedBudget :
      C2OddTailBalancingSeedScaledBound
        coreCutoff K M tiltConstant tiltScale s :=
    c2OddTailBalancingSeed_scaledBound_of_componentBounds
      hvertical_nonneg hgap_nonneg
      (le_of_lt data.scale.tiltScale_pos)
      hvertical hhorizontal hgap hseed
  exact
    genuineCentralNoCancellation_of_localBulkData_rawSeedBudget_rawCutoff
      data hseedBudget hcutoff

/-- Local middle closure where the horizontal defect is read directly from the
local bulk data, leaving only the vertical/rectangular residual, resolvent gap,
combined seed factor, and raw cutoff as external scalar budgets. -/
theorem genuineCentralNoCancellation_of_localBulkData_rawVerticalGapCutoff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale
      verticalRectangularUpper resolventGapUpper : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hgap_nonneg : 0 ≤ resolventGapUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hgap : C2ResolventGapBound resolventGapUpper s)
    (hseed :
      C2BalancingSeedFactorScaledBound
        verticalRectangularUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        resolventGapUpper tiltConstant tiltScale s)
    (hcutoff :
      C2RawCentralCutoffScaledBound K M cutoffConstant cutoffScale s) :
    GenuineCentralNoCancellation s := by
  have hhorizontal :
      C2OddHorizontalDefectBound coreCutoff
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio) s := by
    unfold C2OddHorizontalDefectBound
    unfold c2ConcreteOddHorizontalDefect
    exact
      c2HorizontalRegularizedDefect_bound
        data.scale.horizontalScale_pos data.scale.horizontalConstant_nonneg
        data.scale.horizontalRatio_nonneg data.scale.horizontalRatio_lt_one
        data.horizontal.layer_bound
  exact
    genuineCentralNoCancellation_of_localBulkData_rawComponentBounds
      data hvertical_nonneg hgap_nonneg hvertical hhorizontal hgap hseed
      hcutoff

/-- Same local middle closure with the canonical triangle bound for the
resolvent gap. -/
theorem genuineCentralNoCancellation_of_localBulkData_rawVerticalCutoff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale
      verticalRectangularUpper : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hvertical_nonneg : 0 ≤ verticalRectangularUpper s)
    (hvertical :
      C2VerticalRectangularResidualBound K M verticalRectangularUpper s)
    (hseed :
      C2BalancingSeedFactorScaledBound
        verticalRectangularUpper
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun z => 1 + ‖q z‖)
        tiltConstant tiltScale s)
    (hcutoff :
      C2RawCentralCutoffScaledBound K M cutoffConstant cutoffScale s) :
    GenuineCentralNoCancellation s := by
  have hgap_nonneg : 0 ≤ (fun z : ℂ => 1 + ‖q z‖) s :=
    add_nonneg zero_le_one (norm_nonneg _)
  exact
    genuineCentralNoCancellation_of_localBulkData_rawVerticalGapCutoff
      data hvertical_nonneg hgap_nonneg hvertical
      (c2ResolventGapBound_one_add_norm_q s) hseed hcutoff

/-- Fully explicit local middle closure using the triangle upper for the raw
vertical/rectangular residual. -/
theorem genuineCentralNoCancellation_of_localBulkData_triangleVerticalCutoff
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ} {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s)
    (hseed :
      C2BalancingSeedFactorScaledBound
        (fun z =>
          ‖verticalDepthTailFromTwo z‖ + ‖rectangularGenuine z K M‖ +
            2 * ‖genuineCentralDoubleSeries z‖)
        (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio)
        (fun z => 1 + ‖q z‖)
        tiltConstant tiltScale s)
    (hcutoff :
      C2RawCentralCutoffScaledBound K M cutoffConstant cutoffScale s) :
    GenuineCentralNoCancellation s := by
  have hvertical_nonneg :
      0 ≤
        (fun z : ℂ =>
          ‖verticalDepthTailFromTwo z‖ + ‖rectangularGenuine z K M‖ +
            2 * ‖genuineCentralDoubleSeries z‖) s := by
    exact
      add_nonneg
        (add_nonneg (norm_nonneg _) (norm_nonneg _))
        (mul_nonneg (show (0 : ℝ) ≤ 2 by norm_num) (norm_nonneg _))
  have hvertical :
      C2VerticalRectangularResidualBound K M
        (fun z =>
          ‖verticalDepthTailFromTwo z‖ + ‖rectangularGenuine z K M‖ +
            2 * ‖genuineCentralDoubleSeries z‖) s :=
    c2VerticalRectangularResidualBound_triangle K M s
  exact
    genuineCentralNoCancellation_of_localBulkData_rawVerticalCutoff
      data hvertical_nonneg hvertical hseed hcutoff

end GenuineMiddleAudit
end C2
