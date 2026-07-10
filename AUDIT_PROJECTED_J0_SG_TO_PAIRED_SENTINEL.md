# Auditoria Projected J0: surrogate SG versus continuação pareada

## Correção de literalidade do produtor

O objeto SG avaliado neste diagnóstico é a soma matemática exata com janela
exponencial, calculada em alta precisão. Ele coincide com
`projectedJ0SG_reference` e com o retângulo matemático do carrier Gaussian.

Ele não coincide literalmente com a lista de termos usada para produzir os
retângulos externos. O produtor calcula primeiro os coeficientes em binary64,
remove `coeffs == 0.0` e usa os coeficientes retidos como pontos. No reference,
94941 dos 128016 endereços matemáticos são omitidos por underflow do
coeficiente completo. Assim, este diagnóstico continua válido como scout do
modelo SG exato versus a continuação pareada, mas a margem dos retângulos
existentes não pode ser transferida para ele sem uma ponte adicional
implementação→modelo.

## Escopo

Esta auditoria compara, somente nos cinco pontos da sentinela `s0.84_t7`, o
modelo central supergaussiano finito exato com a continuação C2 construída
numericamente pelo canal ímpar-par pareado.

O diagnóstico não é um enclosure da caixa contínua, não é uma prova Lean e não
fornece pertencimentos analíticos para os retângulos existentes.

## Objetos avaliados

O surrogate é a referência finita

```text
K = 17
M = 16001
X = 10661
p = 2
k = 2,...,17
m = 1,3,...,16001
```

com peso

```text
exp(-((2^k * m) / X)^p)
```

e coeficiente de cada endereço `2^k * m` igual a `2 * 2^(-k)`.

O canal pareado avaliado é

```text
sum_{n >= 0} ((2*n + 1)^(-s) - (2*n + 2)^(-s)).
```

Ele é multiplicado por

```text
(1 - 2^(-s)) / (1 - 2^(1-s))
```

e depois pelo fator central C2

```text
2 * q(s)^2 / (1 - q(s)),   q(s) = 2^(-1-s).
```

## Método numérico

Script:

```text
operadores/c2_projected_j0_sg_to_paired_sentinel.py
```

Comando:

```bash
python3 operadores/c2_projected_j0_sg_to_paired_sentinel.py
```

Parâmetros do run:

```text
sigma = 0.84
t = 32.855, 32.856, 32.857, 32.858, 32.859
margin = 0.054086045801
mp.dps = 70
Euler estimate = start 500, depth 60
Euler stability profile = start 1000, depth 70
direct paired pair-count N = 20000
```

O valor `sampled_delta` usa aceleração de Euler e é uma estimativa, não um
upper. Separadamente, a truncatura direta usa a majorante analítica

```text
paired_tail_upper = |s| / Re(s) * (2*N + 1)^(-Re(s)).
```

Ela vem de integrar a derivada de `x^(-s)` em cada intervalo
`[2*n+1, 2*n+2]`: a norma da derivada é
`|s| * x^(-Re(s)-1)`. A soma dos intervalos ímpar-par é então majorada pela
integral sobre todo `[2*N+1, +infinity)`.

Depois de multiplicá-la pelo módulo dos dois fatores de continuação, o script
registra `continued_tail_upper`. O campo `tail_adjusted_upper` é

```text
|continued_direct_partial - SG_reference| + continued_tail_upper.
```

Essa contabilidade é conservadora para a cauda analítica da série pareada. Ela
continua sendo um diagnóstico numérico, pois a aritmética finita não está
interval-enclosed.

## Resultado

```text
t       sampled_delta      accel_stability   direct_partial_delta  continued_tail_upper  tail_adjusted_upper  adjusted/margin
32.855  4.827713013117e-7   0.0               6.003211724546e-6     5.075340725363e-4      5.135372842608e-4    9.494820274906e-3
32.856  4.825801166076e-7   0.0               6.004110039133e-6     5.076029708487e-4      5.136070808878e-4    9.496110748742e-3
32.857  4.823867487613e-7   0.0               6.005041633802e-6     5.076719275458e-4      5.136769691796e-4    9.497402917374e-3
32.858  4.821912029654e-7   0.0               6.006006485923e-6     5.077409426550e-4      5.137469491409e-4    9.498696780887e-3
32.859  4.819934789180e-7   1.166797542303e-72 6.007004575727e-6     5.078100162033e-4      5.138170207791e-4    9.499992339421e-3
```

O maior `sampled_delta` foi `4.827713013117e-7`. O maior upper analítico da
cauda já escalada foi `5.078100162033e-4`, e o maior valor ajustado à cauda foi
`5.138170207791e-4`, ou `9.499992339421e-3` da margem.

No ponto central `s = 0.84 + 32.857 i`, os valores estimados são

```text
continued =  0.013911838166838938 - 0.066105894114669433 i
SG        =  0.013912205718342542 - 0.066106206529245884 i
```

O erro amostrado é muito menor que a margem. Isso recomenda continuar a rota de
transferência SG para a continuação pareada, mas ainda não autoriza expansão
para as 771 subcaixas.

## Limites da conclusão

- não há afirmação para alturas entre os cinco pontos;
- `sampled_delta` não é uma majorante;
- a majorante explícita controla apenas a cauda omitida do canal pareado;
- não há enclosure transcendental kernel-checked;
- não se identifica o surrogate com a série crua totalizada;
- não se declara nonvanishing do objeto genuine.
