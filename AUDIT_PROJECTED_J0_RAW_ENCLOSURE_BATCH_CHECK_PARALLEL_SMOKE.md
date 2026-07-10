# Audit Projected J0 Raw Enclosure Batch Check Parallel Smoke

Rota: Genuine-First.

Este smoke validou o novo paralelismo do batch checker para os objetos
criticos `M,D0`, usando as mesmas 50 subcaixas do parcial serial anterior.

## Comando

```bash
python3 operadores/c2_projected_j0_raw_enclosure_batch_checker.py \
  --subbox-cert-dir audit_outputs/projected_j0_positive_box_sector_subbox_certificate/ \
  --objects M,D0 \
  --max-subboxes 50 \
  --batch-size 10 \
  --workers 4 \
  --out-dir audit_outputs/projected_j0_raw_enclosure_batches/M_D0_parallel_smoke \
  --summary-json audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_parallel_smoke.json \
  --summary-csv audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_parallel_smoke.csv \
  --report-md AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_PARALLEL_SMOKE.md \
  --report-title "Audit Projected J0 Raw Enclosure Batch Check Parallel Smoke" \
  --interval-dps 80 \
  --inflate 1e-14 \
  --mode strict
```

## Resultado

- Status: `pass`
- Boxes checados: 2
- Subcaixas checadas: 50
- Objetos checados: 100
- Contains: 100
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999355595678
- Worst subbox: `s0.84_t0__s00_t000:D0`
- Tempo total: 314.49s
- Tempo por subcaixa: 6.29s
- Workers: 4
- Batches: 5
- Missing batches: none
- Failed batches: none

## Comparacao Com Parcial Serial

Parcial serial anterior:

- Subcaixas: 50
- Objetos: 100
- Contains: 100
- Disjoint fail: 0
- Tempo total: 799.09s
- Tempo por subcaixa: 15.98s

Comparacao:

- Mesmas chaves de linhas no CSV: sim.
- Max diff numerico nos campos recomputados principais: 0.0.
- Speedup aproximado: 2.54x.
- O resultado bate com o parcial serial.

## Setor Recomputado M,D0

- Subcaixas com D0 upper strict: 50
- Subcaixas strict nondestructive: 50
- Boxes com D0 upper strict: 2
- Boxes strict nondestructive: 2
- Max D0NegReMain upper strict: -0.00020839735578166672
- Max D0NegReMain upper stored: -0.00020839735021895822
- Max D0NegReMain upper rationalized: -0.00020839735
- Worst box strict: `s0.84_t0`

## Leitura

O paralelismo por batch e deterministicamente agregavel: cada batch grava
`batch_NNN.json`, `batch_NNN.csv` e `batch_NNN.done`; o resumo final ordena as
linhas por box/subbox/object. O smoke validou `resume`/checkpoint como caminho
seguro para a rodada completa.

## Limite

Este smoke verifica apenas as primeiras 50 subcaixas. A rodada completa `M,D0`
foi executada separadamente no relatorio completo.
