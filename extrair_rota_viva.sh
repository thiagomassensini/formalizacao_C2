#!/usr/bin/env bash
set -e

OUT="rota_viva_extraida.md"
: > "$OUT"

grab () {
  file="$1"
  start="$2"
  end="$3"
  title="$4"

  {
    echo
    echo "## $title"
    echo
    echo '```lean'
    sed -n "${start},${end}p" "$file"
    echo '```'
  } >> "$OUT"
}

grab LeanC2/PeerReview.lean 45 80 \
  "PeerReview: ContinuationTerminalCertificate -> toTerminalData -> RH"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 16180 16240 \
  "Terminal: ofContinuationAndMiddleLocal -> mathlibRiemannHypothesis_of_continuationAndMiddleLocal"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 15220 15240 \
  "TerminalData: mathlibRiemannHypothesis_of_terminalData"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 15170 15200 \
  "MiddleLocalData: RH por middle local canônico"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14080 14110 \
  "Cover canônico -> quartetConcreteCover"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 2718 2750 \
  "quartetConcreteCover -> bulkRegionCover"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 2048 2068 \
  "bulkRegionCover -> cover_offCritical"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 1410 1430 \
  "cover_offCritical -> Roadmap coverData offCriticalIdentity"

grab LeanC2/Roadmap.lean 600 615 \
  "Roadmap: coverData offCriticalIdentity"

grab LeanC2/Route/Transfer.lean 63 80 \
  "Transfer: F nonvanishing offCriticalIdentity -> RiemannHypothesis"

echo "Gerado: $OUT"
