import LeanC2.AuditGenuineMiddle
import Mathlib.Order.Filter.AtTopBot.Prod
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral

/-!
# Audit-only C2 center Gaussian carrier

This file isolates the regularized C2 center carrier in center-address
coordinates.  It is audit-only: it records the carrier, finite rectangles, and
the coordinate bridge to the existing super-Gaussian genuine rectangle.
-/

namespace C2
namespace GenuineMiddleAudit

/-- Center-Gaussian address term in center coordinates:
`2 * 2^(-k) * (2^k * m)^(-s) * exp(-((2^k*m)/X)^2)`. -/
noncomputable def c2CenterGaussianAddressTerm
    (X : ℝ) (s : ℂ) (k m : ℕ) : ℂ :=
  (2 : ℂ) * algebraMap ℚ ℂ (dyadicWeight k) *
    complexDirichletCoeff s (2 ^ k * m) *
      superGaussianCutoffWeight 2 X (2 ^ k * m)

/-- The center-coordinate term is the existing genuine super-Gaussian address
term, after expanding `q(s)^k = 2^(-k) * (2^k)^(-s)`. -/
theorem c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
    (X : ℝ) (s : ℂ) (k m : ℕ) (hm : m ≠ 0) :
    c2CenterGaussianAddressTerm X s k m =
      superGaussianGenuineAddressTerm 2 X s k m := by
  unfold c2CenterGaussianAddressTerm superGaussianGenuineAddressTerm q
  rw [verticalRatio_eq]
  rw [complexDirichletCoeff_mul s
    (pow_ne_zero k (by norm_num : (2 : ℕ) ≠ 0)) hm]
  rw [complexDirichletCoeff_two_pow]
  have hhalf : algebraMap ℚ ℂ ((2 : ℚ)⁻¹) = (1 / 2 : ℂ) := by norm_num
  rw [dyadicWeight_eq_inv_pow, map_pow, hhalf]
  ring

/-- The same coordinate bridge in the direction stated by the audit target. -/
theorem superGaussianGenuineAddressTerm_eq_c2CenterGaussianAddressTerm
    (X : ℝ) (s : ℂ) (k m : ℕ) (hm : m ≠ 0) :
    superGaussianGenuineAddressTerm 2 X s k m =
      c2CenterGaussianAddressTerm X s k m := by
  exact (c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
    X s k m hm).symm

/-- Coordinate identity for the uncut center coefficient. -/
theorem c2_center_coordinate_coeff_eq
    (s : ℂ) (k m : ℕ) (hm : m ≠ 0) :
    (2 : ℂ) * verticalRatio s ^ k * complexDirichletCoeff s m =
      (2 : ℂ) * algebraMap ℚ ℂ (dyadicWeight k) *
        complexDirichletCoeff s (2 ^ k * m) := by
  rw [verticalRatio_eq]
  rw [complexDirichletCoeff_mul s
    (pow_ne_zero k (by norm_num : (2 : ℕ) ≠ 0)) hm]
  rw [complexDirichletCoeff_two_pow]
  have hhalf : algebraMap ℚ ℂ ((2 : ℚ)⁻¹) = (1 / 2 : ℂ) := by norm_num
  rw [dyadicWeight_eq_inv_pow, map_pow, hhalf]
  ring

/-- Finite C2 center-Gaussian rectangle over depths `2 ≤ k ≤ K` and odd cores
`m ≤ M`. -/
noncomputable def c2CenterGaussianRectangle
    (X : ℝ) (s : ℂ) (K M : ℕ) : ℂ :=
  ∑ k ∈ Finset.Icc 2 K, ∑ m ∈ oddCoresUpTo M,
    c2CenterGaussianAddressTerm X s k m

/-- The center-Gaussian rectangle is exactly the existing `p = 2`
super-Gaussian genuine rectangle. -/
theorem c2CenterGaussianRectangle_eq_superGaussianFiniteGenuineRectangle
    (X : ℝ) (s : ℂ) (K M : ℕ) :
    c2CenterGaussianRectangle X s K M =
      superGaussianFiniteGenuineRectangle 2 X s K M := by
  unfold c2CenterGaussianRectangle superGaussianFiniteGenuineRectangle
  refine Finset.sum_congr rfl ?_
  intro k hk
  refine Finset.sum_congr rfl ?_
  intro m hm
  have hmOdd : Odd m := (mem_oddCoresUpTo.mp hm).2
  have hm0 : m ≠ 0 := Nat.ne_of_gt (odd_nat_pos hmOdd)
  exact c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
    X s k m hm0

/-- Infinite audit carrier for the C2 center Gaussian, with the natural
coordinates `k = p.1 + 2` and `m = 2 * p.2 + 1`. -/
noncomputable def c2CenterGaussianSeries (X : ℝ) (s : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ,
    c2CenterGaussianAddressTerm X s (p.1 + 2) (2 * p.2 + 1)

/-- Address-coordinate form of the carrier term on `ℕ × ℕ`. -/
noncomputable def c2CenterGaussianSeriesAddressTerm
    (X : ℝ) (s : ℂ) (p : ℕ × ℕ) : ℂ :=
  c2CenterGaussianAddressTerm X s (p.1 + 2) (2 * p.2 + 1)

/-- Center-address depth coordinate. -/
def c2CenterGaussianAddressDepth (p : ℕ × ℕ) : ℕ :=
  p.1 + 2

/-- Center-address odd core coordinate. -/
def c2CenterGaussianAddressCore (p : ℕ × ℕ) : ℕ :=
  2 * p.2 + 1

/-- Integer center attached to an address. -/
def c2CenterGaussianAddressCenter (p : ℕ × ℕ) : ℕ :=
  2 ^ c2CenterGaussianAddressDepth p * c2CenterGaussianAddressCore p

/-- The core coordinate of a center-Gaussian address is odd. -/
theorem c2CenterGaussianAddressCore_odd (p : ℕ × ℕ) :
    Odd (c2CenterGaussianAddressCore p) := by
  dsimp [c2CenterGaussianAddressCore]
  exact ⟨p.2, by omega⟩

/-- The `v2` of a center recovers the C2 depth coordinate. -/
theorem c2CenterGaussianAddressCenter_v2 (p : ℕ × ℕ) :
    v2 (c2CenterGaussianAddressCenter p) =
      c2CenterGaussianAddressDepth p := by
  unfold c2CenterGaussianAddressCenter
  exact v2_two_pow_mul_of_odd
    (c2CenterGaussianAddressDepth p)
    (c2CenterGaussianAddressCore_odd p)

/-- The C2 center map is injective on address coordinates. -/
theorem c2CenterGaussianAddressCenter_injective :
    Function.Injective c2CenterGaussianAddressCenter := by
  intro p q hcenter
  have hdepth :
      c2CenterGaussianAddressDepth p =
        c2CenterGaussianAddressDepth q := by
    rw [← c2CenterGaussianAddressCenter_v2 p,
      hcenter, c2CenterGaussianAddressCenter_v2 q]
  cases p with
  | mk pDepth pCore =>
    cases q with
    | mk qDepth qCore =>
      have hdepth' : pDepth + 2 = qDepth + 2 := by
        simpa [c2CenterGaussianAddressDepth] using hdepth
      have hDepthCoord : pDepth = qDepth := by
        omega
      subst qDepth
      have hcenter' :
          2 ^ (pDepth + 2) * (2 * pCore + 1) =
            2 ^ (pDepth + 2) * (2 * qCore + 1) := by
        simpa [c2CenterGaussianAddressDepth, c2CenterGaussianAddressCore,
          c2CenterGaussianAddressCenter] using hcenter
      have hcore :
          2 * pCore + 1 = 2 * qCore + 1 := by
        exact Nat.mul_left_cancel
          (Nat.pow_pos (by norm_num : 0 < 2) :
            0 < 2 ^ (pDepth + 2))
          hcenter'
      have hCoreCoord : pCore = qCore := by
        omega
      subst qCore
      rfl

/-- Equality of integer centers is equivalent to equality of C2 addresses. -/
theorem c2CenterGaussianAddressCenter_eq_iff (p q : ℕ × ℕ) :
    c2CenterGaussianAddressCenter p =
      c2CenterGaussianAddressCenter q ↔ p = q := by
  constructor
  · intro h
    exact c2CenterGaussianAddressCenter_injective h
  · intro h
    simp [h]

/-- The integer center quadratically dominates the address coordinates. -/
theorem c2CenterGaussianAddressIndexSum_le_center_sq (p : ℕ × ℕ) :
    p.1 + p.2 ≤ c2CenterGaussianAddressCenter p ^ 2 := by
  let d : ℕ := p.1 + 2
  let m : ℕ := 2 * p.2 + 1
  let c : ℕ := 2 ^ d * m
  have hm_ge_one : 1 ≤ m := by
    dsimp [m]
    omega
  have hpow_ge_one : 1 ≤ 2 ^ d :=
    Nat.one_le_pow d 2 (by norm_num : (0 : ℕ) < 2)
  have hp1_le_c : p.1 ≤ c := by
    have hp1_le_pow : p.1 ≤ 2 ^ p.1 :=
      Nat.le_of_lt Nat.lt_two_pow_self
    have hpow_le_depth : 2 ^ p.1 ≤ 2 ^ d :=
      Nat.pow_le_pow_right (by norm_num : 0 < 2) (by dsimp [d]; omega)
    have hdepth_le_c : 2 ^ d ≤ c := by
      dsimp [c]
      calc
        2 ^ d = 2 ^ d * 1 := by simp
        _ ≤ 2 ^ d * m := Nat.mul_le_mul_left _ hm_ge_one
    exact le_trans hp1_le_pow (le_trans hpow_le_depth hdepth_le_c)
  have hp2_le_c : p.2 ≤ c := by
    have hp2_le_m : p.2 ≤ m := by
      dsimp [m]
      omega
    have hm_le_c : m ≤ c := by
      dsimp [c]
      calc
        m = 1 * m := by simp
        _ ≤ 2 ^ d * m := Nat.mul_le_mul_right _ hpow_ge_one
    exact le_trans hp2_le_m hm_le_c
  have hc_ge_two : 2 ≤ c := by
    have htwo_le_pow : 2 ≤ 2 ^ d := by
      have hd_ge_one : 1 ≤ d := by
        dsimp [d]
        omega
      have hmono : 2 ^ (1 : ℕ) ≤ 2 ^ d :=
        Nat.pow_le_pow_right (by norm_num : 0 < 2) hd_ge_one
      simpa using hmono
    have hpow_le_c : 2 ^ d ≤ c := by
      dsimp [c]
      calc
        2 ^ d = 2 ^ d * 1 := by simp
        _ ≤ 2 ^ d * m := Nat.mul_le_mul_left _ hm_ge_one
    exact le_trans htwo_le_pow hpow_le_c
  have hsum_le : p.1 + p.2 ≤ c + c :=
    Nat.add_le_add hp1_le_c hp2_le_c
  have hdouble_le_sq : c + c ≤ c ^ 2 := by
    calc
      c + c = 2 * c := by omega
      _ ≤ c * c := Nat.mul_le_mul_right c hc_ge_two
      _ = c ^ 2 := by rw [pow_two]
  have hmain : p.1 + p.2 ≤ c ^ 2 :=
    le_trans hsum_le hdouble_le_sq
  simpa [c2CenterGaussianAddressCenter, c2CenterGaussianAddressDepth,
    c2CenterGaussianAddressCore, d, m, c] using hmain

/-- The center-Gaussian series is the `tsum` of its address term. -/
theorem c2CenterGaussianSeries_eq_tsum_addressTerm
    (X : ℝ) (s : ℂ) :
    c2CenterGaussianSeries X s =
      ∑' p : ℕ × ℕ, c2CenterGaussianSeriesAddressTerm X s p := by
  rfl

/-- The center-Gaussian carrier agrees pointwise with the existing
super-Gaussian genuine address family in natural shifted coordinates. -/
theorem c2CenterGaussianSeriesAddressTerm_eq_superGaussian
    (X : ℝ) (s : ℂ) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesAddressTerm X s p =
      superGaussianGenuineAddressTerm 2 X s (p.1 + 2) (2 * p.2 + 1) := by
  unfold c2CenterGaussianSeriesAddressTerm
  exact c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
    X s (p.1 + 2) (2 * p.2 + 1) (by omega)

/-- Existing finite-core summability, restated for the center-Gaussian
rectangle coordinates at fixed horizontal cutoff. -/
theorem summable_c2CenterGaussianFiniteCoreDepthLayer
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Summable fun j : ℕ =>
      ∑ m ∈ oddCoresUpTo M,
        c2CenterGaussianAddressTerm X s (j + 2) m := by
  have hsuper := summable_superGaussianFiniteCoreDepthLayer
    (M := M) (X := X) (s := s) hs
  unfold superGaussianFiniteCoreDepthLayer at hsuper
  have hfun :
      (fun j : ℕ =>
        ∑ m ∈ oddCoresUpTo M,
          c2CenterGaussianAddressTerm X s (j + 2) m) =
        (fun j : ℕ =>
          ∑ m ∈ oddCoresUpTo M,
            superGaussianGenuineAddressTerm 2 X s (j + 2) m) := by
    funext j
    refine Finset.sum_congr rfl ?_
    intro m hm
    have hmOdd : Odd m := (mem_oddCoresUpTo.mp hm).2
    have hm0 : m ≠ 0 := Nat.ne_of_gt (odd_nat_pos hmOdd)
    exact c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
      X s (j + 2) m hm0
  simpa [hfun] using hsuper

/-- Fixed horizontal-core center-Gaussian rectangles converge in depth to the
existing finite-core depth limit.  This is the currently compiled cofinal
convergence theorem already available for finite `M`. -/
theorem tendsto_c2CenterGaussianRectangle_succ_to_finiteCoreDepthLimit
    (M : ℕ) {X : ℝ} {s : ℂ} (hs : 0 < s.re) :
    Filter.Tendsto
      (fun N : ℕ => c2CenterGaussianRectangle X s (N + 1) M)
      Filter.atTop
      (nhds (superGaussianFiniteCoreDepthLimit M X s)) := by
  simpa [c2CenterGaussianRectangle_eq_superGaussianFiniteGenuineRectangle]
    using tendsto_superGaussianFiniteGenuineRectangle_succ_to_finiteCoreDepthLimit
      (M := M) (X := X) (s := s) hs

/-- Product majorant for the full center-Gaussian address family.  Depth is
geometric and the odd coordinate is controlled by the Gaussian cutoff. -/
noncomputable def c2CenterGaussianSeriesNormMajorant
    (X : ℝ) (p : ℕ × ℕ) : ℝ :=
  2 * ((1 / 2 : ℝ) ^ (p.1 + 2)) *
    Real.exp (-(1 / X ^ 2) * ((2 * p.2 + 1 : ℕ) : ℝ))

/-- The `p = 2` cutoff at address `2^k*m` is bounded by an exponential in the
odd-core coordinate. -/
theorem superGaussianCutoffWeight_two_norm_le_core_exp
    {X : ℝ} (hX : 0 < X) (k m : ℕ) (hm : 1 ≤ m) :
    ‖superGaussianCutoffWeight 2 X (2 ^ k * m)‖ ≤
      Real.exp (-(1 / X ^ 2) * (m : ℝ)) := by
  rw [superGaussianCutoffWeight_norm]
  have hX2 : 0 < X ^ 2 := by positivity
  have hpow_ge : (1 : ℕ) ≤ 2 ^ k := by
    exact Nat.one_le_pow k 2 (by norm_num : (0 : ℕ) < 2)
  have hm_le_n_nat : m ≤ 2 ^ k * m := by
    calc
      m = 1 * m := by simp
      _ ≤ 2 ^ k * m := Nat.mul_le_mul_right m hpow_ge
  have hm_le_n_real : (m : ℝ) ≤ ((2 ^ k * m : ℕ) : ℝ) := by
    exact_mod_cast hm_le_n_nat
  have hn_one : (1 : ℝ) ≤ ((2 ^ k * m : ℕ) : ℝ) := by
    exact_mod_cast (le_trans hm hm_le_n_nat)
  have hn_le_sq :
      ((2 ^ k * m : ℕ) : ℝ) ≤ ((2 ^ k * m : ℕ) : ℝ) ^ 2 := by
    nlinarith [mul_self_nonneg (((2 ^ k * m : ℕ) : ℝ) - 1)]
  have hm_le_nsq : (m : ℝ) ≤ ((2 ^ k * m : ℕ) : ℝ) ^ 2 :=
    le_trans hm_le_n_real hn_le_sq
  have hscaled :
      (1 / X ^ 2) * (m : ℝ) ≤ (((2 ^ k * m : ℕ) : ℝ) / X) ^ 2 := by
    calc
      (1 / X ^ 2) * (m : ℝ) = (m : ℝ) / X ^ 2 := by ring
      _ ≤ (((2 ^ k * m : ℕ) : ℝ) ^ 2) / X ^ 2 := by
          exact div_le_div_of_nonneg_right hm_le_nsq (le_of_lt hX2)
      _ = (((2 ^ k * m : ℕ) : ℝ) / X) ^ 2 := by
          field_simp [ne_of_gt hX]
  exact Real.exp_le_exp.mpr (by linarith)

/-- The full center-Gaussian product majorant is summable for positive cutoff
scale. -/
theorem summable_c2CenterGaussianSeriesNormMajorant
    {X : ℝ} (hX : 0 < X) :
    Summable fun p : ℕ × ℕ => c2CenterGaussianSeriesNormMajorant X p := by
  let f : ℕ → ℝ := fun k => 2 * ((1 / 2 : ℝ) ^ (k + 2))
  let g : ℕ → ℝ :=
    fun m => Real.exp (-(1 / X ^ 2) * ((2 * m + 1 : ℕ) : ℝ))
  have hgeom : Summable fun k : ℕ => (1 / 2 : ℝ) ^ k :=
    summable_geometric_of_lt_one (by norm_num) (by norm_num)
  have hshift : Summable fun k : ℕ => (1 / 2 : ℝ) ^ (k + 2) := by
    have hmul := hgeom.mul_left ((1 / 2 : ℝ) ^ 2)
    simpa [pow_add, mul_assoc, mul_comm, mul_left_comm] using hmul
  have hf : Summable f := by
    dsimp [f]
    exact hshift.mul_left 2
  have hc : -(1 / X ^ 2) < 0 := by
    have hpos : 0 < (1 / X ^ 2 : ℝ) := by positivity
    linarith
  have hg : Summable g := by
    dsimp [g]
    refine Real.summable_exp_nat_mul_of_ge (c := -(1 / X ^ 2)) hc ?_
    intro i
    exact_mod_cast (by omega : i ≤ 2 * i + 1)
  have hprod : Summable fun p : ℕ × ℕ => f p.1 * g p.2 :=
    hf.mul_of_nonneg hg
      (fun k => by dsimp [f]; positivity)
      (fun m => by dsimp [g]; positivity)
  simpa [c2CenterGaussianSeriesNormMajorant, f, g, mul_assoc] using hprod

/-- Pointwise norm bound for the full center-Gaussian address family. -/
theorem c2CenterGaussianSeriesAddressTerm_norm_le_majorant
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re)
    (p : ℕ × ℕ) :
    ‖c2CenterGaussianSeriesAddressTerm X s p‖ ≤
      c2CenterGaussianSeriesNormMajorant X p := by
  rw [c2CenterGaussianSeriesAddressTerm_eq_superGaussian]
  rw [superGaussianGenuineAddressTerm_norm_eq]
  let k := p.1 + 2
  let m := 2 * p.2 + 1
  have hm : 1 ≤ m := by dsimp [m]; omega
  have hq : ‖q s‖ ^ k ≤ ((1 / 2 : ℝ) ^ k) := by
    exact pow_le_pow_left₀ (norm_nonneg _)
      (le_of_lt (q_norm_lt_half_of_re_pos hs)) k
  have hcoeff : ‖complexDirichletCoeff s m‖ ≤ 1 :=
    complexDirichletCoeff_norm_le_one_of_re_pos_of_one_le hs hm
  have hcut :
      ‖superGaussianCutoffWeight 2 X (2 ^ k * m)‖ ≤
        Real.exp (-(1 / X ^ 2) * (m : ℝ)) :=
    superGaussianCutoffWeight_two_norm_le_core_exp hX k m hm
  calc
    2 * ‖q s‖ ^ k * ‖complexDirichletCoeff s m‖ *
        ‖superGaussianCutoffWeight 2 X (2 ^ k * m)‖
        ≤ 2 * ((1 / 2 : ℝ) ^ k) * ‖complexDirichletCoeff s m‖ *
            ‖superGaussianCutoffWeight 2 X (2 ^ k * m)‖ := by
          gcongr
    _ ≤ 2 * ((1 / 2 : ℝ) ^ k) * 1 *
            ‖superGaussianCutoffWeight 2 X (2 ^ k * m)‖ := by
          gcongr
    _ ≤ 2 * ((1 / 2 : ℝ) ^ k) * 1 *
            Real.exp (-(1 / X ^ 2) * (m : ℝ)) := by
          gcongr
    _ = c2CenterGaussianSeriesNormMajorant X p := by
          dsimp [c2CenterGaussianSeriesNormMajorant, k, m]
          ring

/-- Absolute summability of the full center-Gaussian carrier in the genuine
right-half geometry. -/
theorem summable_c2CenterGaussianSeriesAddressTerm_norm
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    Summable fun p : ℕ × ℕ =>
      ‖c2CenterGaussianSeriesAddressTerm X s p‖ := by
  exact
    Summable.of_nonneg_of_le
      (fun _ => norm_nonneg _)
      (c2CenterGaussianSeriesAddressTerm_norm_le_majorant hX hs)
      (summable_c2CenterGaussianSeriesNormMajorant hX)

/-- Summability of the full center-Gaussian carrier. -/
theorem summable_c2CenterGaussianSeriesAddressTerm
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    Summable fun p : ℕ × ℕ =>
      c2CenterGaussianSeriesAddressTerm X s p :=
  (summable_c2CenterGaussianSeriesAddressTerm_norm hX hs).of_norm

/-- The center-Gaussian carrier is the sum of its summable address family. -/
theorem hasSum_c2CenterGaussianSeriesAddressTerm
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    HasSum (c2CenterGaussianSeriesAddressTerm X s)
      (c2CenterGaussianSeries X s) := by
  simpa [c2CenterGaussianSeries_eq_tsum_addressTerm]
    using (summable_c2CenterGaussianSeriesAddressTerm hX hs).hasSum

/-- Cofinal finite address rectangles converge to the full center-Gaussian
carrier.  This is the `tsum` convergence statement in rectangle form. -/
theorem tendsto_c2CenterGaussianSeries_finsetRectangles
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    Filter.Tendsto
      (fun P : Finset ℕ × Finset ℕ =>
        ∑ p ∈ P.1 ×ˢ P.2, c2CenterGaussianSeriesAddressTerm X s p)
      Filter.atTop
      (nhds (c2CenterGaussianSeries X s)) := by
  exact
    (hasSum_c2CenterGaussianSeriesAddressTerm hX hs).comp
      Filter.tendsto_finset_prod_atTop

/-!
## Center-cutoff finite carrier

The empirical detector uses a finite cutoff by center `c = 2^k * m`, not a
rectangular cutoff in `(k,m)`.  The next definitions mirror that finite carrier.
-/

/-- Maximum odd core allowed at depth `k` by the center cutoff
`2^k * m + 1 <= nmax`. -/
def c2CenterGaussianCoreBound (nmax k : ℕ) : ℕ :=
  (nmax - 1) / (2 ^ k)

/-- Center-cutoff finite carrier:
depths `2 <= k <= K`, odd cores satisfying `2^k*m + 1 <= nmax`. -/
noncomputable def c2CenterGaussianByCenterCutoff
    (X : ℝ) (s : ℂ) (nmax K : ℕ) : ℂ :=
  ∑ k ∈ Finset.Icc 2 K,
    ∑ m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k),
      c2CenterGaussianAddressTerm X s k m

/-- Membership in the center-cutoff inner core set gives an odd core. -/
theorem c2CenterGaussianByCenterCutoff_inner_odd
    {nmax k m : ℕ}
    (hm : m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k)) :
    Odd m :=
  (mem_oddCoresUpTo.mp hm).2

/-- Membership in the center-cutoff inner core set gives the script-style
center bound `2^k*m + 1 <= nmax`. -/
theorem c2CenterGaussianByCenterCutoff_inner_center_le
    {nmax k m : ℕ}
    (hm : m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k)) :
    2 ^ k * m + 1 ≤ nmax := by
  have hm_le : m ≤ (nmax - 1) / (2 ^ k) :=
    (mem_oddCoresUpTo.mp hm).1
  have hm_odd : Odd m := (mem_oddCoresUpTo.mp hm).2
  have hm_pos : 0 < m := odd_nat_pos hm_odd
  have hpow_pos : 0 < 2 ^ k := pow_pos (by norm_num : (0 : ℕ) < 2) k
  have hmul : m * 2 ^ k ≤ nmax - 1 :=
    (Nat.le_div_iff_mul_le hpow_pos).mp hm_le
  have hmul' : 2 ^ k * m ≤ nmax - 1 := by
    simpa [Nat.mul_comm] using hmul
  have haddr_pos : 0 < 2 ^ k * m := Nat.mul_pos hpow_pos hm_pos
  omega

/-- Conversely, an odd core satisfying the script-style center bound belongs
to the center-cutoff inner core set. -/
theorem c2CenterGaussianByCenterCutoff_inner_mem_of_center_le
    {nmax k m : ℕ} (hm_odd : Odd m)
    (hcenter : 2 ^ k * m + 1 ≤ nmax) :
    m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k) := by
  rw [mem_oddCoresUpTo]
  refine ⟨?_, hm_odd⟩
  have hpow_pos : 0 < 2 ^ k := pow_pos (by norm_num : (0 : ℕ) < 2) k
  have hnmax : 1 ≤ nmax := by omega
  have hcenter' : m * 2 ^ k + 1 ≤ nmax := by
    simpa [Nat.mul_comm] using hcenter
  have hmul : m * 2 ^ k ≤ nmax - 1 :=
    (Nat.le_sub_iff_add_le hnmax).mpr hcenter'
  exact (Nat.le_div_iff_mul_le hpow_pos).mpr hmul

/-- Exact characterization of the script-style inner core set. -/
theorem c2CenterGaussianByCenterCutoff_inner_mem_iff
    {nmax k m : ℕ} :
    m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k) ↔
      Odd m ∧ 2 ^ k * m + 1 ≤ nmax := by
  constructor
  · intro hm
    exact ⟨c2CenterGaussianByCenterCutoff_inner_odd hm,
      c2CenterGaussianByCenterCutoff_inner_center_le hm⟩
  · intro h
    exact c2CenterGaussianByCenterCutoff_inner_mem_of_center_le h.1 h.2

/-- The center-Gaussian address term in explicit `(1/2)^k` notation. -/
theorem c2CenterGaussianAddressTerm_eq_center_pow_formula
    (X : ℝ) (s : ℂ) (k m : ℕ) :
    c2CenterGaussianAddressTerm X s k m =
      (2 : ℂ) * ((1 / 2 : ℂ) ^ k) *
        complexDirichletCoeff s (2 ^ k * m) *
          superGaussianCutoffWeight 2 X (2 ^ k * m) := by
  unfold c2CenterGaussianAddressTerm
  have hhalf : algebraMap ℚ ℂ ((2 : ℚ)⁻¹) = (1 / 2 : ℂ) := by norm_num
  rw [dyadicWeight_eq_inv_pow, map_pow, hhalf]

/-- Rectangle-index inclusion into a sufficiently large center cutoff. -/
theorem c2CenterGaussianRectangle_index_mem_byCenterCutoff
    {K0 M0 nmax K k m : ℕ}
    (hK : K0 ≤ K)
    (hn : 2 ^ K0 * M0 + 1 ≤ nmax)
    (hk : k ∈ Finset.Icc 2 K0)
    (hm : m ∈ oddCoresUpTo M0) :
    k ∈ Finset.Icc 2 K ∧
      m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k) := by
  rw [Finset.mem_Icc] at hk
  have hk_le : k ≤ K0 := hk.2
  have hm_le : m ≤ M0 := (mem_oddCoresUpTo.mp hm).1
  have hm_odd : Odd m := (mem_oddCoresUpTo.mp hm).2
  have hpow : 2 ^ k ≤ 2 ^ K0 := by
    exact pow_le_pow_right₀ (by norm_num : (1 : ℕ) ≤ 2) hk_le
  have hmul : 2 ^ k * m ≤ 2 ^ K0 * M0 :=
    Nat.mul_le_mul hpow hm_le
  constructor
  · rw [Finset.mem_Icc]
    exact ⟨hk.1, le_trans hk_le hK⟩
  · exact
      c2CenterGaussianByCenterCutoff_inner_mem_of_center_le hm_odd
        (by omega)

/-- Address-set form of the center cutoff in the natural `p : Nat × Nat`
coordinates used by the infinite series. -/
def c2CenterGaussianByCenterCutoffAddressSet
    (nmax K : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range (K + 1)) ×ˢ (Finset.range (nmax + 1))).filter
    (fun p : ℕ × ℕ =>
      p.1 + 2 ≤ K ∧
        2 ^ (p.1 + 2) * (2 * p.2 + 1) + 1 ≤ nmax)

/-- Membership in the address-set form of the center cutoff. -/
theorem c2CenterGaussianByCenterCutoffAddressSet_mem_iff
    {nmax K : ℕ} {p : ℕ × ℕ} :
    p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K ↔
      p.1 < K + 1 ∧ p.2 < nmax + 1 ∧
        p.1 + 2 ≤ K ∧
          2 ^ (p.1 + 2) * (2 * p.2 + 1) + 1 ≤ nmax := by
  simp [c2CenterGaussianByCenterCutoffAddressSet, and_assoc]

/-- Center-cutoff finite carrier in the exact address coordinates of
`c2CenterGaussianSeries`. -/
noncomputable def c2CenterGaussianByCenterCutoffAddressSum
    (X : ℝ) (s : ℂ) (nmax K : ℕ) : ℂ :=
  ∑ p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K,
    c2CenterGaussianSeriesAddressTerm X s p

/-- The same center cutoff in `(k,m)` coordinates, flattened into one finite
set.  This is only a finite reindexing aid. -/
def c2CenterGaussianByCenterCutoffKMSet
    (nmax K : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.Icc 2 K) ×ˢ (Finset.range (nmax + 1))).filter
    (fun q : ℕ × ℕ =>
      Odd q.2 ∧ 2 ^ q.1 * q.2 + 1 ≤ nmax)

/-- Membership in the flattened `(k,m)` center cutoff. -/
theorem c2CenterGaussianByCenterCutoffKMSet_mem_iff
    {nmax K : ℕ} {q : ℕ × ℕ} :
    q ∈ c2CenterGaussianByCenterCutoffKMSet nmax K ↔
      q.1 ∈ Finset.Icc 2 K ∧ q.2 < nmax + 1 ∧
        Odd q.2 ∧ 2 ^ q.1 * q.2 + 1 ≤ nmax := by
  simp [c2CenterGaussianByCenterCutoffKMSet, and_assoc]

/-- Flattened `(k,m)` sum for the center cutoff. -/
noncomputable def c2CenterGaussianByCenterCutoffKMSum
    (X : ℝ) (s : ℂ) (nmax K : ℕ) : ℂ :=
  ∑ q ∈ c2CenterGaussianByCenterCutoffKMSet nmax K,
    c2CenterGaussianAddressTerm X s q.1 q.2

/-- The inner odd-core cutoff is exactly the center inequality filter over a
large enough finite range. -/
theorem c2CenterGaussianByCenterCutoff_inner_set_eq
    (nmax k : ℕ) :
    oddCoresUpTo (c2CenterGaussianCoreBound nmax k) =
      (Finset.range (nmax + 1)).filter
        (fun m : ℕ => Odd m ∧ 2 ^ k * m + 1 ≤ nmax) := by
  ext m
  rw [c2CenterGaussianByCenterCutoff_inner_mem_iff]
  simp only [Finset.mem_filter, Finset.mem_range]
  constructor
  · intro h
    refine ⟨?_, h⟩
    have hpow : 1 ≤ 2 ^ k :=
      Nat.one_le_pow k 2 (by norm_num)
    have hmle : m ≤ 2 ^ k * m := by
      calc
        m = 1 * m := by simp
        _ ≤ 2 ^ k * m := Nat.mul_le_mul_right m hpow
    omega
  · intro h
    exact h.2

/-- The nested script-style finite cutoff equals the flattened `(k,m)` sum. -/
theorem c2CenterGaussianByCenterCutoff_eq_kmSum
    (X : ℝ) (s : ℂ) (nmax K : ℕ) :
    c2CenterGaussianByCenterCutoff X s nmax K =
      c2CenterGaussianByCenterCutoffKMSum X s nmax K := by
  unfold c2CenterGaussianByCenterCutoff
    c2CenterGaussianByCenterCutoffKMSum
    c2CenterGaussianByCenterCutoffKMSet
  rw [Finset.sum_filter, Finset.sum_product]
  refine Finset.sum_congr rfl ?_
  intro k _hk
  rw [c2CenterGaussianByCenterCutoff_inner_set_eq nmax k,
    Finset.sum_filter]

/-- Odd-core reconstruction from the natural address coordinate. -/
theorem c2CenterGaussian_odd_reconstruct
    (m : ℕ) (hm : Odd m) :
    2 * ((m - 1) / 2) + 1 = m := by
  rcases hm with ⟨a, rfl⟩
  omega

/-- The flattened `(k,m)` cutoff and the natural address-coordinate cutoff
are the same finite sum. -/
theorem c2CenterGaussianByCenterCutoffKMSum_eq_addressSum
    (X : ℝ) (s : ℂ) (nmax K : ℕ) :
    c2CenterGaussianByCenterCutoffKMSum X s nmax K =
      c2CenterGaussianByCenterCutoffAddressSum X s nmax K := by
  unfold c2CenterGaussianByCenterCutoffKMSum
    c2CenterGaussianByCenterCutoffAddressSum
  refine Finset.sum_bij
    (fun q _hq => (q.1 - 2, (q.2 - 1) / 2))
    ?hmem ?hinj ?hsurj ?hterm
  · intro q hq
    rw [c2CenterGaussianByCenterCutoffKMSet_mem_iff] at hq
    rw [c2CenterGaussianByCenterCutoffAddressSet_mem_iff]
    have hk2 : 2 ≤ q.1 := by
      rw [Finset.mem_Icc] at hq
      exact hq.1.1
    have hkK : q.1 ≤ K := by
      rw [Finset.mem_Icc] at hq
      exact hq.1.2
    have hodd : Odd q.2 := hq.2.2.1
    have hrecon := c2CenterGaussian_odd_reconstruct q.2 hodd
    refine ⟨?_, ?_, ?_, ?_⟩
    · change q.1 - 2 < K + 1
      omega
    · change (q.2 - 1) / 2 < nmax + 1
      have hq2lt : q.2 < nmax + 1 := hq.2.1
      omega
    · change q.1 - 2 + 2 ≤ K
      omega
    · change
        2 ^ (q.1 - 2 + 2) * (2 * ((q.2 - 1) / 2) + 1) + 1
          ≤ nmax
      simpa [hrecon, Nat.sub_add_cancel hk2] using hq.2.2.2
  · intro a ha b hb hab
    rw [c2CenterGaussianByCenterCutoffKMSet_mem_iff] at ha hb
    have ha2 : 2 ≤ a.1 := by
      rw [Finset.mem_Icc] at ha
      exact ha.1.1
    have hb2 : 2 ≤ b.1 := by
      rw [Finset.mem_Icc] at hb
      exact hb.1.1
    have haodd : Odd a.2 := ha.2.2.1
    have hbodd : Odd b.2 := hb.2.2.1
    have h1 : a.1 = b.1 := by
      have hfst := congrArg Prod.fst hab
      dsimp at hfst
      omega
    have h2 : a.2 = b.2 := by
      have hsnd := congrArg Prod.snd hab
      dsimp at hsnd
      have ra := c2CenterGaussian_odd_reconstruct a.2 haodd
      have rb := c2CenterGaussian_odd_reconstruct b.2 hbodd
      omega
    exact Prod.ext h1 h2
  · intro p hp
    refine ⟨(p.1 + 2, 2 * p.2 + 1), ?_, ?_⟩
    · rw [c2CenterGaussianByCenterCutoffKMSet_mem_iff]
      rw [c2CenterGaussianByCenterCutoffAddressSet_mem_iff] at hp
      refine ⟨?_, ?_, ?_, ?_⟩
      · rw [Finset.mem_Icc]
        exact ⟨by omega, hp.2.2.1⟩
      · have hcenter := hp.2.2.2
        have hpow : 1 ≤ 2 ^ (p.1 + 2) :=
          Nat.one_le_pow (p.1 + 2) 2 (by norm_num)
        have hmle :
            2 * p.2 + 1 ≤
              2 ^ (p.1 + 2) * (2 * p.2 + 1) := by
          calc
            2 * p.2 + 1 = 1 * (2 * p.2 + 1) := by simp
            _ ≤ 2 ^ (p.1 + 2) * (2 * p.2 + 1) :=
              Nat.mul_le_mul_right (2 * p.2 + 1) hpow
        omega
      · exact ⟨p.2, rfl⟩
      · exact hp.2.2.2
    · change (p.1 + 2 - 2, (2 * p.2 + 1 - 1) / 2) = p
      ext <;> omega
  · intro q hq
    rw [c2CenterGaussianByCenterCutoffKMSet_mem_iff] at hq
    have hk2 : 2 ≤ q.1 := by
      rw [Finset.mem_Icc] at hq
      exact hq.1.1
    have hodd : Odd q.2 := hq.2.2.1
    have hrecon := c2CenterGaussian_odd_reconstruct q.2 hodd
    unfold c2CenterGaussianSeriesAddressTerm
    rw [Nat.sub_add_cancel hk2, hrecon]

/-- The script-style `(k,m)` center cutoff is exactly the address-coordinate
finite carrier. -/
theorem c2CenterGaussianByCenterCutoff_eq_addressSum
    (X : ℝ) (s : ℂ) (nmax K : ℕ) :
    c2CenterGaussianByCenterCutoff X s nmax K =
      c2CenterGaussianByCenterCutoffAddressSum X s nmax K := by
  exact
    (c2CenterGaussianByCenterCutoff_eq_kmSum X s nmax K).trans
      (c2CenterGaussianByCenterCutoffKMSum_eq_addressSum X s nmax K)

/-- Any finite set of addresses is eventually contained in the diagonal
center-cutoff address set. -/
theorem tendsto_c2CenterGaussianByCenterCutoffAddressSet_diag :
    Filter.Tendsto
      (fun N : ℕ => c2CenterGaussianByCenterCutoffAddressSet N N)
      Filter.atTop Filter.atTop := by
  rw [Filter.tendsto_atTop_atTop]
  intro P
  let required : ℕ × ℕ → ℕ := fun p =>
    max (p.1 + 2)
      (max p.2 (2 ^ (p.1 + 2) * (2 * p.2 + 1) + 1))
  refine ⟨P.sup required, ?_⟩
  intro N hN p hp
  have hreq : required p ≤ P.sup required := Finset.le_sup hp
  have hreqN : required p ≤ N := le_trans hreq hN
  have hk : p.1 + 2 ≤ N := by
    exact le_trans (le_max_left _ _) hreqN
  have hp2 : p.2 ≤ N := by
    exact le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) hreqN
  have hcenter :
      2 ^ (p.1 + 2) * (2 * p.2 + 1) + 1 ≤ N := by
    exact le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) hreqN
  rw [c2CenterGaussianByCenterCutoffAddressSet_mem_iff]
  exact ⟨by omega, by omega, hk, hcenter⟩

/-- The diagonal center-cutoff address sums converge to the full center
Gaussian carrier. -/
theorem tendsto_c2CenterGaussianByCenterCutoffAddressSum_diag
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    Filter.Tendsto
      (fun N : ℕ => c2CenterGaussianByCenterCutoffAddressSum X s N N)
      Filter.atTop
      (nhds (c2CenterGaussianSeries X s)) := by
  exact
    (hasSum_c2CenterGaussianSeriesAddressTerm hX hs).comp
      tendsto_c2CenterGaussianByCenterCutoffAddressSet_diag

/-- Conditional diagonal convergence for the `k,m` center-cutoff carrier.
The only remaining bridge is the finite reindexing between odd cores `m` and
address coordinates `p.2`. -/
theorem tendsto_c2CenterGaussianByCenterCutoff_diag_of_addressSum_eq
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re)
    (heq : ∀ N : ℕ,
      c2CenterGaussianByCenterCutoff X s N N =
        c2CenterGaussianByCenterCutoffAddressSum X s N N) :
    Filter.Tendsto
      (fun N : ℕ => c2CenterGaussianByCenterCutoff X s N N)
      Filter.atTop
      (nhds (c2CenterGaussianSeries X s)) := by
  have haddr :=
    tendsto_c2CenterGaussianByCenterCutoffAddressSum_diag
      (X := X) (s := s) hX hs
  convert haddr using 1
  ext N
  exact heq N

/-- The script-style diagonal center cutoff converges to the full center
Gaussian carrier. -/
theorem tendsto_c2CenterGaussianByCenterCutoff_diag
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) :
    Filter.Tendsto
      (fun N : ℕ => c2CenterGaussianByCenterCutoff X s N N)
      Filter.atTop
      (nhds (c2CenterGaussianSeries X s)) := by
  exact
    tendsto_c2CenterGaussianByCenterCutoff_diag_of_addressSum_eq
      (X := X) (s := s) hX hs
      (fun N => c2CenterGaussianByCenterCutoff_eq_addressSum X s N N)

/-!
## Tail budget for the center-cutoff carrier

The numerical certificate compares the finite full-depth center cutoff with the
infinite `c2CenterGaussianSeries`.  The next definitions isolate the exact
Lean-side tail budget: the norm of the omitted address terms outside the finite
center-cutoff set.
-/

/-- Exact norm-tail upper attached to a finite center cutoff.  This is still an
infinite `tsum`; scalar/integral estimates are supplied as a later layer. -/
noncomputable def c2CenterGaussianCenterCutoffTailNormUpper
    (X : ℝ) (s : ℂ) (nmax K : ℕ) : ℝ :=
  ∑' p : ℕ × ℕ,
    Set.indicator
      ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
        : Set (ℕ × ℕ))
      (fun p => ‖c2CenterGaussianSeriesAddressTerm X s p‖) p

/-- Product-majorant tail outside a finite center cutoff.  This is the next
explicit layer above `c2CenterGaussianCenterCutoffTailNormUpper`. -/
noncomputable def c2CenterGaussianCenterCutoffMajorantTail
    (X : ℝ) (nmax K : ℕ) : ℝ :=
  ∑' p : ℕ × ℕ,
    Set.indicator
      ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
        : Set (ℕ × ℕ))
      (c2CenterGaussianSeriesNormMajorant X) p

/-- Sharp center-based majorant at a fixed lower real-part `sigma`.  Unlike
`c2CenterGaussianSeriesNormMajorant`, this keeps the true center
`c = 2^(p.1+2) * (2*p.2+1)` in both the Dirichlet size and the Gaussian
cutoff. -/
noncomputable def c2CenterGaussianSeriesSigmaMajorant
    (X sigma : ℝ) (p : ℕ × ℕ) : ℝ :=
  let k : ℕ := p.1 + 2
  let m : ℕ := 2 * p.2 + 1
  let c : ℕ := 2 ^ k * m
  2 * ((1 / 2 : ℝ) ^ k) * ((c : ℝ) ^ (-sigma)) *
    Real.exp (-(((c : ℝ) / X) ^ 2))

/-- Center-cutoff tail built from the sharp center-based `sigma` majorant. -/
noncomputable def c2CenterGaussianCenterCutoffSigmaTail
    (X sigma : ℝ) (nmax K : ℕ) : ℝ :=
  ∑' p : ℕ × ℕ,
    Set.indicator
      ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
        : Set (ℕ × ℕ))
      (c2CenterGaussianSeriesSigmaMajorant X sigma) p

/-- Full-depth condition for a center cutoff: every address whose center is
inside the `nmax` cutoff is already within the depth cutoff `K`. -/
def C2CenterGaussianFullDepthCutoff (nmax K : ℕ) : Prop :=
  ∀ p : ℕ × ℕ,
    c2CenterGaussianAddressCenter p + 1 ≤ nmax →
      c2CenterGaussianAddressDepth p ≤ K

/-- A convenient sufficient condition for full depth: if `nmax` is below the
next dyadic layer after `K`, then any center below `nmax` must have depth at
most `K`. -/
theorem C2CenterGaussianFullDepthCutoff.of_nmax_le_two_pow_succ
    {nmax K : ℕ} (hnmax : nmax ≤ 2 ^ (K + 1)) :
    C2CenterGaussianFullDepthCutoff nmax K := by
  intro p hcenter
  by_contra hnot
  have hKdepth : K + 1 ≤ c2CenterGaussianAddressDepth p := by
    omega
  have hpow_le :
      2 ^ (K + 1) ≤ 2 ^ c2CenterGaussianAddressDepth p :=
    pow_le_pow_right₀ (by norm_num : (1 : ℕ) ≤ 2) hKdepth
  have hcore_pos : 0 < c2CenterGaussianAddressCore p := by
    dsimp [c2CenterGaussianAddressCore]
    omega
  have hcenter_ge_pow :
      2 ^ c2CenterGaussianAddressDepth p ≤
        c2CenterGaussianAddressCenter p := by
    dsimp [c2CenterGaussianAddressCenter]
    calc
      2 ^ c2CenterGaussianAddressDepth p
          = 2 ^ c2CenterGaussianAddressDepth p * 1 := by simp
      _ ≤ 2 ^ c2CenterGaussianAddressDepth p *
            c2CenterGaussianAddressCore p :=
          Nat.mul_le_mul_left _ (Nat.succ_le_of_lt hcore_pos)
  omega

/-- Sharp `sigma` tail after the center threshold `nmax`, independent of a
separate depth cutoff. -/
noncomputable def c2CenterGaussianCenterThresholdSigmaTail
    (X sigma : ℝ) (nmax : ℕ) : ℝ :=
  ∑' p : ℕ × ℕ,
    Set.indicator
      ({p | nmax < c2CenterGaussianAddressCenter p + 1}
        : Set (ℕ × ℕ))
      (c2CenterGaussianSeriesSigmaMajorant X sigma) p

/-- Scalar center majorant obtained by forgetting the dyadic depth weight,
using only the integer center.  Since every center address has depth at least
`2`, the C2 weight `2 * (1/2)^k` is bounded by `1/2`. -/
noncomputable def c2CenterGaussianSeriesScalarCenterMajorant
    (X sigma : ℝ) (p : ℕ × ℕ) : ℝ :=
  let c : ℕ := c2CenterGaussianAddressCenter p
  (1 / 2 : ℝ) * ((c : ℝ) ^ (-sigma)) *
    Real.exp (-(((c : ℝ) / X) ^ 2))

/-- Scalar center-threshold tail.  This is the layer intended to be compared
next with a one-dimensional integral tail in the integer center variable. -/
noncomputable def c2CenterGaussianCenterThresholdScalarTail
    (X sigma : ℝ) (nmax : ℕ) : ℝ :=
  ∑' p : ℕ × ℕ,
    Set.indicator
      ({p | nmax < c2CenterGaussianAddressCenter p + 1}
        : Set (ℕ × ℕ))
      (c2CenterGaussianSeriesScalarCenterMajorant X sigma) p

/-- One-dimensional scalar kernel used for the crude center-integral tail.
It forgets the C2 multiplicity and keeps only the integer center variable. -/
noncomputable def c2CenterGaussianCrudeIntegralKernel
    (X sigma : ℝ) (x : ℝ) : ℝ :=
  (1 / 2 : ℝ) * x ^ (-sigma) *
    Real.exp (-((x / X) ^ 2))

/-- Shifted natural-center scalar tail starting at `nmax`.  This is the
intermediate ordinary integer series between the C2 address tail and the
integral tail. -/
noncomputable def c2CenterGaussianCrudeNaturalTail
    (X sigma : ℝ) (nmax : ℕ) : ℝ :=
  ∑' i : ℕ,
    c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)

/-- Crude integral tail used for the finite-to-infinite lift. -/
noncomputable def c2CenterGaussianCrudeIntegralTail
    (X sigma : ℝ) (nmax : ℕ) : ℝ :=
  ∫ x : ℝ in Set.Ioi ((nmax : ℝ) - 1),
    c2CenterGaussianCrudeIntegralKernel X sigma x

/-- The address scalar majorant is exactly the crude kernel evaluated at the
integer center of the address. -/
theorem c2CenterGaussianSeriesScalarCenterMajorant_eq_crudeKernel
    (X sigma : ℝ) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesScalarCenterMajorant X sigma p =
      c2CenterGaussianCrudeIntegralKernel X sigma
        (c2CenterGaussianAddressCenter p : ℝ) := by
  rfl

/-- Product exponential majorant used only to prove summability of the scalar
center majorant. -/
noncomputable def c2CenterGaussianSeriesScalarProductMajorant
    (X : ℝ) (p : ℕ × ℕ) : ℝ :=
  (1 / 2 : ℝ) *
    Real.exp (-(1 / X ^ 2) * (p.1 : ℝ)) *
      Real.exp (-(1 / X ^ 2) * (p.2 : ℝ))

/-- The sharp center-based majorant is nonnegative. -/
theorem c2CenterGaussianSeriesSigmaMajorant_nonneg
    (X sigma : ℝ) (p : ℕ × ℕ) :
    0 ≤ c2CenterGaussianSeriesSigmaMajorant X sigma p := by
  dsimp [c2CenterGaussianSeriesSigmaMajorant]
  positivity

/-- The scalar center majorant is nonnegative. -/
theorem c2CenterGaussianSeriesScalarCenterMajorant_nonneg
    (X sigma : ℝ) (p : ℕ × ℕ) :
    0 ≤ c2CenterGaussianSeriesScalarCenterMajorant X sigma p := by
  dsimp [c2CenterGaussianSeriesScalarCenterMajorant]
  positivity

/-- The crude scalar kernel is nonnegative. -/
theorem c2CenterGaussianCrudeIntegralKernel_nonneg
    (X sigma x : ℝ) (hx : 0 ≤ x) :
    0 ≤ c2CenterGaussianCrudeIntegralKernel X sigma x := by
  dsimp [c2CenterGaussianCrudeIntegralKernel]
  have hxpow : 0 ≤ x ^ (-sigma) := Real.rpow_nonneg hx _
  positivity

/-- On any positive ray, the crude scalar kernel is antitone when
`sigma ≥ 0`. -/
theorem c2CenterGaussianCrudeIntegralKernel_antitoneOn_Ici
    {X sigma a : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (ha : 0 < a) :
    AntitoneOn (c2CenterGaussianCrudeIntegralKernel X sigma)
      (Set.Ici a) := by
  intro x hx y hy hxy
  have hxpos : 0 < x := lt_of_lt_of_le ha hx
  have hypos : 0 < y := lt_of_lt_of_le ha hy
  have hpow :
      y ^ (-sigma) ≤ x ^ (-sigma) := by
    have hrpow :=
      Real.antitoneOn_rpow_Ioi_of_exponent_nonpos
        (r := -sigma) (by linarith)
    exact hrpow hxpos hypos hxy
  have hdiv : x / X ≤ y / X := by
    exact div_le_div_of_nonneg_right hxy (le_of_lt hX)
  have hxdiv_nonneg : 0 ≤ x / X := by
    exact div_nonneg (le_of_lt hxpos) (le_of_lt hX)
  have hydiv_nonneg : 0 ≤ y / X := le_trans hxdiv_nonneg hdiv
  have hsq : (x / X) ^ 2 ≤ (y / X) ^ 2 := by
    have hmul :=
      mul_le_mul hdiv hdiv hxdiv_nonneg hydiv_nonneg
    nlinarith
  have hexp :
      Real.exp (-((y / X) ^ 2)) ≤
        Real.exp (-((x / X) ^ 2)) := by
    exact Real.exp_le_exp.mpr (by linarith)
  dsimp [c2CenterGaussianCrudeIntegralKernel]
  gcongr

/-- The crude scalar kernel is integrable on any positive tail when
`sigma < 1`.  The condition is harmless for the zero boxes, where
`sigma_min = 0.498`. -/
theorem integrableOn_c2CenterGaussianCrudeIntegralKernel_Ioi
    {X sigma a : ℝ} (hX : 0 < X) (hsigma : sigma < 1) (ha : 0 ≤ a) :
    MeasureTheory.IntegrableOn
      (c2CenterGaussianCrudeIntegralKernel X sigma) (Set.Ioi a) := by
  have hb : 0 < (1 / X ^ 2 : ℝ) := by positivity
  have hbase0 :
      MeasureTheory.IntegrableOn
        (fun x : ℝ =>
          x ^ (-sigma) * Real.exp (-(1 / X ^ 2) * x ^ 2))
        (Set.Ioi 0) := by
    exact integrableOn_rpow_mul_exp_neg_mul_sq
      (b := 1 / X ^ 2) hb (s := -sigma) (by linarith)
  have hbasea :
      MeasureTheory.IntegrableOn
        (fun x : ℝ =>
          x ^ (-sigma) * Real.exp (-(1 / X ^ 2) * x ^ 2))
        (Set.Ioi a) := by
    exact hbase0.mono_set (by
      intro x hx
      exact lt_of_le_of_lt ha hx)
  have hconst :
      MeasureTheory.IntegrableOn
        (fun x : ℝ =>
          (1 / 2 : ℝ) *
            (x ^ (-sigma) *
              Real.exp (-(1 / X ^ 2) * x ^ 2)))
        (Set.Ioi a) := by
    change MeasureTheory.Integrable
      (fun x : ℝ =>
        (1 / 2 : ℝ) *
          (x ^ (-sigma) *
            Real.exp (-(1 / X ^ 2) * x ^ 2)))
      (MeasureTheory.volume.restrict (Set.Ioi a))
    exact (show MeasureTheory.Integrable
      (fun x : ℝ =>
        x ^ (-sigma) * Real.exp (-(1 / X ^ 2) * x ^ 2))
      (MeasureTheory.volume.restrict (Set.Ioi a)) from hbasea).const_mul
        (1 / 2 : ℝ)
  refine hconst.congr_fun ?_ measurableSet_Ioi
  intro x hx
  have hXne : X ≠ 0 := ne_of_gt hX
  dsimp [c2CenterGaussianCrudeIntegralKernel]
  have hrewrite :
      -((x / X) ^ 2) = -(1 / X ^ 2) * x ^ 2 := by
    field_simp [hXne]
  rw [hrewrite]
  ring

/-- Integral-test bound for the shifted natural-center scalar tail. -/
theorem c2CenterGaussianCrudeNaturalTail_le_crudeIntegralTail
    {X sigma : ℝ} (hX : 0 < X) (hsigma0 : 0 ≤ sigma)
    (hsigma1 : sigma < 1) {nmax : ℕ} (hnmax : 1 < nmax) :
    c2CenterGaussianCrudeNaturalTail X sigma nmax ≤
      c2CenterGaussianCrudeIntegralTail X sigma nmax := by
  let f : ℕ → ℝ := fun i =>
    c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)
  have hf_nonneg : ∀ i : ℕ, 0 ≤ f i := by
    intro i
    dsimp [f]
    apply c2CenterGaussianCrudeIntegralKernel_nonneg
    positivity
  have hx0_pos : 0 < ((nmax : ℝ) - 1) := by
    have hnreal : (1 : ℝ) < nmax := by exact_mod_cast hnmax
    linarith
  have hx0_nonneg : 0 ≤ ((nmax : ℝ) - 1) := le_of_lt hx0_pos
  have hInt : MeasureTheory.IntegrableOn
      (c2CenterGaussianCrudeIntegralKernel X sigma)
      (Set.Ioi ((nmax : ℝ) - 1)) :=
    integrableOn_c2CenterGaussianCrudeIntegralKernel_Ioi
      (X := X) (sigma := sigma) hX hsigma1 hx0_nonneg
  have hpartial : ∀ M : ℕ,
      (∑ i ∈ Finset.range M, f i) ≤
        c2CenterGaussianCrudeIntegralTail X sigma nmax := by
    intro M
    have hanti : AntitoneOn (c2CenterGaussianCrudeIntegralKernel X sigma)
        (Set.Icc ((nmax : ℝ) - 1) (((nmax : ℝ) - 1) + M)) := by
      intro x hx y hy hxy
      exact c2CenterGaussianCrudeIntegralKernel_antitoneOn_Ici
        (X := X) (sigma := sigma) (a := ((nmax : ℝ) - 1))
        hX hsigma0 hx0_pos hx.1 hy.1 hxy
    have hsum_interval :
        (∑ i ∈ Finset.range M,
          c2CenterGaussianCrudeIntegralKernel X sigma
            (((nmax : ℝ) - 1) + ((i + 1 : ℕ) : ℝ))) ≤
          ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
            c2CenterGaussianCrudeIntegralKernel X sigma x := by
      exact hanti.sum_le_integral
    have hsum_interval' :
        (∑ i ∈ Finset.range M, f i) ≤
          ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
            c2CenterGaussianCrudeIntegralKernel X sigma x := by
      simpa [f, Nat.cast_add, Nat.cast_one, add_assoc, add_comm,
        add_left_comm, sub_eq_add_neg] using hsum_interval
    have htail_nonneg :
        0 ≤ ∫ x : ℝ in Set.Ioi (((nmax : ℝ) - 1) + M),
          c2CenterGaussianCrudeIntegralKernel X sigma x := by
      apply MeasureTheory.integral_nonneg_of_ae
      filter_upwards [MeasureTheory.ae_restrict_mem measurableSet_Ioi]
        with x hx
      have hx_nonneg : 0 ≤ x := by
        have hbase : 0 ≤ ((nmax : ℝ) - 1) + M := by positivity
        exact le_trans hbase (le_of_lt hx)
      exact c2CenterGaussianCrudeIntegralKernel_nonneg X sigma x hx_nonneg
    have hinterval_le :
        ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
            c2CenterGaussianCrudeIntegralKernel X sigma x ≤
          c2CenterGaussianCrudeIntegralTail X sigma nmax := by
      have hM_nonneg : (0 : ℝ) ≤ M := by positivity
      have hsub := intervalIntegral.integral_Ioi_sub_Ioi hInt
        (le_add_of_nonneg_right hM_nonneg)
      dsimp [c2CenterGaussianCrudeIntegralTail]
      linarith
    exact le_trans hsum_interval' hinterval_le
  unfold c2CenterGaussianCrudeNaturalTail
  exact Real.tsum_le_of_sum_range_le hf_nonneg hpartial

/-- Finite partial sums of the shifted natural-center tail are bounded by the
same crude integral tail. -/
theorem c2CenterGaussianCrudeNaturalTail_sum_range_le_crudeIntegralTail
    {X sigma : ℝ} (hX : 0 < X) (hsigma0 : 0 ≤ sigma)
    (hsigma1 : sigma < 1) {nmax : ℕ} (hnmax : 1 < nmax)
    (M : ℕ) :
    (∑ i ∈ Finset.range M,
      c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)) ≤
      c2CenterGaussianCrudeIntegralTail X sigma nmax := by
  let f : ℕ → ℝ := fun i =>
    c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)
  have hx0_pos : 0 < ((nmax : ℝ) - 1) := by
    have hnreal : (1 : ℝ) < nmax := by exact_mod_cast hnmax
    linarith
  have hx0_nonneg : 0 ≤ ((nmax : ℝ) - 1) := le_of_lt hx0_pos
  have hInt : MeasureTheory.IntegrableOn
      (c2CenterGaussianCrudeIntegralKernel X sigma)
      (Set.Ioi ((nmax : ℝ) - 1)) :=
    integrableOn_c2CenterGaussianCrudeIntegralKernel_Ioi
      (X := X) (sigma := sigma) hX hsigma1 hx0_nonneg
  have hanti : AntitoneOn (c2CenterGaussianCrudeIntegralKernel X sigma)
      (Set.Icc ((nmax : ℝ) - 1) (((nmax : ℝ) - 1) + M)) := by
    intro x hx y hy hxy
    exact c2CenterGaussianCrudeIntegralKernel_antitoneOn_Ici
      (X := X) (sigma := sigma) (a := ((nmax : ℝ) - 1))
      hX hsigma0 hx0_pos hx.1 hy.1 hxy
  have hsum_interval :
      (∑ i ∈ Finset.range M,
        c2CenterGaussianCrudeIntegralKernel X sigma
          (((nmax : ℝ) - 1) + ((i + 1 : ℕ) : ℝ))) ≤
        ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
          c2CenterGaussianCrudeIntegralKernel X sigma x := by
    exact hanti.sum_le_integral
  have hsum_interval' :
      (∑ i ∈ Finset.range M, f i) ≤
        ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
          c2CenterGaussianCrudeIntegralKernel X sigma x := by
    simpa [f, Nat.cast_add, Nat.cast_one, add_assoc, add_comm,
      add_left_comm, sub_eq_add_neg] using hsum_interval
  have htail_nonneg :
      0 ≤ ∫ x : ℝ in Set.Ioi (((nmax : ℝ) - 1) + M),
        c2CenterGaussianCrudeIntegralKernel X sigma x := by
    apply MeasureTheory.integral_nonneg_of_ae
    filter_upwards [MeasureTheory.ae_restrict_mem measurableSet_Ioi]
      with x hx
    have hx_nonneg : 0 ≤ x := by
      have hbase : 0 ≤ ((nmax : ℝ) - 1) + M := by positivity
      exact le_trans hbase (le_of_lt hx)
    exact c2CenterGaussianCrudeIntegralKernel_nonneg X sigma x hx_nonneg
  have hinterval_le :
      ∫ x in ((nmax : ℝ) - 1)..((nmax : ℝ) - 1) + M,
          c2CenterGaussianCrudeIntegralKernel X sigma x ≤
        c2CenterGaussianCrudeIntegralTail X sigma nmax := by
    have hM_nonneg : (0 : ℝ) ≤ M := by positivity
    have hsub := intervalIntegral.integral_Ioi_sub_Ioi hInt
      (le_add_of_nonneg_right hM_nonneg)
    dsimp [c2CenterGaussianCrudeIntegralTail]
    linarith
  exact le_trans hsum_interval' hinterval_le

/-- The shifted natural-center tail terms are summable. -/
theorem summable_c2CenterGaussianCrudeNaturalTail_terms
    {X sigma : ℝ} (hX : 0 < X) (hsigma0 : 0 ≤ sigma)
    (hsigma1 : sigma < 1) {nmax : ℕ} (hnmax : 1 < nmax) :
    Summable fun i : ℕ =>
      c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i) := by
  have hf_nonneg : ∀ i : ℕ,
      0 ≤ c2CenterGaussianCrudeIntegralKernel X sigma
        ((nmax : ℝ) + i) := by
    intro i
    apply c2CenterGaussianCrudeIntegralKernel_nonneg
    positivity
  exact summable_of_sum_range_le hf_nonneg
    (fun M =>
      c2CenterGaussianCrudeNaturalTail_sum_range_le_crudeIntegralTail
        (X := X) (sigma := sigma) hX hsigma0 hsigma1 hnmax M)

/-- The C2 center-threshold scalar tail is bounded by the shifted natural
center tail.  This uses only injectivity of the C2 center address. -/
theorem c2CenterGaussianCenterThresholdScalarTail_le_crudeNaturalTail_of_summable
    {X sigma : ℝ} {nmax : ℕ}
    (hg : Summable fun i : ℕ =>
      c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)) :
    c2CenterGaussianCenterThresholdScalarTail X sigma nmax ≤
      c2CenterGaussianCrudeNaturalTail X sigma nmax := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | nmax < c2CenterGaussianAddressCenter p + 1}
  let g : ℕ → ℝ := fun i =>
    c2CenterGaussianCrudeIntegralKernel X sigma ((nmax : ℝ) + i)
  let shift : S → ℕ := fun p =>
    c2CenterGaussianAddressCenter p.1 - nmax
  have hshift_inj : Function.Injective shift := by
    intro a b h
    have haS : a.1 ∈ S := a.2
    have hbS : b.1 ∈ S := b.2
    have ha_ge : nmax ≤ c2CenterGaussianAddressCenter a.1 := by
      dsimp [S] at haS
      omega
    have hb_ge : nmax ≤ c2CenterGaussianAddressCenter b.1 := by
      dsimp [S] at hbS
      omega
    have hcenter : c2CenterGaussianAddressCenter a.1 =
        c2CenterGaussianAddressCenter b.1 := by
      dsimp [shift] at h
      omega
    have hab : a.1 = b.1 :=
      c2CenterGaussianAddressCenter_injective hcenter
    cases a
    cases b
    simp_all
  have hnonneg_g : ∀ i : ℕ, 0 ≤ g i := by
    intro i
    dsimp [g]
    apply c2CenterGaussianCrudeIntegralKernel_nonneg
    positivity
  have hcomp_le :
      (∑' p : S, g (shift p)) ≤ ∑' i : ℕ, g i := by
    exact tsum_comp_le_tsum_of_inj (α := ℕ) (β := S)
      (f := g) hg hnonneg_g hshift_inj
  have haddr_eq :
      c2CenterGaussianCenterThresholdScalarTail X sigma nmax =
        ∑' p : S, g (shift p) := by
    calc
      c2CenterGaussianCenterThresholdScalarTail X sigma nmax
          = ∑' p : ℕ × ℕ,
              S.indicator
                (c2CenterGaussianSeriesScalarCenterMajorant X sigma) p := by
              unfold c2CenterGaussianCenterThresholdScalarTail
              rfl
      _ = ∑' p : S,
              c2CenterGaussianSeriesScalarCenterMajorant X sigma p.1 := by
              rw [← tsum_subtype]
      _ = ∑' p : S, g (shift p) := by
              apply tsum_congr
              intro p
              have hpS : p.1 ∈ S := p.2
              have hp_ge :
                  nmax ≤ c2CenterGaussianAddressCenter p.1 := by
                dsimp [S] at hpS
                omega
              dsimp [g, shift]
              rw [c2CenterGaussianSeriesScalarCenterMajorant_eq_crudeKernel]
              congr 1
              exact_mod_cast (Nat.add_sub_of_le hp_ge).symm
  calc
    c2CenterGaussianCenterThresholdScalarTail X sigma nmax
        = ∑' p : S, g (shift p) := haddr_eq
    _ ≤ ∑' i : ℕ, g i := hcomp_le
    _ = c2CenterGaussianCrudeNaturalTail X sigma nmax := by
          unfold c2CenterGaussianCrudeNaturalTail
          rfl

/-- The C2 center-threshold scalar tail is bounded by the shifted natural
center tail under the same hypotheses used for the integral test. -/
theorem c2CenterGaussianCenterThresholdScalarTail_le_crudeNaturalTail
    {X sigma : ℝ} (hX : 0 < X) (hsigma0 : 0 ≤ sigma)
    (hsigma1 : sigma < 1) {nmax : ℕ} (hnmax : 1 < nmax) :
    c2CenterGaussianCenterThresholdScalarTail X sigma nmax ≤
      c2CenterGaussianCrudeNaturalTail X sigma nmax := by
  exact
    c2CenterGaussianCenterThresholdScalarTail_le_crudeNaturalTail_of_summable
      (X := X) (sigma := sigma) (nmax := nmax)
      (summable_c2CenterGaussianCrudeNaturalTail_terms
        (X := X) (sigma := sigma) hX hsigma0 hsigma1 hnmax)

/-- Crude integral upper for the C2 center-threshold scalar tail. -/
theorem c2CenterGaussianCenterThresholdScalarTail_le_crudeIntegralTail
    {X sigma : ℝ} (hX : 0 < X) (hsigma0 : 0 ≤ sigma)
    (hsigma1 : sigma < 1) {nmax : ℕ} (hnmax : 1 < nmax) :
    c2CenterGaussianCenterThresholdScalarTail X sigma nmax ≤
      c2CenterGaussianCrudeIntegralTail X sigma nmax := by
  exact le_trans
    (c2CenterGaussianCenterThresholdScalarTail_le_crudeNaturalTail
      (X := X) (sigma := sigma) hX hsigma0 hsigma1 hnmax)
    (c2CenterGaussianCrudeNaturalTail_le_crudeIntegralTail
      (X := X) (sigma := sigma) hX hsigma0 hsigma1 hnmax)

/-- The scalar product majorant is nonnegative. -/
theorem c2CenterGaussianSeriesScalarProductMajorant_nonneg
    (X : ℝ) (p : ℕ × ℕ) :
    0 ≤ c2CenterGaussianSeriesScalarProductMajorant X p := by
  dsimp [c2CenterGaussianSeriesScalarProductMajorant]
  positivity

/-- The sharp `sigma` majorant is bounded by the scalar center majorant. -/
theorem c2CenterGaussianSeriesSigmaMajorant_le_scalarCenterMajorant
    (X sigma : ℝ) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesSigmaMajorant X sigma p ≤
      c2CenterGaussianSeriesScalarCenterMajorant X sigma p := by
  let k : ℕ := p.1 + 2
  let c : ℕ := c2CenterGaussianAddressCenter p
  have hk2 : 2 ≤ k := by
    dsimp [k]
    omega
  have hpow :
      ((1 / 2 : ℝ) ^ k) ≤ ((1 / 2 : ℝ) ^ 2) :=
    pow_le_pow_of_le_one
      (by norm_num : 0 ≤ (1 / 2 : ℝ))
      (by norm_num : (1 / 2 : ℝ) ≤ 1)
      hk2
  have hweight : 2 * ((1 / 2 : ℝ) ^ k) ≤ (1 / 2 : ℝ) := by
    norm_num at hpow ⊢
    linarith
  calc
    c2CenterGaussianSeriesSigmaMajorant X sigma p
        = 2 * ((1 / 2 : ℝ) ^ k) * ((c : ℝ) ^ (-sigma)) *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          dsimp [c2CenterGaussianSeriesSigmaMajorant,
            c2CenterGaussianAddressCenter, c2CenterGaussianAddressDepth,
            c2CenterGaussianAddressCore, k, c]
    _ ≤ (1 / 2 : ℝ) * ((c : ℝ) ^ (-sigma)) *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          gcongr
    _ = c2CenterGaussianSeriesScalarCenterMajorant X sigma p := by
          dsimp [c2CenterGaussianSeriesScalarCenterMajorant, c]

/-- For nonnegative `sigma`, the scalar center majorant is bounded by a
separable product exponential majorant. -/
theorem c2CenterGaussianSeriesScalarCenterMajorant_le_scalarProductMajorant
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesScalarCenterMajorant X sigma p ≤
      c2CenterGaussianSeriesScalarProductMajorant X p := by
  let c : ℕ := c2CenterGaussianAddressCenter p
  have hc_pos_nat : 0 < c := by
    dsimp [c, c2CenterGaussianAddressCenter, c2CenterGaussianAddressDepth,
      c2CenterGaussianAddressCore]
    exact Nat.mul_pos
      (pow_pos (by norm_num : (0 : ℕ) < 2) (p.1 + 2))
      (by omega)
  have hc_one : (1 : ℝ) ≤ (c : ℝ) := by
    exact_mod_cast (Nat.succ_le_of_lt hc_pos_nat)
  have hrpow_le_one : (c : ℝ) ^ (-sigma) ≤ 1 := by
    have hexp : -sigma ≤ (0 : ℝ) := by
      linarith
    simpa [Real.rpow_zero] using
      Real.rpow_le_rpow_of_exponent_le hc_one hexp
  have hX2 : 0 < X ^ 2 := by
    positivity
  have hindex_real :
      (((p.1 + p.2 : ℕ) : ℝ)) ≤ ((c : ℝ) ^ 2) := by
    exact_mod_cast c2CenterGaussianAddressIndexSum_le_center_sq p
  have hscaled :
      (1 / X ^ 2) * (((p.1 + p.2 : ℕ) : ℝ)) ≤
        (((c : ℝ) / X) ^ 2) := by
    calc
      (1 / X ^ 2) * (((p.1 + p.2 : ℕ) : ℝ))
          = (((p.1 + p.2 : ℕ) : ℝ)) / X ^ 2 := by ring
      _ ≤ ((c : ℝ) ^ 2) / X ^ 2 := by
          exact div_le_div_of_nonneg_right hindex_real (le_of_lt hX2)
      _ = (((c : ℝ) / X) ^ 2) := by
          field_simp [ne_of_gt hX]
  have hexp_le :
      Real.exp (-(((c : ℝ) / X) ^ 2)) ≤
        Real.exp (-(1 / X ^ 2) * (p.1 : ℝ)) *
          Real.exp (-(1 / X ^ 2) * (p.2 : ℝ)) := by
    rw [← Real.exp_add]
    apply Real.exp_le_exp.mpr
    have hcast_sum :
        (((p.1 + p.2 : ℕ) : ℝ)) = (p.1 : ℝ) + (p.2 : ℝ) := by
      norm_num
    calc
      -(((c : ℝ) / X) ^ 2)
          ≤ -((1 / X ^ 2) * (((p.1 + p.2 : ℕ) : ℝ))) := by
            linarith
      _ = -(1 / X ^ 2) * (p.1 : ℝ) +
            -(1 / X ^ 2) * (p.2 : ℝ) := by
            rw [hcast_sum]
            ring
  calc
    c2CenterGaussianSeriesScalarCenterMajorant X sigma p
        = (1 / 2 : ℝ) * ((c : ℝ) ^ (-sigma)) *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          dsimp [c2CenterGaussianSeriesScalarCenterMajorant, c]
    _ ≤ (1 / 2 : ℝ) * 1 *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          gcongr
    _ ≤ (1 / 2 : ℝ) * 1 *
            (Real.exp (-(1 / X ^ 2) * (p.1 : ℝ)) *
              Real.exp (-(1 / X ^ 2) * (p.2 : ℝ))) := by
          gcongr
    _ = c2CenterGaussianSeriesScalarProductMajorant X p := by
          dsimp [c2CenterGaussianSeriesScalarProductMajorant]
          ring

/-- The scalar product majorant is summable for positive cutoff scale. -/
theorem summable_c2CenterGaussianSeriesScalarProductMajorant
    {X : ℝ} (hX : 0 < X) :
    Summable fun p : ℕ × ℕ =>
      c2CenterGaussianSeriesScalarProductMajorant X p := by
  let a : ℝ := -(1 / X ^ 2)
  let f : ℕ → ℝ := fun n => Real.exp (a * (n : ℝ))
  have ha : a < 0 := by
    dsimp [a]
    have hpos : 0 < (1 / X ^ 2 : ℝ) := by
      positivity
    linarith
  have hf : Summable f := by
    dsimp [f]
    exact Real.summable_exp_nat_mul_of_ge
      (c := a) ha (fun i => le_rfl)
  have hfhalf : Summable fun n : ℕ => (1 / 2 : ℝ) * f n :=
    hf.mul_left (1 / 2 : ℝ)
  have hprod : Summable fun p : ℕ × ℕ =>
      ((1 / 2 : ℝ) * f p.1) * f p.2 :=
    hfhalf.mul_of_nonneg hf
      (fun n => by dsimp [f]; positivity)
      (fun n => by dsimp [f]; positivity)
  simpa [c2CenterGaussianSeriesScalarProductMajorant, f, a,
    mul_assoc] using hprod

/-- The scalar center majorant is summable for positive cutoff scale and
nonnegative `sigma`. -/
theorem summable_c2CenterGaussianSeriesScalarCenterMajorant
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) :
    Summable fun p : ℕ × ℕ =>
      c2CenterGaussianSeriesScalarCenterMajorant X sigma p := by
  exact
    Summable.of_nonneg_of_le
      (c2CenterGaussianSeriesScalarCenterMajorant_nonneg X sigma)
      (c2CenterGaussianSeriesScalarCenterMajorant_le_scalarProductMajorant
        hX hsigma)
      (summable_c2CenterGaussianSeriesScalarProductMajorant hX)

/-- The scalar center-threshold tail is summable. -/
theorem summable_c2CenterGaussianCenterThresholdScalarTail_terms
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (nmax : ℕ) :
    Summable fun p : ℕ × ℕ =>
      Set.indicator
        ({p | nmax < c2CenterGaussianAddressCenter p + 1}
          : Set (ℕ × ℕ))
        (c2CenterGaussianSeriesScalarCenterMajorant X sigma) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | nmax < c2CenterGaussianAddressCenter p + 1}
  have hmaj :=
    summable_c2CenterGaussianSeriesScalarCenterMajorant
      (X := X) (sigma := sigma) hX hsigma
  have htail := hmaj.indicator S
  simpa [S] using htail

/-- The sharp threshold tail is bounded by the scalar center-threshold tail. -/
theorem c2CenterGaussianCenterThresholdSigmaTail_le_scalarTail
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (nmax : ℕ) :
    c2CenterGaussianCenterThresholdSigmaTail X sigma nmax ≤
      c2CenterGaussianCenterThresholdScalarTail X sigma nmax := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | nmax < c2CenterGaussianAddressCenter p + 1}
  let f : ℕ × ℕ → ℝ := c2CenterGaussianSeriesSigmaMajorant X sigma
  let g : ℕ × ℕ → ℝ :=
    c2CenterGaussianSeriesScalarCenterMajorant X sigma
  have hf :
      Summable fun p : ℕ × ℕ => S.indicator f p := by
    have hmaj : Summable f := by
      exact
        Summable.of_nonneg_of_le
          (c2CenterGaussianSeriesSigmaMajorant_nonneg X sigma)
          (c2CenterGaussianSeriesSigmaMajorant_le_scalarCenterMajorant X sigma)
          (summable_c2CenterGaussianSeriesScalarCenterMajorant hX hsigma)
    have htail := hmaj.indicator S
    simpa [S, f] using htail
  have hg :
      Summable fun p : ℕ × ℕ => S.indicator g p := by
    simpa [S, g] using
      summable_c2CenterGaussianCenterThresholdScalarTail_terms
        (X := X) (sigma := sigma) hX hsigma nmax
  have hle :
      ∀ p : ℕ × ℕ, S.indicator f p ≤ S.indicator g p := by
    intro p
    by_cases hp : p ∈ S
    · simp [Set.indicator, hp, f, g,
        c2CenterGaussianSeriesSigmaMajorant_le_scalarCenterMajorant]
    · simp [Set.indicator, hp]
  calc
    c2CenterGaussianCenterThresholdSigmaTail X sigma nmax
        = ∑' p : ℕ × ℕ, S.indicator f p := by
          unfold c2CenterGaussianCenterThresholdSigmaTail
          rfl
    _ ≤ ∑' p : ℕ × ℕ, S.indicator g p :=
          Summable.tsum_le_tsum hle hf hg
    _ = c2CenterGaussianCenterThresholdScalarTail X sigma nmax := by
          unfold c2CenterGaussianCenterThresholdScalarTail
          rfl

/-- For nonnegative `sigma`, the sharp center-based majorant is bounded by the
coarser product majorant used to prove summability. -/
theorem c2CenterGaussianSeriesSigmaMajorant_le_productMajorant
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesSigmaMajorant X sigma p ≤
      c2CenterGaussianSeriesNormMajorant X p := by
  let k : ℕ := p.1 + 2
  let m : ℕ := 2 * p.2 + 1
  let c : ℕ := 2 ^ k * m
  have hm : 1 ≤ m := by dsimp [m]; omega
  have hc_pos_nat : 0 < c := by
    dsimp [c]
    exact Nat.mul_pos (pow_pos (by norm_num : (0 : ℕ) < 2) k)
      (Nat.succ_le_iff.mp hm)
  have hc_one : (1 : ℝ) ≤ (c : ℝ) := by
    exact_mod_cast (Nat.succ_le_of_lt hc_pos_nat)
  have hrpow_le_one : (c : ℝ) ^ (-sigma) ≤ 1 := by
    have hexp : -sigma ≤ (0 : ℝ) := by linarith
    simpa [Real.rpow_zero] using
      Real.rpow_le_rpow_of_exponent_le hc_one hexp
  have hcut :
      Real.exp (-(((c : ℝ) / X) ^ 2)) ≤
        Real.exp (-(1 / X ^ 2) * (m : ℝ)) := by
    have h :=
      superGaussianCutoffWeight_two_norm_le_core_exp
        (X := X) hX k m hm
    simpa [c, superGaussianCutoffWeight_norm] using h
  calc
    c2CenterGaussianSeriesSigmaMajorant X sigma p
        = 2 * ((1 / 2 : ℝ) ^ k) * ((c : ℝ) ^ (-sigma)) *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          rfl
    _ ≤ 2 * ((1 / 2 : ℝ) ^ k) * 1 *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          gcongr
    _ ≤ 2 * ((1 / 2 : ℝ) ^ k) * 1 *
            Real.exp (-(1 / X ^ 2) * (m : ℝ)) := by
          gcongr
    _ = c2CenterGaussianSeriesNormMajorant X p := by
          dsimp [c2CenterGaussianSeriesNormMajorant, k, m]
          ring

/-- The address-term norm is bounded by the sharp center-based `sigma`
majorant whenever `sigma` is below the actual real part. -/
theorem c2CenterGaussianSeriesAddressTerm_norm_le_sigmaMajorant
    {X sigma : ℝ} {s : ℂ} (hsigma : sigma ≤ s.re) (p : ℕ × ℕ) :
    ‖c2CenterGaussianSeriesAddressTerm X s p‖ ≤
      c2CenterGaussianSeriesSigmaMajorant X sigma p := by
  let k : ℕ := p.1 + 2
  let m : ℕ := 2 * p.2 + 1
  let c : ℕ := 2 ^ k * m
  have hm : 1 ≤ m := by dsimp [m]; omega
  have hc_pos_nat : 0 < c := by
    dsimp [c]
    exact Nat.mul_pos (pow_pos (by norm_num : (0 : ℕ) < 2) k)
      (Nat.succ_le_iff.mp hm)
  have hc_ne : c ≠ 0 := Nat.ne_of_gt hc_pos_nat
  have hc_one : (1 : ℝ) ≤ (c : ℝ) := by
    exact_mod_cast (Nat.succ_le_of_lt hc_pos_nat)
  have hdyadic :
      ‖algebraMap ℚ ℂ (dyadicWeight k)‖ = ((1 / 2 : ℝ) ^ k) := by
    rw [dyadicWeight_eq_inv_pow, map_pow]
    have hhalf : algebraMap ℚ ℂ ((2 : ℚ)⁻¹) = (1 / 2 : ℂ) := by
      norm_num
    rw [hhalf, norm_pow]
    norm_num
  have hcoeff :
      ‖complexDirichletCoeff s c‖ ≤ (c : ℝ) ^ (-sigma) := by
    rw [complexDirichletCoeff_norm_eq_rpow_neg_re s hc_ne]
    exact Real.rpow_le_rpow_of_exponent_le hc_one (by linarith)
  calc
    ‖c2CenterGaussianSeriesAddressTerm X s p‖
        = 2 * ((1 / 2 : ℝ) ^ k) * ‖complexDirichletCoeff s c‖ *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          unfold c2CenterGaussianSeriesAddressTerm c2CenterGaussianAddressTerm
          rw [norm_mul, norm_mul, norm_mul, hdyadic,
            superGaussianCutoffWeight_norm]
          dsimp [k, m, c]
          norm_num
    _ ≤ 2 * ((1 / 2 : ℝ) ^ k) * ((c : ℝ) ^ (-sigma)) *
            Real.exp (-(((c : ℝ) / X) ^ 2)) := by
          gcongr
    _ = c2CenterGaussianSeriesSigmaMajorant X sigma p := by
          rfl

/-- The sharp center-based `sigma` majorant is summable for positive cutoff
scale and nonnegative `sigma`. -/
theorem summable_c2CenterGaussianSeriesSigmaMajorant
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) :
    Summable fun p : ℕ × ℕ =>
      c2CenterGaussianSeriesSigmaMajorant X sigma p := by
  exact
    Summable.of_nonneg_of_le
      (c2CenterGaussianSeriesSigmaMajorant_nonneg X sigma)
      (c2CenterGaussianSeriesSigmaMajorant_le_productMajorant hX hsigma)
      (summable_c2CenterGaussianSeriesNormMajorant hX)

/-- The norm-tail upper is summable whenever the center-Gaussian address family
is absolutely summable. -/
theorem summable_c2CenterGaussianCenterCutoffTailNormUpper_terms
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) (nmax K : ℕ) :
    Summable fun p : ℕ × ℕ =>
      Set.indicator
        ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
          : Set (ℕ × ℕ))
        (fun p => ‖c2CenterGaussianSeriesAddressTerm X s p‖) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  have hnorm :=
    summable_c2CenterGaussianSeriesAddressTerm_norm
      (X := X) (s := s) hX hs
  have htail := hnorm.indicator S
  simpa [S] using htail

/-- The product-majorant tail is summable. -/
theorem summable_c2CenterGaussianCenterCutoffMajorantTail_terms
    {X : ℝ} (hX : 0 < X) (nmax K : ℕ) :
    Summable fun p : ℕ × ℕ =>
      Set.indicator
        ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
          : Set (ℕ × ℕ))
        (c2CenterGaussianSeriesNormMajorant X) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  have hmaj := summable_c2CenterGaussianSeriesNormMajorant (X := X) hX
  have htail := hmaj.indicator S
  simpa [S] using htail

/-- The sharp center-based `sigma` tail is summable. -/
theorem summable_c2CenterGaussianCenterCutoffSigmaTail_terms
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (nmax K : ℕ) :
    Summable fun p : ℕ × ℕ =>
      Set.indicator
        ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
          : Set (ℕ × ℕ))
        (c2CenterGaussianSeriesSigmaMajorant X sigma) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  have hmaj :=
    summable_c2CenterGaussianSeriesSigmaMajorant
      (X := X) (sigma := sigma) hX hsigma
  have htail := hmaj.indicator S
  simpa [S] using htail

/-- The sharp center-threshold `sigma` tail is summable. -/
theorem summable_c2CenterGaussianCenterThresholdSigmaTail_terms
    {X sigma : ℝ} (hX : 0 < X) (hsigma : 0 ≤ sigma) (nmax : ℕ) :
    Summable fun p : ℕ × ℕ =>
      Set.indicator
        ({p | nmax < c2CenterGaussianAddressCenter p + 1}
          : Set (ℕ × ℕ))
        (c2CenterGaussianSeriesSigmaMajorant X sigma) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | nmax < c2CenterGaussianAddressCenter p + 1}
  have hmaj :=
    summable_c2CenterGaussianSeriesSigmaMajorant
      (X := X) (sigma := sigma) hX hsigma
  have htail := hmaj.indicator S
  simpa [S] using htail

/-- Under a full-depth cutoff, the sharp finite-complement tail is bounded by
the sharp center-threshold tail. -/
theorem c2CenterGaussianCenterCutoffSigmaTail_le_centerThresholdSigmaTail
    {X sigma : ℝ} {nmax K : ℕ}
    (hX : 0 < X) (hsigma : 0 ≤ sigma)
    (hfull : C2CenterGaussianFullDepthCutoff nmax K) :
    c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K ≤
      c2CenterGaussianCenterThresholdSigmaTail X sigma nmax := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let T : Set (ℕ × ℕ) :=
    {p | nmax < c2CenterGaussianAddressCenter p + 1}
  let g : ℕ × ℕ → ℝ := c2CenterGaussianSeriesSigmaMajorant X sigma
  have hS :
      Summable fun p : ℕ × ℕ => S.indicator g p := by
    simpa [S, g] using
      summable_c2CenterGaussianCenterCutoffSigmaTail_terms
        (X := X) (sigma := sigma) hX hsigma nmax K
  have hT :
      Summable fun p : ℕ × ℕ => T.indicator g p := by
    simpa [T, g] using
      summable_c2CenterGaussianCenterThresholdSigmaTail_terms
        (X := X) (sigma := sigma) hX hsigma nmax
  have hle :
      ∀ p : ℕ × ℕ, S.indicator g p ≤ T.indicator g p := by
    intro p
    by_cases hpS : p ∈ S
    · have hpT : p ∈ T := by
        by_contra hpT_not
        have hcenter_le :
            c2CenterGaussianAddressCenter p + 1 ≤ nmax := by
          exact Nat.le_of_not_gt hpT_not
        have hdepth_le :
            c2CenterGaussianAddressDepth p ≤ K :=
          hfull p hcenter_le
        have hp1_lt : p.1 < K + 1 := by
          dsimp [c2CenterGaussianAddressDepth] at hdepth_le
          omega
        have hp2_lt : p.2 < nmax + 1 := by
          have hpow_ge_one : 1 ≤ 2 ^ c2CenterGaussianAddressDepth p :=
            Nat.one_le_pow (c2CenterGaussianAddressDepth p) 2
              (by norm_num : (0 : ℕ) < 2)
          have hcore_ge : p.2 ≤ c2CenterGaussianAddressCore p := by
            dsimp [c2CenterGaussianAddressCore]
            omega
          have hcore_le_center :
              c2CenterGaussianAddressCore p ≤
                c2CenterGaussianAddressCenter p := by
            dsimp [c2CenterGaussianAddressCenter]
            calc
              c2CenterGaussianAddressCore p
                  = 1 * c2CenterGaussianAddressCore p := by simp
              _ ≤ 2 ^ c2CenterGaussianAddressDepth p *
                    c2CenterGaussianAddressCore p :=
                  Nat.mul_le_mul_right _ hpow_ge_one
          have hp2_le_center :
              p.2 ≤ c2CenterGaussianAddressCenter p :=
            le_trans hcore_ge hcore_le_center
          omega
        have hmem :
            p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K := by
          rw [c2CenterGaussianByCenterCutoffAddressSet_mem_iff]
          exact ⟨hp1_lt, hp2_lt, hdepth_le, by
            simpa [c2CenterGaussianAddressDepth,
              c2CenterGaussianAddressCore, c2CenterGaussianAddressCenter]
              using hcenter_le⟩
        have hp_not_mem :
            p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K := by
          simpa [S] using hpS
        exact hp_not_mem hmem
      simp [Set.indicator, hpS, hpT]
    · by_cases hpT : p ∈ T
      · simp [Set.indicator, hpS, hpT, g,
          c2CenterGaussianSeriesSigmaMajorant_nonneg]
      · simp [Set.indicator, hpS, hpT]
  calc
    c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K
        = ∑' p : ℕ × ℕ, S.indicator g p := by
          unfold c2CenterGaussianCenterCutoffSigmaTail
          rfl
    _ ≤ ∑' p : ℕ × ℕ, T.indicator g p :=
          Summable.tsum_le_tsum hle hS hT
    _ = c2CenterGaussianCenterThresholdSigmaTail X sigma nmax := by
          unfold c2CenterGaussianCenterThresholdSigmaTail
          rfl

/-- The exact norm-tail is bounded by the sharp center-based `sigma` tail
whenever `sigma` is below the real part of `s`. -/
theorem c2CenterGaussianCenterCutoffTailNormUpper_le_sigmaTail
    {X sigma : ℝ} {s : ℂ}
    (hX : 0 < X) (hs : 0 < s.re) (hsigma_nonneg : 0 ≤ sigma)
    (hsigma_le : sigma ≤ s.re) (nmax K : ℕ) :
    c2CenterGaussianCenterCutoffTailNormUpper X s nmax K ≤
      c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let f : ℕ × ℕ → ℝ :=
    fun p => ‖c2CenterGaussianSeriesAddressTerm X s p‖
  let g : ℕ × ℕ → ℝ := c2CenterGaussianSeriesSigmaMajorant X sigma
  have hf :
      Summable fun p : ℕ × ℕ => S.indicator f p := by
    simpa [S, f] using
      summable_c2CenterGaussianCenterCutoffTailNormUpper_terms
        (X := X) (s := s) hX hs nmax K
  have hg :
      Summable fun p : ℕ × ℕ => S.indicator g p := by
    simpa [S, g] using
      summable_c2CenterGaussianCenterCutoffSigmaTail_terms
        (X := X) (sigma := sigma) hX hsigma_nonneg nmax K
  have hle :
      ∀ p : ℕ × ℕ, S.indicator f p ≤ S.indicator g p := by
    intro p
    by_cases hp : p ∈ S
    · simp [Set.indicator, hp, f, g,
        c2CenterGaussianSeriesAddressTerm_norm_le_sigmaMajorant
          (X := X) (sigma := sigma) (s := s) hsigma_le p]
    · simp [Set.indicator, hp]
  calc
    c2CenterGaussianCenterCutoffTailNormUpper X s nmax K
        = ∑' p : ℕ × ℕ, S.indicator f p := by
          unfold c2CenterGaussianCenterCutoffTailNormUpper
          rfl
    _ ≤ ∑' p : ℕ × ℕ, S.indicator g p :=
          Summable.tsum_le_tsum hle hf hg
    _ = c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K := by
          unfold c2CenterGaussianCenterCutoffSigmaTail
          rfl

/-- The exact norm-tail is bounded by the product-majorant tail. -/
theorem c2CenterGaussianCenterCutoffTailNormUpper_le_majorantTail
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) (nmax K : ℕ) :
    c2CenterGaussianCenterCutoffTailNormUpper X s nmax K ≤
      c2CenterGaussianCenterCutoffMajorantTail X nmax K := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let f : ℕ × ℕ → ℝ :=
    fun p => ‖c2CenterGaussianSeriesAddressTerm X s p‖
  let g : ℕ × ℕ → ℝ := c2CenterGaussianSeriesNormMajorant X
  have hf :
      Summable fun p : ℕ × ℕ => S.indicator f p := by
    simpa [S, f] using
      summable_c2CenterGaussianCenterCutoffTailNormUpper_terms
        (X := X) (s := s) hX hs nmax K
  have hg :
      Summable fun p : ℕ × ℕ => S.indicator g p := by
    simpa [S, g] using
      summable_c2CenterGaussianCenterCutoffMajorantTail_terms
        (X := X) hX nmax K
  have hle :
      ∀ p : ℕ × ℕ, S.indicator f p ≤ S.indicator g p := by
    intro p
    by_cases hp : p ∈ S
    · simp [Set.indicator, hp, f, g,
        c2CenterGaussianSeriesAddressTerm_norm_le_majorant hX hs p]
    · simp [Set.indicator, hp]
  calc
    c2CenterGaussianCenterCutoffTailNormUpper X s nmax K
        = ∑' p : ℕ × ℕ, S.indicator f p := by
          unfold c2CenterGaussianCenterCutoffTailNormUpper
          rfl
    _ ≤ ∑' p : ℕ × ℕ, S.indicator g p :=
          Summable.tsum_le_tsum hle hf hg
    _ = c2CenterGaussianCenterCutoffMajorantTail X nmax K := by
          unfold c2CenterGaussianCenterCutoffMajorantTail
          rfl

/-- The finite address sum is the `tsum` of the address family restricted to
the finite center-cutoff set. -/
theorem c2CenterGaussianByCenterCutoffAddressSum_eq_tsum_indicator
    (X : ℝ) (s : ℂ) (nmax K : ℕ) :
    c2CenterGaussianByCenterCutoffAddressSum X s nmax K =
      ∑' p : ℕ × ℕ,
        Set.indicator
          ({p | p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K}
            : Set (ℕ × ℕ))
          (c2CenterGaussianSeriesAddressTerm X s) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let F : Finset (ℕ × ℕ) := c2CenterGaussianByCenterCutoffAddressSet nmax K
  let f : ℕ × ℕ → ℂ := c2CenterGaussianSeriesAddressTerm X s
  symm
  calc
    (∑' p : ℕ × ℕ, S.indicator f p)
        = ∑ p ∈ F, S.indicator f p := by
          refine tsum_eq_sum (s := F) ?_
          intro p hp
          simp [S, F, Set.indicator, hp]
    _ = ∑ p ∈ F, f p := by
          refine Finset.sum_congr rfl ?_
          intro p hp
          simp [S, F, Set.indicator, hp]
    _ = c2CenterGaussianByCenterCutoffAddressSum X s nmax K := by
          rfl

/-- The omitted part of the infinite carrier is exactly the `tsum` over the
complement of the finite center-cutoff set. -/
theorem c2CenterGaussianSeries_sub_byCenterCutoffAddressSum_eq_tail
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) (nmax K : ℕ) :
    c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoffAddressSum X s nmax K =
      ∑' p : ℕ × ℕ,
        Set.indicator
          ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
            : Set (ℕ × ℕ))
          (c2CenterGaussianSeriesAddressTerm X s) p := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let f : ℕ × ℕ → ℂ := c2CenterGaussianSeriesAddressTerm X s
  have hf : Summable f :=
    summable_c2CenterGaussianSeriesAddressTerm
      (X := X) (s := s) hX hs
  have hS : Summable (S.indicator f) := hf.indicator S
  have hSc : Summable (Sᶜ.indicator f) := hf.indicator Sᶜ
  have hsplit :
      (∑' p : ℕ × ℕ, f p) =
        (∑' p : ℕ × ℕ, S.indicator f p) +
          (∑' p : ℕ × ℕ, Sᶜ.indicator f p) := by
    have hadd := hS.tsum_add hSc
    have hpoint :
        (fun p : ℕ × ℕ => S.indicator f p + Sᶜ.indicator f p) = f := by
      funext p
      by_cases hp : p ∈ S
      · simp [Set.indicator, hp]
      · have hpc : p ∈ Sᶜ := hp
        simp [Set.indicator, hp, hpc]
    simpa [hpoint] using hadd
  calc
    c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoffAddressSum X s nmax K
        = (∑' p : ℕ × ℕ, f p) -
            (∑' p : ℕ × ℕ, S.indicator f p) := by
          rw [c2CenterGaussianSeries_eq_tsum_addressTerm]
          rw [c2CenterGaussianByCenterCutoffAddressSum_eq_tsum_indicator]
    _ = ∑' p : ℕ × ℕ, Sᶜ.indicator f p := by
          rw [hsplit]
          abel
    _ = ∑' p : ℕ × ℕ,
        Set.indicator
          ({p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
            : Set (ℕ × ℕ))
          (c2CenterGaussianSeriesAddressTerm X s) p := by
          rfl

/-- The finite-to-infinite carrier error is bounded by the exact norm-tail
upper. -/
theorem norm_c2CenterGaussianSeries_sub_byCenterCutoffAddressSum_le_tailNormUpper
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) (nmax K : ℕ) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoffAddressSum X s nmax K‖ ≤
      c2CenterGaussianCenterCutoffTailNormUpper X s nmax K := by
  classical
  let S : Set (ℕ × ℕ) :=
    {p | p ∉ c2CenterGaussianByCenterCutoffAddressSet nmax K}
  let f : ℕ × ℕ → ℂ := c2CenterGaussianSeriesAddressTerm X s
  have htail_eq :=
    c2CenterGaussianSeries_sub_byCenterCutoffAddressSum_eq_tail
      (X := X) (s := s) hX hs nmax K
  have hnorm_summable :
      Summable fun p : ℕ × ℕ => ‖S.indicator f p‖ := by
    have hnorm :=
      summable_c2CenterGaussianSeriesAddressTerm_norm
        (X := X) (s := s) hX hs
    have htail := hnorm.indicator S
    have hpoint :
        (fun p : ℕ × ℕ => ‖S.indicator f p‖) =
          S.indicator (fun p : ℕ × ℕ => ‖f p‖) := by
      funext p
      by_cases hp : p ∈ S
      · simp [Set.indicator, hp]
      · simp [Set.indicator, hp]
    simpa [hpoint]
      using htail
  calc
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoffAddressSum X s nmax K‖
        = ‖∑' p : ℕ × ℕ, S.indicator f p‖ := by
          rw [htail_eq]
    _ ≤ ∑' p : ℕ × ℕ, ‖S.indicator f p‖ :=
          norm_tsum_le_tsum_norm hnorm_summable
    _ = c2CenterGaussianCenterCutoffTailNormUpper X s nmax K := by
          unfold c2CenterGaussianCenterCutoffTailNormUpper
          apply tsum_congr
          intro p
          by_cases hp : p ∈ c2CenterGaussianByCenterCutoffAddressSet nmax K
          · simp [S, f, Set.indicator, hp]
          · simp [S, f, Set.indicator, hp]

/-- Same finite-to-infinite bound for the script-style `(k,m)` cutoff. -/
theorem norm_c2CenterGaussianSeries_sub_byCenterCutoff_le_tailNormUpper
    {X : ℝ} {s : ℂ} (hX : 0 < X) (hs : 0 < s.re) (nmax K : ℕ) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ ≤
      c2CenterGaussianCenterCutoffTailNormUpper X s nmax K := by
  rw [c2CenterGaussianByCenterCutoff_eq_addressSum]
  exact
    norm_c2CenterGaussianSeries_sub_byCenterCutoffAddressSum_le_tailNormUpper
      (X := X) (s := s) hX hs nmax K

/-- Audit-only scalar budget: an external scalar upper for the exact tail
norm. -/
structure C2CenterGaussianTailLiftBudget
    (X : ℝ) (s : ℂ) (nmax K : ℕ) (margin : ℝ) : Prop where
  tail_le_margin :
    c2CenterGaussianCenterCutoffTailNormUpper X s nmax K ≤ margin

/-- Audit-only scalar budget using the sharp center-based `sigma` tail. -/
structure C2CenterGaussianSigmaTailLiftBudget
    (X sigma : ℝ) (nmax K : ℕ) (margin : ℝ) : Prop where
  sigma_tail_le_margin :
    c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K ≤ margin

/-- Audit-only scalar budget using the center-threshold `sigma` tail. -/
structure C2CenterGaussianCenterThresholdTailLiftBudget
    (X sigma : ℝ) (nmax : ℕ) (margin : ℝ) : Prop where
  threshold_tail_le_margin :
    c2CenterGaussianCenterThresholdSigmaTail X sigma nmax ≤ margin

/-- Audit-only scalar budget using the center-threshold scalar tail. -/
structure C2CenterGaussianCenterThresholdScalarTailLiftBudget
    (X sigma : ℝ) (nmax : ℕ) (margin : ℝ) : Prop where
  scalar_threshold_tail_le_margin :
    c2CenterGaussianCenterThresholdScalarTail X sigma nmax ≤ margin

/-- Audit-only scalar budget using the crude one-dimensional integral tail. -/
structure C2CenterGaussianCrudeIntegralTailLiftBudget
    (X sigma : ℝ) (nmax : ℕ) (margin : ℝ) : Prop where
  crude_integral_tail_le_margin :
    c2CenterGaussianCrudeIntegralTail X sigma nmax ≤ margin

/-- Audit-only scalar budget using the product-majorant tail. -/
structure C2CenterGaussianMajorantTailLiftBudget
    (X : ℝ) (nmax K : ℕ) (margin : ℝ) : Prop where
  majorant_tail_le_margin :
    c2CenterGaussianCenterCutoffMajorantTail X nmax K ≤ margin

/-- A crude integral tail budget supplies the scalar center-threshold budget. -/
theorem C2CenterGaussianCrudeIntegralTailLiftBudget.to_scalarTailLiftBudget
    {X sigma : ℝ} {nmax : ℕ} {margin : ℝ}
    (hX : 0 < X) (hsigma0 : 0 ≤ sigma) (hsigma1 : sigma < 1)
    (hnmax : 1 < nmax)
    (h : C2CenterGaussianCrudeIntegralTailLiftBudget
      X sigma nmax margin) :
    C2CenterGaussianCenterThresholdScalarTailLiftBudget
      X sigma nmax margin where
  scalar_threshold_tail_le_margin := le_trans
    (c2CenterGaussianCenterThresholdScalarTail_le_crudeIntegralTail
      (X := X) (sigma := sigma) hX hsigma0 hsigma1 hnmax)
    h.crude_integral_tail_le_margin

/-- A scalar center-threshold tail budget supplies the sharp center-threshold
`sigma` budget. -/
theorem C2CenterGaussianCenterThresholdScalarTailLiftBudget.to_thresholdTailLiftBudget
    {X sigma : ℝ} {nmax : ℕ} {margin : ℝ}
    (hX : 0 < X) (hsigma : 0 ≤ sigma)
    (h : C2CenterGaussianCenterThresholdScalarTailLiftBudget
      X sigma nmax margin) :
    C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax margin where
  threshold_tail_le_margin := le_trans
    (c2CenterGaussianCenterThresholdSigmaTail_le_scalarTail
      (X := X) (sigma := sigma) hX hsigma nmax)
    h.scalar_threshold_tail_le_margin

/-- A center-threshold tail budget supplies the sharp finite-cutoff `sigma`
budget under the full-depth condition. -/
theorem C2CenterGaussianCenterThresholdTailLiftBudget.to_sigmaTailLiftBudget
    {X sigma : ℝ} {nmax K : ℕ} {margin : ℝ}
    (hX : 0 < X) (hsigma : 0 ≤ sigma)
    (hfull : C2CenterGaussianFullDepthCutoff nmax K)
    (h : C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax margin) :
    C2CenterGaussianSigmaTailLiftBudget X sigma nmax K margin where
  sigma_tail_le_margin := le_trans
    (c2CenterGaussianCenterCutoffSigmaTail_le_centerThresholdSigmaTail
      (X := X) (sigma := sigma) hX hsigma hfull)
    h.threshold_tail_le_margin

/-- A sharp center-based `sigma` tail budget supplies the exact tail budget. -/
theorem C2CenterGaussianSigmaTailLiftBudget.to_tailLiftBudget
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {margin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (h : C2CenterGaussianSigmaTailLiftBudget X sigma nmax K margin) :
    C2CenterGaussianTailLiftBudget X s nmax K margin where
  tail_le_margin := le_trans
    (c2CenterGaussianCenterCutoffTailNormUpper_le_sigmaTail
      (X := X) (sigma := sigma) (s := s)
      hX hs hsigma_nonneg hsigma_le nmax K)
    h.sigma_tail_le_margin

/-- A product-majorant tail budget supplies the exact tail budget. -/
theorem C2CenterGaussianMajorantTailLiftBudget.to_tailLiftBudget
    {X : ℝ} {s : ℂ} {nmax K : ℕ} {margin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (h : C2CenterGaussianMajorantTailLiftBudget X nmax K margin) :
    C2CenterGaussianTailLiftBudget X s nmax K margin where
  tail_le_margin := le_trans
    (c2CenterGaussianCenterCutoffTailNormUpper_le_majorantTail
      (X := X) (s := s) hX hs nmax K)
    h.majorant_tail_le_margin

/-- A scalar tail budget buys the corresponding finite-to-infinite error
bound. -/
theorem C2CenterGaussianTailLiftBudget.error_bound
    {X : ℝ} {s : ℂ} {nmax K : ℕ} {margin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (h : C2CenterGaussianTailLiftBudget X s nmax K margin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ ≤ margin := by
  exact le_trans
      (norm_c2CenterGaussianSeries_sub_byCenterCutoff_le_tailNormUpper
        (X := X) (s := s) hX hs nmax K)
    h.tail_le_margin

/-- Strict form used by the zero-box lift: if the tail upper is below the
certified boundary margin, then the finite and infinite carriers are uniformly
closer than that margin. -/
theorem C2CenterGaussianTailLiftBudget.error_lt_boundary_margin
    {X : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (h : C2CenterGaussianTailLiftBudget X s nmax K tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact lt_of_le_of_lt
    (C2CenterGaussianTailLiftBudget.error_bound
      (X := X) (s := s) (nmax := nmax) (K := K)
      hX hs h)
    hstrict

/-- A sharp center-based `sigma` tail bound buys the strict boundary-margin
form. -/
theorem C2CenterGaussianSigmaTailLiftBudget.error_lt_boundary_margin
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (h : C2CenterGaussianSigmaTailLiftBudget X sigma nmax K tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianTailLiftBudget.error_lt_boundary_margin
    (X := X) (s := s) (nmax := nmax) (K := K)
    hX hs
    (C2CenterGaussianSigmaTailLiftBudget.to_tailLiftBudget
      (X := X) (sigma := sigma) (s := s)
      hX hs hsigma_nonneg hsigma_le h)
    hstrict

/-- A center-threshold tail bound buys the strict boundary-margin form under
the full-depth condition. -/
theorem C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (hfull : C2CenterGaussianFullDepthCutoff nmax K)
    (h : C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianSigmaTailLiftBudget.error_lt_boundary_margin
    (X := X) (sigma := sigma) (s := s) (nmax := nmax) (K := K)
    hX hs hsigma_nonneg hsigma_le
    (C2CenterGaussianCenterThresholdTailLiftBudget.to_sigmaTailLiftBudget
      (X := X) (sigma := sigma) (nmax := nmax) (K := K)
      hX hsigma_nonneg hfull h)
    hstrict

/-- Concrete dyadic full-depth version of the center-threshold lift. -/
theorem C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin_of_dyadicFullDepth
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (hnmax : nmax ≤ 2 ^ (K + 1))
    (h : C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin
    (X := X) (sigma := sigma) (s := s) (nmax := nmax) (K := K)
    hX hs hsigma_nonneg hsigma_le
    (C2CenterGaussianFullDepthCutoff.of_nmax_le_two_pow_succ hnmax)
    h hstrict

/-- A scalar center-threshold tail bound buys the strict boundary-margin form
under a full-depth cutoff. -/
theorem C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (hfull : C2CenterGaussianFullDepthCutoff nmax K)
    (h : C2CenterGaussianCenterThresholdScalarTailLiftBudget
      X sigma nmax tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin
    (X := X) (sigma := sigma) (s := s) (nmax := nmax) (K := K)
    hX hs hsigma_nonneg hsigma_le hfull
    (C2CenterGaussianCenterThresholdScalarTailLiftBudget.to_thresholdTailLiftBudget
      (X := X) (sigma := sigma) (nmax := nmax)
      hX hsigma_nonneg h)
    hstrict

/-- Concrete dyadic full-depth version of the scalar center-threshold lift. -/
theorem C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin_of_dyadic
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_le : sigma ≤ s.re)
    (hnmax : nmax ≤ 2 ^ (K + 1))
    (h : C2CenterGaussianCenterThresholdScalarTailLiftBudget
      X sigma nmax tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin
    (X := X) (sigma := sigma) (s := s) (nmax := nmax) (K := K)
    hX hs hsigma_nonneg hsigma_le
    (C2CenterGaussianFullDepthCutoff.of_nmax_le_two_pow_succ hnmax)
    h hstrict

/-- Concrete dyadic full-depth version of the crude-integral tail lift. -/
theorem C2CenterGaussianCrudeIntegralTailLiftBudget.error_lt_boundary_margin_of_dyadic
    {X sigma : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (hsigma_nonneg : 0 ≤ sigma) (hsigma_lt_one : sigma < 1)
    (hsigma_le : sigma ≤ s.re)
    (hnmax_gt : 1 < nmax)
    (hnmax_full : nmax ≤ 2 ^ (K + 1))
    (h : C2CenterGaussianCrudeIntegralTailLiftBudget
      X sigma nmax tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact
    C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin_of_dyadic
      (X := X) (sigma := sigma) (s := s)
      (nmax := nmax) (K := K)
      hX hs hsigma_nonneg hsigma_le hnmax_full
      (C2CenterGaussianCrudeIntegralTailLiftBudget.to_scalarTailLiftBudget
        (X := X) (sigma := sigma) (nmax := nmax)
        hX hsigma_nonneg hsigma_lt_one hnmax_gt h)
      hstrict

/-- A product-majorant tail bound also buys the strict boundary-margin form. -/
theorem C2CenterGaussianMajorantTailLiftBudget.error_lt_boundary_margin
    {X : ℝ} {s : ℂ} {nmax K : ℕ} {tailBound boundaryMargin : ℝ}
    (hX : 0 < X) (hs : 0 < s.re)
    (h : C2CenterGaussianMajorantTailLiftBudget X nmax K tailBound)
    (hstrict : tailBound < boundaryMargin) :
    ‖c2CenterGaussianSeries X s -
        c2CenterGaussianByCenterCutoff X s nmax K‖ < boundaryMargin := by
  exact C2CenterGaussianTailLiftBudget.error_lt_boundary_margin
    (X := X) (s := s) (nmax := nmax) (K := K)
    hX hs
    (C2CenterGaussianMajorantTailLiftBudget.to_tailLiftBudget
      (X := X) (s := s) hX hs h)
    hstrict

/-- Audit-only profile matching the empirical script: the center cutoff is
finite at `nmax,K`, while the Gaussian scale is chosen dynamically as
`X = nmax / xFactor`. -/
noncomputable def c2CenterGaussianScriptProfile
    (xFactor : ℝ) (s : ℂ) (nmax K : ℕ) : ℂ :=
  c2CenterGaussianByCenterCutoff ((nmax : ℝ) / xFactor) s nmax K

/-- Definitional expansion of the empirical script profile. -/
theorem c2CenterGaussianScriptProfile_eq
    (xFactor : ℝ) (s : ℂ) (nmax K : ℕ) :
    c2CenterGaussianScriptProfile xFactor s nmax K =
      c2CenterGaussianByCenterCutoff ((nmax : ℝ) / xFactor) s nmax K := by
  rfl

end GenuineMiddleAudit
end C2
