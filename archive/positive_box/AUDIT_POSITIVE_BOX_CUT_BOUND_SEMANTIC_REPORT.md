# AUDIT_POSITIVE_BOX_CUT_BOUND_SEMANTIC_REPORT

## Escopo

Esta auditoria classifica semanticamente o campo `cut_bound` da positive box refinada antes de qualquer tentativa de prova numerica.

Caixa auditada:

- `sigma in [21 / 25, 43 / 50]`
- `t in [1641 / 50, 1643 / 50]`
- `N = 50`, `K = 3`, `M = 50`

Nenhuma prova nova foi criada. Nenhum arquivo Lean foi editado. A linha `oddRef` permanece congelada.

## Definicoes auditadas

| Objeto | Local | Definicao / papel semantico |
|---|---:|---|
| `cutVec K M s` | `LeanC2/AuditContinuedQuartetVSplit.lean:24` | `rectangularGenuine s K M - continuedCentralOddChannel s` |
| `cutVec_eq_continuedCutoffError` | `LeanC2/AuditContinuedQuartetVSplit.lean:37` | identifica `cutVec K M s` com `c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s` |
| `continuedCentralOddChannel s` | `LeanC2/Analytic/GenuineContinuation.lean:37` | `centralFromOddChannel continuedOddDirichletChannel s` |
| `continuedOddDirichletChannel s` | `LeanC2/Analytic/GenuineContinuation.lean:33` | canal impar continuado definido por um fator dyadico multiplicando o simbolo analitico terminal classico |
| `c2ConcreteCutoffErrorFromTarget targetF K M s` | `LeanC2/Route/BulkConcrete.lean:58` | `c2RectangularGenuineOperator K M s - targetF s` |
| `c2RectangularGenuineOperator K M s` | `LeanC2/Route/BulkConcrete.lean:46` | wrapper de `rectangularGenuine s K M` |
| `rectangularGenuine s K M` | `LeanC2/Operators/TruncatedGenuine.lean:11` | `rectangularDirect s K M - rectangularBracket s K M` |
| `C2ExpandedCutoffScaledBound K M cutoffBudget cutoffScale s` | `LeanC2/Analytic/GenuineBulkConcrete.lean:9933` | bound escalado usado pela rota expanded/main; o lado esquerdo e definido por uma majoracao escalar explicita do erro de cutoff |

Para a positive box atual, portanto:

```text
cutVec positiveBoxK positiveBoxM s
= rectangularGenuine s 3 50 - continuedCentralOddChannel s
= c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel 3 50 s
```

O alvo auditado e:

```text
||cutVec positiveBoxK positiveBoxM s|| <= 3 / 1000
```

ou seja:

```text
||rectangularGenuine s 3 50 - continuedCentralOddChannel s|| <= 3 / 1000
```

## Respostas de dependencia

| Pergunta | Resposta |
|---|---|
| `cutVec` depende de `continuedCentralOddChannel`? | Sim. A dependencia aparece diretamente na definicao de `cutVec`. |
| `continuedCentralOddChannel` depende de `continuedOddDirichletChannel`? | Sim. Ele e `centralFromOddChannel continuedOddDirichletChannel`. |
| `continuedOddDirichletChannel` usa entrada analitica terminal classica? | Sim. A definicao do canal impar continuado contem esse simbolo terminal. |
| Existe versao parametrizada por alvo central abstrato? | Sim. `c2ConcreteCutoffErrorFromTarget targetF K M s` e exatamente o erro retangular contra um alvo `targetF`. |
| Existe rota ja no repo para `C2ExpandedCutoffScaledBound` que evita essa entrada como input local de prova? | Existe maquinario generico por alvo e maquinario expanded por majoracoes escalares, mas nao ha ponte direta da positive box atual para o endpoint canonical. |
| O `cut_bound` da positive box pode ser provado como objeto finito/retangular puro? | Nao com a definicao atual de `cutVec`, porque o termo subtraido e o canal central continuado. |
| Menor bridge audit-only necessario | Uma ponte de cutoff que explicite, ainda em modo audit-only, se a positive box esta assumindo/majorando o erro continuado ou se esta trocando para um alvo genuine-first abstrato ja existente. |

## Classificacao do bound

Classificacao: **D. requires an audit shim**.

Razao: o objeto nao e finito puro. Ele mistura o retangulo finito `rectangularGenuine s 3 50` com `continuedCentralOddChannel s`. Isso nao invalida o tile audit-only, mas impede tratar o bound como uma estimativa retangular isolada. Antes de provar `3 / 1000`, a rota precisa declarar qual semantica de cutoff esta sendo usada.

Ha dois riscos associados:

- Risco de canal continuado: a definicao atual passa por `continuedCentralOddChannel`.
- Risco raw-vs-continued: o erro auditado nao e automaticamente o mesmo erro raw/genuine-main sem uma ponte explicita.

Esses riscos devem ser resolvidos por uma ponte audit-only, nao por `oddRef` e nao por promocao para rota principal.

## Relacao com a rota principal

| Alvo | Caminho atual encontrado? | Observacao |
|---|---|---|
| `C2ExpandedCutoffScaledBound` | Nao diretamente a partir da positive box | A rota expanded usa sua propria majoracao escalada de cutoff. A positive box ainda nao fornece esse campo. |
| `C2ExpandedQuartetDominance` | Nao diretamente pelo certificado positive-box atual | Existe maquinario em `AuditContinuedQuartetVSplit.lean` que transforma anchor/cut/ledger em dominancia, mas o tile positive-box atual esta organizado como certificado audit-only. |
| `C2CanonicalClosedScaledLocalData` | Nao | Falta bridge entre o tile positive-box e os campos canonical middle. |

O `cut_bound` atual alimenta:

```text
PositiveBoxCertificate
-> PositiveBoxCertificate.toAnchorUpperData
-> positiveBox_qratio_sectorResidualDominance
```

Isso permanece audit-only. Nao foi encontrado theorem que leve diretamente o `cut_bound` da positive box refinada para `C2CanonicalClosedScaledLocalData`.

## Lemmas e conectores relevantes

| Lemma / definicao | Papel |
|---|---|
| `cutVec_eq_continuedCutoffError` | ponte ja existente entre `cutVec` e `c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel` |
| `c2ContinuedCutoffExactUpper` | norma exata do erro de cutoff continuado |
| `c2ContinuedCutoff_norm_le_triangle` | majoracao triangular por norma retangular mais norma do canal central continuado |
| `c2ContinuedCutoff_norm_le_closedUpper_of_bounds` | transforma bounds separados em bound fechado para o erro continuado |
| `vSplit_norm_le_anchorUpper_add_cutUpper` | usa `anchor` e `cutVec` para majorar o split vertical |
| `vSplitQRatio_quartetDominance_of_ledger` | consome bounds de anchor/cut/ledger para produzir dominancia expanded auditada |

O conector mais proximo ja existente e `cutVec_eq_continuedCutoffError`. Ele resolve a identidade semantica, mas nao resolve a origem permitida do bound `3 / 1000`.

## Bridge audit-only minimo

O menor proximo passo nao deve criar operador novo. Deve ser uma ponte/wrapper audit-only usando definicoes existentes.

Forma recomendada:

```text
se, na positive box,
c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s <= positiveBoxCutUpperValue,
entao
||cutVec positiveBoxK positiveBoxM s|| <= positiveBoxCutUpperValue.
```

Essa ponte usaria apenas:

- `cutVec_eq_continuedCutoffError`
- a definicao existente de `c2ContinuedCutoffExactUpper`
- `positiveBoxCutUpperValue = 3 / 1000`

Ela nao prova o bound numerico. Ela apenas impede que a prova futura confunda erro retangular puro com erro contra canal continuado.

Se a intencao for uma rota genuine-first mais forte, a ponte deve antes escolher explicitamente um alvo central abstrato ja existente via `c2ConcreteCutoffErrorFromTarget targetF`, e so depois comparar esse alvo com o canal continuado. Essa comparacao deve permanecer audit-only ate existir alinhamento com a rota canonical.

## Verificacoes

- Nenhum arquivo Lean foi editado.
- Nenhuma prova de `cut_bound` foi tentada.
- `anchor_bound`, odd truncation e `oddRef` nao foram tocados.
- Nada foi promovido para rota principal.
- Build Lean adicional nao era necessario para esta etapa, pois o entregavel e somente relatorio.

## Conclusao

`cutVec positiveBoxK positiveBoxM s` nao e um objeto finito/retangular puro: ele e o erro entre `rectangularGenuine s 3 50` e `continuedCentralOddChannel s`. Logo, o alvo `||cutVec|| <= 3 / 1000` deve ser precedido por uma ponte audit-only que fixe a semantica de cutoff antes da prova numerica.

## Recomendacao final

B. create/adjust cutoff bridge first
