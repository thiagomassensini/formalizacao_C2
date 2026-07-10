import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t3

This file contains exact rational endpoints and kernel-checkable
rectangle arithmetic. It intentionally contains no theorem asserting
analytic membership of M, D0, Drest, or RvecTail in these rectangles.

Source subboxes: audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl
Source subboxes SHA256: ef8298cb0c2b09354f90d3c272fe37fb58ab63dcc84d4566a3d455087c9923fe
Source box constants: audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
Source box constants SHA256: 7712949d582825faa70f6f6d362d697e15e6fa5f7f64a01a66570ccc5a0b8413
Skeleton: LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
Skeleton SHA256: f6cfce6ac124ef7f0161de797faa441ec1fbb99a1a20d0f1ccdb57c22afe40b3
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton
namespace ProjectedJ0PositiveBoxRectangleData
namespace S086T3

open ProjectedJ0RectangleArithmetic

def s086_t3_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((457375713977911 : ℚ) / 100000000000000000)
              hi := ((177032860486883 : ℚ) / 20000000000000000) }
      im := { lo := ((-210243084972913 : ℚ) / 3125000000000000)
              hi := ((-1576111098297267 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7736946321908481 : ℚ) / 1000000000000000000)
              hi := ((9044972623668459 : ℚ) / 1000000000000000000) }
      im := { lo := ((-162525530691343 : ℚ) / 31250000000000000)
              hi := ((-1216768820378147 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-12428767468514147 : ℚ) / 10000000000000000000)
              hi := ((-6102649958850207 : ℚ) / 10000000000000000000) }
      im := { lo := ((16091900770481729 : ℚ) / 10000000000000000000)
              hi := ((224185151026593 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3966385605660531 : ℚ) / 5000000000000000000)
              hi := ((1446989360338267 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5648649528253993 : ℚ) / 20000000000000000000)
              hi := ((10459341691973249 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((71553595291769 : ℚ) / 15625000000000000)
              hi := ((55357789945791 : ℚ) / 6250000000000000) }
      im := { lo := ((-6726314682462053 : ℚ) / 100000000000000000)
              hi := ((-6302990119284883 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((154617406305377 : ℚ) / 20000000000000000)
              hi := ((4519344822249429 : ℚ) / 500000000000000000) }
      im := { lo := ((-1042403978819987 : ℚ) / 200000000000000000)
              hi := ((-1952544563345369 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-775085145960789 : ℚ) / 625000000000000000)
              hi := ((-759437971875157 : ℚ) / 1250000000000000000) }
      im := { lo := ((8052606986489563 : ℚ) / 5000000000000000000)
              hi := ((1121579032160987 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-396576531889093 : ℚ) / 500000000000000000)
              hi := ((5789133817595911 : ℚ) / 10000000000000000000) }
      im := { lo := ((-564817723706567 : ℚ) / 2000000000000000000)
              hi := ((5229650652186557 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2292560886958217 : ℚ) / 500000000000000000)
              hi := ((4431433695031041 : ℚ) / 500000000000000000) }
      im := { lo := ((-3362425807361987 : ℚ) / 50000000000000000)
              hi := ((-3150768439530593 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7724779002820769 : ℚ) / 1000000000000000000)
              hi := ((9032391431054831 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2611607162525423 : ℚ) / 500000000000000000)
              hi := ((-3916509716659169 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6186969050162727 : ℚ) / 5000000000000000000)
              hi := ((-3024169583649701 : ℚ) / 5000000000000000000) }
      im := { lo := ((8059244408260437 : ℚ) / 5000000000000000000)
              hi := ((5611151830602209 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1586057408595313 : ℚ) / 2000000000000000000)
              hi := ((289515323144463 : ℚ) / 500000000000000000) }
      im := { lo := ((-2823851823684941 : ℚ) / 10000000000000000000)
              hi := ((10459260102941641 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4590832087254779 : ℚ) / 1000000000000000000)
              hi := ((1773701209643969 : ℚ) / 200000000000000000) }
      im := { lo := ((-336169475051519 : ℚ) / 5000000000000000)
              hi := ((-6300084690544899 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((771867240746241 : ℚ) / 100000000000000000)
              hi := ((9026078002936477 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5234400485315927 : ℚ) / 1000000000000000000)
              hi := ((-490990217460393 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2469299092403151 : ℚ) / 2000000000000000000)
              hi := ((-6021155586940757 : ℚ) / 10000000000000000000) }
      im := { lo := ((806586239484619 : ℚ) / 500000000000000000)
              hi := ((2245759561706501 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3964520501636819 : ℚ) / 5000000000000000000)
              hi := ((723934494417041 : ℚ) / 1250000000000000000) }
      im := { lo := ((-705902950682993 : ℚ) / 2500000000000000000)
              hi := ((2091843102211481 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2298280799151479 : ℚ) / 500000000000000000)
              hi := ((1109270229222847 : ℚ) / 125000000000000000) }
      im := { lo := ((-1344385655555489 : ℚ) / 20000000000000000)
              hi := ((-3149316810536989 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3856275472444209 : ℚ) / 500000000000000000)
              hi := ((9019748959320157 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2622788980974541 : ℚ) / 500000000000000000)
              hi := ((-3939325569919889 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12319032532601623 : ℚ) / 10000000000000000000)
              hi := ((-2996977506877377 : ℚ) / 5000000000000000000) }
      im := { lo := ((807246190257909 : ℚ) / 500000000000000000)
              hi := ((2247054355506669 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1585558497928459 : ℚ) / 2000000000000000000)
              hi := ((2896321132208383 : ℚ) / 5000000000000000000) }
      im := { lo := ((-5646734809580127 : ℚ) / 20000000000000000000)
              hi := ((2091833275728333 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((71911092333701 : ℚ) / 15625000000000000)
              hi := ((1109979384999721 : ℚ) / 125000000000000000) }
      im := { lo := ((-1680116998809503 : ℚ) / 25000000000000000)
              hi := ((-6297183625250913 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((38532070988003273 : ℚ) / 5000000000000000000)
              hi := ((4506702383064447 : ℚ) / 500000000000000000) }
      im := { lo := ((-5256747257597707 : ℚ) / 1000000000000000000)
              hi := ((-1975360332258073 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3072887935770339 : ℚ) / 2500000000000000000)
              hi := ((-1491683792661013 : ℚ) / 2500000000000000000) }
      im := { lo := ((25852933672931 : ℚ) / 16000000000000000)
              hi := ((22483453436112793 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7926540311594723 : ℚ) / 10000000000000000000)
              hi := ((5793804201722627 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28231181712859167 : ℚ) / 100000000000000000000)
              hi := ((10459112248577841 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((144002364387607 : ℚ) / 31250000000000000)
              hi := ((8885527138506833 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3359504354996349 : ℚ) / 50000000000000000)
              hi := ((-6295734650734731 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((15400524977110629 : ℚ) / 2000000000000000000)
              hi := ((4503522546905739 : ℚ) / 500000000000000000) }
      im := { lo := ((-2633954253240107 : ℚ) / 500000000000000000)
              hi := ((-7924213679365721 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1533006607301237 : ℚ) / 1250000000000000000)
              hi := ((-23757985437827 : ℚ) / 40000000000000000) }
      im := { lo := ((202140056213021 : ℚ) / 125000000000000000)
              hi := ((22496324666897933 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1585058971100083 : ℚ) / 2000000000000000000)
              hi := ((90546439926163 : ℚ) / 156250000000000000) }
      im := { lo := ((-564572892490143 : ℚ) / 2000000000000000000)
              hi := ((10459053482177127 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9227718980741097 : ℚ) / 2000000000000000000)
              hi := ((355649494809797 : ℚ) / 40000000000000000) }
      im := { lo := ((-6717550361338007 : ℚ) / 100000000000000000)
              hi := ((-6294286762384173 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((615527645480103 : ℚ) / 80000000000000000)
              hi := ((2250167553417311 : ℚ) / 250000000000000000) }
      im := { lo := ((-5279061083864911 : ℚ) / 1000000000000000000)
              hi := ((-3973484683823863 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6118267425644057 : ℚ) / 5000000000000000000)
              hi := ((-5912239709318423 : ℚ) / 10000000000000000000) }
      im := { lo := ((1011517952083827 : ℚ) / 625000000000000000)
              hi := ((1125457831432821 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-316962078631941 : ℚ) / 400000000000000000)
              hi := ((144903549230043 : ℚ) / 250000000000000000) }
      im := { lo := ((-28226060989560353 : ℚ) / 100000000000000000000)
              hi := ((1045898990124349 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4619661495798521 : ℚ) / 1000000000000000000)
              hi := ((2224241414477703 : ℚ) / 250000000000000000) }
      im := { lo := ((-6716093076501253 : ℚ) / 100000000000000000)
              hi := ((-251713593441373 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((7687913709980901 : ℚ) / 1000000000000000000)
              hi := ((112428498744509 : ℚ) / 12500000000000000) }
      im := { lo := ((-5290205001056657 : ℚ) / 1000000000000000000)
              hi := ((-3984854157289431 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12208997324402373 : ℚ) / 10000000000000000000)
              hi := ((-2942482876380609 : ℚ) / 5000000000000000000) }
      im := { lo := ((1619733237314559 : ℚ) / 1000000000000000000)
              hi := ((4504389740735199 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-396140464002467 : ℚ) / 500000000000000000)
              hi := ((5797311280707359 : ℚ) / 10000000000000000000) }
      im := { lo := ((-564470541132029 : ℚ) / 2000000000000000000)
              hi := ((10458931131474903 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9250964057037639 : ℚ) / 2000000000000000000)
              hi := ((890271162723781 : ℚ) / 100000000000000000) }
      im := { lo := ((-6714636855560911 : ℚ) / 100000000000000000)
              hi := ((-6291393876128959 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1536343360153531 : ℚ) / 200000000000000000)
              hi := ((89878742715249 : ℚ) / 10000000000000000) }
      im := { lo := ((-10602679810451491 : ℚ) / 2000000000000000000)
              hi := ((-7992431112500543 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-761339981330359 : ℚ) / 625000000000000000)
              hi := ((-5857675168784307 : ℚ) / 10000000000000000000) }
      im := { lo := ((4052585061773363 : ℚ) / 2500000000000000000)
              hi := ((225347004606557 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3960781910423237 : ℚ) / 5000000000000000000)
              hi := ((5798477114191517 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2822106580384973 : ℚ) / 10000000000000000000)
              hi := ((2614719867845801 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((231566034117549 : ℚ) / 50000000000000000)
              hi := ((1781695128313619 : ℚ) / 200000000000000000) }
      im := { lo := ((-6713181640123381 : ℚ) / 100000000000000000)
              hi := ((-6289948945974959 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3837752186655343 : ℚ) / 500000000000000000)
              hi := ((4490726911375883 : ℚ) / 500000000000000000) }
      im := { lo := ((-5312466506022533 : ℚ) / 1000000000000000000)
              hi := ((-2003784066460539 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12153865030612423 : ℚ) / 10000000000000000000)
              hi := ((-1457591254618269 : ℚ) / 2500000000000000000) }
      im := { lo := ((1013956748625143 : ℚ) / 625000000000000000)
              hi := ((1127370736655201 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1584063328768139 : ℚ) / 2000000000000000000)
              hi := ((1449910131804243 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3527322557381 : ℚ) / 12500000000000000)
              hi := ((326838288920129 : ℚ) / 312500000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((927435475519793 : ℚ) / 200000000000000000)
              hi := ((8914257801957497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13423454933223 : ℚ) / 200000000000000)
              hi := ((-6288505013843423 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((958659557387279 : ℚ) / 125000000000000000)
              hi := ((8975018551248727 : ℚ) / 1000000000000000000) }
      im := { lo := ((-83181006564923 : ℚ) / 15625000000000000)
              hi := ((-502364028416629 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6063136181182323 : ℚ) / 5000000000000000000)
              hi := ((-5803036376225829 : ℚ) / 10000000000000000000) }
      im := { lo := ((324724727192709 : ℚ) / 200000000000000000)
              hi := ((88125354216111 : ℚ) / 39062500000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7919068038035873 : ℚ) / 10000000000000000000)
              hi := ((1450200451739293 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1410805678255241 : ℚ) / 5000000000000000000)
              hi := ((10458772708991269 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4643051749390371 : ℚ) / 1000000000000000000)
              hi := ((1115007304552077 : ℚ) / 125000000000000000) }
      im := { lo := ((-3355137181296867 : ℚ) / 50000000000000000)
              hi := ((-3143531027127481 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((15326064930053257 : ℚ) / 2000000000000000000)
              hi := ((8968569055060847 : ℚ) / 1000000000000000000) }
      im := { lo := ((-166709191400039 : ℚ) / 31250000000000000)
              hi := ((-201512366713933 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3024666081501033 : ℚ) / 2500000000000000000)
              hi := ((-180490208490483 : ℚ) / 312500000000000000) }
      im := { lo := ((16249122705631553 : ℚ) / 10000000000000000000)
              hi := ((282159136667087 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7917816364478599 : ℚ) / 10000000000000000000)
              hi := ((5801959316958467 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2821364553818191 : ℚ) / 10000000000000000000)
              hi := ((10458719904395603 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((23244716301965003 : ℚ) / 5000000000000000000)
              hi := ((892587807271967 : ℚ) / 100000000000000000) }
      im := { lo := ((-3354411156236769 : ℚ) / 50000000000000000)
              hi := ((-6285620088393513 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3828386557985391 : ℚ) / 500000000000000000)
              hi := ((1120263081972309 : ℚ) / 125000000000000000) }
      im := { lo := ((-2672897945691037 : ℚ) / 500000000000000000)
              hi := ((-1010393282096367 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12071040313051753 : ℚ) / 10000000000000000000)
              hi := ((-1437079170571437 : ℚ) / 2500000000000000000) }
      im := { lo := ((4065492062391169 : ℚ) / 2500000000000000000)
              hi := ((22585334215978353 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3958284732638711 : ℚ) / 5000000000000000000)
              hi := ((725390112325571 : ℚ) / 1250000000000000000) }
      im := { lo := ((-28211140694119497 : ℚ) / 100000000000000000000)
              hi := ((5229331632156781 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9309705874154351 : ℚ) / 2000000000000000000)
              hi := ((1786343131384267 : ℚ) / 200000000000000000) }
      im := { lo := ((-3353685639893969 : ℚ) / 50000000000000000)
              hi := ((-6284179155806133 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7650498694849029 : ℚ) / 1000000000000000000)
              hi := ((8955625076247987 : ℚ) / 1000000000000000000) }
      im := { lo := ((-107137795588793 : ℚ) / 20000000000000000)
              hi := ((-4052889521561299 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-240867999142041 : ℚ) / 200000000000000000)
              hi := ((-5720926836222973 : ℚ) / 10000000000000000000) }
      im := { lo := ((3254954712870651 : ℚ) / 2000000000000000000)
              hi := ((22597899901600593 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3957660969446291 : ℚ) / 5000000000000000000)
              hi := ((1451070288074001 : ℚ) / 2500000000000000000) }
      im := { lo := ((-14104296595456473 : ℚ) / 50000000000000000000)
              hi := ((2091720441152853 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4660781196338347 : ℚ) / 1000000000000000000)
              hi := ((8937570751850461 : ℚ) / 1000000000000000000) }
      im := { lo := ((-167648031382137 : ℚ) / 2500000000000000)
              hi := ((-6282739271459559 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7644208942605169 : ℚ) / 1000000000000000000)
              hi := ((4474565304210939 : ℚ) / 500000000000000000) }
      im := { lo := ((-5367974773441261 : ℚ) / 1000000000000000000)
              hi := ((-4064197469899733 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1501967657371259 : ℚ) / 1250000000000000000)
              hi := ((-5693519284911291 : ℚ) / 10000000000000000000) }
      im := { lo := ((2544928121273 : ℚ) / 1562500000000000)
              hi := ((452208531835187 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7914070281755577 : ℚ) / 10000000000000000000)
              hi := ((2902718287503209 : ℚ) / 5000000000000000000) }
      im := { lo := ((-282060539773159 : ℚ) / 1000000000000000000)
              hi := ((5229270912263357 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9333456703547469 : ℚ) / 2000000000000000000)
              hi := ((89434430267807 : ℚ) / 10000000000000000) }
      im := { lo := ((-1676118053238761 : ℚ) / 25000000000000000)
              hi := ((-6281300463945039 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((954738046555909 : ℚ) / 125000000000000000)
              hi := ((2235655192595029 : ℚ) / 250000000000000000) }
      im := { lo := ((-2689525317457799 : ℚ) / 500000000000000000)
              hi := ((-2037748594323811 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11988062591751587 : ℚ) / 10000000000000000000)
              hi := ((-2833047878334381 : ℚ) / 5000000000000000000) }
      im := { lo := ((2037533663781713 : ℚ) / 1250000000000000000)
              hi := ((2262291245165757 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1978203895003011 : ℚ) / 2500000000000000000)
              hi := ((2903294126534333 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1410176329563899 : ℚ) / 5000000000000000000)
              hi := ((10458482475286617 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2336346749894787 : ℚ) / 500000000000000000)
              hi := ((178986667138279 : ℚ) / 20000000000000000) }
      im := { lo := ((-3351512115546621 : ℚ) / 50000000000000000)
              hi := ((-1569965664771689 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((15263169274849853 : ℚ) / 2000000000000000000)
              hi := ((1787219181500891 : ℚ) / 200000000000000000) }
      im := { lo := ((-84220588051909 : ℚ) / 15625000000000000)
              hi := ((-817357670892699 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11960365538405439 : ℚ) / 10000000000000000000)
              hi := ((-5638654747435843 : ℚ) / 10000000000000000000) }
      im := { lo := ((8156479971377431 : ℚ) / 5000000000000000000)
              hi := ((5658839750269281 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7911560569031941 : ℚ) / 10000000000000000000)
              hi := ((5807738924378143 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1410051413241281 : ℚ) / 5000000000000000000)
              hi := ((2091685176423331 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4678676021903737 : ℚ) / 1000000000000000000)
              hi := ((447762120422183 : ℚ) / 50000000000000000) }
      im := { lo := ((-6701577389607351 : ℚ) / 100000000000000000)
              hi := ((-1569606445974061 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((762524960303113 : ℚ) / 100000000000000000)
              hi := ((558097262670861 : ℚ) / 62500000000000000) }
      im := { lo := ((-5401175589616173 : ℚ) / 1000000000000000000)
              hi := ((-4098071118052431 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5966325028322843 : ℚ) / 5000000000000000000)
              hi := ((-5611196446431039 : ℚ) / 10000000000000000000) }
      im := { lo := ((255087684359011 : ℚ) / 156250000000000000)
              hi := ((566194157701521 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3955153775961323 : ℚ) / 5000000000000000000)
              hi := ((5808890887648999 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28198608430166577 : ℚ) / 100000000000000000000)
              hi := ((5229188495353567 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4684677605753209 : ℚ) / 1000000000000000000)
              hi := ((4480584195933823 : ℚ) / 500000000000000000) }
      im := { lo := ((-6700131466693751 : ℚ) / 100000000000000000)
              hi := ((-784623757627843 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((3809449813782843 : ℚ) / 500000000000000000)
              hi := ((4461500657578843 : ℚ) / 500000000000000000) }
      im := { lo := ((-2706112184747143 : ℚ) / 500000000000000000)
              hi := ((-4109345563257901 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1190491516352089 : ℚ) / 1000000000000000000)
              hi := ((-2791860970310691 : ℚ) / 5000000000000000000) }
      im := { lo := ((4084556504568911 : ℚ) / 2500000000000000000)
              hi := ((2266013316714179 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3954525351920133 : ℚ) / 5000000000000000000)
              hi := ((90781848812483 : ℚ) / 156250000000000000) }
      im := { lo := ((-704903777730979 : ℚ) / 2500000000000000000)
              hi := ((2091664840501559 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((938139474985033 : ℚ) / 200000000000000000)
              hi := ((2241778045866269 : ℚ) / 250000000000000000) }
      im := { lo := ((-3349343270604641 : ℚ) / 50000000000000000)
              hi := ((-3137777708153181 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((237891709751307 : ℚ) / 31250000000000000)
              hi := ((891643125268977 : ℚ) / 100000000000000000) }
      im := { lo := ((-5423264564577681 : ℚ) / 1000000000000000000)
              hi := ((-4120611068140139 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11877162542401377 : ℚ) / 10000000000000000000)
              hi := ((-5556229618788901 : ℚ) / 10000000000000000000) }
      im := { lo := ((16350801269858547 : ℚ) / 10000000000000000000)
              hi := ((906898434159077 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3953897109413259 : ℚ) / 5000000000000000000)
              hi := ((2905592713838399 : ℚ) / 5000000000000000000) }
      im := { lo := ((-5638732107444809 : ℚ) / 20000000000000000000)
              hi := ((5229133971484003 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1174183667487891 : ℚ) / 250000000000000000)
              hi := ((8973074471784739 : ℚ) / 1000000000000000000) }
      im := { lo := ((-334862129824711 : ℚ) / 5000000000000000)
              hi := ((-1568530467907589 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((475384684586631 : ℚ) / 62500000000000000)
              hi := ((8909845959782673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5434295807458017 : ℚ) / 1000000000000000000)
              hi := ((-826373589202859 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5924695594492867 : ℚ) / 5000000000000000000)
              hi := ((-1105744129108549 : ℚ) / 2000000000000000000) }
      im := { lo := ((2045417307710681 : ℚ) / 1250000000000000000)
              hi := ((4536949681770491 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3953272114406921 : ℚ) / 5000000000000000000)
              hi := ((1453084581986187 : ℚ) / 2500000000000000000) }
      im := { lo := ((-14095562889986397 : ℚ) / 50000000000000000000)
              hi := ((163409486240231 : ℚ) / 156250000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1175697634088117 : ℚ) / 250000000000000000)
              hi := ((8979054126214917 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6695799607773611 : ℚ) / 100000000000000000)
              hi := ((-6272689445973141 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3799880022585647 : ℚ) / 500000000000000000)
              hi := ((8903245758589097 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1089063613029799 : ℚ) / 200000000000000000)
              hi := ((-4143116200037429 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11821601765982653 : ℚ) / 10000000000000000000)
              hi := ((-5501194439777461 : ℚ) / 10000000000000000000) }
      im := { lo := ((16375836760213337 : ℚ) / 10000000000000000000)
              hi := ((2269699662407007 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7905291520122173 : ℚ) / 10000000000000000000)
              hi := ((5813487816182317 : ℚ) / 10000000000000000000) }
      im := { lo := ((-281885538679637 : ℚ) / 1000000000000000000)
              hi := ((10458142430907137 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4708864099777841 : ℚ) / 1000000000000000000)
              hi := ((4492526034507053 : ℚ) / 500000000000000000) }
      im := { lo := ((-6694357836113679 : ℚ) / 100000000000000000)
              hi := ((-3135628954869627 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((949168756711443 : ℚ) / 125000000000000000)
              hi := ((1112078826333019 : ℚ) / 125000000000000000) }
      im := { lo := ((-10912662728086709 : ℚ) / 2000000000000000000)
              hi := ((-4154355755739729 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5896897180807893 : ℚ) / 5000000000000000000)
              hi := ((-42762898756933 : ℚ) / 78125000000000000) }
      im := { lo := ((8194148084976901 : ℚ) / 5000000000000000000)
              hi := ((1135460271822981 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1976009338541813 : ℚ) / 2500000000000000000)
              hi := ((726829393700399 : ℚ) / 1250000000000000000) }
      im := { lo := ((-14093051748697167 : ℚ) / 50000000000000000000)
              hi := ((2614522440837399 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4714954101239381 : ℚ) / 1000000000000000000)
              hi := ((561941842185469 : ℚ) / 62500000000000000) }
      im := { lo := ((-6692917211852263 : ℚ) / 100000000000000000)
              hi := ((-1567456827509623 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7586923695780919 : ℚ) / 1000000000000000000)
              hi := ((8890001821560517 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5467336432432033 : ℚ) / 1000000000000000000)
              hi := ((-4165585854303049 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14707467252923 : ℚ) / 12500000000000000)
              hi := ((-1089217143255089 : ℚ) / 2000000000000000000) }
      im := { lo := ((4100177894045381 : ℚ) / 2500000000000000000)
              hi := ((908855197101131 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3951392268450033 : ℚ) / 5000000000000000000)
              hi := ((1163156627890577 : ℚ) / 2000000000000000000) }
      im := { lo := ((-352295660507281 : ℚ) / 1250000000000000000)
              hi := ((5229018460212357 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9442126162532493 : ℚ) / 2000000000000000000)
              hi := ((4498551912149657 : ℚ) / 500000000000000000) }
      im := { lo := ((-1338295510685093 : ℚ) / 20000000000000000)
              hi := ((-125367956631709 : ℚ) / 2000000000000000) } }
  D0Rect :=
    { re := { lo := ((15160965573056663 : ℚ) / 2000000000000000000)
              hi := ((8883357602476561 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5478332447041973 : ℚ) / 1000000000000000000)
              hi := ((-2088403634538963 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2934533535165613 : ℚ) / 2500000000000000000)
              hi := ((-270925227084219 : ℚ) / 500000000000000000) }
      im := { lo := ((2051636192001109 : ℚ) / 1250000000000000000)
              hi := ((11366756737571583 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7901528828407153 : ℚ) / 10000000000000000000)
              hi := ((581692754441137 : ℚ) / 1000000000000000000) }
      im := { lo := ((-28181182399865677 : ℚ) / 100000000000000000000)
              hi := ((261449548804749 : ℚ) / 250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((189087580899819 : ℚ) / 40000000000000000)
              hi := ((9003156613922427 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6690039132586667 : ℚ) / 100000000000000000)
              hi := ((-6266969237024159 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7574027178864449 : ℚ) / 1000000000000000000)
              hi := ((4438349059921503 : ℚ) / 500000000000000000) }
      im := { lo := ((-5489319095221001 : ℚ) / 1000000000000000000)
              hi := ((-4188020270937153 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5855137485676489 : ℚ) / 5000000000000000000)
              hi := ((-5390908026537989 : ℚ) / 10000000000000000000) }
      im := { lo := ((4106357554673271 : ℚ) / 2500000000000000000)
              hi := ((568640146299421 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1975068740618953 : ℚ) / 2500000000000000000)
              hi := ((90907392160143 : ℚ) / 156250000000000000) }
      im := { lo := ((-14089430083867813 : ℚ) / 50000000000000000000)
              hi := ((10457941676330787 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2366666702804309 : ℚ) / 500000000000000000)
              hi := ((1801845569976409 : ℚ) / 200000000000000000) }
      im := { lo := ((-836075228205223 : ℚ) / 12500000000000000)
              hi := ((-783192702369029 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((472972304896811 : ℚ) / 62500000000000000)
              hi := ((13859411548933 : ℚ) / 1562500000000000) }
      im := { lo := ((-3437685636456171 : ℚ) / 625000000000000000)
              hi := ((-4199224196647961 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-730149882457197 : ℚ) / 625000000000000000)
              hi := ((-2681647215163087 : ℚ) / 5000000000000000000) }
      im := { lo := ((8218866103720183 : ℚ) / 5000000000000000000)
              hi := ((2275765845756069 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7899024919166639 : ℚ) / 10000000000000000000)
              hi := ((1163844356493401 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2817657106732021 : ℚ) / 10000000000000000000)
              hi := ((2614476141734101 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4739495792235733 : ℚ) / 1000000000000000000)
              hi := ((225382909840973 : ℚ) / 25000000000000000) }
      im := { lo := ((-3343582752702663 : ℚ) / 50000000000000000)
              hi := ((-1566028781639773 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((302442881095527 : ℚ) / 40000000000000000)
              hi := ((8863333308224397 : ℚ) / 1000000000000000000) }
      im := { lo := ((-551126616236329 : ℚ) / 100000000000000000)
              hi := ((-4210419031971387 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11654503345829821 : ℚ) / 10000000000000000000)
              hi := ((-533566415670619 : ℚ) / 1000000000000000000) }
      im := { lo := ((1644999584269331 : ℚ) / 1000000000000000000)
              hi := ((4553934172813543 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7897774409686147 : ℚ) / 10000000000000000000)
              hi := ((5820369311559341 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2817424012439497 : ℚ) / 10000000000000000000)
              hi := ((5228931568294897 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9491354664974111 : ℚ) / 2000000000000000000)
              hi := ((2255355411606423 : ℚ) / 250000000000000000) }
      im := { lo := ((-1671432530330307 : ℚ) / 25000000000000000)
              hi := ((-782836226285777 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((755457253626517 : ℚ) / 100000000000000000)
              hi := ((8856627970433687 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1104445218889813 : ℚ) / 200000000000000000)
              hi := ((-263850324487343 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-2325317946131307 : ℚ) / 2000000000000000000)
              hi := ((-1061603636455063 : ℚ) / 2000000000000000000) }
      im := { lo := ((4115555439746731 : ℚ) / 2500000000000000000)
              hi := ((11390821204995403 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-315860793263383 : ℚ) / 400000000000000000)
              hi := ((582151208035043 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2817186606767131 : ℚ) / 10000000000000000000)
              hi := ((2091563451533187 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4751877478000653 : ℚ) / 1000000000000000000)
              hi := ((9027544120972049 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3342147877992521 : ℚ) / 50000000000000000)
              hi := ((-626126559364689 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((7548058293831283 : ℚ) / 1000000000000000000)
              hi := ((8849907525897783 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5533176628718121 : ℚ) / 1000000000000000000)
              hi := ((-1058195703221109 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-231973143683133 : ℚ) / 200000000000000000)
              hi := ((-5280356742092041 : ℚ) / 10000000000000000000) }
      im := { lo := ((8237204962406637 : ℚ) / 5000000000000000000)
              hi := ((569839326961379 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3947631367816203 : ℚ) / 5000000000000000000)
              hi := ((5822651640712669 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1408475154697269 : ℚ) / 5000000000000000000)
              hi := ((1307221543946313 : ℚ) / 1250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t3_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62778994191 : ℚ) / 1000000000000)
      ((-280860557 : ℚ) / 1000000000000)
      ((3867228627 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9293155273707 : ℚ) / 1953125000000000)
              hi := ((1129210564685587 : ℚ) / 125000000000000000) }
      im := { lo := ((-3341431262892231 : ℚ) / 50000000000000000)
              hi := ((-6259842361390827 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3770764405859861 : ℚ) / 500000000000000000)
              hi := ((8843172486749073 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5544118088182361 : ℚ) / 1000000000000000000)
              hi := ((-2121975763457969 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5785353885111119 : ℚ) / 5000000000000000000)
              hi := ((-131316947215381 : ℚ) / 250000000000000000) }
      im := { lo := ((4121639553498467 : ℚ) / 2500000000000000000)
              hi := ((456109298743291 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7894002787340519 : ℚ) / 10000000000000000000)
              hi := ((5823787659518759 : ℚ) / 10000000000000000000) }
      im := { lo := ((-704179945739561 : ℚ) / 2500000000000000000)
              hi := ((522886654006649 : ℚ) / 500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

/--
Return rectangle data only for a subbox formally belonging to this box.
The membership argument rules out every constructor from the other boxes;
there is no default or fallback certificate.
-/
def certificate (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf .s086_t3) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t3).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t3).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t3).constants.restUpper) := by
  if h0 : i = .s086_t3_sb000 then
    exact s086_t3_sb000_certificateData
  else if h1 : i = .s086_t3_sb001 then
    exact s086_t3_sb001_certificateData
  else if h2 : i = .s086_t3_sb002 then
    exact s086_t3_sb002_certificateData
  else if h3 : i = .s086_t3_sb003 then
    exact s086_t3_sb003_certificateData
  else if h4 : i = .s086_t3_sb004 then
    exact s086_t3_sb004_certificateData
  else if h5 : i = .s086_t3_sb005 then
    exact s086_t3_sb005_certificateData
  else if h6 : i = .s086_t3_sb006 then
    exact s086_t3_sb006_certificateData
  else if h7 : i = .s086_t3_sb007 then
    exact s086_t3_sb007_certificateData
  else if h8 : i = .s086_t3_sb008 then
    exact s086_t3_sb008_certificateData
  else if h9 : i = .s086_t3_sb009 then
    exact s086_t3_sb009_certificateData
  else if h10 : i = .s086_t3_sb010 then
    exact s086_t3_sb010_certificateData
  else if h11 : i = .s086_t3_sb011 then
    exact s086_t3_sb011_certificateData
  else if h12 : i = .s086_t3_sb012 then
    exact s086_t3_sb012_certificateData
  else if h13 : i = .s086_t3_sb013 then
    exact s086_t3_sb013_certificateData
  else if h14 : i = .s086_t3_sb014 then
    exact s086_t3_sb014_certificateData
  else if h15 : i = .s086_t3_sb015 then
    exact s086_t3_sb015_certificateData
  else if h16 : i = .s086_t3_sb016 then
    exact s086_t3_sb016_certificateData
  else if h17 : i = .s086_t3_sb017 then
    exact s086_t3_sb017_certificateData
  else if h18 : i = .s086_t3_sb018 then
    exact s086_t3_sb018_certificateData
  else if h19 : i = .s086_t3_sb019 then
    exact s086_t3_sb019_certificateData
  else if h20 : i = .s086_t3_sb020 then
    exact s086_t3_sb020_certificateData
  else if h21 : i = .s086_t3_sb021 then
    exact s086_t3_sb021_certificateData
  else if h22 : i = .s086_t3_sb022 then
    exact s086_t3_sb022_certificateData
  else if h23 : i = .s086_t3_sb023 then
    exact s086_t3_sb023_certificateData
  else if h24 : i = .s086_t3_sb024 then
    exact s086_t3_sb024_certificateData
  else if h25 : i = .s086_t3_sb025 then
    exact s086_t3_sb025_certificateData
  else if h26 : i = .s086_t3_sb026 then
    exact s086_t3_sb026_certificateData
  else if h27 : i = .s086_t3_sb027 then
    exact s086_t3_sb027_certificateData
  else if h28 : i = .s086_t3_sb028 then
    exact s086_t3_sb028_certificateData
  else if h29 : i = .s086_t3_sb029 then
    exact s086_t3_sb029_certificateData
  else if h30 : i = .s086_t3_sb030 then
    exact s086_t3_sb030_certificateData
  else if h31 : i = .s086_t3_sb031 then
    exact s086_t3_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T3
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
