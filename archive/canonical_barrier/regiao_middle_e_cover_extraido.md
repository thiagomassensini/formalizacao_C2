# Região middle e cover — extração Lean

## Definição de c2ExpandedScalarMiddleRegion e cover

```lean
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_expandedScalarCanonicalRegions
    (tiltConstant := tiltConstant) (tiltScale := tiltScale)
    (horizontalConstant := horizontalConstant) (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)
    (cutoffConstant := cutoffConstant) (cutoffScale := cutoffScale)
    near edge
    (fun s hs => by
      rcases cover s hs with hnear | hrest
      · exact C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_nearAxis hnear
      · rcases hrest with hbulk | hedge
        · exact C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_scalarRegion hbulk
        · exact C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_edge hedge)

/-- Off-critical points that are in neither the near-axis region nor the edge region. -/
def c2ExpandedScalarMiddleRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) : Set ℂ :=
  {s | offCriticalStrip s ∧
    s ∉ nearAxisRegion riemannZeta near.near_axis.radius ∧
    s ∉ edge.edgeRegion}

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem c2ExpandedScalarMiddleRegion_cover
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M)
    {bulkRegion : Set ℂ}
    (hmiddle : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      s ∈ bulkRegion) :
    ∀ s : ℂ, offCriticalStrip s →
      s ∈ nearAxisRegion riemannZeta near.near_axis.radius ∨
        s ∈ bulkRegion ∨ s ∈ edge.edgeRegion := by
  intro s hs
  by_cases hnear : s ∈ nearAxisRegion riemannZeta near.near_axis.radius
  · exact Or.inl hnear
  · by_cases hedge : s ∈ edge.edgeRegion
    · exact Or.inr <| Or.inr hedge
    · exact Or.inr <| Or.inl <| hmiddle ⟨hs, hnear, hedge⟩

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_expandedScalarMiddleRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
```

## Teoremas imediatos usando c2ExpandedScalarMiddleRegion

```lean
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M)
    (hmiddle : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        near edge →
      s ∈ c2ExpandedExactZetaScalarRegion
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) :=
  offCriticalStripNonvanishing_of_expandedScalarCanonicalScalarCover near edge
    (fun s hs => by
      by_cases hnear : s ∈ nearAxisRegion riemannZeta near.near_axis.radius
      · exact Or.inl hnear
      · by_cases hedge : s ∈ edge.edgeRegion
        · exact Or.inr <| Or.inr hedge
        · exact Or.inr <| Or.inl <| hmiddle ⟨hs, hnear, hedge⟩)

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_expandedScalarMiddleRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M)
    (hmiddle : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        near edge →
      s ∈ c2ExpandedExactZetaScalarRegion
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_expandedScalarCanonicalScalarCover near edge
    (fun s hs => by
      by_cases hnear : s ∈ nearAxisRegion riemannZeta near.near_axis.radius
      · exact Or.inl hnear
      · by_cases hedge : s ∈ edge.edgeRegion
        · exact Or.inr <| Or.inr hedge
        · exact Or.inr <| Or.inl <| hmiddle ⟨hs, hnear, hedge⟩)

structure C2ExpandedScalarCanonicalCoverData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ) where
  near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M
  edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M
  cover : ∀ s : ℂ, offCriticalStrip s →
    s ∈ nearAxisRegion riemannZeta near.near_axis.radius ∨
      s ∈ c2ExpandedScalarLocalBulkRegion
        coreCutoff K M
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale ∨
      s ∈ edge.edgeRegion

noncomputable def C2ExpandedScalarCanonicalCoverData.toCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
```

## C2CanonicalClosedScaledCoverData e cover canônico

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
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio where
  near := data.near
  edge := data.edge
  cover := c2ExpandedScalarMiddleRegion_cover data.near data.edge data.middle_scaled

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_canonicalClosedScaledMiddleCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleCoverData
```

## cover := c2ExpandedScalarMiddleRegion_cover

```lean
noncomputable def C2CanonicalClosedScaledMiddleCoverData.toCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio where
  near := data.near
  edge := data.edge
  cover := c2ExpandedScalarMiddleRegion_cover data.near data.edge data.middle_scaled

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_canonicalClosedScaledMiddleCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) :=
  offCriticalStripNonvanishing_of_canonicalClosedScaledCoverData data.toCoverData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_canonicalClosedScaledMiddleCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    RiemannHypothesis :=
  mathlibRiemannHypothesis_of_canonicalClosedScaledCoverData data.toCoverData

/--
Regional middle-strip package directly in the preferred `canonicalClosedScaled`
estimates. This is the most economical pointwise target for the remaining
middle-strip analytic work.
-/
-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
```

## MiddleLocalData.toCoverData

```lean
def C2CanonicalClosedScaledMiddleLocalData.toMiddleCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledMiddleCoverData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio :=
  data.toMiddleRegionData.toMiddleCoverData

noncomputable def C2CanonicalClosedScaledMiddleLocalData.toCoverData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledCoverData
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
```

## TerminalData.toCoverData e mathlibRiemannHypothesis_of_terminalData

```lean
  horizontalRatio : ℂ → ℝ
  middle : C2CanonicalClosedScaledMiddleLocalData
    coreCutoff K M horizontalConstant horizontalScale horizontalRatio

def RiemannHypothesisTerminalData.toMiddleLocalData
    (data : RiemannHypothesisTerminalData) :
    C2CanonicalClosedScaledMiddleLocalData
      data.coreCutoff data.K data.M
      data.horizontalConstant data.horizontalScale data.horizontalRatio :=
  data.middle

noncomputable def RiemannHypothesisTerminalData.toCoverData
    (data : RiemannHypothesisTerminalData) :
    C2CanonicalClosedScaledCoverData
      data.coreCutoff data.K data.M
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

## Barreira formal local canônica

```lean

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.mem_scaledRegion_of_middle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    {s : ℂ}
    (hs : s ∈ c2ExpandedScalarMiddleRegion near edge)
    (data : C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    s ∈ c2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledRegion
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio :=
  data.toEstimates hs.1

-- ROUTE_TAG: FORMAL_BARRIER
theorem not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} (hs : offCriticalStrip s) :
    ¬ C2CanonicalClosedScaledLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  intro data
  have hresidual_lt :
      c2CanonicalClosedScaledResidualUpper
          K M horizontalConstant horizontalScale horizontalRatio s <
        c2ExpandedQuartetResidualMargin s := by
    have hdom := data.quartet_dominance
    simp [c2CanonicalClosedScaledResidualUpper, c2ExpandedQuartetResidualUpper,
      c2ExpandedQuartetResidualMargin, c2ExpandedQuartetK2Margin,
      c2QuartetBulkGUpper, c2BulkGUpper, c2BulkEUpper,
      c2CutoffUpperFromScale] at hdom ⊢
    linarith
  exact
    (not_c2CanonicalClosedScaledResidualUpper_lt_residualMargin_of_offCriticalStrip
      hs
      data.horizontalScale_pos
      data.horizontalConstant_nonneg
      data.horizontalRatio_lt_one)
      hresidual_lt

/--
Regional middle-strip package in the minimal pointwise local obligations for the
preferred `canonicalClosedScaled` route.
-/
structure C2CanonicalClosedScaledMiddleLocalData
```

## Barreira residual original

```lean
          c2CanonicalClosedCutoffConstant K M s := by
    exact add_nonneg
      (mul_nonneg hhorizontal_nonneg hcoeff₂_nonneg)
      hcutoff_nonneg
  linarith

-- ROUTE_TAG: FORMAL_BARRIER
theorem not_c2CanonicalClosedScaledResidualUpper_lt_residualMargin_of_offCriticalStrip
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} (hs : offCriticalStrip s)
    (hscale : 0 < horizontalScale s)
    (hconstant : 0 ≤ horizontalConstant s)
    (hratio_lt_one : horizontalRatio s < 1) :
    ¬ c2CanonicalClosedScaledResidualUpper
          K M horizontalConstant horizontalScale horizontalRatio s <
        c2ExpandedQuartetResidualMargin s := by
  intro hlt
  have htail_le :
      verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) ≤
        c2CanonicalClosedScaledResidualUpper
          K M horizontalConstant horizontalScale horizontalRatio s :=
    scaledVerticalDepthTail_linearCoefficient_le_c2CanonicalClosedScaledResidualUpper_of_offCriticalStrip
      hs hscale hconstant hratio_lt_one
  have htarget_lt :
      c2ExpandedQuartetResidualMargin s <
        verticalDepthTailUpper s * ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) :=
    c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_linearCoefficient_of_offCriticalStrip hs
```
