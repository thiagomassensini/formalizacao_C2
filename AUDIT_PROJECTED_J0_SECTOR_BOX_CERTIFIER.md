# Audit Projected J0 Sector Box Certifier

Data: 2026-07-09.

Rota: Genuine-First. Este diagnostico intervalar externo verifica a condicao
setorial:

```text
D0NegReMain = -Re(D0 * conj(M)) <= 0.
```

Quando esta condicao passa, a caixa pode usar:

```text
numeratorUpper = 0
parallelUpper = 0
```

e o budget fica:

```text
mainLower - restUpper > 0.
```

## Script

Criado:

```text
operadores/c2_projected_j0_sector_box_certifier.py
```

O script reutiliza a avaliacao intervalar finita do certifier existente e
emite, por caixa:

```text
d0_neg_re_lower
d0_neg_re_upper
certified_nondestructive
mainNormLowerConst
restUpperCombinedConst
restUpperSeparateConst
sectorBudgetCombined
sectorBudgetSeparate
certified_sector_combined
certified_sector_separate
```

## Rodada Positive-Box Fast Sub8

Comando:

```bash
python3 operadores/c2_projected_j0_sector_box_certifier.py \
  --boxes-csv audit_outputs/c2_projected_j0_atlas_scout_positive_box_sigmas084_086_t32p82_32p86_w005_boxes.csv \
  --label sector_positive_box_fast_sub8 \
  --mode fast \
  --subdiv-t 8 \
  --interval-dps 50 \
  --inflate 1e-12
```

Saidas:

```text
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub8.csv
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub8.json
```

Resultado:

```text
certified_nondestructive = 24/27
sector combined = 24/27
sector separate = 24/27
```

Falhas sub8:

```text
s0.84_t0
s0.84_t1
s0.85_t0
```

Essas falhas foram inflacao intervalar do upper setorial; os budgets de
main/rest continuaram positivos.

## Recuperacao Fast Sub32

As 3 caixas falhas em sub8 foram reprocessadas com:

```text
mode = fast
subdiv-t = 32
interval-dps = 80
inflate = 1e-13
```

Resultado:

```text
s0.84_t0: certified sector combined/separate
s0.84_t1: certified sector combined/separate
s0.85_t0: certified sector combined/separate
```

Em seguida, a positive-box inteira foi rodada com fast/sub32.

Saidas:

```text
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub32.csv
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub32.json
```

Resultado:

```text
certified_nondestructive = 27/27
sector combined = 27/27
sector separate = 27/27
max d0_neg_re_upper = -1.936804970135e-04
min sector budget combined = 5.408604580200e-02
min sector budget separate = 5.403134348438e-02
worst box = s0.84_t7
```

## Pior Caixa s0.84_t7

Fast/sub32:

```text
d0_neg_re_upper = -4.384676e-04
sectorBudgetCombined = 5.408605e-02
sectorBudgetSeparate > 0
certified sector combined/separate
```

Strict/sub8:

```text
mode = strict
subdiv-t = 8
interval-dps = 80
inflate = 1e-14
elapsed ~= 121s
d0_neg_re_upper = -1.953730e-04
sectorBudgetCombined = 4.198819e-02
certified sector combined/separate
```

O strict mode rodou e confirmou a pior caixa, mas e caro demais para ser a
primeira opcao para todas as caixas.

## Comparacao Com Pack Racionalizado

Pack racionalizado anterior:

```text
min budget combined racionalizado = 0.0419881832
worst box = s0.84_t7
```

Pack setorial fast/sub32:

```text
min sector budget combined = 0.054086045802
worst box = s0.84_t7
```

O budget setorial e maior porque elimina o custo paralelo:

```text
parallelUpper = 0.
```

## Respostas

1. Positive-box nondestructive: 27/27 com fast/sub32.
2. Sector combined: 27/27 com fast/sub32.
3. Sector separate: 27/27 com fast/sub32.
4. A pior caixa `s0.84_t7` e robusta; passa em fast/sub32 e strict/sub8.
5. Strict mode rodou para `s0.84_t7`, mas levou cerca de 121s.
6. Fast/sub32 confirmou a mesma caixa com maior subdivisao e folga maior.
7. O sectorBudget supera o budget racionalizado porque `numeratorUpper = 0`.
8. Sim, para positive-box o pack setorial pode substituir o
   `numeratorUpper` generico por `numeratorUpper = 0`, como certificado
   externo.

## Limite

Este ainda e um certificado externo. A camada Lean consome a hipotese setorial,
mas nao verifica internamente a aritmetica intervalar.
