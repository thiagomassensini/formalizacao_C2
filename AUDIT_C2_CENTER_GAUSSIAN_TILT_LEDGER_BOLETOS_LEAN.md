# AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN

Data: 2026-07-08

## Objetivo

Converter a validacao numerica Python do livro-caixa C2 center Gaussian com tilt
em uma lista operacional de boletos Lean.

Regra da rota:

```text
Genuine-First.
Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore, nem comparacao
externa baseada em zeta como input analitico.
```

Objeto numerico ativo:

```text
C_X(s) = sum_{c = 2^k m} 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)
```

com:

```text
k >= 2
m odd
c = 2^k m
X = nmax / 3
```

Tilt ativo:

```text
delta = sigma - 1/2
transverse-curvature = normalizedTiltCurvature delta c
factor = 1 + lambda * normalizedTiltCurvature delta c
lambda = 1
```

## Conclusao curta

Sim: a validacao Python ja deu informacao suficiente para nao entrar no Lean no
escuro.

Ela identificou:

```text
1. depth nao e o gargalo;
2. center nao e o gargalo na faixa refinada;
3. core/horizontal e o boleto dominante;
4. o pior ponto local fica perto de t = 14.29;
5. o tilt transverse-curvature desloca a virada local para sigma ~= 0.737;
6. a prova Lean deve ser organizada como livro-caixa finito + tail/lift +
   certificado de margem, nao como uma estimativa global grosseira.
```

## Configuracao numerica principal

```text
nmax = 200000
bg_kmax = 12
X = nmax / 3
main_k_max = 5
core_main = 401
center_main_factor = 1.5
center_main = 1.5 * X
tilt_mode = transverse-curvature
tilt_lambda = 1
```

CSV principal de threshold local:

```text
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
```

Comando que gerou a referencia:

```text
python3 operadores/c2_center_gaussian_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.735,0.736,0.737,0.738,0.739,0.740 \
  --tmin 13.8 --tmax 14.5 --dt 0.001 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 2 \
  --csv audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
```

## Resultado local com tilt

Faixa:

```text
t in [13.8, 14.5]
dt = 0.001
701 pontos por sigma
```

Resumo:

```text
sigma    depth pass   core pass   center pass   pior core surplus
0.735    701/701      659/701     701/701       -9.957630e-4
0.736    701/701      673/701     701/701       -4.719706e-4
0.737    701/701      701/701     701/701       +4.937913e-5
0.738    701/701      701/701     701/701       +5.682158e-4
0.739    701/701      701/701     701/701       +1.084336e-3
0.740    701/701      701/701     701/701       +1.598049e-3
```

Piores pontos:

```text
sigma=0.737:
  worst depth surplus  = +5.023430e-2 at t=14.130, coverage=7.804517e-3
  worst core surplus   = +4.937913e-5 at t=14.290, coverage=9.984065e-1
  worst center surplus = +1.742748e-2 at t=14.136, coverage=4.882169e-1
  tilt factor range    = [1.293154, 1.304764]

sigma=0.740:
  worst depth surplus  = +5.076569e-2 at t=14.130, coverage=7.739176e-3
  worst core surplus   = +1.598049e-3 at t=14.289, coverage=9.500250e-1
  worst center surplus = +1.898126e-2 at t=14.136, coverage=4.591559e-1
  tilt factor range    = [1.297585, 1.309398]
```

Interpretacao:

```text
sigma=0.737 e a primeira linha do grid local onde tudo passa, mas a margem core
e muito pequena para ser usada como alvo formal principal.

sigma=0.740 e melhor alvo inicial para Lean: ainda perto da borda, mas com
core surplus positivo de ordem 1.6e-3 e blocos depth/center com folga muito
maior.
```

## Comparacao sem tilt

CSV:

```text
audit_outputs/c2_center_gaussian_ledger_notilt_local_threshold.csv
```

Mesmo grid local:

```text
sigma    depth pass   core pass   center pass   pior core surplus
0.735    701/701      633/701     701/701       -2.124689e-3
0.736    701/701      640/701     701/701       -1.723541e-3
0.737    701/701      647/701     701/701       -1.325197e-3
0.738    701/701      656/701     701/701       -9.296375e-4
0.739    701/701      666/701     701/701       -5.368453e-4
0.740    701/701      682/701     701/701       -1.468017e-4
```

Interpretacao:

```text
Sem tilt, mesmo sigma=0.740 ainda falha no core local.
Com transverse-curvature, sigma=0.737 ja passa no grid e sigma=0.740 ganha
margem core de aproximadamente +1.598e-3.
```

## Rodada global com tilt

CSV:

```text
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_dt005.csv
```

Faixa:

```text
t in [10, 50]
dt = 0.05
801 pontos por sigma
```

Resumo:

```text
sigma    depth pass   core pass   center pass   pior core surplus
0.500    801/801      736/801     718/801       -3.130491e-1
0.600    801/801      774/801     785/801       -4.040748e-2
0.700    801/801      798/801     800/801       -2.068094e-2
0.740    801/801      801/801     801/801       +1.854056e-3
0.750    801/801      801/801     801/801       +6.866401e-3
```

Interpretacao:

```text
Na malha global grosseira, sigma=0.740 e sigma=0.750 passam em depth/core/center.
O refinamento local confirma que o ponto delicado esta perto de t=14.29.
```

## Boletos Lean estimados pela validacao

### Boleto 1: fator inclinado

Status:

```text
pago localmente
```

Arquivo:

```text
LeanC2/Operators/CenterGaussianTilt.lean
```

Ja existe:

```lean
centerGaussianTiltFactor lam delta c =
  1 + lam * normalizedTiltCurvature delta c
```

Boletos pagos:

```text
factor = 1 em delta=0
factor > 1 se lam>0, delta>0, c>1
factor < 1 se lam>0, -1<delta<0, c>1
factor = 1 iff delta=0, sob lam != 0, -1<delta, c>1
```

Constante numerica observada para sigma=0.740:

```text
tilt factor in [1.297585, 1.309398]
```

O que falta:

```text
ligar esse fator ao termo concreto c2CenterGaussianAddressTerm.
```

### Boleto 2: operador center Gaussian inclinado finito

Status:

```text
proximo alvo Lean
```

Definicao esperada:

```lean
c2CenterGaussianTiltedAddressTerm X s lam p :=
  (centerGaussianTiltFactor lam (s.re - 1/2)
    (c2CenterGaussianAddressCenter p : R) : C)
  * c2CenterGaussianSeriesAddressTerm X s p
```

ou versao `(k,m)` equivalente.

O que provar:

```text
1. em s.re = 1/2, o operador inclinado coincide com o operador sem tilt;
2. para sigma>1/2 e lam>0, os pesos reais do tilt sao positivos;
3. o suporte/endereco C2 nao muda;
4. os cortes por depth/core/center continuam sendo filtros do mesmo conjunto.
```

### Boleto 3: livro-caixa finito por blocos

Status:

```text
ponte abstrata paga; falta especializar para depth/core/center C2
```

Ja existe:

```lean
centerGaussianTiltedFiniteLedger_filter_add_filter_not
```

Decomposicoes numericas a espelhar:

```text
depth:
  main = k <= 5
  rest = k > 5

core:
  main = m <= 401
  rest = m > 401

center:
  main = c <= 1.5 X
  rest = c > 1.5 X
```

Boletos Lean:

```text
1. definir os tres filtros sobre o address set finito;
2. provar main + rest = full para cada filtro;
3. formular a desigualdade consumidora:
   ||main|| > ||rest|| -> full != 0.
```

### Boleto 4: certificado numerico finito

Status:

```text
estimado por Python; ainda nao certificado intervalarmente
```

Para sigma=0.740, alvo inicial recomendado:

```text
depth surplus  >= 5.07e-2 no grid local
core surplus   >= 1.59e-3 no grid local
center surplus >= 1.89e-2 no grid local
```

Usar com folga formal conservadora:

```text
depth_margin_candidate  = 4.0e-2
core_margin_candidate   = 1.0e-3
center_margin_candidate = 1.0e-2
```

Observacao:

```text
O core e o boleto dominante. Qualquer cota de erro numerico + interpolacao +
tail maior que 1.0e-3 destruiria o alvo sigma=0.740. Para uma primeira prova,
ou aumenta-se sigma, ou melhora-se a certificacao do core.
```

Para sigma=0.750:

```text
core surplus local >= 6.605718e-3
core surplus global dt=0.05 >= 6.866401e-3
```

Uso recomendado:

```text
sigma=0.750 e melhor alvo de primeira formalizacao porque deixa margem core
de ordem 6e-3.
```

### Boleto 5: grid-to-continuum

Status:

```text
nao pago para o ledger inclinado
```

O CSV so certifica pontos do grid. Para cobrir uma faixa continua em `t`, falta:

```text
1. cota para |d/dt main(t)|;
2. cota para |d/dt rest(t)|;
3. consequencia Lipschitz para surplus(t) = |main(t)| - |rest(t)|;
4. escolher dt tal que erro_interpolacao < margem_grid.
```

Forma consumidora esperada:

```lean
structure LedgerGridCertificate where
  grid_min_surplus : R
  lipschitz_surplus : R
  half_step : R
  interpolation_cost_lt :
    lipschitz_surplus * half_step < grid_min_surplus
```

Criterio:

```text
grid_min_surplus - lipschitz_surplus * dt/2 > 0
```

### Boleto 6: roundoff / reproducibilidade

Status:

```text
nao pago
```

O scanner atual usa `float64`/Numba. Para virar certificado externo ou input
seguro para Lean, falta:

```text
1. reavaliar pontos criticos com aritmetica intervalar ou bolas complexas;
2. registrar erro absoluto de cada soma main/rest;
3. provar que o surplus liquido continua positivo.
```

Forma numerica:

```text
main_lower = |main_float| - err_main
rest_upper = |rest_float| + err_rest
certified_surplus = main_lower - rest_upper
```

### Boleto 7: truncamento e cauda infinita

Status:

```text
carrier sem tilt ja tem infraestrutura de tail em Lean;
tilt precisa de majorante compativel
```

Arquivos relacionados:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
AUDIT_C2_CENTER_GAUSSIAN_TAIL_BUDGET_LEAN.md
```

Ja existe para o carrier:

```text
C2CenterGaussianTailLiftBudget
C2CenterGaussianSigmaTailLiftBudget
C2CenterGaussianCenterThresholdTailLiftBudget
C2CenterGaussianMajorantTailLiftBudget
```

Para o tilt, falta escolher uma cota superior do fator:

```text
tilt_factor <= factor_upper
```

Na faixa observada:

```text
sigma=0.740, nmax=200000, bg_kmax=12:
  factor_upper observado ~= 1.309398

sigma=0.750:
  factor_upper observado ~= 1.324985
```

Boletos Lean:

```text
1. provar cota superior do normalizedTiltCurvature na faixa de centros;
2. ou aceitar factor_upper como campo de certificado finito;
3. multiplicar a cauda majorante existente por factor_upper;
4. provar tail_tilt <= factor_upper * tail_untilted.
```

### Boleto 8: escolha de alvo formal

Recomendacao:

```text
Nao comecar tentando fechar sigma=0.737.
```

Ordem pragmatica:

```text
1. fechar o pipeline Lean para sigma=0.750, onde a margem core e ~6.6e-3;
2. depois repetir para sigma=0.740, onde a margem core e ~1.6e-3;
3. so depois tentar empurrar a borda para sigma=0.737.
```

Motivo:

```text
sigma=0.737 passa no grid, mas a margem core minima e apenas +4.94e-5.
Isso e pequeno demais para absorver roundoff, interpolacao e tail numa primeira
formalizacao.
```

## Checklist de implementacao Lean

1. Criar operador inclinado concreto:

```text
LeanC2/Operators ou LeanC2/AuditC2CenterGaussianCarrier.lean
```

2. Especializar ledger finito abstrato para o address set C2:

```text
c2CenterGaussianTiltedByCenterCutoffAddressSum
```

3. Definir filtros:

```text
depthMain p  := c2CenterGaussianAddressDepth p <= 5
coreMain p   := c2CenterGaussianAddressCore p <= 401
centerMain p := c2CenterGaussianAddressCenter p <= floor(1.5*X)
```

4. Provar decomposicoes:

```text
full = depth_main + depth_rest
full = core_main + core_rest
full = center_main + center_rest
```

5. Criar estrutura consumidora de certificado:

```lean
structure C2CenterGaussianTiltLedgerCertificate where
  depth_dominance : depthRestNormUpper < depthMainNormLower
  core_dominance : coreRestNormUpper < coreMainNormLower
  center_dominance : centerRestNormUpper < centerMainNormLower
```

6. Criar lift finito -> infinito:

```text
tail_tilt_bound < certified_boundary_or_ledger_margin
```

7. So depois tentar reduzir constantes e aproximar a borda `sigma ~= 0.737`.

## Estado final deste audit

Validacao numerica suficiente para orientar a formalizacao:

```text
sim
```

Validacao numerica suficiente para ser aceita como prova Lean final:

```text
nao
```

O que ela fornece agora:

```text
1. parametros bons;
2. gargalo correto;
3. margens candidatas;
4. ordem dos boletos;
5. alvo formal inicial recomendado.
```

O que ainda precisa virar certificado:

```text
1. aritmetica intervalar ou certificado externo reprodutivel para main/rest;
2. grid-to-continuum;
3. cauda inclinada;
4. estruturas Lean consumidoras das desigualdades.
```
