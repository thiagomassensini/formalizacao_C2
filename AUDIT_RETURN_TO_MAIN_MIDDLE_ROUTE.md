# AUDIT_RETURN_TO_MAIN_MIDDLE_ROUTE

## Escopo

Esta etapa congela a positive box como tile audit-only / refinamento opcional
e prepara o retorno para a rota middle principal/canonical. Nenhum bound novo
foi provado e nenhum arquivo Lean foi alterado.

## Classificacao positive-box

| Arquivo | Classificacao | Entra como `MAIN_ROUTE_INPUT`? | Observacao |
|---|---|---:|---|
| `LeanC2/AuditContinuedQuartetPositiveBox.lean` | `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT` | Nao | certificado audit-only da tile |
| `LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean` | `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT` | Nao | q endpoints, q bounds e ledger reduction |
| `LeanC2/AuditContinuedQuartetPositiveBoxSector.lean` | `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT` | Nao | q phase e `sector_lower` fechado |
| `LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean` | `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT` | Nao | ponte condicional de cutoff |
| `LeanC2/AuditContinuedQuartetPositiveBoxConsolidated.lean` | `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT` | Nao | consolida campos fechados e pendencias |
| `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean` | `AUDIT_SHIM / FROZEN` | Nao | shim congelado |
| `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean` | `AUDIT_SHIM / FROZEN` | Nao | bridge shim congelado |

## O que a positive box entregou

Fechado na positive box:

- q endpoint bounds;
- q norm bounds;
- q phase bounds;
- `sector_lower` na subbox refinada.

Consolidado mas condicional:

- `cut_bound` via `c2ContinuedCutoffExactUpper`;
- ledger via `PositiveBoxRemainingChannelData`.

Aberto/perigoso:

- `anchor_bound`;
- `cutoff_upper_bound`;
- odd truncation / horizontal source.

Esses campos nao devem ser perseguidos agora, porque a tile ainda nao e
route-compatible.

## Rota principal/canonical

### `C2CanonicalClosedScaledLocalData`

Local: `LeanC2/Analytic/GenuineBulkConcrete.lean:14231`.

Campos:

- `horizontalScale_pos`
- `horizontalConstant_nonneg`
- `horizontalRatio_nonneg`
- `horizontalRatio_lt_one`
- `horizontalLayer_bound`
- `quartet_dominance`

Este e o menor endpoint principal/canonical ainda util. Ele e o alvo local que
alimenta os wrappers middle/canonical ja existentes.

### `C2ExpandedHorizontalLayerBudget`

Local: `LeanC2/Analytic/GenuineBulkConcrete.lean:10598`.

Conteudo: bound por camada para
`c2ConcreteOddHorizontalLayerDefect coreCutoff s j`.

A positive box nao fornece esse campo. Ela possui apenas uma upper horizontal
q-ratio agregada usada no ledger audit-only.

### `C2ExpandedQuartetDominance`

Local: `LeanC2/Analytic/GenuineBulkConcrete.lean:6884`.

Conteudo: left upper expanded abaixo de `c2ExpandedQuartetK2Margin s`.

A positive box nao fornece esse campo. Ela prova uma dominancia audit-only
contra true-prefix/setor, nao contra a margem publica da rota expanded.

### `C2ExpandedSeedScaledBound`

Local: `LeanC2/Analytic/GenuineBulkConcrete.lean:9912`.

Conteudo: `c2ExpandedSeedScaledLeft ... s <= tiltConstant s`.

A positive box nao identifica seu tilt q-ratio com este seed scaled bound.

### `C2ExpandedCutoffScaledBound`

Local: `LeanC2/Analytic/GenuineBulkConcrete.lean:9939`.

Conteudo: `c2ExpandedCutoffScaledLeft K M cutoffScale s <= cutoffConstant s`.

A positive box fornece apenas uma ponte condicional para o cutoff exact upper
local. Isso nao preenche o cutoff scaled da rota expanded/canonical.

## Residual canonical chain

Objetos auditados:

- `c2CanonicalClosedScaledResidualUpper`
- `c2CanonicalClosedScaledResidualMajorant`
- `c2CanonicalClosedScaledResidualVerticalBudgetUpper`

Constructors relevantes:

- `C2CanonicalClosedScaledLocalData.of_residualDominance`
- `C2CanonicalClosedScaledLocalData.of_analyticResidualDominance`
- `C2CanonicalClosedScaledLocalData.of_majorantAnalyticResidualDominance`
- `C2CanonicalClosedScaledLocalData.of_verticalBudgetAnalyticResidualDominance`
- `C2CanonicalClosedScaledLocalData.of_verticalBudgetAnalyticResidualTruncationBounds`

Essa cadeia mostra que a rota canonical tem um caminho proprio:

```text
C2ExpandedOddTruncationBudget
  + vertical budget
  + residual vertical-budget inequality
  -> C2CanonicalClosedScaledLocalData
```

Esse caminho nao importa a positive box como prova.

## Respostas

1. Menor endpoint principal/canonical ainda util:
   `C2CanonicalClosedScaledLocalData`.

2. Proximo alvo entre `horizontalLayer_bound`, `quartet_dominance` e residual
   majorant:
   nao atacar prova ainda. A proxima acao deve ser auditar as definicoes do
   residual majorant canonical antes de escolher a prova.

3. O que a positive box pode inspirar sem ser importada:
   q-size discipline, ledger bookkeeping, separacao entre sector geometry e
   upper residual, e a ideia de consolidar pendencias em uma estrutura minima.
   Nada disso entra como prova da rota principal.

4. Proximo sublema Lean real da rota principal:
   uma futura instancia pointwise do hdominance em
   `C2CanonicalClosedScaledLocalData.of_verticalBudgetAnalyticResidualTruncationBounds`,
   depois de auditar os envelopes usados por
   `c2CanonicalClosedScaledResidualVerticalBudgetUpper`.

## Congelamento

- Nao desenvolver mais positive box nesta fase.
- Nao atacar `anchor_bound`.
- Nao atacar `cutoff_upper_bound`.
- Nao atacar odd truncation / horizontal source pela tile positive-box.
- Nao retomar `oddRef`.
- Nao promover arquivos positive-box para a rota principal.

## Guardrails

- Nenhuma prova nova foi criada.
- Nenhum operador novo foi criado.
- Nenhum arquivo Lean foi editado.
- `oddRef` permaneceu congelado.
- Positive box permanece `ACTIVE_AUDIT_TILE / OPTIONAL_REFINEMENT`.
- Shims odd-reference permanecem `AUDIT_SHIM / FROZEN`.
- Nada foi promovido para a rota principal.
- A busca textual pelos termos vedados solicitados deve permanecer limpa para
  este relatorio.

## Recomendacao final

D. audit canonical residual majorant definitions first
