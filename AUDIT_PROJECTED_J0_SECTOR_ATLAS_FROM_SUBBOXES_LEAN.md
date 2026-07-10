# Audit Projected J0 Sector Atlas From Subboxes Lean

## Arquivo Lean

Criado:

```text
LeanC2/AuditProjectedJ0SectorAtlasFromSubboxes.lean
```

Import:

```text
LeanC2.AuditProjectedJ0SubboxToSectorBridge
```

Namespace:

```text
C2.ProjectedJ0RectangleArithmetic
```

## Estrutura Global

Foi criada a estrutura:

```text
ProjectedJ0SectorAtlasFromSubboxes
```

Ela usa a versao simples nao-dependente:

```text
BoxId : Type
SubboxId : Type
cert : BoxId -> ProjectedJ0SectorRationalizedBoxCertificate
```

O certificado e total em `BoxId`, mas apenas os valores dos boxes pertencentes
ao `Finset boxes` sao usados.

Campos principais:

```text
cover_boxes:
  GlobalRegion e coberta por BoxRegion b com b em boxes.

cert:
  certificado setorial racionalizado por box.

subbox_cover:
  para cada b em boxes, um ProjectedJ0SubboxCoverData da regiao BoxRegion b.
```

## Theorem Box-Level

Foi criado o wrapper:

```text
total_ne_zero_on_box_of_subbox_cover
```

Ele aplica diretamente:

```text
ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_subbox_cover
```

para uma caixa individual.

## Theorem Global

Foi provado:

```text
ProjectedJ0SectorAtlasFromSubboxes.total_ne_zero
```

Leitura:

```text
cobertura global por boxes
+ certificado setorial racionalizado por box
+ cobertura por subcaixas em cada box
------------------------------------------------
totalFinite != 0 na regiao global
```

A prova escolhe o box que contem `s`, usa o `subbox_cover` daquele box e aplica
o consumidor setorial ja existente.

## Encaixe No Positive-Box

Para o positive-box setorial atual, uma instancia concreta futura teria:

```text
27 boxes externos;
771 subboxes externos;
um certificado setorial racionalizado por box;
um ProjectedJ0SubboxCoverData por box;
uma cobertura global dos 27 boxes.
```

Esta camada nao cria essa instancia concreta. Ela apenas formaliza o formato
logico do atlas.

## O Que Ainda Fica Externo

Continuam externos:

```text
cobertura concreta dos 27 boxes;
cobertura concreta das 771 subboxes;
dados dos retangulos;
pertencimento de M,D0,Drest,RvecTail aos retangulos;
geracao analitica das enclosures;
transcendentais usados pelo produtor externo.
```

## Verificacao

Comandos rodados:

```text
lake env lean LeanC2/AuditProjectedJ0SectorAtlasFromSubboxes.lean
lake build LeanC2.AuditProjectedJ0SectorAtlasFromSubboxes
```

Resultado: ambos passaram. O build reexecutou dependencias antigas e emitiu
avisos de lint ja existentes fora do arquivo novo; nao houve erro no modulo do
atlas.
