# Audit Adjusted Quartet Projected J0 Real Mapping

Data: 2026-07-08.

Rota: Genuine-First. Este inventario mapeia nomes Lean reais do adjusted quartet
para o shim projetivo abstrato, sem tentar provar os bounds globais.

## Arquivos inspecionados

- `LeanC2/AuditAdjustedQuartetRoute.lean`
- `LeanC2/AuditContinuedQuartetDominance.lean`
- `LeanC2/AuditGenuineMiddleExactGapFrontier.lean`
- `LeanC2/PeerReview.lean`
- `LeanC2/Analytic/GenuineBulkConcrete.lean`
- `LeanC2/Route/BulkConcrete.lean`
- `LeanC2/Route/BulkQuartet.lean`

## Inventario dos papeis do shim

| papel no shim | candidato Lean real | tipo esperado | status | observacao |
|---|---|---:|---|---|
| `M(s)` | `c2ConcreteAntiMiracleAdjustedAmplitude tiltSeed s * verticalQuartetPrefix (c2ConcreteAntiMiracleAdjustedRatio s)` | `ℂ` | existe como expressao | O lower atual `c2ConcreteAntiMiracleAdjustedMain tiltSeed s` e exatamente a norma desta expressao. Para a rota auditada, `tiltSeed := c2OddTailBalancingSeed coreCutoff K M`. |
| `D0(s)` | `c2ConcreteAntiMiracleAdjustedError0 coreCutoff s` | `ℂ` | existe | Alias direto de `c2ConcreteOddHorizontalLayerDefect coreCutoff s 0`. Este e o candidato natural para a camada dominante `j0`. |
| `Drest(s)` | `c2ConcreteAntiMiracleAdjustedError1 coreCutoff s + c2ConcreteAntiMiracleAdjustedError2 coreCutoff s + c2ConcreteAntiMiracleAdjustedError3 coreCutoff s` | `ℂ` | falta alias compacto | As tres camadas existem individualmente. Ainda falta um alias leve para o resto horizontal do quartet `j1+j2+j3`. |
| `Rvec(s)` | `c2ConcreteAntiMiracleAdjustedTail tiltSeed coreCutoff K M s` | `ℂ` | existe, mas precisa decidir o total | Este e o tail complexo apos remover o adjusted quartet do finite model. Nao e a soma real das cotas. Se o consumidor for apenas o adjusted quartet, entao `Rvec = 0`; se o consumidor for finite model, entao `Rvec` deve ser o adjusted tail complexo. |
| `total(s)` | `c2ConcreteAntiMiracleAdjustedQuartet tiltSeed coreCutoff s` ou `c2ConcreteAntiMiracleFiniteModel tiltSeed coreCutoff K M s` | `ℂ` | existem duas escolhas | Para o ledger interno do quartet: `total = AdjustedQuartet`. Para o ledger incluindo tails/cutoff: `total = FiniteModel`, usando `FiniteModel = AdjustedQuartet + AdjustedTail`. |
| `mainLower(s)` | `c2ConcreteAntiMiracleAdjustedMain tiltSeed s` | `ℝ` | existe | E uma cota exata/natural para `‖M(s)‖`, pois e definida como a norma do main ajustado. |
| `parallelUpper(s)` | bound para `destructiveParallel M(s) D0(s)` | `ℝ` | falta bound novo | Este e o novo boleto projetivo. A rota atual ainda paga `D0` por norma dentro de `AdjustedDefect`. |
| `restUpper(s)` | bound para `‖Drest(s) + Rvec(s)‖`, ou variante separada `‖Drest(s)‖ + ‖Rvec(s)‖` | `ℝ` | parcialmente existe | Existem uppers reais para tail horizontal, tilt tail e cutoff, mas eles nao sao `Rvec`. Tambem falta separar `Drest` da soma bruta `AdjustedDefect`. |

## Nomes reais encontrados

### Quartet ajustado

- `c2ConcreteAntiMiracleAdjustedAmplitude (tiltSeed : ℂ → ℂ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedRatio : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedError0 (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedError1 (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedError2 (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedError3 (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedQuartet (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleHorizontalQuartet (coreCutoff : ℕ → ℕ) : ℂ → ℂ`

### Tails e defeitos complexos

- `c2ConcreteOddHorizontalLayerDefect (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ`
- `c2ConcreteOddHorizontalDefect (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleHorizontalTail (coreCutoff : ℕ → ℕ) : ℂ → ℂ`
- `c2ConcreteAntiMiracleAdjustedTail (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) : ℂ → ℂ`
- `c2ConcreteCutoffError (K M : ℕ) : ℂ → ℂ`
- `c2QuartetVerticalTail : ℂ → ℂ`

### Uppers reais ja existentes

- `c2ConcreteAntiMiracleAdjustedMain (tiltSeed : ℂ → ℂ) : ℂ → ℝ`
- `c2ConcreteAntiMiracleAdjustedDefect (coreCutoff : ℕ → ℕ) : ℂ → ℝ`
- `c2ConcreteAntiMiracleHorizontalTailUpper (...) : ℂ → ℝ`
- `c2ConcreteAntiMiracleAdjustedTailScaledUpper (...) : ℂ → ℝ`

## Identidades ja existentes

- `c2ConcreteAntiMiracleAdjustedQuartet_eq_errorSplit` abre o adjusted quartet
  como quatro camadas `A β^j + Ej`.
- `c2ConcreteAntiMiracleAdjustedQuartet_eq_quartet_add_tiltPrefix_add_horizontalQuartet`
  separa quartet vertical, prefixo de tilt e horizontal quartet.
- `c2ConcreteAntiMiracleFiniteModel_eq_adjustedQuartet_add_tail` prova
  `FiniteModel = AdjustedQuartet + AdjustedTail`.
- `c2ConcreteAntiMiracleAdjustedTail_eq_expanded_of_re_pos` abre o adjusted tail
  complexo em tail vertical, tail de tilt, horizontal tail e cutoff complexo.

## Ponto atual da rota auditada

`AdjustedQuartetAudit.PointwiseBounds.dominance` ainda usa:

```text
AdjustedMain - AdjustedDefect - AdjustedTailScaledUpper > 0
```

onde `AdjustedDefect` e:

```text
|E0| + |E1| + |E2| + |E3|
```

O novo shim troca a primeira parcela horizontal por moeda projetiva:

```text
mainLower + parallelUpper + restUpper
```

com consumidor pontual:

```text
mainLower ≤ ‖M‖
destructiveParallel M D0 ≤ parallelUpper
‖Drest + Rvec‖ ≤ restUpper
parallelUpper + restUpper < mainLower
total = M + D0 + Drest + Rvec
------------------------------------------------
total ≠ 0
```

## Rvec versus restUpper

`Rvec : ℂ` e vetor complexo.

`restUpper : ℝ` e cota real.

As quantidades de tail/cutoff ja existentes na rota auditada sao majorantes
reais. Elas podem entrar em `restUpper`, mas nao podem ser usadas como definicao
de `Rvec`.

## Shim criado

Arquivo:

- `LeanC2/AuditAdjustedQuartetProjectedJ0RealMap.lean`

Estrutura:

- `C2.AdjustedQuartetProjectedJ0RealMap.AdjustedQuartetProjectedJ0RealPointData`

Teorema:

- `C2.AdjustedQuartetProjectedJ0RealMap.AdjustedQuartetProjectedJ0RealPointData.total_ne_zero`

O arquivo importa apenas:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0Shim
```

Nao importa a rota auditada grande. Isso mantem o shim leve e sem acoplar ainda
os objetos reais.

## Componentes que ainda faltam

1. Alias complexo para `Drest = E1 + E2 + E3`.
2. Escolha formal do total:
   - `AdjustedQuartet`, com `Rvec = 0`; ou
   - `FiniteModel`, com `Rvec = AdjustedTail`.
3. Bound novo `parallelUpper` para `destructiveParallel M D0`.
4. Bound novo `restUpper` para `Drest + Rvec`, ou a variante separada.
5. Substituir o uso bruto de `AdjustedDefect` por uma estrutura projetiva.

## Proxima recomendacao

O proximo passo pequeno mais objetivo e criar aliases leves:

```text
adjustedProjectedJ0_M
adjustedProjectedJ0_D0
adjustedProjectedJ0_Drest
adjustedProjectedJ0_totalQuartet
adjustedProjectedJ0_RvecTail
```

Depois disso, provar a identidade algebraica:

```text
AdjustedQuartet = M + D0 + Drest
```

e, em seguida, a variante:

```text
FiniteModel = M + D0 + Drest + AdjustedTail
```

Somente depois vale atacar os tres bounds: `mainLower`, `parallelUpper` e
`restUpper`.
