# Positive Box Genuine Odd Reference Audit

## Resultado

Foi criada uma interface audit-only para a positive box baseada em uma
referência ímpar abstrata:

```text
LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
```

O arquivo novo não define a referência por zeta. Ele recebe a referência como
dado externo `oddRef : ℂ → ℂ` e reconstrói o truncamento, o horizontal q-ratio e
o ledger escalar contra esse `oddRef`.

## 1. Qual rota o ledger atual consome

O ledger atual da positive box continua consumindo a rota raw.

O campo antigo:

```lean
PositiveBoxOddTruncationData.odd_truncation_bound
```

controla:

```lean
constantCoreOddTruncationNorm positiveBoxN s
```

e o relatório anterior já registrou que isso desdobra para:

```lean
‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖
```

Ou seja: o ledger atual consome `oddDirichletChannel`.

## 2. Por que raw está bloqueado na positive box

A positive box está abaixo de `Re(s)=1`:

```text
21 / 25 <= s.re <= 43 / 50
```

Os lemas de cauda raw encontrados para:

```lean
rectangularOddCoreSum s M - oddDirichletChannel s
```

exigem `1 < s.re`. Portanto eles não podem alimentar a positive box.

Status da rota raw:

```text
raw odd target: aberto abaixo de Re(s)=1
```

## 3. Por que o continued existente não é genuine-first

O símbolo existente `continuedOddDirichletChannel` no repo é auditável como
objeto já formalizado, mas sua definição atual passa por `riemannZeta`.

Assim, ele não deve ser usado como input analítico para fechar o middle sob
disciplina genuine-first estrita.

Status dessa rota:

```text
continuedOddDirichletChannel existente: separado; não usado no novo arquivo
```

## 4. Interface oddRef criada

Foi criada a estrutura:

```lean
structure GenuineOddContinuationData where
  oddRef : ℂ → ℂ
  agrees_on_one_lt :
    ∀ s : ℂ, 1 < s.re → oddRef s = oddDirichletChannel s
```

Essa estrutura não prova a existência completa da continuação. Ela só fixa a
API correta: uma referência ímpar genuine-first abstrata, compatível com a rota
raw no semiplano de convergência absoluta.

Foi definido também:

```lean
positiveBoxOddRefTruncationNorm oddRef N s :=
  ‖rectangularOddCoreSum s N - oddRef s‖
```

e a estrutura:

```lean
PositiveBoxOddRefTruncationData oddRef
```

com campo:

```lean
oddRef_truncation_bound :
  ∀ s, s ∈ positiveBox →
    positiveBoxOddRefTruncationNorm oddRef positiveBoxN s
      ≤ positiveBoxOddTruncationUpperValue
```

## 5. Teoremas condicionais que compilam

O arquivo novo cria uma rota q-ratio paralela:

```lean
oddRefCoreHorizontalAmplitudeQRatio
oddRefCoreHorizontalUpperQRatio
oddRefHorizontalLayerBudgetQRatio
```

e prova a redução:

```text
PositiveBoxOddRefTruncationData
+ q bounds fechados
=> oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s <= 1 / 100
```

via:

```lean
PositiveBoxOddRefHorizontalUpperData.ofOddRefTruncationAndQUpper
```

Depois cria o ledger escalar:

```lean
vSplitResidualLedgerOddRefQRatio
PositiveBoxOddRefLedgerBounds
PositiveBoxOddRefLedgerBounds.ledger_strict
positiveBox_ledger_strict_ofOddRefTruncation
```

Também foi criado um certificado audit-only separado:

```lean
PositiveBoxOddRefAuditCertificate
PositiveBoxOddRefAuditCertificate.ofOddRefTruncationAndAnalyticBounds
PositiveBoxCertificate.ofOddRefTruncationAndAnalyticBounds
```

O wrapper com namespace `PositiveBoxCertificate` retorna o certificado
audit-only `PositiveBoxOddRefAuditCertificate`; ele não constrói o certificado
raw público.

Consequências audit-only:

```lean
PositiveBoxOddRefAuditCertificate.sectorResidualDominance
PositiveBoxOddRefAuditCertificate.truePrefixResidualDominance
```

## 6. Campos que continuam abertos

Continuam condicionais:

```text
existência genuine-first de oddRef
propriedades analíticas/continuação de oddRef
oddRef truncation <= 7 / 180 na positive box
anchor_bound
cut_bound
sector_lower
```

Nada disso foi afirmado como fechado.

## 7. Separação das três rotas

Rota A, raw:

```text
rectangularOddCoreSum - oddDirichletChannel
```

É a rota consumida pelo ledger atual. Está bloqueada na positive box com os
lemas atuais, porque eles exigem `1 < s.re`.

Rota B, continued existente:

```text
rectangularOddCoreSum - continuedOddDirichletChannel
```

Foi mantida separada no arquivo anterior. É útil para auditoria do repo, mas o
símbolo existente não é input genuine-first porque sua definição passa por
`riemannZeta`.

Rota C, oddRef/genuine:

```text
rectangularOddCoreSum - oddRef
```

É a interface semanticamente correta para uma futura prova genuine-first. Ela é
abstrata e não usa diagnóstico numérico.

## 8. Verificação

Comandos executados com sucesso:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Busca textual no novo arquivo:

```text
rg -n "riemannZeta|zeta|zeta_diagnostic|sorry|admit|axiom|constant" \
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
```

Resultado: sem ocorrências.

## 9. Promoção

Nada foi promovido para a rota principal.

O arquivo novo é audit-only e não altera:

```text
PositiveBoxOddTruncationData
PositiveBoxCertificate
C2ExpandedOddTruncationBudget
C2ExpandedHorizontalLayerBudget
```

Ele apenas fornece uma rota paralela parametrizada por `oddRef`.
