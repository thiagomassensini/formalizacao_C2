#!/usr/bin/env bash
set -e

OUT="regiao_middle_e_cover_extraido.md"
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

echo "# Região middle e cover — extração Lean" >> "$OUT"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 12095 12140 \
  "Definição de c2ExpandedScalarMiddleRegion e cover"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 12140 12205 \
  "Teoremas imediatos usando c2ExpandedScalarMiddleRegion"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14080 14125 \
  "C2CanonicalClosedScaledCoverData e cover canônico"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14110 14145 \
  "cover := c2ExpandedScalarMiddleRegion_cover"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 15155 15185 \
  "MiddleLocalData.toCoverData"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 15205 15240 \
  "TerminalData.toCoverData e mathlibRiemannHypothesis_of_terminalData"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 14960 15005 \
  "Barreira formal local canônica"

grab LeanC2/Analytic/GenuineBulkConcrete.lean 9708 9735 \
  "Barreira residual original"

echo "Gerado: $OUT"
