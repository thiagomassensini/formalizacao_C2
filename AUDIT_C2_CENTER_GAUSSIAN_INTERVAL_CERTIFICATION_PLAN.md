# AUDIT_C2_CENTER_GAUSSIAN_INTERVAL_CERTIFICATION_PLAN

## Objetivo

Transformar o certificado numerico atual das 7 caixas do C2 center Gaussian em
um certificado intervalar reproduzivel.

Objeto:

```text
c2CenterGaussianSeries X s
```

com:

```text
X = 66666.66666666667
```

## Estado Atual

Ja existe:

```text
carrier formal Lean
corte por centro alinhado com o script
convergencia diagonal para X fixo
caixas full-depth finitas certificadas numericamente
cauda full-depth menor que a margem de borda
```

Pack consolidado:

```text
C2_CENTER_GAUSSIAN_ZERO_CERTIFICATE_PACK.md
```

## O Que Falta

A camada atual ainda usa avaliacao vetorizada em ponto flutuante para a borda
finita.

Falta trocar por:

```text
aritmetica intervalar / bolas complexas / certificado externo reproduzivel
```

## Plano

### 1. Dados Fixos

Congelar:

```text
X
nmax
K
sigma_center
sigma_radius
t_center
t_radius
samples da borda
```

Comecar pelo perfil:

```text
fixedX_fullDepth_400k_K18
```

porque ele tem a maior cauda entre os dois perfis full-depth e ainda assim
passa com folga.

### 2. Aritmetica Intervalar Na Borda

Para cada segmento da borda, avaliar uma enclosure de:

```text
C_finite(s)
```

e de uma cota local de derivada:

```text
C_finite'(s)
```

O certificado deve registrar:

```text
min distancia intervalar da borda ate 0
erro de interpolacao por segmento
distancia liquida positiva
```

### 3. Winding

Construir um poligono intervalar da imagem da borda.

Verificar:

```text
0 nao pertence aos discos/tubos de incerteza
o winding do poligono e +1
a curva verdadeira fica dentro do tubo certificado
```

### 4. Cauda

Reusar a cota:

```text
Tail <= 1/2 * integral_{nmax-1}^{inf}
  x^(-sigma_min) * exp(-(x/X)^2) dx
```

e registrar o bound em forma auditavel.

O criterio final por caixa:

```text
tail_bound < certified_interval_boundary_margin
```

### 5. Produto Final

Gerar um arquivo de certificado por target:

```text
audit_outputs/c2_center_gaussian_interval_certificates/
```

com:

```text
config JSON
boundary interval summary
winding certificate
tail certificate
final status
```

## Criterio De Fechamento

Uma caixa fica intervalarmente certificada quando:

```text
winding_finite_interval = +1
tail_bound < interval_boundary_margin
```

Status esperado:

```text
infinite_zero_box_interval_certified
```

## Guardrail

Esta etapa certifica apenas o carrier C2 center Gaussian no `X` fixo escolhido.
Nao deve ser misturada com outros operadores, rotas antigas ou resultados
terminais externos ao carrier.
