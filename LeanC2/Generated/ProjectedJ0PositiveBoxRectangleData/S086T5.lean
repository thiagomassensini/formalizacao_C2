import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t5

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
namespace S086T5

open ProjectedJ0RectangleArithmetic

def s086_t5_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5084480664517343 : ℚ) / 1000000000000000000)
              hi := ((935630648215383 : ℚ) / 100000000000000000) }
      im := { lo := ((-661394889652213 : ℚ) / 10000000000000000)
              hi := ((-6191472590741789 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3601752465381129 : ℚ) / 500000000000000000)
              hi := ((1699040900885819 : ℚ) / 200000000000000000) }
      im := { lo := ((-303437339588359 : ℚ) / 50000000000000000)
              hi := ((-2389935545091811 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2036207975113447 : ℚ) / 2000000000000000000)
              hi := ((-3876881450103579 : ℚ) / 10000000000000000000) }
      im := { lo := ((212916656958047 : ℚ) / 125000000000000000)
              hi := ((2333929849013151 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7833192193568853 : ℚ) / 10000000000000000000)
              hi := ((2939782723867443 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2803830866115867 : ℚ) / 10000000000000000000)
              hi := ((1045405593463479 : ℚ) / 1000000000000000000) } }
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

def s086_t5_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2545788831827679 : ℚ) / 500000000000000000)
              hi := ((93633325451273 : ℚ) / 10000000000000000) }
      im := { lo := ((-661257013013531 : ℚ) / 10000000000000000)
              hi := ((-15475265330475621 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((899530754891417 : ℚ) / 125000000000000000)
              hi := ((2121934801463549 : ℚ) / 250000000000000000) }
      im := { lo := ((-12158420148029283 : ℚ) / 2000000000000000000)
              hi := ((-9581137145458567 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10152284807233849 : ℚ) / 10000000000000000000)
              hi := ((-1202636467969073 : ℚ) / 3125000000000000000) }
      im := { lo := ((4260875257491917 : ℚ) / 2500000000000000000)
              hi := ((46698354613997 : ℚ) / 20000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3916003210108951 : ℚ) / 5000000000000000000)
              hi := ((5880742590160799 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1401764683782869 : ℚ) / 5000000000000000000)
              hi := ((522696987261813 : ℚ) / 500000000000000000) } }
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

def s086_t5_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2549345626243103 : ℚ) / 500000000000000000)
              hi := ((9370376702432891 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3305596245154317 : ℚ) / 50000000000000000)
              hi := ((-30943704366317583 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1797243133889997 : ℚ) / 250000000000000000)
              hi := ((4240129989199231 : ℚ) / 500000000000000000) }
      im := { lo := ((-608966341432273 : ℚ) / 100000000000000000)
              hi := ((-96025120463087 : ℚ) / 20000000000000000) } }
  DrestRect :=
    { re := { lo := ((-101235161063743 : ℚ) / 100000000000000000)
              hi := ((-7639953991589579 : ℚ) / 20000000000000000000) }
      im := { lo := ((106585175900567 : ℚ) / 62500000000000000)
              hi := ((2335901651938907 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7830825544144059 : ℚ) / 10000000000000000000)
              hi := ((73524049789809 : ℚ) / 125000000000000000) }
      im := { lo := ((-7008057321574449 : ℚ) / 25000000000000000000)
              hi := ((2613454633166361 : ℚ) / 2500000000000000000) } }
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

def s086_t5_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5105821956764221 : ℚ) / 1000000000000000000)
              hi := ((4688719274954057 : ℚ) / 500000000000000000) }
      im := { lo := ((-660981593527131 : ℚ) / 10000000000000000)
              hi := ((-3867110538522379 : ℚ) / 62500000000000000) } }
  D0Rect :=
    { re := { lo := ((7181684720209173 : ℚ) / 1000000000000000000)
              hi := ((4236383289198721 : ℚ) / 500000000000000000) }
      im := { lo := ((-1525026603253379 : ℚ) / 250000000000000000)
              hi := ((-2405966892522513 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10094732265517037 : ℚ) / 10000000000000000000)
              hi := ((-7583008087394973 : ℚ) / 20000000000000000000) }
      im := { lo := ((8531857710205119 : ℚ) / 5000000000000000000)
              hi := ((23368814572195537 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-782964893330483 : ℚ) / 1000000000000000000)
              hi := ((2941554493059201 : ℚ) / 5000000000000000000) }
      im := { lo := ((-280291153082451 : ℚ) / 1000000000000000000)
              hi := ((5226846139537221 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2556485437187573 : ℚ) / 500000000000000000)
              hi := ((9384516874891773 : ℚ) / 1000000000000000000) }
      im := { lo := ((-413027529289319 : ℚ) / 6250000000000000)
              hi := ((-6186014095044607 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1793595704262131 : ℚ) / 250000000000000000)
              hi := ((4232629397209301 : ℚ) / 500000000000000000) }
      im := { lo := ((-12221078516822621 : ℚ) / 2000000000000000000)
              hi := ((-37676575330019 : ℚ) / 7812500000000000) } }
  DrestRect :=
    { re := { lo := ((-5032966708940327 : ℚ) / 5000000000000000000)
              hi := ((-7526035563929003 : ℚ) / 20000000000000000000) }
      im := { lo := ((3414752602127077 : ℚ) / 2000000000000000000)
              hi := ((23378571272908437 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3914234471849233 : ℚ) / 5000000000000000000)
              hi := ((588428996166133 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5605194334149633 : ℚ) / 20000000000000000000)
              hi := ((1306695372211233 : ℚ) / 1250000000000000000) } }
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

def s086_t5_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((512013763874009 : ℚ) / 100000000000000000)
              hi := ((9391612078841627 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1321413230279033 : ℚ) / 20000000000000000)
              hi := ((-1236930504317417 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((7167066857496227 : ℚ) / 1000000000000000000)
              hi := ((4228868310941049 : ℚ) / 500000000000000000) }
      im := { lo := ((-6120961718844849 : ℚ) / 1000000000000000000)
              hi := ((-24166298915568453 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1254639875631491 : ℚ) / 1250000000000000000)
              hi := ((-1493807555821117 : ℚ) / 4000000000000000000) }
      im := { lo := ((17083771385274131 : ℚ) / 10000000000000000000)
              hi := ((2338828610142467 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3913643698588513 : ℚ) / 5000000000000000000)
              hi := ((1471367182293667 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3502855340984727 : ℚ) / 12500000000000000000)
              hi := ((5226717533740957 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((80114391469617 : ℚ) / 15625000000000000)
              hi := ((9398725269082133 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6605693025146883 : ℚ) / 100000000000000000)
              hi := ((-1509592797363 : ℚ) / 24414062500000) } }
  D0Rect :=
    { re := { lo := ((8949670511594883 : ℚ) / 1250000000000000000)
              hi := ((8450200522939929 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6131374260596697 : ℚ) / 1000000000000000000)
              hi := ((-1210976925968467 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5004145687067071 : ℚ) / 5000000000000000000)
              hi := ((-3706005137136973 : ℚ) / 10000000000000000000) }
      im := { lo := ((8546869131246909 : ℚ) / 5000000000000000000)
              hi := ((11698980652328913 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3913054517106243 : ℚ) / 5000000000000000000)
              hi := ((1177330006740929 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2801970350252171 : ℚ) / 10000000000000000000)
              hi := ((2613326512170031 : ℚ) / 2500000000000000000) } }
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

def s086_t5_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5134522361650621 : ℚ) / 1000000000000000000)
              hi := ((9405855238704781 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3302160496065959 : ℚ) / 50000000000000000)
              hi := ((-3090966464152103 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7152391409522397 : ℚ) / 1000000000000000000)
              hi := ((8442650586736353 : ℚ) / 1000000000000000000) }
      im := { lo := ((-383861044607701 : ℚ) / 62500000000000000)
              hi := ((-4854545543529697 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4989725155460339 : ℚ) / 5000000000000000000)
              hi := ((-3677476842064207 : ℚ) / 10000000000000000000) }
      im := { lo := ((855183187252339 : ℚ) / 500000000000000000)
              hi := ((11703798375995943 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-391246342045143 : ℚ) / 500000000000000000)
              hi := ((5887826858797247 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28016515088958617 : ℚ) / 100000000000000000000)
              hi := ((10453172033189559 : ℚ) / 10000000000000000000) } }
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

def s086_t5_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5141741503944871 : ℚ) / 1000000000000000000)
              hi := ((9413002028857373 : ℚ) / 1000000000000000000) }
      im := { lo := ((-165073752854437 : ℚ) / 2500000000000000)
              hi := ((-3090287477942193 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((14290064185499933 : ℚ) / 2000000000000000000)
              hi := ((105438582508569 : ℚ) / 12500000000000000) }
      im := { lo := ((-615216928326369 : ℚ) / 100000000000000000)
              hi := ((-1216293260430899 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-199011920972669 : ℚ) / 200000000000000000)
              hi := ((-18244669492238573 : ℚ) / 50000000000000000000) }
      im := { lo := ((342270958361663 : ℚ) / 200000000000000000)
              hi := ((146357451751721 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7823740808347737 : ℚ) / 10000000000000000000)
              hi := ((294449959820299 : ℚ) / 500000000000000000) }
      im := { lo := ((-2801330972852889 : ℚ) / 10000000000000000000)
              hi := ((653314765381359 : ℚ) / 625000000000000000) } }
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

def s086_t5_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2574489159701699 : ℚ) / 500000000000000000)
              hi := ((9420165725466861 : ℚ) / 1000000000000000000) }
      im := { lo := ((-660158038677193 : ℚ) / 10000000000000000)
              hi := ((-1235843637609383 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((22305184328207 : ℚ) / 3125000000000000)
              hi := ((8427508072717919 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6162551316790693 : ℚ) / 1000000000000000000)
              hi := ((-1218947707088513 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1240215723525481 : ℚ) / 1250000000000000000)
              hi := ((-724075842368933 : ℚ) / 2000000000000000000) }
      im := { lo := ((4280848386849351 : ℚ) / 2500000000000000000)
              hi := ((585668628025853 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7822555268384411 : ℚ) / 10000000000000000000)
              hi := ((5890171381862227 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1120404755953311 : ℚ) / 4000000000000000000)
              hi := ((1306612729532687 : ℚ) / 1250000000000000000) } }
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

def s086_t5_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5156232864387171 : ℚ) / 1000000000000000000)
              hi := ((4713673145255447 : ℚ) / 500000000000000000) }
      im := { lo := ((-1320042361058773 : ℚ) / 20000000000000000)
              hi := ((-6177862629667989 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((445641997447467 : ℚ) / 62500000000000000)
              hi := ((8419915161663431 : ℚ) / 1000000000000000000) }
      im := { lo := ((-123458456531819 : ℚ) / 20000000000000000)
              hi := ((-4886398848106379 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9892839989881033 : ℚ) / 10000000000000000000)
              hi := ((-35918124507159467 : ℚ) / 100000000000000000000) }
      im := { lo := ((17133200144910377 : ℚ) / 10000000000000000000)
              hi := ((292953196497299 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1955342296919317 : ℚ) / 2500000000000000000)
              hi := ((5891342380221023 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1750433571027219 : ℚ) / 6250000000000000000)
              hi := ((10452768255819933 : ℚ) / 10000000000000000000) } }
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

def s086_t5_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5163505376886779 : ℚ) / 1000000000000000000)
              hi := ((188690869063741 : ℚ) / 20000000000000000) }
      im := { lo := ((-6598844383404967 : ℚ) / 100000000000000000)
              hi := ((-6176508279293243 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((14245742311389491 : ℚ) / 2000000000000000000)
              hi := ((1682461550220661 : ℚ) / 200000000000000000) }
      im := { lo := ((-772910482063213 : ℚ) / 125000000000000000)
              hi := ((-1958798805335131 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1972787724156883 : ℚ) / 2000000000000000000)
              hi := ((-8908084410380841 : ℚ) / 25000000000000000000) }
      im := { lo := ((8571483950128467 : ℚ) / 5000000000000000000)
              hi := ((4689144766563567 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7820181135884259 : ℚ) / 10000000000000000000)
              hi := ((5892510762568543 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14001886750911367 : ℚ) / 50000000000000000000)
              hi := ((418105456652531 : ℚ) / 400000000000000000) } }
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

def s086_t5_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((1292698862677889 : ℚ) / 250000000000000000)
              hi := ((188835151816911 : ℚ) / 20000000000000000) }
      im := { lo := ((-6597478067686201 : ℚ) / 100000000000000000)
              hi := ((-3087577593777077 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7115456353960377 : ℚ) / 1000000000000000000)
              hi := ((1680937215912719 : ℚ) / 200000000000000000) }
      im := { lo := ((-30968172447306073 : ℚ) / 5000000000000000000)
              hi := ((-4907585211376551 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2458755620201889 : ℚ) / 2500000000000000000)
              hi := ((-35346424384362043 : ℚ) / 100000000000000000000) }
      im := { lo := ((536021748522813 : ℚ) / 312500000000000000)
              hi := ((2345515028415611 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3909496953134371 : ℚ) / 5000000000000000000)
              hi := ((5893679323851367 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2800057316089981 : ℚ) / 10000000000000000000)
              hi := ((2613125207987427 : ℚ) / 2500000000000000000) } }
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

def s086_t5_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((12945257688072901 : ℚ) / 2500000000000000000)
              hi := ((4724494357928031 : ℚ) / 500000000000000000) }
      im := { lo := ((-3298056442144931 : ℚ) / 50000000000000000)
              hi := ((-6173803334249437 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3554013819801113 : ℚ) / 500000000000000000)
              hi := ((8397050097704667 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3101987522281907 : ℚ) / 500000000000000000)
              hi := ((-983632617782599 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2451523105139171 : ℚ) / 2500000000000000000)
              hi := ((-876509437078263 : ℚ) / 2500000000000000000) }
      im := { lo := ((1072648985430277 : ℚ) / 625000000000000000)
              hi := ((11732267794330037 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1563561423784709 : ℚ) / 2000000000000000000)
              hi := ((2947423841540893 : ℚ) / 5000000000000000000) }
      im := { lo := ((-5599467121990291 : ℚ) / 20000000000000000000)
              hi := ((5226180727271947 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2592714009340183 : ℚ) / 500000000000000000)
              hi := ((9456237015575743 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3220092281157 : ℚ) / 48828125000000)
              hi := ((-1234490512702671 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((28402340640287 : ℚ) / 4000000000000000)
              hi := ((1677879938074701 : ℚ) / 200000000000000000) }
      im := { lo := ((-6214306628030841 : ℚ) / 1000000000000000000)
              hi := ((-616091185512529 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9777151377601827 : ℚ) / 10000000000000000000)
              hi := ((-434677112767769 : ℚ) / 1250000000000000000) }
      im := { lo := ((4293007318117783 : ℚ) / 2500000000000000000)
              hi := ((1173694087586151 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7816618409014129 : ℚ) / 10000000000000000000)
              hi := ((5896013477399533 : ℚ) / 10000000000000000000) }
      im := { lo := ((-27994113002931313 : ℚ) / 100000000000000000000)
              hi := ((2090444699803901 : ℚ) / 2000000000000000000) } }
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

def s086_t5_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5192770605825591 : ℚ) / 1000000000000000000)
              hi := ((75708017141493 : ℚ) / 8000000000000000) }
      im := { lo := ((-6593386424858509 : ℚ) / 100000000000000000)
              hi := ((-771387856320833 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((7093128969486817 : ℚ) / 1000000000000000000)
              hi := ((4190867411447403 : ℚ) / 500000000000000000) }
      im := { lo := ((-4979702775039 : ℚ) / 800000000000000)
              hi := ((-987857029698877 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-487409859464757 : ℚ) / 500000000000000000)
              hi := ((-344878213877219 : ℚ) / 1000000000000000000) }
      im := { lo := ((17181634198710103 : ℚ) / 10000000000000000000)
              hi := ((587079675704147 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3907712747484019 : ℚ) / 5000000000000000000)
              hi := ((5897174426165591 : ℚ) / 10000000000000000000) }
      im := { lo := ((-279909762386309 : ℚ) / 1000000000000000000)
              hi := ((65325587877953 : ℚ) / 62500000000000000) } }
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

def s086_t5_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((520013107973183 : ℚ) / 100000000000000000)
              hi := ((2367695961572509 : ℚ) / 250000000000000000) }
      im := { lo := ((-3296012529432167 : ℚ) / 50000000000000000)
              hi := ((-308487715868267 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((7085658916347733 : ℚ) / 1000000000000000000)
              hi := ((8374055681369317 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3117470074149499 : ℚ) / 500000000000000000)
              hi := ((-989966089012483 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-151862956356011 : ℚ) / 156250000000000000)
              hi := ((-342013425812997 : ℚ) / 1000000000000000000) }
      im := { lo := ((4297799718969539 : ℚ) / 2500000000000000000)
              hi := ((23492451026639483 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3907114415971517 : ℚ) / 5000000000000000000)
              hi := ((73729137306037 : ℚ) / 125000000000000000) }
      im := { lo := ((-2798785912291331 : ℚ) / 10000000000000000000)
              hi := ((2090393303150263 : ℚ) / 2000000000000000000) } }
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

def s086_t5_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((10415018730111249 : ℚ) / 2000000000000000000)
              hi := ((29619006919963 : ℚ) / 3125000000000000) }
      im := { lo := ((-6590664827648121 : ℚ) / 100000000000000000)
              hi := ((-3084203515602853 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3539087430959689 : ℚ) / 500000000000000000)
              hi := ((4183181212665573 : ℚ) / 500000000000000000) }
      im := { lo := ((-6245241660568979 : ℚ) / 1000000000000000000)
              hi := ((-4960365356671313 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-193804956064663 : ℚ) / 200000000000000000)
              hi := ((-33914729698914897 : ℚ) / 100000000000000000000) }
      im := { lo := ((3440144573751551 : ℚ) / 2000000000000000000)
              hi := ((734427317552727 : ℚ) / 312500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-976628720841727 : ℚ) / 1250000000000000000)
              hi := ((1179896899634483 : ℚ) / 2000000000000000000) }
      im := { lo := ((-27984708697333663 : ℚ) / 100000000000000000000)
              hi := ((261295889226249 : ℚ) / 250000000000000000) } }
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

def s086_t5_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((1303725781980051 : ℚ) / 250000000000000000)
              hi := ((2371349858701887 : ℚ) / 250000000000000000) }
      im := { lo := ((-1647326474392443 : ℚ) / 25000000000000000)
              hi := ((-12334121687179421 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((3535338308866107 : ℚ) / 500000000000000000)
              hi := ((8358655270771223 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2502213134240093 : ℚ) / 400000000000000000)
              hi := ((-2485445005223851 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9661253055680543 : ℚ) / 10000000000000000000)
              hi := ((-1681399159152241 : ℚ) / 5000000000000000000) }
      im := { lo := ((2151275738420051 : ℚ) / 1250000000000000000)
              hi := ((11755428327929237 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-781184046115387 : ℚ) / 1000000000000000000)
              hi := ((147516178419317 : ℚ) / 250000000000000000) }
      im := { lo := ((-1119263820722579 : ℚ) / 4000000000000000000)
              hi := ((2612927071243673 : ℚ) / 2500000000000000000) } }
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

def s086_t5_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((10444628609010487 : ℚ) / 2000000000000000000)
              hi := ((4746366846991503 : ℚ) / 500000000000000000) }
      im := { lo := ((-6587948128541167 : ℚ) / 100000000000000000)
              hi := ((-6165715881417979 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3531582150571803 : ℚ) / 500000000000000000)
              hi := ((2087733533621433 : ℚ) / 250000000000000000) }
      im := { lo := ((-6265813713198389 : ℚ) / 1000000000000000000)
              hi := ((-622675541848941 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9632244965518081 : ℚ) / 10000000000000000000)
              hi := ((-16670552102589453 : ℚ) / 50000000000000000000) }
      im := { lo := ((1721964814218197 : ℚ) / 1000000000000000000)
              hi := ((4703999667959609 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-781065059601531 : ℚ) / 1000000000000000000)
              hi := ((1180361714703669 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2797846192402421 : ℚ) / 10000000000000000000)
              hi := ((1045157888847699 : ℚ) / 1000000000000000000) } }
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

def s086_t5_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((10459484662222903 : ℚ) / 2000000000000000000)
              hi := ((237502135400563 : ℚ) / 25000000000000000) }
      im := { lo := ((-823323956275223 : ℚ) / 12500000000000000)
              hi := ((-6164372034349263 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1411127582591003 : ℚ) / 200000000000000000)
              hi := ((8343199043398601 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3138042258068029 : ℚ) / 500000000000000000)
              hi := ((-1247977012807947 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9603224325345997 : ℚ) / 10000000000000000000)
              hi := ((-33054086223519393 : ℚ) / 100000000000000000000) }
      im := { lo := ((53840778034483 : ℚ) / 31250000000000000)
              hi := ((11764549872587027 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7809460764775309 : ℚ) / 10000000000000000000)
              hi := ((2951484704617009 : ℚ) / 5000000000000000000) }
      im := { lo := ((-6993842967541941 : ℚ) / 25000000000000000000)
              hi := ((5225726892112987 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5237188485048811 : ℚ) / 1000000000000000000)
              hi := ((9507453381002283 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3292618138548969 : ℚ) / 50000000000000000)
              hi := ((-12326058962052737 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((352404883973121 : ℚ) / 50000000000000000)
              hi := ((2083862448847083 : ℚ) / 250000000000000000) }
      im := { lo := ((-12572689777688769 : ℚ) / 2000000000000000000)
              hi := ((-5002401495079717 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9574189766034251 : ℚ) / 10000000000000000000)
              hi := ((-32766943784952497 : ℚ) / 100000000000000000000) }
      im := { lo := ((4309602428580563 : ℚ) / 2500000000000000000)
              hi := ((11769079770222587 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-976033421492757 : ℚ) / 1250000000000000000)
              hi := ((2952063022434763 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1748264978676089 : ℚ) / 6250000000000000000)
              hi := ((1045132439792749 : ℚ) / 1000000000000000000) } }
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

def s086_t5_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((262232630723619 : ℚ) / 50000000000000000)
              hi := ((9514837703628957 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6583882004026939 : ℚ) / 100000000000000000)
              hi := ((-30808441165264617 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((704054326433579 : ℚ) / 100000000000000000)
              hi := ((8327686755551877 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3148297265473057 : ℚ) / 500000000000000000)
              hi := ((-2506442459365047 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4772570663669817 : ℚ) / 5000000000000000000)
              hi := ((-1623983889793653 : ℚ) / 5000000000000000000) }
      im := { lo := ((17247729955816363 : ℚ) / 10000000000000000000)
              hi := ((11773589043540657 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-243970936303229 : ℚ) / 312500000000000000)
              hi := ((590527802625097 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2796906772579509 : ℚ) / 10000000000000000000)
              hi := ((10451190975048223 : ℚ) / 10000000000000000000) } }
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

def s086_t5_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5252134429745151 : ℚ) / 1000000000000000000)
              hi := ((1904447723118471 : ℚ) / 200000000000000000) }
      im := { lo := ((-6582528940285837 : ℚ) / 100000000000000000)
              hi := ((-96255440437941 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((351648763267783 : ℚ) / 50000000000000000)
              hi := ((2079977339101459 : ℚ) / 250000000000000000) }
      im := { lo := ((-3153416816156683 : ℚ) / 500000000000000000)
              hi := ((-2511679053556649 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4758039194650043 : ℚ) / 5000000000000000000)
              hi := ((-3219229548483213 : ℚ) / 10000000000000000000) }
      im := { lo := ((1725701087886819 : ℚ) / 1000000000000000000)
              hi := ((2944519273676803 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7805870959658481 : ℚ) / 10000000000000000000)
              hi := ((2953213890776633 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2796592272632489 : ℚ) / 10000000000000000000)
              hi := ((1045106018444957 : ℚ) / 1000000000000000000) } }
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

def s086_t5_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((1314908562053857 : ℚ) / 250000000000000000)
              hi := ((47648278768167 : ℚ) / 5000000000000000) }
      im := { lo := ((-411323561913011 : ℚ) / 6250000000000000)
              hi := ((-246360377691939 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((7025393571354097 : ℚ) / 1000000000000000000)
              hi := ((8312117734965957 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6317061979607153 : ℚ) / 1000000000000000000)
              hi := ((-50338212221639 : ℚ) / 10000000000000000) } }
  DrestRect :=
    { re := { lo := ((-948700075778891 : ℚ) / 1000000000000000000)
              hi := ((-31904800089827283 : ℚ) / 100000000000000000000) }
      im := { lo := ((2158281563000343 : ℚ) / 1250000000000000000)
              hi := ((1178254388099073 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3902334779206417 : ℚ) / 5000000000000000000)
              hi := ((738446813223727 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1398137524261383 : ℚ) / 5000000000000000000)
              hi := ((5225463303669643 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((658393784497863 : ℚ) / 125000000000000000)
              hi := ((4768545525202399 : ℚ) / 500000000000000000) }
      im := { lo := ((-6579826272234753 : ℚ) / 100000000000000000)
              hi := ((-3078835941908487 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((280711911268017 : ℚ) / 40000000000000000)
              hi := ((8304312322127529 : ℚ) / 1000000000000000000) }
      im := { lo := ((-12654561272876853 : ℚ) / 2000000000000000000)
              hi := ((-5044273172443301 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1182239045010921 : ℚ) / 1250000000000000000)
              hi := ((-3161715339283539 : ℚ) / 10000000000000000000) }
      im := { lo := ((17275451387716411 : ℚ) / 10000000000000000000)
              hi := ((2357398223169501 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-975434220185099 : ℚ) / 1250000000000000000)
              hi := ((118174523875939 : ℚ) / 200000000000000000) }
      im := { lo := ((-2795953152384683 : ℚ) / 10000000000000000000)
              hi := ((10450788297781289 : ℚ) / 10000000000000000000) } }
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

def s086_t5_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((2637341773471629 : ℚ) / 500000000000000000)
              hi := ((4772271648372433 : ℚ) / 500000000000000000) }
      im := { lo := ((-6578476858290279 : ℚ) / 100000000000000000)
              hi := ((-30781677213001773 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1402037628400471 : ℚ) / 200000000000000000)
              hi := ((8296492900585303 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1267498040881069 : ℚ) / 200000000000000000)
              hi := ((-5054713309049403 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9428814511132797 : ℚ) / 10000000000000000000)
              hi := ((-391616794084061 : ℚ) / 1250000000000000000) }
      im := { lo := ((540143963239331 : ℚ) / 312500000000000000)
              hi := ((5895709562553299 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-78022742863877 : ℚ) / 100000000000000000)
              hi := ((1477468393166111 : ℚ) / 2500000000000000000) }
      im := { lo := ((-349453917278239 : ℚ) / 1250000000000000000)
              hi := ((522532500506317 : ℚ) / 500000000000000000) } }
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

def s086_t5_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((105644684766287 : ℚ) / 20000000000000000)
              hi := ((2388003072807301 : ℚ) / 250000000000000000) }
      im := { lo := ((-3288564308784007 : ℚ) / 50000000000000000)
              hi := ((-6155000254311147 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((350128224982289 : ℚ) / 50000000000000000)
              hi := ((8288659647193233 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6347689218195549 : ℚ) / 1000000000000000000)
              hi := ((-2532571535937331 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9399703568879639 : ℚ) / 10000000000000000000)
              hi := ((-776035196112153 : ℚ) / 2500000000000000000) }
      im := { lo := ((4323430354388751 : ℚ) / 2500000000000000000)
              hi := ((1179582659607457 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3900536599196351 : ℚ) / 5000000000000000000)
              hi := ((5911018708670241 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2795307786912101 : ℚ) / 10000000000000000000)
              hi := ((326578435219089 : ℚ) / 312500000000000000) } }
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

def s086_t5_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((132245070673261 : ℚ) / 25000000000000000)
              hi := ((9559497599529619 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1315156304802893 : ℚ) / 20000000000000000)
              hi := ((-615366634951429 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((349746353181101 : ℚ) / 50000000000000000)
              hi := ((2070203096703999 : ℚ) / 250000000000000000) }
      im := { lo := ((-6357877992193727 : ℚ) / 1000000000000000000)
              hi := ((-20302248356681 : ℚ) / 4000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1874116031467583 : ℚ) / 2000000000000000000)
              hi := ((-384416770300737 : ℚ) / 1250000000000000000) }
      im := { lo := ((8651397472610893 : ℚ) / 5000000000000000000)
              hi := ((23600427216335647 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3899934253723351 : ℚ) / 5000000000000000000)
              hi := ((369509975544641 : ℚ) / 625000000000000000) }
      im := { lo := ((-6987449458778719 : ℚ) / 25000000000000000000)
              hi := ((2612591333431667 : ℚ) / 2500000000000000000) } }
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

def s086_t5_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5297387566003361 : ℚ) / 1000000000000000000)
              hi := ((4783500452978041 : ℚ) / 500000000000000000) }
      im := { lo := ((-410902226002467 : ℚ) / 6250000000000000)
              hi := ((-6152333690479183 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3493637848905813 : ℚ) / 500000000000000000)
              hi := ((8272951280604561 : ℚ) / 1000000000000000000) }
      im := { lo := ((-159201404478961 : ℚ) / 25000000000000000)
              hi := ((-5085970697976447 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9341443676200027 : ℚ) / 10000000000000000000)
              hi := ((-3808143950768167 : ℚ) / 12500000000000000000) }
      im := { lo := ((8655913860626059 : ℚ) / 5000000000000000000)
              hi := ((11804580008401603 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7798671553490009 : ℚ) / 10000000000000000000)
              hi := ((2956653807920557 : ℚ) / 5000000000000000000) }
      im := { lo := ((-13973239398678083 : ℚ) / 50000000000000000000)
              hi := ((10450216782483851 : ℚ) / 10000000000000000000) } }
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

def s086_t5_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((1326247427473427 : ℚ) / 250000000000000000)
              hi := ((1914904191216647 : ℚ) / 200000000000000000) }
      im := { lo := ((-1643272715618757 : ℚ) / 25000000000000000)
              hi := ((-2460400927487173 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((111673772427863 : ℚ) / 16000000000000000)
              hi := ((413253799005311 : ℚ) / 50000000000000000) }
      im := { lo := ((-398638963802317 : ℚ) / 62500000000000000)
              hi := ((-5096369198212777 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9312292514413577 : ℚ) / 10000000000000000000)
              hi := ((-1207074211877117 : ℚ) / 4000000000000000000) }
      im := { lo := ((8660410704562539 : ℚ) / 5000000000000000000)
              hi := ((2361784985277553 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7797476099799789 : ℚ) / 10000000000000000000)
              hi := ((5914456493006177 : ℚ) / 10000000000000000000) }
      im := { lo := ((-279431436266803 : ℚ) / 1000000000000000000)
              hi := ((5225033281985479 : ℚ) / 5000000000000000000) } }
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

def s086_t5_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7715721237 : ℚ) / 125000000000)
      ((-332570489 : ℚ) / 1000000000000)
      ((239343451 : ℚ) / 62500000000) where
  MRect :=
    { re := { lo := ((5312609949898277 : ℚ) / 1000000000000000000)
              hi := ((1916411418038711 : ℚ) / 200000000000000000) }
      im := { lo := ((-1642936815552357 : ℚ) / 25000000000000000)
              hi := ((-1229934444570093 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((6971932335031853 : ℚ) / 1000000000000000000)
              hi := ((8257186491382023 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3194190029929143 : ℚ) / 500000000000000000)
              hi := ((-10213514427017 : ℚ) / 2000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4641563854303363 : ℚ) / 5000000000000000000)
              hi := ((-7472110914553589 : ℚ) / 25000000000000000000) }
      im := { lo := ((3465955056449691 : ℚ) / 2000000000000000000)
              hi := ((4725299487485627 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3898138269835901 : ℚ) / 5000000000000000000)
              hi := ((295780031541023 : ℚ) / 500000000000000000) }
      im := { lo := ((-349247378787109 : ℚ) / 1250000000000000000)
              hi := ((10449914467706837 : ℚ) / 10000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t5) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t5).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t5).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t5).constants.restUpper) := by
  if h0 : i = .s086_t5_sb000 then
    exact s086_t5_sb000_certificateData
  else if h1 : i = .s086_t5_sb001 then
    exact s086_t5_sb001_certificateData
  else if h2 : i = .s086_t5_sb002 then
    exact s086_t5_sb002_certificateData
  else if h3 : i = .s086_t5_sb003 then
    exact s086_t5_sb003_certificateData
  else if h4 : i = .s086_t5_sb004 then
    exact s086_t5_sb004_certificateData
  else if h5 : i = .s086_t5_sb005 then
    exact s086_t5_sb005_certificateData
  else if h6 : i = .s086_t5_sb006 then
    exact s086_t5_sb006_certificateData
  else if h7 : i = .s086_t5_sb007 then
    exact s086_t5_sb007_certificateData
  else if h8 : i = .s086_t5_sb008 then
    exact s086_t5_sb008_certificateData
  else if h9 : i = .s086_t5_sb009 then
    exact s086_t5_sb009_certificateData
  else if h10 : i = .s086_t5_sb010 then
    exact s086_t5_sb010_certificateData
  else if h11 : i = .s086_t5_sb011 then
    exact s086_t5_sb011_certificateData
  else if h12 : i = .s086_t5_sb012 then
    exact s086_t5_sb012_certificateData
  else if h13 : i = .s086_t5_sb013 then
    exact s086_t5_sb013_certificateData
  else if h14 : i = .s086_t5_sb014 then
    exact s086_t5_sb014_certificateData
  else if h15 : i = .s086_t5_sb015 then
    exact s086_t5_sb015_certificateData
  else if h16 : i = .s086_t5_sb016 then
    exact s086_t5_sb016_certificateData
  else if h17 : i = .s086_t5_sb017 then
    exact s086_t5_sb017_certificateData
  else if h18 : i = .s086_t5_sb018 then
    exact s086_t5_sb018_certificateData
  else if h19 : i = .s086_t5_sb019 then
    exact s086_t5_sb019_certificateData
  else if h20 : i = .s086_t5_sb020 then
    exact s086_t5_sb020_certificateData
  else if h21 : i = .s086_t5_sb021 then
    exact s086_t5_sb021_certificateData
  else if h22 : i = .s086_t5_sb022 then
    exact s086_t5_sb022_certificateData
  else if h23 : i = .s086_t5_sb023 then
    exact s086_t5_sb023_certificateData
  else if h24 : i = .s086_t5_sb024 then
    exact s086_t5_sb024_certificateData
  else if h25 : i = .s086_t5_sb025 then
    exact s086_t5_sb025_certificateData
  else if h26 : i = .s086_t5_sb026 then
    exact s086_t5_sb026_certificateData
  else if h27 : i = .s086_t5_sb027 then
    exact s086_t5_sb027_certificateData
  else if h28 : i = .s086_t5_sb028 then
    exact s086_t5_sb028_certificateData
  else if h29 : i = .s086_t5_sb029 then
    exact s086_t5_sb029_certificateData
  else if h30 : i = .s086_t5_sb030 then
    exact s086_t5_sb030_certificateData
  else if h31 : i = .s086_t5_sb031 then
    exact s086_t5_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T5
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
