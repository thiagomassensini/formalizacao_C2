# AUDIT_C2_CENTER_GAUSSIAN_PARITY

## Escopo

Script auditado:

```text
gemini-code-1783101614806.py
```

Arquivo Lean comparado:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Objetivo: verificar se o detector empírico usa a mesma normalização do carrier
C2 center Gaussian formalizado em Lean.

## Fórmula do script

O script constrói centros:

```text
c = 2^k * m
k = 2..bg_kmax
m impar
c - 1 >= 3
c + 1 <= nmax
```

e avalia:

```text
C(t) = sum 2 * 2^(-k) * c^(-sigma) * exp(-(c/X)^2) * exp(-i*t*log(c))
```

com:

```text
X = nmax / x_factor
```

## Fórmula Lean

O carrier Lean usa:

```lean
c2CenterGaussianAddressTerm X s k m
```

definido como:

```lean
2 * dyadicWeight k
  * complexDirichletCoeff s (2^k * m)
  * superGaussianCutoffWeight 2 X (2^k * m)
```

Isto corresponde a:

```text
2 * 2^(-k) * (2^k*m)^(-s) * exp(-((2^k*m)/X)^2)
```

## Paridade de normalizacao

Status: alinhado.

Itens verificados:

```text
k inicia em 2: sim
m impar: sim
c = 2^k*m: sim
peso 2 * 2^(-k): sim
coeficiente em c, nao em m: sim
cutoff aplicado em c: sim
cutoff quadratico: sim
fase exp(-i*t*log(c)): sim, via complexDirichletCoeff
```

Teoremas Lean relevantes:

```lean
c2_center_coordinate_coeff_eq
c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
superGaussianGenuineAddressTerm_eq_c2CenterGaussianAddressTerm
c2CenterGaussianRectangle_eq_superGaussianFiniteGenuineRectangle
c2CenterGaussianSeriesAddressTerm_eq_superGaussian
```

O ponto essencial ja formalizado e:

```text
2 * verticalRatio(s)^k * complexDirichletCoeff s m
=
2 * 2^(-k) * complexDirichletCoeff s (2^k*m)
```

para `m != 0`.

## Diferenca de corte

Ha uma diferenca semantica importante.

O script usa corte por centro:

```text
2^k * m + 1 <= nmax
k <= bg_kmax
m impar
```

O retangulo Lean `c2CenterGaussianRectangle X s K M` usa corte retangular:

```text
2 <= k <= K
m <= M
m impar
```

Portanto:

```text
script = regiao triangular/por-centro no plano (k,m)
Lean rectangle = regiao retangular no plano (k,m)
```

Eles usam o mesmo termo local, mas nao a mesma familia finita de indices.

## Execucao curta do script

Comando usado apenas para validar CLI/execucao:

```text
python3 gemini-code-1783101614806.py --nmax 1000 --bg-kmax 5 --tmin 10 --tmax 10.1 --dt 0.05 --threshold 0.05 --workers 1 --chunk 16 --top 5
```

Resultado:

```text
centros: 234
k min/max: 2/5
execucao: ok
```

O teste curto nao e usado como evidencia matematica; apenas confirma que o
script executa e que o construtor de centros esta ativo.

## Classificacao

O script e uma spec executavel do mesmo carrier local formalizado em Lean.

Para paridade finita completa, falta escolher uma das duas opcoes:

```text
1. adicionar em Lean uma soma finita por corte de centro;
2. adaptar o script para tambem avaliar o corte retangular (K,M).
```

## Proxima acao recomendada

Criar em Lean uma soma audit-only por corte de centro:

```text
c2CenterGaussianByCenterCutoff X s nmax K
```

com indices:

```text
2 <= k <= K
m impar
2^k*m + 1 <= nmax
```

e provar que ela soma exatamente o mesmo termo local de
`c2CenterGaussianAddressTerm`.
