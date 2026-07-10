# Audit Projected J0 Subbox To Sector Bridge Lean

## Arquivo Lean

Criado:

```text
LeanC2/AuditProjectedJ0SubboxToSectorBridge.lean
```

Imports:

```text
LeanC2.AuditProjectedJ0RectangleModBounds
LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedBridge
```

## Estruturas criadas

`ProjectedJ0SubboxSectorBridgeData` e uma camada concreta de subcaixa para
quatro valores complexos:

```text
M, D0, Drest, RvecTail
```

Ela combina:

```text
ProjectedJ0SubboxRectangleContract
ProjectedJ0SubboxDerivedBounds
ProjectedJ0SubboxModBounds
```

e compara os bounds derivados com as constantes de caixa:

```text
mainLower
d0NegReUpper
restUpper
```

`ProjectedJ0BoxSectorAnalyticFromSubboxes` registra, em nivel de caixa, as
tres hipoteses analiticas externas exigidas pela bridge setorial racionalizada:

```text
mainLower <= ||adjustedProjectedJ0_M tiltSeed s||
adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s <= d0NegReUpper
adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s <= restUpper
```

`ProjectedJ0SubboxCoverData` registra uma cobertura abstrata de uma caixa por
subcaixas, com bounds por subcaixa usando as mesmas constantes de caixa.

## Teoremas principais

Da subcaixa concreta:

```text
ProjectedJ0SubboxSectorBridgeData.main_lower
ProjectedJ0SubboxSectorBridgeData.d0_neg_re_upper
ProjectedJ0SubboxSectorBridgeData.rest_upper
```

Da cobertura por subcaixas:

```text
ProjectedJ0SubboxCoverData.toBoxSectorAnalyticFromSubboxes
ProjectedJ0SubboxCoverData.toExternalAnalyticBoxHypotheses
```

Consumidor final:

```text
ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_subbox_cover
```

Esse teorema diz:

```text
certificado setorial racionalizado
+ cobertura por subcaixas com bounds externos
------------------------------------------------
totalFinite != 0 na regiao coberta
```

## Atlas global

Um atlas global de varias caixas foi postergado. A ponte por caixa ja captura a
parte necessaria para o bloco positive-box atual:

```text
subboxes -> external analytic hypotheses -> sector rationalized certificate
```

O atlas global deve ser uma camada fina acima desta, contendo apenas cobertura
entre boxes e escolha do certificado por box.

## O que ainda fica externo

Esta camada nao insere dados numericos e nao prova:

```text
dados concretos das subcaixas;
pertencimento de M,D0,Drest,RvecTail aos retangulos;
geracao analitica dos retangulos;
cobertura concreta das 771 subcaixas;
transcendentais usados pelo produtor externo.
```

## Conexao com positive-box setorial

A cadeia formal abstrata agora e:

```text
retangulos por subcaixa
  -> bounds por subcaixa
  -> cobertura da caixa
  -> hipoteses analiticas externas da caixa
  -> certificado setorial racionalizado
  -> totalFinite != 0
```

Isso deixa explicita a fronteira de confianca: os dados externos precisam
preencher o contrato de subcaixas, enquanto o Lean consome a composicao
logica e a algebra racional/setorial.

## Verificacao

Comandos rodados:

```text
lake env lean LeanC2/AuditProjectedJ0SubboxToSectorBridge.lean
lake build LeanC2.AuditProjectedJ0SubboxToSectorBridge
```

Resultado: ambos passaram. O build reexecutou dependencias antigas e emitiu
avisos de lint ja existentes fora do arquivo novo; nao houve erro no modulo da
ponte.
