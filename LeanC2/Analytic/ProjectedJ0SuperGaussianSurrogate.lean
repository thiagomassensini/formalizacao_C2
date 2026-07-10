import LeanC2.Analytic.GenuineRawTsumObstruction
import LeanC2.Operators.TruncatedGenuine

/-!
# The exact finite super-Gaussian projected-J0 model

This file records the exact-real mathematical super-Gaussian model suggested
by the external rectangle producer.  Its names are deliberately disjoint from
the raw projected-J0 aliases and from the paired continuation.

The producer implementation first evaluates the coefficients in binary64 and
removes coefficients that underflow to zero.  Consequently the definitions in
this file are not definitionally, or presently theorem-level, equal to the
finite floating-point term list used to generate the stored rectangles.  A
separate checked implementation-to-model error bridge is required before those
rectangles can be used as analytic enclosures for these exact definitions.

The fixed producer parameters are target `(K, M) = (16, 12001)`, reference
`(17, 16001)`, scale `X = 10661`, and super-Gaussian exponent `p = 2`.
-/

namespace C2

def projectedJ0SG_targetK : ℕ := 16
def projectedJ0SG_targetM : ℕ := 12001
def projectedJ0SG_referenceK : ℕ := 17
def projectedJ0SG_referenceM : ℕ := 16001
def projectedJ0SG_X : ℝ := 10661
def projectedJ0SG_p : ℕ := 2

/-- Exact-real profile `exp (-((n / X)^p))` underlying the producer formula. -/
noncomputable def projectedJ0SG_weight (X : ℝ) (p n : ℕ) : ℂ :=
  (Real.exp (-(((n : ℝ) / X) ^ p)) : ℝ)

/-- Finite raw odd core, with no cutoff profile. -/
noncomputable def projectedJ0SG_oddRawFinite (s : ℂ) (M : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m

/-- Finite super-Gaussian odd reference. -/
noncomputable def projectedJ0SG_oddFinite
    (s : ℂ) (M : ℕ) (X : ℝ) (p : ℕ) : ℂ :=
  ∑ m ∈ oddCoresUpTo M,
    projectedJ0SG_weight X p m * complexDirichletCoeff s m

/--
Finite central sum emitted by `build_central_data`: the address is `2^k*m`
and its real coefficient is `2 * 2^(-k)` times the SG profile.
-/
noncomputable def projectedJ0SG_centralFinite
    (s : ℂ) (K M : ℕ) (X : ℝ) (p : ℕ) : ℂ :=
  ∑ k ∈ Finset.Icc 2 K,
    ∑ m ∈ oddCoresUpTo M,
      ((2 : ℂ) * ((2 : ℂ) ^ k)⁻¹) *
        projectedJ0SG_weight X p (2 ^ k * m) *
          complexDirichletCoeff s (2 ^ k * m)

noncomputable def projectedJ0SG_oddCore (s : ℂ) : ℂ :=
  projectedJ0SG_oddRawFinite s projectedJ0SG_targetM

noncomputable def projectedJ0SG_oddReference (s : ℂ) : ℂ :=
  projectedJ0SG_oddFinite s projectedJ0SG_referenceM projectedJ0SG_X projectedJ0SG_p

noncomputable def projectedJ0SG_target (s : ℂ) : ℂ :=
  projectedJ0SG_centralFinite
    s projectedJ0SG_targetK projectedJ0SG_targetM projectedJ0SG_X projectedJ0SG_p

noncomputable def projectedJ0SG_reference (s : ℂ) : ℂ :=
  projectedJ0SG_centralFinite
    s projectedJ0SG_referenceK projectedJ0SG_referenceM projectedJ0SG_X projectedJ0SG_p

/-- Producer quantity `H = odd_core_raw - odd_reference_SG`. -/
noncomputable def projectedJ0SG_horizontalDelta (s : ℂ) : ℂ :=
  projectedJ0SG_oddCore s - projectedJ0SG_oddReference s

/-- Producer quantity `q^2/(1-q) + target - 2*reference`. -/
noncomputable def projectedJ0SG_verticalResidual (s : ℂ) : ℂ :=
  verticalRatio s ^ 2 / (1 - verticalRatio s) +
    projectedJ0SG_target s - 2 * projectedJ0SG_reference s

/-- The exact-real seed formula underlying the producer bookkeeping; it is not
an arbitrary `tiltSeed`. -/
noncomputable def projectedJ0SG_tiltSeed (s : ℂ) : ℂ :=
  -(projectedJ0SG_verticalResidual s +
      2 * (verticalRatio s ^ 2 / (1 - verticalRatio s)) *
        projectedJ0SG_horizontalDelta s) *
    (1 - verticalRatio s)

/-- Main vector of the finite SG bookkeeping. -/
noncomputable def projectedJ0SG_M (s : ℂ) : ℂ :=
  (verticalRatio s ^ 2 + projectedJ0SG_tiltSeed s) *
    (1 + verticalRatio s + verticalRatio s ^ 2 + verticalRatio s ^ 3)

/-- Depth-zero horizontal defect of the finite SG bookkeeping. -/
noncomputable def projectedJ0SG_D0 (s : ℂ) : ℂ :=
  2 * verticalRatio s ^ 2 * projectedJ0SG_horizontalDelta s

/-- Remaining three horizontal quartet depths. -/
noncomputable def projectedJ0SG_Drest (s : ℂ) : ℂ :=
  2 * (verticalRatio s ^ 3 + verticalRatio s ^ 4 + verticalRatio s ^ 5) *
    projectedJ0SG_horizontalDelta s

/-- Tail vector used by the finite SG producer. -/
noncomputable def projectedJ0SG_RvecTail (s : ℂ) : ℂ :=
  verticalRatio s ^ 6 / (1 - verticalRatio s) +
    projectedJ0SG_tiltSeed s *
      (verticalRatio s ^ 4 / (1 - verticalRatio s)) +
    2 * (verticalRatio s ^ 6 / (1 - verticalRatio s)) *
      projectedJ0SG_horizontalDelta s +
    (projectedJ0SG_target s - projectedJ0SG_reference s)

/-- Exact-real four-part total associated with the producer formula. -/
noncomputable def projectedJ0SG_totalFinite (s : ℂ) : ℂ :=
  projectedJ0SG_M s + projectedJ0SG_D0 s +
    projectedJ0SG_Drest s + projectedJ0SG_RvecTail s

theorem projectedJ0SG_totalFinite_decomposition (s : ℂ) :
    projectedJ0SG_totalFinite s =
      projectedJ0SG_M s + projectedJ0SG_D0 s +
        projectedJ0SG_Drest s + projectedJ0SG_RvecTail s := by
  rfl

/--
The exact-real SG bookkeeping simplifies to its finite SG reference.  This is
an internal identity between mathematical SG objects, not an identification
with the floating-point producer term list, a raw `tsum`, or the paired
continuation.
-/
theorem projectedJ0SG_totalFinite_eq_reference
    (s : ℂ) (hs : 0 < s.re) :
    projectedJ0SG_totalFinite s = projectedJ0SG_reference s := by
  have hden : 1 - verticalRatio s ≠ 0 :=
    verticalResolvent_den_ne_zero_of_re_pos s hs
  unfold projectedJ0SG_totalFinite projectedJ0SG_M projectedJ0SG_D0
    projectedJ0SG_Drest projectedJ0SG_RvecTail projectedJ0SG_tiltSeed
    projectedJ0SG_verticalResidual
  field_simp [hden]
  ring

end C2
