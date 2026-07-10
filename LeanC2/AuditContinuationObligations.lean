import LeanC2.Analytic.GenuineContinuation

/-!
# Continuation obligations for the adjusted quartet route

This module isolates the first input required by the adjusted quartet audit:
`GenuineFInfiniteContinuationData`.

The continued central odd channel already carries the right identity on the
open right half-plane.  Therefore the remaining continuation task for
`genuineFInfinite` can be reduced to proving that it agrees with this continued
channel on the open right half-plane, or to the sharper analytic-continuation
package on the punctured right half-plane plus the value at `s = 1`.
-/

namespace C2
namespace AdjustedQuartetContinuationAudit

/-- The already-continued central odd channel supplies a complete continuation bridge. -/
noncomputable def continuedCentralOddChannelContinuationData :
    ContinuationFromOneLtData continuedCentralOddChannel riemannZeta where
  continue_identity := by
    intro _hOneLt
    exact
      C2IdentityOn.of_fundamentalRightHalfPlane
        continuedCentralOddChannel_fundamentalIdentity

/--
If the genuine infinite numerator equals the continued central odd channel on
the open right half-plane, the continuation input required by the audited route
is available.
-/
noncomputable def genuineContinuationData_of_eqOnOpenRightHalfPlane
    (hEq : ∀ s : ℂ, s ∈ openRightHalfPlane →
      genuineFInfinite s = continuedCentralOddChannel s) :
    GenuineFInfiniteContinuationData :=
  ContinuationFromOneLtData.of_eqOnOpenRightHalfPlane
    continuedCentralOddChannelContinuationData hEq

/--
A comparison bridge from `Re(s) > 1` to the open right half-plane is enough to
construct the genuine continuation input.
-/
noncomputable def genuineContinuationData_of_comparison
    (comparison :
      ComparisonFromOneLtData genuineFInfinite continuedCentralOddChannel) :
    GenuineFInfiniteContinuationData :=
  comparison.transferContinuation
    continuedCentralOddChannelContinuationData
    genuineFInfinite_eq_continuedCentralOddChannel_on_oneLtHalfPlane

/--
It is enough to prove equality on the punctured right half-plane and then handle
the distinguished point `s = 1` separately.
-/
noncomputable def genuineContinuationData_of_eqOnPuncturedOpenRightHalfPlane
    (hEqPunctured : ∀ s : ℂ, s ∈ puncturedOpenRightHalfPlane →
      genuineFInfinite s = continuedCentralOddChannel s)
    (hEqAtOne : genuineFInfinite 1 = continuedCentralOddChannel 1) :
    GenuineFInfiniteContinuationData :=
  genuineContinuationData_of_eqOnOpenRightHalfPlane (by
    intro s hs
    by_cases h1 : s = 1
    · simpa [h1] using hEqAtOne
    · exact hEqPunctured s ⟨hs, h1⟩)

/--
Analytic continuation uniqueness reduces the genuine continuation input to two
smaller obligations:

* `genuineFInfinite` is analytic on the punctured open right half-plane;
* its value at the distinguished point `s = 1` matches the continued channel.
-/
noncomputable def genuineContinuationData_of_analyticOnNhd_punctured
    (hGenuine :
      AnalyticOnNhd ℂ genuineFInfinite puncturedOpenRightHalfPlane)
    (hEqAtOne : genuineFInfinite 1 = continuedCentralOddChannel 1) :
    GenuineFInfiniteContinuationData :=
  genuineContinuationData_of_comparison
    ((ComparisonFromOneLtAtOneData.of_analyticOnNhd_punctured
      hGenuine
      continuedCentralOddChannel_analyticOnNhd_punctured
      hEqAtOne).toComparisonFromOneLtData)

end AdjustedQuartetContinuationAudit
end C2
