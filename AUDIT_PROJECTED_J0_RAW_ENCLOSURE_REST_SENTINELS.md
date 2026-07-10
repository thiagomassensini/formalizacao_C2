# Audit Projected J0 Raw Enclosure Rest Sentinels

Rota: Genuine-First.

Depois que a rodada completa `M,D0` passou, foi executada uma auditoria
sentinela ampliada para os objetos de resto `Drest,RvecTail`.

## Escopo

Boxes:

```text
s0.84_t7
s0.86_t0
s0.84_t0
s0.84_t1
s0.85_t0
```

Objetos:

```text
Drest
RvecTail
```

Subcaixas checadas: todas as subcaixas desses cinco boxes, totalizando 160.

## Comando

```bash
python3 operadores/c2_projected_j0_raw_enclosure_batch_checker.py \
  --subbox-cert-dir audit_outputs/projected_j0_positive_box_sector_subbox_certificate/ \
  --objects Drest,RvecTail \
  --box-id-list s0.84_t7,s0.86_t0,s0.84_t0,s0.84_t1,s0.85_t0 \
  --batch-size 10 \
  --workers 56 \
  --out-dir audit_outputs/projected_j0_raw_enclosure_batches/rest_sentinels \
  --summary-json audit_outputs/projected_j0_raw_enclosure_rest_sentinels.json \
  --summary-csv audit_outputs/projected_j0_raw_enclosure_rest_sentinels.csv \
  --report-md AUDIT_PROJECTED_J0_RAW_ENCLOSURE_REST_SENTINELS.md \
  --report-title "Audit Projected J0 Raw Enclosure Rest Sentinels" \
  --report-note "Rodada sentinela ampliada para Drest,RvecTail apos M,D0 all passar." \
  --interval-dps 80 \
  --inflate 1e-14 \
  --mode strict
```

## Resultado

- Status: `pass`
- Boxes checados: 5
- Subcaixas checadas: 160
- Objetos checados: 320
- Contains: 320
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Missing batches: none
- Failed batches: none
- Max width ratio: 0.9999999349271238
- Worst subbox: `s0.84_t0__s00_t002:RvecTail`
- Tempo: 174.66s
- Workers: 56

## Leitura

Esta rodada nao substitui um all-rest check. Ela mostra que, nas cinco regioes
sentinela escolhidas, os retangulos armazenados para `Drest` e `RvecTail`
tambem contem as recomputacoes strict independentes.

`RvecTail` foi mantido como vetor complexo; nao foi substituido por soma real
de uppers.

## Limite

A auditoria completa all-rest ainda nao foi rodada. O bloco critical path desta
tarefa foi `M,D0`, porque ele controla diretamente a condicao setorial
`D0NegReMain <= 0`.
