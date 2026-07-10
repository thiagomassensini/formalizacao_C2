# C2 V_exact anatomy audit

Este relatório abre o gargalo `V_exact` mantendo o q-ratio como baseline
horizontal. Tudo aqui é diagnóstico numérico: não é prova, não promove rota
principal e não usa resultado numérico como certificado Lean.

O scanner usa `channel_mode = zeta_diagnostic` para avaliar o canal continuado
numericamente. Isso não é input de prova genuine-first.

## Arquivo criado

```text
audit_vexact_anatomy_scanner.py
```

Saídas geradas:

```text
audit_vexact_anatomy_focused.csv
audit_vexact_anatomy_focused.json
audit_vexact_anatomy_fine.csv
audit_vexact_anatomy_fine.json
audit_vexact_anatomy_micro.csv
audit_vexact_anatomy_micro.json
```

## Anatomia calculada

Para cada ponto `s = sigma + i*t` e parâmetros `N,K,M`, o scanner calcula:

```text
tau    = verticalDepthTailFromTwo(s)
rect   = rectangularGenuine(s,K,M)
C      = continuedCentralOddChannel(s)
CutVec = rect - C
VVec   = tau + rect - 2*C

V_exact   = |VVec|
Cut_exact = |CutVec|
K4        = q(s)^2 * (1 + q(s) + q(s)^2 + q(s)^3)
```

Também salva:

```text
cos(VVec, -K4)
cos(tau, -K4)
cos(rect, -K4)
cos(C, -K4)
cos(CutVec, -K4)
cos(HVec, -K4)
```

## Modelos comparados

Modelo A, current q-ratio:

```text
U_current =
  (V_exact + H) * (1+r)/(1-r) + H + Cut
```

Modelo B, direct-balanced diagnostic:

```text
U_direct = V_exact + 2*H + Cut
```

Modelo C, phase-aware diagnostic:

```text
U_phase = |VVec + HVec| + H_tail + Cut
```

Para cutoff constante, o scanner usa o vetor horizontal total:

```text
HVec = 2 * q^2 * OddTrunc_N / (1 - q)
H_tail = 0
```

Margens:

```text
Q_worst = c2ExpandedQuartetResidualMargin(s)
Q_phase = |q^2 * P4(q)| - vertical_tail_upper
```

onde:

```text
P4(q) = 1 + q + q^2 + q^3
vertical_tail_upper = |q|^6 / (1 - |q|)
```

## Grid focado inicial

Comando:

```bash
python3 audit_vexact_anatomy_scanner.py \
  --dps 70 \
  --sigmas 0.75,0.85,0.92 \
  --ts 20,30,45 \
  --N-values 25,50,100,200 \
  --K-range 2:20 \
  --M-values 5,9,15,25,50,100
```

Resumo:

```text
pontos: 4104

passes contra Q_worst:
  current: 0
  direct-balanced: 0
  phase-aware: 2

passes contra Q_phase:
  current: 0
  direct-balanced: 0
  phase-aware: 410

classificação:
  V_exact: 3694
  quartet_margin_pessimism: 408
  phase_cancellation: 2
```

Melhor current no grid focado:

```text
sigma=0.92, t=30, N=50, K=3, M=25
Q_worst = 0.0545023306803
Q_phase = 0.0616526128585
U_current = 0.103547846170
U_direct  = 0.0663319446226
U_phase   = 0.0573231295535

slack_current_Q = -0.0490455154894
slack_direct_Q  = -0.0118296139423
slack_phase_Q   = -0.00282079887313
slack_phase_Qphase = 0.00432948330501

V_exact = 0.0472117916753
H = 0.00459703402797
Cut = 0.00992608489133

cos(VVec,-K4) = 0.452202012631
cos(tau,-K4)  = -0.999988168453
cos(rect,-K4) = -0.804092085182
cos(C,-K4)    = -0.848315620766
cos(Cut,-K4)  = -0.0358021670881
```

Leitura:

```text
No grid grosso, current q-ratio ainda falha.
Direct-balanced quase fecha.
Phase-aware quase fecha contra Q_worst e passa contra Q_phase.
Isso aponta simultaneamente para fator resolvente do seed e margem pessimista
do quarteto como gargalos, mas a maioria dos pontos ainda é V_exact.
```

## Faixa fina em torno de t = 30

Comando:

```bash
python3 audit_vexact_anatomy_scanner.py \
  --dps 80 \
  --sigmas 0.88,0.90,0.92,0.94,0.96 \
  --ts 26,27,28,29,30,31,32,33,34 \
  --N-values 25,50 \
  --K-range 2:8 \
  --M-values 25,50,100,200
```

Resumo:

```text
pontos: 2520

passes contra Q_worst:
  current: 184
  direct-balanced: 329
  phase-aware: 562

passes contra Q_phase:
  current: 228
  direct-balanced: 476
  phase-aware: 1010

classificação:
  V_exact: 1502
  current_passes: 184
  resolvent_seed_factor: 145
  phase_cancellation: 233
  quartet_margin_pessimism: 448
  Cut_exact: 8
```

Melhor current:

```text
sigma=0.88, t=33, N=50, K=3, M=25
Q_worst = 0.0571743813898
Q_phase = 0.0617263773464
U_current = 0.0453178460620
U_direct  = 0.0317785392898
U_phase   = 0.0244380934774

slack_current_Q = 0.0118565353279
slack_direct_Q  = 0.0253958421000
slack_phase_Q   = 0.0327362879124
slack_phase_Qphase = 0.0372882838690

V_exact = 0.0128614323180
H = 0.00528632007545
Cut = 0.00834446682096

cos(VVec,-K4) = 0.287255243392
cos(tau,-K4)  = -0.999997884066
cos(rect,-K4) = -0.923218664707
cos(C,-K4)    = -0.956282954704
cos(Cut,-K4)  = -0.207599349297
```

Leitura:

```text
O grid grosso t=20,30,45 perdeu um bolso perto de t=33.
Nessa faixa, current q-ratio passa numericamente em vários pontos.
Direct-balanced e phase-aware aumentam bastante a folga.
```

## Microfaixa ao redor do melhor bolso

Comando:

```bash
python3 audit_vexact_anatomy_scanner.py \
  --dps 90 \
  --sigmas 0.84,0.86,0.88,0.90,0.92 \
  --ts 32,32.25,32.5,32.75,33,33.25,33.5,33.75,34 \
  --N-values 25,50 \
  --K-range 2:5 \
  --M-values 25,50,100
```

Resumo:

```text
pontos: 1080

passes contra Q_worst:
  current: 163
  direct-balanced: 288
  phase-aware: 389

passes contra Q_phase:
  current: 186
  direct-balanced: 307
  phase-aware: 451

classificação:
  V_exact: 612
  current_passes: 163
  resolvent_seed_factor: 125
  phase_cancellation: 101
  quartet_margin_pessimism: 62
  Cut_exact: 17
```

Melhor ponto da microfaixa:

```text
sigma=0.84, t=32.75, N=50, K=5, M=50
Q_worst = 0.0599557156356
Q_phase = 0.0633744856328
U_current = 0.0379191199279
U_direct  = 0.0260818948393
U_phase   = 0.00888822060510

slack_current_Q = 0.0220365957078
slack_direct_Q  = 0.0338738207963
slack_phase_Q   = 0.0510674950305
slack_phase_Qphase = 0.0544862650277

V_exact = 0.00862423036437
H = 0.00664638354030
Cut = 0.00416489739434

cos(VVec,-K4) = 0.662328878176
cos(tau,-K4)  = -0.999998359997
cos(rect,-K4) = -0.986377687959
cos(C,-K4)    = -0.991370486464
cos(Cut,-K4)  = -0.698249731769
```

Leitura:

```text
O bolso positivo não é um único ponto isolado na malha diagnóstica.
Ele aparece numa microfaixa em torno de sigma 0.84-0.90, t 32.75-33.
Ainda assim, isso é diagnóstico numérico com canal continuado avaliado por zeta.
Não é certificado Lean.
```

## Critérios pedidos

### Current falha mas direct-balanced passa

Na faixa fina:

```text
resolvent_seed_factor: 145 pontos
```

Na microfaixa:

```text
resolvent_seed_factor: 125 pontos
```

Interpretação:

```text
Há uma sub-região onde o gargalo é o fator resolvente do seed:
o livro-caixa current é caro demais, mas o direct-balanced fecha.
```

### Ambos falham

No grid focado:

```text
V_exact: 3694 de 4104 pontos
```

Na faixa fina:

```text
V_exact: 1502 de 2520 pontos
```

Na microfaixa:

```text
V_exact: 612 de 1080 pontos
```

Interpretação:

```text
Fora dos bolsos bons, V_exact ainda é o gargalo dominante.
Se o objetivo é uma região ampla, V_exact precisa de novo tratamento ou split.
```

### Q_phase passa e Q_worst não passa

No grid focado:

```text
quartet_margin_pessimism: 408 pontos
phase_pass_Qphase: 410 pontos
phase_pass_Q: 2 pontos
```

Na faixa fina:

```text
quartet_margin_pessimism: 448 pontos
phase_pass_Qphase: 1010 pontos
phase_pass_Q: 562 pontos
```

Interpretação:

```text
A margem worst-case do quarteto é pessimista em uma parte grande do grid.
Usar |q^2 P4(q)| em vez do lower worst-case muda a decisão em muitos pontos.
```

## Conclusão técnica

O q-ratio deve continuar como baseline horizontal.

O próximo gargalo não é mais simplesmente o horizontal:

```text
1. Em grid grosso, V_exact domina.
2. Em faixa fina, há bolsos onde current q-ratio já passa numericamente.
3. Há muitos pontos onde direct-balanced passa mas current falha:
   isso isola o fator resolvente do seed como gargalo.
4. Há muitos pontos onde Q_phase passa e Q_worst não:
   isso isola pessimismo da margem do quarteto.
5. Phase-aware é forte como diagnóstico, mas ainda não é uma prova.
```

Próximos candidatos de trabalho:

```text
A. formalizar apenas uma rota de auditoria condicional para direct-balanced;
B. estudar um split de V_exact em tau/rect/C/CutVec com fase ou cancellation
   certificate;
C. estudar uma margem de quarteto menos pessimista que preserve segurança;
D. manter current q-ratio como baseline e não voltar ao half-bound.
```

Nada deste relatório deve ser promovido para a rota principal sem uma obrigação
Lean genuine-first correspondente.
