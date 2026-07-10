# AUDIT_C2_CENTER_GAUSSIAN_STABILITY

## Escopo

Objeto auditado:

```text
C2 center Gaussian carrier
```

Script:

```text
gemini-code-1783101614806.py
```

Diretorio de saida:

```text
audit_outputs/c2_center_gaussian_stability/
```

Esta auditoria e empirica. Ela nao e prova formal e nao cria endpoint novo.

## Atualizacao do script

Foram adicionadas flags:

```text
--out-csv
--out-json
```

Cada execucao salva:

```text
nmax, sigma, bg_kmax, X efetivo, modo de X,
tmin/tmax/dt, threshold, numero de centros,
minimos locais, minimos filtrados, t_min, |C|min.
```

O script tambem preserva o modo dinamico:

```text
X = nmax / x_factor
```

e aceita o controle:

```text
--x-fixed
```

## Matriz rodada

### Perfil dinamico

```text
nmax=200000, bg_kmax=5, x_factor=3
nmax=400000, bg_kmax=6, x_factor=3
nmax=800000, bg_kmax=7, x_factor=3
```

### Perfil X fixo

```text
X=66666.66666666667
nmax=200000, bg_kmax=5
nmax=400000, bg_kmax=6
```

### Variacao de escala

```text
nmax=200000, bg_kmax=5
x_factor=2, 4, 6
```

Todos usaram:

```text
sigma=0.5
t=[10,50]
dt=0.001
threshold=0.05
```

## Resultados principais

### Dinamico x_factor=3

Os mesmos 10 minimos filtrados persistiram:

```text
14.134-14.136
21.022-21.023
25.010-25.012
30.424-30.425
32.934-32.935
37.586
40.918-40.919
43.327
48.005
49.774
```

Classificacao: persistente.

### X fixo

Com `X=66666.66666666667`, os cortes:

```text
200000/k5
400000/k6
```

preservaram os mesmos 10 minimos. O corte maior reduziu varios valores de
`|C|min`, mas nao mudou a localizacao dos minimos filtrados.

Classificacao: persistente.

### Variacao de escala

Com `x_factor=4` e `x_factor=6`, os mesmos 10 minimos persistiram, com
localizacoes dentro de aproximadamente `0.002`.

Com `x_factor=2`, apareceram 12 minimos filtrados e alguns minimos se
deslocaram ou se dividiram:

```text
13.967, 14.283
20.933, 21.181
24.958
30.490
40.957
43.341
48.029
```

Os valores de `|C|min` tambem ficaram muito maiores nesse perfil.

Classificacao: `x_factor=2` e escala sensivel; `x_factor=4/6` sao estaveis
nesta bateria.

## Classificacao dos minimos

### Persistentes

```text
14.134-14.136
21.022-21.023
25.010-25.012
30.424-30.425
32.934-32.935
37.586
40.918-40.919
43.327
48.005
49.774
```

Persistem em:

```text
dinamico 200k/400k/800k
X fixo 200k/400k
x_factor=4/6 em 200k
```

### Deslocados / scale-sensitive

Principalmente no perfil `x_factor=2`:

```text
14.x split
21.x split
25.010 -> 24.958
30.425 -> 30.490
40.919 -> 40.957
43.327 -> 43.341
48.005 -> 48.029
```

### Instaveis / artefatos de corte

Nesta bateria, os candidatos extras do perfil `x_factor=2` devem ser tratados
como instaveis ate passarem em uma bateria de escala mais fina.

## Leitura

A assinatura de 10 minimos e estavel sob aumento simultaneo de `nmax`, `K` e
`X=nmax/3`, e tambem sob aumento do corte com `X` fixo. Isso sugere que esses
minimos pertencem ao carrier e nao apenas ao corte finito inicial.

O perfil `x_factor=2` altera a geometria do detector de modo visivel. Ele deve
ser usado como teste de sensibilidade, nao como perfil principal nesta fase.

## Proxima acao recomendada

Rodar uma segunda bateria focada nos 10 minimos persistentes, com janelas
locais menores e `dt` mais fino, comparando:

```text
x_factor=3,4,6
X fixo
K crescente
nmax crescente
```

Objetivo: medir drift local e valor minimo refinado para cada candidato
persistente.
