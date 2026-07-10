# AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT

Data: 2026-07-08

## Objetivo

Testar a hipotese:

```text
O tilt nao deve ser tratado cedo demais como boleto norm-only.
Ele deve ser testado como contribuicao orientada/faseada no principal.
```

Regra:

```text
Genuine-First. Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore,
equacao funcional, formula explicita, nem comparacao externa como input
analitico.
```

## Script Criado

```text
operadores/c2_tilt_aware_middle_ledger.py
operadores/c2_adjusted_quartet_tilt_aware.py
```

Objeto testado:

```text
C_X(s) = sum 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)
c = 2^k m
k >= 2
m odd
```

Decomposicao:

```text
base_weights = pesos center Gaussian sem tilt
tilt_weights = base_weights * lambda * normalizedTiltCurvature(delta,c)
delta = sigma - 1/2
```

O script compara, no mesmo grid e no mesmo split:

```text
no_tilt:
  |main_0| - |rest_0|

tilt_norm_only:
  |main_0| - |rest_0| - (|tilt_main| + |tilt_rest|)

tilt_oriented:
  |main_0 + tilt_main| - |rest_0 + tilt_rest|
```

Leitura:

```text
tilt_norm_only mede o custo de transformar o tilt em divida por modulo;
tilt_oriented mede o que acontece quando a contribuicao assinada/faseada e
coletada antes de tomar normas.
```

## Smoke Test

Com:

```text
nmax=20000
bg_kmax=10
sigma=0.740
t in [14.28,14.30]
dt=0.01
split=core
```

Resultado:

```text
pass no/norm/oriented = 3/0/3
worst no_tilt   = +1.405637e-3
worst norm_only = -1.427224e-2
worst oriented  = +3.597774e-3
```

Interpretacao:

```text
Mesmo no smoke test, modulo cedo demais transforma o tilt em imposto; a versao
orientada melhora o surplus.
```

## Rodada Local Principal

Comando:

```text
python3 operadores/c2_tilt_aware_middle_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.737,0.740,0.750 \
  --tmin 13.8 --tmax 14.5 --dt 0.001 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --splits depth,core,center \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 4 \
  --csv audit_outputs/c2_tilt_aware_middle_ledger_local_t14.csv
```

CSV:

```text
audit_outputs/c2_tilt_aware_middle_ledger_local_t14.csv
```

### Resultado Core Local

```text
sigma=0.737:
  pass no/norm/oriented = 647/417/701
  worst no_tilt   = -1.325197e-3
  worst norm_only = -1.674988e-2
  worst oriented  = +4.937913e-5
  gain_pos        = 701/701

sigma=0.740:
  pass no/norm/oriented = 682/421/701
  worst no_tilt   = -1.468017e-4
  worst norm_only = -1.584798e-2
  worst oriented  = +1.598049e-3
  gain_pos        = 701/701

sigma=0.750:
  pass no/norm/oriented = 701/436/701
  worst no_tilt   = +3.605261e-3
  worst norm_only = -1.302725e-2
  worst oriented  = +6.605718e-3
  gain_pos        = 701/701
```

Leitura:

```text
No gargalo core/horizontal, o tilt orientado melhora todos os 701 pontos do
grid local. O tilt norm-only falha fortemente porque cobra cerca de 1.5e-2 de
taxa de modulo.
```

### Resultado Depth/Center Local

Depth:

```text
Todos os sigmas passam nos tres ledgers.
O tilt orientado melhora todos os pontos.
```

Center:

```text
sigma=0.737:
  norm-only falha em parte do grid, mas oriented passa 701/701.

sigma=0.740 e 0.750:
  os tres passam, mas oriented melhora todos os pontos.
```

Interpretacao:

```text
O gargalo continua sendo core. Depth e center confirmam que o problema nao e
vertical puro nem corte por centro.
```

## Rodada Global Core

Comando:

```text
python3 operadores/c2_tilt_aware_middle_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.700,0.737,0.740,0.750 \
  --tmin 10 --tmax 50 --dt 0.05 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --splits core \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 4 \
  --csv audit_outputs/c2_tilt_aware_middle_ledger_global_core_dt005.csv
```

CSV:

```text
audit_outputs/c2_tilt_aware_middle_ledger_global_core_dt005.csv
```

Resultado:

```text
sigma=0.700:
  pass no/norm/oriented = 797/792/798
  worst no_tilt   = -1.774759e-2
  worst norm_only = -2.987030e-2
  worst oriented  = -2.068094e-2
  gain_pos        = 798/801

sigma=0.737:
  pass no/norm/oriented = 800/795/801
  worst no_tilt   = -1.065985e-3
  worst norm_only = -1.648973e-2
  worst oriented  = +3.047588e-4
  gain_pos        = 801/801

sigma=0.740:
  pass no/norm/oriented = 801/795/801
  worst no_tilt   = +1.109057e-4
  worst norm_only = -1.559083e-2
  worst oriented  = +1.854056e-3
  gain_pos        = 801/801

sigma=0.750:
  pass no/norm/oriented = 801/795/801
  worst no_tilt   = +3.860888e-3
  worst norm_only = -1.277774e-2
  worst oriented  = +6.866401e-3
  gain_pos        = 801/801
```

Leitura:

```text
Na malha global grosseira, o padrao se mantem:

1. sigma=0.700 ainda nao fecha; oriented ajuda pouco no pior ponto.
2. sigma=0.737 vira positivo no oriented.
3. sigma=0.740 e 0.750 passam no oriented.
4. norm-only falha mesmo quando no_tilt/oriented passam.
```

## Conclusao

O experimento confirma a hipotese operacional:

```text
O tilt como modulo vira imposto.
O tilt orientado/coletado no principal vira margem.
```

No bloco core, que e o gargalo:

```text
tilt_norm_only cobra taxa de ordem 1.3e-2 a 1.7e-2;
tilt_oriented melhora o surplus em todos os pontos para sigma >= 0.737
nos grids testados.
```

## Rodada Adjusted Quartet

Tambem foi criado:

```text
operadores/c2_adjusted_quartet_tilt_aware.py
```

Ele reutiliza:

```text
operadores/c2_adjusted_quartet_evaluator.py
```

e compara:

```text
no_tilt:
  |q^2 * (1+q+q^2+q^3)| - defect - tail_without_tilt

tilt_norm_only:
  no_tilt - |seed * (1+q+q^2+q^3)| - tilt_tail_upper

tilt_oriented:
  |(q^2 + seed) * (1+q+q^2+q^3)| - defect - tail_upper
```

Smoke test perto de `sigma=0.740`, `t in [14.25,14.35]`:

```text
pass no/norm/oriented = 0/0/0
```

Leitura:

```text
Esse ponto nao fecha o adjusted quartet nessa parametrizacao; o diagnostico
nao deve ser lido como prova de melhora global.
```

Rodada positive-box documentada:

```text
python3 operadores/c2_adjusted_quartet_tilt_aware.py \
  --sigmas 0.84,0.85,0.86 \
  --t-min 32.82 --t-max 32.86 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 --odd-reference-X 10661 \
  --odd-reference-p 2 \
  --threads 56 --top 4 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_aware_positive_box.csv
```

CSV:

```text
audit_outputs/c2_adjusted_quartet_tilt_aware_positive_box.csv
```

Resultado:

```text
sigma=0.840:
  pass no/norm/oriented = 41/41/41
  worst no_tilt   = +4.733538e-2
  worst norm_only = +3.641372e-2
  worst oriented  = +4.399507e-2
  gain_pos        = 13/41

sigma=0.850:
  pass no/norm/oriented = 41/41/41
  worst no_tilt   = +4.827354e-2
  worst norm_only = +3.847562e-2
  worst oriented  = +4.674966e-2
  gain_pos        = 25/41

sigma=0.860:
  pass no/norm/oriented = 41/41/41
  worst no_tilt   = +4.903942e-2
  worst norm_only = +3.996443e-2
  worst oriented  = +4.922310e-2
  gain_pos        = 40/41
```

Leitura:

```text
No adjusted quartet positive-box, todos os tres ledgers ja passam nessa
parametrizacao. O norm-only reduz a margem, como esperado. O oriented nao e
uniformemente melhor em sigma=0.84/0.85, mas se torna quase uniformemente melhor
em sigma=0.86.
```

Conclusao refinada:

```text
1. No center Gaussian core, a tese forte foi confirmada:
   norm-only transforma tilt em imposto, oriented vira margem.

2. No adjusted quartet, a historia depende da regiao/parametrizacao:
   norm-only ainda cobra margem, mas oriented precisa ser calibrado contra o
   pacote correto de seed/main/tail.
```

Frase de rota:

```text
O tilt nao deve ser pago como cauda bruta antes de usar sua orientacao.
Ele deve entrar no adjusted main/quartet antes da etapa norm-only.
```

## Proximo Passo

Proximo passo ajustado:

```text
1. manter o resultado forte do center Gaussian como evidencia da geometria;
2. no adjusted quartet, testar outras janelas/parametrizacoes e separar melhor
   seed prefix, seed tail e horizontal defect;
3. procurar uma coleta orientada que melhore a margem no gargalo, nao apenas
   em positive-box ja folgada.
```

O script `c2_adjusted_quartet_evaluator.py` ja tem a decomposicao:

```text
main
defect
tail_upper
tilt_tail_upper
seed
```

O proximo audit deve separar:

```text
main_base
seed_prefix_norm_tax
main_seeded_oriented
tail_without_tilt
tilt_tail_upper
```

para verificar se o mesmo fenomeno aparece no pacote adjusted quartet formal.
