#!/usr/bin/env bash
set -e

ROOT="${1:-LeanC2}"

echo "=== 1. Ocorrências de GenuineFInfiniteContinuationData ==="
rg -n --glob '*.lean' "GenuineFInfiniteContinuationData" "$ROOT" || true

echo
echo "=== 2. Declarações que RETORNAM GenuineFInfiniteContinuationData ==="
rg -n -U --pcre2 \
"(theorem|lemma|def|noncomputable def)\s+[A-Za-z0-9_'.]+[\s\S]{0,800}:\s*GenuineFInfiniteContinuationData" \
"$ROOT" || true

echo
echo "=== 3. Ocorrências de C2CanonicalClosedScaledLocalData ==="
rg -n --glob '*.lean' "C2CanonicalClosedScaledLocalData" "$ROOT" || true

echo
echo "=== 4. Declarações que RETORNAM C2CanonicalClosedScaledMiddleLocalData ==="
rg -n -U --pcre2 \
"(theorem|lemma|def|noncomputable def)\s+[A-Za-z0-9_'.]+[\s\S]{0,1200}:\s*C2CanonicalClosedScaledMiddleLocalData" \
"$ROOT" || true

echo
echo "=== 5. Declarações que RETORNAM ∀ s, C2CanonicalClosedScaledLocalData ==="
rg -n -U --pcre2 \
"(theorem|lemma|def|noncomputable def)\s+[A-Za-z0-9_'.]+[\s\S]{0,1200}:\s*∀[\s\S]{0,400}C2CanonicalClosedScaledLocalData" \
"$ROOT" || true

echo
echo "=== 6. Endpoints que retornam RiemannHypothesis ==="
rg -n -U --pcre2 \
"(theorem|lemma|def|noncomputable def)\s+[A-Za-z0-9_'.]*RiemannHypothesis[A-Za-z0-9_'.]*[\s\S]{0,1500}:\s*RiemannHypothesis" \
"$ROOT" || true

echo
echo "=== 7. Procura por sorry/admit/axiom/constant ==="
rg -n --glob '*.lean' '\b(sorry|admit|axiom|constant)\b' "$ROOT" || true
