# Audit Projected J0 Positive Box Skeleton Lean

## Arquivo Lean

Criado:

```text
LeanC2/AuditProjectedJ0PositiveBoxSkeleton.lean
```

Imports:

```text
LeanC2.AuditProjectedJ0SectorAtlasFromSubboxes
LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData
```

Namespace:

```text
C2.ProjectedJ0PositiveBoxSkeleton
```

## PositiveBoxId

Foi criado o tipo finito:

```text
PositiveBoxId
```

com 27 construtores:

```text
s084_t0 ... s084_t8
s085_t0 ... s085_t8
s086_t0 ... s086_t8
```

Ele deriva:

```text
DecidableEq, Repr, Fintype
```

e:

```text
positiveBoxes := Finset.univ
```

Tambem foi provado:

```text
mem_positiveBoxes_all
```

## Regioes

Foi criada a estrutura:

```text
RectRegion
```

com campos racionais:

```text
sigmaMin sigmaMax tMin tMax : Q
```

e:

```text
RectRegion.toSet : RectRegion -> Set C
```

Os valores dos boxes foram lidos do pack externo setorial racionalizado:

```text
audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
```

Os boxes atuais sao degenerados em sigma:

```text
sigma_min = sigma_max in {0.84, 0.85, 0.86}
```

e o ultimo box em cada sigma e degenerado em `t`:

```text
t8 = [32.860, 32.860]
```

O valor `t5_max` foi mantido fiel ao CSV:

```text
32.849000000000004
  = 8212250000000001 / 250000000000000
```

## Regiao Global

A regiao global foi definida como uniao das 27 caixas certificadas:

```text
positiveGlobalRegion :=
  {s | exists b in positiveBoxes, s in positiveBoxRegion b}
```

Isso e deliberado. O pack externo nao fornece uma cobertura continua em sigma;
ele certifica tres linhas sigma. Portanto, o skeleton nao afirma uma faixa
continua entre `0.84` e `0.86`.

Cobertura provada:

```text
positiveBox_cover
```

## Certificados Combined

Foi criado:

```text
positiveBoxCombinedCert :
  PositiveBoxId -> ProjectedJ0SectorRationalizedBoxCertificate
```

Ele mapeia cada box para o certificado combined ja existente no arquivo:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

Separate nao foi usado nesta camada inicial. Combined e a moeda preferida para
o positive-box setorial atual.

## Subbox Covers Externos

Foi criada:

```text
PositiveBoxSubboxCovers
```

Ela pede, como hipotese externa, para cada box:

```text
ProjectedJ0SubboxCoverData
```

com as constantes do certificado combined correspondente.

Essa estrutura nao insere as 771 subcaixas no Lean.

## Theorem Condicional

Foi provado:

```text
positiveBox_totalFinite_ne_zero_of_subbox_covers
```

Leitura:

```text
subbox covers externos para os 27 boxes
------------------------------------------------
totalFinite != 0 na uniao positive-box certificada
```

O theorem instancia:

```text
ProjectedJ0SectorAtlasFromSubboxes
```

com:

```text
BoxId        = PositiveBoxId
boxes        = positiveBoxes
BoxRegion    = positiveBoxRegion
cert         = positiveBoxCombinedCert
subbox_cover = covers.cover
cover_boxes  = positiveBox_cover
```

## O Que Ainda Nao Existe

Esta camada nao inclui:

```text
dados das 771 subboxes;
retangulos brutos;
prova de pertencimento analitico aos retangulos;
prova de enclosures;
prova de cobertura de uma regiao continua em sigma;
conexao com o middle global;
formalizacao de transcendentes.
```

## Verificacao

Comando rodado:

```text
lake env lean LeanC2/AuditProjectedJ0PositiveBoxSkeleton.lean
lake build LeanC2.AuditProjectedJ0PositiveBoxSkeleton
```

Resultado: ambos passaram. O build reexecutou dependencias antigas e emitiu
avisos de lint ja existentes fora do arquivo novo; nao houve erro no skeleton.
