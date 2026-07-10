# Audit Projected J0 Positive Box Sector Sentinel Strict Subdiv

Rota: Genuine-First. Esta auditoria reprocessa em `strict/sub16` as tres
caixas de borda que falharam em `strict/sub8`.

## Entrada

- Script: `operadores/c2_projected_j0_sector_box_certifier.py`
- Boxes: `audit_outputs/c2_projected_j0_atlas_scout_positive_box_sigmas084_086_t32p82_32p86_w005_boxes.csv`
- Caixas: `s0.84_t0,s0.84_t1,s0.85_t0`
- Modo: `strict`
- Subdivisao: `subdiv-t=16`
- Precisao: `interval-dps=80`
- Inflacao: `1e-14`
- Saida CSV: `audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict_sub16.csv`
- Saida JSON: `audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict_sub16.json`

## Resultado

- Tempo total: 750.17 s
- Nondestructive: 3/3
- Sector combined: 3/3
- Sector separate: 3/3
- Menor budget combined: 0.05381622219151731
- Menor budget separate: 0.05380959021666256
- Maior `d0_neg_re_upper`: -0.00012349732062443897

## Tabela

| box | d0 upper strict/sub16 | combined budget strict/sub16 | d0 upper strict/sub8 | combined budget strict/sub8 | d0 upper fast/sub32 |
|---|---:|---:|---:|---:|---:|
| `s0.84_t0` | -0.00012349732062443897 | 0.054535452836477066 | 0.00004932325340211418 | 0.0463833648089782 | -0.00020839735021895822 |
| `s0.84_t1` | -0.0001616225844105877 | 0.05381622219151731 | 0.000010863858392445782 | 0.045676101789637026 | -0.0002460417550541723 |
| `s0.85_t0` | -0.00012972476937782085 | 0.05581825962496195 | 0.000020642587943708835 | 0.04825078905460031 | -0.00020225591121753026 |

## Respostas

1. `strict/sub16` recupera as tres caixas de borda.
2. Em todas, `d0_neg_re_upper <= 0`.
3. Os budgets combined e separate continuam positivos em todas.
4. Custo total: 750.17 s.
5. `strict/sub32` em `s0.84_t0` nao foi necessario, porque `strict/sub16`
   ja certificou as tres caixas.
6. Recomendacao: usar strict como auditoria localizada. Para a cadeia primaria,
   manter `fast/sub32` com subbox verifier, porque strict e muito mais caro.

## Leitura

O resultado remove a principal duvida das sentinelas: as falhas `strict/sub8`
eram efeito de subdivisao grosseira. Com `subdiv-t=16`, as mesmas caixas passam
no modo strict.
