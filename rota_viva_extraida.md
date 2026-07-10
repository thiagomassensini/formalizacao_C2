
## PeerReview: ContinuationTerminalCertificate -> toTerminalData -> RH

```lean
/--
Audit-facing certificate matching the most compressed current endpoint:
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
  middle : CanonicalMiddleObligation
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

/-- Public endpoint: a continuation terminal certificate implies mathlib RH. -/
theorem riemannHypothesis_of_continuationTerminalCertificate
    (cert : ContinuationTerminalCertificate) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_terminalData cert.toTerminalData

/--
Audit-facing certificate in the pre-packaged middle-region style from the
manifesto. This version is convenient when near, middle, and edge data have
```

## Terminal: ofContinuationAndMiddleLocal -> mathlibRiemannHypothesis_of_continuationAndMiddleLocal

```lean
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      continuation near hmiddle
  exact mathlibRiemannHypothesis_of_terminalData terminalData

noncomputable def RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (continuation : GenuineFInfiniteContinuationData)
    (hmiddle : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      C2CanonicalClosedScaledLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    RiemannHypothesisTerminalData := by
  let nearC2 :=
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
      (coreCutoff := coreCutoff) (K := K) (M := M)
      continuation
      (GenuineFInfiniteNearAxisData.of_continuation continuation)
  let edgeC2 :=
    C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
      (coreCutoff := coreCutoff) (K := K) (M := M)
  exact (RiemannHypothesisTerminalData.ofMiddleLocalData {
    near := nearC2
    edge := edgeC2
    middle_local := fun _ hs => hmiddle hs
  })

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_continuationAndMiddleLocal
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (continuation : GenuineFInfiniteContinuationData)
    (hmiddle : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      C2CanonicalClosedScaledLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    RiemannHypothesis := by
  let terminalData :=
    RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal
      (coreCutoff := coreCutoff) (K := K) (M := M)
      (horizontalConstant := horizontalConstant)
      (horizontalScale := horizontalScale)
      (horizontalRatio := horizontalRatio)
      continuation hmiddle
  exact mathlibRiemannHypothesis_of_terminalData terminalData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds
```

## TerminalData: mathlibRiemannHypothesis_of_terminalData

```lean
      data.horizontalConstant data.horizontalScale data.horizontalRatio :=
  data.middle.toCoverData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_terminalData
    (data : RiemannHypothesisTerminalData) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel
        data.coreCutoff data.K data.M) :=
  offCriticalStripNonvanishing_of_canonicalClosedScaledMiddleLocalData
    data.middle

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_terminalData
    (data : RiemannHypothesisTerminalData) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_canonicalClosedScaledMiddleLocalData
    data.middle

def RiemannHypothesisTerminalData.ofMiddleLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
```

## MiddleLocalData: RH por middle local canônico

```lean
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio :=
  data.toMiddleRegionData.toCoverData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_canonicalClosedScaledMiddleLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) :=
  offCriticalStripNonvanishing_of_canonicalClosedScaledDirectMiddleRegionData
    data.toMiddleRegionData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_canonicalClosedScaledMiddleLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_canonicalClosedScaledDirectMiddleRegionData
    data.toMiddleRegionData

/--
Terminal placeholder package for a fully formal C2 proof of RH.
Once an inhabitant of this structure is constructed, Lean accepts
`RiemannHypothesis` with no further analytic plumbing.
-/
structure RiemannHypothesisTerminalData where
  coreCutoff : ℕ → ℕ
```

## Cover canônico -> quartetConcreteCover

```lean

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_canonicalClosedScaledCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) := by
  simpa [C2CanonicalClosedScaledCoverData.toOffCriticalCoverData,
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData.toNearAxisRouteData] using
    offCriticalStripNonvanishing_of_coverData data.toOffCriticalCoverData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_canonicalClosedScaledCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_quartetConcreteCover
    data.near data.edge
    (fun s hs => by
      rcases data.cover s hs with hnear | hmiddle | hedge
      · exact Or.inl hnear
      · exact Or.inr <| Or.inl <|
          c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_scaledCanonicalClosedRegion
            hmiddle
      · exact Or.inr <| Or.inr hedge)

noncomputable def C2CanonicalClosedScaledMiddleCoverData.toCoverData
```

## quartetConcreteCover -> bulkRegionCover

```lean
        intro s hs
        exact
          c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetConcreteRegion
            hs
    }
  F_eq := rfl

-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
theorem
    mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_quartetConcreteCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M)
    (cover : ∀ s : ℂ, offCriticalStrip s →
      s ∈ nearAxisRegion riemannZeta near.near_axis.radius ∨
        s ∈ c2OddTailContinuedBalancingSeedBulkQuartetConcreteRegion
          coreCutoff K M
          tiltConstant tiltScale
          horizontalConstant horizontalScale horizontalRatio
          cutoffConstant cutoffScale ∨
        s ∈ edge.edgeRegion) :
    RiemannHypothesis := by
  exact
    mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_bulkRegionCover
      near
      (c2OddTailContinuedBalancingSeedBulkQuartetConcreteBulkRegionData
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale)
```

## bulkRegionCover -> cover_offCritical

```lean
    {s : ℂ} (hs : s ∈ data.bounds.bulkRegion) :
    c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M s ≠ 0 := by
  simpa [data.F_eq] using regionalVerticalQuartetBulk_nonvanishing_of_bounds data.bounds hs

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem
    mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_bulkRegionCover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (bulk : C2OddTailContinuedBalancingSeedBulkModelBulkRegionData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M)
    (cover : ∀ s : ℂ, offCriticalStrip s →
      s ∈ nearAxisRegion riemannZeta near.near_axis.radius ∨
        s ∈ bulk.bulk.bulkRegion ∨ s ∈ edge.edgeRegion) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_cover_offCritical
    (OffCriticalCoverData.ofNearBulkRegionEdge
      near.toNearAxisRouteData
      bulk.bulk
      edge.toEdgeRouteData
      (by
```

## cover_offCritical -> Roadmap coverData offCriticalIdentity

```lean
-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity_offCritical
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    FundamentalIdentityOnOffCriticalStrip
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) riemannZeta :=
  FundamentalIdentityOnRightHalfPlane.toOffCriticalStrip
    (c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity coreCutoff K M)

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_oddTailContinuedBalancingSeedBulkModel_cover_offCritical
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (cover : OffCriticalCoverData)
    (hCoverF : cover.F = c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_coverData_offCriticalIdentity cover
    (by
      simpa [hCoverF] using
        c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity_offCritical
          coreCutoff K M)

/-- Specialized near/bulk/edge cover instantiation for the continued bulk model. -/
```

## Roadmap: coverData offCriticalIdentity

```lean

theorem mathlibRiemannHypothesis_of_coverData
    (data : OffCriticalCoverData)
    (identity : FundamentalIdentityOnRightHalfPlane data.F riemannZeta) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_genuineRouteData (data.toGenuineRouteData identity)

theorem mathlibRiemannHypothesis_of_coverData_offCriticalIdentity
    (data : OffCriticalCoverData)
    (identity : FundamentalIdentityOnOffCriticalStrip data.F riemannZeta) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_F_nonvanishing_offCriticalIdentity
    identity (offCriticalStripNonvanishing_of_coverData data)

theorem mathlibRiemannHypothesis_of_nearBulkRegionEdge
    (near : NearAxisRouteData)
```

## Transfer: F nonvanishing offCriticalIdentity -> RiemannHypothesis

```lean
theorem mathlibRiemannHypothesis_of_F_nonvanishing
    {F : Complex -> Complex}
    (hId : FundamentalIdentityOnRightHalfPlane F riemannZeta)
    (hF : offCriticalStripNonvanishing F) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_offCriticalStripNonvanishing
    (offCriticalStrip_zeta_nonvanishing_of_F_nonvanishing hId hF)

theorem mathlibRiemannHypothesis_of_F_nonvanishing_offCriticalIdentity
    {F : Complex -> Complex}
    (hId : FundamentalIdentityOnOffCriticalStrip F riemannZeta)
    (hF : offCriticalStripNonvanishing F) :
    RiemannHypothesis := by
  refine mathlibRiemannHypothesis_of_offCriticalStripNonvanishing ?_
  intro s hs hz
  have hEq := hId s hs
  rw [hz, mul_zero] at hEq
  exact hF s hs hEq
```
