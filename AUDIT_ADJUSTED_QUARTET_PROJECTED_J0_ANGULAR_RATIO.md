# Audit Adjusted Quartet Projected J0 Angular Ratio

Data: 2026-07-08.

Rota: Genuine-First. Esta camada formaliza a leitura angular do custo
projetivo dominante `D0`: em vez de pensar primeiro no tamanho bruto de `D0`,
separa-se a escala do main da direcao relativa `D0 / M`.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0AngularRatio.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Lei Angular

Definicao:

```lean
noncomputable def destructiveRatio (M D : ℂ) : ℝ :=
  max 0 (-((D / M).re))
```

Teorema principal:

```lean
theorem destructiveParallel_eq_norm_mul_destructiveRatio
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D =
      ‖M‖ * destructiveRatio M D
```

Leitura:

```text
destructiveParallel(M,D) = ||M|| * max(0, -Re(D/M)).
```

Assim, a escala do problema fica em `||M||`, e a dificuldade direcional fica
em um escalar angular sem unidade.

Tambem foi criada a forma sem divisao complexa:

```lean
destructiveRatioAlt M D =
  destructiveNumerator M D / (‖M‖ ^ 2)
```

com:

```lean
destructiveParallel M D = ‖M‖ * destructiveRatioAlt M D
```

## Especializacao Para D0/M

Definicoes:

```lean
adjustedProjectedJ0_D0OverM
adjustedProjectedJ0_D0DestructiveRatio
```

Teorema:

```lean
adjustedProjectedJ0_parallelCost_eq_main_mul_destructiveRatio
```

Forma:

```text
adjustedProjectedJ0_parallelCost =
  ||adjustedProjectedJ0_M|| *
    adjustedProjectedJ0_D0DestructiveRatio
```

onde:

```text
adjustedProjectedJ0_D0DestructiveRatio =
  max(0, -Re(D0/M)).
```

## Upper Angular

Definicao:

```lean
adjustedProjectedJ0_parallelUpperFromAngularRatio tiltSeed lambda :=
  fun s => lambda s * adjustedProjectedJ0_mainExactLower tiltSeed s
```

Estrutura regional:

```lean
ProjectedJ0AngularUpperData
```

Campos:

```text
M(s) != 0
0 <= lambda(s)
max(0, -Re(D0(s)/M(s))) <= lambda(s)
```

Conversor:

```lean
ProjectedJ0AngularUpperData.toParallelUpperData
```

Ele gera diretamente um `ProjectedJ0ParallelUpperData` com:

```text
parallelUpper(s) = lambda(s) * mainExactLower(s).
```

## Consumidor Angular

Estrutura finite:

```lean
AdjustedProjectedJ0FiniteAngularBoundedData
```

Budget:

```text
0 < mainExactLower(s)
      - lambda(s) * mainExactLower(s)
      - restUpper(s)
```

Forma conceitual:

```text
(1 - lambda(s)) * ||M(s)|| > restUpper(s).
```

Teorema:

```lean
AdjustedProjectedJ0FiniteAngularBoundedData.total_ne_zero
```

Conclusao:

```lean
∀ s ∈ Region,
  adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

## Fatoracao De D0/M

Foi possivel expandir `D0/M` de forma leve:

```lean
adjustedProjectedJ0_D0OverM_eq_expanded
```

Forma:

```text
D0/M =
  [2 * adjustedRatio^2 *
    (rectangularOddCoreSum(coreCutoff 0) - oddDirichletChannel)]
  /
  [adjustedAmplitude * verticalQuartetPrefix(adjustedRatio)].
```

Tambem compila:

```lean
adjustedProjectedJ0_D0DestructiveRatio_eq_expanded
```

## Limite

Esta camada nao prova um bound concreto para `lambda`. Ela apenas muda a moeda
formal:

```text
parallelCost <= lambda * ||M||
```

em vez de pagar `D0` por norma bruta.

## Proximo Passo

Construir `lambda` por uma destas rotas:

```text
1. geometria branch/tilt/half-disk, com controle setorial de D0/M;
2. atlas intervalar por caixa para max(0, -Re(D0/M));
3. hibrido: geometria para reduzir a faixa de lambda e atlas para fechar
   caixas delicadas.
```
