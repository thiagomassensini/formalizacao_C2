# Audit Projected J0 Raw Enclosure Batch Check M D0 All

Rota: Genuine-First.

Esta rodada recomputou em modo strict os retangulos brutos dos objetos criticos
`M,D0` em todas as 771 subcaixas do positive-box setorial.

## Comando Final

```bash
python3 operadores/c2_projected_j0_raw_enclosure_batch_checker.py \
  --subbox-cert-dir audit_outputs/projected_j0_positive_box_sector_subbox_certificate/ \
  --objects M,D0 \
  --all-subboxes \
  --batch-size 25 \
  --workers 56 \
  --resume \
  --only-missing-batches \
  --out-dir audit_outputs/projected_j0_raw_enclosure_batches/M_D0_all \
  --summary-json audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_all.json \
  --summary-csv audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_all.csv \
  --report-md AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_M_D0_ALL.md \
  --report-title "Audit Projected J0 Raw Enclosure Batch Check M D0 All" \
  --report-note "Rodada completa strict para todas as subcaixas, objetos M,D0. Relancada com workers=56 e resume apos smoke paralelo." \
  --interval-dps 80 \
  --inflate 1e-14 \
  --mode strict
```

Observacao operacional: a primeira tentativa com 4 workers gravou os batches
000-003. Depois a rodada foi relancada com `--workers 56 --resume
--only-missing-batches`, preservando os checkpoints concluidos.

## Resultado

- Status: `pass`
- Boxes checados: 27
- Subcaixas checadas: 771
- Objetos checados: 1542
- Contains: 1542
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Failed batches: none
- Missing batches: none
- Batch `.done`: 31/31
- Max width ratio: 0.9999999355595678
- Worst subbox: `s0.84_t0__s00_t000:D0`
- Tempo final relancado: 506.37s
- Workers finais: 56

## Setor Strict M,D0

O script recomputou, por subcaixa, `D0NegReMain_upper_strict` a partir dos
retangulos strict de `M` e `D0`.

- Subcaixas com D0 upper strict: 771
- Subcaixas strict nondestructive: 771
- Boxes com D0 upper strict: 27
- Boxes strict nondestructive: 27
- Max D0NegReMain upper strict: -0.00019368050160660985
- Max D0NegReMain upper stored: -0.00019368049701349772
- Max D0NegReMain upper rationalized: -0.000193680497
- Worst box strict: `s0.86_t0`

Conclusao setorial: todas as 771 subcaixas preservam
`D0NegReMain_upper_strict <= 0`. Nao houve caso `strict_inflation_sector_unknown`.

## Speedup

Referencias:

- Parcial serial: 50 subcaixas em 799.09s.
- Smoke paralelo 4 workers: 50 subcaixas em 314.49s.
- Rodada completa com 56 workers: 771 subcaixas em 506.37s no relancamento
  final, apos reaproveitar 4 batches concluidos.

Leitura: o paralelismo por batch tornou a rodada completa viavel. O tempo
comparavel por subcaixa no relancamento final nao deve ser lido como custo
serial; ele mede wall-clock com batches simultaneos.

## Respostas

1. A rodada completa foi executada: sim.
2. Subcaixas: 771.
3. Objetos: 1542 (`M` e `D0`).
4. Contains/strict_wider/inconclusive/disjoint_fail: 1542/0/0/0.
5. Algum disjoint_fail: nao.
6. O setor `D0NegReMain <= 0` foi confirmado por recomputacao strict em todas
   as subcaixas.
7. Maior D0NegReMain upper strict: -0.00019368050160660985.
8. Pior box strict: `s0.86_t0`; pior subbox por width ratio:
   `s0.84_t0__s00_t000:D0`.
9. Tempo total final: 506.37s com workers=56.
10. A cadeia fast/sub32 fica reforcada para os objetos criticos `M,D0`.

## Limite

Esta auditoria ainda e externa ao kernel Lean. Ela confirma que os retangulos
armazenados contem a recomputacao strict independente para `M,D0`; nao
formaliza as enclosures analiticas em Lean.
