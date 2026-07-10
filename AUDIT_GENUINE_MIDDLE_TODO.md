# TODO: genuine middle no-cancellation route

Last updated: 2026-06-24.

This tracker is the zeta-free audit surface for the C2 genuine numerator.  The
continued channel and the zeta identity are transfer tools only; they are not
the primary evidence for the middle no-cancellation obligation recorded here.

Lean audit module:

- `LeanC2/AuditGenuineMiddle.lean`

Empirical sanity check:

- `/home/thlinux/c2_teoria/scripts/operadores/3_gpu_c2_zero_detector_genuine.py`
  runs the finite genuine detector from C2 address geometry.  With default
  parameters on 2026-06-22 it found 79 candidate minima/zeros on
  `sigma = 0.5`, `1 <= t <= 200`.  This is evidence only, not proof evidence.
- `audit_two_core_cutoff_zero_certificate.py` checks the exact finite
  `K = 5, M = 3` two-core cutoff prefix isolated in Lean.  It finds an
  extremely small residual near `sigma = 3.0194247128036204e-9`,
  `t = 168021.56816461699`, `X = 81444144.70071535`.  This is numerical
  obstruction evidence only; it does not close any theorem, but it prevents
  treating the unrestricted global cutoff statement as a safe proof target.
- `audit_two_core_regularizer_comparison.py` compares the same finite
  zeta-free two-core prefix under the cutoff family
  `W_p(n, X) = exp(-(n / X)^p)`.  At the same near-collision certificate,
  `p = 1` reproduces `|prefix| < 1e-75`, while `p = 2, 4, 8` give
  `|prefix| ~= 3.65e-8`.  This suggests the recorded near-collision is tied to
  the exponential finite regularizer, not forced by the two-core address
  geometry alone.  This is still numerical evidence only.

## Evidence Rules

- Mark an item **Closed** only when there is a named Lean declaration compiling
  in the audit surface or an imported module.
- Mark an item **Reduced** when Lean replaces the target by a smaller named
  obligation.
- Mark an item **Open** when no complete Lean inhabitant/proof has been found.
- Numerical experiments may guide the work, but they do not close proof items.
- Do not use `LeanC2/PeerReview.lean`, `ROUTE_TAG` comments, or `REPORT.md` as
  proof evidence for this checklist.

## Current Genuine Surface

| Item | Status | Evidence | Meaning |
| --- | --- | --- | --- |
| Four-floor vertical prefix does not vanish in `Re(s) > 0` | Closed | `GenuineMiddleAudit.verticalQuartetPrefix_ne_zero_of_re_pos` | The quartet geometry itself has no zero in the right half-plane |
| Quartet rectangle depth factor for `K = 5` is `q^2 * P4(q)` | Closed | `GenuineMiddleAudit.rectangularDepthFactor_five_eq_quartet` | Exposes the exact finite vertical factor |
| Quartet rectangle depth factor is nonzero in `Re(s) > 0` | Closed | `GenuineMiddleAudit.rectangularDepthFactor_five_ne_zero_of_re_pos` | Vertical cancellation is ruled out for the four-floor finite block |
| Vertical ratio has strict half-norm in `Re(s) > 0` | Closed | `GenuineMiddleAudit.q_norm_lt_half_of_re_pos` | Gives the margin needed for weighted four-floor barriers |
| Weighted quartet prefix no-cancellation | Closed | `GenuineMiddleAudit.weightedQuartetPrefix_ne_zero_of_re_pos` | Any three extra floors damped by coefficients of norm `<= 1` cannot cancel the base floor |
| Finite genuine numerator at `K = 5` reduces to odd-core nonzero | Reduced | `GenuineMiddleAudit.rectangularGenuine_five_ne_zero_of_oddCore_ne_zero` | Remaining finite cancellation can only come from the odd-core factor |
| Base odd core `M = 1` equals the term `1` | Closed | `GenuineMiddleAudit.rectangularOddCoreSum_one` | The finite odd channel has an explicit base anchor |
| Odd-core nonzero from base dominance | Reduced | `GenuineMiddleAudit.rectangularOddCoreSum_ne_zero_of_base_dominance` | It is enough to prove `‖rectangularOddCoreSum s M - 1‖ < 1` |
| Finite quartet genuine nonzero from base dominance | Reduced | `GenuineMiddleAudit.rectangularGenuine_five_ne_zero_of_base_dominance` | Lifts the odd-core margin through the vertical quartet |
| Minimal quartet rectangle `K = 5, M = 1` nonzero in `Re(s) > 0` | Closed | `GenuineMiddleAudit.rectangularGenuine_five_one_ne_zero_of_re_pos` | A fully geometric finite anchor is now certified |
| Two-core odd rectangle `M = 3` nonzero in `Re(s) > 0` | Closed | `GenuineMiddleAudit.rectangularOddCoreSum_three_ne_zero_of_re_pos` | The first nontrivial odd-core extension cannot cancel the base term |
| Two-core quartet rectangle `K = 5, M = 3` nonzero in `Re(s) > 0` | Closed | `GenuineMiddleAudit.rectangularGenuine_five_three_ne_zero_of_re_pos` | The first nontrivial quartet block is fully certified |
| Arbitrary finite vertical cutoff for raw two-core genuine rectangles | Closed | `GenuineMiddleAudit.finite_geometric_depth_sum_ne_zero_of_norm_lt_one`; `GenuineMiddleAudit.rectangularDepthFactor_ne_zero_of_re_pos`; `GenuineMiddleAudit.rectangularGenuine_ne_zero_of_re_pos_of_oddCore_ne_zero`; `GenuineMiddleAudit.rectangularGenuine_one_ne_zero_of_re_pos`; `GenuineMiddleAudit.rectangularGenuine_three_ne_zero_of_re_pos` | In the unregularized finite genuine geometry, every depth cutoff `K >= 2` has a nonzero vertical factor in `Re(s) > 0`; hence the raw `M = 1` and `M = 3` rectangles are nonzero for all finite vertical cutoffs, not only for `K = 5` |
| Uniform raw finite-depth norm lower envelope | Closed | `GenuineMiddleAudit.finite_geometric_depth_sum_norm_lower_bound_of_norm_lt_one`; `GenuineMiddleAudit.finiteDepthVerticalNormLower`; `GenuineMiddleAudit.finiteDepthVerticalNormLower_pos_of_re_pos`; `GenuineMiddleAudit.rectangularDepthFactor_norm_lower_bound_of_re_pos`; `GenuineMiddleAudit.rectangularGenuineUniformDepthOneNormLower`; `GenuineMiddleAudit.rectangularGenuineUniformDepthThreeNormLower`; `GenuineMiddleAudit.rectangularGenuine_one_norm_lower_bound_of_re_pos`; `GenuineMiddleAudit.rectangularGenuine_three_norm_lower_bound_of_re_pos` | The raw vertical finite geometry has the closed-form lower envelope `‖q‖^2 * (1 - ‖q‖) / (1 + ‖q‖)` for every `K >= 2`; this gives explicit lower bounds for raw `M = 1` and `M = 3` rectangles and strengthens the cutoff-to-raw route |
| Super-Gaussian finite rectangle cutoff-to-raw bridge | Closed | `GenuineMiddleAudit.genuineAddressTermAt`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualAddressTerm`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualNormUpper`; `GenuineMiddleAudit.rectangularGenuine_eq_addressSet_sum`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_eq_cutoffResidual_sum`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_norm_le_cutoffResidualUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw` | A finite super-Gaussian genuine rectangle is nonzero whenever its explicit addresswise cutoff residual is smaller than the corresponding raw finite genuine rectangle; this gives a second genuine-first regularized route that does not force every larger rectangle to be dominated by the minimal `5 x 3` block |
| Super-Gaussian cutoff residual below uniform raw envelope | Reduced | `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_one_ne_zero_of_cutoffResidual_lt_uniformRaw`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw` | For finite `M = 1` and `M = 3` super-Gaussian rectangles, it is enough to prove the explicit cutoff residual upper is below the uniform raw lower envelope; this is the most direct next finite two-core cutoff obligation |
| Algebraic super-Gaussian cutoff residual upper | Reduced | `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualAlgebraicUpper`; `GenuineMiddleAudit.genuineAddressTermAt_norm_eq`; `GenuineMiddleAudit.superGaussianCutoffWeight_sub_one_norm_le_power`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualAddressTerm_norm_le_algebraic`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_one_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw` | The cutoff residual is bounded by a finite algebraic C2 address sum using `‖exp(-u) - 1‖ <= u`; for two-core finite rectangles the active sufficient obligation is now that this algebraic sum is below the uniform raw lower envelope |
| Unit-strip raw two-core scalar margin | Closed | `GenuineMiddleAudit.q_norm_ge_quarter_of_re_le_one`; `GenuineMiddleAudit.finiteDepthVerticalNormLower_ge_three_div_eighty_of_unit_strip`; `GenuineMiddleAudit.complexDirichletCoeff_three_core_margin_lower_bound_pointwise`; `GenuineMiddleAudit.rectangularGenuineUniformDepthThreeNormLower_ge_unitStripCoreMargin`; `GenuineMiddleAudit.rectangularGenuine_three_norm_lower_bound_of_unitStripCoreMargin` | On `0 < Re(s) <= 1`, the raw two-core finite rectangle has the explicit lower margin `(3 / 40) * ((Re(s) * log 3) / (1 + Re(s) * log 3))`, uniformly for every depth cutoff `K >= 2` |
| Unit-strip algebraic cutoff-to-raw criterion | Reduced | `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_algebraic_unitStrip` | On `0 < Re(s) <= 1`, a finite two-core super-Gaussian rectangle is nonzero if the algebraic cutoff residual sum is below the scalar margin `(3 / 40) * ((Re(s) * log 3) / (1 + Re(s) * log 3))` |
| Unit-strip dyadic scale upper for finite two-core residual | Reduced | `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleUpper`; `GenuineMiddleAudit.oddCoresUpTo_three_eq`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_depthSum`; `GenuineMiddleAudit.dyadic_depth_sum_Icc_two_closed`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_closedForm`; `GenuineMiddleAudit.complexDirichletCoeff_norm_le_one_of_mem_oddCoresUpTo_three`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualAlgebraicTerm_le_unitStripScale`; `GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualAlgebraicUpper_two_three_le_unitStripScale`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClosedScaleUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClearedScaleUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripFractionFreeScaleUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripUniformScaleUpper`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleBarrier`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleBarrier_pos`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleBarrier` | For `p = 2`, the finite two-core algebraic residual is bounded by an explicit dyadic scale sum depending only on `K` and `X`, with closed form `36 * (2^(K+1) - 4) * X⁻¹^2` for `K >= 2`; nonvanishing follows from a cleared scale inequality, and Lean now packages the uniform sufficient condition as `superGaussianFiniteTwoCoreUnitStripScaleBarrier K < Re(s) * X^2` |
| Finite reciprocal dyadic cutoff profile | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleBarrier_lt_dyadic64_sq`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreReciprocalCutoffScale`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_reciprocalDyadic64` | In the unit strip, the explicit cutoff condition `64 * 2^(K+1) / Re(s) <= X` implies `superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0`; this closes the finite two-core `p = 2`, `M = 3` genuine rectangle on a concrete large-cutoff region |
| Finite reciprocal dyadic cutoff region | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion`; `GenuineMiddleAudit.positiveCutoffRegionOn_superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_nonvanishingOn_reciprocalDyadic64`; `GenuineMiddleAudit.superGaussianTwoCoreReciprocal768ScaleRegion_of_finiteDyadic64` | The cutoff profile is now a named region depending on `K`; on this region Lean proves the finite `p = 2`, `M = 3` genuine rectangle is nonzero, and for `K >= 3` the same region is contained in the earlier reciprocal-768 region used by the restored-block/remainder bridges |
| Pointwise finite dyadic two-core certificate | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion_at_scale`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_at_reciprocalDyadic64`; `GenuineMiddleAudit.exists_superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStrip`; `GenuineMiddleAudit.no_zero_superGaussianFiniteGenuineRectangle_three_at_reciprocalDyadic64` | For every unit-strip point `0 < Re(s) <= 1` and every finite depth `K >= 2`, the canonical cutoff `X = 64 * 2^(K+1) / Re(s)` gives a finite two-core super-Gaussian genuine rectangle that Lean proves nonzero; equivalently, no zero exists for this finite two-core object at that canonical dyadic scale |
| Finite dyadic remainder bridge | Closed | `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLowerOn_finiteDyadic64`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineExtensionNonvanishingOn_finiteDyadic64_of_profileLower`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderControlledRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderBelowOn_controlledRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_nonvanishingOn_remainderControlledRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleNonvanishingOn_finiteDyadic64_of_normUpperBelow`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_finiteDyadic64` | The restored two-core lower profile and the remainder-dominated extension criterion are now available directly on the natural finite-depth cutoff region `64 * 2^(K+1) / Re(s) <= X`; the next finite middle obligation can be stated either as the explicit address-sum remainder upper being below the restored two-core lower profile on that same region, or as membership in the named remainder-controlled finite region |
| Remainder-controlled region membership packaging | Closed | `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderControlledRegion_of_finiteDyadic64`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderControlledRegion_five_three_of_finiteDyadic64` | Any future pointwise proof of `RemainderNormUpper < lowerProfile` now directly upgrades the finite dyadic region into the named remainder-controlled region; the minimal `5 x 3` block already has this membership on the full finite dyadic region because its canonical remainder upper is zero |
| Dyadic two-core remainder tail upper | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreRemainderUnitStripTailUpper`; `GenuineMiddleAudit.superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderNormUpper_two_three_le_unitStripTailUpper`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_five_eq_zero`; `GenuineMiddleAudit.superGaussianFiniteGenuineAddressSet_three_sdiff_five_three_eq_depthTail`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_eq_depthSum`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_le_one_eighth` | For the finite `M = 3` two-core rectangle, the canonical remainder outside the certified `5 x 3` block is bounded by the pure dyadic depth tail `sum_{k=6..K} 4 * (1/2)^k`, hence by `1 / 8`; this exposes the next comparison as a lower-profile margin problem rather than an address-sum bookkeeping problem |
| Tail-dominated finite two-core region | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreTailDominatedRegion`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreTailDominatedRegion_subset_remainderControlled`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreTailDominatedRegion_five_of_finiteDyadic64`; `GenuineMiddleAudit.positiveCutoffRegionOn_superGaussianFiniteTwoCoreTailDominatedRegion`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreTailDominatedRegion_of_lowerProfile_gt_one_eighth`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_nonvanishingOn_tailDominatedRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_lowerProfile_gt_one_eighth` | A simpler sufficient region now says: finite dyadic cutoff plus `tailUpper K < lowerProfile` implies the named remainder-controlled region and therefore finite two-core non-cancellation; a concrete corollary is that `1 / 8 < lowerProfile` is enough to close every finite `M = 3`, `K >= 5` rectangle on that point |
| Full-depth finite two-core lower profile | Closed | `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_norm_lower_of_cutoffResidualUpper`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripNormLower`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_norm_lower_of_unitStripScale`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripNormLower_pos_of_scaleUpper_lt_margin`; `GenuineMiddleAudit.add_ne_zero_of_remainder_norm_lt_lower_bound`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreFullDepthExtension`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreFullDepthExtension_ne_zero_of_remainder_norm_lt_unitStripLower`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreFullDepthRemainderControlledRegion`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreFullDepthExtension_nonvanishingOn_controlledRegion` | The finite `K x 3` super-Gaussian rectangle now has a reusable norm lower profile: unit-strip raw margin minus the explicit dyadic cutoff residual scale upper; any post-`K` remainder below this full-depth profile cannot cancel the whole finite two-core block |
| Post-depth finite two-core accounting | Closed | `GenuineMiddleAudit.superGaussianFiniteGenuineAddressSet_subset_of_depth_le`; `GenuineMiddleAudit.superGaussianFiniteGenuineAddressSet_three_sdiff_depth_eq`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthRemainder`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthTailUpper`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthRemainder_eq_address_sdiff_sum`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthRemainder_norm_le_tailUpper`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthTailUpper_eq_depthSum`; `GenuineMiddleAudit.superGaussianFiniteTwoCorePostDepthTailUpper_le_infiniteTail`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_eq_fullDepthExtension_postDepth`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_postDepthTail_lt_unitStripLower`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_infiniteTail_lt_unitStripLower` | Extending a finite two-core rectangle from depth `K` to any `L >= K` is now exactly a full-depth extension by the address tail `K+1..L`; this tail is bounded by `sum_{k=K+1..L} 4 * (1/2)^k`, hence by `8 * (1/2)^(K+1)`, giving a decaying post-`K` accounting condition |
| Depth-stable finite two-core region | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreDepthStableRegion`; `GenuineMiddleAudit.positiveCutoffRegionOn_superGaussianFiniteTwoCoreDepthStableRegion`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_nonvanishingOn_depthStableRegion` | A named finite stability region now says: dyadic64 at depth `K` plus `8 * (1/2)^(K+1) < fullDepthLower K X s` implies `superGaussianFiniteGenuineRectangle 2 X s L 3 != 0` for every finite `L >= K`; this is the clean finite-depth accounting route toward a controlled limit |
| Explicit dyadic64 depth-stability trigger | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScaleUpper_le_reciprocalDyadic64_tailUnit`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreDepthStableRegion_of_dyadic64_marginNine`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_nonvanishingOn_dyadic64_marginNine`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreDepthStableRegion_at_dyadic64_of_marginNine`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_at_dyadic64_of_marginNine` | On the dyadic64 reciprocal region, the finite cutoff scale loss is at most one dyadic unit `(1/2)^(K+1)`; therefore the explicit scalar condition `9 * (1/2)^(K+1) < (3 / 40) * ((Re(s) * log 3) / (1 + Re(s) * log 3))` implies depth stability and non-cancellation for every finite extension `L >= K`, including at the canonical cutoff scale |
| Pointwise dyadic64 tail-stable depth exists | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreUnitStripScalarMargin_pos`; `GenuineMiddleAudit.exists_superGaussianFiniteTwoCore_marginDominatingDepth`; `GenuineMiddleAudit.exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64`; `GenuineMiddleAudit.exists_superGaussianFiniteGenuineRectangle_three_tailStable_at_reciprocalDyadic64` | For every unit-strip point `0 < Re(s) <= 1`, Lean now proves that some depth `K >= 2` makes `9 * (1/2)^(K+1)` smaller than the explicit scalar genuine margin; at the canonical dyadic64 cutoff for that `K`, every larger finite two-core rectangle `L >= K` is nonzero |
| Uniform finite tail-stable norm gap | Closed | `GenuineMiddleAudit.norm_add_lower_bound_of_remainder_norm_le`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_norm_lower_of_postDepthTail`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_norm_lower_of_infiniteTail`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion`; `GenuineMiddleAudit.exists_superGaussianFiniteGenuineRectangle_three_tailStable_normLower_at_reciprocalDyadic64` | The finite depth-stability result is now quantitative: after choosing the pointwise dyadic64 depth, the explicit gap `superGaussianFiniteTwoCoreUnitStripNormLower K X s - 8 * (1/2)^(K+1)` is positive and is a lower bound for the norm of every larger finite two-core rectangle `L >= K`; this is the uniform finite no-collapse margin needed for any later limit or central-remainder argument |
| Central genuine remainder distance criterion | Closed | `GenuineMiddleAudit.superGaussianFiniteTwoCoreCentralRemainder`; `GenuineMiddleAudit.superGaussianFiniteTwoCoreFullDepthExtension_centralRemainder_eq`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_centralRemainder_lt_unitStripLower`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion` | The remaining central middle obstruction is now named directly: central genuine minus the certified finite two-core rectangle. If this distance is below `superGaussianFiniteTwoCoreUnitStripNormLower K X s`, then `GenuineCentralNoCancellation s` follows. For every unit-strip point, Lean produces a canonical tail-stable dyadic64 depth where this is the only remaining distance estimate |
| Central finite-approximation norm-gap criterion | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_normGap` | The central no-cancellation target can now be closed from a later finite rectangle: on a depth-stable dyadic64 point, if `genuineCentralDoubleSeries s` is closer to some `superGaussianFiniteGenuineRectangle 2 X s L 3`, `L >= K`, than the positive gap `superGaussianFiniteTwoCoreUnitStripNormLower K X s - 8 * (1/2)^(K+1)`, then `GenuineCentralNoCancellation s` follows. This converts the remaining central task into one concrete finite-approximation inequality |
| Central finite-tail convergence criterion | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_depthStableApprox_tendsto_zero`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_tendsto` | The previous finite-approximation inequality has been upgraded to a limit-form obligation: on a depth-stable dyadic64 point, if the finite tail `genuineCentralDoubleSeries s - superGaussianFiniteGenuineRectangle 2 X s L 3` tends to `0` as `L -> infinity`, then Lean chooses a large enough `L` and closes `GenuineCentralNoCancellation s`; the remaining analytic/geometric task is now exactly the finite-tail convergence estimate for the genuine central series |
| Regularized two-core depth limit | Closed | `GenuineMiddleAudit.superGaussianTwoCoreDepthLayer`; `GenuineMiddleAudit.superGaussianTwoCoreDepthLimit`; `GenuineMiddleAudit.summable_superGaussianTwoCoreDepthLayer_norm`; `GenuineMiddleAudit.summable_superGaussianTwoCoreDepthLayer`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_eq_depthLayer_sum`; `GenuineMiddleAudit.tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit` | The honest depth limit of the finite `M = 3` regularized rectangles is now defined and proved: `superGaussianFiniteGenuineRectangle 2 X s (N+1) 3` converges to `superGaussianTwoCoreDepthLimit X s` in the right half-plane. This avoids forcing the two-core channel to equal the full central object and gives the correct limit target for the finite geometry |
| Infinite-depth two-core norm floor | Closed | `GenuineMiddleAudit.norm_lower_bound_of_tendsto_of_eventually_norm_lower`; `GenuineMiddleAudit.superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion`; `GenuineMiddleAudit.superGaussianTwoCoreDepthLimit_ne_zero_on_depthStableRegion`; `GenuineMiddleAudit.exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64` | The positive finite depth-stable gap survives the passage to the regularized two-core depth limit; on every unit-strip point, Lean chooses a dyadic64 depth where the two-core depth limit has the same positive norm floor and is nonzero |
| Regularized genuine middle no-cancellation | Closed | `GenuineMiddleAudit.genuineRegularizedTwoCoreMiddle`; `GenuineMiddleAudit.GenuineRegularizedTwoCoreNoCancellation`; `GenuineMiddleAudit.genuineRegularizedTwoCoreNoCancellation_on_depthStableRegion`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineRegularizedTwoCoreNoCancellation`; `GenuineMiddleAudit.genuineRegularizedFiniteCoreMiddle`; `GenuineMiddleAudit.GenuineRegularizedFiniteCoreNoCancellation`; `GenuineMiddleAudit.genuineRegularizedFiniteCoreNoCancellation_of_extra_band_lt_twoCoreNorm`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellationCriterion_bandExtra`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellation_three` | The transfer-free regularized genuine channel is now named and closed pointwise: in the unit strip, Lean chooses the dyadic64 two-core scale and proves the regularized two-core middle channel is nonzero. The finite-core version uses the same visible extra/band saldo accounting; the minimal `M = 3` finite-core channel closes immediately because it is exactly the certified two-core depth limit |
| Finite-core depth limits | Closed | `GenuineMiddleAudit.complexDirichletCoeff_norm_le_one_of_re_pos_of_one_le`; `GenuineMiddleAudit.superGaussianCutoffWeight_two_norm_le_one`; `GenuineMiddleAudit.superGaussianGenuineAddressTermNorm_le_unitStripCoreTerm`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLayer`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit`; `GenuineMiddleAudit.summable_superGaussianFiniteCoreDepthLayer_norm`; `GenuineMiddleAudit.summable_superGaussianFiniteCoreDepthLayer`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_eq_finiteCoreDepthLayer_sum`; `GenuineMiddleAudit.tendsto_superGaussianFiniteGenuineRectangle_succ_to_finiteCoreDepthLimit`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_three_eq_twoCoreDepthLimit` | Every finite horizontal odd-core cutoff now has an honest infinite-depth regularized limit in the right half-plane; the `M = 3` case is definitionally the certified two-core depth limit |
| Finite-core split-budget middle criterion | Closed | `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_ne_zero_of_twoCoreDefect_lt_gap`; `GenuineMiddleAudit.exists_tailStableDyadic64_finiteCoreDepthLimitCriterion`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_gap`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore` | The central two-core defect can now be split through any finite horizontal-core depth limit. At the dyadic64 depth chosen by Lean, it is enough to show that the central-to-finite-core distance plus the finite-core-to-two-core distance is below the same positive two-core gap |
| Direct two-core accounting criterion | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_twoCoreDefect_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_direct`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore_direct` | Lean now accepts the minimal accounting form: central equals the certified two-core limit plus a saldo; if that saldo is smaller than the actual norm of the certified two-core limit, cancellation is impossible. The finite-core version allows the saldo to be split through any finite horizontal cutoff `M` without replacing the block norm by a weaker explicit majorant |
| Visible extra-core saldo accounting | Closed | `GenuineMiddleAudit.superGaussianFiniteCoreExtraDepthLayer`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLayer_eq_twoCore_add_extra`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra`; `GenuineMiddleAudit.superGaussianFiniteCoreExtraDepthLimit`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra`; `GenuineMiddleAudit.superGaussianFiniteCoreExtraDepthLimit_norm_le_extraSaldoUpper`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_ne_zero_of_extraSaldo_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_extraDepthLimit_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_extraSaldo_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraLimit`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraSaldo` | For every finite horizontal cutoff `M >= 3`, Lean now splits the regularized finite-core limit exactly as certified two-core plus visible extra-core saldo. The next middle accounting target is the direct inequality: central-to-finite-core distance plus the exact extra-core saldo, or its layerwise norm upper, is smaller than the actual two-core norm |
| Two-cutoff horizontal band accounting | Closed | `GenuineMiddleAudit.superGaussianFiniteCoreBandDepthLayer`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLayer_eq_lower_add_band`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_eq_lower_add_band`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band`; `GenuineMiddleAudit.superGaussianFiniteCoreBandDepthLimit_norm_le_bandSaldoUpper`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_ne_zero_of_extra_band_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteCoreBand_extraDepthLimit_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteCoreBandSaldo_extraSaldo_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandExtra`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandSaldo` | For `3 <= M <= N`, Lean now splits a larger finite-core limit as certified two-core plus the extra-core saldo up to `M` plus the visible finite horizontal band from `M` to `N`. The middle budget can now be attacked as central-to-`N` distance plus exact band plus exact extra saldo, or by the two corresponding layerwise norm uppers, all compared directly with the actual two-core norm |
| Four-debt quartet ledger | Closed | `GenuineMiddleAudit.norm_add_four_le`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin`; `GenuineMiddleAudit.c2ConcreteAntiMiracleTail_norm_le_fourTermUpper`; `GenuineMiddleAudit.c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger` | Lean now accepts the handwritten middle ledger in the raw genuine quartet package: the concrete finite model splits as quartet plus residual, the residual is bounded by vertical debt + tilt + horizontal + cutoff, the quartet has the canonical lower envelope, and strict four-term dominance prevents cancellation. The raw concrete certificate's `quartet_dominance` field is exactly this debt-total-below-credit condition |
| Global quartet lower on middle | Closed | `GenuineMiddleAudit.c2ExpandedQuartetK2Margin_pos_of_offCriticalStrip`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_pos_of_offCriticalStrip`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_ne_zero_of_offCriticalStrip`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle`; `GenuineMiddleAudit.c2ExpandedQuartetK2Margin_pos_of_mem_middle`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_pos_of_mem_middle`; `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle` | Every point of `c2ExpandedScalarMiddleRegion` inherits `offCriticalStrip`, so the quartet has the canonical pointwise lower envelope there: `c2ExpandedQuartetK2Margin s <= ‖c2ConcreteAntiMiracleQuartet s‖`, with positive margin and hence nonzero quartet. This is a pointwise global-middle bound; no uniform constant independent of `s` is asserted |
| Quartet ledger to central bridge | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion_ledger`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_rawTriangleQuartetDominance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_rawTriangleResidualDominance` | The explicit four-debt ledger now feeds the raw genuine central target. The concrete quartet certificate gives nonvanishing of the balanced bulk model by the ledger, the exact right-half-plane identity between the balanced bulk model and `genuineCentralDoubleSeries` converts this to `GenuineCentralNoCancellation`, and the raw triangle closures inherit this route. The remaining local task is to produce the concrete-region budgets at the middle point, not to reprove the no-cancellation bridge |
| Literal genuine nonzero endpoints | Closed | `GenuineMiddleAudit.genuineCentral_ne_zero_of_bulkModel_ne_zero`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_mem_concreteRegion_ledger`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_localBulkData_rawBounds`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_rawTriangleQuartetDominance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_rawTriangleResidualDominance` | The route now exposes the exact endpoint `genuineCentralDoubleSeries s ≠ 0`. The proof remains genuine-first: concrete region or raw triangle budgets give balanced-bulk nonvanishing by the quartet ledger, and the right-half-plane equality with the raw central genuine object turns that into literal central nonzero |
| Basic three-saldo no-cancellation bookkeeping | Closed | `GenuineMiddleAudit.add_three_ne_zero_of_norm_sum_lt`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo` | The two-cutoff middle criterion now has a minimal proof shape: a certified block plus three visible saldos cannot vanish when the sum of the three saldo norms is smaller than the certified block norm. Instantiated with the genuine C2 geometry, the three saldos are central-to-`N`, the finite band `M..N`, and the extra-core saldo `3..M` |
| Finite-approximation central saldo accounting | Closed | `GenuineMiddleAudit.superGaussianFiniteCoreDepthTailNormUpper`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero`; `GenuineMiddleAudit.superGaussianFiniteCoreDepthLimit_sub_rectangle_norm_le_depthTail`; `GenuineMiddleAudit.genuineCentral_sub_finiteCoreDepthLimit_norm_le_approx_add_depthTail`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteCoreApprox_band_extra_depthTail_budget_lt_twoCoreNorm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_fineDepthTail_three_tendsto`; `GenuineMiddleAudit.fineTail_three_tendsto_iff_central_eq_twoCoreDepthLimit`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineDepthTail`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineTailTendsto` | The first saldo in the three-saldo criterion is now in the same visible layerwise currency as the band and extra saldos. The central-to-`N` distance is paid by a finite genuine rectangle approximation error plus the regularized finite-core depth tail. In the minimal `M = N = 3` test, band and extra vanish and the depth tail tends to zero, so the fine budget closes from convergence of finite two-core rectangles to the genuine central object. Lean also confirms that this convergence is exactly the central-to-twoCore identity at that cutoff, so this is the next genuine obligation rather than a free tail estimate |
| Fine limiting-defect middle closure | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_fineLimitDefect_budget`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineLimitDefect` | The finite-approximation route no longer has to force the finite genuine rectangles to converge directly to the central object with zero defect. Lean accepts the genuine-first limiting-defect form: if the finite approximation error converges to a defect and `norm defect + band(M,N) saldo + extra(3..M) saldo` is below the actual certified two-core norm, then `GenuineCentralNoCancellation s` follows. This is the current sharp middle accounting target |
| Minimal saldo collapse tests | Closed | `GenuineMiddleAudit.superGaussianFiniteCoreExtraDepthLayer_three_eq_zero`; `GenuineMiddleAudit.superGaussianFiniteCoreExtraDepthLimit_three_eq_zero`; `GenuineMiddleAudit.superGaussianFiniteCoreBandDepthLayer_self_eq_zero`; `GenuineMiddleAudit.superGaussianFiniteCoreBandDepthLimit_self_eq_zero`; `GenuineMiddleAudit.basic_threeSaldo_budget_self_of_extraDepthLimit_budget`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_basic_threeSaldo_self`; `GenuineMiddleAudit.basic_threeSaldo_budget_three_three_of_twoCoreDefect`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_basic_threeSaldo_three_three`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo_three_three` | Lean accepts the deliberately minimal specializations. If `N = M`, the finite band saldo is exactly zero and the budget becomes central-to-`M` plus exact extra-core saldo. If `M = N = 3`, both geometric saldos are exactly zero and the three-saldo inequality collapses to the single central-to-two-core defect against the actual two-core norm |
| Central two-core limit-defect criterion | Closed | `GenuineMiddleAudit.genuineCentralNoCancellation_of_depthStableSuccApprox_tendsto_lt_gap`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_twoCoreDepthLimitDefect_lt_gap`; `GenuineMiddleAudit.exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_twoCoreLimit` | The central criterion has been strengthened to allow a nonzero limiting defect: if the full central object is within the positive finite gap of the regularized two-core depth limit, then `GenuineCentralNoCancellation s` follows. For every unit-strip point, Lean chooses the canonical dyadic64 depth and reduces the remaining central task to this single norm inequality |
| Explicit quartet vertical norm lower bound | Closed | `GenuineMiddleAudit.rectangularDepthFactor_five_norm_lower_bound_of_re_pos` | The vertical factor has a named positive geometric lower envelope |
| Explicit finite lower bound for `K = 5, M = 1` | Closed | `GenuineMiddleAudit.rectangularGenuine_five_one_norm_lower_bound_of_re_pos` | The base quartet block has a computable geometric margin |
| Explicit finite lower bound for `K = 5, M = 3` | Closed | `GenuineMiddleAudit.rectangularGenuine_five_three_norm_lower_bound_of_re_pos` | The two-core quartet block has a computable geometric margin |
| Cutoff genuine nonzero from residual dominance | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_ne_zero_of_residual_dominance` | A cutoff block cannot vanish if its residual is smaller than the uncut genuine block |
| Cutoff genuine nonzero from oscillatory upper | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_ne_zero_of_oscillatory_upper_lt` | It is enough to compare the certified oscillatory cutoff upper with the genuine block norm |
| Cutoff weights are nonzero and have monotone relative norm for `X > 0` | Closed | `GenuineMiddleAudit.exponentialCutoffWeight_ne_zero`; `GenuineMiddleAudit.exponentialCutoffWeight_ratio_norm_le_one` | Positive exponential cutoff dampens larger C2 addresses without introducing zeros |
| Base cutoff center term is a weighted `q` power | Closed | `GenuineMiddleAudit.centerGeometricTerm_exponentialCutoffCoeff_one_eq` | Exposes the exact genuine geometry of the cutoff on the base odd core |
| Base cutoff quartet factors through a weighted prefix | Closed | `GenuineMiddleAudit.rectangularExponentialGenuine_five_one_eq_weighted_prefix` | Replaces the coarse residual view by an exact geometric factorization for `K = 5, M = 1` |
| Base cutoff genuine block nonzero for `K = 5, M = 1`, `X > 0` | Closed | `GenuineMiddleAudit.rectangularExponentialGenuine_five_one_ne_zero_of_re_pos_of_cutoff_pos` | First regularized finite genuine block is certified by weighted quartet geometry |
| Two-core cutoff center term is a weighted `q` power | Closed | `GenuineMiddleAudit.centerGeometricTerm_exponentialCutoffCoeff_three_eq` | Exposes the exact cutoff geometry on the odd core `3` |
| Normalized two-core cutoff fiber has nonzero base fiber | Closed | `GenuineMiddleAudit.twoCoreCutoffFiber`; `GenuineMiddleAudit.twoCoreCutoffFiber_four_ne_zero` | The address-`4` fiber cannot vanish in `Re(s) > 0`, `X > 0` |
| Two-core cutoff block factors through the exact fiber prefix | Closed | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_eq_twoCore_fiberPrefix` | Removes the nonzero scalar and names the finite object that can still cancel |
| Two-core fiber prefix splits into address `4` and `12` quartet prefixes | Closed | `GenuineMiddleAudit.twoCoreCutoffFiberPrefix_eq_address_prefixes` | Active finite obstruction is now a two-channel phase-coupled prefix |
| Each address quartet prefix is individually nonzero | Closed | `GenuineMiddleAudit.cutoffAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos` | The remaining obstruction is only cross-core cancellation between two nonzero prefixes |
| Two-core cutoff nonzero iff the fiber prefix is nonzero | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_iff_twoCore_fiberPrefix` | Current finite regularized target is `twoCoreCutoffFiberPrefix s X ≠ 0` |
| Two-core cutoff nonzero reduced to no address collision | Reduced | `GenuineMiddleAudit.twoCoreCutoffAddressCollision`; `GenuineMiddleAudit.twoCoreCutoffFiberPrefix_ne_zero_iff_no_address_collision`; `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_no_address_collision` | The exact remaining finite obstruction is a named cross-core collision |
| Local address-dominance criterion | Reduced | `GenuineMiddleAudit.twoCoreCutoffFiberPrefix_ne_zero_of_address_norm_dominance`; `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_address_norm_dominance` | Valid only where the address-`4` prefix strictly dominates the `3`-core address-`12` prefix |
| Region-level two-core cutoff package | Reduced | `GenuineMiddleAudit.CutoffRegion`; `GenuineMiddleAudit.TwoCoreCutoffNoAddressCollisionOn`; `GenuineMiddleAudit.TwoCoreCutoffNonvanishingOn`; `GenuineMiddleAudit.twoCoreCutoffNonvanishingOn_of_noAddressCollisionOn` | Future target is no-collision on the actual middle/cutoff region, not the unrestricted right half-plane |
| Candidate regularizer two-core interface | Reduced | `GenuineMiddleAudit.candidateCutoffAddressQuartetPrefix`; `GenuineMiddleAudit.candidateTwoCoreCutoffPrefix`; `GenuineMiddleAudit.candidateTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision` | Any replacement regularizer, including a future super-Gaussian channel, has the same auditable address-collision obligation |
| Candidate two-core collision gap | Closed | `GenuineMiddleAudit.candidateTwoCoreCutoffCollisionGap`; `GenuineMiddleAudit.candidateTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero`; `GenuineMiddleAudit.candidateTwoCoreCutoff_noAddressCollision_of_collisionGap_ne_zero` | The cross-core collision is now a single auditable scalar condition, matching the numerical `collision gap` column |
| Super-Gaussian cutoff weights are nonzero and C2-monotone | Closed | `GenuineMiddleAudit.superGaussianCutoffWeight_ne_zero`; `GenuineMiddleAudit.superGaussianCutoffWeight_ratio_norm_le_one` | The candidate regularizer `exp(-((n / X)^p))` respects the same weighted quartet barrier for `X > 0` |
| Super-Gaussian address quartet prefixes are individually nonzero | Closed | `GenuineMiddleAudit.superGaussianAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos` | Internal four-floor cancellation is ruled out for every address under the super-Gaussian candidate |
| Super-Gaussian two-core candidate reduced to no address collision | Reduced | `GenuineMiddleAudit.superGaussianTwoCoreCutoffAddressCollision`; `GenuineMiddleAudit.superGaussianTwoCoreCutoffPrefix_ne_zero_iff_no_address_collision`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_noAddressCollisionOn` | Remaining candidate obstruction is exactly the cross-core collision between the address-`4` and address-`12` quartet prefixes |
| Super-Gaussian two-core candidate reduced to collision gap | Reduced | `GenuineMiddleAudit.superGaussianTwoCoreCollisionGap`; `GenuineMiddleAudit.superGaussianTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn` | Preferred next cutoff target: prove the scalar collision gap is nonzero on a positive middle/cutoff region |
| Super-Gaussian collision ratio separation criteria | Reduced | `GenuineMiddleAudit.superGaussianTwoCoreCollisionRatio`; `GenuineMiddleAudit.superGaussianTwoCoreCollisionGap_ne_zero_of_ratio_norm_ne_one`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_ratioNormSeparatedOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_ratioRealSeparatedOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_ratioImagSeparatedOn` | The gap obligation is now attackable by proving the ratio avoids `-1` through norm, real-part, or imaginary-part separation |
| Super-Gaussian address-closeness norm route | Reduced | `GenuineMiddleAudit.superGaussianTwoCoreCollisionRatio_norm_gt_one_of_address_closeness`; `GenuineMiddleAudit.SuperGaussianTwoCoreAddressClosenessOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_addressClosenessOn` | It is enough to prove the address-`4` and address-`12` quartet prefixes are closer than the core modulus margin on the chosen positive middle/cutoff region |
| Super-Gaussian four-floor closeness upper | Closed | `GenuineMiddleAudit.superGaussianAddressClosenessUpper`; `GenuineMiddleAudit.superGaussianAddressQuartetPrefix_sub_norm_le_closenessUpper` | The complex address-prefix difference is bounded by an explicit four-floor real upper involving only cutoff weight differences and powers of `‖q s‖` |
| Super-Gaussian uniform floor-closeness route | Reduced | `GenuineMiddleAudit.SuperGaussianTwoCoreUniformFloorClosenessOn`; `GenuineMiddleAudit.SuperGaussianTwoCoreCoreMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_uniformFloorClosenessOn` | It is enough to bound all four floor weight differences by `δ` and prove `2δ` is below the core margin on the chosen positive region |
| Super-Gaussian floor-maximum margin route | Reduced | `GenuineMiddleAudit.superGaussianAddressFloorMax`; `GenuineMiddleAudit.superGaussianAddressClosenessUpper_lt_margin_of_floorMax`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_floorMaxMarginDominatesOn` | The preferred local cutoff obligation is now the single finite inequality `2 * floorMax < core margin`, where `floorMax` is the maximum of the four cutoff floor differences |
| Super-Gaussian algebraic power-gap route | Reduced | `GenuineMiddleAudit.superGaussianAddressPowerGapMax`; `GenuineMiddleAudit.superGaussianAddressFloorMax_le_powerGapMax`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_powerGapMarginDominatesOn` | The four exponential cutoff floor differences are now bounded by explicit algebraic exponent gaps, so the active sufficient obligation is `2 * powerGapMax < core margin` on the positive region |
| Super-Gaussian scale margin route | Reduced | `GenuineMiddleAudit.superGaussianAddressPowerGapMax_le_topScale`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_scaleMarginDominatesOn` | The active sufficient obligation is now the single scale inequality `2 * ((96 : ℝ) / X)^p < core margin` on a positive middle/cutoff region |
| Super-Gaussian explicit lower-margin route | Reduced | `GenuineMiddleAudit.weightedQuartetPrefix_norm_lower_bound`; `GenuineMiddleAudit.superGaussianAddressQuartetPrefix_norm_lower_bound`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_scaleLowerMarginDominatesOn` | The address-prefix norm is bounded below by the address-`12` cutoff base ratio and the explicit cubic vertical-tail margin |
| Super-Gaussian uniform bracket-margin route | Reduced | `GenuineMiddleAudit.cubic_tail_norm_lt_seven_eighth_of_norm_lt_half`; `GenuineMiddleAudit.one_eighth_le_one_sub_q_cubic_tail_of_re_pos`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_scaleCoreCutoffMarginDominatesOn` | The cubic vertical-tail factor is discharged uniformly by `1 / 8`; the active sufficient obligation now involves only the core margin, the cutoff base ratio, and the scale term |
| Super-Gaussian cutoff-ratio half route | Reduced | `GenuineMiddleAudit.superGaussianCutoffWeight_ratio_norm_ge_half_of_gap_le_log_two`; `GenuineMiddleAudit.SuperGaussianTwoCoreCutoffBaseRatioHalfOn`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_cutoffBaseRatioHalfOn` | The cutoff base ratio is replaced by `1 / 2` under the exponent-gap condition `((12/X)^p - (4/X)^p) ≤ log 2`; the active margin is now the scalar core-scale inequality with constant `1 / 16` |
| Super-Gaussian scalar core-scale route | Reduced | `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreMarginDominatesOn`; `GenuineMiddleAudit.one_div_thirty_two_lt_log_two`; `GenuineMiddleAudit.superGaussianTwoCoreScaleCoreHalfMarginDominatesOn_of_scaleCoreMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreCutoffBaseRatioHalfOn_of_scaleCoreHalfMarginDominatesOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_scaleCoreMarginDominatesOn` | The scalar `1 / 16` route is constant-cleared to `32 * ((96 / X)^p) < 1 - ‖3^-s‖`; this single core-scale inequality is now the active sufficient obligation |
| Super-Gaussian lower-bound constants route | Reduced | `GenuineMiddleAudit.complexDirichletCoeff_three_norm_eq`; `GenuineMiddleAudit.complexDirichletCoeff_three_core_margin_lower_bound_of_re_ge`; `GenuineMiddleAudit.superGaussianScaleTerm_le_of_cutoff_ge`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreLowerBoundsOn`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreConstantMargin`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn` | Lower bounds `sigma0 ≤ Re(s)` and `X0 ≤ X` reduce the active core-scale obligation to the constant-only inequality `32 * (96 / X0)^p < 1 - exp(-(sigma0 log 3))` |
| Super-Gaussian `p = 2` quadratic constants route | Reduced | `GenuineMiddleAudit.one_sub_exp_neg_lower_bound_fraction`; `GenuineMiddleAudit.SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin`; `GenuineMiddleAudit.superGaussianTwoCoreScaleCoreRationalConstantMargin_two_of_quadraticConstantMargin`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_two_of_scaleCoreLowerBoundsOn_quadraticMargin` | For the first useful profile `p = 2`, it is enough to prove the fraction-free inequality `32 * 96^2 * (1 + sigma0 log 3) < (sigma0 log 3) * X0^2` |
| Super-Gaussian `p = 2` pointwise quadratic route | Reduced | `GenuineMiddleAudit.SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn`; `GenuineMiddleAudit.superGaussianTwoCoreScaleCoreMarginDominatesOn_two_of_pointwiseQuadratic`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_two_of_pointwiseQuadratic` | The constant lower-bound route is localized to the pointwise inequality `32 * 96^2 * (1 + Re(s) log 3) < (Re(s) log 3) * X^2`, allowing the cutoff scale to compensate for small `Re(s)` |
| Super-Gaussian `p = 2` unit-strip reciprocal-scale route | Reduced | `GenuineMiddleAudit.SuperGaussianTwoCoreUnitStripReciprocalScaleOn`; `GenuineMiddleAudit.superGaussianTwoCorePointwiseQuadratic_of_unitStripReciprocalScaleOn`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_two_of_unitStripReciprocalScaleOn` | On `Re(s) ≤ 1`, the pointwise obligation follows from the cleaner scale inequality `32 * 96^2 * (1 + log 3) / log 3 < Re(s) * X^2` |
| Concrete unit-strip reciprocal-scale region | Closed | `GenuineMiddleAudit.superGaussianTwoCoreUnitStripScaleRegion`; `GenuineMiddleAudit.positiveCutoffRegionOn_superGaussianTwoCoreUnitStripScaleRegion`; `GenuineMiddleAudit.superGaussianTwoCoreUnitStripReciprocalScaleOn_unitStripScaleRegion`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion` | The super-Gaussian two-core `p = 2` finite genuine object is certified nonzero on the explicit region `0 < Re(s)`, `0 < X`, `Re(s) ≤ 1`, and `32 * 96^2 * (1 + log 3) / log 3 < Re(s) * X^2` |
| Concrete reciprocal-768 cutoff region | Closed | `GenuineMiddleAudit.one_lt_log_three`; `GenuineMiddleAudit.superGaussianTwoCoreUnitStripScaleBarrier_lt_768_sq`; `GenuineMiddleAudit.superGaussianTwoCoreReciprocalCutoffScale`; `GenuineMiddleAudit.superGaussianTwoCoreUnitStripScaleRegion_of_reciprocal768_le_cutoff`; `GenuineMiddleAudit.superGaussianTwoCoreNonvanishingOn_two_reciprocal768ScaleRegion` | In the unit strip `0 < Re(s) ≤ 1`, the two-core `p = 2` finite genuine prefix is certified nonzero for every cutoff satisfying `768 / Re(s) ≤ X` |
| Restored super-Gaussian two-core finite genuine block | Closed | `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlock`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlock_ne_zero_iff_prefix_ne_zero`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlock_two_ne_zero_of_reciprocal768_le_cutoff`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNonvanishingOn_two_reciprocal768` | The normalized prefix result lifts through the nonzero geometric scalar, so the restored finite two-core `p = 2` genuine block is certified nonzero on the reciprocal-768 unit-strip region |
| Quantitative restored block norm lower envelope | Closed | `GenuineMiddleAudit.norm_add_mul_lower_bound_of_sub_norm_le`; `GenuineMiddleAudit.superGaussianTwoCoreCutoffPrefixNormLower`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLower`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlock_norm_lower_bound`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLowerOn_two_reciprocal768` | The restored finite two-core block now has a named norm lower bound built from the address-`12` core margin minus the address-closeness error; this is the margin to compare against genuine middle remainders |
| Positive restored block lower envelope on reciprocal-768 | Closed | `GenuineMiddleAudit.superGaussianTwoCoreCutoffPrefixNormLower_pos_of_closenessUpper_lt`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLower_pos_of_closenessUpper_lt`; `GenuineMiddleAudit.superGaussianTwoCoreAddressClosenessUpperOn_two_reciprocal768`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768` | The named lower envelope is strictly positive on the full reciprocal-768 unit-strip region, so the next remainder estimate is a real positive margin comparison rather than a vacuous lower-bound package |
| Super-Gaussian finite genuine rectangle bridge | Closed | `GenuineMiddleAudit.superGaussianGenuineAddressTerm`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_five_three_eq_block`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainder`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_eq_extension`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_remainderBelow`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_two_reciprocal768` | The finite regularized genuine rectangle is now a concrete zeta-free object; its minimal `K = 5`, `M = 3` case is exactly the certified two-core block, and larger finite rectangles reduce to bounding their canonical geometric remainder below the positive margin |
| Explicit finite rectangle remainder norm upper | Closed | `GenuineMiddleAudit.superGaussianFiniteGenuineAddressSet`; `GenuineMiddleAudit.superGaussianGenuineAddressTerm_norm_eq`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderNormUpper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainder_eq_address_sdiff_sum`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainder_norm_le_upper`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_normUpperBelow`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangleRemainderNormUpper_five_three_eq_zero`; `GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_five_three_ne_zero_of_normUpper` | For `K >= 5`, `M >= 3`, the finite geometric remainder is exactly the sum over addresses outside the certified `5 x 3` block and is bounded by an explicit real finite sum of address norms; the finite middle target is now the concrete inequality `RemainderNormUpper < lowerProfile`, while the minimal `5 x 3` case closes because this upper is zero |
| Restored block plus dominated geometric remainder bridge | Closed | `GenuineMiddleAudit.superGaussianTwoCoreGenuineExtension`; `GenuineMiddleAudit.SuperGaussianTwoCoreGenuineRemainderDominatedOn`; `GenuineMiddleAudit.SuperGaussianTwoCoreGenuineBlockNormLowerOn`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_lower`; `GenuineMiddleAudit.superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_profileLower` | Any genuine-first middle extension decomposed as the certified two-core block plus a remainder is nonzero on the reciprocal-768 region once the remainder norm is proved strictly below the block, or below the named restored-block lower envelope |
| Unrestricted positive-cutoff super-Gaussian target | Retired | `audit_two_core_supergaussian_positive_roots.py` | Positive-`X` numerical roots for `p = 2, 4, 8` show the next theorem must include a large-cutoff or middle-region condition, not just `0 < Re(s), 0 < X` |
| Two-core cutoff genuine nonzero from explicit residual lower bound | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt_lower` | Valid sufficient criterion, but no longer the active target |
| Default `J = 24` two-core residual criterion | Reduced | `GenuineMiddleAudit.rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper24_lt_lower` | Legacy residual route; useful only if the explicit upper is later sharpened enough |
| Balanced genuine bulk model equals the central C2 double series in `Re(s) > 0` | Closed | `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos` | Keeps the bulk model pinned to the genuine central object without using transfer input |
| Nonzero balanced bulk model iff nonzero central C2 double series | Closed | `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_noCancellation`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_adjustedQuartetBalancedGenuineBulkModel_ne_zero` | The bridge now runs in both useful directions: central no-cancellation gives balanced-bulk nonzero, and balanced-bulk nonzero at a right-half-plane point gives `GenuineCentralNoCancellation` |
| Raw balanced-bulk quartet middle closure | Closed | `GenuineMiddleAudit.AdjustedQuartetBalancedGenuineBulkConcreteEstimates`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcreteRegion`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_quartetRegion`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawBounds` | Lean now accepts the direct genuine-first bulk route: active local scalar middle data plus raw balanced-seed and raw central-cutoff bounds place the point in a quartet bulk region; quartet dominance proves the balanced bulk model is nonzero, and the central bridge proves `GenuineCentralNoCancellation` |
| Raw component middle closure | Closed | `GenuineMiddleAudit.C2RawCentralCutoffScaledBound`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawSeedBudget_rawCutoff`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawComponentBounds`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawVerticalGapCutoff`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawVerticalCutoff`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_triangleVerticalCutoff` | The raw seed side is now decomposed into scalar components. The horizontal defect is read directly from `C2ExpandedScalarLocalBulkData`, the resolvent gap is closed by the canonical triangle bound, and the vertical/rectangular residual can be supplied by the explicit triangle upper. The remaining pointwise tasks are the combined seed-factor inequality and the raw central-cutoff inequality |
| Raw triangle concrete-region budget certificate | Closed | `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleResidualDominance` | The raw triangle/unit budgets now construct the actual `adjustedQuartetBalancedGenuineBulkConcreteRegion` certificate instead of only appearing inside the final no-cancellation proof. The seed bound is paid by `c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit`, the cutoff bound by the norm constant, and the supplied quartet or residual dominance fills exactly the certificate's `quartet_dominance` field |
| Raw triangle residual dominance closure | Reduced | `GenuineMiddleAudit.c2RawTriangleVerticalRectangularUpper`; `GenuineMiddleAudit.c2RawTriangleSeedTiltConstant`; `GenuineMiddleAudit.c2RawCentralCutoffNormConstant`; `GenuineMiddleAudit.C2RawTriangleResidualDominance`; `GenuineMiddleAudit.c2RawTriangleSeedFactorScaledBound_unit`; `GenuineMiddleAudit.c2RawCentralCutoffScaledBound_unit_norm`; `GenuineMiddleAudit.c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_rawTriangleResidualDominance` | The seed and cutoff saldo inequalities now close directly with the raw triangle/unit budgets, and those budgets are exposed as a concrete-region certificate. The remaining middle inequality is the residual dominance `raw tilt residual + horizontal envelope + raw cutoff norm < residual quartet margin`; once this explicit real inequality is proved at a point, Lean closes `GenuineCentralNoCancellation` through the concrete region |
| Raw residual scalar budget audit | Reduced | `GenuineMiddleAudit.c2RawTriangleResidualUpper_eq_expanded`; `GenuineMiddleAudit.C2RawTriangleResidualDominance_of_scalarBudget`; `GenuineMiddleAudit.C2RawTriangleResidualDominance_of_upperBudgets`; `GenuineMiddleAudit.not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle`; `GenuineMiddleAudit.not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm`; `GenuineMiddleAudit.C2RawTriangleResidualDominance_forces_verticalTail_strict_saving` | Lean now exposes the exact scalar inequality and a monotone budget route for proving it. It also confirms the plain triangle budget is not automatically small enough: if the raw vertical triangle budget already dominates the standard vertical tail envelope, or if the actual vertical tail norm saturates that envelope, the residual dominance is impossible. Therefore any proof of `C2RawTriangleResidualDominance` must contain a genuine strict saving `‖verticalDepthTailFromTwo s‖ < verticalDepthTailUpper s` or replace the raw triangle budget by a sharper residual budget |
| Refined genuine vertical residual budget | Closed | `GenuineMiddleAudit.c2RefinedVerticalSeedTiltConstant`; `GenuineMiddleAudit.c2RefinedVerticalResidualUpper`; `GenuineMiddleAudit.C2RefinedVerticalResidualDominance`; `GenuineMiddleAudit.c2RefinedVerticalResidualUpper_eq_expanded`; `GenuineMiddleAudit.C2RefinedVerticalResidualDominance_of_scalarBudget`; `GenuineMiddleAudit.C2RefinedVerticalResidualDominance_of_upperBudgets`; `GenuineMiddleAudit.C2RefinedVerticalQuartetDominance_of_residualDominance`; `GenuineMiddleAudit.C2RefinedVerticalResidualDominance_of_quartetDominance`; `GenuineMiddleAudit.C2RefinedVerticalResidualDominance_iff_quartetDominance`; `GenuineMiddleAudit.c2OddTailBalancingSeed_scaled_bound_refinedVerticalUnit`; `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_of_refinedVerticalResidualDominance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_refinedVerticalResidualDominance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_refinedVerticalResidualDominance` | The raw triangle budget has been factored through an external genuine vertical/rectangular upper. Any sharper `verticalRectangularUpper` satisfying `C2VerticalRectangularResidualBound` now feeds the same seed ledger, raw cutoff norm, quartet dominance, concrete-region certificate, and literal `genuineCentralDoubleSeries s ≠ 0` endpoint. The refined residual and quartet dominance forms are now equivalent, so the later estimate can be supplied either as the residual scalar inequality or as the certificate's four-debt quartet field |
| Exact genuine vertical residual norm route | Closed | `GenuineMiddleAudit.c2ExactVerticalRectangularResidualNormUpper`; `GenuineMiddleAudit.c2ExactVerticalRectangularResidualNormUpper_nonneg`; `GenuineMiddleAudit.C2VerticalRectangularResidualBound_exactNorm`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance`; `GenuineMiddleAudit.c2ExactVerticalResidualNormAllowance`; `GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance`; `GenuineMiddleAudit.c2ExactVerticalResidual_norm_le_anchor_add_cutoff`; `GenuineMiddleAudit.exactVerticalScalarBudget_iff_norm_lt_allowance`; `GenuineMiddleAudit.exactVerticalAnchorBudget_iff_norm_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_norm_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_upper_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_iff_norm_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_scalarBudget`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_upperBudgets`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_quartetDominance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_iff_quartetDominance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_exactVerticalResidualDominance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactVerticalResidualDominance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_exactVerticalResidualNorm_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactVerticalResidualNorm_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_anchor_cutoff_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_anchor_cutoff_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_anchor_norm_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_anchor_norm_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_exactVerticalScalarBudget`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactVerticalScalarBudget`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_exactVerticalUpperBudgets`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactVerticalUpperBudgets` | Lean now has the no-slack vertical specialization of the refined route: the vertical/rectangular saldo can be measured by its actual norm, which definitionally satisfies `C2VerticalRectangularResidualBound`. The pointwise endpoint is fully compressed: Lean algebraically cancels the resolvent factor and rewrites the whole scalar budget as the single condition that the exact residual norm is below `c2ExactVerticalResidualNormAllowance`. The exact residual is also split as fixed genuine vertical anchor plus cutoff, so it is enough to prove the anchor-only inequality against `c2ExactVerticalAnchorResidualNormAllowance` to get both `GenuineCentralNoCancellation s` and literal `genuineCentralDoubleSeries s ≠ 0` |
| Continued-anchor rebasing of the exact residual | Closed | `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualNormAllowance`; `GenuineMiddleAudit.c2VerticalRectangularAnchorResidual_eq_continuedAnchor_add_defect`; `GenuineMiddleAudit.c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_add_defect`; `GenuineMiddleAudit.c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_upper`; `GenuineMiddleAudit.continuedVerticalAnchorBudget_iff_norm_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_continued_anchor_defect_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_continued_anchor_defect_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_continued_anchor_norm_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_continued_anchor_norm_lt_allowance` | The fixed genuine anchor has been rebased through `continuedCentralOddChannel`: `verticalTail - genuineCentral` is the continued anchor plus the central rebasing defect. Therefore the anchor-only budget can be paid by `‖continuedAnchor‖ + centralDefectUpper < anchorAllowance`, or equivalently by the normalized allowance after subtracting `centralDefectUpper`. This gives the same `GenuineCentralNoCancellation` and literal genuine `neq zero` endpoints; the remaining estimates are now the continued-anchor norm and the central rebasing-defect upper |
| Genuine rebasing-defect majorant | Closed | `GenuineMiddleAudit.c2GenuineRebasingDefectTriangleUpper`; `GenuineMiddleAudit.c2GenuineRebasingDefect_norm_le_triangleUpper_of_bounds`; `GenuineMiddleAudit.c2GenuineRebasingDefectExactTriangleUpper`; `GenuineMiddleAudit.c2GenuineRebasingDefect_norm_le_exactTriangleUpper`; `GenuineMiddleAudit.c2GenuineRebasingDefectExactTriangleUpper_nonneg`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorExactDefectNormAllowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_norm`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_continued_anchor_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_continued_anchor_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_continued_anchor_exactDefect`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_continued_anchor_exactDefect`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_continued_anchor_exactDefect_norm`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_continued_anchor_exactDefect_norm` | The central rebasing defect now has a genuine-first triangular majorant: separate upper envelopes for `genuineCentralDoubleSeries` and `continuedCentralOddChannel` pay `‖genuineCentralDoubleSeries - continuedCentralOddChannel‖`. The exact triangular instance is available with no extra hypotheses, and both the summed and normalized continued-anchor budgets feed the same dominance and literal genuine `neq zero` endpoints |
| Continued-anchor odd-channel ledger | Closed | `GenuineMiddleAudit.c2ContinuedOddExactUpper`; `GenuineMiddleAudit.c2ContinuedOddChannelBound_exact`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorOddUpper`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorExactOddUpper`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual_norm_le_oddUpper`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual_norm_le_exactOddUpper`; `GenuineMiddleAudit.c2ContinuedAnchorOddRebasingTriangleUpper`; `GenuineMiddleAudit.c2ContinuedAnchorOddGenuineTriangleUpper`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_exactOdd_exactDefect_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_odd_rebasing_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_odd_rebasing_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_odd_genuine_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_odd_genuine_triangle_lt_allowance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_exactOdd_exactDefect_lt_allowance`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactOdd_exactDefect_lt_allowance` | The remaining continued-anchor norm has been factored as vertical tail times the odd-channel gap. A bound `C2ContinuedOddChannelBound oddUpper s` now pays the anchor by `verticalDepthTailUpper s * (1 + 2 * oddUpper s)`. The final active ledger can therefore be stated as a single real inequality between this odd-channel anchor upper, the rebasing-defect upper, and the anchor allowance; Lean sends that inequality directly to `GenuineCentralNoCancellation` and literal genuine `neq zero` |
| Odd-anchor final middle package | Reduced | `GenuineMiddleAudit.C2GenuineOddAnchorFinalBudget`; `GenuineMiddleAudit.C2GenuineOddAnchorInheritedBudget`; `GenuineMiddleAudit.C2GenuineOddAnchorLocalData`; `GenuineMiddleAudit.C2GenuineOddAnchorLocalData.of_horizontalBudget`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_oddAnchorFinalBudget`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_oddAnchorInheritedBudget`; `GenuineMiddleAudit.C2GenuineOddAnchorLocalData.to_exactVerticalResidualDominance`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_oddAnchorLocalData`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_oddAnchorLocalData` | The active refined target is now a self-contained local package: off-criticality, horizontal layer budget, odd-channel bound, genuine central bound, and the final inherited odd-anchor budget. Once `final_budget` is proved at a middle point, Lean immediately obtains exact vertical residual dominance, `GenuineCentralNoCancellation`, and literal genuine `neq zero`. The only remaining mathematical item is constructing that final real budget on the actual middle data |
| Odd-anchor norm-only final-budget barrier | Closed | `GenuineMiddleAudit.c2RawCentralCutoffNormConstant_nonneg`; `GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper`; `GenuineMiddleAudit.not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers`; `GenuineMiddleAudit.not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers`; `GenuineMiddleAudit.not_C2GenuineOddAnchorLocalData` | Lean proves the current norm-only odd-anchor final budget cannot be populated under natural nonnegative upper envelopes. The anchor allowance is strictly smaller than `verticalDepthTailUpper s`, while the inherited odd-anchor upper is at least `verticalDepthTailUpper s`. The next refinement must replace the `1 + 2 * oddUpper` norm-only gap bound by a genuinely sharper gap estimate, e.g. a direct upper for `‖1 - 2 * continuedOddDirichletChannel s‖` or equivalent phase-aware saving |
| Gap-aware odd-anchor replacement | Reduced | `GenuineMiddleAudit.C2ContinuedOddGapBound`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorGapUpper`; `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual_norm_le_gapUpper`; `GenuineMiddleAudit.c2ContinuedAnchorGapRebasingTriangleUpper`; `GenuineMiddleAudit.C2GenuineGapAnchorFinalBudget`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_gap_rebasing_triangle_lt_allowance`; `GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_gapAnchorFinalBudget`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_gapAnchorFinalBudget`; `GenuineMiddleAudit.genuineCentral_ne_zero_of_gapAnchorFinalBudget` | The formal replacement for the impossible norm-only package is now available. Instead of paying `‖1 - 2 * continuedOddDirichletChannel s‖` by `1 + 2 * oddUpper s`, the middle can provide a direct `gapUpper`. If `verticalDepthTailUpper s * gapUpper s` plus the rebasing envelopes fits below the anchor allowance, Lean again closes exact vertical residual dominance, `GenuineCentralNoCancellation`, and literal genuine `neq zero` |
| Genuine middle no-cancellation | Reduced | `GenuineMiddleAudit.GenuineCentralNoCancellation`; `GenuineMiddleAudit.genuineCentralNoCancellation_of_localBulkData_rawBounds` | The remaining audited-region task is now pointwise and geometric: build `C2ExpandedScalarLocalBulkData` on the middle region and prove the two raw bounds for the balanced seed and central cutoff error. This route no longer requires a direct central-to-twoCore distance estimate |

## Next Mathematical Target

The current zeta-free middle obligation is:

```lean
GenuineMiddleAudit.GenuineCentralNoCancellation s
```

expanded as:

```lean
0 < s.re ∧ genuineCentralDoubleSeries s ≠ 0
```

This uses the raw Lean `tsum` central object.  If that object is too crude in
the middle strip, the next step is not to switch to zeta; it is to define and
certify the correct zeta-free regularized genuine channel, then reuse the same
no-cancellation shape for that channel.

For the finite quartet block, Lean has already reduced the analogous statement
to:

```lean
rectangularOddCoreSum s M ≠ 0
```

after proving that the vertical quartet factor cannot vanish.  Lean further
reduces this finite odd-core target to the base-dominance margin:

```lean
‖rectangularOddCoreSum s M - 1‖ < 1
```

Lean now proves a stronger unregularized vertical fact.  For every finite
depth cutoff `K >= 2`,

```lean
rectangularDepthFactor s K ≠ 0
```

in `0 < Re(s)`, via `rectangularDepthFactor_ne_zero_of_re_pos`.  Therefore
the raw two-core genuine rectangle is already certified for all finite depths:

```lean
rectangularGenuine s K 3 ≠ 0
```

via `rectangularGenuine_three_ne_zero_of_re_pos`.  This is not a cutoff-tail
domination result; it says the finite vertical geometry itself is not the
remaining source of cancellation.

Lean now also proves a quantitative version of this raw vertical fact.  The
closed form for the finite geometric depth sum gives the uniform lower
envelope

```lean
finiteDepthVerticalNormLower s =
  ‖q s‖^2 * (1 - ‖q s‖) / (1 + ‖q s‖)
```

and for every finite depth cutoff `K >= 2`,

```lean
finiteDepthVerticalNormLower s ≤ ‖rectangularDepthFactor s K‖
```

via `rectangularDepthFactor_norm_lower_bound_of_re_pos`.  Consequently the
raw finite two-core rectangle has an explicit lower bound independent of the
particular depth cutoff:

```lean
rectangularGenuineUniformDepthThreeNormLower s ≤
  ‖rectangularGenuine s K 3‖
```

via `rectangularGenuine_three_norm_lower_bound_of_re_pos`.  This is the
preferred lower side for the cutoff-to-raw route, because the vertical margin
does not collapse merely because `K` grows.

Lean also records a regularized cutoff-to-raw bridge.  The super-Gaussian
finite rectangle differs from the raw finite genuine rectangle by the explicit
addresswise residual:

```lean
superGaussianFiniteGenuineRectangle_sub_rectangularGenuine_eq_cutoffResidual_sum
```

with norm bounded by:

```lean
superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s
```

Thus a second finite regularized route is now available:

```lean
superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s <
  ‖rectangularGenuine s K M‖
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw
```

This route is often more natural for larger finite rectangles than comparing
all added addresses against only the minimal `5 x 3` restored block.

For the finite two-core profile `M = 3`, Lean now specializes this to the
uniform raw lower envelope:

```lean
superGaussianFiniteGenuineCutoffResidualNormUpper p K 3 X s <
  rectangularGenuineUniformDepthThreeNormLower s
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw
```

This is currently the cleanest finite cutoff-to-raw obligation: all terms are
explicit finite C2 address sums or closed-form geometric envelopes.

Lean further bounds that residual by a purely algebraic finite C2 address sum:

```lean
superGaussianFiniteGenuineCutoffResidualNormUpper p K M X s ≤
  superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K M X s
```

via `superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper`,
using the elementary cutoff estimate

```lean
‖superGaussianCutoffWeight p X n - 1‖ ≤ ((n : ℝ) / X)^p
```

from `superGaussianCutoffWeight_sub_one_norm_le_power`.  For the two-core
finite rectangle, the active algebraic sufficient obligation is:

```lean
superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K 3 X s <
  rectangularGenuineUniformDepthThreeNormLower s
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidualAlgebraic_lt_uniformRaw
```

On the unit real strip, Lean further discharges the raw vertical margin to a
concrete constant.  From

```lean
1 / 4 ≤ ‖q s‖ < 1 / 2
```

it proves:

```lean
3 / 80 ≤ finiteDepthVerticalNormLower s
```

via `finiteDepthVerticalNormLower_ge_three_div_eighty_of_unit_strip`.
Combining this with the pointwise odd-core estimate

```lean
(s.re * Real.log 3) / (1 + s.re * Real.log 3) ≤
  1 - ‖complexDirichletCoeff s 3‖
```

gives the raw two-core lower bound:

```lean
(3 / 40) * ((s.re * Real.log 3) / (1 + s.re * Real.log 3)) ≤
  ‖rectangularGenuine s K 3‖
```

via `rectangularGenuine_three_norm_lower_bound_of_unitStripCoreMargin`.
Therefore the current unit-strip algebraic cutoff target is:

```lean
superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K 3 X s <
  (3 / 40) * ((s.re * Real.log 3) / (1 + s.re * Real.log 3))
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_algebraic_unitStrip
```

For the concrete super-Gaussian profile `p = 2`, Lean further removes `s` from
the upper side of the finite two-core residual.  The pointwise address estimate

```lean
superGaussianFiniteGenuineCutoffResidualAlgebraicUpper 2 K 3 X s ≤
  superGaussianFiniteTwoCoreUnitStripScaleUpper K X
```

is proved by
`superGaussianFiniteGenuineCutoffResidualAlgebraicUpper_two_three_le_unitStripScale`.
For `K >= 2`, Lean also evaluates the dyadic upper as:

```lean
superGaussianFiniteTwoCoreUnitStripScaleUpper K X =
  36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2
```

via `superGaussianFiniteTwoCoreUnitStripScaleUpper_eq_closedForm`.
Thus the active finite unit-strip scale obligation is:

```lean
superGaussianFiniteTwoCoreUnitStripScaleUpper K X <
  (3 / 40) * ((s.re * Real.log 3) / (1 + s.re * Real.log 3))
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleUpper
```

Equivalently, the fully expanded sufficient condition is:

```lean
36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2 <
  (3 / 40) * ((s.re * Real.log 3) / (1 + s.re * Real.log 3))
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClosedScaleUpper
```

After clearing `X⁻¹^2`, the preferred cutoff-scale obligation is:

```lean
36 * ((2 : ℝ) ^ (K + 1) - 4) <
  ((3 / 40) * ((s.re * Real.log 3) /
    (1 + s.re * Real.log 3))) * X ^ 2
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClearedScaleUpper
```

Lean now also records a fraction-free version:

```lean
480 * ((2 : ℝ) ^ (K + 1) - 4) *
    (1 + s.re * Real.log 3) <
  (s.re * Real.log 3) * X ^ 2
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripFractionFreeScaleUpper
```

Using `s.re <= 1`, this is further reduced to the uniform scale condition:

```lean
480 * ((2 : ℝ) ^ (K + 1) - 4) *
    (1 + Real.log 3) / Real.log 3 <
  s.re * X ^ 2
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripUniformScaleUpper
```

For readability, Lean packages the left side as:

```lean
superGaussianFiniteTwoCoreUnitStripScaleBarrier K
```

and proves it is positive for `K >= 2`.  The current preferred finite
two-core scale obligation is therefore:

```lean
superGaussianFiniteTwoCoreUnitStripScaleBarrier K < s.re * X ^ 2
```

which closes by:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripScaleBarrier
```

For the base regularized block, Lean now proves directly:

```lean
0 < s.re -> 0 < X ->
  rectangularExponentialGenuine s 5 1 X ≠ 0
```

via
`rectangularExponentialGenuine_five_one_ne_zero_of_re_pos_of_cutoff_pos`.
This proof is genuine-first: it factors the cutoff block into a nonzero scalar
times a weighted quartet prefix, then uses the strict `‖q s‖ < 1 / 2` margin.

The next finite regularized target is the two-core cutoff block:

```lean
rectangularExponentialGenuine s 5 3 X ≠ 0
```

Lean now reduces this target exactly to the named fiber-prefix obstruction:

```lean
twoCoreCutoffFiberPrefix s X ≠ 0
```

The exact split of this finite genuine object is:

```lean
cutoffAddressQuartetPrefix s X 4 +
  complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12 ≠ 0
```

with both address prefixes using the same vertical ratio `q s` and the same
cutoff scale `X`.  The next proof must use this phase coupling; independent
triangle bounds are too coarse near the boundary.

Lean also proves that each address prefix is already nonzero:

```lean
cutoffAddressQuartetPrefix s X n ≠ 0
```

for `0 < s.re` and `0 < X`, via
`cutoffAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos`.  So the remaining
finite obstruction is not internal vertical cancellation.  It is the possible
cross-core equation:

```lean
cutoffAddressQuartetPrefix s X 4 =
  -complexDirichletCoeff s 3 * cutoffAddressQuartetPrefix s X 12
```

The proof has to rule out this exact collision.

Regularizer comparison audit.  The script
`audit_two_core_regularizer_comparison.py` keeps the same finite two-core
object but replaces the cutoff weight by:

```text
W_p(n, X) = exp(-(n / X)^p)
```

At the near-collision certificate above, the audited output is:

```text
p = 1: |prefix| ~= 8.88e-76
p = 2: |prefix| ~= 3.65e-8
p = 4: |prefix| ~= 3.65e-8
p = 8: |prefix| ~= 3.65e-8
```

The same script now reports the collision ratio
`A_4(s,X) / (3^(-s) A_12(s,X))`.  At the same certificate point:

```text
p = 1: |ratio| ~= 1,          Re(ratio)+1 ~= -2.73e-83, Im(ratio) ~= -9.96e-76
p = 2: |ratio| ~= 1+3.32e-9,  Re(ratio)+1 ~= -3.32e-9,  Im(ratio) ~=  4.08e-8
p = 4: |ratio| ~= 1+3.32e-9,  Re(ratio)+1 ~= -3.32e-9,  Im(ratio) ~=  4.08e-8
p = 8: |ratio| ~= 1+3.32e-9,  Re(ratio)+1 ~= -3.32e-9,  Im(ratio) ~=  4.08e-8
```

It also reports the cutoff-ratio floor route:

```text
p = 1: exponent gap ~= 9.82e-8,  log(2)-gap ~= 6.93e-1, |W12/W4| ~= 0.99999990
p = 2: exponent gap ~= 1.93e-14, log(2)-gap ~= 6.93e-1, |W12/W4| ~= 1.00000000
p = 4: exponent gap ~= 4.65e-28, log(2)-gap ~= 6.93e-1, |W12/W4| ~= 1.00000000
p = 8: exponent gap ~= 2.22e-55, log(2)-gap ~= 6.93e-1, |W12/W4| ~= 1.00000000
```

For the specialized `p = 2` fraction-free core-scale route, the same point gives:

```text
left  = 32 * 96^2 * (1 + sigma * log(3)) ~= 2.94912e5
right = (sigma * log(3)) * X^2            ~= 2.20033e7
right-left ~= 2.17084e7, right/left ~= 74.61
```

For the unit-strip reciprocal-scale reduction, the same point gives:

```text
barrier = 32 * 96^2 * (1 + log(3)) / log(3) ~= 5.63352e5
right   = sigma * X^2                                ~= 2.00283e7
right-barrier ~= 1.94649e7, right/barrier ~= 35.55
```

It also reports the new address-closeness route:

```text
p = 1: |A4-A12| ~= 3.65e-8,   margin ~= 2.96e-9,  margin-difference ~= -3.35e-8
p = 2: |A4-A12| ~= 1.38e-13,  margin ~= 2.96e-9,  margin-difference ~=  2.96e-9
p = 4: |A4-A12| ~= 2.40e-25,  margin ~= 2.96e-9,  margin-difference ~=  2.96e-9
p = 8: |A4-A12| ~= 4.66e-49,  margin ~= 2.96e-9,  margin-difference ~=  2.96e-9
```

And the formal scale route:

```text
p = 1: upper ~= 3.93e-7,   2*floorMax ~= 1.57e-6,
       2*powerGapMax ~= 1.57e-6,  2*scaleTop ~= 2.36e-6,
       32*scaleTop ~= 3.77e-5,
       q lower margin ~= 4.15e-10, 1/8 lower margin ~= 4.15e-10,
       core margin ~= 2.96e-9
p = 2: upper ~= 2.89e-13,  2*floorMax ~= 2.47e-12,
       2*powerGapMax ~= 2.47e-12, 2*scaleTop ~= 2.78e-12,
       32*scaleTop ~= 4.45e-11,
       q lower margin ~= 4.15e-10, 1/8 lower margin ~= 4.15e-10,
       core margin ~= 2.96e-9
p = 4: upper ~= 2.72e-25,  2*floorMax ~= 3.81e-24,
       2*powerGapMax ~= 3.81e-24, 2*scaleTop ~= 3.86e-24,
       32*scaleTop ~= 6.18e-23,
       q lower margin ~= 4.15e-10, 1/8 lower margin ~= 4.15e-10,
       core margin ~= 2.96e-9
p = 8: upper ~= 4.69e-49,  2*floorMax ~= 7.45e-48,
       2*powerGapMax ~= 7.45e-48, 2*scaleTop ~= 7.45e-48,
       32*scaleTop ~= 1.19e-46,
       q lower margin ~= 4.15e-10, 1/8 lower margin ~= 4.15e-10,
       core margin ~= 2.96e-9
```

This does not prove the super-Gaussian finite channel is nonzero.  It only
shows the exponential cutoff collision is not stable under this regularizer
change at the certificate point.  The Lean consequence is to keep the next
target regularizer-parametric: define the candidate genuine channel first, then
prove its two-core no-address-collision condition on the real middle region.

Lean now formalizes the super-Gaussian candidate weights:

```lean
superGaussianCutoffWeight p X n =
  exp(-((n / X)^p))
```

For `0 < X`, Lean proves these weights are nonzero and damp larger C2
addresses in norm:

```lean
superGaussianCutoffWeight_ne_zero
superGaussianCutoffWeight_ratio_norm_le_one
```

Therefore every individual super-Gaussian address quartet prefix is nonzero in
`0 < Re(s)`:

```lean
superGaussianAddressQuartetPrefix_ne_zero_of_re_pos_of_cutoff_pos
```

The super-Gaussian two-core candidate has the same exact remaining obstruction:

```lean
superGaussianTwoCoreCutoffAddressCollision p X s
```

and the region-level package is:

```lean
SuperGaussianTwoCoreNoAddressCollisionOn p region ->
  SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_noAddressCollisionOn`.

The exact same obstruction is now also exposed as a scalar collision gap:

```lean
superGaussianTwoCoreCollisionGap p X s
```

Lean proves, for `0 < Re(s)` and `0 < X`,

```lean
superGaussianTwoCoreCutoffPrefix p X s ≠ 0 ↔
  superGaussianTwoCoreCollisionGap p X s ≠ 0
```

via `superGaussianTwoCoreCutoffPrefix_ne_zero_iff_collisionGap_ne_zero`.
The region-level package is:

```lean
PositiveCutoffRegionOn region ->
  SuperGaussianTwoCoreCollisionGapNonzeroOn p region ->
    SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_collisionGapNonzeroOn`.  This is the
preferred next cutoff obligation because it matches the numerical audit column
`collision gap` and avoids hiding the cross-core phase condition behind a vague
non-cancellation statement.

Lean also exposes the collision ratio:

```lean
superGaussianTwoCoreCollisionRatio p X s
```

with

```lean
superGaussianTwoCoreCollisionGap p X s =
  superGaussianTwoCoreCollisionRatio p X s + 1
```

So the exact remaining obstruction is the single value:

```lean
superGaussianTwoCoreCollisionRatio p X s = -1
```

The current audit-friendly next targets are any one of:

```lean
SuperGaussianTwoCoreCollisionRatioNormSeparatedOn p region
SuperGaussianTwoCoreCollisionRatioRealSeparatedOn p region
SuperGaussianTwoCoreCollisionRatioImagSeparatedOn p region
```

which respectively prove the ratio avoids `-1` by norm, real part, or imaginary
part.  Each route now feeds directly into
`SuperGaussianTwoCoreNonvanishingOn p region` once `PositiveCutoffRegionOn
region` is available.  These are sufficient criteria, not claims that the
middle-region separation has already been proved.

Lean now proves one concrete norm-separation route.  If

```lean
‖superGaussianAddressQuartetPrefix p X s 4 -
    superGaussianAddressQuartetPrefix p X s 12‖ <
  (1 - ‖complexDirichletCoeff s 3‖) *
    ‖superGaussianAddressQuartetPrefix p X s 12‖
```

then

```lean
1 < ‖superGaussianTwoCoreCollisionRatio p X s‖
```

via
`superGaussianTwoCoreCollisionRatio_norm_gt_one_of_address_closeness`.
At region level, the package is:

```lean
PositiveCutoffRegionOn region ->
  SuperGaussianTwoCoreAddressClosenessOn p region ->
    SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_addressClosenessOn`.  This is now
the preferred large-cutoff route: prove address-prefix closeness from the
super-Gaussian damping, then norm separation follows automatically.

Lean further reduces address-prefix closeness to an explicit finite real upper:

```lean
superGaussianAddressClosenessUpper p X s
```

with

```lean
‖superGaussianAddressQuartetPrefix p X s 4 -
    superGaussianAddressQuartetPrefix p X s 12‖ ≤
  superGaussianAddressClosenessUpper p X s
```

via `superGaussianAddressQuartetPrefix_sub_norm_le_closenessUpper`.  The upper
is the four-floor sum of cutoff weight differences for the address pairs
`(4,12)`, `(8,24)`, `(16,48)`, `(32,96)`, weighted by
`1, ‖q s‖, ‖q s‖^2, ‖q s‖^3`.

Lean also proves a uniform-floor shortcut.  If every one of those four floor
differences is at most `δ`, then in `0 < Re(s)`:

```lean
superGaussianAddressClosenessUpper p X s < 2 * δ
```

via `superGaussianAddressClosenessUpper_lt_two_mul_of_floor_bounds`.  The
region-level package is:

```lean
PositiveCutoffRegionOn region ->
  0 < δ ->
  SuperGaussianTwoCoreUniformFloorClosenessOn p δ region ->
  SuperGaussianTwoCoreCoreMarginDominatesOn p δ region ->
    SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_uniformFloorClosenessOn`.  The next
formal target is therefore entirely real and finite: prove the four cutoff
floor differences are `≤ δ`, and prove `2δ` is smaller than the core margin on
the intended large-cutoff middle region.

Lean now removes the external choice of `δ` as well.  It defines

```lean
superGaussianAddressFloorMax p X
```

as the maximum of the four cutoff floor differences and proves:

```lean
superGaussianAddressClosenessUpper p X s ≤
  (1 + ‖q s‖ + ‖q s‖^2 + ‖q s‖^3) *
    superGaussianAddressFloorMax p X
```

Since `0 < Re(s)` gives

```lean
1 + ‖q s‖ + ‖q s‖^2 + ‖q s‖^3 ≤ 2
```

the current preferred region-level obligation is the single finite inequality:

```lean
SuperGaussianTwoCoreFloorMaxMarginDominatesOn p region
```

expanded as:

```lean
2 * superGaussianAddressFloorMax p X <
  (1 - ‖complexDirichletCoeff s 3‖) *
    ‖superGaussianAddressQuartetPrefix p X s 12‖
```

Together with `PositiveCutoffRegionOn region`, this now proves

```lean
SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_floorMaxMarginDominatesOn`.

Lean now also bounds the floor maximum by a purely algebraic exponent-gap
maximum.  For `0 < X`, each normalized cutoff floor difference satisfies:

```lean
superGaussianAddressFloorDiff p X a b ≤
  ((b : ℝ) / X)^p - ((a : ℝ) / X)^p
```

whenever `4 ≤ a ≤ b`, via
`superGaussianAddressFloorDiff_le_powerGap`.  Therefore:

```lean
superGaussianAddressFloorMax p X ≤
  superGaussianAddressPowerGapMax p X
```

via `superGaussianAddressFloorMax_le_powerGapMax`.  The current most concrete
region-level sufficient obligation is:

```lean
SuperGaussianTwoCorePowerGapMarginDominatesOn p region
```

expanded as:

```lean
2 * superGaussianAddressPowerGapMax p X <
  (1 - ‖complexDirichletCoeff s 3‖) *
    ‖superGaussianAddressQuartetPrefix p X s 12‖
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_powerGapMarginDominatesOn`.

Lean now reduces this once more to a single scale term.  For `0 < X`:

```lean
superGaussianAddressPowerGapMax p X ≤ ((96 : ℝ) / X)^p
```

via `superGaussianAddressPowerGapMax_le_topScale`.  Thus the current simplest
region-level sufficient obligation is:

```lean
SuperGaussianTwoCoreScaleMarginDominatesOn p region
```

expanded as:

```lean
2 * ((96 : ℝ) / X)^p <
  (1 - ‖complexDirichletCoeff s 3‖) *
    ‖superGaussianAddressQuartetPrefix p X s 12‖
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_scaleMarginDominatesOn`.

Lean now also supplies a quantitative lower bound for the address-`12`
quartet prefix itself.  The generic weighted quartet estimate is:

```lean
1 - (‖z‖ + ‖z‖^2 + ‖z‖^3) ≤
  ‖1 + z * a + z^2 * b + z^3 * c‖
```

whenever `‖a‖, ‖b‖, ‖c‖ ≤ 1`, via
`weightedQuartetPrefix_norm_lower_bound`.  For the super-Gaussian address
prefix this becomes:

```lean
‖W_p(12, X) / W_p(4, X)‖ *
  (1 - (‖q s‖ + ‖q s‖^2 + ‖q s‖^3)) ≤
‖superGaussianAddressQuartetPrefix p X s 12‖
```

via `superGaussianAddressQuartetPrefix_norm_lower_bound`.

Lean also proves that the vertical bracket margin is uniformly bounded below:

```lean
1 / 8 ≤ 1 - (‖q s‖ + ‖q s‖^2 + ‖q s‖^3)
```

through `one_eighth_le_one_sub_q_cubic_tail_of_re_pos`, using only
`0 < s.re`.  This gives the intermediate region-level sufficient obligation:

```lean
SuperGaussianTwoCoreScaleCoreCutoffMarginDominatesOn p region
```

expanded as:

```lean
2 * ((96 : ℝ) / X)^p <
  (1 - ‖complexDirichletCoeff s 3‖) *
    (‖superGaussianCutoffWeight p X 12 /
        superGaussianCutoffWeight p X 4‖ * (1 / 8 : ℝ))
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_scaleCoreCutoffMarginDominatesOn`.

Lean also proves a cutoff-ratio floor:

```lean
((12 : ℝ) / X)^p - ((4 : ℝ) / X)^p ≤ Real.log 2
  ->
1 / 2 ≤
  ‖superGaussianCutoffWeight p X 12 /
      superGaussianCutoffWeight p X 4‖
```

via `superGaussianCutoffWeight_ratio_norm_ge_half_of_gap_le_log_two`.
Moreover, `SuperGaussianTwoCoreScaleCoreHalfMarginDominatesOn` itself forces
the exponent-gap condition, using `one_div_thirty_two_lt_log_two` and
`superGaussianAddressPowerGap_le_topScale`.  Clearing constants gives the
current most reduced region-level route:

```lean
SuperGaussianTwoCoreScaleCoreMarginDominatesOn p region
```

expanded as:

```lean
32 * ((96 : ℝ) / X)^p <
  1 - ‖complexDirichletCoeff s 3‖
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn p region
```

via `superGaussianTwoCoreNonvanishingOn_of_scaleCoreMarginDominatesOn`.
This scalar margin is further reduced by lower-bound constants.  If a region
supplies:

```lean
SuperGaussianTwoCoreScaleCoreLowerBoundsOn sigma0 X0 region
```

meaning `sigma0 ≤ Re(s)` and `X0 ≤ X`, it is enough to prove:

```lean
SuperGaussianTwoCoreScaleCoreConstantMargin p sigma0 X0
```

expanded as:

```lean
32 * ((96 : ℝ) / X0)^p <
  1 - exp(-(sigma0 * log 3))
```

via `superGaussianTwoCoreNonvanishingOn_of_scaleCoreLowerBoundsOn`.

For the audited first useful profile `p = 2`, Lean also records the
fraction-free sufficient condition:

```lean
SuperGaussianTwoCoreScaleCoreQuadraticConstantMargin sigma0 X0
```

expanded as:

```lean
32 * 96^2 * (1 + sigma0 * log 3) <
  (sigma0 * log 3) * X0^2
```

Together with `PositiveCutoffRegionOn region`, `0 < X0`, `0 ≤ sigma0`, and the
lower-bound package, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn 2 region
```

via
`superGaussianTwoCoreNonvanishingOn_two_of_scaleCoreLowerBoundsOn_quadraticMargin`.
Lean also records the pointwise version:

```lean
SuperGaussianTwoCorePointwiseQuadraticScaleCoreMarginOn region
```

expanded as:

```lean
32 * 96^2 * (1 + s.re * log 3) <
  (s.re * log 3) * X^2
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn 2 region
```

via `superGaussianTwoCoreNonvanishingOn_two_of_pointwiseQuadratic`.  This is
the current most flexible middle obligation because it does not require a
uniform `sigma0` away from zero; it allows the cutoff scale `X` to compensate
pointwise for small `Re(s)`.

When the middle region also lies in the unit real strip, Lean reduces the same
pointwise obligation to the cleaner reciprocal-scale package:

```lean
SuperGaussianTwoCoreUnitStripReciprocalScaleOn region
```

expanded as:

```lean
s.re ≤ 1 ∧
  32 * 96^2 * (1 + log 3) / log 3 < s.re * X^2
```

Together with `PositiveCutoffRegionOn region`, this proves:

```lean
SuperGaussianTwoCoreNonvanishingOn 2 region
```

via `superGaussianTwoCoreNonvanishingOn_two_of_unitStripReciprocalScaleOn`.
This is currently the cleanest middle target: prove the region is positive,
prove `Re(s) ≤ 1`, and prove that the chosen cutoff scale grows faster than
the reciprocal barrier above.

Lean also closes the corresponding explicit region:

```lean
superGaussianTwoCoreUnitStripScaleRegion
```

expanded as:

```lean
0 < s.re ∧ 0 < X ∧ s.re ≤ 1 ∧
  32 * 96^2 * (1 + log 3) / log 3 < s.re * X^2
```

with:

```lean
superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion
```

So the finite two-core `p = 2` genuine obstruction is closed on this explicit
region.  The next non-tautological task is to prove that the intended audited
middle/cutoff region is contained in this explicit region, or to refine the
explicit region if the intended cutoff profile uses a different scale law.

Lean now also records a concrete reciprocal cutoff sufficient condition.  It
proves:

```lean
one_lt_log_three
superGaussianTwoCoreUnitStripScaleBarrier_lt_768_sq
```

and defines:

```lean
superGaussianTwoCoreReciprocalCutoffScale A s = A / s.re
```

For `A = 768`, Lean proves that the practical region

```lean
superGaussianTwoCoreReciprocal768ScaleRegion
```

expanded as:

```lean
0 < s.re ∧ s.re ≤ 1 ∧
  superGaussianTwoCoreReciprocalCutoffScale 768 s ≤ X
```

is contained in the explicit unit-strip scale region, and closes:

```lean
superGaussianTwoCoreNonvanishingOn_two_reciprocal768ScaleRegion
```

Equivalently, the pointwise theorem is:

```lean
superGaussianTwoCoreCutoffPrefix_two_ne_zero_of_reciprocal768_le_cutoff
```

expanded informally as:

```lean
0 < s.re -> s.re ≤ 1 -> 768 / s.re ≤ X ->
  superGaussianTwoCoreCutoffPrefix 2 X s ≠ 0
```

Lean also restores the nonzero geometric scalar removed by the normalized
prefix and closes the corresponding finite genuine block:

```lean
superGaussianTwoCoreGenuineBlock_two_ne_zero_of_reciprocal768_le_cutoff
```

expanded informally as:

```lean
0 < s.re -> s.re ≤ 1 -> 768 / s.re ≤ X ->
  superGaussianTwoCoreGenuineBlock 2 X s ≠ 0
```

and the region-level package:

```lean
superGaussianTwoCoreGenuineBlockNonvanishingOn_two_reciprocal768
```

This is now the cleanest finite two-core cutoff target: for the intended
middle/cutoff construction, prove the scale lower bound `768 / Re(s) ≤ X`,
then connect this restored finite block to the intended regularized genuine
middle numerator and control the remaining residual/tail terms.

Lean now records that bridge as a separate genuine-first extension criterion.
For any named geometric remainder:

```lean
superGaussianTwoCoreGenuineExtension p remainder X s =
  superGaussianTwoCoreGenuineBlock p X s + remainder s X
```

the local tail-dominance theorem is:

```lean
superGaussianTwoCoreGenuineExtension_ne_zero_of_remainder_norm_lt
```

expanded informally as:

```lean
‖remainder s X‖ < ‖superGaussianTwoCoreGenuineBlock p X s‖ ->
  superGaussianTwoCoreGenuineExtension p remainder X s ≠ 0
```

For explicit estimates, Lean also records the lower-bound version:

```lean
superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_lower
```

Lean now supplies the named lower envelope:

```lean
superGaussianTwoCoreGenuineBlockNormLowerProfile 2
```

with:

```lean
superGaussianTwoCoreGenuineBlockNormLowerOn_two_reciprocal768
```

and Lean also certifies that this lower envelope is strictly positive on the
same region:

```lean
superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_two_reciprocal768
```

and the fully specialized extension criterion:

```lean
superGaussianTwoCoreGenuineExtensionNonvanishingOn_two_reciprocal768_of_profileLower
```

So the next proof work is now concrete: define the actual zeta-free geometric
middle remainder and prove it is smaller than this positive margin:

```lean
SuperGaussianTwoCoreGenuineRemainderBelowOn
  superGaussianTwoCoreReciprocal768ScaleRegion remainder
  (superGaussianTwoCoreGenuineBlockNormLowerProfile 2)
```

For finite regularized genuine rectangles, the concrete remainder is now:

```lean
superGaussianFiniteGenuineRectangleRemainder 2 K M
```

and the finite middle nonvanishing bridge is:

```lean
superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_remainderBelow
```

For the larger finite-rectangle regime `K >= 5`, `M >= 3`, Lean now expands
that remainder exactly as the sum over every C2 address outside the certified
`5 x 3` block:

```lean
superGaussianFiniteGenuineRectangleRemainder_eq_address_sdiff_sum
```

and bounds its norm by the explicit real finite sum:

```lean
superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s
```

The current finite middle obligation can therefore be stated without any
hidden complex cancellation term:

```lean
superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K M X s <
  superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X
```

Once this concrete inequality is proved on the reciprocal-768 region, Lean
closes the finite rectangle by:

```lean
superGaussianFiniteGenuineRectangleNonvanishingOn_two_reciprocal768_of_normUpperBelow
```

The minimal `K = 5`, `M = 3` rectangle has zero remainder and is already closed:

```lean
superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_two_reciprocal768
```

No transfer identity is involved in this obligation.

Important audit correction: the unrestricted global target

```lean
0 < s.re -> 0 < X ->
  rectangularExponentialGenuine s 5 3 X ≠ 0
```

should not be pursued as stated.  The script
`audit_two_core_cutoff_zero_certificate.py` reproduces a high-precision
near-zero of the exact Lean-isolated prefix at

```text
sigma = 3.0194247128036204e-9
t     = 168021.56816461699
X     = 81444144.70071535
|twoCoreCutoffFiberPrefix| < 1e-75
```

This is not formal proof of a zero, but it is enough to retire the global
finite-cutoff statement as an audit target.  The next target must add the real
middle-region hypotheses, choose a cutoff regime that excludes this near-axis
degeneration, or replace this finite cutoff by the correct regularized genuine
channel.

The unrestricted super-Gaussian version also must not be pursued as stated.
`audit_two_core_supergaussian_positive_roots.py` refines positive-cutoff
numerical collisions at the same small positive `sigma`:

```text
p = 2: t ~= 168021.56816465463, X ~= 551945.7857953185
p = 4: t ~= 168021.17186748318, X ~= 20.28857758189
p = 8: t ~= 168021.56816465654, X ~= 836.1188312447
```

This does not prove actual zeros in Lean, but it is a strong audit warning:
the theorem should include a large-cutoff or middle-region condition.  The
address-closeness route above is designed for that restricted target.

Lean now exposes the correct region-level shape:

```lean
TwoCoreCutoffNoAddressCollisionOn region ->
  TwoCoreCutoffNonvanishingOn region
```

via `twoCoreCutoffNonvanishingOn_of_noAddressCollisionOn`.  The next proof
should instantiate `region` with the actual zeta-free middle/cutoff regime and
prove no address collision there.

The old residual inequality remains a valid sufficient criterion:

```lean
rectangularExponentialPointwiseOscillatoryUpper s 5 3 J X <
  rectangularGenuineFiveThreeNormLower s
```

via
`rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper_lt_lower`
or, at default Taylor depth `J = 24`,
`rectangularExponentialGenuine_five_three_ne_zero_of_oscillatory_upper24_lt_lower`.
This is not the active route right now.

The local shortcut:

```lean
‖twoCoreCutoffFiber s X 8 / twoCoreCutoffFiber s X 4‖ ≤ 1
```

and the analogous `16` and `32` bounds would also imply nonzero by
`rectangularExponentialGenuine_five_three_ne_zero_of_fiber_ratio_bounds`, but
empirical checks show those hypotheses are too strong globally.  Do not chase
them as the main middle obligation.

The infinite/regularized central target should then lift through
`adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_noCancellation`.

Transfer to the zeta/RH statement should only happen after this genuine
non-cancellation surface is closed.
