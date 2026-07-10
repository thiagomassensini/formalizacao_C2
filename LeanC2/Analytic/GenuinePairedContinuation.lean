import LeanC2.Analytic.GenuineRawTsumObstruction
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Analysis.PSeries

/-!
# A C2-native paired continuation

The construction starts from adjacent odd/even differences.  Its convergence
in `0 < re s` follows from a proved mean-value estimate for real inputs; no
external analytic function is used in the definitions or proofs below.
-/

open Set

namespace C2

/-- Adjacent odd/even Dirichlet difference. -/
noncomputable def c2PairedOddEvenTerm (s : ℂ) (n : ℕ) : ℂ :=
  complexDirichletCoeff s (2 * n + 1) -
    complexDirichletCoeff s (2 * n + 2)

lemma c2PairedOddEvenTerm_eq_cpow (s : ℂ) (n : ℕ) :
    c2PairedOddEvenTerm s n =
      (((2 * n + 1 : ℕ) : ℂ) ^ (-s) -
        ((2 * n + 2 : ℕ) : ℂ) ^ (-s)) := by
  unfold c2PairedOddEvenTerm
  rw [complexDirichletCoeff_eq_cpow_neg s (by omega),
    complexDirichletCoeff_eq_cpow_neg s (by omega)]

/-- Mean-value bound for the positive-real branch of `x ↦ x^(-s)`. -/
lemma cpow_neg_sub_cpow_neg_norm_le
    (s : ℂ) (hs : 0 < s.re) {a b : ℝ} (ha : 0 < a) (hab : a ≤ b) :
    ‖(a : ℂ) ^ (-s) - (b : ℂ) ^ (-s)‖ ≤
      ‖s‖ * a ^ (-s.re - 1) * (b - a) := by
  have hs0 : -s ≠ 0 := by
    intro h
    have hz : s = 0 := neg_eq_zero.mp h
    rw [hz] at hs
    simp at hs
  have hderiv : ∀ x ∈ Icc a b,
      HasDerivWithinAt (fun y : ℝ => (y : ℂ) ^ (-s))
        ((-s) * (x : ℂ) ^ (-s - 1)) (Icc a b) x := by
    intro x hx
    have hxpos : 0 < x := lt_of_lt_of_le ha hx.1
    exact (hasDerivAt_ofReal_cpow_const hxpos.ne' hs0).hasDerivWithinAt
  have hbound : ∀ x ∈ Icc a b,
      ‖(-s) * (x : ℂ) ^ (-s - 1)‖ ≤ ‖s‖ * a ^ (-s.re - 1) := by
    intro x hx
    have hxpos : 0 < x := lt_of_lt_of_le ha hx.1
    rw [norm_mul, norm_neg, Complex.norm_cpow_eq_rpow_re_of_pos hxpos]
    have hre : (-s - 1).re = -s.re - 1 := by simp
    rw [hre]
    exact mul_le_mul_of_nonneg_left
      (Real.rpow_le_rpow_of_nonpos ha hx.1 (by linarith)) (norm_nonneg s)
  have hmv := (convex_Icc a b).norm_image_sub_le_of_norm_hasDerivWithin_le
    hderiv hbound (left_mem_Icc.mpr hab) (right_mem_Icc.mpr hab)
  rw [norm_sub_rev] at hmv
  simpa [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hab)] using hmv

lemma c2PairedOddEvenTerm_norm_le
    (s : ℂ) (hs : 0 < s.re) (n : ℕ) :
    ‖c2PairedOddEvenTerm s n‖ ≤
      ‖s‖ * (((2 * n + 1 : ℕ) : ℝ) ^ (-s.re - 1)) := by
  rw [c2PairedOddEvenTerm_eq_cpow]
  have h := cpow_neg_sub_cpow_neg_norm_le s hs
    (a := ((2 * n + 1 : ℕ) : ℝ)) (b := ((2 * n + 2 : ℕ) : ℝ))
    (by positivity) (by norm_num)
  norm_num at h ⊢
  exact h

/-- The paired family is absolutely summable throughout the open right half-plane. -/
theorem summable_c2PairedOddEvenTerm
    (s : ℂ) (hs : 0 < s.re) :
    Summable (c2PairedOddEvenTerm s) := by
  have hexp : -s.re - 1 < -1 := by linarith
  have hnat : Summable (fun n : ℕ => ((n : ℝ) ^ (-s.re - 1))) :=
    Real.summable_nat_rpow.mpr hexp
  have hinj : Function.Injective (fun n : ℕ => n + 1) := by
    intro a b h
    exact Nat.add_right_cancel h
  have hshift : Summable (fun n : ℕ => (((n + 1 : ℕ) : ℝ) ^ (-s.re - 1))) :=
    hnat.comp_injective hinj
  have hmajor : Summable (fun n : ℕ =>
      ‖s‖ * (((n + 1 : ℕ) : ℝ) ^ (-s.re - 1))) :=
    hshift.mul_left ‖s‖
  apply Summable.of_norm_bounded hmajor
  intro n
  refine (c2PairedOddEvenTerm_norm_le s hs n).trans ?_
  apply mul_le_mul_of_nonneg_left _ (norm_nonneg s)
  apply Real.rpow_le_rpow_of_nonpos (by positivity : (0 : ℝ) < (n + 1 : ℕ))
  · exact_mod_cast (show n + 1 ≤ 2 * n + 1 by omega)
  · linarith

/-- Paired channel, defined only after its right-half-plane summability theorem. -/
noncomputable def c2PairedOddEvenChannel (s : ℂ) : ℂ :=
  ∑' n : ℕ, c2PairedOddEvenTerm s n

/-- The branch-adapted form of `(1-2^(-s))/(1-2^(1-s))`. -/
noncomputable def c2OddContinuationFactor (s : ℂ) : ℂ :=
  (1 - complexDirichletCoeff s 2) /
    (1 - 2 * complexDirichletCoeff s 2)

lemma two_mul_complexDirichletCoeff_two_eq_cpow_one_sub (s : ℂ) :
    (2 : ℂ) * complexDirichletCoeff s 2 = (2 : ℂ) ^ (1 - s) := by
  rw [complexDirichletCoeff_eq_cpow_neg s (by norm_num)]
  calc
    (2 : ℂ) * (2 : ℂ) ^ (-s) =
        (2 : ℂ) ^ (1 : ℂ) * (2 : ℂ) ^ (-s) := by rw [Complex.cpow_one]
    _ = (2 : ℂ) ^ ((1 : ℂ) + (-s)) := by
      rw [Complex.cpow_add (1 : ℂ) (-s) (by norm_num : (2 : ℂ) ≠ 0)]
    _ = (2 : ℂ) ^ (1 - s) := by ring_nf

lemma c2OddContinuationFactor_eq_cpow (s : ℂ) :
    c2OddContinuationFactor s =
      (1 - (2 : ℂ) ^ (-s)) / (1 - (2 : ℂ) ^ (1 - s)) := by
  unfold c2OddContinuationFactor
  rw [two_mul_complexDirichletCoeff_two_eq_cpow_one_sub,
    complexDirichletCoeff_eq_cpow_neg s (by norm_num)]
  norm_num

lemma one_sub_two_mul_complexDirichletCoeff_ne_zero_of_re_lt_one
    (s : ℂ) (hs : s.re < 1) :
    1 - 2 * complexDirichletCoeff s 2 ≠ 0 := by
  have hrpow : (2 : ℝ) * (2 : ℝ) ^ (-s.re) = (2 : ℝ) ^ (1 - s.re) := by
    calc
      (2 : ℝ) * (2 : ℝ) ^ (-s.re) =
          (2 : ℝ) ^ (1 : ℝ) * (2 : ℝ) ^ (-s.re) := by rw [Real.rpow_one]
      _ = (2 : ℝ) ^ ((1 : ℝ) + (-s.re)) := by
        rw [Real.rpow_add (by norm_num : (0 : ℝ) < 2)]
      _ = (2 : ℝ) ^ (1 - s.re) := by ring_nf
  have hnorm : 1 < ‖(2 : ℂ) * complexDirichletCoeff s 2‖ := by
    rw [norm_mul, complexDirichletCoeff_norm_eq_rpow_neg_re s (by norm_num)]
    norm_num
    rw [hrpow]
    exact Real.one_lt_rpow (by norm_num) (by linarith)
  intro hzero
  have hone : (2 : ℂ) * complexDirichletCoeff s 2 = 1 :=
    (sub_eq_zero.mp hzero).symm
  rw [hone, norm_one] at hnorm
  exact (lt_irrefl 1) hnorm

lemma one_sub_two_mul_complexDirichletCoeff_ne_zero_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    1 - 2 * complexDirichletCoeff s 2 ≠ 0 := by
  have hrpow : (2 : ℝ) * (2 : ℝ) ^ (-s.re) = (2 : ℝ) ^ (1 - s.re) := by
    calc
      (2 : ℝ) * (2 : ℝ) ^ (-s.re) =
          (2 : ℝ) ^ (1 : ℝ) * (2 : ℝ) ^ (-s.re) := by rw [Real.rpow_one]
      _ = (2 : ℝ) ^ ((1 : ℝ) + (-s.re)) := by
        rw [Real.rpow_add (by norm_num : (0 : ℝ) < 2)]
      _ = (2 : ℝ) ^ (1 - s.re) := by ring_nf
  have hnorm : ‖(2 : ℂ) * complexDirichletCoeff s 2‖ < 1 := by
    rw [norm_mul, complexDirichletCoeff_norm_eq_rpow_neg_re s (by norm_num)]
    norm_num
    rw [hrpow]
    exact Real.rpow_lt_one_of_one_lt_of_neg (by norm_num) (by linarith)
  intro hzero
  have hone : (2 : ℂ) * complexDirichletCoeff s 2 = 1 :=
    (sub_eq_zero.mp hzero).symm
  rw [hone, norm_one] at hnorm
  exact (lt_irrefl 1) hnorm

theorem c2OddContinuationFactor_den_ne_zero_of_middle
    (s : ℂ) (hs : 0 < s.re ∧ s.re < 1) :
    1 - 2 * complexDirichletCoeff s 2 ≠ 0 :=
  one_sub_two_mul_complexDirichletCoeff_ne_zero_of_re_lt_one s hs.2

theorem one_sub_two_cpow_one_sub_ne_zero_of_middle
    (s : ℂ) (hs : 0 < s.re ∧ s.re < 1) :
    1 - (2 : ℂ) ^ (1 - s) ≠ 0 := by
  rw [← two_mul_complexDirichletCoeff_two_eq_cpow_one_sub]
  exact c2OddContinuationFactor_den_ne_zero_of_middle s hs

/-- The C2-native continued odd channel. -/
noncomputable def c2ContinuedOddChannel (s : ℂ) : ℂ :=
  c2OddContinuationFactor s * c2PairedOddEvenChannel s

lemma summable_positiveDirichletCoeff_norm_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    Summable (fun n : ℕ => ‖complexDirichletCoeff s (n + 1)‖) := by
  have hp : Summable (fun n : ℕ => (n : ℝ) ^ (-s.re)) :=
    Real.summable_nat_rpow.mpr (by linarith)
  have hshift : Summable (fun n : ℕ => ((n + 1 : ℕ) : ℝ) ^ (-s.re)) :=
    hp.comp_injective (by
      intro a b h
      exact Nat.add_right_cancel h)
  exact hshift.congr fun n => by
    rw [complexDirichletCoeff_norm_eq_rpow_neg_re s (by omega)]

lemma summable_positiveDirichletCoeff_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    Summable (fun n : ℕ => complexDirichletCoeff s (n + 1)) :=
  (summable_positiveDirichletCoeff_norm_c2_native_of_one_lt_re s hs).of_norm

lemma summable_oddDirichletCoeff_norm_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    Summable (fun n : ℕ => ‖complexDirichletCoeff s (2 * n + 1)‖) := by
  have hpos := summable_positiveDirichletCoeff_norm_c2_native_of_one_lt_re s hs
  have hcomp := hpos.comp_injective (i := fun n : ℕ => 2 * n) (by
    intro a b h
    have h' : 2 * a = 2 * b := by simpa using h
    omega)
  simpa [Function.comp_def] using hcomp

lemma summable_oddDirichletCoeff_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    Summable (fun n : ℕ => complexDirichletCoeff s (2 * n + 1)) :=
  (summable_oddDirichletCoeff_norm_c2_native_of_one_lt_re s hs).of_norm

lemma summable_evenDirichletCoeff_of_one_lt_re (s : ℂ) (hs : 1 < s.re) :
    Summable (fun n : ℕ => complexDirichletCoeff s (2 * n + 2)) := by
  have hpos := summable_positiveDirichletCoeff_c2_native_of_one_lt_re s hs
  have hcomp := hpos.comp_injective (i := fun n : ℕ => 2 * n + 1) (by
    intro a b h
    have h' : 2 * a + 1 = 2 * b + 1 := by simpa using h
    omega)
  simpa [Function.comp_def] using hcomp

theorem positiveDirichletChannel_eq_odd_add_even_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    positiveDirichletChannel s = oddDirichletChannel s + evenDirichletChannel s := by
  let f : ℕ → ℂ := fun n => complexDirichletCoeff s (n + 1)
  have hf : Summable f := summable_positiveDirichletCoeff_c2_native_of_one_lt_re s hs
  have heven : Summable fun k : ℕ => f (2 * k) :=
    hf.comp_injective (by
      intro a b h
      have h' : 2 * a = 2 * b := by simpa using h
      omega)
  have hodd : Summable fun k : ℕ => f (2 * k + 1) :=
    hf.comp_injective (by
      intro a b h
      have h' : 2 * a + 1 = 2 * b + 1 := by simpa using h
      omega)
  have hsplit := (HasSum.even_add_odd heven.hasSum hodd.hasSum).tsum_eq
  unfold positiveDirichletChannel oddDirichletChannel evenDirichletChannel
  rw [hsplit]
  congr 1

theorem c2PairedOddEvenChannel_eq_odd_sub_even_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    c2PairedOddEvenChannel s =
      oddDirichletChannel s - evenDirichletChannel s := by
  have hodd := summable_oddDirichletCoeff_c2_native_of_one_lt_re s hs
  have heven := summable_evenDirichletCoeff_of_one_lt_re s hs
  have heven' : Summable (fun n : ℕ =>
      complexDirichletCoeff s (2 * (n + 1))) := by
    simpa [Nat.mul_add] using heven
  unfold c2PairedOddEvenChannel oddDirichletChannel evenDirichletChannel
  rw [← hodd.tsum_sub heven']
  apply tsum_congr
  intro n
  simp [c2PairedOddEvenTerm, Nat.mul_add]

theorem oddDirichletChannel_eq_one_sub_coeff_mul_positive_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    oddDirichletChannel s =
      (1 - complexDirichletCoeff s 2) * positiveDirichletChannel s := by
  have hsplit := positiveDirichletChannel_eq_odd_add_even_c2_native_of_one_lt_re s hs
  calc
    oddDirichletChannel s =
        positiveDirichletChannel s - evenDirichletChannel s := by
      rw [hsplit]
      ring
    _ = positiveDirichletChannel s -
          complexDirichletCoeff s 2 * positiveDirichletChannel s := by
      rw [evenDirichletChannel_eq_coeff_two_mul_positive s]
    _ = (1 - complexDirichletCoeff s 2) * positiveDirichletChannel s := by ring

theorem c2PairedOddEvenChannel_eq_den_mul_positive_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    c2PairedOddEvenChannel s =
      (1 - 2 * complexDirichletCoeff s 2) * positiveDirichletChannel s := by
  rw [c2PairedOddEvenChannel_eq_odd_sub_even_of_one_lt_re s hs,
    oddDirichletChannel_eq_one_sub_coeff_mul_positive_of_one_lt_re s hs,
    evenDirichletChannel_eq_coeff_two_mul_positive s]
  ring

theorem genuineCentralDoubleSeries_eq_centralFromOddChannel_c2_native_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    genuineCentralDoubleSeries s = centralFromOddChannel oddDirichletChannel s := by
  have hs0 : 0 < s.re := lt_trans zero_lt_one hs
  have hv : Summable fun j : ℕ => ‖verticalRatio s ^ (j + 2)‖ :=
    summable_verticalDepthTail_norm_of_re_pos s hs0
  have ho : Summable fun n : ℕ => ‖complexDirichletCoeff s (2 * n + 1)‖ :=
    summable_oddDirichletCoeff_norm_c2_native_of_one_lt_re s hs
  have hprod :=
    tsum_mul_tsum_of_summable_norm
      (f := fun j : ℕ => verticalRatio s ^ (j + 2))
      (g := fun n : ℕ => complexDirichletCoeff s (2 * n + 1))
      hv ho
  unfold genuineCentralDoubleSeries centralFromOddChannel
    verticalDepthTailFromTwo oddDirichletChannel
  rw [tsum_mul_left, ← hprod]
  ring

/-- Compatibility with the raw odd channel wherever the latter converges. -/
theorem c2ContinuedOddChannel_eq_oddDirichletChannel_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    c2ContinuedOddChannel s = oddDirichletChannel s := by
  have hden := one_sub_two_mul_complexDirichletCoeff_ne_zero_of_one_lt_re s hs
  rw [oddDirichletChannel_eq_one_sub_coeff_mul_positive_of_one_lt_re s hs]
  unfold c2ContinuedOddChannel c2OddContinuationFactor
  rw [c2PairedOddEvenChannel_eq_den_mul_positive_of_one_lt_re s hs]
  rw [← mul_assoc, div_mul_cancel₀ _ hden]

/-- Genuine central continuation assembled from the paired odd channel. -/
noncomputable def genuineCentralContinuationC2 (s : ℂ) : ℂ :=
  2 * (verticalRatio s ^ 2 / (1 - verticalRatio s)) *
    c2ContinuedOddChannel s

lemma verticalRatio_eq_cpow_neg_one_sub (s : ℂ) :
    verticalRatio s = (2 : ℂ) ^ (-1 - s) := by
  rw [verticalRatio_eq, complexDirichletCoeff_eq_cpow_neg s (by norm_num)]
  calc
    (1 / 2 : ℂ) * (2 : ℂ) ^ (-s) =
        (2 : ℂ) ^ (-1 : ℂ) * (2 : ℂ) ^ (-s) := by
      rw [Complex.cpow_neg_one]
      norm_num
    _ = (2 : ℂ) ^ ((-1 : ℂ) + (-s)) := by
      rw [Complex.cpow_add (-1 : ℂ) (-s) (by norm_num : (2 : ℂ) ≠ 0)]
    _ = (2 : ℂ) ^ (-1 - s) := by ring_nf

theorem genuineCentralContinuationC2_vertical_den_ne_zero
    (s : ℂ) (hs : 0 < s.re) :
    1 - verticalRatio s ≠ 0 :=
  verticalResolvent_den_ne_zero_of_re_pos s hs

/-- Compatibility with the raw central double series on its convergence half-plane. -/
theorem genuineCentralContinuationC2_eq_genuineCentralDoubleSeries_of_one_lt_re
    (s : ℂ) (hs : 1 < s.re) :
    genuineCentralContinuationC2 s = genuineCentralDoubleSeries s := by
  have hs0 : 0 < s.re := lt_trans zero_lt_one hs
  rw [genuineCentralDoubleSeries_eq_centralFromOddChannel_c2_native_of_one_lt_re s hs]
  unfold genuineCentralContinuationC2 centralFromOddChannel
  rw [c2ContinuedOddChannel_eq_oddDirichletChannel_of_one_lt_re s hs,
    verticalDepthTailFromTwo_eq s hs0]
  unfold verticalResolvent
  ring

end C2
