# Audit Projected J0 Positive Box Sector Sentinel Strict

Rota: Genuine-First. Esta auditoria roda `strict/sub8` em quatro caixas
sentinela da positive-box setorial. Ela e um cross-check externo do pack
`fast/sub32`; nao substitui a cadeia setorial principal e nao prova enclosures
analiticas no kernel Lean.

## Entradas

- Script: `operadores/c2_projected_j0_sector_box_certifier.py`
- Boxes: `audit_outputs/c2_projected_j0_atlas_scout_positive_box_sigmas084_086_t32p82_32p86_w005_boxes.csv`
- Saida CSV: `audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict.csv`
- Saida JSON: `audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict.json`
- Modo: `strict`
- Subdivisao: `subdiv-t=8`
- Precisao: `interval-dps=80`
- Inflacao: `1e-14`
- Caixas: `s0.86_t0,s0.84_t0,s0.84_t1,s0.85_t0`
- Tempo total: 486.44 s

## Resultado

- Sentinelas rodadas: 4
- Nondestructive certificados: 1/4
- Sector combined certificados: 1/4
- Sector separate certificados: 1/4
- Menor budget combined strict: 0.045676101789637026
- Menor budget separate strict: 0.045665206435400854
- Maior `d0_neg_re_upper` strict: 0.00004932325340211418

## Comparacao Com Fast/Sub32

| box | strict d0 upper | fast/sub32 d0 upper | strict combined budget | fast/sub32 combined budget | status strict |
|---|---:|---:|---:|---:|---|
| `s0.86_t0` | -0.00000041210394292681805 | -0.00019368049701349772 | 0.04994119003378412 | 0.06060762915013632 | certified |
| `s0.84_t0` | 0.00004932325340211418 | -0.00020839735021895822 | 0.0463833648089782 | 0.05861451107613183 | fail_nondestructive |
| `s0.84_t1` | 0.000010863858392445782 | -0.0002460417550541723 | 0.045676101789637026 | 0.057890598940655125 | fail_nondestructive |
| `s0.85_t0` | 0.000020642587943708835 | -0.00020225591121753026 | 0.04825078905460031 | 0.05965071537579581 | fail_nondestructive |

## Leitura

`s0.86_t0`, a caixa com maior upper setorial no pack fast/sub32, tambem
certifica em strict/sub8.

As tres caixas de borda `s0.84_t0`, `s0.84_t1` e `s0.85_t0` falham em
strict/sub8 apenas na condicao setorial. Os budgets strict permanecem
positivos. A perda vem da enclosure strict mais larga: o lower de main diminui
e o rest upper aumenta em relacao ao fast/sub32.

Leitura operacional: `strict/sub8` e caro e grosseiro demais para as caixas de
borda. O pack setorial deve continuar usando `fast/sub32` como certificador
primario. Se for necessario um cross-check strict para essas bordas, o proximo
teste deve aumentar a subdivisao strict em vez de repetir `subdiv-t=8`.

## Respostas

1. Quatro sentinelas strict rodaram.
2. Uma das quatro certificou nondestructive.
3. Uma das quatro certificou combined e separate.
4. O strict confirma `s0.86_t0`; nas tres caixas de borda, `d0_neg_re_upper`
   fica levemente positivo por inflacao.
5. Os budgets strict continuam positivos em todas as quatro caixas, mas cerca
   de 0.0107 a 0.0122 abaixo do fast/sub32.
6. Tempo total: 486.44 s.
7. Recomendacao: manter fast/sub32 como certificador primario do pack setorial;
   usar strict com subdivisao maior apenas como auditoria localizada.
