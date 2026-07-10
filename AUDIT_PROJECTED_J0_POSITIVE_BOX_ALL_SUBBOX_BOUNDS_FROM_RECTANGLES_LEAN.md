# Audit Projected J0 Positive Box All Subbox Bounds From Rectangles Lean

Data: 2026-07-09.

Rota: Genuine-First.

## Arquivo Lean

Foi criado:

```text
LeanC2/AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles.lean
```

O modulo importa a cobertura positive-box ja provada e a bridge retangular por
subbox. Ele nao contem retangulos concretos nem dados numericos das 771
subboxes.

## Estrutura Retangular Por Subbox

Foi criada:

```text
PositiveBoxAllSubboxRectangleBounds
```

A estrutura usa `ProjectedJ0SubboxSectorBridgeData` para cada:

```text
box b em positiveBoxes;
subbox i em positiveBoxSubboxesOf b;
ponto s em positiveBoxSubboxRegion i.
```

Cada valor da bridge registra:

```text
ProjectedJ0SubboxRectangleContract;
ProjectedJ0SubboxDerivedBounds;
ProjectedJ0SubboxModBounds;
comparacao do main lower com a constante da box;
comparacao do D0NegReMain upper com a constante da box;
comparacao do rest upper com a constante da box.
```

Portanto a nova estrutura nao e um pacote direto de tres desigualdades. Ela
exige os testemunhos retangulares e os certificados de modulo ja definidos na
camada `ProjectedJ0RectangleArithmetic`.

Os consumidores usados sao:

```text
ProjectedJ0SubboxSectorBridgeData.main_lower
ProjectedJ0SubboxSectorBridgeData.d0_neg_re_upper
ProjectedJ0SubboxSectorBridgeData.rest_upper
```

Os bounds de modulo passam por:

```text
ProjectedJ0SubboxModBounds.main_lower
ProjectedJ0SubboxModBounds.rest_upper
```

Para `D0NegReMain`, o adapter consome o campo retangular derivado da bridge. Um
produtor concreto pode construir esse campo usando
`d0NegReMain_upper_of_rects`; este modulo nao fixa nem duplica o produtor dos
bounds derivados.

## Conversao Para PositiveBoxAllSubboxBounds

Foi provado:

```text
PositiveBoxAllSubboxRectangleBounds.toPositiveBoxAllSubboxBounds
```

O theorem elimina os testemunhos retangulares depois de derivar exatamente os
tres campos exigidos pelo skeleton global:

```text
main_lower;
d0_neg_upper;
rest_upper.
```

As constantes racionais de cada box sao coercidas diretamente para `Real`, na
mesma forma usada por `PositiveBoxAllSubboxBounds`.

## Theorem Global Sem Hipotese De Cobertura

Foi provado:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_rectangle_bounds
```

A cadeia formal e:

```text
PositiveBoxAllSubboxRectangleBounds
  -> PositiveBoxAllSubboxBounds
  -> positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp
  -> totalFinite != 0 em positiveGlobalRegion.
```

A cobertura nao reaparece como hipotese. O theorem anterior usa
`positiveBox_all_subbox_cover`, que ja prova a cobertura das 27 boxes pelos 771
subboxes.

## O Que Ainda Fica Externo

Continuam fora desta camada:

```text
dados e contratos retangulares concretos por subbox;
pertencimento analitico de M, D0, Drest e RvecTail aos retangulos;
testemunhos dos bounds retangulares derivados por subbox;
geracao das enclosures;
transcendentais usados pelo produtor externo;
materializacao e validacao dos 771 certificados concretos.
```

O novo theorem e condicional apenas ao pacote retangular por subbox, mas esse
pacote ainda e um insumo externo. Ele nao deve ser confundido com prova Lean da
geracao analitica dos retangulos.

## Verificacao

Foram executados:

```text
lake env lean LeanC2/AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles.lean
lake build LeanC2.AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles
```

Resultados:

```text
lake env lean: passou;
lake build: passou, 8305 jobs, modulo novo construido com sucesso.
```

O build reproduziu warnings antigos em dependencias. Nao houve warning nem erro
atribuido ao modulo novo.

A busca de higiene solicitada nao encontrou hits no Lean novo nem neste
relatorio. Os hits restantes aparecem apenas no guia como guardrails textuais.
