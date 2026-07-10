# AUDIT_CANONICAL_RESIDUAL_MAJORANT_DEFINITIONS

## Escopo

Esta auditoria abre a cadeia canonical de residual majorant da rota middle
principal. Nenhum arquivo Lean foi editado, nenhuma prova nova foi criada e
nenhum objeto positive-box foi tocado.

## Definicoes localizadas

| Objeto | Local | Definicao / papel |
|---|---:|---|
| `c2CanonicalClosedScaledResidualUpper` | `LeanC2/Analytic/GenuineBulkConcrete.lean:9129` | residual upper canonical como `c2ExpandedQuartetResidualUpper` com tilt/cutoff canonical e escalas unitarias |
| `c2CanonicalClosedScaledResidualMajorant` | `LeanC2/Analytic/GenuineBulkConcrete.lean:9170` | vertical closed upper vezes `2 * (1 - norm q)^{-1}` + horizontal regularizado vezes o mesmo fator + cutoff canonical |
| `c2CanonicalClosedScaledResidualVerticalBudgetUpper` | `LeanC2/Analytic/GenuineBulkConcrete.lean:9184` | mesma majorant, mas troca a parte vertical canonical por um `verticalUpper` externo |
| `c2ExpandedQuartetResidualMargin` | `LeanC2/Analytic/GenuineBulkConcrete.lean:6836` | `c2ExpandedQuartetK2Margin s - c2QuartetVerticalTailUpper s` |
| `c2AnalyticBulkAllowance` | `LeanC2/Route/BulkReal.lean:6` | `norm (q s)^2 / (1 + norm (q s))` |
| `c2ExpandedQuartetResidualReserve` | `LeanC2/Analytic/GenuineBulkConcrete.lean:6843` | `2 * norm (q s)^6 / (1 - norm (q s)^2)` |
| `C2CanonicalClosedScaledLocalData` | `LeanC2/Analytic/GenuineBulkConcrete.lean:14231` | local canonical data: scale signs, horizontal layer bound, quartet dominance |
| `C2ExpandedHorizontalLayerBudget` | `LeanC2/Analytic/GenuineBulkConcrete.lean:10598` | bound por camada para `c2ConcreteOddHorizontalLayerDefect coreCutoff s j` |
| `C2ExpandedQuartetDominance` | `LeanC2/Analytic/GenuineBulkConcrete.lean:6884` | `c2ExpandedQuartetLeftUpper ... s < c2ExpandedQuartetK2Margin s` |

## Endpoints localizados

| Endpoint | Local | Hipotese dominante |
|---|---:|---|
| `mathlibRiemannHypothesis_of_continuationAndCanonicalClosedScaledMiddleResidualPointwiseBounds` | `LeanC2/Analytic/GenuineBulkConcrete.lean:17050` | residual upper pointwise `< c2ExpandedQuartetResidualMargin` |
| `mathlibRiemannHypothesis_of_continuationAndCanonicalClosedScaledMiddleResidualMajorantBounds` | `LeanC2/Analytic/GenuineBulkConcrete.lean:17290` | residual majorant `< c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve` |
| `mathlibRiemannHypothesis_of_continuationAndCanonicalClosedScaledMiddleResidualVerticalBudgetBounds` | `LeanC2/Analytic/GenuineBulkConcrete.lean:17466` | external vertical bound + vertical-budget residual upper `< allowance - reserve` |

All three endpoints also require the scale sign fields and
`C2ExpandedHorizontalLayerBudget` throughout the middle region.

## Formula do residual majorant

`c2CanonicalClosedScaledResidualUpper` e uma definicao abstrata no sentido de
que reaproveita `c2ExpandedQuartetResidualUpper` com os parametros canonical.
Ela tambem e operacional, porque seus parametros canonical desdobram para:

```text
tilt canonical:
  (closed vertical residual upper + horizontal regularized upper)
    * (1 + norm q)

cutoff canonical:
  closed cutoff upper from rectangular direct/bracket upper
  and continued central exact upper
```

`c2CanonicalClosedScaledResidualMajorant` e a forma operacional mais clara:

```text
closed vertical residual upper * (2 * (1 - norm q)^-1)
+ horizontal regularized upper * (2 * (1 - norm q)^-1)
+ canonical cutoff upper
```

`c2CanonicalClosedScaledResidualVerticalBudgetUpper` troca apenas a parte
vertical por um `verticalUpper` externo:

```text
verticalUpper * (2 * (1 - norm q)^-1)
+ horizontal regularized upper * (2 * (1 - norm q)^-1)
+ canonical cutoff upper
```

## Pecas presentes no majorant

| Peca | Presente? | Como aparece |
|---|---:|---|
| vertical | Sim | `c2ContinuedVerticalResidualClosedUpper ... c2ContinuedCentralExactUpper` |
| horizontal | Sim | `c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio` |
| cutoff | Sim | `c2CanonicalClosedCutoffConstant K M` |
| tilt | Sim, indiretamente | absorvido na passagem do residual upper para o majorant |
| seed | Nao como campo separado | entra pela leitura canonical do tilt/residual |
| reserva de quarteto | Sim no alvo | lado direito usa `c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve` |

## Canal e guardrails

O majorant nao chama diretamente `continuedOddDirichletChannel`. Contudo, ele
usa `c2ContinuedCentralExactUpper`, que e:

```text
fun s => norm (continuedCentralOddChannel s)
```

e `continuedCentralOddChannel` e obtido de `continuedOddDirichletChannel`.
Portanto, o majorant e canonical e mecanicamente integrado a rota, mas nao deve
ser tratado como escalar puro em `q`. Ele precisa de guardrail de canal quando
for transformado em bound numerico.

As partes puramente geometricas em `q` sao:

- `c2AnalyticBulkAllowance`;
- `c2ExpandedQuartetResidualReserve`;
- `c2ExpandedQuartetResidualMargin`, depois da igualdade off-critical com
  allowance menos reserve.

## Cadeias de endpoint

### A. Residual pointwise

```text
c2CanonicalClosedScaledResidualUpper
  < c2ExpandedQuartetResidualMargin
=> C2CanonicalClosedScaledLocalData
=> middle local/canonical endpoint
=> terminal RH endpoint
```

### B. Residual majorant

```text
c2CanonicalClosedScaledResidualUpper
  <= c2CanonicalClosedScaledResidualMajorant

c2CanonicalClosedScaledResidualMajorant
  < c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve
=> C2CanonicalClosedScaledLocalData
=> middle local/canonical endpoint
=> terminal RH endpoint
```

The comparison `upper <= majorant` already exists as
`c2CanonicalClosedScaledResidualUpper_le_majorant_of_offCriticalStrip`.

### C. Vertical budget

```text
external vertical upper
=> c2CanonicalClosedScaledResidualVerticalBudgetUpper
=> c2CanonicalClosedScaledResidualMajorant
=> C2CanonicalClosedScaledLocalData
=> middle local/canonical endpoint
=> terminal RH endpoint
```

The comparison from majorant to vertical budget already exists as
`c2CanonicalClosedScaledResidualMajorant_le_verticalBudget_of_offCriticalStrip`,
assuming the external vertical upper dominates the canonical closed vertical
piece.

## Classificacao de proximos subalvos

| Alvo | Classificacao | Estado |
|---|---|---|
| `horizontalLayer_bound` | `HORIZONTAL_BUDGET` | necessario em todos os endpoints canonical; mais limpo que vertical/cutoff channel work |
| `c2CanonicalClosedScaledResidualMajorant < c2ExpandedQuartetResidualMargin` | `CHANNEL_DEPENDENT` | majorant inclui vertical/cutoff via `c2ContinuedCentralExactUpper` |
| external vertical bound for `c2CanonicalClosedScaledResidualVerticalBudgetUpper` | `VERTICAL_BUDGET` | util, mas depende de escolher e auditar `verticalUpper` |
| `c2CanonicalClosedScaledResidualUpper <= c2CanonicalClosedScaledResidualMajorant` | `SCALAR_GEOMETRY` | ja existe theorem off-critical |
| positivity of `c2ExpandedQuartetResidualMargin` | `SCALAR_GEOMETRY` | geometria em `q`; nao fecha o endpoint sozinha |
| comparison with `c2AnalyticBulkAllowance` and reserve | `SCALAR_GEOMETRY` | igualdade off-critical ja existe; uso posterior deve cuidar dos denominadores |

## Risco por definicao auditada

| Objeto | Terminal analytic identifier? | `continuedOddDirichletChannel`? | `continuedCentralOddChannel`? | raw `oddDirichletChannel`? | Usa `1 < s.re`? | Genuine-first seguro antes da transferencia? |
|---|---:|---:|---:|---:|---:|---|
| `c2CanonicalClosedScaledResidualUpper` | indireto | indireto | indireto | nao | nao imediato | com guardrail |
| `c2CanonicalClosedScaledResidualMajorant` | indireto | indireto | indireto | nao | nao imediato | com guardrail |
| `c2CanonicalClosedScaledResidualVerticalBudgetUpper` | indireto via cutoff canonical | indireto | indireto | nao | nao imediato | com guardrail |
| `c2ExpandedQuartetResidualMargin` | nao | nao | nao | nao | nao | sim |
| `c2AnalyticBulkAllowance` | nao | nao | nao | nao | nao | sim |
| `c2ExpandedQuartetResidualReserve` | nao | nao | nao | nao | nao | sim |
| `C2CanonicalClosedScaledLocalData` | depende dos campos fornecidos | depende dos campos fornecidos | depende dos campos fornecidos | via horizontal field, se usado | nao imediato | sim, se campos forem genuine-first |
| `C2ExpandedHorizontalLayerBudget` | nao imediato | nao imediato | nao | possivel via definicoes horizontais | nao imediato | sim, e o melhor proximo alvo |
| `C2ExpandedQuartetDominance` | depende dos uppers fornecidos | depende dos uppers fornecidos | depende dos uppers fornecidos | nao imediato | nao imediato | sim, se uppers forem genuine-first |

## Observacoes sobre barreiras existentes

O arquivo ja contem lemmas `FORMAL_BARRIER` mostrando que certas versoes
finitas terminal-envelope do residual canonical sao grandes demais para a
margem analytic-reserve. Isso reforca que a proxima prova nao deve atacar uma
upper terminal grossa. A rota deve primeiro fechar o budget horizontal canonical
e manter separados os objetos de vertical/cutoff que sao channel-dependent.

## Verificacao

Nenhum Lean foi editado, entao build adicional nao era necessario para validar
esta auditoria documental. O relatorio novo foi submetido a busca textual pelo
padrao solicitado e mantido limpo.

## Recomendacao final

B. audit/prove horizontalLayer_bound next
