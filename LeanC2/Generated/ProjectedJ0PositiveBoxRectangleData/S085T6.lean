import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t6

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
namespace S085T6

open ProjectedJ0RectangleArithmetic

def s085_t6_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1026039920152693 : ℚ) / 250000000000000000)
              hi := ((434818913300649 : ℚ) / 50000000000000000) }
      im := { lo := ((-6509839016730679 : ℚ) / 100000000000000000)
              hi := ((-1211129816243803 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((15413189378880733 : ℚ) / 2000000000000000000)
              hi := ((909960527938401 : ℚ) / 100000000000000000) }
      im := { lo := ((-7202621332125507 : ℚ) / 1000000000000000000)
              hi := ((-2907029535195437 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5015823818687777 : ℚ) / 5000000000000000000)
              hi := ((-15713268268075333 : ℚ) / 50000000000000000000) }
      im := { lo := ((195760590836643 : ℚ) / 100000000000000000)
              hi := ((26468126463181753 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8265953267537191 : ℚ) / 10000000000000000000)
              hi := ((3196903524774167 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3166672332843243 : ℚ) / 10000000000000000000)
              hi := ((21506367768971 : ℚ) / 19531250000000000) } }
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

def s085_t6_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8225972971305633 : ℚ) / 2000000000000000000)
              hi := ((2176277874844697 : ℚ) / 250000000000000000) }
      im := { lo := ((-813545693785331 : ℚ) / 12500000000000000)
              hi := ((-605418963216041 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((7697881111568219 : ℚ) / 1000000000000000000)
              hi := ((1818132145252507 : ℚ) / 200000000000000000) }
      im := { lo := ((-3606908949991823 : ℚ) / 500000000000000000)
              hi := ((-5825510094863931 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4999421804027333 : ℚ) / 5000000000000000000)
              hi := ((-15551117808985167 : ℚ) / 50000000000000000000) }
      im := { lo := ((19585640870358623 : ℚ) / 10000000000000000000)
              hi := ((330966939427847 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8264744061425887 : ℚ) / 10000000000000000000)
              hi := ((1598734075797443 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6332756461161391 : ℚ) / 20000000000000000000)
              hi := ((2202219231366779 : ℚ) / 2000000000000000000) } }
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

def s085_t6_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4121831138080921 : ℚ) / 1000000000000000000)
              hi := ((8713863999910303 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1301378717498187 : ℚ) / 20000000000000000)
              hi := ((-6052731370639143 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1537830355397021 : ℚ) / 200000000000000000)
              hi := ((9081701422160263 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7225002445113379 : ℚ) / 1000000000000000000)
              hi := ((-5836949189982959 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-99660269186877 : ℚ) / 100000000000000000)
              hi := ((-3077779344003803 : ℚ) / 10000000000000000000) }
      im := { lo := ((783807014666847 : ℚ) / 400000000000000000)
              hi := ((2648653883015387 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4131767078293623 : ℚ) / 5000000000000000000)
              hi := ((6396064158959257 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6332188019084157 : ℚ) / 20000000000000000000)
              hi := ((5505470963456723 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4130695075353569 : ℚ) / 1000000000000000000)
              hi := ((872263431642279 : ℚ) / 100000000000000000) }
      im := { lo := ((-1301084579306483 : ℚ) / 20000000000000000)
              hi := ((-2420509807314373 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((3840203492597207 : ℚ) / 500000000000000000)
              hi := ((226818177089133 : ℚ) / 25000000000000000) }
      im := { lo := ((-7236175102983719 : ℚ) / 1000000000000000000)
              hi := ((-11696752347504221 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-993319745016587 : ℚ) / 1000000000000000000)
              hi := ((-30453212270493827 : ℚ) / 100000000000000000000) }
      im := { lo := ((61264571940331 : ℚ) / 31250000000000000)
              hi := ((13247838486248303 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2065579885623637 : ℚ) / 2500000000000000000)
              hi := ((99956040742973 : ℚ) / 156250000000000000) }
      im := { lo := ((-3165805612868883 : ℚ) / 10000000000000000000)
              hi := ((5505391771733881 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4139578515725387 : ℚ) / 1000000000000000000)
              hi := ((4365711103391013 : ℚ) / 500000000000000000) }
      im := { lo := ((-1625988365839679 : ℚ) / 25000000000000000)
              hi := ((-3024909548769697 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7671646908687593 : ℚ) / 1000000000000000000)
              hi := ((566483598220251 : ℚ) / 62500000000000000) }
      im := { lo := ((-14494671546001701 : ℚ) / 2000000000000000000)
              hi := ((-5859791105549961 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9900354711822397 : ℚ) / 10000000000000000000)
              hi := ((-3012849834240483 : ℚ) / 10000000000000000000) }
      im := { lo := ((7845641769549 : ℚ) / 4000000000000000)
              hi := ((5300953790703067 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8261099838960879 : ℚ) / 10000000000000000000)
              hi := ((6398303269460259 : ℚ) / 10000000000000000000) }
      im := { lo := ((-316551278619013 : ℚ) / 1000000000000000000)
              hi := ((2752655188886763 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4148480700401913 : ℚ) / 1000000000000000000)
              hi := ((68283034505987 : ℚ) / 7812500000000000) }
      im := { lo := ((-3251242735140251 : ℚ) / 50000000000000000)
              hi := ((-3024182464469587 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3831435837273643 : ℚ) / 500000000000000000)
              hi := ((9054732799523377 : ℚ) / 1000000000000000000) }
      im := { lo := ((-14516969311202067 : ℚ) / 2000000000000000000)
              hi := ((-1174238750822247 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9867499151593687 : ℚ) / 10000000000000000000)
              hi := ((-2980364848990517 : ℚ) / 10000000000000000000) }
      im := { lo := ((1962349941326429 : ℚ) / 1000000000000000000)
              hi := ((26513814926808327 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2064969197482607 : ℚ) / 2500000000000000000)
              hi := ((6399415888340281 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1582613072475507 : ℚ) / 5000000000000000000)
              hi := ((1376308022401511 : ℚ) / 1250000000000000000) } }
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

def s085_t6_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2078699928249339 : ℚ) / 500000000000000000)
              hi := ((874905464425159 : ℚ) / 100000000000000000) }
      im := { lo := ((-1300203833397073 : ℚ) / 20000000000000000)
              hi := ((-1209382354880411 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((19135203070718581 : ℚ) / 2500000000000000000)
              hi := ((180914256822231 : ℚ) / 20000000000000000) }
      im := { lo := ((-7269622489319879 : ℚ) / 1000000000000000000)
              hi := ((-735322916043047 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9834633126802217 : ℚ) / 10000000000000000000)
              hi := ((-2947864034823723 : ℚ) / 10000000000000000000) }
      im := { lo := ((1227052883924239 : ℚ) / 625000000000000000)
              hi := ((26522816661824467 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4129328285367431 : ℚ) / 5000000000000000000)
              hi := ((1600132660992663 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6329911190576129 : ℚ) / 20000000000000000000)
              hi := ((2752580931415791 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1041584535387349 : ℚ) / 250000000000000000)
              hi := ((8757898756482899 : ℚ) / 1000000000000000000) }
      im := { lo := ((-324977709820987 : ℚ) / 5000000000000000)
              hi := ((-1511364996787673 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((15290551526599229 : ℚ) / 2000000000000000000)
              hi := ((9036677548279647 : ℚ) / 1000000000000000000) }
      im := { lo := ((-455046823945661 : ℚ) / 62500000000000000)
              hi := ((-5893959882396813 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-196035122919559 : ℚ) / 200000000000000000)
              hi := ((-91104625987847 : ℚ) / 312500000000000000) }
      im := { lo := ((1964214524312921 : ℚ) / 1000000000000000000)
              hi := ((2653177351469673 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8257432525108381 : ℚ) / 10000000000000000000)
              hi := ((1600410219356367 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3164680310525451 : ℚ) / 10000000000000000000)
              hi := ((5505089282220333 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((167011847910679 : ℚ) / 40000000000000000)
              hi := ((1753352013680463 : ℚ) / 200000000000000000) }
      im := { lo := ((-812261308652319 : ℚ) / 12500000000000000)
              hi := ((-3022004831869813 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7636455425538361 : ℚ) / 1000000000000000000)
              hi := ((112845335045937 : ℚ) / 12500000000000000) }
      im := { lo := ((-1822965949859049 : ℚ) / 250000000000000000)
              hi := ((-5905324314332463 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9768865398920867 : ℚ) / 10000000000000000000)
              hi := ((-1441409885807099 : ℚ) / 5000000000000000000) }
      im := { lo := ((4912849754942311 : ℚ) / 2500000000000000000)
              hi := ((26540683139855917 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-412810170154227 : ℚ) / 500000000000000000)
              hi := ((6402745340819929 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3164399965468667 : ℚ) / 10000000000000000000)
              hi := ((1101002837315103 : ℚ) / 1000000000000000000) } }
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

def s085_t6_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((5230342733256087 : ℚ) / 1250000000000000000)
              hi := ((70205107014549 : ℚ) / 8000000000000000) }
      im := { lo := ((-324831398516003 : ℚ) / 5000000000000000)
              hi := ((-30212804108533293 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1525524077647143 : ℚ) / 200000000000000000)
              hi := ((901856046426239 : ℚ) / 100000000000000000) }
      im := { lo := ((-29211864238761 : ℚ) / 4000000000000000)
              hi := ((-73958460761029 : ℚ) / 12500000000000000) } }
  DrestRect :=
    { re := { lo := ((-9735959885084547 : ℚ) / 10000000000000000000)
              hi := ((-1425140191468867 : ℚ) / 5000000000000000000) }
      im := { lo := ((1966060844727679 : ℚ) / 1000000000000000000)
              hi := ((331869306505697 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8254969303312397 : ℚ) / 10000000000000000000)
              hi := ((400240258425541 : ℚ) / 625000000000000000) }
      im := { lo := ((-1582057647222683 : ℚ) / 5000000000000000000)
              hi := ((11009873886072747 : ℚ) / 10000000000000000000) } }
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

def s085_t6_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8386543213959121 : ℚ) / 2000000000000000000)
              hi := ((1756906842145019 : ℚ) / 200000000000000000) }
      im := { lo := ((-6495166743396981 : ℚ) / 100000000000000000)
              hi := ((-1208222684971123 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((7618770701341689 : ℚ) / 1000000000000000000)
              hi := ((4504739256487419 : ℚ) / 500000000000000000) }
      im := { lo := ((-3657028064750929 : ℚ) / 500000000000000000)
              hi := ((-2964008654662891 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9703040137418697 : ℚ) / 10000000000000000000)
              hi := ((-1408864735899779 : ℚ) / 5000000000000000000) }
      im := { lo := ((1966977319482759 : ℚ) / 1000000000000000000)
              hi := ((26558357939006753 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1650746626799327 : ℚ) / 2000000000000000000)
              hi := ((3202470082672397 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3163827075477249 : ℚ) / 10000000000000000000)
              hi := ((137621448547393 : ℚ) / 125000000000000000) } }
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

def s085_t6_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4202288287296293 : ℚ) / 1000000000000000000)
              hi := ((8793447616184473 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1298741358425449 : ℚ) / 20000000000000000)
              hi := ((-1207933493716453 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((3804953024057281 : ℚ) / 500000000000000000)
              hi := ((900038130680583 : ℚ) / 100000000000000000) }
      im := { lo := ((-7325133628135607 : ℚ) / 1000000000000000000)
              hi := ((-371209125498303 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-2417526477053513 : ℚ) / 2500000000000000000)
              hi := ((-139258370958327 : ℚ) / 500000000000000000) }
      im := { lo := ((61496540875899 : ℚ) / 31250000000000000)
              hi := ((2656712356627121 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8252494118824297 : ℚ) / 10000000000000000000)
              hi := ((3203016331259673 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31635370209245553 : ℚ) / 100000000000000000000)
              hi := ((550477803853009 : ℚ) / 500000000000000000) } }
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

def s085_t6_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8422642911052403 : ℚ) / 2000000000000000000)
              hi := ((4401190740561051 : ℚ) / 500000000000000000) }
      im := { lo := ((-3246124149648801 : ℚ) / 50000000000000000)
              hi := ((-30191113931192757 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7601026186855173 : ℚ) / 1000000000000000000)
              hi := ((8991269110113439 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7336198709817223 : ℚ) / 1000000000000000000)
              hi := ((-5950662760403317 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2409289571914659 : ℚ) / 2500000000000000000)
              hi := ((-1376296624427197 : ℚ) / 5000000000000000000) }
      im := { lo := ((3937593397730867 : ℚ) / 2000000000000000000)
              hi := ((1328792123224567 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1031408461278319 : ℚ) / 1250000000000000000)
              hi := ((1601784262931961 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3163250327393437 : ℚ) / 10000000000000000000)
              hi := ((2201879934081559 : ℚ) / 2000000000000000000) } }
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

def s085_t6_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1055093227506973 : ℚ) / 250000000000000000)
              hi := ((4405666936693621 : ℚ) / 500000000000000000) }
      im := { lo := ((-162269778331311 : ℚ) / 2500000000000000)
              hi := ((-943246796934239 : ℚ) / 15625000000000000) } }
  D0Rect :=
    { re := { lo := ((7592131265888289 : ℚ) / 1000000000000000000)
              hi := ((1122767726811489 : ℚ) / 125000000000000000) }
      im := { lo := ((-7347251463239169 : ℚ) / 1000000000000000000)
              hi := ((-14904918600512761 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4802098688177867 : ℚ) / 5000000000000000000)
              hi := ((-5440013999571503 : ℚ) / 20000000000000000000) }
      im := { lo := ((4924248760785299 : ℚ) / 2500000000000000000)
              hi := ((6646128622156541 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1650008710895529 : ℚ) / 2000000000000000000)
              hi := ((3204121523122257 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3162961453872301 : ℚ) / 10000000000000000000)
              hi := ((5504620558080039 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4229442646144029 : ℚ) / 1000000000000000000)
              hi := ((8820304765165177 : ℚ) / 1000000000000000000) }
      im := { lo := ((-81116691311507 : ℚ) / 1250000000000000)
              hi := ((-6035337609798749 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7583221671491097 : ℚ) / 1000000000000000000)
              hi := ((8972999063654967 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1839573115705961 : ℚ) / 250000000000000000)
              hi := ((-5973259417548533 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4785612080822089 : ℚ) / 5000000000000000000)
              hi := ((-671851957364541 : ℚ) / 2500000000000000000) }
      im := { lo := ((394119539617581 : ℚ) / 200000000000000000)
              hi := ((5318627966816751 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8248822945470291 : ℚ) / 10000000000000000000)
              hi := ((80116898517863 : ℚ) / 125000000000000000) }
      im := { lo := ((-7906669938195699 : ℚ) / 25000000000000000000)
              hi := ((2752269498213011 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4238530639612071 : ℚ) / 1000000000000000000)
              hi := ((2207323558166897 : ℚ) / 250000000000000000) }
      im := { lo := ((-3243940420834007 : ℚ) / 50000000000000000)
              hi := ((-1508474273154647 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7574297384716599 : ℚ) / 1000000000000000000)
              hi := ((8963840913147999 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3684660782029389 : ℚ) / 500000000000000000)
              hi := ((-239381552578099 : ℚ) / 40000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9538238403493781 : ℚ) / 10000000000000000000)
              hi := ((-6636990228067231 : ℚ) / 25000000000000000000) }
      im := { lo := ((9857456490872311 : ℚ) / 5000000000000000000)
              hi := ((26601718322615737 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2061901394980677 : ℚ) / 2500000000000000000)
              hi := ((1602615817491733 : ℚ) / 2500000000000000000) }
      im := { lo := ((-316237228293253 : ℚ) / 1000000000000000000)
              hi := ((172014260848047 : ℚ) / 156250000000000000) } }
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

def s085_t6_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((424763700496013 : ℚ) / 100000000000000000)
              hi := ((1104787755937701 : ℚ) / 125000000000000000) }
      im := { lo := ((-64864276910733 : ℚ) / 1000000000000000)
              hi := ((-6032458001481351 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7565358058596549 : ℚ) / 1000000000000000000)
              hi := ((1119333467499907 : ℚ) / 125000000000000000) }
      im := { lo := ((-922542260187593 : ℚ) / 125000000000000000)
              hi := ((-2997903135231573 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9505239062468457 : ℚ) / 10000000000000000000)
              hi := ((-13110864787592517 : ℚ) / 50000000000000000000) }
      im := { lo := ((986190170250443 : ℚ) / 500000000000000000)
              hi := ((2661024954577249 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8246390050783799 : ℚ) / 10000000000000000000)
              hi := ((6411575811127519 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7905185271126019 : ℚ) / 25000000000000000000)
              hi := ((5504372475250329 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((851352550803639 : ℚ) / 200000000000000000)
              hi := ((884732723218017 : ℚ) / 100000000000000000) }
      im := { lo := ((-3242487896999831 : ℚ) / 50000000000000000)
              hi := ((-3015510200213491 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((944550515598843 : ℚ) / 125000000000000000)
              hi := ((8945479146473093 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1847835469669153 : ℚ) / 250000000000000000)
              hi := ((-240282474862009 : ℚ) / 40000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9472225014332371 : ℚ) / 10000000000000000000)
              hi := ((-2589539698552317 : ℚ) / 10000000000000000000) }
      im := { lo := ((19732649635208007 : ℚ) / 10000000000000000000)
              hi := ((532374641319333 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2061293182709467 : ℚ) / 2500000000000000000)
              hi := ((1282537175014883 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3161772162600587 : ℚ) / 10000000000000000000)
              hi := ((688035842070041 : ℚ) / 625000000000000000) } }
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

def s085_t6_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((426590661075597 : ℚ) / 100000000000000000)
              hi := ((4428185513219487 : ℚ) / 500000000000000000) }
      im := { lo := ((-1620881317739331 : ℚ) / 25000000000000000)
              hi := ((-12059168370371301 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((94342941713359 : ℚ) / 12500000000000000)
              hi := ((2234068850533909 : ℚ) / 250000000000000000) }
      im := { lo := ((-7402332967837211 : ℚ) / 1000000000000000000)
              hi := ((-2407322233318733 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-943919691685733 : ℚ) / 1000000000000000000)
              hi := ((-511379149046209 : ℚ) / 2000000000000000000) }
      im := { lo := ((19741450884875333 : ℚ) / 10000000000000000000)
              hi := ((6656791663844949 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-32202964582269 : ℚ) / 39062500000000000)
              hi := ((6413798776471279 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1264588598792229 : ℚ) / 4000000000000000000)
              hi := ((5504201661404259 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4275068572274927 : ℚ) / 1000000000000000000)
              hi := ((2216358345699171 : ℚ) / 250000000000000000) }
      im := { lo := ((-3241038111823419 : ℚ) / 50000000000000000)
              hi := ((-7535186544782837 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((7538451304978213 : ℚ) / 1000000000000000000)
              hi := ((8927056959655741 : ℚ) / 1000000000000000000) }
      im := { lo := ((-14826622838714689 : ℚ) / 2000000000000000000)
              hi := ((-3014768636269393 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2351539015034961 : ℚ) / 2500000000000000000)
              hi := ((-1262120010426919 : ℚ) / 5000000000000000000) }
      im := { lo := ((158001645793867 : ℚ) / 80000000000000000)
              hi := ((13317777353406997 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1648548709800923 : ℚ) / 2000000000000000000)
              hi := ((6414909408233407 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3951474362341503 : ℚ) / 12500000000000000000)
              hi := ((11008241864298143 : ℚ) / 10000000000000000000) } }
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

def s085_t6_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4284249599176619 : ℚ) / 1000000000000000000)
              hi := ((1774902667255239 : ℚ) / 200000000000000000) }
      im := { lo := ((-64806285302297 : ℚ) / 1000000000000000)
              hi := ((-3013357841621937 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3764726353055417 : ℚ) / 500000000000000000)
              hi := ((445891157447419 : ℚ) / 50000000000000000) }
      im := { lo := ((-7424277352194671 : ℚ) / 1000000000000000000)
              hi := ((-6040756803393361 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9373101399536683 : ℚ) / 10000000000000000000)
              hi := ((-12457868115990493 : ℚ) / 50000000000000000000) }
      im := { lo := ((19758915778718667 : ℚ) / 10000000000000000000)
              hi := ((106575578269177 : ℚ) / 40000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4120762941079931 : ℚ) / 5000000000000000000)
              hi := ((6416017074437341 : ℚ) / 10000000000000000000) }
      im := { lo := ((-197555556952713 : ℚ) / 625000000000000000)
              hi := ((1100808187275421 : ℚ) / 1000000000000000000) } }
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

def s085_t6_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4293447607377041 : ℚ) / 1000000000000000000)
              hi := ((8883612914632443 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6479182539028899 : ℚ) / 100000000000000000)
              hi := ((-6025283215273459 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1504087719880617 : ℚ) / 200000000000000000)
              hi := ((2227143737712801 : ℚ) / 250000000000000000) }
      im := { lo := ((-7435231863517617 : ℚ) / 1000000000000000000)
              hi := ((-3025981508937977 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9340038259429641 : ℚ) / 10000000000000000000)
              hi := ((-24588913970776863 : ℚ) / 100000000000000000000) }
      im := { lo := ((1976757589632207 : ℚ) / 1000000000000000000)
              hi := ((533043826512673 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8240307336790977 : ℚ) / 10000000000000000000)
              hi := ((6417123181456859 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3160612591275829 : ℚ) / 10000000000000000000)
              hi := ((2751984049303007 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2151332118277777 : ℚ) / 500000000000000000)
              hi := ((34737228554603 : ℚ) / 3906250000000000) }
      im := { lo := ((-6477737912208607 : ℚ) / 100000000000000000)
              hi := ((-6023852135530027 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3755704826526829 : ℚ) / 500000000000000000)
              hi := ((278103491553741 : ℚ) / 31250000000000000) }
      im := { lo := ((-465385899366991 : ℚ) / 62500000000000000)
              hi := ((-1212631289951551 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1861392751692709 : ℚ) / 2000000000000000000)
              hi := ((-1213098169985059 : ℚ) / 5000000000000000000) }
      im := { lo := ((1977618908287557 : ℚ) / 1000000000000000000)
              hi := ((41656940560957 : ℚ) / 15625000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1029885916437269 : ℚ) / 1250000000000000000)
              hi := ((320911357289583 : ℚ) / 500000000000000000) }
      im := { lo := ((-3950417528273013 : ℚ) / 12500000000000000000)
              hi := ((5503894154559051 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4311900171108233 : ℚ) / 1000000000000000000)
              hi := ((222546634073627 : ℚ) / 25000000000000000) }
      im := { lo := ((-6476294618346921 : ℚ) / 100000000000000000)
              hi := ((-3011211248650377 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((60018929880057 : ℚ) / 8000000000000000)
              hi := ((8890033162761731 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7457104242624569 : ℚ) / 1000000000000000000)
              hi := ((-12148675495971619 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4636937671092249 : ℚ) / 5000000000000000000)
              hi := ((-11967455793430789 : ℚ) / 50000000000000000000) }
      im := { lo := ((3956951546106353 : ℚ) / 2000000000000000000)
              hi := ((2666864405724689 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2059465982490467 : ℚ) / 2500000000000000000)
              hi := ((200603969817217 : ℚ) / 312500000000000000) }
      im := { lo := ((-197503476916683 : ℚ) / 625000000000000000)
              hi := ((2751910161297393 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((864231116583097 : ℚ) / 200000000000000000)
              hi := ((8911017290881099 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6474852583469867 : ℚ) / 100000000000000000)
              hi := ((-1505248593324151 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1498661602089483 : ℚ) / 200000000000000000)
              hi := ((1776147919021993 : ℚ) / 200000000000000000) }
      im := { lo := ((-466751337420861 : ℚ) / 62500000000000000)
              hi := ((-2434202756233873 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4620386889289549 : ℚ) / 5000000000000000000)
              hi := ((-11803875904351063 : ℚ) / 50000000000000000000) }
      im := { lo := ((4948320209781289 : ℚ) / 2500000000000000000)
              hi := ((1333839927329617 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-257394865959381 : ℚ) / 312500000000000000)
              hi := ((6420421426227721 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1579886043896599 : ℚ) / 5000000000000000000)
              hi := ((275187196887611 : ℚ) / 250000000000000000) } }
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

def s085_t6_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2165215084250083 : ℚ) / 500000000000000000)
              hi := ((4460093283293799 : ℚ) / 500000000000000000) }
      im := { lo := ((-6473411950054957 : ℚ) / 100000000000000000)
              hi := ((-601956762973033 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((7484235213770191 : ℚ) / 1000000000000000000)
              hi := ((8871430839535451 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1495785198350057 : ℚ) / 200000000000000000)
              hi := ((-3048331855042171 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9207659120726991 : ℚ) / 10000000000000000000)
              hi := ((-5820121252908127 : ℚ) / 25000000000000000000) }
      im := { lo := ((1237609917829419 : ℚ) / 625000000000000000)
              hi := ((26684905145489077 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-257356330552601 : ℚ) / 312500000000000000)
              hi := ((6421510226397819 : ℚ) / 10000000000000000000) }
      im := { lo := ((-15797461800949673 : ℚ) / 50000000000000000000)
              hi := ((1100733897009461 : ℚ) / 1000000000000000000) } }
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

def s085_t6_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2169861758664117 : ℚ) / 500000000000000000)
              hi := ((446468678304783 : ℚ) / 50000000000000000) }
      im := { lo := ((-808996606042723 : ℚ) / 12500000000000000)
              hi := ((-6018142131876839 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((14950295859538821 : ℚ) / 2000000000000000000)
              hi := ((4431053427147901 : ℚ) / 500000000000000000) }
      im := { lo := ((-7489818345410663 : ℚ) / 1000000000000000000)
              hi := ((-6107807842313021 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9174532285718939 : ℚ) / 10000000000000000000)
              hi := ((-11476551756333113 : ℚ) / 50000000000000000000) }
      im := { lo := ((2476273838491179 : ℚ) / 1250000000000000000)
              hi := ((26692964392797227 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1646832877308681 : ℚ) / 2000000000000000000)
              hi := ((6422593291304091 : ℚ) / 10000000000000000000) }
      im := { lo := ((-15796117928988063 : ℚ) / 50000000000000000000)
              hi := ((5503600531358661 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((869807273173433 : ℚ) / 200000000000000000)
              hi := ((8938577542447427 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3235267505648271 : ℚ) / 50000000000000000)
              hi := ((-6016718161030503 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7466046032011097 : ℚ) / 1000000000000000000)
              hi := ((2213191947797471 : ℚ) / 250000000000000000) }
      im := { lo := ((-3750348939233699 : ℚ) / 500000000000000000)
              hi := ((-3059469906583701 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9141392065376867 : ℚ) / 10000000000000000000)
              hi := ((-226256207658223 : ℚ) / 1000000000000000000) }
      im := { lo := ((990928882593557 : ℚ) / 500000000000000000)
              hi := ((1335048773564659 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1646584357531309 : ℚ) / 2000000000000000000)
              hi := ((6423671271713541 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31589499728297267 : ℚ) / 100000000000000000000)
              hi := ((2751764591943669 : ℚ) / 2500000000000000000) } }
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

def s085_t6_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2179183800364889 : ℚ) / 500000000000000000)
              hi := ((8947799563892333 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6469098501826051 : ℚ) / 100000000000000000)
              hi := ((-1203059130737153 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((745692896975191 : ℚ) / 100000000000000000)
              hi := ((4421707114069663 : ℚ) / 500000000000000000) }
      im := { lo := ((-3755782481566681 : ℚ) / 500000000000000000)
              hi := ((-6130059231908863 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4554120393324221 : ℚ) / 5000000000000000000)
              hi := ((-2229801440709919 : ℚ) / 10000000000000000000) }
      im := { lo := ((158615336815899 : ℚ) / 80000000000000000)
              hi := ((5341788158587919 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-10289597556647 : ℚ) / 12500000000000000)
              hi := ((6424747434075907 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7896677807276571 : ℚ) / 25000000000000000000)
              hi := ((11006910486188127 : ℚ) / 10000000000000000000) } }
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

def s085_t6_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2183858912585479 : ℚ) / 500000000000000000)
              hi := ((2239259756719169 : ℚ) / 250000000000000000) }
      im := { lo := ((-3233831656525271 : ℚ) / 50000000000000000)
              hi := ((-240554984750229 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((7447797040537899 : ℚ) / 1000000000000000000)
              hi := ((8834045906191287 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3761209616043441 : ℚ) / 500000000000000000)
              hi := ((-3070583206697833 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9075076967766827 : ℚ) / 10000000000000000000)
              hi := ((-4394060165532331 : ℚ) / 20000000000000000000) }
      im := { lo := ((1983521054765637 : ℚ) / 1000000000000000000)
              hi := ((5343371763705227 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-823043065207393 : ℚ) / 1000000000000000000)
              hi := ((1285163854041599 : ℚ) / 2000000000000000000) }
      im := { lo := ((-631677987353217 : ℚ) / 2000000000000000000)
              hi := ((5503380158854037 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4377085828554767 : ℚ) / 1000000000000000000)
              hi := ((2241574262707683 : ℚ) / 250000000000000000) }
      im := { lo := ((-1616557390803493 : ℚ) / 25000000000000000)
              hi := ((-480996396151741 : ℚ) / 8000000000000000) } }
  D0Rect :=
    { re := { lo := ((1859662492743831 : ℚ) / 250000000000000000)
              hi := ((2206165786616361 : ℚ) / 250000000000000000) }
      im := { lo := ((-3013304292916609 : ℚ) / 400000000000000000)
              hi := ((-6152261269695643 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-452095075491119 : ℚ) / 500000000000000000)
              hi := ((-5410618149474603 : ℚ) / 25000000000000000000) }
      im := { lo := ((19843456991742617 : ℚ) / 10000000000000000000)
              hi := ((2672473052874971 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1645836800467597 : ℚ) / 2000000000000000000)
              hi := ((3213445589244961 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31581113294365217 : ℚ) / 100000000000000000000)
              hi := ((5503306391992853 : ℚ) / 5000000000000000000) } }
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

def s085_t6_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60270203289 : ℚ) / 1000000000000)
      ((-383708109 : ℚ) / 1000000000000)
      ((4170739301 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((548309006953603 : ℚ) / 125000000000000000)
              hi := ((4487786628161217 : ℚ) / 500000000000000000) }
      im := { lo := ((-6464797160402913 : ℚ) / 100000000000000000)
              hi := ((-15027591846796239 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((3714744220748309 : ℚ) / 500000000000000000)
              hi := ((2203816320774289 : ℚ) / 250000000000000000) }
      im := { lo := ((-603527188209921 : ℚ) / 80000000000000000)
              hi := ((-6163343386398923 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9008714164823299 : ℚ) / 10000000000000000000)
              hi := ((-10657266485715613 : ℚ) / 50000000000000000000) }
      im := { lo := ((496291436976511 : ℚ) / 250000000000000000)
              hi := ((26732554845286557 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1028492546738961 : ℚ) / 1250000000000000000)
              hi := ((1285593086625221 : ℚ) / 2000000000000000000) }
      im := { lo := ((-7894570271585481 : ℚ) / 25000000000000000000)
              hi := ((5503230344186949 : ℚ) / 5000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t6) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t6).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t6).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t6).constants.restUpper) := by
  if h0 : i = .s085_t6_sb000 then
    exact s085_t6_sb000_certificateData
  else if h1 : i = .s085_t6_sb001 then
    exact s085_t6_sb001_certificateData
  else if h2 : i = .s085_t6_sb002 then
    exact s085_t6_sb002_certificateData
  else if h3 : i = .s085_t6_sb003 then
    exact s085_t6_sb003_certificateData
  else if h4 : i = .s085_t6_sb004 then
    exact s085_t6_sb004_certificateData
  else if h5 : i = .s085_t6_sb005 then
    exact s085_t6_sb005_certificateData
  else if h6 : i = .s085_t6_sb006 then
    exact s085_t6_sb006_certificateData
  else if h7 : i = .s085_t6_sb007 then
    exact s085_t6_sb007_certificateData
  else if h8 : i = .s085_t6_sb008 then
    exact s085_t6_sb008_certificateData
  else if h9 : i = .s085_t6_sb009 then
    exact s085_t6_sb009_certificateData
  else if h10 : i = .s085_t6_sb010 then
    exact s085_t6_sb010_certificateData
  else if h11 : i = .s085_t6_sb011 then
    exact s085_t6_sb011_certificateData
  else if h12 : i = .s085_t6_sb012 then
    exact s085_t6_sb012_certificateData
  else if h13 : i = .s085_t6_sb013 then
    exact s085_t6_sb013_certificateData
  else if h14 : i = .s085_t6_sb014 then
    exact s085_t6_sb014_certificateData
  else if h15 : i = .s085_t6_sb015 then
    exact s085_t6_sb015_certificateData
  else if h16 : i = .s085_t6_sb016 then
    exact s085_t6_sb016_certificateData
  else if h17 : i = .s085_t6_sb017 then
    exact s085_t6_sb017_certificateData
  else if h18 : i = .s085_t6_sb018 then
    exact s085_t6_sb018_certificateData
  else if h19 : i = .s085_t6_sb019 then
    exact s085_t6_sb019_certificateData
  else if h20 : i = .s085_t6_sb020 then
    exact s085_t6_sb020_certificateData
  else if h21 : i = .s085_t6_sb021 then
    exact s085_t6_sb021_certificateData
  else if h22 : i = .s085_t6_sb022 then
    exact s085_t6_sb022_certificateData
  else if h23 : i = .s085_t6_sb023 then
    exact s085_t6_sb023_certificateData
  else if h24 : i = .s085_t6_sb024 then
    exact s085_t6_sb024_certificateData
  else if h25 : i = .s085_t6_sb025 then
    exact s085_t6_sb025_certificateData
  else if h26 : i = .s085_t6_sb026 then
    exact s085_t6_sb026_certificateData
  else if h27 : i = .s085_t6_sb027 then
    exact s085_t6_sb027_certificateData
  else if h28 : i = .s085_t6_sb028 then
    exact s085_t6_sb028_certificateData
  else if h29 : i = .s085_t6_sb029 then
    exact s085_t6_sb029_certificateData
  else if h30 : i = .s085_t6_sb030 then
    exact s085_t6_sb030_certificateData
  else if h31 : i = .s085_t6_sb031 then
    exact s085_t6_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T6
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
