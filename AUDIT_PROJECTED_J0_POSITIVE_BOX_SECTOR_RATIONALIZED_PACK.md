# Audit Projected J0 Positive Box Sector Rationalized Pack

Data: 2026-07-09.

Rota: Genuine-First. Este relatorio registra a racionalizacao segura do pack
setorial positive-box. A camada racionalizada checa apenas a algebra dos dados
arredondados.

## Script

Criado:

```text
operadores/c2_projected_j0_rationalize_sector_pack.py
```

Comando executado:

```bash
python3 operadores/c2_projected_j0_rationalize_sector_pack.py \
  --pack-dir audit_outputs/projected_j0_positive_box_sector_certificate_pack/ \
  --decimals 12 \
  --out-dir audit_outputs/projected_j0_positive_box_sector_rationalized_pack/
```

## Pack Gerado

Diretorio:

```text
audit_outputs/projected_j0_positive_box_sector_rationalized_pack/
```

Arquivos:

```text
config.json
boxes_sector_rationalized.csv
boxes_sector_rationalized.json
source_config.json
summary.md
README.md
```

## Regras De Arredondamento

```text
mainNormLowerConst:       arredondado para baixo
restUpperCombinedConst:   arredondado para cima
restUpperSeparateConst:   arredondado para cima
d0_neg_re_upper:          arredondado para cima
```

Casas decimais:

```text
12
```

## Resultado

```text
caixas de entrada: 27
caixas sobreviventes: 27
nondestructive racionalizado: 27/27
sector combined racionalizado: 27/27
sector separate racionalizado: 27/27
min sector budget combined racionalizado: 0.054086045801
min sector budget separate racionalizado: 0.054031343484
pior caixa combined: s0.84_t7
pior caixa separate: s0.84_t7
maior d0_neg_re_upper racionalizado: -0.000193680497 em s0.86_t0
```

Maior perda por arredondamento:

```text
combined: 0.000000000001804634 em s0.84_t4
separate: 0.000000000001692154 em s0.85_t5
```

## Comparacao Com Pack Racionalizado Generico

Pack racionalizado generico:

```text
min budget combined = 0.041988183200
min budget separate = 0.041893943068
```

Pack setorial racionalizado:

```text
min sector budget combined = 0.054086045801
min sector budget separate = 0.054031343484
```

A margem setorial e maior porque o custo paralelo foi eliminado:

```text
parallelUpper = 0.
```

## Limite

Este pack ainda nao prova as enclosures analiticas. Ele apenas coloca os dados
externos em forma racional arredondada com direcao segura.

## Proximo Passo

Gerar um arquivo Lean que cheque apenas:

```text
d0_neg_re_upper <= 0
mainLower > 0
restUpper >= 0
mainLower - restUpper > 0
```
