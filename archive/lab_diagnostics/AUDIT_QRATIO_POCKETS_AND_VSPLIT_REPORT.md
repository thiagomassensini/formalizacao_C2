# Q-ratio pockets, V_exact split, and safer quartet margins

Este relatório continua a auditoria `q-ratio` sem promover nada para a rota
principal. Todos os resultados numéricos usam `channel_mode = zeta_diagnostic`
quando avaliam canais continuados; isso é laboratório, não certificado Lean.

## Artefatos novos

Scripts:

```text
audit_qratio_pocket_map.py
```

O scanner de anatomia também foi refinado:

```text
audit_vexact_anatomy_scanner.py
```

Novas saídas:

```text
audit_qratio_pockets_fine_current.csv/json
audit_qratio_pockets_micro_current.csv/json
audit_qratio_pockets_micro_direct.csv/json
audit_qratio_pockets_micro_phase.csv/json
audit_qratio_pockets_refined_micro_current.csv/json
audit_vexact_anatomy_refined_micro.csv/json
```

## 1. Bolsos positivos q-ratio

O mapeador considera pontos positivos da coluna `current_pass_Q`, isto é:

```text
U_current < Q_worst
```

e calcula componentes conectados em grade `(sigma,t)` com vizinhança
horizontal/vertical. Ele faz isso:

```text
por parâmetro fixo (N,K,M)
e na projeção agregada: existe algum (N,K,M) que passa no ponto.
```

### Faixa fina

Entrada:

```text
audit_vexact_anatomy_fine.csv
```

Resultado agregado:

```text
componentes agregados: 1
tamanho: 5
sigma: [0.88, 0.96]
t: [33.0, 33.0]
melhor ponto: sigma=0.88, t=33.0, N=50, K=3, M=25
melhor slack current: 0.0118565353279
marcado como acidente de malha: sim
```

Leitura: na grade fina original, o bolso aparece em uma linha só de `t`.
Isso parecia potencialmente acidente de malha.

### Microfaixa

Entrada:

```text
audit_vexact_anatomy_refined_micro.csv
```

Resultado agregado:

```text
componentes agregados: 1
tamanho: 10
sigma: [0.84, 0.92]
t: [32.75, 33.0]
melhor ponto: sigma=0.84, t=32.75, N=50, K=5, M=50
melhor slack current: 0.0220365957078
marcado como acidente de malha: nao
```

Leitura: o bolso positivo q-ratio nao parece ser um ponto isolado. Ele vira uma
regiao conectada quando a malha em `t` e refinada.

### Estabilidade por parametros

Na microfaixa, os maiores componentes `current` por parametro fixo tambem tem
tamanho 10 e cobrem a mesma caixa:

```text
N=50, K=3, M=50   size=10, sigma=[0.84,0.92], t=[32.75,33.0]
N=50, K=4, M=100  size=10, sigma=[0.84,0.92], t=[32.75,33.0]
N=50, K=5, M=100  size=10, sigma=[0.84,0.92], t=[32.75,33.0]
N=25, K=3, M=50   size=10, sigma=[0.84,0.92], t=[32.75,33.0]
```

Isso e importante: o bolso nao depende de um unico triplo especial.

### Direct-balanced e phase-aware

Na mesma microfaixa:

```text
direct-balanced aggregate:
  tamanho: 15
  sigma: [0.84, 0.92]
  t: [32.5, 33.0]
  melhor slack: 0.0338738207963

phase-aware aggregate:
  tamanho: 22
  sigma: [0.84, 0.92]
  t: [32.25, 33.25]
  melhor slack: 0.0510674950305
```

Leitura:

```text
current q-ratio passa em um bolso menor;
remover o fator resolvente do seed expande o bolso;
usar fase/cancelamento expande mais.
```

Esse padrao sugere que o bolso e real na geometria diagnostica, mas a forma
formal atual ainda paga caro demais fora dele.

## 2. Abrindo V_exact de verdade

Antes:

```text
VVec = tau + rect - 2*C
V_exact = |VVec|
```

Agora o scanner tambem abre:

```text
anchor = tau - C
CutVec = rect - C
VVec = anchor + CutVec
```

e mede:

```text
|anchor|
|CutVec|
|anchor| + |CutVec|
(|anchor| + |CutVec| - |VVec|) / (|anchor| + |CutVec|)

|tau| + |rect| + 2|C|
(|tau| + |rect| + 2|C| - |VVec|) / (|tau| + |rect| + 2|C|)
```

### Melhor ponto current da microfaixa

```text
sigma=0.84, t=32.75, N=50, K=5, M=50

Q_worst = 0.0599557156356
Q_phase = 0.0633744856328
U_current = 0.0379191199279
U_direct  = 0.0260818948393
U_phase   = 0.00888822060510

V_exact = 0.00862423036437
anchor_norm = 0.0127857526475
Cut_exact = 0.00416489739434
anchor_cut_triangle = 0.0169506500419
anchor_cut_cancellation = 49.12%

raw_tau_rect_C_triangle = 0.285719741930
raw_tau_rect_C_cancellation = 96.98%

resolvent_seed_tax = U_current - U_direct = 0.0118372250886
```

Fases contra `-K4`:

```text
cos(VVec, -K4)    = 0.662328878176
cos(anchor, -K4)  = 0.674204761224
cos(CutVec, -K4)  = -0.698249731769
cos(tau, -K4)     = -0.999998359997
cos(rect, -K4)    = -0.986377687959
cos(C, -K4)       = -0.991370486464
```

Leitura:

```text
O bruto |tau| + |rect| + 2|C| e absurdamente pessimista.
Ha cancelamento estrutural forte entre tau, rect e C.
Mesmo depois do split anchor + CutVec, ainda ha cancelamento relevante.
```

### Estatisticas da microfaixa refinada

Todos os pontos:

```text
mediana |anchor| = 0.05805
mediana |CutVec| = 0.00604
mediana |VVec| = 0.05919
mediana anchor_cut_cancellation = 9.17%
mediana raw_tau_rect_C_cancellation = 84.45%
mediana resolvent_seed_tax = 0.04846
```

Pontos `current_pass_Q`:

```text
mediana |anchor| = 0.01547
mediana |CutVec| = 0.00361
mediana |VVec| = 0.01553
mediana anchor_cut_cancellation = 20.11%
mediana raw_tau_rect_C_cancellation = 94.38%
mediana resolvent_seed_tax = 0.01570
```

Pontos com gargalo `V_exact`:

```text
mediana |anchor| = 0.08760
mediana |CutVec| = 0.00733
mediana |VVec| = 0.08849
mediana anchor_cut_cancellation = 5.87%
mediana raw_tau_rect_C_cancellation = 81.31%
mediana resolvent_seed_tax = 0.07058
```

Conclusao operacional:

```text
V_exact grande vem principalmente de anchor grande.
CutVec e menor na mediana, mas pode decidir bolsos.
O split anchor + CutVec e o proximo objeto honesto.
O split bruto tau/rect/C e diagnostico de cancelamento, mas nao e um bound util
por triangulo.
```

## 3. Margem de quarteto menos pessimista

Hoje a margem worst-case usa:

```text
Q_worst =
  |q|^2 * ((1 - |q|) * (1 + |q|^2))
  - |q|^6/(1-|q|)
```

O diagnostico `Q_phase` usa:

```text
Q_phase =
  |q^2 * P4(q)| - |q|^6/(1-|q|)
```

Isso muda decisoes em muitos pontos, mas nao pode virar prova apenas avaliando
a fase real do ponto. Precisa de um criterio formal seguro.

### Identidade util

Como:

```text
P4(q) = 1 + q + q^2 + q^3 = (1+q)(1+q^2)
q = r * exp(i theta)
```

temos:

```text
|P4(q)|^2 =
  (1 + r^2 + 2r cos(theta))
  *
  (1 + r^4 + 2r^2 cos(2theta))
```

Tambem:

```text
q(s) = 2^(-sigma-1) * exp(-i * t * log 2)
theta = -t * log 2  modulo 2pi
```

Uma margem formal segura pode ser parametrizada por uma caixa de fase:

```text
t in [t0,t1]
theta in [-t1 log 2, -t0 log 2] modulo 2pi
```

e um lower certificado:

```text
L_sector <= |P4(q)|
```

entao:

```text
Q_sector =
  |q|^2 * L_sector - |q|^6/(1-|q|)
```

### Cuidado com bounds independentes de cos

Um bound simples com minimos independentes:

```text
cos(theta) >= a
cos(2theta) >= b
|P4(q)| >= sqrt((1+r^2+2ra)*(1+r^4+2r^2b))
```

e formalmente amigavel, mas pode ser pessimista se os minimos de `cos(theta)`
e `cos(2theta)` ocorrem em pontos diferentes.

Para a caixa `t=[32.75,33.0]`, `sigma=[0.84,0.92]`, o lower por amostragem
direta do produto em theta da:

```text
ganho sobre worst-case: ~5.2% a 5.6%
```

Para a caixa mais larga `t=[32.25,33.25]`, o ganho seguro por intervalo ainda
existe, mas cai para:

```text
~1.5% a 1.7%
```

Logo, a proposta formal mais promissora e:

```text
certificados setoriais pequenos em t,
com lower do produto |P4| diretamente,
nao apenas minimos independentes de cos(theta) e cos(2theta).
```

## 4. Interpretação dos gargalos

### Bolsos conectados ou acidente?

Resposta:

```text
Na grade fina original parecia acidente de linha.
Na micrograde, o bolso current e conectado e aparece em varios parametros.
Nao parece acidente de ponto unico.
```

### O que abrir em V_exact?

Proximo bound deve usar:

```text
anchor = tau - C
CutVec = rect - C
VVec = anchor + CutVec
```

e nao apenas:

```text
|tau + rect - 2C|
```

O alvo real e controlar `anchor` e `CutVec` com alguma informacao de fase ou
um certificado de cancelamento.

### Quando current falha mas direct passa

Isso apareceu em:

```text
microfaixa: 125 pontos classificados como resolvent_seed_factor
```

Interpretacao:

```text
o fator resolvente do seed esta cobrando caro demais.
```

### Quando Q_phase muda a decisao

Isso apareceu em:

```text
microfaixa: 62 pontos classificados como quartet_margin_pessimism
```

Interpretacao:

```text
a margem global do quarteto e pessimista em uma parte real da regiao,
mas qualquer melhora formal precisa de caixa/sector certificate.
```

## 5. Proximos alvos Lean seguros

Nao promover nada para a rota principal. Em namespace de auditoria:

1. Definir um pacote de split:

```lean
anchor = verticalDepthTailFromTwo s - continuedCentralOddChannel s
CutVec = rectangularGenuine s K M - continuedCentralOddChannel s
VVec = anchor + CutVec
```

2. Provar a identidade ja existente de forma reutilizavel:

```text
c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s
  = anchor s + CutVec K M s
```

3. Criar um teorema condicional:

```text
anchorCutUpper + horizontal/cutoff ledger < quartet margin
=> dominance
```

4. Para margem de quarteto:

```text
def verticalQuartetPrefixSectorLower ...
```

com hipoteses do tipo:

```text
theta in interval
L <= |verticalQuartetPrefix(q s)|
```

e resultado:

```text
|q|^2 * L - vertical_tail_upper
```

5. Manter q-ratio como baseline horizontal.

Resumo:

```text
q-ratio revelou bolsos conectados.
V_exact deve ser tratado via anchor + CutVec.
Q_phase mostra que ha margem escondida, mas a versao formal precisa ser
setorial/intervalar, nao ponto-a-ponto por fase real solta.
```
