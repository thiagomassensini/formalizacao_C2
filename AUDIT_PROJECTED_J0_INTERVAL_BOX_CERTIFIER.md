# Audit Projected J0 Interval Box Certifier

Data: 2026-07-08.

Rota: Genuine-First. Este relatorio registra um certificador intervalar externo
para caixas candidatas do atlas `projected-j0`. O resultado e auditavel e
reprodutivel, mas ainda nao e prova Lean automatica.

## Script

Criado:

```text
operadores/c2_projected_j0_interval_box_certifier.py
```

Entrada: CSV de caixas do scout.

Saida por rodada:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_<label>.csv
audit_outputs/c2_projected_j0_interval_box_certifier_<label>.json
```

O script calcula enclosures retangulares para:

```text
M_box
D0_box, D1_box, D2_box, D3_box
Drest_box = D1 + D2 + D3
RvecTail_box
totalQuartet_box
totalFinite_box
```

`RvecTail_box` e tratado como vetor complexo. Ele nao e substituido por soma
de uppers reais.

## Metodo usado

Modo usado nas rodadas:

```text
--mode fast
--interval-dps 50
--inflate 1e-12
```

O modo `fast` usa logs/pesos `float64` inflados, avalia fases por intervalos
retangulares e subdivide internamente cada caixa em subcaixas de `t`.

Tambem existe `--mode strict`, mais lento, que usa `mpmath.iv` para as somas
finitas; ele nao foi usado nas rodadas completas desta etapa.

Opcao nova para o lower de `|M|`:

```text
--main-lower-method rect
--main-lower-method center-radius
```

`rect` e o metodo historico: lower de modulo diretamente da caixa retangular.
`center-radius` calcula tambem `max(0, |center| - radius)` para a enclosure de
`M` e usa o melhor lower disponivel. O CSV passou a registrar:

```text
main_lower_method
main_center_abs
main_radius
main_lower_rect
main_lower_improved
main_lower_gain
```

Subdivisoes finais:

```text
positive-box: subdiv-t = 8
valley47:     subdiv-t = 64
seed_hurts:   subdiv-t = 512
```

Sem subdivisao interna, a primeira caixa positive-box ja perdia o lower de
`|M|`. Com `subdiv-t=8`, ela certificou com folga. Portanto a subdivisao e
parte essencial do certificado externo atual.

## Rodadas

| rodada | boxes de entrada | modo | subdiv-t | combined certificados | separate certificados | status |
|---|---:|---|---:|---:|---:|---|
| positive-box | 27 | fast | 8 | 27/27 | 27/27 | todos certificados |
| valley47 positivos | 41 | fast | 64 | 11/41 | 10/41 | 30 falhas por inflacao |
| seed_hurts positivos | 6 | fast | 512 | 6/6 | 5/6 | 1 caixa so combined |

Arquivos gerados:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_positive_box_sigmas084_086_t32p82_32p86_w005_fast_sub8.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_positive_box_sigmas084_086_t32p82_32p86_w005_fast_sub8.json

audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_sigma05_t47p5_48p5_w005_pass_fast_sub64.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_sigma05_t47p5_48p5_w005_pass_fast_sub64.json

audit_outputs/c2_projected_j0_interval_box_certifier_interval_seed_hurts_sigma0740_t14p25_14p35_w002_pass_fast_sub512.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_seed_hurts_sigma0740_t14p25_14p35_w002_pass_fast_sub512.json
```

## Positive-box

Resultado:

```text
combined: 27/27
separate: 27/27
min budget combined intervalar: 4.198818e-02
max perda de budget contra scout: 1.725398e-02
```

Todas as caixas `s0.84_t0..t8`, `s0.85_t0..t8`, `s0.86_t0..t8` foram
certificadas em combined e separate.

Leitura: esta e a candidata mais limpa para virar pacote externo reproduzivel
ligado ao scaffold Lean de caixas constantes.

## Valley47

Entrada: apenas caixas com `pass_combined_const = true` no scout.

Resultado:

```text
combined: 11/41
separate: 10/41
falhas por inflacao: 30/41
min budget combined certificado: 4.604926e-04
max perda de budget contra scout: 1.140525e-01
```

Caixas certificadas em combined:

```text
s0.5_t0    t=[47.500, 47.504]
s0.5_t1    t=[47.505, 47.509]
s0.5_t2    t=[47.510, 47.514]
s0.5_t3    t=[47.515, 47.519]
s0.5_t4    t=[47.520, 47.524]
s0.5_t5    t=[47.525, 47.529]
s0.5_t6    t=[47.530, 47.534]
s0.5_t7    t=[47.535, 47.539]
s0.5_t8    t=[47.540, 47.544]
s0.5_t9    t=[47.545, 47.549]
s0.5_t200  t=[48.500, 48.500]
```

Caixas certificadas em separate: as mesmas, exceto `s0.5_t9`.

Falhas:

```text
30 caixas com status fail_interval_inflation
```

Leitura: o scout tinha budget positivo nessas 30 caixas, mas a enclosure
intervalar em `fast/sub64` ficou larga demais. Isso e inflacao de intervalo,
nao evidencia de budget real negativo.

### Reprocessamento das falhas de valley47

As 30 caixas `valley47` com `fail_interval_inflation` foram reprocessadas com:

```text
--main-lower-method center-radius
--subdiv-t 128
```

Saidas:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.json
```

Resultado:

```text
combined certificados: 12/30
separate certificados: 11/30
falhas restantes: 18/30
ganho medio de main lower contra sub64: 1.384664e-02
ganho maximo de main lower contra sub64: 1.759751e-02
ganho medio de budget combined contra sub64: 5.024645e-02
ganho maximo de budget combined contra sub64: 5.906872e-02
```

Caixas recuperadas em combined:

```text
s0.5_t10
s0.5_t11
s0.5_t12
s0.5_t13
s0.5_t14
s0.5_t15
s0.5_t194
s0.5_t195
s0.5_t196
s0.5_t197
s0.5_t198
s0.5_t199
```

Em separate, as mesmas exceto `s0.5_t194`.

Falhas restantes:

```text
s0.5_t16
s0.5_t17
s0.5_t18
s0.5_t184
s0.5_t185
s0.5_t186
s0.5_t187
s0.5_t188
s0.5_t189
s0.5_t19
s0.5_t190
s0.5_t191
s0.5_t192
s0.5_t193
s0.5_t20
s0.5_t21
s0.5_t22
s0.5_t23
```

Leitura: o campo `main_lower_gain` interno do metodo `center-radius` ficou
zero nas caixas reprocessadas. Ou seja, a recuperacao veio da subdivisao
`sub128`, que tambem estreitou `numeratorUpperConst` e `restUpperCombinedConst`,
nao de uma melhora intrinseca da formula centro-raio sobre o lower retangular.
Para as 18 falhas restantes, o proximo teste util e subdividir mais ou trocar
para um metodo `sample-lipschitz`/geometrico para o lower de `|M|`.

## Seed Hurts

Entrada: apenas caixas com `pass_combined_const = true` no scout.

Resultado:

```text
combined: 6/6
separate: 5/6
min budget combined intervalar: 1.718982e-04
max perda de budget contra scout: 3.888420e-04
```

Caixas combined:

```text
s0.74_t45  t=[14.340, 14.341]
s0.74_t46  t=[14.342, 14.343]
s0.74_t47  t=[14.344, 14.345]
s0.74_t48  t=[14.346, 14.347]
s0.74_t49  t=[14.348, 14.349]
s0.74_t50  t=[14.350, 14.350]
```

Separate falhou somente em `s0.74_t45`:

```text
budget combined = 1.718982e-04
budget separate = -6.216337e-04
```

Leitura: nesta fronteira, usar `rest_combined` importa. A variante separate e
conservadora demais para a primeira caixa.

## Inflacao por termo

Comparando as constantes intervalares contra as constantes amostradas do scout:

| rodada | maior perda de main lower | maior aumento de numeratorUpper | maior aumento de rest combined | termo dominante |
|---|---:|---:|---:|---|
| positive-box | 1.001651e-02 | 4.932331e-05 | 6.481124e-03 | main lower |
| valley47 | 3.519564e-02 | 1.424928e-02 | 1.308305e-02 | main lower |
| seed_hurts | 1.063588e-04 | 1.341004e-05 | 4.936377e-05 | main lower |

O termo que mais inflou foi o lower de `|M|`. Em `valley47`, a inflacao do
numerador e do rest tambem pesa, mas a maior perda isolada ainda vem de
`mainNormLowerConst`.

## Combined vs Separate

`combined` foi melhor ou igual em todas as rodadas.

Resultados:

```text
positive-box: combined = separate = 27
valley47:     combined 11, separate 10
seed_hurts:   combined 6, separate 5
```

Portanto a rota principal deve manter `restUpperCombinedConst` quando houver
certificado. A variante separate continua util como porta conservadora, mas
perde caixas de fronteira.

## Candidatas para pacote externo

Mais prontas:

```text
positive-box: 27 caixas
seed_hurts combined: 6 caixas
valley47 inicio: s0.5_t0..s0.5_t9
valley47 ponto isolado: s0.5_t200
```

As candidatas mais robustas sao as 27 caixas da positive-box. `seed_hurts` e
certificavel, mas exige `subdiv-t=512`, entao deve ser tratado como fronteira
delicada.

## Caixas que precisam subdivisao ou metodo melhor

`valley47` teve 30 falhas por inflacao. Proximas tentativas:

```text
1. subdividir as caixas falhas em t antes de tentar certificar;
2. melhorar o lower intervalar de |M|;
3. reduzir dependencia no produto D0 * conj(M);
4. trocar a enclosure retangular por forma centro-raio para M e D0;
5. abrir o rest combinado com estrutura mais fina.
```

## Proximo passo recomendado

1. Converter a positive-box em pacote externo reprodutivel de certificados por
   caixa.
2. Para `valley47`, as 30 falhas originais ja foram reprocessadas com
   `subdiv-t=128`; 12 foram recuperadas em combined e 18 ainda precisam de
   subdivisao adicional ou metodo melhor para o lower de `|M|`.
3. Para `seed_hurts`, preservar `combined` como moeda principal e evitar a rota
   separate na primeira caixa.
4. Melhorar primeiro `mainNormLowerConst`, porque ele foi o maior fator de
   perda de budget nas tres rodadas. O `center-radius` atual nao melhorou sobre
   `rect` nessas caixas; a proxima variante deve ser `sample-lipschitz` ou uma
   enclosure geometrica mais fina.
5. Depois melhorar `numeratorUpperConst`, especialmente em `valley47`, onde o
   numerador inflado tambem consome margem relevante.

## Comandos de verificacao

Executados:

```bash
python3 -m py_compile operadores/c2_projected_j0_interval_box_certifier.py
```

Tambem foi criado e compilado o schema Lean opcional:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0IntervalCertificateSchema.lean
```
