# C2 horizontal q-ratio audit report

Este relatório registra a auditoria numérica e o patch Lean inicial para trocar
o bound horizontal grosseiro unit-half por um perfil com razão natural
`‖q s‖`.

Status: laboratório numérico e rota Lean de auditoria. Nada foi promovido para
a rota principal, e nenhum fechamento do middle é afirmado.

## Regra metodológica

Os scripts usam `mpmath.zeta` apenas para avaliar canais continuados em modo
diagnóstico (`channel_mode = zeta_diagnostic`). Isso não é input de prova do
middle genuine-first. O uso correto aqui é comparar anatomia dos uppers e
identificar candidatos antes de tentar formalizar uma obrigação genuine.

## Diagnóstico da falha atual

A família constant-cutoff/unit-half usa:

```text
coreCutoff(j) = N
horizontalScale(s) = 1
horizontalRatio(s) = 1/2
horizontalConstant(s) = weightedHorizontalEnvelope(coreCutoff_N)(s)
```

Para cutoff constante, a upper horizontal regularizada efetiva é:

```text
H_up_half(s)
  = 4 * |q(s)|^2 * OddTrunc_N(s) / (1 - 2*|q(s)|)
```

O fator `1 - 2*|q|` fica caro quando `sigma` desce em direção a `0`, e o
horizontal domina muitos pontos ruins.

## Novo bound q-ratio

A camada horizontal tem a forma:

```text
H_j(s) = 2 * q(s)^(j+2) * OddTrunc_N(s)
```

Logo:

```text
||H_j(s)|| <= 2 * |q(s)|^2 * OddTrunc_N(s) * |q(s)|^j
```

O perfil candidato é:

```text
horizontalConstant_N(s) = 2 * |q(s)|^2 * OddTrunc_N(s)
horizontalScale(s) = 1
horizontalRatio(s) = |q(s)|
```

e a upper horizontal vira:

```text
H_up_qratio(s)
  = 2 * |q(s)|^2 * OddTrunc_N(s) / (1 - |q(s)|)
```

Comparação direta:

```text
H_up_half / H_up_qratio
  = 2 * (1 - |q|) / (1 - 2*|q|)
```

No grid moderado desta auditoria, a razão observada `H_up_half / H_up_qratio`
teve mediana `4.44`, mínimo `3.25`, máximo `11.13`.

## Scanner

Arquivo criado:

```text
audit_horizontal_qratio_scanner.py
```

Saídas geradas:

```text
audit_horizontal_qratio_scanner.csv
audit_horizontal_qratio_scanner.json
audit_horizontal_qratio_focused.csv
audit_horizontal_qratio_focused.json
```

Perfis implementados:

```text
half      antigo unit-half
qratio    novo ratio |q|
variable  cutoff variável com prefixo finito e cauda geométrica diagnóstica
```

Agendas variáveis implementadas:

```text
N_j = N0 + a*j
N_j = N0 + a*j^2
N_j = floor(N0 * lambda^j)
N_j = max(N_min, floor(N0 + a*j))
```

O perfil variável usa um teto diagnóstico de cutoff (`--max-core-cutoff`) para
evitar que agendas geométricas explodam custo de soma.

## Fórmula escaneada

Para cada ponto:

```text
Q(s) = c2ExpandedQuartetResidualMargin(s)

U(s) =
  (V_exact(K,M,s) + H_up(s)) * (1 + |q|)/(1 - |q|)
  + H_up(s)
  + Cut_exact(K,M,s)

slack(s) = Q(s) - U(s)
```

Anatomia salva por linha:

```text
V_exact
H_up
Cut_exact
Q
U
slack
U/Q
percentual horizontal
residual complexo diagnóstico
cosseno do residual contra -quarteto
cosseno do horizontal contra -quarteto
```

## Rodada moderada

Comando:

```bash
python3 audit_horizontal_qratio_scanner.py \
  --dps 60 \
  --sigmas 0.15,0.25,0.35,0.45,0.55,0.65,0.75,0.85 \
  --ts 5,15,30 \
  --N-values 9,25,50 \
  --K-values 6,10 \
  --M-values 9,25,50 \
  --profiles all \
  --variable-schedules linear,quadratic,geometric,affine_max \
  --variable-terms 30 \
  --max-core-cutoff 1000
```

Resumo:

```text
half:
  pontos: 432
  passes: 0
  mediana U/Q: 20.49
  mediana percentual horizontal: 23.93%
  melhor slack: -0.115392
  falhas dominantes: horizontal 338, V_exact 94

qratio:
  pontos: 432
  passes: 0
  mediana U/Q: 8.84
  mediana percentual horizontal: 12.32%
  melhor slack: -0.073229
  falhas dominantes: V_exact 345, horizontal 79, cutoff 8

variable:
  pontos: 1728
  passes: 0
  mediana U/Q: 8.87
  mediana percentual horizontal: 12.07%
  melhor slack: -0.073239
  falhas dominantes: V_exact 1378, horizontal 320, cutoff 30
```

Melhor ponto da rodada moderada:

```text
perfil: qratio
sigma: 0.85
t: 30
N: 50
K: 6
M: 25
Q: 0.0592500687361
U: 0.132479381737
slack: -0.0732293130007
U/Q: 2.23593633835
V_exact: 0.0616282066338
H_up: 0.00678225000273
Cut_exact: 0.00476428888519
horizontal_share: 5.12%
dominant failure: V_exact
```

Pior ponto q-ratio da rodada moderada:

```text
perfil: qratio
sigma: 0.15
t: 5
N: 50
K: 6
M: 25
Q: 0.118969623106
U: 9.63287302355
slack: -9.51390340045
U/Q: 80.9691816456
V_exact: 0.678516084379
H_up: 2.02982209677
Cut_exact: 0.451678267625
horizontal_share: 21.07%
dominant failure: horizontal
```

Interpretação da rodada moderada:

```text
q-ratio melhora claramente o horizontal;
q-ratio não fecha o middle nesse grid;
quando q-ratio melhora bastante, a falha passa a ser V_exact;
cutoff raramente é a peça dominante;
cutoff variável simples não melhorou o melhor ponto.
```

## Rodada focada q-ratio

Comando:

```bash
python3 audit_horizontal_qratio_scanner.py \
  --dps 70 \
  --sigmas 0.75,0.85,0.92 \
  --ts 20,30,45 \
  --N-values 50,100,200 \
  --K-values 6,10,20,40 \
  --M-values 25,50,100,200 \
  --profiles qratio
```

Resumo:

```text
qratio:
  pontos: 432
  passes: 0
  mediana U/Q: 3.34
  mediana percentual horizontal: 4.56%
  melhor slack: -0.0540066
  falhas dominantes: V_exact 432
```

Melhor ponto focado:

```text
sigma: 0.92
t: 30
N: 50
K: 6
M: 25
Q: 0.0545023306803
U: 0.108508892781
slack: -0.0540065621008
U/Q: 1.99090371782
V_exact: 0.0538650171448
H_up: 0.00459703402797
Cut_exact: 0.00345468587771
horizontal_share: 4.24%
dominant failure: V_exact
```

Interpretação da rodada focada:

```text
q-ratio quase reduz o problema a um fator ~2 no melhor ponto;
horizontal deixa de ser a obstrução principal;
a próxima barreira numérica é controlar/refinar V_exact;
aumentar K/M/N dentro dessa grade não fechou.
```

## Classificação das falhas

Falha por horizontal:

```text
continua existindo para sigma pequeno;
q-ratio reduz o tamanho mas não elimina a região ruim;
half é claramente pior nessa classe.
```

Falha por V_exact:

```text
dominante no q-ratio e em todos os pontos da rodada focada;
é o próximo alvo se a família q-ratio for mantida.
```

Falha por cutoff:

```text
rara no grid moderado;
não aparece como obstrução principal na rodada focada.
```

Falha por fase real:

```text
o scanner salva cossenos contra -quarteto;
nos melhores pontos, o cosseno do residual é positivo mas não indica
cancelamento suficiente para compensar a upper.
```

Falha por margem Q pequena:

```text
perto de sigma maior, Q diminui;
o melhor ponto focado ainda tem U/Q ~ 1.99, então não é apenas ruído numérico.
```

Falha próxima da linha crítica:

```text
o grid inclui sigma perto de 0.45/0.55;
nenhum fechamento apareceu ali.
```

## Patch Lean inicial

Arquivo criado:

```text
LeanC2/AuditContinuedQuartetQRatio.lean
```

Conteúdo:

```lean
noncomputable def qNormHorizontalRatio : ℂ → ℝ :=
  fun s => ‖q s‖

noncomputable def constantCoreHorizontalAmplitudeQRatio
    (N : ℕ) : ℂ → ℝ :=
  fun s => 2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s

noncomputable def constantCoreHorizontalUpperQRatio
    (N : ℕ) : ℂ → ℝ :=
  c2HorizontalRegularizedUpper
    (constantCoreHorizontalAmplitudeQRatio N)
    unitScale
    qNormHorizontalRatio
```

Lemas provados:

```text
qNormHorizontalRatio_nonneg
qNormHorizontalRatio_lt_one_of_re_pos
qNormHorizontalRatio_lt_one_of_offCriticalStrip
constantCoreHorizontalAmplitudeQRatio_nonneg
constantCoreHorizontalLayerBudgetQRatio
constantCoreResidualUpperQRatio_eq_geometric
ConstantCoreCutoffFullDominanceQRatio.ofResidualDominance
```

Verificação:

```bash
lake env lean LeanC2/AuditContinuedQuartetQRatio.lean
```

Resultado: compilou.

## Critério de formalização

Pelos critérios combinados:

```text
A. q-ratio fecha região grande com folga robusta: não.
B. q-ratio quase fecha e falhas concentram numa região tratável: parcialmente.
C. cutoff variável melhora claramente: não neste grid.
D. finite-prefix-plus-tail mostra poucas camadas dominantes: ainda não testado
   de forma dedicada.
```

Decisão:

```text
Não promover q-ratio como rota principal.
Manter o patch Lean como infraestrutura condicional de auditoria.
Usar q-ratio como baseline horizontal melhor para o próximo laboratório.
```

## Próximo passo técnico

O próximo candidato não deve gastar energia no antigo half bound. A melhor
sequência é:

```text
1. manter q-ratio como bound horizontal base;
2. atacar/refinar V_exact, que domina os melhores pontos;
3. testar finite-prefix-plus-tail horizontal apenas como refinamento local,
   porque q-ratio já derrubou horizontal para ~4%-5% nos melhores pontos;
4. separar a região sigma pequeno, onde horizontal ainda pesa;
5. somente formalizar novas obrigações se aparecer folga positiva robusta.
```

Resumo direto:

```text
q-ratio é uma melhora real.
q-ratio sozinho ainda não fecha.
O problema mudou de "horizontal grosseiro" para "V_exact/refino vertical" nos
melhores pontos.
```
