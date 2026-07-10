# AUDIT_POSITIVE_BOX_CUTOFF_BRIDGE_REPORT

## Escopo

Esta etapa criou apenas uma ponte audit-only para o campo `cut_bound` da
positive box. Nenhum bound numerico de cutoff foi provado.

## Ponte criada

Arquivo novo:

- `LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean`

Itens adicionados:

- `PositiveBoxCutoffUpperData`
- `PositiveBoxCutoffUpperData.cut_bound`
- `positiveBox_cut_bound_of_continuedCutoffExactUpper`
- `positiveBoxCutoffUpperData_of_three_over_thousand`
- `positiveBox_cut_bound_of_continuedCutoffExactUpper_three_over_thousand`
- `PositiveBoxCutoffUpperData.toCertificate`

`PositiveBoxCutoffUpperData` tem o campo:

```lean
cutoff_upper_bound :
  forall {s : Complex}, s in positiveBox ->
    c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s <=
      positiveBoxCutUpperValue
```

O theorem `PositiveBoxCutoffUpperData.cut_bound` transforma esse campo em:

```lean
forall {s : Complex}, s in positiveBox ->
  norm (cutVec positiveBoxK positiveBoxM s) <= positiveBoxCutUpperValue
```

O theorem livre `positiveBox_cut_bound_of_continuedCutoffExactUpper` fornece a
mesma ponte diretamente a partir da hipotese sobre
`c2ContinuedCutoffExactUpper`.

O wrapper `positiveBoxCutoffUpperData_of_three_over_thousand` aceita a forma
explicita:

```lean
forall {s : Complex}, s in positiveBox ->
  c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s <= 3 / 1000
```

e produz `PositiveBoxCutoffUpperData`, usando apenas a definicao
`positiveBoxCutUpperValue = 3 / 1000`.

O wrapper `PositiveBoxCutoffUpperData.toCertificate` preenche o campo
`cut_bound` de `PositiveBoxCertificate` a partir de
`PositiveBoxCutoffUpperData`; os demais campos continuam parametros explicitos.

## Definicoes e lemmas usados

A ponte usa somente:

- `cutVec_eq_continuedCutoffError`
- `c2ContinuedCutoffExactUpper`
- os nomes ja existentes da positive box:
  `positiveBox`, `positiveBoxK`, `positiveBoxM`, `positiveBoxCutUpperValue`
- a reducao definicional `positiveBoxCutUpperValue = 3 / 1000`

Ela fixa a identidade semantica:

```text
cutVec positiveBoxK positiveBoxM s
= c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel
    positiveBoxK positiveBoxM s
```

e entao troca a norma desse termo pela upper exata continuada existente.

## O que nao foi provado

Nao foi criada prova de:

```text
c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s
  <= positiveBoxCutUpperValue
```

Esse e exatamente o campo ainda exigido por `PositiveBoxCutoffUpperData`.

## Campos ainda abertos

Para obter um `PositiveBoxCertificate` completo a partir do wrapper novo, ainda
sao necessarios:

- `PositiveBoxCutoffUpperData.cutoff_upper_bound`
- `anchor_bound`
- `sector_lower`
- `ledger_strict`

O campo `sector_lower` pode ser alimentado pela trilha audit-only de setor ja
existente, mas esta ponte nao o reprova nem o altera. `anchor_bound` e
odd truncation nao foram tocados.

## Compilacao

Comandos executados com sucesso:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Todos terminaram sem saida de erro.

## Guardrails

- Nenhum operador novo foi criado.
- Nenhum bound numerico de cutoff foi tentado.
- `anchor_bound` nao foi alterado.
- odd truncation nao foi alterado.
- `oddRef` permaneceu congelado.
- Nenhum nome analitico proibido foi introduzido.
- Nenhuma declaracao vedada ou placeholder foi usado.
- Nada foi promovido para a rota principal.
- O arquivo novo nao foi adicionado ao agregador principal do projeto.

## Conclusao

`cut_bound` agora pode ser preenchido mecanicamente a partir de
`PositiveBoxCutoffUpperData`. A proxima prova numerica, se for atacada, deve
mirar o campo `cutoff_upper_bound`, nao diretamente o campo `cut_bound` do
certificado.
