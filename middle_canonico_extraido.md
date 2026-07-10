# Middle canônico — extração Lean

## PeerReview: canonicalNearAxisData, canonicalEdgeData e CanonicalMiddleObligation

```lean
`GenuineBulkConcrete.lean` route graph just to find the final RH endpoint.
-/

/-- Canonical near-axis package obtained directly from genuine continuation data. -/
noncomputable def canonicalNearAxisData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (continuation : GenuineFInfiniteContinuationData) :
    C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
    (coreCutoff := coreCutoff) (K := K) (M := M)
    continuation
    (GenuineFInfiniteNearAxisData.of_continuation continuation)

/-- Canonical empty edge package for the continued balancing-seed bulk model. -/
def canonicalEdgeData
    (coreCutoff : ℕ → ℕ) (K M : ℕ) :
    C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M :=
  C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
    (coreCutoff := coreCutoff) (K := K) (M := M)

/--
Pointwise middle obligation left after continuation supplies the canonical
near-axis package and the current route uses the empty edge package.
-/
abbrev CanonicalMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M) →
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s

/--
```

## PeerReview: ContinuationTerminalCertificate

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

## C2CanonicalClosedScaledLocalData: estrutura local canônica

```lean

/--
Pointwise local obligations that remain for the preferred `canonicalClosedScaled`
route once off-criticality is already known from the ambient middle region.
-/
-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
structure C2CanonicalClosedScaledLocalData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  horizontalScale_pos : 0 < horizontalScale s
  horizontalConstant_nonneg : 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : horizontalRatio s < 1
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
  quartet_dominance :
    c2QuartetBulkGUpper
        (c2BulkGUpper
          (c2TiltAnalyticRegularizedUpper
            (c2CanonicalClosedTiltConstant
              K M horizontalConstant horizontalScale horizontalRatio)
            (fun _ => (1 : ℝ)))
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio)) s +
      c2BulkEUpper
        (c2CutoffUpperFromScale
          (c2CanonicalClosedCutoffConstant K M)
          (fun _ => (1 : ℝ))) s <
        c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.of_residualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hscale_pos : 0 < horizontalScale s)
    (hconstant_nonneg : 0 ≤ horizontalConstant s)
    (hratio_nonneg : 0 ≤ horizontalRatio s)
    (hratio_lt_one : horizontalRatio s < 1)
    (hhorizontal : C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance :
      c2CanonicalClosedScaledResidualUpper
        K M horizontalConstant horizontalScale horizontalRatio s <
        c2ExpandedQuartetResidualMargin s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  refine {
    horizontalScale_pos := hscale_pos
    horizontalConstant_nonneg := hconstant_nonneg
    horizontalRatio_nonneg := hratio_nonneg
    horizontalRatio_lt_one := hratio_lt_one
    horizontalLayer_bound := hhorizontal.layer_bound
    quartet_dominance := ?_
  }
  simpa [c2CanonicalClosedScaledResidualUpper,
    C2ExpandedQuartetDominance, c2ExpandedQuartetLeftUpper,
    c2ExpandedQuartetGUpper, c2ExpandedQuartetEUpper,
    c2ExpandedQuartetK2Margin] using
    (c2ExpandedQuartetDominance_of_residualBound hdominance)

-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
theorem C2CanonicalClosedScaledLocalData.of_analyticResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
```

## Construtores: of_residualDominance e variantes próximas

```lean
        c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.of_residualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hscale_pos : 0 < horizontalScale s)
    (hconstant_nonneg : 0 ≤ horizontalConstant s)
    (hratio_nonneg : 0 ≤ horizontalRatio s)
    (hratio_lt_one : horizontalRatio s < 1)
    (hhorizontal : C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance :
      c2CanonicalClosedScaledResidualUpper
        K M horizontalConstant horizontalScale horizontalRatio s <
        c2ExpandedQuartetResidualMargin s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  refine {
    horizontalScale_pos := hscale_pos
    horizontalConstant_nonneg := hconstant_nonneg
    horizontalRatio_nonneg := hratio_nonneg
    horizontalRatio_lt_one := hratio_lt_one
    horizontalLayer_bound := hhorizontal.layer_bound
    quartet_dominance := ?_
  }
  simpa [c2CanonicalClosedScaledResidualUpper,
    C2ExpandedQuartetDominance, c2ExpandedQuartetLeftUpper,
    c2ExpandedQuartetGUpper, c2ExpandedQuartetEUpper,
    c2ExpandedQuartetK2Margin] using
    (c2ExpandedQuartetDominance_of_residualBound hdominance)

-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
theorem C2CanonicalClosedScaledLocalData.of_analyticResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hscale_pos : 0 < horizontalScale s)
    (hconstant_nonneg : 0 ≤ horizontalConstant s)
    (hratio_nonneg : 0 ≤ horizontalRatio s)
    (hratio_lt_one : horizontalRatio s < 1)
    (hhorizontal : C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance :
      c2CanonicalClosedScaledResidualUpper
        K M horizontalConstant horizontalScale horizontalRatio s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2CanonicalClosedScaledLocalData.of_residualDominance
    hscale_pos hconstant_nonneg hratio_nonneg hratio_lt_one hhorizontal
  simpa [c2ExpandedQuartetResidualMargin_eq_analyticBulkAllowance_sub_reserve_of_offCriticalStrip
    hoff] using
    hdominance

-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
theorem C2CanonicalClosedScaledLocalData.of_majorantAnalyticResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hoff : offCriticalStrip s)
    (hscale_pos : 0 < horizontalScale s)
    (hconstant_nonneg : 0 ≤ horizontalConstant s)
    (hratio_nonneg : 0 ≤ horizontalRatio s)
    (hratio_lt_one : horizontalRatio s < 1)
    (hhorizontal : C2ExpandedHorizontalLayerBudget
      coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance :
      c2CanonicalClosedScaledResidualMajorant
        K M horizontalConstant horizontalScale horizontalRatio s <
        c2AnalyticBulkAllowance s - c2ExpandedQuartetResidualReserve s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  apply C2CanonicalClosedScaledLocalData.of_analyticResidualDominance
    hoff hscale_pos hconstant_nonneg hratio_nonneg hratio_lt_one hhorizontal
  exact lt_of_le_of_lt
    (c2CanonicalClosedScaledResidualUpper_le_majorant_of_offCriticalStrip
      hoff)
    hdominance
```

## Porta pointwise: continuation + bounds separados -> RH

```lean
      (horizontalRatio := horizontalRatio)
      continuation hmiddle
  exact mathlibRiemannHypothesis_of_terminalData terminalData

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem offCriticalStripNonvanishing_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (continuation : GenuineFInfiniteContinuationData)
    (hscale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 < horizontalScale s)
    (hconstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 ≤ horizontalConstant s)
    (hratio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 ≤ horizontalRatio s)
    (hratio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (c2CanonicalClosedTiltConstant
                K M horizontalConstant horizontalScale horizontalRatio)
              (fun _ => (1 : ℝ)))
            (c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (c2CanonicalClosedCutoffConstant K M)
            (fun _ => (1 : ℝ))) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    offCriticalStripNonvanishing
      (c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M) := by
  exact offCriticalStripNonvanishing_of_canonicalClosedScaledMiddleLocalData {
    near :=
      C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
        (coreCutoff := coreCutoff) (K := K) (M := M)
        continuation
        (GenuineFInfiniteNearAxisData.of_continuation continuation)
    edge :=
      C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
        (coreCutoff := coreCutoff) (K := K) (M := M)
    middle_local := fun _ hs => {
      horizontalScale_pos := hscale_pos hs
      horizontalConstant_nonneg := hconstant_nonneg hs
      horizontalRatio_nonneg := hratio_nonneg hs
      horizontalRatio_lt_one := hratio_lt_one hs
      horizontalLayer_bound := (hhorizontal hs).layer_bound
      quartet_dominance := hdominance hs
    }
  }

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem mathlibRiemannHypothesis_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (continuation : GenuineFInfiniteContinuationData)
    (hscale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 < horizontalScale s)
    (hconstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 ≤ horizontalConstant s)
    (hratio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      0 ≤ horizontalRatio s)
    (hratio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion
        (C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
          (coreCutoff := coreCutoff) (K := K) (M := M)
          continuation
          (GenuineFInfiniteNearAxisData.of_continuation continuation))
        (C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
          (coreCutoff := coreCutoff) (K := K) (M := M)) →
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (c2CanonicalClosedTiltConstant
                K M horizontalConstant horizontalScale horizontalRatio)
              (fun _ => (1 : ℝ)))
            (c2HorizontalRegularizedUpper
              horizontalConstant horizontalScale horizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (c2CanonicalClosedCutoffConstant K M)
            (fun _ => (1 : ℝ))) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    RiemannHypothesis := by
  exact mathlibRiemannHypothesis_of_canonicalClosedScaledMiddleLocalData {
    near :=
      C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofGenuineFInfiniteNearAxisData
        (coreCutoff := coreCutoff) (K := K) (M := M)
        continuation
        (GenuineFInfiniteNearAxisData.of_continuation continuation)
    edge :=
      C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty
        (coreCutoff := coreCutoff) (K := K) (M := M)
    middle_local := fun _ hs => {
      horizontalScale_pos := hscale_pos hs
```

## toEstimates / ofEstimates / of_mem_scaledRegion

```lean
    hoff hscale_pos hconstant_nonneg hratio_nonneg hratio_lt_one hhorizontal
  exact lt_of_le_of_lt
    (c2CanonicalClosedScaledResidualVerticalBudgetUpper_le_finiteExactZeta_of_offCriticalStrip
      hoff)
    hdominance

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.toEstimates
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} (hoff : offCriticalStrip s)
    (data : C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    C2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledEstimates
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  exact {
    offCritical := hoff
    horizontalScale_pos := data.horizontalScale_pos
    horizontalConstant_nonneg := data.horizontalConstant_nonneg
    horizontalRatio_nonneg := data.horizontalRatio_nonneg
    horizontalRatio_lt_one := data.horizontalRatio_lt_one
    horizontalLayer_bound := data.horizontalLayer_bound
    quartet_dominance := data.quartet_dominance
  }

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.ofEstimates
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hs : C2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledEstimates
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s := by
  exact {
    horizontalScale_pos := hs.horizontalScale_pos
    horizontalConstant_nonneg := hs.horizontalConstant_nonneg
    horizontalRatio_nonneg := hs.horizontalRatio_nonneg
    horizontalRatio_lt_one := hs.horizontalRatio_lt_one
    horizontalLayer_bound := hs.horizontalLayer_bound
    quartet_dominance := hs.quartet_dominance
  }

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2CanonicalClosedScaledLocalData.of_mem_scaledRegion
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (hs : s ∈ c2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledRegion
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s :=
  C2CanonicalClosedScaledLocalData.ofEstimates hs

-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
theorem C2ExpandedScalarLocalBulkData.toCanonicalClosedScaledLocalData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ}
    (data : C2ExpandedScalarLocalBulkData
      coreCutoff K M
      (c2CanonicalClosedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ))
      horizontalConstant horizontalScale horizontalRatio
      (c2CanonicalClosedCutoffConstant K M)
      (fun _ => (1 : ℝ)) s) :
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s :=
  C2CanonicalClosedScaledLocalData.of_mem_scaledRegion
    data.mem_canonicalClosedScaledRegion
```

## Middle regional: middle local em toda a região

```lean
    horizontalRatio_lt_one := hs.horizontalRatio_lt_one
    horizontalLayer_bound := hs.horizontalLayer_bound
    quartet_dominance := by
      simpa using hs.quartet_dominance
  }

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
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) where
  near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M
  edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M
  middle_local : ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s

def C2CanonicalClosedScaledMiddleLocalData.ofMiddleRegionData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2CanonicalClosedScaledMiddleRegionData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio) :
    C2CanonicalClosedScaledMiddleLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio where
  near := data.near
  edge := data.edge
  middle_local := fun _ hs =>
    C2CanonicalClosedScaledLocalData.ofEstimates (data.middle_local hs)

def C2CanonicalClosedScaledMiddleLocalData.ofExpandedScalarMiddleRegionData
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (data : C2ExpandedScalarMiddleRegionData
      coreCutoff K M
      (c2CanonicalClosedTiltConstant
        K M horizontalConstant horizontalScale horizontalRatio)
      (fun _ => (1 : ℝ))
      horizontalConstant horizontalScale horizontalRatio
```
