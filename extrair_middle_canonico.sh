#!/usr/bin/env bash
set -e

OUT="middle_canonico_extraido.md"
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

echo "# Middle canônico — extração Lean" >> "$OUT"

grab LeanC2/PeerReview.lean 10 45 \
  "PeerReview: canonicalNearAxisData, canonicalEdgeData e CanonicalMiddleObligation"

grab LeanC2/PeerReview.lean 45 80 \
  "PeerReview: ContinuationTerminalCertificate"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14225 14290 \
  "C2CanonicalClosedScaledLocalData: estrutura local canônica"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14255 14335 \
  "Construtores: of_residualDominance e variantes próximas"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 16235 16415 \
  "Porta pointwise: continuation + bounds separados -> RH"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14440 14510 \
  "toEstimates / ofEstimates / of_mem_scaledRegion"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14955 15035 \
  "Middle regional: middle local em toda a região"

echo "Gerado: $OUT"
