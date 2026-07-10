import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t5

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
namespace S085T5

open ProjectedJ0RectangleArithmetic

def s085_t5_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2354154503090693 : ℚ) / 625000000000000000)
              hi := ((8362221902982641 : ℚ) / 1000000000000000000) }
      im := { lo := ((-821230894500399 : ℚ) / 12500000000000000)
              hi := ((-15287766412533139 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((402126337839163 : ℚ) / 50000000000000000)
              hi := ((472230229572613 : ℚ) / 50000000000000000) }
      im := { lo := ((-6745145834284483 : ℚ) / 1000000000000000000)
              hi := ((-1336616317332041 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11331635639209839 : ℚ) / 10000000000000000000)
              hi := ((-11071392841625751 : ℚ) / 25000000000000000000) }
      im := { lo := ((4788903767765481 : ℚ) / 2500000000000000000)
              hi := ((13030450502823903 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8313798396429749 : ℚ) / 10000000000000000000)
              hi := ((1586882608602123 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1589374038465869 : ℚ) / 5000000000000000000)
              hi := ((5509072593455687 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((37747123896280477 : ℚ) / 10000000000000000000)
              hi := ((837021125476819 : ℚ) / 100000000000000000) }
      im := { lo := ((-821040289484687 : ℚ) / 12500000000000000)
              hi := ((-1222718957112131 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((8034433157745631 : ℚ) / 1000000000000000000)
              hi := ((9436286923513719 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6756804855841819 : ℚ) / 1000000000000000000)
              hi := ((-66979722622151 : ℚ) / 12500000000000000) } }
  DrestRect :=
    { re := { lo := ((-5649718951951597 : ℚ) / 5000000000000000000)
              hi := ((-43966994229617187 : ℚ) / 100000000000000000000) }
      im := { lo := ((479175222916277 : ℚ) / 250000000000000000)
              hi := ((26071977458545373 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4156304896361901 : ℚ) / 5000000000000000000)
              hi := ((793588621432601 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3178463277727641 : ℚ) / 10000000000000000000)
              hi := ((1101799024836373 : ℚ) / 1000000000000000000) } }
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

def s085_t5_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1182123672654217 : ℚ) / 312500000000000000)
              hi := ((1675644090829153 : ℚ) / 200000000000000000) }
      im := { lo := ((-1641699672799203 : ℚ) / 25000000000000000)
              hi := ((-3820052685737969 : ℚ) / 62500000000000000) } }
  D0Rect :=
    { re := { lo := ((4013161641622331 : ℚ) / 500000000000000000)
              hi := ((9427953738473273 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6768452802297529 : ℚ) / 1000000000000000000)
              hi := ((-2685139581274183 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5633612456682989 : ℚ) / 5000000000000000000)
              hi := ((-682003896308461 : ℚ) / 1562500000000000000) }
      im := { lo := ((19178356434081433 : ℚ) / 10000000000000000000)
              hi := ((2608300958307629 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4155713287097749 : ℚ) / 5000000000000000000)
              hi := ((6349892165494201 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6356346221154097 : ℚ) / 20000000000000000000)
              hi := ((2754457481024573 : ℚ) / 2500000000000000000) } }
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

def s085_t5_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((37908978739803873 : ℚ) / 10000000000000000000)
              hi := ((8386249052318473 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6565276235712417 : ℚ) / 100000000000000000)
              hi := ((-12221150305296831 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((160363949246469 : ℚ) / 20000000000000000)
              hi := ((9419604770206097 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6780089230797701 : ℚ) / 1000000000000000000)
              hi := ((-2691084854058651 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5617497495269807 : ℚ) / 5000000000000000000)
              hi := ((-43329355679047203 : ℚ) / 100000000000000000000) }
      im := { lo := ((19189659313289583 : ℚ) / 10000000000000000000)
              hi := ((26093995651610947 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8310248025326201 : ℚ) / 10000000000000000000)
              hi := ((6351079291316123 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6355755106817781 : ℚ) / 20000000000000000000)
              hi := ((1101766419273287 : ℚ) / 1000000000000000000) } }
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

def s085_t5_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1899509972009321 : ℚ) / 500000000000000000)
              hi := ((8394295734695223 : ℚ) / 1000000000000000000) }
      im := { lo := ((-262550198138311 : ℚ) / 4000000000000000)
              hi := ((-3054533674710049 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((250314248217623 : ℚ) / 31250000000000000)
              hi := ((9411239784722119 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3395857174015529 : ℚ) / 500000000000000000)
              hi := ((-1348512302176311 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1120274828076299 : ℚ) / 1000000000000000000)
              hi := ((-4301031255143499 : ℚ) / 10000000000000000000) }
      im := { lo := ((9600458864027451 : ℚ) / 5000000000000000000)
              hi := ((26104935444558617 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8309065866756941 : ℚ) / 10000000000000000000)
              hi := ((1270452415410557 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3177578784866131 : ℚ) / 10000000000000000000)
              hi := ((11017495233208027 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((38071615660306827 : ℚ) / 10000000000000000000)
              hi := ((1680472187161117 : ℚ) / 200000000000000000) }
      im := { lo := ((-6562234910964293 : ℚ) / 100000000000000000)
              hi := ((-190861275967877 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((4000949379748057 : ℚ) / 500000000000000000)
              hi := ((4701429388809679 : ℚ) / 500000000000000000) }
      im := { lo := ((-212603996856303 : ℚ) / 31250000000000000)
              hi := ((-5405917870726541 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-446819366672363 : ℚ) / 400000000000000000)
              hi := ((-21345563751094953 : ℚ) / 50000000000000000000) }
      im := { lo := ((19212132197585527 : ℚ) / 10000000000000000000)
              hi := ((13057914193636913 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-519242628585297 : ℚ) / 625000000000000000)
              hi := ((6353442478783263 : ℚ) / 10000000000000000000) }
      im := { lo := ((-124112564502361 : ℚ) / 390625000000000000)
              hi := ((11017327895808471 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3815321442408839 : ℚ) / 1000000000000000000)
              hi := ((1051305732142981 : ℚ) / 125000000000000000) }
      im := { lo := ((-1640179038522549 : ℚ) / 25000000000000000)
              hi := ((-12212111099283 : ℚ) / 200000000000000) } }
  D0Rect :=
    { re := { lo := ((199843136070073 : ℚ) / 25000000000000000)
              hi := ((939446225131253 : ℚ) / 100000000000000000) }
      im := { lo := ((-85186630005907 : ℚ) / 12500000000000000)
              hi := ((-10835550273631707 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2227641049828337 : ℚ) / 2000000000000000000)
              hi := ((-4237177584572437 : ℚ) / 10000000000000000000) }
      im := { lo := ((9611650100180909 : ℚ) / 5000000000000000000)
              hi := ((13063338481047583 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8306701719721471 : ℚ) / 10000000000000000000)
              hi := ((3177312812084759 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31769834303571 : ℚ) / 100000000000000000)
              hi := ((5508579727975173 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((9558752294098943 : ℚ) / 2500000000000000000)
              hi := ((32884957778379 : ℚ) / 3906250000000000) }
      im := { lo := ((-262367943038609 : ℚ) / 4000000000000000)
              hi := ((-12209103238371119 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((7985535922810781 : ℚ) / 1000000000000000000)
              hi := ((1173256288145467 : ℚ) / 125000000000000000) }
      im := { lo := ((-6826521661739407 : ℚ) / 1000000000000000000)
              hi := ((-2714810581005583 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1110591128585683 : ℚ) / 1000000000000000000)
              hi := ((-4205226115586663 : ℚ) / 10000000000000000000) }
      im := { lo := ((1202151365729011 : ℚ) / 625000000000000000)
              hi := ((6534370255630149 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-830551727749041 : ℚ) / 1000000000000000000)
              hi := ((3177901967016563 : ℚ) / 5000000000000000000) }
      im := { lo := ((-794169965930659 : ℚ) / 2500000000000000000)
              hi := ((11016985657950013 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((38316999288288997 : ℚ) / 10000000000000000000)
              hi := ((4213335491736297 : ℚ) / 500000000000000000) }
      im := { lo := ((-819710280413387 : ℚ) / 12500000000000000)
              hi := ((-6103048978637993 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((498583153358601 : ℚ) / 62500000000000000)
              hi := ((2344405677349563 : ℚ) / 250000000000000000) }
      im := { lo := ((-1709525475194419 : ℚ) / 250000000000000000)
              hi := ((-5441455667158923 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5536801262269647 : ℚ) / 5000000000000000000)
              hi := ((-20866291190821897 : ℚ) / 50000000000000000000) }
      im := { lo := ((19245497252007593 : ℚ) / 10000000000000000000)
              hi := ((1307412019037077 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2076082180718451 : ℚ) / 2500000000000000000)
              hi := ((1271395480302079 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1588187223652253 : ℚ) / 5000000000000000000)
              hi := ((11016809998792517 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1919959152415159 : ℚ) / 500000000000000000)
              hi := ((8434811322314249 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6556167150818921 : ℚ) / 100000000000000000)
              hi := ((-12203095272757837 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((7969109613679463 : ℚ) / 1000000000000000000)
              hi := ((9369178923816349 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6849670404531243 : ℚ) / 1000000000000000000)
              hi := ((-1363319835043401 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-552063793711547 : ℚ) / 500000000000000000)
              hi := ((-1035319290642987 : ℚ) / 2500000000000000000) }
      im := { lo := ((1925652945791793 : ℚ) / 1000000000000000000)
              hi := ((26158951977152817 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8303140773307791 : ℚ) / 10000000000000000000)
              hi := ((1589537686985399 : ℚ) / 2500000000000000000) }
      im := { lo := ((-31760705996212947 : ℚ) / 100000000000000000000)
              hi := ((1101663589818599 : ℚ) / 1000000000000000000) } }
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

def s085_t5_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((38481561009316447 : ℚ) / 10000000000000000000)
              hi := ((2110742543118121 : ℚ) / 250000000000000000) }
      im := { lo := ((-6554653294318943 : ℚ) / 100000000000000000)
              hi := ((-15250118992332251 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((398043663082631 : ℚ) / 50000000000000000)
              hi := ((58504494528863 : ℚ) / 6250000000000000) }
      im := { lo := ((-3430613593719009 : ℚ) / 500000000000000000)
              hi := ((-5465092118696147 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11008931852184507 : ℚ) / 10000000000000000000)
              hi := ((-4109282515565599 : ℚ) / 10000000000000000000) }
      im := { lo := ((4816879480261821 : ℚ) / 2500000000000000000)
              hi := ((2616961631236913 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-332078092586241 : ℚ) / 400000000000000000)
              hi := ((317966142868741 : ℚ) / 500000000000000000) }
      im := { lo := ((-6351535522843829 : ℚ) / 20000000000000000000)
              hi := ((11016462795162547 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((38564135812294647 : ℚ) / 10000000000000000000)
              hi := ((4225573616975731 : ℚ) / 500000000000000000) }
      im := { lo := ((-3276570344313441 : ℚ) / 50000000000000000)
              hi := ((-3049274429418759 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((994077694194313 : ℚ) / 125000000000000000)
              hi := ((4676121591411381 : ℚ) / 500000000000000000) }
      im := { lo := ((-1718193074511787 : ℚ) / 250000000000000000)
              hi := ((-1095378781080451 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5488285211149393 : ℚ) / 5000000000000000000)
              hi := ((-509659307920599 : ℚ) / 1250000000000000000) }
      im := { lo := ((19278462853806397 : ℚ) / 10000000000000000000)
              hi := ((654505827836783 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8300761761082167 : ℚ) / 10000000000000000000)
              hi := ((1590123036393371 : ℚ) / 2500000000000000000) }
      im := { lo := ((-31754669254626907 : ℚ) / 100000000000000000000)
              hi := ((11016291688590693 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1932345153859731 : ℚ) / 500000000000000000)
              hi := ((1057417864230471 : ℚ) / 125000000000000000) }
      im := { lo := ((-6551629275721181 : ℚ) / 100000000000000000)
              hi := ((-12194102954239859 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((62065267555961 : ℚ) / 7812500000000000)
              hi := ((583984460039323 : ℚ) / 62500000000000000) }
      im := { lo := ((-6884305828985453 : ℚ) / 1000000000000000000)
              hi := ((-5488684574507009 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-437767699051707 : ℚ) / 400000000000000000)
              hi := ((-2022626105440763 : ℚ) / 5000000000000000000) }
      im := { lo := ((3857872659605203 : ℚ) / 2000000000000000000)
              hi := ((6547700824398743 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4149786060792859 : ℚ) / 5000000000000000000)
              hi := ((795207702922973 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3968952639538753 : ℚ) / 12500000000000000000)
              hi := ((550805829783 : ℚ) / 500000000000000) } }
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

def s085_t5_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3872986272615639 : ℚ) / 1000000000000000000)
              hi := ((846755722123379 : ℚ) / 100000000000000000) }
      im := { lo := ((-3275059541720199 : ℚ) / 50000000000000000)
              hi := ((-30477777152382403 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1984017859682333 : ℚ) / 250000000000000000)
              hi := ((4667621801076799 : ℚ) / 500000000000000000) }
      im := { lo := ((-13791656244443463 : ℚ) / 2000000000000000000)
              hi := ((-17601483987003 : ℚ) / 3200000000000000) } }
  DrestRect :=
    { re := { lo := ((-17049685829841 : ℚ) / 15625000000000000)
              hi := ((-4013214981384441 : ℚ) / 10000000000000000000) }
      im := { lo := ((9650109342062901 : ℚ) / 5000000000000000000)
              hi := ((2620132741111893 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4149191490066941 : ℚ) / 5000000000000000000)
              hi := ((3181415436790199 : ℚ) / 5000000000000000000) }
      im := { lo := ((-793713315067629 : ℚ) / 2500000000000000000)
              hi := ((11015937459134379 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((38813012222696573 : ℚ) / 10000000000000000000)
              hi := ((1059473795202309 : ℚ) / 125000000000000000) }
      im := { lo := ((-818576285392723 : ℚ) / 12500000000000000)
              hi := ((-7617575688301033 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((3963886644396273 : ℚ) / 500000000000000000)
              hi := ((2331679945718103 : ℚ) / 250000000000000000) }
      im := { lo := ((-6907340363637279 : ℚ) / 1000000000000000000)
              hi := ((-689028771482887 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1359924121112889 : ℚ) / 1250000000000000000)
              hi := ((-3981159756103663 : ℚ) / 10000000000000000000) }
      im := { lo := ((965551338854941 : ℚ) / 500000000000000000)
              hi := ((26211807616446053 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2074297947024779 : ℚ) / 2500000000000000000)
              hi := ((6363997349719229 : ℚ) / 10000000000000000000) }
      im := { lo := ((-793636515921223 : ℚ) / 2500000000000000000)
              hi := ((11015759970775187 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3889635506557879 : ℚ) / 1000000000000000000)
              hi := ((848404196043619 : ℚ) / 100000000000000000) }
      im := { lo := ((-6547102911712463 : ℚ) / 100000000000000000)
              hi := ((-1523141702838097 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((989932482136371 : ℚ) / 125000000000000000)
              hi := ((465908993237219 : ℚ) / 50000000000000000) }
      im := { lo := ((-6918841736548459 : ℚ) / 1000000000000000000)
              hi := ((-1380996161811451 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-433878891065543 : ℚ) / 400000000000000000)
              hi := ((-1974544466709 : ℚ) / 5000000000000000) }
      im := { lo := ((4830447356734523 : ℚ) / 2500000000000000000)
              hi := ((2622224204576293 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2073999020777623 : ℚ) / 2500000000000000000)
              hi := ((6365158590473599 : ℚ) / 10000000000000000000) }
      im := { lo := ((-49597625853793 : ℚ) / 156250000000000000)
              hi := ((11015591669102797 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3897989385360509 : ℚ) / 1000000000000000000)
              hi := ((8492311749402763 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6545596835440513 : ℚ) / 100000000000000000)
              hi := ((-12182148687354051 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((988891372105303 : ℚ) / 125000000000000000)
              hi := ((2327406013272393 : ℚ) / 250000000000000000) }
      im := { lo := ((-6930331782761617 : ℚ) / 1000000000000000000)
              hi := ((-1107145513664109 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10814536141818157 : ℚ) / 10000000000000000000)
              hi := ((-39170033949333067 : ℚ) / 100000000000000000000) }
      im := { lo := ((9666253495937343 : ℚ) / 5000000000000000000)
              hi := ((81976969601033 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8294796364775293 : ℚ) / 10000000000000000000)
              hi := ((795789386920319 : ℚ) / 1250000000000000000) }
      im := { lo := ((-99186004509033 : ℚ) / 312500000000000000)
              hi := ((11015425461112093 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3906362775197683 : ℚ) / 1000000000000000000)
              hi := ((66410936136643 : ℚ) / 7812500000000000) }
      im := { lo := ((-409005748934057 : ℚ) / 6250000000000000)
              hi := ((-1522395805055803 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7902786493939353 : ℚ) / 1000000000000000000)
              hi := ((1162631565651871 : ℚ) / 125000000000000000) }
      im := { lo := ((-694181049362201 : ℚ) / 100000000000000000)
              hi := ((-5547458918017979 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-539104248838847 : ℚ) / 500000000000000000)
              hi := ((-19424514105400163 : ℚ) / 50000000000000000000) }
      im := { lo := ((9671589493985399 : ℚ) / 5000000000000000000)
              hi := ((26242972756962517 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8293594090771833 : ℚ) / 10000000000000000000)
              hi := ((6367468320984281 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1586826305820053 : ℚ) / 5000000000000000000)
              hi := ((5507627812912149 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((391475314934403 : ℚ) / 100000000000000000)
              hi := ((2127227139199357 : ℚ) / 250000000000000000) }
      im := { lo := ((-1308517707001551 : ℚ) / 20000000000000000)
              hi := ((-3805058299783351 : ℚ) / 62500000000000000) } }
  D0Rect :=
    { re := { lo := ((789442620074679 : ℚ) / 100000000000000000)
              hi := ((1161558189932393 : ℚ) / 125000000000000000) }
      im := { lo := ((-1390655537211451 : ℚ) / 200000000000000000)
              hi := ((-11118357663288057 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5374809439911109 : ℚ) / 5000000000000000000)
              hi := ((-19263936246918673 : ℚ) / 50000000000000000000) }
      im := { lo := ((19353805104022383 : ℚ) / 10000000000000000000)
              hi := ((1312663487887709 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8292402387819617 : ℚ) / 10000000000000000000)
              hi := ((1592157850667111 : ℚ) / 2500000000000000000) }
      im := { lo := ((-15866785530480927 : ℚ) / 50000000000000000000)
              hi := ((11015089822627871 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3923162608645279 : ℚ) / 1000000000000000000)
              hi := ((851723597554217 : ℚ) / 100000000000000000) }
      im := { lo := ((-1635271584870593 : ℚ) / 25000000000000000)
              hi := ((-6086604659900663 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((985756278924699 : ℚ) / 125000000000000000)
              hi := ((9283862939701971 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3482366702226553 : ℚ) / 500000000000000000)
              hi := ((-1392721807347269 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5358568922715169 : ℚ) / 5000000000000000000)
              hi := ((-7641313636032877 : ℚ) / 20000000000000000000) }
      im := { lo := ((4841096379745679 : ℚ) / 2500000000000000000)
              hi := ((26263521074532297 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4145605048948649 : ℚ) / 5000000000000000000)
              hi := ((1592448293478967 : ℚ) / 2500000000000000000) }
      im := { lo := ((-7932648429900901 : ℚ) / 25000000000000000000)
              hi := ((5507460892923583 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3931590533515429 : ℚ) / 1000000000000000000)
              hi := ((2131395637299389 : ℚ) / 250000000000000000) }
      im := { lo := ((-6539585536990507 : ℚ) / 100000000000000000)
              hi := ((-30425586206745573 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7877658590768477 : ℚ) / 1000000000000000000)
              hi := ((231881120299789 : ℚ) / 25000000000000000) }
      im := { lo := ((-697617789046347 : ℚ) / 100000000000000000)
              hi := ((-11165167615260747 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2136928547560089 : ℚ) / 2000000000000000000)
              hi := ((-18942554088418237 : ℚ) / 50000000000000000000) }
      im := { lo := ((484372989547481 : ℚ) / 250000000000000000)
              hi := ((5254745455881729 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4145008963031571 : ℚ) / 5000000000000000000)
              hi := ((6370954348031469 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31727663309222493 : ℚ) / 100000000000000000000)
              hi := ((5507379223678847 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3940038316114483 : ℚ) / 1000000000000000000)
              hi := ((4266973474149143 : ℚ) / 500000000000000000) }
      im := { lo := ((-6538085926433163 : ℚ) / 100000000000000000)
              hi := ((-6083631217783187 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7869251524948103 : ℚ) / 1000000000000000000)
              hi := ((1853322183438403 : ℚ) / 200000000000000000) }
      im := { lo := ((-873451344579263 : ℚ) / 125000000000000000)
              hi := ((-5594268931156171 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10652132054956287 : ℚ) / 10000000000000000000)
              hi := ((-7512701692594983 : ℚ) / 20000000000000000000) }
      im := { lo := ((19385408741003623 : ℚ) / 10000000000000000000)
              hi := ((6570971727878033 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4144410971593659 : ℚ) / 5000000000000000000)
              hi := ((6372110991874171 : ℚ) / 10000000000000000000) }
      im := { lo := ((-317246871172881 : ℚ) / 1000000000000000000)
              hi := ((1101459053085081 : ℚ) / 1000000000000000000) } }
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

def s085_t5_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((3948505793205673 : ℚ) / 1000000000000000000)
              hi := ((8542329295644191 : ℚ) / 1000000000000000000) }
      im := { lo := ((-261463500078481 : ℚ) / 4000000000000000)
              hi := ((-95033540657639 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((7860828667585909 : ℚ) / 1000000000000000000)
              hi := ((4628980826848461 : ℚ) / 500000000000000000) }
      im := { lo := ((-874878958954849 : ℚ) / 125000000000000000)
              hi := ((-2802971438953063 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5309802915598983 : ℚ) / 5000000000000000000)
              hi := ((-9310442538549359 : ℚ) / 25000000000000000000) }
      im := { lo := ((242448156794671 : ℚ) / 125000000000000000)
              hi := ((3286750045287307 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4143810825147157 : ℚ) / 5000000000000000000)
              hi := ((159331565207289 : ℚ) / 250000000000000000) }
      im := { lo := ((-396520847558337 : ℚ) / 1250000000000000000)
              hi := ((688401144030797 : ℚ) / 625000000000000000) } }
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

def s085_t5_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((791398529215853 : ℚ) / 200000000000000000)
              hi := ((2137682461605183 : ℚ) / 250000000000000000) }
      im := { lo := ((-653509038195447 : ℚ) / 10000000000000000)
              hi := ((-152016582084357 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((3926195335702103 : ℚ) / 500000000000000000)
              hi := ((9249296402569697 : ℚ) / 1000000000000000000) }
      im := { lo := ((-35052204222889693 : ℚ) / 5000000000000000000)
              hi := ((-702200676331289 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10587063392919847 : ℚ) / 10000000000000000000)
              hi := ((-36919901139824613 : ℚ) / 100000000000000000000) }
      im := { lo := ((19406252289391837 : ℚ) / 10000000000000000000)
              hi := ((41100103622041 : ℚ) / 15625000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8286419709863997 : ℚ) / 10000000000000000000)
              hi := ((19920037070791 : ℚ) / 31250000000000000) }
      im := { lo := ((-15859338695697477 : ℚ) / 50000000000000000000)
              hi := ((11014248973955877 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((495687402900771 : ℚ) / 125000000000000000)
              hi := ((4279574101250897 : ℚ) / 500000000000000000) }
      im := { lo := ((-3266797231530943 : ℚ) / 50000000000000000)
              hi := ((-6079181366304989 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7843937414024563 : ℚ) / 1000000000000000000)
              hi := ((9240615314977827 : ℚ) / 1000000000000000000) }
      im := { lo := ((-702183803915617 : ℚ) / 100000000000000000)
              hi := ((-5629256708484253 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2110900904300023 : ℚ) / 2000000000000000000)
              hi := ((-3659790505651229 : ℚ) / 10000000000000000000) }
      im := { lo := ((19416608002225933 : ℚ) / 10000000000000000000)
              hi := ((5262816936500137 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1657043044699603 : ℚ) / 2000000000000000000)
              hi := ((3187778929612779 : ℚ) / 5000000000000000000) }
      im := { lo := ((-158578286433739 : ℚ) / 500000000000000000)
              hi := ((344189896210917 : ℚ) / 312500000000000000) } }
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

def s085_t5_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1987011783477173 : ℚ) / 500000000000000000)
              hi := ((428379323618789 : ℚ) / 50000000000000000) }
      im := { lo := ((-653209987323169 : ℚ) / 10000000000000000)
              hi := ((-759712591077277 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((195886711367021 : ℚ) / 25000000000000000)
              hi := ((4615959432729129 : ℚ) / 500000000000000000) }
      im := { lo := ((-1758306102286893 : ℚ) / 250000000000000000)
              hi := ((-28204477932933197 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10521933533282147 : ℚ) / 10000000000000000000)
              hi := ((-1451029596937353 : ℚ) / 4000000000000000000) }
      im := { lo := ((19426915895120953 : ℚ) / 10000000000000000000)
              hi := ((5264811844762047 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4142008453979157 : ℚ) / 5000000000000000000)
              hi := ((6376709305052587 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6342517291068649 : ℚ) / 20000000000000000000)
              hi := ((68836870734111 : ℚ) / 62500000000000000) } }
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

def s085_t5_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((796513361974621 : ℚ) / 200000000000000000)
              hi := ((8576043332688061 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10204072953057 : ℚ) / 156250000000000)
              hi := ((-15190553240744909 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((978373007745773 : ℚ) / 125000000000000000)
              hi := ((9223206816900403 : ℚ) / 1000000000000000000) }
      im := { lo := ((-352230029499599 : ℚ) / 50000000000000000)
              hi := ((-5652521356878951 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5244675910343079 : ℚ) / 5000000000000000000)
              hi := ((-898834831256497 : ℚ) / 2500000000000000000) }
      im := { lo := ((9718587618191549 : ℚ) / 5000000000000000000)
              hi := ((13166995306240013 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8282814648841513 : ℚ) / 10000000000000000000)
              hi := ((1594464024106421 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3170951657284757 : ℚ) / 10000000000000000000)
              hi := ((220274441159853 : ℚ) / 200000000000000000) } }
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

def s085_t5_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((997782284599813 : ℚ) / 250000000000000000)
              hi := ((429225928528761 : ℚ) / 50000000000000000) }
      im := { lo := ((-6529114772154947 : ℚ) / 100000000000000000)
              hi := ((-12149486430661871 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1563696813196019 : ℚ) / 200000000000000000)
              hi := ((1842895873254817 : ℚ) / 200000000000000000) }
      im := { lo := ((-14111930005170737 : ℚ) / 2000000000000000000)
              hi := ((-566413557006739 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2614188858981241 : ℚ) / 2500000000000000000)
              hi := ((-17815452780286397 : ℚ) / 50000000000000000000) }
      im := { lo := ((19447388837438551 : ℚ) / 10000000000000000000)
              hi := ((2634387601497497 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2070402673319677 : ℚ) / 2500000000000000000)
              hi := ((6379000481604157 : ℚ) / 10000000000000000000) }
      im := { lo := ((-792660694923047 : ℚ) / 2500000000000000000)
              hi := ((11013542918081763 : ℚ) / 10000000000000000000) } }
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

def s085_t5_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((7999422140710439 : ℚ) / 2000000000000000000)
              hi := ((1718602342836089 : ℚ) / 200000000000000000) }
      im := { lo := ((-6527624092458571 : ℚ) / 100000000000000000)
              hi := ((-6073266518076009 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7809968700278049 : ℚ) / 1000000000000000000)
              hi := ((4602868158860381 : ℚ) / 500000000000000000) }
      im := { lo := ((-7067318001631109 : ℚ) / 1000000000000000000)
              hi := ((-5675737807691333 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1042414509185369 : ℚ) / 1000000000000000000)
              hi := ((-4413533927846647 : ℚ) / 12500000000000000000) }
      im := { lo := ((152012159691081 : ℚ) / 78125000000000000)
              hi := ((13176857808053417 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-207010071909311 : ℚ) / 250000000000000000)
              hi := ((1276028058455813 : ℚ) / 2000000000000000000) }
      im := { lo := ((-31703290690918113 : ℚ) / 100000000000000000000)
              hi := ((110133589542777 : ℚ) / 100000000000000000) } }
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

def s085_t5_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4008310747531951 : ℚ) / 1000000000000000000)
              hi := ((4300762277161499 : ℚ) / 500000000000000000) }
      im := { lo := ((-1305226938316101 : ℚ) / 20000000000000000)
              hi := ((-1214358232913877 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((7801437816141283 : ℚ) / 1000000000000000000)
              hi := ((1839395569581307 : ℚ) / 200000000000000000) }
      im := { lo := ((-884832400762317 : ℚ) / 125000000000000000)
              hi := ((-568732843925547 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1298940015376609 : ℚ) / 1250000000000000000)
              hi := ((-174927491602059 : ℚ) / 500000000000000000) }
      im := { lo := ((3893535678667627 : ℚ) / 2000000000000000000)
              hi := ((1647719317338299 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8279203260725247 : ℚ) / 10000000000000000000)
              hi := ((6381287594470793 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3170011130171101 : ℚ) / 10000000000000000000)
              hi := ((5506585385895873 : ℚ) / 5000000000000000000) } }
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

def s085_t5_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4016929521328521 : ℚ) / 1000000000000000000)
              hi := ((4305027869431353 : ℚ) / 500000000000000000) }
      im := { lo := ((-20389520424249 : ℚ) / 312500000000000)
              hi := ((-30351585999789637 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((38964459125018533 : ℚ) / 5000000000000000000)
              hi := ((918820357443003 : ℚ) / 100000000000000000) }
      im := { lo := ((-3544994110643361 : ℚ) / 500000000000000000)
              hi := ((-1139781558920313 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2071775748578749 : ℚ) / 2000000000000000000)
              hi := ((-34662605678766083 : ℚ) / 100000000000000000000) }
      im := { lo := ((243471956756147 : ℚ) / 125000000000000000)
              hi := ((1054930178722553 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-206950129232973 : ℚ) / 250000000000000000)
              hi := ((6382435710832621 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31696914680801063 : ℚ) / 100000000000000000000)
              hi := ((2753245219950343 : ℚ) / 2500000000000000000) } }
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

def s085_t5_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60821811077 : ℚ) / 1000000000000)
      ((-357235409 : ℚ) / 1000000000000)
      ((1049046813 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4025568131104791 : ℚ) / 1000000000000000000)
              hi := ((2154651121671243 : ℚ) / 250000000000000000) }
      im := { lo := ((-1630789906129823 : ℚ) / 25000000000000000)
              hi := ((-6068844621521677 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((38921653819525273 : ℚ) / 5000000000000000000)
              hi := ((917941350557513 : ℚ) / 100000000000000000) }
      im := { lo := ((-7101305423434491 : ℚ) / 1000000000000000000)
              hi := ((-5710475459831867 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2581555526309461 : ℚ) / 2500000000000000000)
              hi := ((-34339583448331657 : ℚ) / 100000000000000000000) }
      im := { lo := ((19487790073315703 : ℚ) / 10000000000000000000)
              hi := ((1319147629073233 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1655360532615809 : ℚ) / 2000000000000000000)
              hi := ((1276715740711249 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1584684920555151 : ℚ) / 5000000000000000000)
              hi := ((344149657290937 : ℚ) / 312500000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t5) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t5).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t5).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t5).constants.restUpper) := by
  if h0 : i = .s085_t5_sb000 then
    exact s085_t5_sb000_certificateData
  else if h1 : i = .s085_t5_sb001 then
    exact s085_t5_sb001_certificateData
  else if h2 : i = .s085_t5_sb002 then
    exact s085_t5_sb002_certificateData
  else if h3 : i = .s085_t5_sb003 then
    exact s085_t5_sb003_certificateData
  else if h4 : i = .s085_t5_sb004 then
    exact s085_t5_sb004_certificateData
  else if h5 : i = .s085_t5_sb005 then
    exact s085_t5_sb005_certificateData
  else if h6 : i = .s085_t5_sb006 then
    exact s085_t5_sb006_certificateData
  else if h7 : i = .s085_t5_sb007 then
    exact s085_t5_sb007_certificateData
  else if h8 : i = .s085_t5_sb008 then
    exact s085_t5_sb008_certificateData
  else if h9 : i = .s085_t5_sb009 then
    exact s085_t5_sb009_certificateData
  else if h10 : i = .s085_t5_sb010 then
    exact s085_t5_sb010_certificateData
  else if h11 : i = .s085_t5_sb011 then
    exact s085_t5_sb011_certificateData
  else if h12 : i = .s085_t5_sb012 then
    exact s085_t5_sb012_certificateData
  else if h13 : i = .s085_t5_sb013 then
    exact s085_t5_sb013_certificateData
  else if h14 : i = .s085_t5_sb014 then
    exact s085_t5_sb014_certificateData
  else if h15 : i = .s085_t5_sb015 then
    exact s085_t5_sb015_certificateData
  else if h16 : i = .s085_t5_sb016 then
    exact s085_t5_sb016_certificateData
  else if h17 : i = .s085_t5_sb017 then
    exact s085_t5_sb017_certificateData
  else if h18 : i = .s085_t5_sb018 then
    exact s085_t5_sb018_certificateData
  else if h19 : i = .s085_t5_sb019 then
    exact s085_t5_sb019_certificateData
  else if h20 : i = .s085_t5_sb020 then
    exact s085_t5_sb020_certificateData
  else if h21 : i = .s085_t5_sb021 then
    exact s085_t5_sb021_certificateData
  else if h22 : i = .s085_t5_sb022 then
    exact s085_t5_sb022_certificateData
  else if h23 : i = .s085_t5_sb023 then
    exact s085_t5_sb023_certificateData
  else if h24 : i = .s085_t5_sb024 then
    exact s085_t5_sb024_certificateData
  else if h25 : i = .s085_t5_sb025 then
    exact s085_t5_sb025_certificateData
  else if h26 : i = .s085_t5_sb026 then
    exact s085_t5_sb026_certificateData
  else if h27 : i = .s085_t5_sb027 then
    exact s085_t5_sb027_certificateData
  else if h28 : i = .s085_t5_sb028 then
    exact s085_t5_sb028_certificateData
  else if h29 : i = .s085_t5_sb029 then
    exact s085_t5_sb029_certificateData
  else if h30 : i = .s085_t5_sb030 then
    exact s085_t5_sb030_certificateData
  else if h31 : i = .s085_t5_sb031 then
    exact s085_t5_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T5
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
