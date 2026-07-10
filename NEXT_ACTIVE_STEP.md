# NEXT_ACTIVE_STEP

Active route:
  genuine middle no-cancellation

Target:
  genuineCentralDoubleSeries s != 0

Lean file:
  LeanC2/AuditGenuineMiddle.lean

Compile status:
  lake env lean LeanC2/AuditGenuineMiddle.lean passes

Primary candidate:
  C2ExactGapAnchorPhaseDiskOnMiddle

Primary candidate missing assumptions:
  1. horizontal scale/sign data on middle
  2. C2ExpandedHorizontalLayerBudget on middle
  3. C2ContinuedOddHalfDiskBoundOnMiddle, or anchor-residual form
  4. C2ExactGapAnchorPhaseDiskBudgetOnMiddle

Alternative/latest tracker candidate:
  twoCoreDepthLimitDefect / fineLimitDefect criterion

Alternative candidate missing assumption:
  a single norm inequality comparing genuineCentralDoubleSeries with
  superGaussianTwoCoreDepthLimit at the dyadic64 cutoff chosen by Lean

Exact current Lean obligation:

```lean
-- ASCII rendering of:
-- C2.GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_twoCoreLimit
-- for hs : 0 < s.re and hsle : s.re <= 1.
exists K,
  2 <= K /\
    0 <
      superGaussianFiniteTwoCoreUnitStripNormLower K
        (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s
      - 8 * (1 / 2) ^ (K + 1) /\
    (norm (genuineCentralDoubleSeries s -
        superGaussianTwoCoreDepthLimit
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s) <
      superGaussianFiniteTwoCoreUnitStripNormLower K
        (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s
      - 8 * (1 / 2) ^ (K + 1) ->
      GenuineCentralNoCancellation s)
```

Current next theorem candidate:
  twoCoreDepthLimitDefect_bound_at_tailStableDyadic64

Normalized Lean surface:
  LeanC2/AuditGenuineMiddle.lean now has:
  - twoCoreDepthLimitDefectAt K s
  - twoCoreDepthStableGapAt K s
  - C2TwoCoreDepthLimitDefectBudget K s
  - C2TwoCoreDepthLimitDefectBudget.of_upper
  - C2TwoCoreDepthLimitDefectBudget.raw
  - genuineCentralNoCancellation_of_twoCoreDepthLimitDefectBudget
  - twoCoreDepthLimitDefectAt_le_finiteApproxDepthTail_three
  - C2TwoCoreDepthLimitDefectBudget.of_finiteApproxDepthTail_three
  - finiteApproxDepthTailThreeUpperAt K L s
  - C2FiniteApproxDepthTailThreeGapBudget K L s
  - C2TwoCoreDepthLimitDefectBudget.of_finiteApproxDepthTailThreeGapBudget
  - tendsto_finiteApproxDepthTailThreeUpperAt
  - eventually_finiteApproxDepthTailThreeGapBudget_of_twoCoreDepthLimitDefectBudget
  - exists_finiteApproxDepthTailThreeGapBudget_of_twoCoreDepthLimitDefectBudget
  - exists_finiteApproxDepthTailThreeGapBudget_iff_twoCoreDepthLimitDefectBudget
  - superGaussianFiniteTwoCoreUnitStripScalarMargin s
  - C2TwoCoreDepthLimitDefectScalarMarginBudget K s
  - C2TwoCoreDepthLimitDefectBudget.of_scalarMarginBudget

Current classification:
  A. The extracted obligation only involves genuineCentralDoubleSeries,
  superGaussianTwoCoreDepthLimit, the dyadic64 K/X selected by Lean, and a norm
  gap against superGaussianFiniteTwoCoreUnitStripNormLower.

Anatomy hooks already present:
  - superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra
  - superGaussianFiniteCoreDepthLimit_sub_lower_eq_band
  - superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band
  - genuineCentralNoCancellation_of_fineLimitDefect_budget
  - exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineLimitDefect
  - genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo

Immediate anatomy question:
  D_fine is now the finite two-core approximation error plus the finite-core
  depth tail:
    norm (genuineCentralDoubleSeries s -
      superGaussianFiniteGenuineRectangle 2
        (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s (L + 1) 3)
    + superGaussianFiniteCoreDepthTailNormUpper 3
        (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L.
  The next payment is:
    D_fine < twoCoreDepthStableGapAt K s.
  Lean now proves:
    Tendsto (fun L => finiteApproxDepthTailThreeUpperAt K L s)
      atTop (nhds (twoCoreDepthLimitDefectAt K s)).
  This means the finite upper approximates the actual two-core defect; the
  depth-tail term does not make the defect vanish by itself.
  Lean also proves, assuming hs : 0 < s.re:
    (exists L, C2FiniteApproxDepthTailThreeGapBudget K L s)
      <-> C2TwoCoreDepthLimitDefectBudget K s.
  Therefore the finite D_fine surface and the limit defect budget are aligned:
  choosing large L does not bypass the real limit-defect inequality.

Current theorem split:
  A. anatomy:
     twoCoreDepthLimitDefectAt K s <= D
  B. payment:
     D < twoCoreDepthStableGapAt K s
  The adapter C2TwoCoreDepthLimitDefectBudget.of_upper combines A and B.
  The wrapper genuineCentralNoCancellation_of_twoCoreDepthLimitDefectBudget
  sends the resulting budget plus an explicit depth-stability input to
  GenuineCentralNoCancellation s.
  The specialized adapter
  C2TwoCoreDepthLimitDefectBudget.of_finiteApproxDepthTail_three combines the
  finiteApproxDepthTail anatomy with the remaining D_fine payment.
  The named-budget adapter
  C2TwoCoreDepthLimitDefectBudget.of_finiteApproxDepthTailThreeGapBudget
  consumes C2FiniteApproxDepthTailThreeGapBudget K L s directly.
  The scalar-margin extractor
  C2TwoCoreDepthLimitDefectScalarMarginBudget.marginNine
  recovers the old marginNine trigger from the scalar defect budget.
  The endpoint wrapper
  genuineCentralNoCancellation_of_twoCoreDepthLimitDefectScalarMarginBudget
  derives depth-stability internally and no longer carries hstable as an
  external hypothesis.
  The existential endpoint wrapper
  genuineCentralNoCancellation_of_exists_twoCoreDepthLimitDefectScalarMarginBudget
  makes the official next obligation:
    exists K >= 2,
      C2TwoCoreDepthLimitDefectScalarMarginBudget K s.
  The adapter
  C2TwoCoreDepthLimitDefectScalarMarginBudget.of_defectUpper
  separates that obligation into:
    twoCoreDepthLimitDefectAt K s <= D
    D + 9 * (1 / 2) ^ (K + 1)
      < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
  The asymptotic adapter
  exists_twoCoreDepthLimitDefectScalarMarginBudget_of_eventually_defectUpper_lt_margin
  proves that an eventual defect upper D below the scalar margin is enough:
    eventually twoCoreDepthLimitDefectAt K s <= D
    D < superGaussianFiniteTwoCoreUnitStripScalarMargin s
    ->
    exists K >= 2, C2TwoCoreDepthLimitDefectScalarMarginBudget K s.

Current K-defect audit:
  No direct theorem was found for
    Tendsto (fun K => twoCoreDepthLimitDefectAt K s) atTop ...
  or for an eventual upper of twoCoreDepthLimitDefectAt K s.
  Existing route material is instead:
    - direct two-core criterion;
    - minimal M = N = 3 collapse;
    - fineLimitDefect with visible band/extra saldos for larger M,N.
  The anatomy bridge
  twoCoreDepthLimitDefectAt_le_finiteApproxDepthTail_bandExtraSaldo
  now bounds the raw two-core defect by the finite fine surface:
    finite genuine approximation error
    + finite-core depth tail
    + bandSaldo
    + extraSaldo.
  The finite fine surface is now named by:
    finiteApproxDepthTailBandExtraUpperAt K M N L s.
  The scalar payment budget is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget K M N L s.
  The wrapper
    C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteApproxDepthTailBandExtra
  sends this named budget to the two-core scalar-margin budget.
  The adapter
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_upper
  replaces the full fine ledger by any external upper D.
  The adapter
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_componentUpper
  splits the ledger into component uppers:
    A = finite approximation error
    B = finite-core depth tail
    C = bandSaldo
    E = extraSaldo

Current technical saldo audit:
  A = finite approximation error is now formally named:
    finiteApproxErrorAt K N L s.
  Its depth-limit object is:
    finiteCoreLimitDefectAt K N s.
  Lean proves:
    tendsto_finiteApproxErrorAt
  and the eventual allowance form:
    eventually_finiteApproxErrorAt_le_limitDefect_add_allowance.
  The route wrapper:
    exists_flexibleSelfBandBudget_of_limitApproxExtraMarginBudget
  removes the finite approximation depth L from A by paying any alpha > 0.
  The finite-depth payment surface is:
    finiteCoreLimitDefectAt K N s
      + alpha + beta + E
      + 9 * (1 / 2) ^ (K + 1)
        < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
  Lean also has the direct limit-level bridge:
    twoCoreDepthLimitDefectAt_le_finiteCoreLimitDefect_extraSaldo.
  The scalar-margin consumer:
    C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitDefect_extraSaldo
  removes L, alpha, and beta from the active endpoint payment.
  The canonical extra-saldo self upper is:
    C2ExtraSaldoUpperBudget.self.
  The canonical A+E debt is:
    finiteCoreLimitExtraDebtAt K N s.
  The terminal scalar-margin budget is:
    C2FiniteCoreLimitExtraScalarMarginBudget K N s.
  The endpoint consumer:
    C2TwoCoreDepthLimitDefectScalarMarginBudget.of_finiteCoreLimitExtra
  removes the external E parameter from the active endpoint payment.
  The endpoint no-cancellation wrappers are:
    genuineCentralNoCancellation_of_finiteCoreLimitExtraScalarMarginBudget
    genuineCentralNoCancellation_of_exists_finiteCoreLimitExtraScalarMarginBudget.
  The active direct payment is now:
    finiteCoreLimitExtraDebtAt K N s
      + 9 * (1 / 2) ^ (K + 1)
        < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
  A_N structural audit is now explicit:
    centralFiniteCoreTailUpper K N L s
      =
    finiteApproxErrorAt K N L s
      + superGaussianFiniteCoreDepthTailNormUpper N
          (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s L.
  Lean proves:
    finiteCoreLimitDefectAt_le_centralFiniteCoreTailUpper.
  Classification:
    finiteCoreLimitDefectAt K N s has a genuine-first structural upper by
    finite rectangle error plus finite-core depth tail.
    This is not yet a closed scalar bound; the hard remaining component is an
    upper for finiteApproxErrorAt K N L s, or an equivalent direct upper for
    finiteCoreLimitDefectAt K N s.
  The terminal budget can now be paid from that structural upper by:
    C2FiniteCoreLimitExtraScalarMarginBudget.of_centralFiniteCoreTailUpper.
  The finite approximation error itself is now opened as:
    finiteApproxErrorAt_le_rawCentralRectangleTail_add_cutoffResidual.
  This proves:
    finiteApproxErrorAt K N L s
      <= rawCentralRectangleTailAt N L s
        + superGaussianFiniteGenuineCutoffResidualNormUpper 2 (L + 1) N
            (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s.
  The cutoff residual side is already explicit and has existing algebraic
  upper machinery.  The raw central rectangle tail is now named by:
    rawCentralRectangleTailAt N L s
      = norm (genuineCentralDoubleSeries s - rectangularGenuine s (L + 1) N).
  Lean now also proves the algebraic/Taylor-style cutoff variant:
    finiteApproxErrorAt_le_rawCentralRectangleTail_add_cutoffResidualAlgebraicUpper.
  This replaces the residual norm upper by:
    superGaussianFiniteGenuineCutoffResidualAlgebraicUpper 2 (L + 1) N
      (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s.
  This is the route-compatible part of the finite Taylor cutoff note:
    p = 2 gives an explicit finite algebraic cutoff debt.
  The Mellin-Barnes/global continuation side of that note is not an active
  proof input for the genuine-first middle route.
  Current obstruction:
    prove or identify a genuine-first upper/tendsto control for
    rawCentralRectangleTailAt N L s.
  Raw-tail semantic classification:
    no theorem was located that provides this exact budget:
      C2RawCentralRectangleTailUpperBudget N L s R.
    This is not a non-convergence claim and not a terminal/classical
    obstruction.  It means only that the genuine-first split/convergence
    connecting rectangularGenuine s (L + 1) N to genuineCentralDoubleSeries s
    in this rectangle family has not yet been identified or proved.
    Therefore no unconditional rawCentralRectangleTailNormUpper was created.
  Honest raw-tail interface now present:
    C2RawCentralRectangleTailUpperBudget N L s R
      :=
    rawCentralRectangleTailAt N L s <= R.
  The route-facing consumer is:
    C2FiniteCoreLimitExtraScalarMarginBudget.of_rawCentralTailBudget_cutoffAlgebraic.
  It proves that an external genuine-first raw tail bound R plus the algebraic
  cutoff residual, finite-core depth tail, extra-core saldo, and dyadic64 tax
  pays the terminal scalar-margin budget.
  Bracket-decay audit:
    Lean now records:
      genuineBracketAddressTerm_eq_weighted_secondDifference
      genuineCentralExplicitAddressTerm_eq_lateral_sub_bracket
      genuineCentralBracketBridgeCorrectionTerm
      genuineCentralExplicitAddressTerm_eq_bracket_add_bridgeCorrection
      genuineCentralBracketBridgeCorrectionTerm_eq_weighted_residual
    The first theorem identifies the bracket address term as the weighted
    second-difference expression.  The second theorem identifies the current
    central explicit address term as the local post-cancellation remainder.  The
    bridge theorem shows:
      central explicit term = bracket-decay term + bridge correction.
    The correction expands pointwise as a weighted residual:
      4 * center coefficient - minus descendant coefficient - plus descendant
      coefficient.
    Therefore bracket-decay does not directly provide
    C2RawCentralRectangleTailUpperBudget for the current raw tail; the bridge
    correction must first be controlled or shown to telescope.
  Bracket-decay report:
    AUDIT_GENUINE_BRACKET_DECAY_RAW_TAIL.md
  B = finite-core depth tail is now an eventual allowance component:
    exists_finiteApproxDepthTailBandExtra_depthTailComponent_lt
    exists_finiteApproxDepthTailBandExtra_depthTailComponent_le
  For any positive external allowance B, Lean can choose L such that the
  finite-core depth-tail component is below that allowance.
  C = bandSaldo has the existing structural zero:
    superGaussianFiniteCoreBandSaldoNormUpper_self_eq_zero
  This zero is available when the band is self-band, i.e. M = N.
  The route-facing wrapper is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero
  This keeps M = N flexible and leaves E = extraSaldo visible.
  The explicit extra-upper wrapper is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero_extraUpper
  The named extra-upper interface is:
    C2ExtraSaldoUpperBudget K N s E
  The interface-consuming wrapper is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandZero_extraBudget
  The depth-tail allowance wrapper is:
    exists_flexibleSelfBandBudget_of_depthTailAllowance
  It removes the explicit B(L) component from the active target: if the finite
  approximation error is eventually bounded by A, and beta > 0, then Lean can
  choose L with depth tail <= beta.
  E = extraSaldo has the existing structural zero:
    superGaussianFiniteCoreExtraSaldoNormUpper_three_eq_zero
  This zero is available at M = 3.
  The route-facing wrapper is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_extraZero
  This keeps N flexible and leaves C = bandSaldo visible.
  The minimal sanity corollary is:
    C2FiniteApproxDepthTailBandExtraScalarMarginBudget.of_bandExtraZero_three
  It sets M = N = 3 and removes both C and E, but this is not selected as the
  main route.
  Current extraSaldo search:
    rg did not find an existing tendsto/decay theorem for extraSaldo as M grows.
    E is a genuine-first explicit upper:
      superGaussianFiniteCoreExtraSaldoNormUpper N X s
        = tsum over depth of norms of visible extra-core layers.
    The file currently exposes this norm upper, summability, criteria that
    consume it, and the exact zero at M = 3.
    No numerical or analytic decay in N was proved in this step.

Candidate component routes:
  Route A, minimal sanity:
    M = N = 3.
    C = 0, E = 0.
    Remaining payment:
      A_3 + B + 9 * (1 / 2) ^ (K + 1)
        < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
    This is useful as a sanity route only.
  Route B, flexible self-band:
    M = N large.
    C = 0, B is controlled by L, E remains visible.
    Remaining payment:
      A_N + E_N + B + 9 * (1 / 2) ^ (K + 1)
        < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
    This preserves the option to improve A by increasing N.
  Route B after depth-tail allowance:
    B is replaced by an arbitrary positive beta.
    Remaining payment:
      A_N + beta + E_N + 9 * (1 / 2) ^ (K + 1)
        < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
    The chosen L is existential and no longer belongs to the main target.
  The named tradeoff surface is:
    C2FlexibleSelfBandApproxExtraMarginBudget K N s A E beta.
  It is consumed by:
    exists_flexibleSelfBandBudget_of_approxExtraMarginBudget.

Next real math:
  audit the canonical limit A_N + E_N debt as a single object, then prove:
    exists K N,
      2 <= K /\
      3 <= N /\
      C2FiniteCoreLimitExtraScalarMarginBudget K N s.
  The raw scalar inequality is:
    finiteCoreLimitExtraDebtAt K N s
      + 9 * (1 / 2) ^ (K + 1)
      < superGaussianFiniteTwoCoreUnitStripScalarMargin s.
  B = finite-core depth tail is discharged in the finite witness route, but it
  is no longer present in the direct limit-level endpoint payment.
  A = finite approximation error is represented at endpoint level by the limit
  object finiteCoreLimitDefectAt K N s.
  C = bandSaldo is zero on the self-band route M = N.
  E = extraSaldo is accumulated extra-core mass, not a presumed cauda.
  The paired limit tradeoff finiteCoreLimitExtraDebtAt K N s remains the main
  analytic debt.
  Existing route material also includes a direct band/extra criterion in the
  currency of norm (superGaussianTwoCoreDepthLimit X s), but the active
  normalized surface is the scalar-margin budget above.

Minimal 3,3 check:
  basic_threeSaldo_budget_three_three_of_twoCoreDefect already confirms that
  when M = N = 3, the band and extra saldos vanish and the three-saldo budget
  collapses back to the direct central-to-twoCore defect currency.

Secondary Lean surface:
  exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_direct is also
  present and consumes the cleaner hypothesis
  norm (genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s)
    < norm (superGaussianTwoCoreDepthLimit X s).

Do now:
  1. Stay in LeanC2/AuditGenuineMiddle.lean.
  2. Use the finite bracket bridge now closed in Lean:
       genuineBracketAddressTermAt
       genuineCentralBracketBridgeCorrectionAddressTerm
       genuineBracketRectangleSum
       genuineCentralBracketBridgeCorrectionRectangleSum
       rectangularGenuine_eq_bracketRectangle_add_bridgeCorrectionRectangle.
     The correction is also opened as an explicit weighted residual:
       genuineCentralBracketBridgeCorrectionResidualAddressTerm
       genuineCentralBracketBridgeCorrectionAddressTerm_eq_residual
       genuineCentralBracketBridgeCorrectionRectangleSum_eq_residual_sum
       genuineCentralBracketBridgeCorrectionRectangleNormUpper
       norm_genuineCentralBracketBridgeCorrectionRectangleSum_le_normUpper
       rectangularGenuine_sub_bracketRectangle_eq_bridgeCorrectionRectangle
       norm_rectangularGenuine_sub_bracketRectangle_le_bridgeCorrectionNormUpper.
     This is only a finite rectangle ledger, not an infinite tail split.
  3. Audit/prove a legitimate source of
       C2RawCentralRectangleTailUpperBudget N L s R.
     Do not replace this by an unconditional complement-sum upper unless a
     genuine-first HasSum/Summable/Tendsto/split theorem for this rectangle
     family is available.
  4. Do not use bracket-decay by taking norms of direct and bracket pieces
     separately.  First control the explicit bridge correction or prove that it
     telescopes as a boundary contribution.
     The coefficient audit
       AUDIT_GENUINE_BRIDGE_CORRECTION_COEFFICIENTS.md
     classifies the current correction as:
       C. central non-telescopic bulk.
     So do not pursue a boundary-only bound for the current correction form.
  5. Keep cutoff residual separate; use the existing
     superGaussianFiniteGenuineCutoffResidualAlgebraicUpper route.
  6. Classify the tradeoff:
     A_N improves while E_N stays controlled;
     A_N improves but E_N grows too much;
     A_N lacks a genuine-first upper;
     or A_N depends on a hidden bridge.
  7. Treat E as accumulated extra-core mass unless a Lean theorem proves a
     sharper upper.
  8. Do not select M = N = 3 as the main route unless A_3 already has a clean
     existing control.
  9. Do not try to prove E -> 0 as a standalone route.

Immediate route decision after coefficient audit:
  A. continue with a specific genuine-first estimate for
     rawCentralRectangleTailAt / the current central family;
  or
  B. pivot to a bracket-decay/regularized carrier where the second-difference
     family is the actual summed object.

Do not:
  - reopen positive box;
  - reopen oddRef;
  - attack global anchor_bound;
  - use sampled diagnostics as proof;
  - chase C2CanonicalClosedScaledLocalData;
  - use terminal analytic input as proof input;
  - create another broad report before the next Lean compile result.
