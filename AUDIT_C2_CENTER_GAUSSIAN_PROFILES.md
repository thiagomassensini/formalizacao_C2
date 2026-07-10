# AUDIT_C2_CENTER_GAUSSIAN_PROFILES

## Escopo

Arquivo Lean:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Script:

```text
gemini-code-1783101614806.py
```

Objetivo: separar os perfis finitos/infinito do carrier C2 center Gaussian sem
misturar a convergencia formal de `X` fixo com o perfil empirico de `X`
dinamico.

## Perfis classificados

### 1. Carrier formal com escala fixa

Objeto:

```lean
c2CenterGaussianSeries X s
```

Este e o carrier infinito formal. A convergencia ja fechada vale para `X` fixo:

```lean
tendsto_c2CenterGaussianByCenterCutoff_diag
```

Hipoteses:

```text
0 < X
0 < s.re
```

### 2. Aproximacao formal diagonal com escala fixa

Objeto:

```lean
c2CenterGaussianByCenterCutoff X s N N
```

Este e o finite carrier diagonal que converge para `c2CenterGaussianSeries X s`.

### 3. Perfil empirico do script

Objeto audit-only criado:

```lean
c2CenterGaussianScriptProfile xFactor s nmax K
```

Definicao:

```lean
c2CenterGaussianByCenterCutoff ((nmax : ℝ) / xFactor) s nmax K
```

Lemma registrado:

```lean
c2CenterGaussianScriptProfile_eq
```

Este perfil corresponde ao modo empirico:

```text
X = nmax / xFactor
K = bg_kmax
```

Portanto ele nao e a mesma familia do theorem diagonal de `X` fixo. Ele e uma
familia dinamica em que o cutoff central e a escala Gaussian crescem juntos.

## Script

O script passou a aceitar dois modos:

```text
--x-factor 3.0
```

usa:

```text
X = nmax / x_factor
```

e:

```text
--x-fixed <valor>
```

usa `X` fixo, permitindo comparar diretamente o perfil empirico dinamico com
aproximacoes em escala fixa.

## Confirmacao

Nao foi criado endpoint novo. O perfil dinamico foi apenas nomeado e
classificado.

## Proxima acao

Usar os dois modos do script para comparar estabilidade:

```text
X fixo
X = nmax / x_factor
K fixo
K crescente
```

O objetivo empirico agora e verificar quais minimos do carrier persistem quando
`nmax`, `X` e `K` variam.
