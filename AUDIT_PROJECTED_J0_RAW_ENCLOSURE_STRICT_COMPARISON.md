# Audit Projected J0 Raw Enclosure Strict Comparison

Rota: Genuine-First. Este relatorio compara a cadeia fast/sub32 positive-box
com auditorias strict localizadas e com o novo raw enclosure sentinel checker.

## Fontes

Fast/sub32 primary:

```text
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub32.csv
```

Strict localizada:

```text
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_s084_t7_strict.csv
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict.csv
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict_sub16.csv
```

Raw enclosure sentinel:

```text
audit_outputs/projected_j0_raw_enclosure_sentinel_check.json
```

## Strict Box-Level

| box | strict mode | d0 upper strict | combined budget strict | strict status | d0 upper fast/sub32 | combined budget fast/sub32 |
|---|---|---:|---:|---|---:|---:|
| `s0.84_t7` | sub8 | -0.00019537303077687114 | 0.041988185864501454 | certified | -0.00043846764932738456 | 0.05408604580200366 |
| `s0.86_t0` | sub8 | -0.00000041210394292681805 | 0.04994119003378412 | certified | -0.00019368049701349772 | 0.06060762915013632 |
| `s0.84_t0` | sub16 | -0.00012349732062443897 | 0.054535452836477066 | certified | -0.00020839735021895822 | 0.05861451107613183 |
| `s0.84_t1` | sub16 | -0.0001616225844105877 | 0.05381622219151731 | certified | -0.0002460417550541723 | 0.057890598940655125 |
| `s0.85_t0` | sub16 | -0.00012972476937782085 | 0.05581825962496195 | certified | -0.00020225591121753026 | 0.05965071537579581 |

## Raw Rectangle Sentinels

O raw enclosure sentinel checker recomputou strict, por subcaixa, os objetos:

```text
M
D0
Drest
RvecTail
```

Resultado:

```text
boxes checked = 5
subboxes checked = 10
objects checked = 40
contains = 40
strict_wider = 0
inconclusive = 0
disjoint_fail = 0
max width ratio = 0.9999999355595678
```

## Leitura

1. Os sinais setoriais strict sao compativeis com fast/sub32 nas sentinelas:
   todos os `d0_neg_re_upper` strict listados sao negativos.
2. Os budgets strict permanecem positivos em todas as sentinelas.
3. As tres bordas que falharam em strict/sub8 passam em strict/sub16, indicando
   que a falha anterior era efeito de subdivisao grosseira.
4. Nas 10 subcaixas auditadas pelo raw checker, os retangulos armazenados
   contem as recomputacoes strict para `M`, `D0`, `Drest` e `RvecTail`.

## Caminhos De Confianca

Opcao 1: manter a cadeia externa atual.

```text
fast/sub32 primary
+ subbox verifier
+ independent rectangle verifier
+ raw strict sentinels
+ rational Lean algebra
+ conditional Lean bridge
```

Vantagem: ja cobre o bloco positive-box preferred com boa margem e custo
controlado.

Opcao 2: construir checker strict menor para todas as 771 subcaixas.

Vantagem: reduz muito a dependencia do modo fast. Custo: alto, mas viavel por
lotes, comecando por `M,D0`.

Opcao 3: formalizar aritmetica retangular em Lean.

Vantagem: a algebra de retangulos ja foi isolada pelo rect verifier. Custo:
moderado, mas ainda nao cobre as funcoes analiticas que geram os retangulos.

Opcao 4: certificar formalmente as funcoes transcendentais.

Vantagem: caminho mais forte. Custo: alto; deve ficar para depois.

## Recomendacao

Curto prazo: manter a cadeia externa atual como preferred positive-box e
expandir a recomputacao strict independente para `M,D0` em todas as 771
subcaixas por lotes.

Medio prazo: formalizar a aritmetica retangular ja isolada pelo rect verifier.

Longo prazo: certificar os retangulos analiticos brutos com um checker menor ou
formalizacao dedicada.
