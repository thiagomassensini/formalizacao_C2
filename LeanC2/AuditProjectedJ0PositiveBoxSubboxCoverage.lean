import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option linter.flexible false
set_option linter.style.cdot false
set_option linter.unusedSimpArgs false
set_option maxHeartbeats 0

/-!
# Positive-box subbox coverage proofs

This generated file proves the geometric coverage of each positive-box
region by its generated subbox regions. Analytic bounds remain external.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open AdjustedQuartetProjectedJ0Aliases

theorem positiveBox_subbox_cover_s084_t0 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t0,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t0,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262561 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t0_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262561 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131281 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t0_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131281 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262563 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t0_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262563 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65641 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t0_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65641 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52513 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t0_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52513 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131283 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t0_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131283 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262567 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t0_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262567 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32821 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t0_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32821 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262569 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t0_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262569 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26257 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t0_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26257 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((8205343749999999 : ℚ) / 250000000000000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t0_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((8205343749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65643 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t0_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65643 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262573 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t0_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262573 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131287 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t0_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131287 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((10503 : ℚ) / 320) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t0_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((10503 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16411 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t0_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16411 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262577 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t0_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262577 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131289 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t0_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131289 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262579 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t0_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262579 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13129 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t0_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13129 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262581 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t0_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262581 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131291 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t0_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131291 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((8205718749999999 : ℚ) / 250000000000000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t0_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((8205718749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32823 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t0_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32823 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52517 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t0_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52517 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131293 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t0_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131293 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262587 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t0_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262587 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8205874999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t0_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8205874999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262589 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t0_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262589 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26259 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t0_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26259 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262591 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t0_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262591 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t0_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t1 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t1,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t1,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262601 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t1_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262601 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((8206312500000001 : ℚ) / 250000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t1_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((8206312500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262603 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t1_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262603 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((6565100000000001 : ℚ) / 200000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t1_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((6565100000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52521 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t1_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52521 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131303 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t1_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131303 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262607 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t1_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262607 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((16413 : ℚ) / 500) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t1_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((16413 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6565225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t1_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6565225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26261 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t1_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26261 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262611 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t1_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262611 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65653 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t1_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65653 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262613 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t1_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262613 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((8206687500000001 : ℚ) / 250000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t1_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((8206687500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52523 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t1_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52523 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32827 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t1_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32827 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262617 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t1_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262617 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131309 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t1_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131309 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262619 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t1_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262619 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13131 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t1_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13131 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6565525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t1_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6565525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131311 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t1_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131311 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262623 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t1_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262623 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8207 : ℚ) / 250) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t1_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8207 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((2101 : ℚ) / 64) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t1_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((2101 : ℚ) / 64) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((8207062500000001 : ℚ) / 250000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t1_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((8207062500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262627 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t1_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262627 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65657 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t1_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65657 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262629 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t1_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262629 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26263 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t1_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26263 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8207218750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t1_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8207218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t1_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t2 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t2,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t2,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((6566024999999999 : ℚ) / 200000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t2_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((6566024999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131321 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t2_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131321 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262643 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t2_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262643 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65661 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t2_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65661 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52529 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t2_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52529 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131323 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t2_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131323 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262647 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t2_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262647 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32831 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t2_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32831 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262649 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t2_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262649 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((5253 : ℚ) / 160) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t2_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((5253 : ℚ) / 160) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262651 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t2_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262651 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65663 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t2_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65663 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262653 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t2_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262653 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131327 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t2_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131327 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8207968750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t2_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8207968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((4104 : ℚ) / 125) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t2_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((4104 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262657 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t2_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262657 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131329 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t2_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131329 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262659 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t2_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262659 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13133 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t2_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13133 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262661 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t2_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262661 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((8208187500000001 : ℚ) / 250000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t2_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((8208187500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262663 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t2_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262663 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32833 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t2_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32833 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52533 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t2_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52533 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131333 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t2_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131333 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8208343750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t2_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8208343750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65667 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t2_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65667 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((6566725000000001 : ℚ) / 200000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t2_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((6566725000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26267 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t2_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26267 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((16416937500000003 : ℚ) / 500000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t2_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((16416937500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t2_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t3 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t3,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t3,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262681 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t3_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262681 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131341 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t3_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131341 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262683 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t3_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262683 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65671 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t3_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65671 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52537 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t3_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52537 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131343 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t3_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131343 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262687 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t3_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262687 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8209 : ℚ) / 250) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t3_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8209 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262689 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t3_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262689 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26269 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t3_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26269 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262691 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t3_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262691 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65673 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t3_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65673 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262693 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t3_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262693 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131347 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t3_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131347 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52539 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t3_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52539 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32837 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t3_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32837 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262697 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t3_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262697 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131349 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t3_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131349 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262699 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t3_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262699 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((2627 : ℚ) / 80) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t3_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((2627 : ℚ) / 80) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262701 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t3_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262701 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131351 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t3_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131351 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262703 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t3_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262703 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((16419 : ℚ) / 500) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t3_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((16419 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52541 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t3_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52541 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131353 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t3_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131353 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262707 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t3_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262707 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8209624999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t3_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8209624999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262709 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t3_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262709 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26271 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t3_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26271 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262711 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t3_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262711 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t3_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t4 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t4,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t4,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262721 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t4_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262721 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((6568050000000001 : ℚ) / 200000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t4_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((6568050000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262723 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t4_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262723 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((16420250000000003 : ℚ) / 500000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t4_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((16420250000000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((10509 : ℚ) / 320) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t4_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((10509 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131363 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t4_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131363 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((8210218750000001 : ℚ) / 250000000000000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t4_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((8210218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32841 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t4_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32841 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6568225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t4_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6568225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26273 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t4_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26273 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262731 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t4_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262731 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65683 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t4_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65683 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262733 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t4_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262733 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((6568350000000001 : ℚ) / 200000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t4_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((6568350000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52547 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t4_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52547 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16421 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t4_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16421 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262737 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t4_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262737 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131369 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t4_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131369 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((8210593750000001 : ℚ) / 250000000000000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t4_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((8210593750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13137 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t4_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13137 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6568525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t4_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6568525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131371 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t4_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131371 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262743 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t4_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262743 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32843 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t4_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32843 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52549 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t4_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52549 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((6568650000000001 : ℚ) / 200000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t4_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((6568650000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262747 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t4_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262747 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65687 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t4_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65687 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262749 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t4_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262749 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((1051 : ℚ) / 32) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t4_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((1051 : ℚ) / 32) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8210968750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t4_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8210968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t4_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t5 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t5,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t5,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((8211281249999999 : ℚ) / 250000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t5_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((8211281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131381 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t5_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131381 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262763 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t5_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262763 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65691 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t5_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65691 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52553 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t5_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52553 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131383 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t5_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131383 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262767 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t5_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262767 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8211500000000001 : ℚ) / 250000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t5_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8211500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262769 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t5_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262769 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26277 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t5_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26277 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262771 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t5_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262771 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65693 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t5_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65693 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262773 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t5_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262773 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131387 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t5_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131387 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8211718750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t5_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8211718750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32847 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t5_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32847 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262777 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t5_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262777 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131389 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t5_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131389 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262779 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t5_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262779 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((8211875000000001 : ℚ) / 250000000000000) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t5_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((8211875000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262781 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t5_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262781 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((6569550000000001 : ℚ) / 200000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t5_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((6569550000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262783 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t5_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262783 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((4106 : ℚ) / 125) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t5_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((4106 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52557 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t5_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52557 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131393 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t5_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131393 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8212093750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t5_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8212093750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65697 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t5_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65697 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((16424312500000003 : ℚ) / 500000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t5_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((16424312500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26279 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t5_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26279 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((3284887500000001 : ℚ) / 100000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t5_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((3284887500000001 : ℚ) / 100000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t5_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t6 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t6,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t6,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262801 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t6_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262801 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131401 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t6_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131401 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262803 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t6_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262803 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((8212625000000001 : ℚ) / 250000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t6_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((8212625000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52561 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t6_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52561 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131403 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t6_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131403 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262807 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t6_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262807 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32851 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t6_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32851 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262809 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t6_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262809 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26281 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t6_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26281 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262811 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t6_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262811 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65703 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t6_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65703 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262813 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t6_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262813 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131407 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t6_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131407 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52563 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t6_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52563 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((8213000000000001 : ℚ) / 250000000000000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t6_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((8213000000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262817 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t6_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262817 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131409 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t6_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131409 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262819 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t6_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262819 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13141 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t6_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13141 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262821 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t6_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262821 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131411 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t6_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131411 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262823 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t6_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262823 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32853 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t6_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32853 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((10513 : ℚ) / 320) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t6_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((10513 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131413 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t6_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131413 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262827 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t6_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262827 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65707 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t6_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65707 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262829 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t6_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262829 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26283 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t6_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26283 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262831 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t6_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262831 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t6_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t7 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t7,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t7,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((16427562499999997 : ℚ) / 500000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s084_t7_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((16427562499999997 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131421 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s084_t7_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131421 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((6571074999999999 : ℚ) / 200000000000000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s084_t7_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((6571074999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65711 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s084_t7_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65711 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((8213906249999999 : ℚ) / 250000000000000) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s084_t7_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((8213906249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131423 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s084_t7_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131423 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262847 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s084_t7_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262847 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((6571199999999999 : ℚ) / 200000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s084_t7_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((6571199999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262849 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s084_t7_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262849 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((8214062499999999 : ℚ) / 250000000000000) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s084_t7_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((8214062499999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262851 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s084_t7_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262851 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65713 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s084_t7_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65713 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262853 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s084_t7_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262853 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131427 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s084_t7_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131427 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52571 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s084_t7_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52571 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32857 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s084_t7_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32857 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((8214281249999999 : ℚ) / 250000000000000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s084_t7_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((8214281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131429 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s084_t7_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131429 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262859 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s084_t7_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262859 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13143 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s084_t7_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13143 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262861 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s084_t7_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262861 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131431 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s084_t7_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131431 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262863 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s084_t7_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262863 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8214500000000001 : ℚ) / 250000000000000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s084_t7_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8214500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52573 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s084_t7_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52573 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131433 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s084_t7_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131433 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262867 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s084_t7_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262867 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65717 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s084_t7_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65717 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262869 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s084_t7_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262869 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26287 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s084_t7_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26287 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((6571775000000001 : ℚ) / 200000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s084_t7_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((6571775000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s084_t7_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s084_t8 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t8,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s084_t8,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  refine ⟨PositiveBoxSubboxId.s084_t8_sb000, ?_, ?_⟩
  · simp [positiveBoxSubboxesOf]
  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
    exact ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩

theorem positiveBox_subbox_cover_s085_t0 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t0,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t0,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262561 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t0_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262561 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131281 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t0_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131281 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262563 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t0_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262563 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65641 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t0_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65641 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52513 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t0_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52513 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131283 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t0_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131283 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262567 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t0_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262567 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32821 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t0_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32821 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262569 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t0_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262569 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26257 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t0_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26257 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((8205343749999999 : ℚ) / 250000000000000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t0_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((8205343749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65643 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t0_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65643 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262573 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t0_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262573 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131287 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t0_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131287 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((10503 : ℚ) / 320) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t0_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((10503 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16411 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t0_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16411 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262577 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t0_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262577 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131289 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t0_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131289 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262579 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t0_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262579 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13129 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t0_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13129 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262581 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t0_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262581 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131291 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t0_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131291 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((8205718749999999 : ℚ) / 250000000000000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t0_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((8205718749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32823 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t0_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32823 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52517 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t0_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52517 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131293 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t0_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131293 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262587 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t0_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262587 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8205874999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t0_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8205874999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262589 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t0_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262589 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26259 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t0_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26259 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262591 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t0_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262591 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t0_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t1 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t1,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t1,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262601 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t1_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262601 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((8206312500000001 : ℚ) / 250000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t1_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((8206312500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262603 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t1_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262603 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((6565100000000001 : ℚ) / 200000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t1_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((6565100000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52521 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t1_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52521 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131303 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t1_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131303 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262607 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t1_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262607 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((16413 : ℚ) / 500) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t1_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((16413 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6565225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t1_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6565225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26261 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t1_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26261 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262611 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t1_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262611 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65653 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t1_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65653 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262613 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t1_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262613 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((8206687500000001 : ℚ) / 250000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t1_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((8206687500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52523 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t1_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52523 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32827 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t1_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32827 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262617 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t1_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262617 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131309 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t1_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131309 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262619 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t1_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262619 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13131 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t1_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13131 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6565525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t1_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6565525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131311 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t1_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131311 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262623 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t1_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262623 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8207 : ℚ) / 250) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t1_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8207 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((2101 : ℚ) / 64) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t1_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((2101 : ℚ) / 64) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((8207062500000001 : ℚ) / 250000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t1_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((8207062500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262627 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t1_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262627 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65657 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t1_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65657 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262629 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t1_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262629 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26263 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t1_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26263 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8207218750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t1_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8207218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t1_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t2 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t2,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t2,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((6566024999999999 : ℚ) / 200000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t2_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((6566024999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131321 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t2_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131321 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262643 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t2_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262643 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65661 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t2_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65661 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52529 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t2_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52529 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131323 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t2_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131323 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262647 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t2_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262647 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32831 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t2_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32831 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262649 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t2_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262649 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((5253 : ℚ) / 160) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t2_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((5253 : ℚ) / 160) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262651 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t2_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262651 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65663 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t2_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65663 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262653 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t2_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262653 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131327 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t2_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131327 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8207968750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t2_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8207968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((4104 : ℚ) / 125) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t2_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((4104 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262657 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t2_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262657 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131329 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t2_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131329 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262659 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t2_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262659 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13133 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t2_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13133 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262661 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t2_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262661 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((8208187500000001 : ℚ) / 250000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t2_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((8208187500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262663 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t2_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262663 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32833 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t2_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32833 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52533 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t2_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52533 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131333 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t2_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131333 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8208343750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t2_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8208343750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65667 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t2_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65667 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((6566725000000001 : ℚ) / 200000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t2_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((6566725000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26267 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t2_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26267 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((16416937500000003 : ℚ) / 500000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t2_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((16416937500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t2_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t3 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t3,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t3,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262681 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t3_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262681 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131341 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t3_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131341 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262683 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t3_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262683 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65671 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t3_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65671 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52537 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t3_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52537 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131343 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t3_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131343 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262687 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t3_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262687 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8209 : ℚ) / 250) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t3_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8209 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262689 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t3_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262689 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26269 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t3_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26269 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262691 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t3_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262691 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65673 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t3_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65673 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262693 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t3_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262693 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131347 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t3_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131347 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52539 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t3_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52539 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32837 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t3_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32837 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262697 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t3_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262697 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131349 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t3_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131349 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262699 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t3_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262699 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((2627 : ℚ) / 80) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t3_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((2627 : ℚ) / 80) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262701 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t3_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262701 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131351 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t3_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131351 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262703 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t3_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262703 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((16419 : ℚ) / 500) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t3_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((16419 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52541 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t3_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52541 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131353 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t3_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131353 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262707 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t3_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262707 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8209624999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t3_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8209624999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262709 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t3_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262709 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26271 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t3_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26271 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262711 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t3_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262711 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t3_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t4 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t4,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t4,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262721 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t4_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262721 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((6568050000000001 : ℚ) / 200000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t4_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((6568050000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262723 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t4_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262723 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((16420250000000003 : ℚ) / 500000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t4_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((16420250000000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((10509 : ℚ) / 320) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t4_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((10509 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131363 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t4_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131363 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((8210218750000001 : ℚ) / 250000000000000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t4_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((8210218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32841 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t4_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32841 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6568225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t4_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6568225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26273 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t4_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26273 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262731 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t4_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262731 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65683 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t4_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65683 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262733 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t4_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262733 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((6568350000000001 : ℚ) / 200000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t4_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((6568350000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52547 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t4_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52547 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16421 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t4_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16421 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262737 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t4_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262737 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131369 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t4_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131369 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((8210593750000001 : ℚ) / 250000000000000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t4_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((8210593750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13137 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t4_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13137 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6568525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t4_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6568525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131371 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t4_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131371 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262743 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t4_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262743 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32843 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t4_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32843 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52549 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t4_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52549 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((6568650000000001 : ℚ) / 200000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t4_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((6568650000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262747 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t4_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262747 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65687 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t4_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65687 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262749 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t4_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262749 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((1051 : ℚ) / 32) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t4_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((1051 : ℚ) / 32) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8210968750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t4_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8210968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t4_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t5 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t5,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t5,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((8211281249999999 : ℚ) / 250000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t5_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((8211281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131381 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t5_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131381 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262763 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t5_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262763 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65691 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t5_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65691 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52553 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t5_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52553 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131383 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t5_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131383 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262767 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t5_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262767 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8211500000000001 : ℚ) / 250000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t5_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8211500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262769 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t5_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262769 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26277 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t5_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26277 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262771 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t5_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262771 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65693 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t5_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65693 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262773 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t5_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262773 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131387 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t5_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131387 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8211718750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t5_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8211718750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32847 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t5_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32847 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262777 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t5_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262777 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131389 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t5_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131389 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262779 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t5_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262779 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((8211875000000001 : ℚ) / 250000000000000) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t5_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((8211875000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262781 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t5_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262781 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((6569550000000001 : ℚ) / 200000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t5_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((6569550000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262783 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t5_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262783 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((4106 : ℚ) / 125) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t5_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((4106 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52557 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t5_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52557 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131393 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t5_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131393 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8212093750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t5_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8212093750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65697 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t5_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65697 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((16424312500000003 : ℚ) / 500000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t5_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((16424312500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26279 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t5_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26279 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((3284887500000001 : ℚ) / 100000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t5_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((3284887500000001 : ℚ) / 100000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t5_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t6 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t6,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t6,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262801 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t6_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262801 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131401 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t6_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131401 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262803 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t6_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262803 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((8212625000000001 : ℚ) / 250000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t6_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((8212625000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52561 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t6_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52561 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131403 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t6_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131403 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262807 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t6_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262807 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32851 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t6_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32851 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262809 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t6_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262809 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26281 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t6_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26281 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262811 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t6_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262811 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65703 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t6_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65703 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262813 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t6_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262813 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131407 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t6_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131407 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52563 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t6_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52563 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((8213000000000001 : ℚ) / 250000000000000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t6_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((8213000000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262817 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t6_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262817 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131409 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t6_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131409 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262819 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t6_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262819 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13141 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t6_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13141 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262821 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t6_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262821 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131411 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t6_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131411 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262823 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t6_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262823 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32853 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t6_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32853 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((10513 : ℚ) / 320) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t6_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((10513 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131413 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t6_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131413 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262827 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t6_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262827 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65707 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t6_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65707 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262829 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t6_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262829 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26283 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t6_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26283 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262831 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t6_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262831 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t6_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t7 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t7,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t7,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((16427562499999997 : ℚ) / 500000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s085_t7_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((16427562499999997 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131421 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s085_t7_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131421 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((6571074999999999 : ℚ) / 200000000000000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s085_t7_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((6571074999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65711 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s085_t7_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65711 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((8213906249999999 : ℚ) / 250000000000000) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s085_t7_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((8213906249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131423 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s085_t7_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131423 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262847 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s085_t7_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262847 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((6571199999999999 : ℚ) / 200000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s085_t7_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((6571199999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262849 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s085_t7_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262849 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((8214062499999999 : ℚ) / 250000000000000) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s085_t7_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((8214062499999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262851 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s085_t7_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262851 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65713 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s085_t7_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65713 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262853 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s085_t7_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262853 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131427 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s085_t7_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131427 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52571 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s085_t7_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52571 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32857 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s085_t7_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32857 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((8214281249999999 : ℚ) / 250000000000000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s085_t7_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((8214281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131429 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s085_t7_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131429 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262859 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s085_t7_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262859 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13143 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s085_t7_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13143 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262861 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s085_t7_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262861 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131431 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s085_t7_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131431 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262863 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s085_t7_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262863 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8214500000000001 : ℚ) / 250000000000000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s085_t7_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8214500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52573 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s085_t7_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52573 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131433 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s085_t7_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131433 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262867 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s085_t7_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262867 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65717 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s085_t7_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65717 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262869 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s085_t7_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262869 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26287 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s085_t7_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26287 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((6571775000000001 : ℚ) / 200000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s085_t7_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((6571775000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s085_t7_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s085_t8 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s085_t8,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s085_t8,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  refine ⟨PositiveBoxSubboxId.s085_t8_sb000, ?_, ?_⟩
  · simp [positiveBoxSubboxesOf]
  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
    exact ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩

theorem positiveBox_subbox_cover_s086_t0 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t0,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t0,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262561 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t0_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262561 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131281 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t0_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131281 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262563 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t0_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262563 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65641 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t0_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65641 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52513 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t0_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52513 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131283 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t0_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131283 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262567 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t0_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262567 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32821 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t0_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32821 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262569 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t0_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262569 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26257 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t0_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26257 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((8205343749999999 : ℚ) / 250000000000000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t0_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((8205343749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65643 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t0_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65643 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262573 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t0_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262573 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131287 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t0_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131287 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((10503 : ℚ) / 320) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t0_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((10503 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16411 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t0_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16411 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262577 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t0_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262577 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131289 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t0_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131289 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262579 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t0_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262579 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13129 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t0_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13129 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262581 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t0_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262581 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131291 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t0_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131291 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((8205718749999999 : ℚ) / 250000000000000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t0_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((8205718749999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32823 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t0_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32823 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52517 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t0_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52517 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131293 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t0_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131293 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262587 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t0_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262587 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8205874999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t0_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8205874999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262589 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t0_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262589 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26259 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t0_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26259 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262591 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t0_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262591 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t0_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t1 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t1,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t1,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262601 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t1_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262601 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((8206312500000001 : ℚ) / 250000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t1_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((8206312500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262603 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t1_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262603 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((6565100000000001 : ℚ) / 200000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t1_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((6565100000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52521 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t1_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52521 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131303 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t1_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131303 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262607 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t1_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262607 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((16413 : ℚ) / 500) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t1_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((16413 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6565225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t1_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6565225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26261 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t1_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26261 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262611 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t1_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262611 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65653 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t1_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65653 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262613 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t1_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262613 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((8206687500000001 : ℚ) / 250000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t1_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((8206687500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52523 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t1_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52523 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32827 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t1_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32827 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262617 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t1_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262617 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131309 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t1_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131309 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262619 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t1_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262619 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13131 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t1_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13131 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6565525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t1_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6565525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131311 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t1_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131311 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262623 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t1_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262623 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8207 : ℚ) / 250) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t1_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8207 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((2101 : ℚ) / 64) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t1_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((2101 : ℚ) / 64) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((8207062500000001 : ℚ) / 250000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t1_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((8207062500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262627 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t1_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262627 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65657 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t1_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65657 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262629 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t1_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262629 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26263 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t1_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26263 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8207218750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t1_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8207218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t1_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t2 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t2,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t2,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((6566024999999999 : ℚ) / 200000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t2_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((6566024999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131321 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t2_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131321 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262643 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t2_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262643 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65661 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t2_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65661 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52529 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t2_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52529 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131323 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t2_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131323 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262647 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t2_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262647 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32831 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t2_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32831 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262649 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t2_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262649 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((5253 : ℚ) / 160) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t2_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((5253 : ℚ) / 160) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262651 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t2_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262651 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65663 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t2_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65663 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262653 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t2_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262653 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131327 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t2_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131327 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8207968750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t2_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8207968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((4104 : ℚ) / 125) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t2_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((4104 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262657 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t2_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262657 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131329 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t2_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131329 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262659 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t2_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262659 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13133 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t2_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13133 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262661 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t2_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262661 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((8208187500000001 : ℚ) / 250000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t2_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((8208187500000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262663 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t2_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262663 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32833 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t2_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32833 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52533 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t2_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52533 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131333 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t2_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131333 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8208343750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t2_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8208343750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65667 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t2_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65667 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((6566725000000001 : ℚ) / 200000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t2_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((6566725000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26267 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t2_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26267 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((16416937500000003 : ℚ) / 500000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t2_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((16416937500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t2_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t3 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t3,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t3,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262681 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t3_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262681 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131341 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t3_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131341 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262683 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t3_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262683 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65671 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t3_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65671 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52537 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t3_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52537 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131343 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t3_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131343 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262687 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t3_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262687 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8209 : ℚ) / 250) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t3_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8209 : ℚ) / 250) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262689 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t3_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262689 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26269 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t3_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26269 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262691 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t3_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262691 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65673 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t3_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65673 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262693 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t3_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262693 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131347 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t3_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131347 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52539 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t3_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52539 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32837 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t3_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32837 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262697 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t3_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262697 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131349 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t3_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131349 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262699 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t3_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262699 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((2627 : ℚ) / 80) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t3_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((2627 : ℚ) / 80) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262701 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t3_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262701 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131351 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t3_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131351 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262703 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t3_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262703 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((16419 : ℚ) / 500) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t3_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((16419 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52541 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t3_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52541 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131353 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t3_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131353 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262707 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t3_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262707 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((8209624999999999 : ℚ) / 250000000000000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t3_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((8209624999999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262709 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t3_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262709 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26271 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t3_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26271 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262711 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t3_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262711 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t3_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t4 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t4,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t4,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262721 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t4_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262721 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((6568050000000001 : ℚ) / 200000000000000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t4_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((6568050000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262723 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t4_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262723 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((16420250000000003 : ℚ) / 500000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t4_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((16420250000000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((10509 : ℚ) / 320) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t4_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((10509 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131363 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t4_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131363 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((8210218750000001 : ℚ) / 250000000000000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t4_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((8210218750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32841 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t4_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32841 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((6568225000000001 : ℚ) / 200000000000000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t4_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((6568225000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26273 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t4_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26273 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262731 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t4_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262731 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65683 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t4_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65683 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262733 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t4_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262733 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((6568350000000001 : ℚ) / 200000000000000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t4_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((6568350000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52547 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t4_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52547 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((16421 : ℚ) / 500) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t4_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((16421 : ℚ) / 500) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262737 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t4_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262737 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131369 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t4_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131369 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((8210593750000001 : ℚ) / 250000000000000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t4_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((8210593750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13137 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t4_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13137 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((6568525000000001 : ℚ) / 200000000000000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t4_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((6568525000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131371 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t4_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131371 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262743 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t4_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262743 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32843 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t4_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32843 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52549 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t4_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52549 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((6568650000000001 : ℚ) / 200000000000000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t4_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((6568650000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262747 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t4_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262747 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65687 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t4_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65687 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262749 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t4_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262749 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((1051 : ℚ) / 32) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t4_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((1051 : ℚ) / 32) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((8210968750000001 : ℚ) / 250000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t4_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((8210968750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t4_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t5 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t5,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t5,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((8211281249999999 : ℚ) / 250000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t5_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((8211281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131381 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t5_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131381 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262763 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t5_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262763 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65691 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t5_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65691 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52553 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t5_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52553 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131383 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t5_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131383 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262767 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t5_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262767 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((8211500000000001 : ℚ) / 250000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t5_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((8211500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262769 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t5_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262769 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26277 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t5_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26277 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262771 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t5_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262771 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65693 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t5_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65693 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262773 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t5_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262773 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131387 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t5_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131387 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((8211718750000001 : ℚ) / 250000000000000) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t5_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((8211718750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32847 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t5_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32847 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262777 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t5_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262777 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131389 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t5_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131389 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262779 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t5_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262779 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((8211875000000001 : ℚ) / 250000000000000) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t5_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((8211875000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262781 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t5_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262781 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((6569550000000001 : ℚ) / 200000000000000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t5_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((6569550000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262783 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t5_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262783 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((4106 : ℚ) / 125) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t5_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((4106 : ℚ) / 125) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52557 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t5_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52557 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131393 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t5_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131393 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((8212093750000001 : ℚ) / 250000000000000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t5_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((8212093750000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65697 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t5_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65697 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((16424312500000003 : ℚ) / 500000000000000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t5_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((16424312500000003 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26279 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t5_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26279 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((3284887500000001 : ℚ) / 100000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t5_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((3284887500000001 : ℚ) / 100000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t5_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t6 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t6,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t6,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((262801 : ℚ) / 8000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t6_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((262801 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131401 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t6_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131401 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((262803 : ℚ) / 8000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t6_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((262803 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((8212625000000001 : ℚ) / 250000000000000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t6_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((8212625000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((52561 : ℚ) / 1600) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t6_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((52561 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131403 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t6_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131403 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262807 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t6_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262807 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((32851 : ℚ) / 1000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t6_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((32851 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262809 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t6_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262809 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((26281 : ℚ) / 800) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t6_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((26281 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262811 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t6_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262811 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65703 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t6_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65703 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262813 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t6_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262813 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131407 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t6_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131407 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52563 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t6_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52563 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((8213000000000001 : ℚ) / 250000000000000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t6_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((8213000000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((262817 : ℚ) / 8000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t6_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((262817 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131409 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t6_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131409 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262819 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t6_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262819 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13141 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t6_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13141 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262821 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t6_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262821 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131411 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t6_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131411 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262823 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t6_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262823 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((32853 : ℚ) / 1000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t6_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((32853 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((10513 : ℚ) / 320) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t6_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((10513 : ℚ) / 320) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131413 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t6_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131413 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262827 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t6_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262827 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65707 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t6_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65707 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262829 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t6_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262829 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26283 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t6_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26283 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((262831 : ℚ) / 8000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t6_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((262831 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t6_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t7 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t7,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t7,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  by_cases h0 : s.im ≤ (((16427562499999997 : ℚ) / 500000000000000) : ℝ)
  ·
    refine ⟨PositiveBoxSubboxId.s086_t7_sb000, ?_, ?_⟩
    · simp [positiveBoxSubboxesOf]
    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
      exact ⟨hSigmaMin, hSigmaMax, htMin, h0⟩
  ·
    have htLower1 : (((16427562499999997 : ℚ) / 500000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h0)
    by_cases h1 : s.im ≤ (((131421 : ℚ) / 4000) : ℝ)
    ·
      refine ⟨PositiveBoxSubboxId.s086_t7_sb001, ?_, ?_⟩
      · simp [positiveBoxSubboxesOf]
      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
        exact ⟨hSigmaMin, hSigmaMax, htLower1, h1⟩
    ·
      have htLower2 : (((131421 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h1)
      by_cases h2 : s.im ≤ (((6571074999999999 : ℚ) / 200000000000000) : ℝ)
      ·
        refine ⟨PositiveBoxSubboxId.s086_t7_sb002, ?_, ?_⟩
        · simp [positiveBoxSubboxesOf]
        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
          exact ⟨hSigmaMin, hSigmaMax, htLower2, h2⟩
      ·
        have htLower3 : (((6571074999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h2)
        by_cases h3 : s.im ≤ (((65711 : ℚ) / 2000) : ℝ)
        ·
          refine ⟨PositiveBoxSubboxId.s086_t7_sb003, ?_, ?_⟩
          · simp [positiveBoxSubboxesOf]
          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
            exact ⟨hSigmaMin, hSigmaMax, htLower3, h3⟩
        ·
          have htLower4 : (((65711 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h3)
          by_cases h4 : s.im ≤ (((8213906249999999 : ℚ) / 250000000000000) : ℝ)
          ·
            refine ⟨PositiveBoxSubboxId.s086_t7_sb004, ?_, ?_⟩
            · simp [positiveBoxSubboxesOf]
            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
              exact ⟨hSigmaMin, hSigmaMax, htLower4, h4⟩
          ·
            have htLower5 : (((8213906249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h4)
            by_cases h5 : s.im ≤ (((131423 : ℚ) / 4000) : ℝ)
            ·
              refine ⟨PositiveBoxSubboxId.s086_t7_sb005, ?_, ?_⟩
              · simp [positiveBoxSubboxesOf]
              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                exact ⟨hSigmaMin, hSigmaMax, htLower5, h5⟩
            ·
              have htLower6 : (((131423 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h5)
              by_cases h6 : s.im ≤ (((262847 : ℚ) / 8000) : ℝ)
              ·
                refine ⟨PositiveBoxSubboxId.s086_t7_sb006, ?_, ?_⟩
                · simp [positiveBoxSubboxesOf]
                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                  exact ⟨hSigmaMin, hSigmaMax, htLower6, h6⟩
              ·
                have htLower7 : (((262847 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h6)
                by_cases h7 : s.im ≤ (((6571199999999999 : ℚ) / 200000000000000) : ℝ)
                ·
                  refine ⟨PositiveBoxSubboxId.s086_t7_sb007, ?_, ?_⟩
                  · simp [positiveBoxSubboxesOf]
                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                    exact ⟨hSigmaMin, hSigmaMax, htLower7, h7⟩
                ·
                  have htLower8 : (((6571199999999999 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h7)
                  by_cases h8 : s.im ≤ (((262849 : ℚ) / 8000) : ℝ)
                  ·
                    refine ⟨PositiveBoxSubboxId.s086_t7_sb008, ?_, ?_⟩
                    · simp [positiveBoxSubboxesOf]
                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                      exact ⟨hSigmaMin, hSigmaMax, htLower8, h8⟩
                  ·
                    have htLower9 : (((262849 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h8)
                    by_cases h9 : s.im ≤ (((8214062499999999 : ℚ) / 250000000000000) : ℝ)
                    ·
                      refine ⟨PositiveBoxSubboxId.s086_t7_sb009, ?_, ?_⟩
                      · simp [positiveBoxSubboxesOf]
                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                        exact ⟨hSigmaMin, hSigmaMax, htLower9, h9⟩
                    ·
                      have htLower10 : (((8214062499999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h9)
                      by_cases h10 : s.im ≤ (((262851 : ℚ) / 8000) : ℝ)
                      ·
                        refine ⟨PositiveBoxSubboxId.s086_t7_sb010, ?_, ?_⟩
                        · simp [positiveBoxSubboxesOf]
                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                          exact ⟨hSigmaMin, hSigmaMax, htLower10, h10⟩
                      ·
                        have htLower11 : (((262851 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h10)
                        by_cases h11 : s.im ≤ (((65713 : ℚ) / 2000) : ℝ)
                        ·
                          refine ⟨PositiveBoxSubboxId.s086_t7_sb011, ?_, ?_⟩
                          · simp [positiveBoxSubboxesOf]
                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                            exact ⟨hSigmaMin, hSigmaMax, htLower11, h11⟩
                        ·
                          have htLower12 : (((65713 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h11)
                          by_cases h12 : s.im ≤ (((262853 : ℚ) / 8000) : ℝ)
                          ·
                            refine ⟨PositiveBoxSubboxId.s086_t7_sb012, ?_, ?_⟩
                            · simp [positiveBoxSubboxesOf]
                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                              exact ⟨hSigmaMin, hSigmaMax, htLower12, h12⟩
                          ·
                            have htLower13 : (((262853 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h12)
                            by_cases h13 : s.im ≤ (((131427 : ℚ) / 4000) : ℝ)
                            ·
                              refine ⟨PositiveBoxSubboxId.s086_t7_sb013, ?_, ?_⟩
                              · simp [positiveBoxSubboxesOf]
                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                exact ⟨hSigmaMin, hSigmaMax, htLower13, h13⟩
                            ·
                              have htLower14 : (((131427 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h13)
                              by_cases h14 : s.im ≤ (((52571 : ℚ) / 1600) : ℝ)
                              ·
                                refine ⟨PositiveBoxSubboxId.s086_t7_sb014, ?_, ?_⟩
                                · simp [positiveBoxSubboxesOf]
                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                  exact ⟨hSigmaMin, hSigmaMax, htLower14, h14⟩
                              ·
                                have htLower15 : (((52571 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h14)
                                by_cases h15 : s.im ≤ (((32857 : ℚ) / 1000) : ℝ)
                                ·
                                  refine ⟨PositiveBoxSubboxId.s086_t7_sb015, ?_, ?_⟩
                                  · simp [positiveBoxSubboxesOf]
                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                    exact ⟨hSigmaMin, hSigmaMax, htLower15, h15⟩
                                ·
                                  have htLower16 : (((32857 : ℚ) / 1000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h15)
                                  by_cases h16 : s.im ≤ (((8214281249999999 : ℚ) / 250000000000000) : ℝ)
                                  ·
                                    refine ⟨PositiveBoxSubboxId.s086_t7_sb016, ?_, ?_⟩
                                    · simp [positiveBoxSubboxesOf]
                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                      exact ⟨hSigmaMin, hSigmaMax, htLower16, h16⟩
                                  ·
                                    have htLower17 : (((8214281249999999 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h16)
                                    by_cases h17 : s.im ≤ (((131429 : ℚ) / 4000) : ℝ)
                                    ·
                                      refine ⟨PositiveBoxSubboxId.s086_t7_sb017, ?_, ?_⟩
                                      · simp [positiveBoxSubboxesOf]
                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                        exact ⟨hSigmaMin, hSigmaMax, htLower17, h17⟩
                                    ·
                                      have htLower18 : (((131429 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h17)
                                      by_cases h18 : s.im ≤ (((262859 : ℚ) / 8000) : ℝ)
                                      ·
                                        refine ⟨PositiveBoxSubboxId.s086_t7_sb018, ?_, ?_⟩
                                        · simp [positiveBoxSubboxesOf]
                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                          exact ⟨hSigmaMin, hSigmaMax, htLower18, h18⟩
                                      ·
                                        have htLower19 : (((262859 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h18)
                                        by_cases h19 : s.im ≤ (((13143 : ℚ) / 400) : ℝ)
                                        ·
                                          refine ⟨PositiveBoxSubboxId.s086_t7_sb019, ?_, ?_⟩
                                          · simp [positiveBoxSubboxesOf]
                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                            exact ⟨hSigmaMin, hSigmaMax, htLower19, h19⟩
                                        ·
                                          have htLower20 : (((13143 : ℚ) / 400) : ℝ) ≤ s.im := le_of_lt (not_le.mp h19)
                                          by_cases h20 : s.im ≤ (((262861 : ℚ) / 8000) : ℝ)
                                          ·
                                            refine ⟨PositiveBoxSubboxId.s086_t7_sb020, ?_, ?_⟩
                                            · simp [positiveBoxSubboxesOf]
                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                              exact ⟨hSigmaMin, hSigmaMax, htLower20, h20⟩
                                          ·
                                            have htLower21 : (((262861 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h20)
                                            by_cases h21 : s.im ≤ (((131431 : ℚ) / 4000) : ℝ)
                                            ·
                                              refine ⟨PositiveBoxSubboxId.s086_t7_sb021, ?_, ?_⟩
                                              · simp [positiveBoxSubboxesOf]
                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                exact ⟨hSigmaMin, hSigmaMax, htLower21, h21⟩
                                            ·
                                              have htLower22 : (((131431 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h21)
                                              by_cases h22 : s.im ≤ (((262863 : ℚ) / 8000) : ℝ)
                                              ·
                                                refine ⟨PositiveBoxSubboxId.s086_t7_sb022, ?_, ?_⟩
                                                · simp [positiveBoxSubboxesOf]
                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                  exact ⟨hSigmaMin, hSigmaMax, htLower22, h22⟩
                                              ·
                                                have htLower23 : (((262863 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h22)
                                                by_cases h23 : s.im ≤ (((8214500000000001 : ℚ) / 250000000000000) : ℝ)
                                                ·
                                                  refine ⟨PositiveBoxSubboxId.s086_t7_sb023, ?_, ?_⟩
                                                  · simp [positiveBoxSubboxesOf]
                                                  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                    exact ⟨hSigmaMin, hSigmaMax, htLower23, h23⟩
                                                ·
                                                  have htLower24 : (((8214500000000001 : ℚ) / 250000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h23)
                                                  by_cases h24 : s.im ≤ (((52573 : ℚ) / 1600) : ℝ)
                                                  ·
                                                    refine ⟨PositiveBoxSubboxId.s086_t7_sb024, ?_, ?_⟩
                                                    · simp [positiveBoxSubboxesOf]
                                                    · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                      exact ⟨hSigmaMin, hSigmaMax, htLower24, h24⟩
                                                  ·
                                                    have htLower25 : (((52573 : ℚ) / 1600) : ℝ) ≤ s.im := le_of_lt (not_le.mp h24)
                                                    by_cases h25 : s.im ≤ (((131433 : ℚ) / 4000) : ℝ)
                                                    ·
                                                      refine ⟨PositiveBoxSubboxId.s086_t7_sb025, ?_, ?_⟩
                                                      · simp [positiveBoxSubboxesOf]
                                                      · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                        exact ⟨hSigmaMin, hSigmaMax, htLower25, h25⟩
                                                    ·
                                                      have htLower26 : (((131433 : ℚ) / 4000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h25)
                                                      by_cases h26 : s.im ≤ (((262867 : ℚ) / 8000) : ℝ)
                                                      ·
                                                        refine ⟨PositiveBoxSubboxId.s086_t7_sb026, ?_, ?_⟩
                                                        · simp [positiveBoxSubboxesOf]
                                                        · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                          exact ⟨hSigmaMin, hSigmaMax, htLower26, h26⟩
                                                      ·
                                                        have htLower27 : (((262867 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h26)
                                                        by_cases h27 : s.im ≤ (((65717 : ℚ) / 2000) : ℝ)
                                                        ·
                                                          refine ⟨PositiveBoxSubboxId.s086_t7_sb027, ?_, ?_⟩
                                                          · simp [positiveBoxSubboxesOf]
                                                          · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                            exact ⟨hSigmaMin, hSigmaMax, htLower27, h27⟩
                                                        ·
                                                          have htLower28 : (((65717 : ℚ) / 2000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h27)
                                                          by_cases h28 : s.im ≤ (((262869 : ℚ) / 8000) : ℝ)
                                                          ·
                                                            refine ⟨PositiveBoxSubboxId.s086_t7_sb028, ?_, ?_⟩
                                                            · simp [positiveBoxSubboxesOf]
                                                            · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                              exact ⟨hSigmaMin, hSigmaMax, htLower28, h28⟩
                                                          ·
                                                            have htLower29 : (((262869 : ℚ) / 8000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h28)
                                                            by_cases h29 : s.im ≤ (((26287 : ℚ) / 800) : ℝ)
                                                            ·
                                                              refine ⟨PositiveBoxSubboxId.s086_t7_sb029, ?_, ?_⟩
                                                              · simp [positiveBoxSubboxesOf]
                                                              · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                exact ⟨hSigmaMin, hSigmaMax, htLower29, h29⟩
                                                            ·
                                                              have htLower30 : (((26287 : ℚ) / 800) : ℝ) ≤ s.im := le_of_lt (not_le.mp h29)
                                                              by_cases h30 : s.im ≤ (((6571775000000001 : ℚ) / 200000000000000) : ℝ)
                                                              ·
                                                                refine ⟨PositiveBoxSubboxId.s086_t7_sb030, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower30, h30⟩
                                                              ·
                                                                have htLower31 : (((6571775000000001 : ℚ) / 200000000000000) : ℝ) ≤ s.im := le_of_lt (not_le.mp h30)
                                                                refine ⟨PositiveBoxSubboxId.s086_t7_sb031, ?_, ?_⟩
                                                                · simp [positiveBoxSubboxesOf]
                                                                · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
                                                                  exact ⟨hSigmaMin, hSigmaMax, htLower31, htMax⟩

theorem positiveBox_subbox_cover_s086_t8 :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s086_t8,
      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.s086_t8,
        s ∈ positiveBoxSubboxRegion i := by
  intro s hs
  simp [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hs
  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩
  norm_num [positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, q084, q085, q086, t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, t8Min, t8Max] at hSigmaMin hSigmaMax htMin htMax
  refine ⟨PositiveBoxSubboxId.s086_t8_sb000, ?_, ?_⟩
  · simp [positiveBoxSubboxesOf]
  · simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]
    exact ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩

theorem positiveBox_all_subbox_cover :
    PositiveBoxAllSubboxCoverHypotheses where
  cover := by
    intro b hb
    cases b
    · simpa using positiveBox_subbox_cover_s084_t0
    · simpa using positiveBox_subbox_cover_s084_t1
    · simpa using positiveBox_subbox_cover_s084_t2
    · simpa using positiveBox_subbox_cover_s084_t3
    · simpa using positiveBox_subbox_cover_s084_t4
    · simpa using positiveBox_subbox_cover_s084_t5
    · simpa using positiveBox_subbox_cover_s084_t6
    · simpa using positiveBox_subbox_cover_s084_t7
    · simpa using positiveBox_subbox_cover_s084_t8
    · simpa using positiveBox_subbox_cover_s085_t0
    · simpa using positiveBox_subbox_cover_s085_t1
    · simpa using positiveBox_subbox_cover_s085_t2
    · simpa using positiveBox_subbox_cover_s085_t3
    · simpa using positiveBox_subbox_cover_s085_t4
    · simpa using positiveBox_subbox_cover_s085_t5
    · simpa using positiveBox_subbox_cover_s085_t6
    · simpa using positiveBox_subbox_cover_s085_t7
    · simpa using positiveBox_subbox_cover_s085_t8
    · simpa using positiveBox_subbox_cover_s086_t0
    · simpa using positiveBox_subbox_cover_s086_t1
    · simpa using positiveBox_subbox_cover_s086_t2
    · simpa using positiveBox_subbox_cover_s086_t3
    · simpa using positiveBox_subbox_cover_s086_t4
    · simpa using positiveBox_subbox_cover_s086_t5
    · simpa using positiveBox_subbox_cover_s086_t6
    · simpa using positiveBox_subbox_cover_s086_t7
    · simpa using positiveBox_subbox_cover_s086_t8

theorem positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  exact positiveBox_totalFinite_ne_zero_of_all_subbox_bounds
    bounds
    positiveBox_all_subbox_cover

end ProjectedJ0PositiveBoxSkeleton
end C2
