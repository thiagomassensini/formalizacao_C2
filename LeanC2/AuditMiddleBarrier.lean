import LeanC2.PeerReview

namespace C2

theorem audit_CanonicalMiddleObligation_forces_middle_empty
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (continuation : GenuineFInfiniteContinuationData)
    (hmiddle : PeerReview.CanonicalMiddleObligation
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (PeerReview.canonicalNearAxisData coreCutoff K M continuation)
        (PeerReview.canonicalEdgeData coreCutoff K M) →
      False := by
  intro s hs
  exact
    (not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip hs.1)
      (hmiddle hs)

theorem audit_ContinuationTerminalCertificate_forces_middle_empty
    (cert : PeerReview.ContinuationTerminalCertificate) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (PeerReview.canonicalNearAxisData cert.coreCutoff cert.K cert.M cert.continuation)
        (PeerReview.canonicalEdgeData cert.coreCutoff cert.K cert.M) →
      False := by
  intro s hs
  exact
    audit_CanonicalMiddleObligation_forces_middle_empty
      cert.continuation cert.middle hs

theorem audit_ContinuationTerminalCertificate_forces_near_or_edge_cover
    (cert : PeerReview.ContinuationTerminalCertificate) :
    ∀ ⦃s : ℂ⦄,
      offCriticalStrip s →
      s ∈ nearAxisRegion riemannZeta
        (PeerReview.canonicalNearAxisData
          cert.coreCutoff cert.K cert.M cert.continuation).near_axis.radius ∨
      s ∈ (PeerReview.canonicalEdgeData
        cert.coreCutoff cert.K cert.M).edgeRegion := by
  intro s hs
  by_cases hnear :
      s ∈ nearAxisRegion riemannZeta
        (PeerReview.canonicalNearAxisData
          cert.coreCutoff cert.K cert.M cert.continuation).near_axis.radius
  · exact Or.inl hnear
  · by_cases hedge :
      s ∈ (PeerReview.canonicalEdgeData
        cert.coreCutoff cert.K cert.M).edgeRegion
    · exact Or.inr hedge
    · have hmid :
        s ∈ c2ExpandedScalarMiddleRegion
          (PeerReview.canonicalNearAxisData
            cert.coreCutoff cert.K cert.M cert.continuation)
          (PeerReview.canonicalEdgeData
            cert.coreCutoff cert.K cert.M) := by
        exact ⟨hs, hnear, hedge⟩
      have hfalse :=
        audit_ContinuationTerminalCertificate_forces_middle_empty cert hmid
      exact False.elim hfalse


theorem audit_ContinuationTerminalCertificate_forces_near_cover
    (cert : PeerReview.ContinuationTerminalCertificate) :
    ∀ ⦃s : ℂ⦄,
      offCriticalStrip s →
      s ∈ nearAxisRegion riemannZeta
        (PeerReview.canonicalNearAxisData
          cert.coreCutoff cert.K cert.M cert.continuation).near_axis.radius := by
  intro s hs
  have hnear_or_edge :=
    audit_ContinuationTerminalCertificate_forces_near_or_edge_cover cert hs
  rcases hnear_or_edge with hnear | hedge
  · exact hnear
  · exfalso
    simpa [
      PeerReview.canonicalEdgeData,
      C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
    ] using hedge

end C2

