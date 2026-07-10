# Audit Projected J0 Positive Box Rationalized Pack

Data: 2026-07-08.

Rota: Genuine-First. Este relatorio registra a racionalizacao segura do pack
positive-box externo verificado.

## Script

Criado:

```text
operadores/c2_projected_j0_rationalize_pack.py
```

Comando executado:

```bash
python3 operadores/c2_projected_j0_rationalize_pack.py \
  --pack-dir audit_outputs/projected_j0_positive_box_certificate_pack \
  --decimals 12 \
  --out-dir audit_outputs/projected_j0_positive_box_rationalized_pack
```

## Pack Gerado

Diretorio:

```text
audit_outputs/projected_j0_positive_box_rationalized_pack/
```

Arquivos:

```text
config.json
boxes_rationalized.csv
boxes_rationalized.json
summary.md
README.md
source_config.json
```

## Regras De Arredondamento

```text
mainNormLowerConst:       arredondado para baixo
numeratorUpperConst:      arredondado para cima
restUpperCombinedConst:   arredondado para cima
restUpperSeparateConst:   arredondado para cima
parallelUpperConst:       recalculado e arredondado para cima
budgets:                  recalculados com os valores arredondados
```

Casas decimais:

```text
12
```

## Resultado

```text
caixas de entrada: 27
caixas sobreviventes: 27
certified combined racionalizado: 27/27
certified separate racionalizado: 27/27
min budget combined racionalizado: 0.041988183200
min budget separate racionalizado: 0.041893943068
caixa mais apertada combined: s0.84_t7
caixa mais apertada separate: s0.84_t7
```

Maior perda por arredondamento:

```text
combined: 0.00000000002113689 em s0.84_t5
separate: 0.00000000002153838 em s0.84_t5
```

Leitura: a margem do positive-box e grande o suficiente para absorver a
racionalizacao em 12 casas sem perder nenhuma caixa.

## Uso Futuro Em Lean

Estes dados podem alimentar um futuro arquivo de dados Lean, porque as
constantes racionalizadas tem direcao segura para a algebra:

```text
mainLower - numeratorUpper/mainLower - restUpper > 0
```

Porem, isto ainda nao prova as enclosures analiticas. A camada racionalizada
so torna a parte aritmetica dos dados mais robusta e menos dependente de
representacao float.

## Proximo Passo

Criar um verificador pequeno para o pack racionalizado ou uma camada Lean de
dados que confira apenas a algebra racional. A prova de que os racionais
majoram/minoram os objetos analiticos continua externa.
