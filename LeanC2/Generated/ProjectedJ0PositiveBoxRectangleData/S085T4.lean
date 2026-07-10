import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t4

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
namespace S085T4

open ProjectedJ0RectangleArithmetic

def s085_t4_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1729847015909573 : ℚ) / 500000000000000000)
              hi := ((8058510031616293 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3315910294617033 : ℚ) / 50000000000000000)
              hi := ((-1930188595139333 : ℚ) / 31250000000000000) } }
  D0Rect :=
    { re := { lo := ((835316292011143 : ℚ) / 100000000000000000)
              hi := ((97640240649907 : ℚ) / 10000000000000000) }
      im := { lo := ((-6269830932309387 : ℚ) / 1000000000000000000)
              hi := ((-4861149158710099 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12605145526433889 : ℚ) / 10000000000000000000)
              hi := ((-284478954117443 : ℚ) / 500000000000000000) }
      im := { lo := ((3732701457163231 : ℚ) / 2000000000000000000)
              hi := ((25580403634207723 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1045438288577713 : ℚ) / 1250000000000000000)
              hi := ((2461695752407 : ℚ) / 3906250000000000) }
      im := { lo := ((-31886599595558893 : ℚ) / 100000000000000000000)
              hi := ((1102283546039349 : ℚ) / 1000000000000000000) } }
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

def s085_t4_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3466992109878789 : ℚ) / 1000000000000000000)
              hi := ((8065723303294471 : ℚ) / 1000000000000000000) }
      im := { lo := ((-207195257005091 : ℚ) / 3125000000000000)
              hi := ((-771880321705517 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((2086428756506207 : ℚ) / 250000000000000000)
              hi := ((304886118994533 : ℚ) / 31250000000000000) }
      im := { lo := ((-3140960468419109 : ℚ) / 500000000000000000)
              hi := ((-4873486105599711 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2514732188572127 : ℚ) / 2000000000000000000)
              hi := ((-5658391750387327 : ℚ) / 10000000000000000000) }
      im := { lo := ((18676675338907297 : ℚ) / 10000000000000000000)
              hi := ((1599580796829063 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1672447429952381 : ℚ) / 2000000000000000000)
              hi := ((6303069155125689 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31884258538350367 : ℚ) / 100000000000000000000)
              hi := ((2755683206380007 : ℚ) / 2500000000000000000) } }
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

def s085_t4_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1389723910493197 : ℚ) / 400000000000000000)
              hi := ((8072956000959173 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6628677059389683 : ℚ) / 100000000000000000)
              hi := ((-6173482771184419 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((416912510353581 : ℚ) / 50000000000000000)
              hi := ((609291970324827 : ℚ) / 62500000000000000) }
      im := { lo := ((-2517600482655517 : ℚ) / 400000000000000000)
              hi := ((-610726533421267 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-250843200417339 : ℚ) / 200000000000000000)
              hi := ((-1406795917097353 : ℚ) / 2500000000000000000) }
      im := { lo := ((2336224607024543 : ℚ) / 1250000000000000000)
              hi := ((5121227941289129 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8360964103907723 : ℚ) / 10000000000000000000)
              hi := ((6304192530215489 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1275276580581983 : ℚ) / 4000000000000000000)
              hi := ((1377828729010947 : ℚ) / 1250000000000000000) } }
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

def s085_t4_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1392658796645011 : ℚ) / 400000000000000000)
              hi := ((4040104075857253 : ℚ) / 500000000000000000) }
      im := { lo := ((-6627107002537207 : ℚ) / 100000000000000000)
              hi := ((-192872631060197 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((8330769050410747 : ℚ) / 1000000000000000000)
              hi := ((4870485339059311 : ℚ) / 500000000000000000) }
      im := { lo := ((-12612142248132393 : ℚ) / 2000000000000000000)
              hi := ((-2449064103590197 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6255320007165741 : ℚ) / 5000000000000000000)
              hi := ((-2797978879356319 : ℚ) / 5000000000000000000) }
      im := { lo := ((467571865835447 : ℚ) / 250000000000000000)
              hi := ((512378833313623 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1044961639558483 : ℚ) / 1250000000000000000)
              hi := ((6305317196315791 : ℚ) / 10000000000000000000) }
      im := { lo := ((-796988322813503 : ℚ) / 2500000000000000000)
              hi := ((5511261509662587 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((17445011421841573 : ℚ) / 5000000000000000000)
              hi := ((4043740594697599 : ℚ) / 500000000000000000) }
      im := { lo := ((-1656384537695811 : ℚ) / 25000000000000000)
              hi := ((-6170366753906063 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8323270985693723 : ℚ) / 1000000000000000000)
              hi := ((38020522920027 : ℚ) / 3906250000000000) }
      im := { lo := ((-157953263126309 : ℚ) / 25000000000000000)
              hi := ((-4910434046953867 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-48746491602087 : ℚ) / 39062500000000000)
              hi := ((-222588528870681 : ℚ) / 400000000000000000) }
      im := { lo := ((9357953670932371 : ℚ) / 5000000000000000000)
              hi := ((25631699911313247 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8358429821573417 : ℚ) / 10000000000000000000)
              hi := ((15766121972631 : ℚ) / 25000000000000000) }
      im := { lo := ((-398464390975441 : ℚ) / 1250000000000000000)
              hi := ((2204483229165171 : ℚ) / 2000000000000000000) } }
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

def s085_t4_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((17481877590699603 : ℚ) / 5000000000000000000)
              hi := ((8094775216965189 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1324794098902721 : ℚ) / 20000000000000000)
              hi := ((-308440523210283 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((8315756393313771 : ℚ) / 1000000000000000000)
              hi := ((4862760361881841 : ℚ) / 500000000000000000) }
      im := { lo := ((-633018008191 : ℚ) / 100000000000000)
              hi := ((-2461364534193009 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12447546686845023 : ℚ) / 10000000000000000000)
              hi := ((-5533448994848797 : ℚ) / 10000000000000000000) }
      im := { lo := ((2341111810251853 : ℚ) / 1250000000000000000)
              hi := ((16027759290199 : ℚ) / 6250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8357176763592221 : ℚ) / 10000000000000000000)
              hi := ((6307589855163027 : ℚ) / 10000000000000000000) }
      im := { lo := ((-637494492416087 : ℚ) / 2000000000000000000)
              hi := ((5511152356642017 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3503768649436689 : ℚ) / 1000000000000000000)
              hi := ((8102088247304701 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6622404055262017 : ℚ) / 100000000000000000)
              hi := ((-6167255297114503 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1661645185223123 : ℚ) / 200000000000000000)
              hi := ((9717770637658947 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6342219366224463 : ℚ) / 1000000000000000000)
              hi := ((-4935013661716791 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12415972115929147 : ℚ) / 10000000000000000000)
              hi := ((-5502167632891767 : ℚ) / 10000000000000000000) }
      im := { lo := ((4685459665503587 : ℚ) / 2500000000000000000)
              hi := ((12828541947992869 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2088980616603237 : ℚ) / 2500000000000000000)
              hi := ((788591114923941 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3187234412672963 : ℚ) / 10000000000000000000)
              hi := ((688887364701739 : ℚ) / 625000000000000000) } }
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

def s085_t4_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((35111820447336997 : ℚ) / 10000000000000000000)
              hi := ((810941996382621 : ℚ) / 100000000000000000) }
      im := { lo := ((-662083873969619 : ℚ) / 10000000000000000)
              hi := ((-12331402725599791 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((259396231456611 : ℚ) / 31250000000000000)
              hi := ((4855001899041711 : ℚ) / 500000000000000000) }
      im := { lo := ((-794281031346879 : ℚ) / 125000000000000000)
              hi := ((-19789151596953 : ℚ) / 4000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1548047288834639 : ℚ) / 1250000000000000000)
              hi := ((-5470869071934547 : ℚ) / 10000000000000000000) }
      im := { lo := ((1875473954548347 : ℚ) / 1000000000000000000)
              hi := ((2566970724940663 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4177332932453663 : ℚ) / 5000000000000000000)
              hi := ((3154932456864407 : ℚ) / 5000000000000000000) }
      im := { lo := ((-796748648594353 : ℚ) / 2500000000000000000)
              hi := ((1377761141781063 : ℚ) / 1250000000000000000) } }
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

def s085_t4_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3518614917966579 : ℚ) / 1000000000000000000)
              hi := ((2029192776396133 : ℚ) / 250000000000000000) }
      im := { lo := ((-6619274580160167 : ℚ) / 100000000000000000)
              hi := ((-3082074314635833 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4146558408655821 : ℚ) / 500000000000000000)
              hi := ((4851110131705131 : ℚ) / 500000000000000000) }
      im := { lo := ((-6366266390679209 : ℚ) / 1000000000000000000)
              hi := ((-1239888021548649 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2470552905491807 : ℚ) / 2000000000000000000)
              hi := ((-1359888549665303 : ℚ) / 2500000000000000000) }
      im := { lo := ((4691899428239647 : ℚ) / 2500000000000000000)
              hi := ((642057107940951 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1670682389672131 : ℚ) / 2000000000000000000)
              hi := ((1577750707320423 : ℚ) / 2500000000000000000) }
      im := { lo := ((-318675532717217 : ℚ) / 1000000000000000000)
              hi := ((1377747616146591 : ℚ) / 1250000000000000000) } }
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

def s085_t4_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((176303235430203 : ℚ) / 50000000000000000)
              hi := ((8124144072072287 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3308855880249107 : ℚ) / 50000000000000000)
              hi := ((-770324614695493 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((414276864721937 : ℚ) / 50000000000000000)
              hi := ((9694420926189513 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6378273834991837 : ℚ) / 1000000000000000000)
              hi := ((-994361227319971 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1232113289470281 : ℚ) / 1000000000000000000)
              hi := ((-2704110500788823 : ℚ) / 5000000000000000000) }
      im := { lo := ((1173775661131721 : ℚ) / 625000000000000000)
              hi := ((513896353000673 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4176085083033043 : ℚ) / 5000000000000000000)
              hi := ((19725475388311 : ℚ) / 31250000000000000) }
      im := { lo := ((-199157699973231 : ℚ) / 625000000000000000)
              hi := ((8817503848511 : ℚ) / 8000000000000000) } }
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

def s085_t4_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3533532956562123 : ℚ) / 1000000000000000000)
              hi := ((8131537538331703 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3308075142698557 : ℚ) / 50000000000000000)
              hi := ((-3080523113116513 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1655588176325621 : ℚ) / 200000000000000000)
              hi := ((1937321153905901 : ℚ) / 200000000000000000) }
      im := { lo := ((-1597567732464507 : ℚ) / 250000000000000000)
              hi := ((-4984049649233217 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6144742223312751 : ℚ) / 5000000000000000000)
              hi := ((-67210857296793 : ℚ) / 125000000000000000) }
      im := { lo := ((9396588692192531 : ℚ) / 5000000000000000000)
              hi := ((6426826982427117 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1043866208369303 : ℚ) / 1250000000000000000)
              hi := ((6313301934643759 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6372599581270389 : ℚ) / 20000000000000000000)
              hi := ((11021787356847563 : ℚ) / 10000000000000000000) } }
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

def s085_t4_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((35410197765587807 : ℚ) / 10000000000000000000)
              hi := ((813895114337011 : ℚ) / 100000000000000000) }
      im := { lo := ((-3307294991237239 : ℚ) / 50000000000000000)
              hi := ((-12318993467111189 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((4135164147437311 : ℚ) / 500000000000000000)
              hi := ((1935754820128189 : ℚ) / 200000000000000000) }
      im := { lo := ((-6402257686354977 : ℚ) / 1000000000000000000)
              hi := ((-4996282572937037 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2451563562745221 : ℚ) / 2000000000000000000)
              hi := ((-267274921303483 : ℚ) / 500000000000000000) }
      im := { lo := ((18805899983247857 : ℚ) / 10000000000000000000)
              hi := ((3214969156756281 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8349696466553883 : ℚ) / 10000000000000000000)
              hi := ((3157229145086913 : ℚ) / 5000000000000000000) }
      im := { lo := ((-15930365455447227 : ℚ) / 50000000000000000000)
              hi := ((5510845780714057 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1774263489551541 : ℚ) / 500000000000000000)
              hi := ((1629276642174209 : ℚ) / 200000000000000000) }
      im := { lo := ((-6613030796478109 : ℚ) / 100000000000000000)
              hi := ((-1539487123540459 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1652539941834457 : ℚ) / 200000000000000000)
              hi := ((4835462884057909 : ℚ) / 500000000000000000) }
      im := { lo := ((-6414233750924497 : ℚ) / 1000000000000000000)
              hi := ((-5008505222521137 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-24452263557159 : ℚ) / 20000000000000000)
              hi := ((-5314111856459273 : ℚ) / 10000000000000000000) }
      im := { lo := ((3763715903786461 : ℚ) / 2000000000000000000)
              hi := ((3216519053889377 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4174230035833927 : ℚ) / 5000000000000000000)
              hi := ((6315610689589637 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31858449877992373 : ℚ) / 100000000000000000000)
              hi := ((11021594309125909 : ℚ) / 10000000000000000000) } }
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

def s085_t4_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1111267074972503 : ℚ) / 312500000000000000)
              hi := ((8153833594239981 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1322294554389933 : ℚ) / 20000000000000000)
              hi := ((-12312802962368083 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((8255055183119553 : ℚ) / 1000000000000000000)
              hi := ((2415765188587137 : ℚ) / 250000000000000000) }
      im := { lo := ((-6426199108665163 : ℚ) / 1000000000000000000)
              hi := ((-5020717560463539 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6097213185247781 : ℚ) / 5000000000000000000)
              hi := ((-5282709005630961 : ℚ) / 10000000000000000000) }
      im := { lo := ((18831216048345743 : ℚ) / 10000000000000000000)
              hi := ((8238241713423 : ℚ) / 3200000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8347219023000231 : ℚ) / 10000000000000000000)
              hi := ((6316757676386441 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31856183556612343 : ℚ) / 100000000000000000000)
              hi := ((11021498483318373 : ℚ) / 10000000000000000000) } }
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

def s085_t4_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((890900597424693 : ℚ) / 250000000000000000)
              hi := ((32645210548197 : ℚ) / 4000000000000000) }
      im := { lo := ((-103279934755867 : ℚ) / 1562500000000000)
              hi := ((-6154855769615613 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4123696898431337 : ℚ) / 500000000000000000)
              hi := ((9655180001512787 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1609538356469299 : ℚ) / 250000000000000000)
              hi := ((-2516459940772817 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3040675692832039 : ℚ) / 2500000000000000000)
              hi := ((-131282219996763 : ℚ) / 250000000000000000) }
      im := { lo := ((235547595605367 : ℚ) / 125000000000000000)
              hi := ((12878406949125441 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8345973121524313 : ℚ) / 10000000000000000000)
              hi := ((6317899053207527 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1274154930346349 : ℚ) / 4000000000000000000)
              hi := ((551069910416449 : ℚ) / 500000000000000000) } }
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

def s085_t4_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((446396285088639 : ℚ) / 125000000000000000)
              hi := ((4084395131573591 : ℚ) / 500000000000000000) }
      im := { lo := ((-6608360012159417 : ℚ) / 100000000000000000)
              hi := ((-6153311312709381 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2059929062318797 : ℚ) / 250000000000000000)
              hi := ((1205910355605927 : ℚ) / 125000000000000000) }
      im := { lo := ((-12900193412208237 : ℚ) / 2000000000000000000)
              hi := ((-25225560681843163 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12130959660144763 : ℚ) / 10000000000000000000)
              hi := ((-5219852699088497 : ℚ) / 10000000000000000000) }
      im := { lo := ((18856356122131327 : ℚ) / 10000000000000000000)
              hi := ((25769076212478407 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8344724284060657 : ℚ) / 10000000000000000000)
              hi := ((98734949021667 : ℚ) / 156250000000000000) }
      im := { lo := ((-1592578197295173 : ℚ) / 5000000000000000000)
              hi := ((55106489927811 : ℚ) / 50000000000000000) } }
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

def s085_t4_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1431502899920639 : ℚ) / 400000000000000000)
              hi := ((8176297504047001 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3303402686591747 : ℚ) / 50000000000000000)
              hi := ((-3075884037152291 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((257250694452529 : ℚ) / 31250000000000000)
              hi := ((301230301081229 : ℚ) / 31250000000000000) }
      im := { lo := ((-6462029106054681 : ℚ) / 1000000000000000000)
              hi := ((-126432353204809 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12099198304703017 : ℚ) / 10000000000000000000)
              hi := ((-5188399563275309 : ℚ) / 10000000000000000000) }
      im := { lo := ((18868860147550999 : ℚ) / 10000000000000000000)
              hi := ((51562587161897 : ℚ) / 20000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1668695497281753 : ℚ) / 2000000000000000000)
              hi := ((632017570597349 : ℚ) / 1000000000000000000) }
      im := { lo := ((-15924623247960703 : ℚ) / 50000000000000000000)
              hi := ((1102119690246103 : ℚ) / 1000000000000000000) } }
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

def s085_t4_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((17931821289121337 : ℚ) / 5000000000000000000)
              hi := ((8183823402594053 : ℚ) / 1000000000000000000) }
      im := { lo := ((-330262590699501 : ℚ) / 5000000000000000)
              hi := ((-6150226153177953 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4112156009719251 : ℚ) / 500000000000000000)
              hi := ((300982502333853 : ℚ) / 31250000000000000) }
      im := { lo := ((-80924382288243 : ℚ) / 12500000000000000)
              hi := ((-2534732924655007 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12067418061321507 : ℚ) / 10000000000000000000)
              hi := ((-2578465065719233 : ℚ) / 5000000000000000000) }
      im := { lo := ((4720330136115971 : ℚ) / 2500000000000000000)
              hi := ((3224183136602417 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4171114727686943 : ℚ) / 5000000000000000000)
              hi := ((1580328171536839 : ℚ) / 2500000000000000000) }
      im := { lo := ((-318468753673033 : ℚ) / 1000000000000000000)
              hi := ((2204218081263473 : ℚ) / 2000000000000000000) } }
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

def s085_t4_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1796995515771313 : ℚ) / 500000000000000000)
              hi := ((8191368199742557 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6603699359810113 : ℚ) / 100000000000000000)
              hi := ((-12297371056882317 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1604801766407 : ℚ) / 195312500000000)
              hi := ((4811747405148767 : ℚ) / 500000000000000000) }
      im := { lo := ((-12971722243204857 : ℚ) / 2000000000000000000)
              hi := ((-2540813635924583 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3008905089531227 : ℚ) / 2500000000000000000)
              hi := ((-5125443138110733 : ℚ) / 10000000000000000000) }
      im := { lo := ((3778747114216617 : ℚ) / 2000000000000000000)
              hi := ((6451398117022991 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-521311140590823 : ℚ) / 625000000000000000)
              hi := ((1264489147364417 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6368891198077481 : ℚ) / 20000000000000000000)
              hi := ((2204195808201771 : ℚ) / 2000000000000000000) } }
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

def s085_t4_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((36016377058268683 : ℚ) / 10000000000000000000)
              hi := ((512433233005203 : ℚ) / 62500000000000000) }
      im := { lo := ((-6602148053800763 : ℚ) / 100000000000000000)
              hi := ((-30735730801133187 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((8208841437918753 : ℚ) / 1000000000000000000)
              hi := ((2403883430680149 : ℚ) / 250000000000000000) }
      im := { lo := ((-50763756785221 : ℚ) / 7812500000000000)
              hi := ((-10187556418433533 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12003805431600853 : ℚ) / 10000000000000000000)
              hi := ((-5093938457343049 : ℚ) / 10000000000000000000) }
      im := { lo := ((236326315048531 : ℚ) / 125000000000000000)
              hi := ((1290883784002981 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2084930583531231 : ℚ) / 2500000000000000000)
              hi := ((6323573325165643 : ℚ) / 10000000000000000000) }
      im := { lo := ((-796050372500333 : ℚ) / 2500000000000000000)
              hi := ((2755216365180679 : ℚ) / 2500000000000000000) } }
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

def s085_t4_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7218609123163613 : ℚ) / 2000000000000000000)
              hi := ((2051628423982143 : ℚ) / 250000000000000000) }
      im := { lo := ((-330029897287319 : ℚ) / 5000000000000000)
              hi := ((-6145608007623769 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8201081928503863 : ℚ) / 1000000000000000000)
              hi := ((9607556111478191 : ℚ) / 1000000000000000000) }
      im := { lo := ((-325482484223603 : ℚ) / 50000000000000000)
              hi := ((-5105918755535409 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5985985745283667 : ℚ) / 5000000000000000000)
              hi := ((-2531209002678097 : ℚ) / 5000000000000000000) }
      im := { lo := ((591200988779513 : ℚ) / 312500000000000000)
              hi := ((645742811882633 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8338462441781377 : ℚ) / 10000000000000000000)
              hi := ((1264939236749357 : ℚ) / 2000000000000000000) }
      im := { lo := ((-31839604774057807 : ℚ) / 100000000000000000000)
              hi := ((1102075493688057 : ℚ) / 1000000000000000000) } }
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

def s085_t4_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((361699143354637 : ℚ) / 100000000000000000)
              hi := ((8214114229624843 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3299524476596327 : ℚ) / 50000000000000000)
              hi := ((-3072035576381459 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8193306295879409 : ℚ) / 1000000000000000000)
              hi := ((1919912445996037 : ℚ) / 200000000000000000) }
      im := { lo := ((-6521527701241789 : ℚ) / 1000000000000000000)
              hi := ((-1279512184402267 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1194011952994561 : ℚ) / 1000000000000000000)
              hi := ((-5030880919077827 : ℚ) / 10000000000000000000) }
      im := { lo := ((18930713881120619 : ℚ) / 10000000000000000000)
              hi := ((2584170381593417 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8337200167480653 : ℚ) / 10000000000000000000)
              hi := ((1265163181859963 : ℚ) / 2000000000000000000) }
      im := { lo := ((-15918575510973703 : ℚ) / 50000000000000000000)
              hi := ((551032000441541 : ℚ) / 500000000000000000) } }
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

def s085_t4_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3624698100165953 : ℚ) / 1000000000000000000)
              hi := ((4110866775350659 : ℚ) / 500000000000000000) }
      im := { lo := ((-3298750539498889 : ℚ) / 50000000000000000)
              hi := ((-1535633899524259 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1023189234366353 : ℚ) / 125000000000000000)
              hi := ((959155276380531 : ℚ) / 100000000000000000) }
      im := { lo := ((-1306678959154837 : ℚ) / 200000000000000000)
              hi := ((-32063551459247 : ℚ) / 6250000000000000) } }
  DrestRect :=
    { re := { lo := ((-5954125387178001 : ℚ) / 5000000000000000000)
              hi := ((-1249831521684507 : ℚ) / 2500000000000000000) }
      im := { lo := ((3788590047501237 : ℚ) / 2000000000000000000)
              hi := ((5170730265287699 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2083983409049367 : ℚ) / 2500000000000000000)
              hi := ((1581732656669567 : ℚ) / 2500000000000000000) }
      im := { lo := ((-254677185217089 : ℚ) / 800000000000000000)
              hi := ((2755130032234377 : ℚ) / 2500000000000000000) } }
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

def s085_t4_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((36324251348855917 : ℚ) / 10000000000000000000)
              hi := ((8229371075393063 : ℚ) / 1000000000000000000) }
      im := { lo := ((-263838173223213 : ℚ) / 4000000000000000)
              hi := ((-1535250335809153 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4088852700801047 : ℚ) / 500000000000000000)
              hi := ((191670540294677 : ℚ) / 20000000000000000) }
      im := { lo := ((-3272625356821297 : ℚ) / 500000000000000000)
              hi := ((-2571138726314619 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-742272694757371 : ℚ) / 625000000000000000)
              hi := ((-1241938940168359 : ℚ) / 2500000000000000000) }
      im := { lo := ((18955143172551979 : ℚ) / 10000000000000000000)
              hi := ((646638812600007 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4167331245476999 : ℚ) / 5000000000000000000)
              hi := ((3164019989293319 : ℚ) / 5000000000000000000) }
      im := { lo := ((-15916065532444457 : ℚ) / 50000000000000000000)
              hi := ((551019939483351 : ℚ) / 500000000000000000) } }
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

def s085_t4_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1820085807135867 : ℚ) / 500000000000000000)
              hi := ((514814227086301 : ℚ) / 62500000000000000) }
      im := { lo := ((-1648602195362673 : ℚ) / 25000000000000000)
              hi := ((-12278936630085413 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((8169880778461409 : ℚ) / 1000000000000000000)
              hi := ((9575485110595151 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6557095560361191 : ℚ) / 1000000000000000000)
              hi := ((-2577188120780547 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2368891444396063 : ℚ) / 2000000000000000000)
              hi := ((-4936169409032171 : ℚ) / 10000000000000000000) }
      im := { lo := ((1896729206899039 : ℚ) / 1000000000000000000)
              hi := ((3234675988850303 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8333390818048771 : ℚ) / 10000000000000000000)
              hi := ((6329148056450051 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3182962595083771 : ℚ) / 10000000000000000000)
              hi := ((2755069652194047 : ℚ) / 2500000000000000000) } }
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

def s085_t4_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9119845432820267 : ℚ) / 2500000000000000000)
              hi := ((8244702632396779 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3296432196373001 : ℚ) / 50000000000000000)
              hi := ((-3068968280144463 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2040510072411253 : ℚ) / 250000000000000000)
              hi := ((9567426783327927 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2627572090746777 : ℚ) / 400000000000000000)
              hi := ((-5166463669808973 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5906267537005871 : ℚ) / 5000000000000000000)
              hi := ((-153267660841379 : ℚ) / 312500000000000000) }
      im := { lo := ((18979395712110283 : ℚ) / 10000000000000000000)
              hi := ((6472304675601301 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4166057871459441 : ℚ) / 5000000000000000000)
              hi := ((1582562995785651 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3182706908855627 : ℚ) / 10000000000000000000)
              hi := ((5510076608728873 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3655724792636477 : ℚ) / 1000000000000000000)
              hi := ((8252396056414547 : ℚ) / 1000000000000000000) }
      im := { lo := ((-659132119088393 : ℚ) / 10000000000000000)
              hi := ((-1534101513662447 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4077091951304953 : ℚ) / 500000000000000000)
              hi := ((9559352118345313 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6580754756413739 : ℚ) / 1000000000000000000)
              hi := ((-1294634915929669 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-184071828730017 : ℚ) / 156250000000000000)
              hi := ((-12182356901075941 : ℚ) / 25000000000000000000) }
      im := { lo := ((14837073294987 : ℚ) / 7812500000000000)
              hi := ((12950492584946013 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8330836321838363 : ℚ) / 10000000000000000000)
              hi := ((63313508152857 : ℚ) / 100000000000000000) }
      im := { lo := ((-3182447563637767 : ℚ) / 10000000000000000000)
              hi := ((5510012065838279 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4579413725295973 : ℚ) / 1250000000000000000)
              hi := ((516256772708819 : ℚ) / 62500000000000000) }
      im := { lo := ((-411861198410339 : ℚ) / 6250000000000000)
              hi := ((-6134876805386031 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8146311721526163 : ℚ) / 1000000000000000000)
              hi := ((1910252202458159 : ℚ) / 200000000000000000) }
      im := { lo := ((-2637027337754309 : ℚ) / 400000000000000000)
              hi := ((-5190604965783511 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11748640799465581 : ℚ) / 10000000000000000000)
              hi := ((-48413046667155393 : ℚ) / 100000000000000000000) }
      im := { lo := ((9501734135432153 : ℚ) / 5000000000000000000)
              hi := ((161954408174679 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8329557403369461 : ℚ) / 10000000000000000000)
              hi := ((1583112351138089 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3182187354921787 : ℚ) / 10000000000000000000)
              hi := ((5509947074154129 : ℚ) / 5000000000000000000) } }
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

def s085_t4_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((18356774534160627 : ℚ) / 5000000000000000000)
              hi := ((8267841427267587 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3294119189085397 : ℚ) / 50000000000000000)
              hi := ((-15333371962523849 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((1017302942132521 : ℚ) / 125000000000000000)
              hi := ((4771576862241729 : ℚ) / 500000000000000000) }
      im := { lo := ((-1651092688546503 : ℚ) / 250000000000000000)
              hi := ((-2601329887037683 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-585833316690689 : ℚ) / 500000000000000000)
              hi := ((-300603190406263 : ℚ) / 625000000000000000) }
      im := { lo := ((19015438881754563 : ℚ) / 10000000000000000000)
              hi := ((1036975171807189 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-416414547385963 : ℚ) / 500000000000000000)
              hi := ((1583389926741779 : ℚ) / 2500000000000000000) }
      im := { lo := ((-497175817986151 : ℚ) / 1562500000000000000)
              hi := ((2754940555544659 : ℚ) / 2500000000000000000) } }
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

def s085_t4_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4598991875584063 : ℚ) / 1250000000000000000)
              hi := ((4137799114043211 : ℚ) / 500000000000000000) }
      im := { lo := ((-3293349480472991 : ℚ) / 50000000000000000)
              hi := ((-245272873246361 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((8130519196161251 : ℚ) / 1000000000000000000)
              hi := ((4767515209939709 : ℚ) / 500000000000000000) }
      im := { lo := ((-3308080966779563 : ℚ) / 500000000000000000)
              hi := ((-10429408196666311 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5842336971219231 : ℚ) / 5000000000000000000)
              hi := ((-1194495423318947 : ℚ) / 2500000000000000000) }
      im := { lo := ((1902736524036419 : ℚ) / 1000000000000000000)
              hi := ((1296800373602227 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-32527558001567 : ℚ) / 39062500000000000)
              hi := ((6334699622075479 : ℚ) / 10000000000000000000) }
      im := { lo := ((-795416534503203 : ℚ) / 2500000000000000000)
              hi := ((11019633284218863 : ℚ) / 10000000000000000000) } }
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

def s085_t4_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((737409917401221 : ℚ) / 200000000000000000)
              hi := ((4141687888450247 : ℚ) / 500000000000000000) }
      im := { lo := ((-6585160792219673 : ℚ) / 100000000000000000)
              hi := ((-12260592171980833 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1624519724569851 : ℚ) / 200000000000000000)
              hi := ((4763445614187697 : ℚ) / 500000000000000000) }
      im := { lo := ((-662794220118217 : ℚ) / 100000000000000000)
              hi := ((-4083388732367 : ℚ) / 781250000000000) } }
  DrestRect :=
    { re := { lo := ((-11652664873978789 : ℚ) / 10000000000000000000)
              hi := ((-4746295528714237 : ℚ) / 10000000000000000000) }
      im := { lo := ((19039246325841099 : ℚ) / 10000000000000000000)
              hi := ((5189518169136707 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-832582985417123 : ℚ) / 1000000000000000000)
              hi := ((3167924953112533 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31814047841444983 : ℚ) / 100000000000000000000)
              hi := ((11019502060270023 : ℚ) / 10000000000000000000) } }
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

def s085_t4_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((61398995541 : ℚ) / 1000000000000)
      ((-329153297 : ℚ) / 1000000000000)
      ((4218390063 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((18474629173616693 : ℚ) / 5000000000000000000)
              hi := ((8291171639231527 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3291811896617261 : ℚ) / 50000000000000000)
              hi := ((-6128771635942113 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4057331168364651 : ℚ) / 500000000000000000)
              hi := ((1189841955034807 : ℚ) / 125000000000000000) }
      im := { lo := ((-1659927901701741 : ℚ) / 250000000000000000)
              hi := ((-1309690030777627 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5810319130548937 : ℚ) / 5000000000000000000)
              hi := ((-23572967527460813 : ℚ) / 50000000000000000000) }
      im := { lo := ((2381385423404231 : ℚ) / 1250000000000000000)
              hi := ((64897820254559 : ℚ) / 25000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8324601646404667 : ℚ) / 10000000000000000000)
              hi := ((3168498113639277 : ℚ) / 5000000000000000000) }
      im := { lo := ((-159057052276889 : ℚ) / 500000000000000000)
              hi := ((1377421053134421 : ℚ) / 1250000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t4) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t4).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t4).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t4).constants.restUpper) := by
  if h0 : i = .s085_t4_sb000 then
    exact s085_t4_sb000_certificateData
  else if h1 : i = .s085_t4_sb001 then
    exact s085_t4_sb001_certificateData
  else if h2 : i = .s085_t4_sb002 then
    exact s085_t4_sb002_certificateData
  else if h3 : i = .s085_t4_sb003 then
    exact s085_t4_sb003_certificateData
  else if h4 : i = .s085_t4_sb004 then
    exact s085_t4_sb004_certificateData
  else if h5 : i = .s085_t4_sb005 then
    exact s085_t4_sb005_certificateData
  else if h6 : i = .s085_t4_sb006 then
    exact s085_t4_sb006_certificateData
  else if h7 : i = .s085_t4_sb007 then
    exact s085_t4_sb007_certificateData
  else if h8 : i = .s085_t4_sb008 then
    exact s085_t4_sb008_certificateData
  else if h9 : i = .s085_t4_sb009 then
    exact s085_t4_sb009_certificateData
  else if h10 : i = .s085_t4_sb010 then
    exact s085_t4_sb010_certificateData
  else if h11 : i = .s085_t4_sb011 then
    exact s085_t4_sb011_certificateData
  else if h12 : i = .s085_t4_sb012 then
    exact s085_t4_sb012_certificateData
  else if h13 : i = .s085_t4_sb013 then
    exact s085_t4_sb013_certificateData
  else if h14 : i = .s085_t4_sb014 then
    exact s085_t4_sb014_certificateData
  else if h15 : i = .s085_t4_sb015 then
    exact s085_t4_sb015_certificateData
  else if h16 : i = .s085_t4_sb016 then
    exact s085_t4_sb016_certificateData
  else if h17 : i = .s085_t4_sb017 then
    exact s085_t4_sb017_certificateData
  else if h18 : i = .s085_t4_sb018 then
    exact s085_t4_sb018_certificateData
  else if h19 : i = .s085_t4_sb019 then
    exact s085_t4_sb019_certificateData
  else if h20 : i = .s085_t4_sb020 then
    exact s085_t4_sb020_certificateData
  else if h21 : i = .s085_t4_sb021 then
    exact s085_t4_sb021_certificateData
  else if h22 : i = .s085_t4_sb022 then
    exact s085_t4_sb022_certificateData
  else if h23 : i = .s085_t4_sb023 then
    exact s085_t4_sb023_certificateData
  else if h24 : i = .s085_t4_sb024 then
    exact s085_t4_sb024_certificateData
  else if h25 : i = .s085_t4_sb025 then
    exact s085_t4_sb025_certificateData
  else if h26 : i = .s085_t4_sb026 then
    exact s085_t4_sb026_certificateData
  else if h27 : i = .s085_t4_sb027 then
    exact s085_t4_sb027_certificateData
  else if h28 : i = .s085_t4_sb028 then
    exact s085_t4_sb028_certificateData
  else if h29 : i = .s085_t4_sb029 then
    exact s085_t4_sb029_certificateData
  else if h30 : i = .s085_t4_sb030 then
    exact s085_t4_sb030_certificateData
  else if h31 : i = .s085_t4_sb031 then
    exact s085_t4_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T4
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
