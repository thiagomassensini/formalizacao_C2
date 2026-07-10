# AUDIT_C2_CENTER_GAUSSIAN_CENTER_CUTOFF

## Escopo

Arquivo Lean atualizado:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Objetivo: criar o finite carrier audit-only que espelha o corte por centro do
script `gemini-code-1783101614806.py`.

## Corte por centro

Definicao criada:

```lean
c2CenterGaussianCoreBound nmax k := (nmax - 1) / (2 ^ k)
```

Isto codifica a condicao:

```text
2^k * m + 1 <= nmax
```

como:

```text
m <= (nmax - 1) / 2^k
```

## Carrier finito criado

Definicao criada:

```lean
c2CenterGaussianByCenterCutoff X s nmax K
```

Ela soma:

```text
2 <= k <= K
m impar
2^k*m + 1 <= nmax
```

usando exatamente:

```lean
c2CenterGaussianAddressTerm X s k m
```

como termo local.

## Lemas de pertencimento

Foram provados:

```lean
c2CenterGaussianByCenterCutoff_inner_odd
c2CenterGaussianByCenterCutoff_inner_center_le
c2CenterGaussianByCenterCutoff_inner_mem_of_center_le
c2CenterGaussianByCenterCutoff_inner_mem_iff
```

O lema principal e:

```lean
m ∈ oddCoresUpTo (c2CenterGaussianCoreBound nmax k)
  ↔ Odd m ∧ 2 ^ k * m + 1 ≤ nmax
```

Logo, o inner finset do Lean coincide com a condicao de indice usada pelo
script.

## Formula local

Foi adicionado:

```lean
c2CenterGaussianAddressTerm_eq_center_pow_formula
```

que reescreve o termo local como:

```text
2 * (1/2)^k
  * complexDirichletCoeff s (2^k*m)
  * superGaussianCutoffWeight 2 X (2^k*m)
```

Isto fixa a normalizacao em notacao direta.

## Verificacao

Comando executado:

```text
lake env lean LeanC2/AuditC2CenterGaussianCarrier.lean
```

Resultado: passou.

## Proximo passo

O eixo finito agora esta alinhado:

```text
script finite center cutoff
  <-> c2CenterGaussianByCenterCutoff
  <-> c2CenterGaussianAddressTerm
```

O proximo passo natural e provar a inclusao do corte por centro em um retangulo
adequado, por exemplo usando o menor depth `k = 2` para obter um bound global
em `m`.
