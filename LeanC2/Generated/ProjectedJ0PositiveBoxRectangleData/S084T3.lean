import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t3

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
namespace S084T3

open ProjectedJ0RectangleArithmetic

def s084_t3_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((16531270404259077 : ℚ) / 10000000000000000000)
              hi := ((825786305456231 : ℚ) / 125000000000000000) }
      im := { lo := ((-1664491658743179 : ℚ) / 25000000000000000)
              hi := ((-12334617768278923 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((192833935075147 : ℚ) / 20000000000000000)
              hi := ((11183396464643057 : ℚ) / 1000000000000000000) }
      im := { lo := ((-642009974822533 : ℚ) / 100000000000000000)
              hi := ((-488023155495741 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15433176303150603 : ℚ) / 10000000000000000000)
              hi := ((-7844870696196407 : ℚ) / 10000000000000000000) }
      im := { lo := ((20356354025735457 : ℚ) / 10000000000000000000)
              hi := ((2794572530795371 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4464515111949239 : ℚ) / 5000000000000000000)
              hi := ((422675460733183 : ℚ) / 625000000000000000) }
      im := { lo := ((-901666660257491 : ℚ) / 2500000000000000000)
              hi := ((5815007481459 : ℚ) / 5000000000000000) } }
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

def s084_t3_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((8302619922702333 : ℚ) / 5000000000000000000)
              hi := ((6613607372101809 : ℚ) / 1000000000000000000) }
      im := { lo := ((-665618282780243 : ℚ) / 10000000000000000)
              hi := ((-6165536132357913 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2408535065210621 : ℚ) / 250000000000000000)
              hi := ((2235119258694681 : ℚ) / 200000000000000000) }
      im := { lo := ((-6434009463060261 : ℚ) / 1000000000000000000)
              hi := ((-4894406521960557 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15398817129145179 : ℚ) / 10000000000000000000)
              hi := ((-781082294277097 : ℚ) / 1000000000000000000) }
      im := { lo := ((20373064340000143 : ℚ) / 10000000000000000000)
              hi := ((1398106917448581 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8927774633266881 : ℚ) / 10000000000000000000)
              hi := ((676398651577141 : ℚ) / 1000000000000000000) }
      im := { lo := ((-180324028203719 : ℚ) / 500000000000000000)
              hi := ((5814948010654979 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((16679433800044301 : ℚ) / 10000000000000000000)
              hi := ((6620945536201177 : ℚ) / 1000000000000000000) }
      im := { lo := ((-831800017523881 : ℚ) / 12500000000000000)
              hi := ((-6163764570003827 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9626564766859193 : ℚ) / 1000000000000000000)
              hi := ((11167777224627997 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3223954324158913 : ℚ) / 500000000000000000)
              hi := ((-981714230575187 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-480138563342097 : ℚ) / 312500000000000000)
              hi := ((-19441880044473 : ℚ) / 25000000000000000) }
      im := { lo := ((20389726517777967 : ℚ) / 10000000000000000000)
              hi := ((27978502714931927 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-557907225888119 : ℚ) / 625000000000000000)
              hi := ((3382580668286773 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3606293795792757 : ℚ) / 10000000000000000000)
              hi := ((5814888173153893 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1675385133981419 : ℚ) / 1000000000000000000)
              hi := ((6628304967737059 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6652618554636269 : ℚ) / 100000000000000000)
              hi := ((-61619942184661 : ℚ) / 1000000000000000) } }
  D0Rect :=
    { re := { lo := ((2404742575478719 : ℚ) / 250000000000000000)
              hi := ((17855902849363 : ℚ) / 1600000000000000) }
      im := { lo := ((-6461797557837373 : ℚ) / 1000000000000000000)
              hi := ((-4922725138008539 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3832506964067719 : ℚ) / 2500000000000000000)
              hi := ((-7742657249419427 : ℚ) / 10000000000000000000) }
      im := { lo := ((63769812296281 : ℚ) / 31250000000000000)
              hi := ((2799481898694493 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1785050770847109 : ℚ) / 2000000000000000000)
              hi := ((1691583130952481 : ℚ) / 2500000000000000000) }
      im := { lo := ((-721220651659231 : ℚ) / 2000000000000000000)
              hi := ((581482643012399 : ℚ) / 500000000000000000) } }
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

def s084_t3_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((8414249614949411 : ℚ) / 5000000000000000000)
              hi := ((414730313998851 : ℚ) / 62500000000000000) }
      im := { lo := ((-3325418997281613 : ℚ) / 50000000000000000)
              hi := ((-3080112579429207 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((600709835563529 : ℚ) / 62500000000000000)
              hi := ((697005123596971 : ℚ) / 62500000000000000) }
      im := { lo := ((-2590270277951957 : ℚ) / 400000000000000000)
              hi := ((-1974747570325229 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-30591192606553 : ℚ) / 20000000000000000)
              hi := ((-7708541066820669 : ℚ) / 10000000000000000000) }
      im := { lo := ((5105726734444721 : ℚ) / 2500000000000000000)
              hi := ((560221694867993 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1784797863429773 : ℚ) / 2000000000000000000)
              hi := ((6767500039339943 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3605907565462719 : ℚ) / 10000000000000000000)
              hi := ((2907381044490183 : ℚ) / 2500000000000000000) } }
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

def s084_t3_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((10564607869533 : ℚ) / 6250000000000000)
              hi := ((13286172229589957 : ℚ) / 2000000000000000000) }
      im := { lo := ((-207783078778501 : ℚ) / 3125000000000000)
              hi := ((-30792286680855343 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((240093136448909 : ℚ) / 25000000000000000)
              hi := ((5572102942424527 : ℚ) / 500000000000000000) }
      im := { lo := ((-3244771832525579 : ℚ) / 500000000000000000)
              hi := ((-309437616306017 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-15261142370921997 : ℚ) / 10000000000000000000)
              hi := ((-3837200329748017 : ℚ) / 5000000000000000000) }
      im := { lo := ((10219712330660723 : ℚ) / 5000000000000000000)
              hi := ((560546056547349 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-356908823098781 : ℚ) / 400000000000000000)
              hi := ((846082807542037 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3605706165283639 : ℚ) / 10000000000000000000)
              hi := ((581469487458753 : ℚ) / 500000000000000000) } }
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

def s084_t3_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((424461398863091 : ℚ) / 250000000000000000)
              hi := ((6650509779331179 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6647280199527957 : ℚ) / 100000000000000000)
              hi := ((-30783453448671963 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((2399018741292171 : ℚ) / 250000000000000000)
              hi := ((11136310598513409 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6503401630900397 : ℚ) / 1000000000000000000)
              hi := ((-248256185960777 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15226665763670131 : ℚ) / 10000000000000000000)
              hi := ((-3820118203609693 : ℚ) / 5000000000000000000) }
      im := { lo := ((511397342978091 : ℚ) / 250000000000000000)
              hi := ((28043472491225793 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1115182446389977 : ℚ) / 1250000000000000000)
              hi := ((1692457931180887 : ℚ) / 2500000000000000000) }
      im := { lo := ((-721099898624559 : ℚ) / 2000000000000000000)
              hi := ((116292500105177 : ℚ) / 100000000000000000) } }
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

def s084_t3_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((8526878364848729 : ℚ) / 5000000000000000000)
              hi := ((3328977637884711 : ℚ) / 500000000000000000) }
      im := { lo := ((-83068786973137 : ℚ) / 1250000000000000)
              hi := ((-12309850594283607 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((9588405594419917 : ℚ) / 1000000000000000000)
              hi := ((11128396442005497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1303449766883273 : ℚ) / 200000000000000000)
              hi := ((-2489617606839783 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3038433039461063 : ℚ) / 2000000000000000000)
              hi := ((-7606049721539619 : ℚ) / 10000000000000000000) }
      im := { lo := ((20472314829908297 : ℚ) / 10000000000000000000)
              hi := ((280595929595833 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8920201532727953 : ℚ) / 10000000000000000000)
              hi := ((6771003066753529 : ℚ) / 10000000000000000000) }
      im := { lo := ((-18026436650178513 : ℚ) / 50000000000000000000)
              hi := ((5814552372206341 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((4282318906394469 : ℚ) / 2500000000000000000)
              hi := ((3332711253998233 : ℚ) / 500000000000000000) }
      im := { lo := ((-1328745389292617 : ℚ) / 20000000000000000)
              hi := ((-492252880924749 : ℚ) / 8000000000000000) } }
  D0Rect :=
    { re := { lo := ((9580717669153933 : ℚ) / 1000000000000000000)
              hi := ((347514473420849 : ℚ) / 31250000000000000) }
      im := { lo := ((-3265542645734091 : ℚ) / 500000000000000000)
              hi := ((-78020879579633 : ℚ) / 15625000000000000) } }
  DrestRect :=
    { re := { lo := ((-7578820104145671 : ℚ) / 5000000000000000000)
              hi := ((-1892960308927237 : ℚ) / 2500000000000000000) }
      im := { lo := ((20488688731712043 : ℚ) / 10000000000000000000)
              hi := ((28075663495245643 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1114867991109657 : ℚ) / 1250000000000000000)
              hi := ((6772173952582961 : ℚ) / 10000000000000000000) }
      im := { lo := ((-36050809788497237 : ℚ) / 100000000000000000000)
              hi := ((1453620656826571 : ℚ) / 1250000000000000000) } }
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

def s084_t3_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((17205016977525369 : ℚ) / 10000000000000000000)
              hi := ((3336455508340329 : ℚ) / 500000000000000000) }
      im := { lo := ((-6641952164080613 : ℚ) / 100000000000000000)
              hi := ((-3075698919902229 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((9573011064314423 : ℚ) / 1000000000000000000)
              hi := ((694531928482739 : ℚ) / 62500000000000000) }
      im := { lo := ((-13089821140974331 : ℚ) / 2000000000000000000)
              hi := ((-1001485463780081 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1512309005165137 : ℚ) / 1000000000000000000)
              hi := ((-1507522364595243 : ℚ) / 2000000000000000000) }
      im := { lo := ((410100317318897 : ℚ) / 200000000000000000)
              hi := ((14045841765454891 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8917683194026397 : ℚ) / 10000000000000000000)
              hi := ((10837345310267 : ℚ) / 16000000000000000) }
      im := { lo := ((-360488316597903 : ℚ) / 1000000000000000000)
              hi := ((58144171341573 : ℚ) / 50000000000000000) } }
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

def s084_t3_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1728097609388001 : ℚ) / 1000000000000000000)
              hi := ((1336084244042623 : ℚ) / 200000000000000000) }
      im := { lo := ((-6640178542935547 : ℚ) / 100000000000000000)
              hi := ((-1229927171118081 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((47826426225169 : ℚ) / 5000000000000000)
              hi := ((11104540127550227 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13117451028309 : ℚ) / 2000000000000000)
              hi := ((-2510753700531457 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3017703675313807 : ℚ) / 2000000000000000000)
              hi := ((-3751678985951521 : ℚ) / 5000000000000000000) }
      im := { lo := ((2052129280684367 : ℚ) / 1000000000000000000)
              hi := ((562153128750919 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8916420587146127 : ℚ) / 10000000000000000000)
              hi := ((3387252463532921 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1802341269791623 : ℚ) / 5000000000000000000)
              hi := ((11628700435769449 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((17357152053955843 : ℚ) / 10000000000000000000)
              hi := ((6687953235387377 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6638406127111993 : ℚ) / 100000000000000000)
              hi := ((-30739375102780613 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((4778770116949169 : ℚ) / 500000000000000000)
              hi := ((11096550978865659 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1643132417413217 : ℚ) / 250000000000000000)
              hi := ((-629447117344699 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-30107848157671 : ℚ) / 20000000000000000)
              hi := ((-7469080942296121 : ℚ) / 10000000000000000000) }
      im := { lo := ((4107504092127531 : ℚ) / 2000000000000000000)
              hi := ((28123581248678513 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-445757815968921 : ℚ) / 500000000000000000)
              hi := ((6775666485905377 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4505605223802157 : ℚ) / 12500000000000000000)
              hi := ((2325713767516641 : ℚ) / 2000000000000000000) } }
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

def s084_t3_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1743354069604987 : ℚ) / 1000000000000000000)
              hi := ((3347753717976931 : ℚ) / 500000000000000000) }
      im := { lo := ((-6636634947930069 : ℚ) / 100000000000000000)
              hi := ((-15365288264826209 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((954977535194097 : ℚ) / 100000000000000000)
              hi := ((554427204748407 : ℚ) / 50000000000000000) }
      im := { lo := ((-1317264719957889 : ℚ) / 200000000000000000)
              hi := ((-10099270668357533 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1501931027521759 : ℚ) / 1000000000000000000)
              hi := ((-1486955538409539 : ℚ) / 2000000000000000000) }
      im := { lo := ((10276847826977847 : ℚ) / 5000000000000000000)
              hi := ((7034865267977169 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8913888499198643 : ℚ) / 10000000000000000000)
              hi := ((6776823606995689 : ℚ) / 10000000000000000000) }
      im := { lo := ((-225267857890717 : ℚ) / 625000000000000000)
              hi := ((1162843711650791 : ℚ) / 1000000000000000000) } }
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

def s084_t3_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((8755067760055893 : ℚ) / 5000000000000000000)
              hi := ((837885557459323 : ℚ) / 125000000000000000) }
      im := { lo := ((-414679061633087 : ℚ) / 6250000000000000)
              hi := ((-15360891844468769 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((9541991427982023 : ℚ) / 1000000000000000000)
              hi := ((11080518704563813 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1650026899689789 : ℚ) / 250000000000000000)
              hi := ((-506368222641261 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-749233811854253 : ℚ) / 500000000000000000)
              hi := ((-7400449160977149 : ℚ) / 10000000000000000000) }
      im := { lo := ((5142454962287459 : ℚ) / 2500000000000000000)
              hi := ((28155294387751757 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8912626391223141 : ℚ) / 10000000000000000000)
              hi := ((6777985554026697 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7208165916761331 : ℚ) / 20000000000000000000)
              hi := ((2325660210198993 : ℚ) / 2000000000000000000) } }
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

def s084_t3_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1758694846615437 : ℚ) / 1000000000000000000)
              hi := ((3355341540285411 : ℚ) / 500000000000000000) }
      im := { lo := ((-6633096200589063 : ℚ) / 100000000000000000)
              hi := ((-6142599360989517 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4767094394407737 : ℚ) / 500000000000000000)
              hi := ((1107247448819519 : ℚ) / 100000000000000000) }
      im := { lo := ((-3306940880943121 : ℚ) / 500000000000000000)
              hi := ((-1269429371137529 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14950021615504363 : ℚ) / 10000000000000000000)
              hi := ((-3683047887958591 : ℚ) / 5000000000000000000) }
      im := { lo := ((10292946829071163 : ℚ) / 5000000000000000000)
              hi := ((28171080518235273 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8911363630708291 : ℚ) / 10000000000000000000)
              hi := ((3389572982328003 : ℚ) / 5000000000000000000) }
      im := { lo := ((-9009687928111401 : ℚ) / 25000000000000000000)
              hi := ((5814079969163453 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((441599611791671 : ℚ) / 250000000000000000)
              hi := ((671830278060597 : ℚ) / 100000000000000000) }
      im := { lo := ((-1326265715833713 : ℚ) / 20000000000000000)
              hi := ((-245633727786559 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((2381591782546939 : ℚ) / 250000000000000000)
              hi := ((2766102947728981 : ℚ) / 250000000000000000) }
      im := { lo := ((-414227805466507 : ℚ) / 62500000000000000)
              hi := ((-10183484473278553 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7457672000498357 : ℚ) / 5000000000000000000)
              hi := ((-7331720136861111 : ℚ) / 10000000000000000000) }
      im := { lo := ((20601918670076617 : ℚ) / 10000000000000000000)
              hi := ((28186817783521327 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2227524028163659 : ℚ) / 2500000000000000000)
              hi := ((54242405876387 : ℚ) / 80000000000000000) }
      im := { lo := ((-3603668279212341 : ℚ) / 10000000000000000000)
              hi := ((5814009846969371 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((2217655913998989 : ℚ) / 1250000000000000000)
              hi := ((13451886323621971 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6629562090305059 : ℚ) / 100000000000000000)
              hi := ((-30695441367511997 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1903705413928139 : ℚ) / 200000000000000000)
              hi := ((5528165017014597 : ℚ) / 500000000000000000) }
      im := { lo := ((-664139668748727 : ℚ) / 100000000000000000)
              hi := ((-1595548981815013 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-1488064140343733 : ℚ) / 1000000000000000000)
              hi := ((-1824331090283957 : ℚ) / 2500000000000000000) }
      im := { lo := ((206178971215737 : ℚ) / 100000000000000000)
              hi := ((2820250393496913 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8908825140541349 : ℚ) / 10000000000000000000)
              hi := ((6781451167371363 : ℚ) / 10000000000000000000) }
      im := { lo := ((-90086567375301 : ℚ) / 250000000000000000)
              hi := ((11627880731609277 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((556835193060941 : ℚ) / 312500000000000000)
              hi := ((1683401318106983 : ℚ) / 250000000000000000) }
      im := { lo := ((-662779682856567 : ℚ) / 10000000000000000)
              hi := ((-383583406750963 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((4755334096692621 : ℚ) / 500000000000000000)
              hi := ((2762057407379657 : ℚ) / 250000000000000000) }
      im := { lo := ((-3327568746363213 : ℚ) / 500000000000000000)
              hi := ((-1023952120993991 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3711478942167221 : ℚ) / 2500000000000000000)
              hi := ((-453931662612187 : ℚ) / 625000000000000000) }
      im := { lo := ((10316913510489943 : ℚ) / 5000000000000000000)
              hi := ((14109070416948833 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2226888492413671 : ℚ) / 2500000000000000000)
              hi := ((6782600521592159 : ℚ) / 10000000000000000000) }
      im := { lo := ((-900815122958459 : ℚ) / 2500000000000000000)
              hi := ((581387256277091 : ℚ) / 500000000000000000) } }
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

def s084_t3_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((4474103449551187 : ℚ) / 2500000000000000000)
              hi := ((13482579790341143 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1656508221661181 : ℚ) / 25000000000000000)
              hi := ((-1227116362747071 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1187848792606453 : ℚ) / 125000000000000000)
              hi := ((11040110797896553 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2667546830988813 : ℚ) / 400000000000000000)
              hi := ((-5133754009160349 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7405583518841361 : ℚ) / 5000000000000000000)
              hi := ((-7228467101825817 : ℚ) / 10000000000000000000) }
      im := { lo := ((10324854140588383 : ℚ) / 5000000000000000000)
              hi := ((28233728558668503 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2226571328252653 : ℚ) / 2500000000000000000)
              hi := ((27135006018969 : ℚ) / 40000000000000000) }
      im := { lo := ((-3603067408371353 : ℚ) / 10000000000000000000)
              hi := ((11627618617357169 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1797433016842913 : ℚ) / 1000000000000000000)
              hi := ((6748994910133897 : ℚ) / 1000000000000000000) }
      im := { lo := ((-828033750546797 : ℚ) / 12500000000000000)
              hi := ((-6133830452081753 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4747446968802113 : ℚ) / 500000000000000000)
              hi := ((11031973135380709 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6682585284681151 : ℚ) / 1000000000000000000)
              hi := ((-5147737056281699 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7388197008686467 : ℚ) / 5000000000000000000)
              hi := ((-3597003592470449 : ℚ) / 5000000000000000000) }
      im := { lo := ((20665542285595523 : ℚ) / 10000000000000000000)
              hi := ((2824926564321777 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8905012252060869 : ℚ) / 10000000000000000000)
              hi := ((6784897205617017 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1801434961549567 : ℚ) / 5000000000000000000)
              hi := ((11627487684676453 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((18052464940131563 : ℚ) / 10000000000000000000)
              hi := ((1351344270556973 : ℚ) / 200000000000000000) }
      im := { lo := ((-6622508276512733 : ℚ) / 100000000000000000)
              hi := ((-30660401669613327 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((9486978983066977 : ℚ) / 1000000000000000000)
              hi := ((5511908326829929 : ℚ) / 500000000000000000) }
      im := { lo := ((-8370366038729177 : ℚ) / 1250000000000000000)
              hi := ((-2580854494767771 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1842699849959109 : ℚ) / 1250000000000000000)
              hi := ((-3579762424846737 : ℚ) / 5000000000000000000) }
      im := { lo := ((206813273841669 : ℚ) / 100000000000000000)
              hi := ((28264753668379547 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2225934915551377 : ℚ) / 2500000000000000000)
              hi := ((1696510624968897 : ℚ) / 2500000000000000000) }
      im := { lo := ((-900667134414161 : ℚ) / 2500000000000000000)
              hi := ((1453419103930489 : ℚ) / 1250000000000000000) } }
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

def s084_t3_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((9065405269439153 : ℚ) / 5000000000000000000)
              hi := ((422779375844329 : ℚ) / 62500000000000000) }
      im := { lo := ((-662074768215871 : ℚ) / 10000000000000000)
              hi := ((-15325828716380269 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((379161823664929 : ℚ) / 40000000000000000)
              hi := ((5507820644858179 : ℚ) / 500000000000000000) }
      im := { lo := ((-6709989269690137 : ℚ) / 1000000000000000000)
              hi := ((-10351340377124917 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7353390075964431 : ℚ) / 5000000000000000000)
              hi := ((-1425004305911957 : ℚ) / 2000000000000000000) }
      im := { lo := ((2587133085789059 : ℚ) / 1250000000000000000)
              hi := ((7070047864964241 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1112809334729103 : ℚ) / 1250000000000000000)
              hi := ((3393597259291891 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36024619360218213 : ℚ) / 100000000000000000000)
              hi := ((5813606371228037 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((18209378975193847 : ℚ) / 10000000000000000000)
              hi := ((6772239592363343 : ℚ) / 1000000000000000000) }
      im := { lo := ((-413686762040403 : ℚ) / 6250000000000000)
              hi := ((-95759123939523 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((378843735474391 : ℚ) / 40000000000000000)
              hi := ((2751861859855069 : ℚ) / 250000000000000000) }
      im := { lo := ((-6723674558715637 : ℚ) / 1000000000000000000)
              hi := ((-5189620658391947 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14671938897481349 : ℚ) / 10000000000000000000)
              hi := ((-7090496503347019 : ℚ) / 10000000000000000000) }
      im := { lo := ((20712753150529677 : ℚ) / 10000000000000000000)
              hi := ((2829558000725169 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8901206577139313 : ℚ) / 10000000000000000000)
              hi := ((1357668509230119 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3602250929555749 : ℚ) / 10000000000000000000)
              hi := ((2325413644864889 : ℚ) / 2000000000000000000) } }
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

def s084_t3_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((9144080346479 : ℚ) / 5000000000000000)
              hi := ((1695007774883047 : ℚ) / 250000000000000000) }
      im := { lo := ((-6617230106992601 : ℚ) / 100000000000000000)
              hi := ((-6126837408262521 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4731561257716759 : ℚ) / 500000000000000000)
              hi := ((687452186925249 : ℚ) / 62500000000000000) }
      im := { lo := ((-1684337182207391 : ℚ) / 250000000000000000)
              hi := ((-130089007715713 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1463707500276011 : ℚ) / 1000000000000000000)
              hi := ((-3527974982363479 : ℚ) / 5000000000000000000) }
      im := { lo := ((2072839296551373 : ℚ) / 1000000000000000000)
              hi := ((14155459524198507 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2224984192258677 : ℚ) / 2500000000000000000)
              hi := ((3394743993230629 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36020538473720883 : ℚ) / 100000000000000000000)
              hi := ((2906734406432403 : ℚ) / 2500000000000000000) } }
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

def s084_t3_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3673428245690189 : ℚ) / 2000000000000000000)
              hi := ((16969614708914969 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6615473348254693 : ℚ) / 100000000000000000)
              hi := ((-1531272991524867 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((9455131549579287 : ℚ) / 1000000000000000000)
              hi := ((2747751349845823 : ℚ) / 250000000000000000) }
      im := { lo := ((-2700405062136247 : ℚ) / 400000000000000000)
              hi := ((-26087441130288893 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-292043882509023 : ℚ) / 200000000000000000)
              hi := ((-1755344093403751 : ℚ) / 2500000000000000000) }
      im := { lo := ((10371989092199947 : ℚ) / 5000000000000000000)
              hi := ((14163107244126547 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-278083396140791 : ℚ) / 312500000000000000)
              hi := ((848829283617419 : ℚ) / 1250000000000000000) }
      im := { lo := ((-36018566978843913 : ℚ) / 100000000000000000000)
              hi := ((1453350867329353 : ℚ) / 1250000000000000000) } }
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

def s084_t3_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((18446349637412907 : ℚ) / 10000000000000000000)
              hi := ((424730066421123 : ℚ) / 62500000000000000) }
      im := { lo := ((-6613717704862183 : ℚ) / 100000000000000000)
              hi := ((-6123347821207493 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9447122512214133 : ℚ) / 1000000000000000000)
              hi := ((10982756674915889 : ℚ) / 1000000000000000000) }
      im := { lo := ((-422791583943889 : ℚ) / 62500000000000000)
              hi := ((-523140534388521 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14567289328699053 : ℚ) / 10000000000000000000)
              hi := ((-3493391413790179 : ℚ) / 5000000000000000000) }
      im := { lo := ((5189879101023721 : ℚ) / 2500000000000000000)
              hi := ((28341458648525877 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8897397280194721 : ℚ) / 10000000000000000000)
              hi := ((424486023276363 : ℚ) / 625000000000000000) }
      im := { lo := ((-3601657215940033 : ℚ) / 10000000000000000000)
              hi := ((581333694885583 : ℚ) / 500000000000000000) } }
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

def s084_t3_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((9262884135592803 : ℚ) / 5000000000000000000)
              hi := ((13607076755908401 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1322392697359201 : ℚ) / 20000000000000000)
              hi := ((-3060802351702021 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((9439095217337929 : ℚ) / 1000000000000000000)
              hi := ((1097448902755903 : ℚ) / 100000000000000000) }
      im := { lo := ((-13556612830626263 : ℚ) / 2000000000000000000)
              hi := ((-5245311987128039 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14532360136292797 : ℚ) / 10000000000000000000)
              hi := ((-1390433986697413 : ℚ) / 2000000000000000000) }
      im := { lo := ((16620006241823 : ℚ) / 8000000000000000)
              hi := ((708916281973377 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4448064050009297 : ℚ) / 5000000000000000000)
              hi := ((6792919816912799 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1800737269072223 : ℚ) / 5000000000000000000)
              hi := ((11626557661812763 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((4651349143895907 : ℚ) / 2500000000000000000)
              hi := ((13622835737596881 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6610210558893863 : ℚ) / 100000000000000000)
              hi := ((-48958901697313 : ℚ) / 800000000000000) } }
  D0Rect :=
    { re := { lo := ((1886209934121217 : ℚ) / 200000000000000000)
              hi := ((2193240496081163 : ℚ) / 200000000000000000) }
      im := { lo := ((-13583873282648323 : ℚ) / 2000000000000000000)
              hi := ((-10518414718021639 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3624352196558093 : ℚ) / 2500000000000000000)
              hi := ((-6917535559350563 : ℚ) / 10000000000000000000) }
      im := { lo := ((4158090129280187 : ℚ) / 2000000000000000000)
              hi := ((2837179408975161 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8894863488249981 : ℚ) / 10000000000000000000)
              hi := ((3397033478197597 : ℚ) / 5000000000000000000) }
      im := { lo := ((-9003239229803929 : ℚ) / 25000000000000000000)
              hi := ((11626445236175573 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((934262347726383 : ℚ) / 500000000000000000)
              hi := ((3409659101668801 : ℚ) / 500000000000000000) }
      im := { lo := ((-6608458772717893 : ℚ) / 100000000000000000)
              hi := ((-6118122021890273 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1177873255966351 : ℚ) / 125000000000000000)
              hi := ((5478948449824039 : ℚ) / 500000000000000000) }
      im := { lo := ((-6805555960629021 : ℚ) / 1000000000000000000)
              hi := ((-131827285893447 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-903902187260733 : ℚ) / 625000000000000000)
              hi := ((-137657603874867 : ℚ) / 200000000000000000) }
      im := { lo := ((10402922675586887 : ℚ) / 5000000000000000000)
              hi := ((28386886557282783 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8893598487698649 : ℚ) / 10000000000000000000)
              hi := ((1359042567548499 : ℚ) / 2000000000000000000) }
      im := { lo := ((-7202223824367437 : ℚ) / 20000000000000000000)
              hi := ((5813163934011271 : ℚ) / 5000000000000000000) } }
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

def s084_t3_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((146604118376877 : ℚ) / 78125000000000000)
              hi := ((6827238668745047 : ℚ) / 1000000000000000000) }
      im := { lo := ((-825838508510583 : ℚ) / 12500000000000000)
              hi := ((-1223276538533983 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((9414904238098253 : ℚ) / 1000000000000000000)
              hi := ((5474786204315611 : ℚ) / 500000000000000000) }
      im := { lo := ((-3409581927847857 : ℚ) / 500000000000000000)
              hi := ((-105739294245751 : ℚ) / 20000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14427437654109657 : ℚ) / 10000000000000000000)
              hi := ((-1712051254942493 : ℚ) / 2500000000000000000) }
      im := { lo := ((83284770696971 : ℚ) / 40000000000000000)
              hi := ((28401927889804193 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8892328797830191 : ℚ) / 10000000000000000000)
              hi := ((6796353156945943 : ℚ) / 10000000000000000000) }
      im := { lo := ((-9002307632658881 : ℚ) / 25000000000000000000)
              hi := ((11626205410811361 : ℚ) / 10000000000000000000) } }
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

def s084_t3_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((9422815358003853 : ℚ) / 5000000000000000000)
              hi := ((6835179867721179 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3302479270190569 : ℚ) / 50000000000000000)
              hi := ((-2445857854604693 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((940680411199301 : ℚ) / 100000000000000000)
              hi := ((10941229182712457 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6832760096413897 : ℚ) / 1000000000000000000)
              hi := ((-662603419732573 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2878483325624603 : ℚ) / 2000000000000000000)
              hi := ((-851688793935811 : ℚ) / 1250000000000000000) }
      im := { lo := ((2083649259602143 : ℚ) / 1000000000000000000)
              hi := ((5683383609224383 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8891056281004991 : ℚ) / 10000000000000000000)
              hi := ((1359497955550977 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1800367698612437 : ℚ) / 5000000000000000000)
              hi := ((2906521037311701 : ℚ) / 2500000000000000000) } }
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

def s084_t3_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((9785339 : ℚ) / 160000000)
      ((-316917903 : ℚ) / 1000000000000)
      ((145228683 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((4731537237851719 : ℚ) / 2500000000000000000)
              hi := ((6843142636064421 : ℚ) / 1000000000000000000) }
      im := { lo := ((-660321032638011 : ℚ) / 10000000000000000)
              hi := ((-12225815436405553 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2349671269959987 : ℚ) / 250000000000000000)
              hi := ((2186573568178389 : ℚ) / 200000000000000000) }
      im := { lo := ((-6846345065057357 : ℚ) / 1000000000000000000)
              hi := ((-265733946704261 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1435737443638583 : ℚ) / 1000000000000000000)
              hi := ((-6778793816203429 : ℚ) / 10000000000000000000) }
      im := { lo := ((10425871258138049 : ℚ) / 5000000000000000000)
              hi := ((2843185955317927 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8889780535470347 : ℚ) / 10000000000000000000)
              hi := ((6798622300155301 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1440221741047587 : ℚ) / 4000000000000000000)
              hi := ((232519389803757 : ℚ) / 200000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t3) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t3).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t3).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t3).constants.restUpper) := by
  if h0 : i = .s084_t3_sb000 then
    exact s084_t3_sb000_certificateData
  else if h1 : i = .s084_t3_sb001 then
    exact s084_t3_sb001_certificateData
  else if h2 : i = .s084_t3_sb002 then
    exact s084_t3_sb002_certificateData
  else if h3 : i = .s084_t3_sb003 then
    exact s084_t3_sb003_certificateData
  else if h4 : i = .s084_t3_sb004 then
    exact s084_t3_sb004_certificateData
  else if h5 : i = .s084_t3_sb005 then
    exact s084_t3_sb005_certificateData
  else if h6 : i = .s084_t3_sb006 then
    exact s084_t3_sb006_certificateData
  else if h7 : i = .s084_t3_sb007 then
    exact s084_t3_sb007_certificateData
  else if h8 : i = .s084_t3_sb008 then
    exact s084_t3_sb008_certificateData
  else if h9 : i = .s084_t3_sb009 then
    exact s084_t3_sb009_certificateData
  else if h10 : i = .s084_t3_sb010 then
    exact s084_t3_sb010_certificateData
  else if h11 : i = .s084_t3_sb011 then
    exact s084_t3_sb011_certificateData
  else if h12 : i = .s084_t3_sb012 then
    exact s084_t3_sb012_certificateData
  else if h13 : i = .s084_t3_sb013 then
    exact s084_t3_sb013_certificateData
  else if h14 : i = .s084_t3_sb014 then
    exact s084_t3_sb014_certificateData
  else if h15 : i = .s084_t3_sb015 then
    exact s084_t3_sb015_certificateData
  else if h16 : i = .s084_t3_sb016 then
    exact s084_t3_sb016_certificateData
  else if h17 : i = .s084_t3_sb017 then
    exact s084_t3_sb017_certificateData
  else if h18 : i = .s084_t3_sb018 then
    exact s084_t3_sb018_certificateData
  else if h19 : i = .s084_t3_sb019 then
    exact s084_t3_sb019_certificateData
  else if h20 : i = .s084_t3_sb020 then
    exact s084_t3_sb020_certificateData
  else if h21 : i = .s084_t3_sb021 then
    exact s084_t3_sb021_certificateData
  else if h22 : i = .s084_t3_sb022 then
    exact s084_t3_sb022_certificateData
  else if h23 : i = .s084_t3_sb023 then
    exact s084_t3_sb023_certificateData
  else if h24 : i = .s084_t3_sb024 then
    exact s084_t3_sb024_certificateData
  else if h25 : i = .s084_t3_sb025 then
    exact s084_t3_sb025_certificateData
  else if h26 : i = .s084_t3_sb026 then
    exact s084_t3_sb026_certificateData
  else if h27 : i = .s084_t3_sb027 then
    exact s084_t3_sb027_certificateData
  else if h28 : i = .s084_t3_sb028 then
    exact s084_t3_sb028_certificateData
  else if h29 : i = .s084_t3_sb029 then
    exact s084_t3_sb029_certificateData
  else if h30 : i = .s084_t3_sb030 then
    exact s084_t3_sb030_certificateData
  else if h31 : i = .s084_t3_sb031 then
    exact s084_t3_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T3
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
