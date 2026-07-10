# ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE

Data: 2026-07-08

## Regra De Ouro

Esta e uma rota **Genuine-First**.

Nao usar como input analitico:

```text
zeta
riemannZeta
ExactZeta
zetaUpper
zetaDepthCore
equacao funcional
formula explicita
comparacao externa com zeros da zeta
```

Uso permitido:

```text
1. operadores genuine/C2;
2. geometria de ramo/carry/compressao vertical;
3. tilt/bracket;
4. quartet/half-disk;
5. center Gaussian como diagnostico intrinseco;
6. Lean como consumidor de certificados geometricos.
```

## Tese Da Rota

O `1/2` que aparece no problema nao e um acidente analitico externo.

Ele aparece como o mesmo invariante em tres camadas geometricas:

```text
1. ramo/compressao vertical:
   a massa quadratica satura exatamente em sigma = 1/2;

2. tilt/bracket:
   a curvatura centrada zera exatamente em delta = sigma - 1/2 = 0;

3. quartet/half-disk:
   o canal odd e medido por distancia ao centro 1/2.
```

Leitura operacional:

```text
O mecanismo dos minimos deve ser pago pela geometria de ramo + tilt + quartet,
nao por um ajuste externo nem por comparacao com zeta.
```

## Fenomeno Empirico Que Guia A Rota

Nos operadores finitos genuine/C2/center Gaussian, os minimos continuam
ressoando perto das alturas criticas quando se afasta de `sigma = 1/2`, mas
eles sobem em magnitude.

Leitura observada:

```text
sigma = 1/2:
  minimo mais profundo;

sigma > 1/2 ou sigma < 1/2:
  o vestigio do minimo ainda aparece por um tempo, mas fica maior;

longe da linha:
  o vestigio some.
```

Forma mental:

```text
perfil em V, com vertice em sigma = 1/2.
```

Importante:

```text
O fato de a altura t ressoar perto de zeros conhecidos nao significa, por si,
que o ponto pertence a near-axis formal. A near-axis formal e uma janela
horizontal em torno de sigma = 1/2. A sombra vertical dos zeros pode aparecer
no middle, e e exatamente essa sombra que a geometria deve pagar.
```

## Correcao De Rota

O center Gaussian com tilt foi util e deve continuar como laboratorio.

Mas a rota formal principal nao deve tratar o tilt primeiro como um peso
arbitrario multiplicando o operador principal.

O tilt tambem nao deve ser jogado cedo demais dentro de um modulo bruto. Ele e
o detector transversal de saida da linha critica:

```text
delta = sigma - 1/2
tiltBracket(delta,c) = Delta^2[x -> x^(-delta)](c)
```

Na linha critica ele zera. A direita e a esquerda ele tem sinais opostos. Essa
informacao orientada deve ser preservada ate onde for possivel.

Rota diagnostica:

```text
center Gaussian + transverse-curvature
```

Rota formal preferida:

```text
branch barrier
  -> tilt/bracket curvature
  -> quartet/half-disk upper
  -> exact-gap / phase-saving
  -> middle nonvanishing
```

Em outras palavras:

```text
tilt/branch curvature deve pagar upper/residual do quartet,
nao apenas melhorar main-rest de um ledger finito.
```

Frase-guia:

```text
O tilt e a curvatura transversal do middle. Se ele entra so como modulo, vira
imposto. Se entra como geometria orientada, pode virar margem.
```

## Tilt-Aware Middle Ledger

Esta frente deve comparar tres livros-caixa no mesmo grid do middle.

### Ledger 1: atual sem tilt explicito

Objetivo:

```text
medir a contabilidade base sem usar a curvatura transversal.
```

Forma:

```text
main - defect - tail
```

Uso:

```text
baseline.
```

### Ledger 2: tilt como boleto norm-only

Objetivo:

```text
medir o custo bruto de tratar o tilt como divida.
```

Forma:

```text
main - defect - |tilt| - tail
```

ou, na linguagem residual:

```text
R_mid = V_debt + |T_delta| + H_delta + E_cut
```

Uso:

```text
controle negativo. Se piorar muito, confirma que modulo cedo demais mata a
informacao transversal.
```

### Ledger 3: tilt coletado no principal ajustado

Objetivo:

```text
preservar sinal/fase do tilt e testar se ele melhora a dominancia.
```

Forma conceitual:

```text
(main + signed_tilt_contribution) - defect - tail
```

ou no adjusted quartet:

```text
adjusted_main(tilt-aware) - adjusted_defect - adjusted_tail > 0
```

Uso:

```text
experimento decisivo. Se Ledger 3 melhora e Ledger 2 piora, o tilt estava
sendo tratado como divida quando deveria participar do mecanismo de dominancia.
```

Resultado esperado:

```text
tilt norm-only deve ser caro;
tilt orientado deve melhorar a margem ou explicar melhor o gap/fase.
```

## Pecas Lean Ja Pagas

### 1. Branch Barrier

Arquivo:

```text
LeanC2/Operators/BranchBarrier.lean
```

Objeto:

```lean
branchWeightSigma sigma = 2^(-2*sigma)
branchNormSqSigma sigma = 2 * sum_j branchWeightSigma sigma^(j+2)
```

Teoremas pagos:

```text
branchWeightSigma_half
branchNormSq_half
branchNormSq_lt_one_of_half_lt
branchNormSq_gt_one_of_pos_of_lt_half
branchNormSq_barrier_lt_one
branchNormSq_barrier_eq_one
branchNormSq_barrier_gt_one
branchNormSq_barrier
branchNormSqSigmaT_eq_one_on_critical
branchNormSqSigmaT_lt_one_of_re_gt_half
branchNormSqSigmaT_gt_one_of_re_pos_of_re_lt_half
```

Leitura:

```text
A massa quadratica do ramo C2 satura exatamente em sigma = 1/2.
A direita contrai; a esquerda expande.
```

### 2. Tilt / Bracket

Arquivo:

```text
LeanC2/Operators/Tilt.lean
```

Objetos:

```lean
bracket2 f c = f(c - 1) + f(c + 1) - 2*f(c)
tilt delta x = x^(-delta)
tiltBracket delta c = bracket2 (tilt delta) c
normalizedTiltCurvature delta c =
  c^(delta+2) * tiltBracket delta c
```

Teoremas pagos:

```text
bracket_tilt_zero
bracket_tilt_pos
bracket_tilt_neg
bracket_tilt_zero_iff_delta_zero
normalizedTiltCurvature_zero
normalizedTiltCurvature_pos_of_pos
normalizedTiltCurvature_neg_of_neg_one_lt
normalizedTiltCurvature_zero_iff_delta_zero
```

Leitura:

```text
O bracket centrado do tilt zera exatamente na linha critica e muda de sinal
dos dois lados. A normalizacao transverse-curvature preserva zeros e sinais.
```

### 3. Ponte Center Gaussian Tilt

Arquivo:

```text
LeanC2/Operators/CenterGaussianTilt.lean
```

Objeto:

```lean
centerGaussianTiltFactor lam delta c =
  1 + lam * normalizedTiltCurvature delta c
```

Teoremas pagos:

```text
centerGaussianTiltFactor_zero_delta
centerGaussianTiltFactor_zero_lambda
centerGaussianTiltFactor_gt_one_of_pos
centerGaussianTiltFactor_lt_one_of_neg
centerGaussianTiltFactor_eq_one_iff_delta_zero
centerGaussianTiltedFiniteLedger_zero_delta
centerGaussianTiltedFiniteLedger_filter_add_filter_not
```

Leitura:

```text
Esta peca e diagnostica e preparatoria. Ela mostra como o tilt entra em somas
finitas sem destruir a decomposicao por blocos.
```

### 4. Quartet / Half-Disk

Arquivo:

```text
LeanC2/AuditGenuineMiddle.lean
```

Objetos importantes:

```lean
C2ExactGapAnchorPhaseDisk
C2ContinuedOddHalfDiskBound
C2ExactGapAnchorPhaseDiskBudget
C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
```

Identidade central:

```lean
norm_one_sub_two_mul_eq_two_norm_half_sub
```

Leitura:

```text
O gap `1 - 2*z` e convertido exatamente em distancia ao centro `1/2`.
Logo a forma natural do upper horizontal/odd e uma half-disk em torno de 1/2.
```

### 5. Perfil Unit-Half Do Quartet

Arquivo:

```text
AUDIT_ADJUSTED_QUARTET_ROUTE.md
LeanC2/AuditAdjustedQuartetRoute.lean
```

Perfil ja registrado:

```text
tiltScale       := unitScale
horizontalScale := unitScale
horizontalRatio := halfHorizontalRatio
cutoffScale     := unitScale
```

Leitura:

```text
O `1/2` ja aparece como parametro horizontal canonico do quartet. O tilt deve
ser conectado a essa geometria em vez de ficar isolado como fator numerico.
```

## Evidencia Numerica Atual

Audit tilt-aware:

```text
AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md
```

Leitura:

```text
No center Gaussian core, o experimento confirmou a tese forte:
tilt norm-only vira imposto; tilt orientado/coletado no principal vira margem.

No adjusted quartet positive-box, todos os ledgers passam na janela testada;
norm-only reduz a margem, e oriented melhora quase uniformemente apenas em
sigma=0.86. A coleta orientada no adjusted quartet ainda precisa de calibragem.
```

Audit:

```text
AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN.md
```

Configuracao principal:

```text
nmax = 200000
bg_kmax = 12
X = nmax / 3
main_k_max = 5
core_main = 401
center_main_factor = 1.5
tilt_mode = transverse-curvature
tilt_lambda = 1
```

Achado:

```text
core/horizontal e o gargalo.
```

Sem tilt:

```text
sigma=0.740:
  worst core surplus ~= -1.468e-4
```

Com transverse-curvature:

```text
sigma=0.737:
  worst core surplus ~= +4.938e-5

sigma=0.740:
  worst core surplus ~= +1.598e-3

sigma=0.750:
  worst core surplus ~= +6.606e-3
```

Leitura:

```text
O tilt revela a direcao correta da geometria. Para prova formal inicial, usar
sigma=0.750 como alvo conservador. Depois sigma=0.740. Nao comecar por
sigma=0.737 porque a margem e fina demais.
```

## O Que Calcular Agora Em Python

### Calculo 1: Perfil Em V Do Operador

Objetivo:

```text
medir min_abs(sigma, t0) em uma malha de sigma ao redor de 1/2.
```

Para cada operador testado:

```text
center Gaussian
genuine finito
quartet/continued odd, se disponivel sem zeta
```

Medir:

```text
sigma
t0 ou janela em t
min_abs
argmin_t
branch_defect = branchNormSqSigma(sigma) - 1
tilt_curvature_profile
half_disk_distance, quando houver canal odd disponivel
```

Resultado esperado:

```text
min_abs cresce conforme |sigma - 1/2| cresce, mantendo vestigio vertical por
uma faixa antes de desaparecer.
```

### Calculo 2: Comparar A Subida Com Branch Barrier

Para cada sigma:

```text
q_branch = 2^(-2*sigma)
branch_mass = 2*q_branch^2/(1-q_branch)
branch_defect = branch_mass - 1
```

Medir se a subida do minimo correlaciona melhor com:

```text
|branch_defect|
|normalizedTiltCurvature|
produto/distorsao usado no half-disk budget
```

### Calculo 3: Comparar Tres Ledgers Tilt-Aware

Rodar no mesmo grid do middle:

```text
sigma range
t range
mesmos cortes
mesmo operador base
```

Ledger A:

```text
sem tilt explicito
surplus_A = main - defect - tail
```

Ledger B:

```text
tilt norm-only
surplus_B = main - defect - |tilt| - tail
```

Ledger C:

```text
tilt orientado/coletado no principal
surplus_C = (main + signed_tilt) - defect - tail
```

Diagnostico:

```text
se surplus_B piora e surplus_C melhora, o tilt nao e divida bruta;
ele e parte da margem/fase.
```

Campos minimos do CSV:

```text
sigma
t
main_abs
defect_abs
tail_upper
tilt_signed_re
tilt_signed_im
tilt_abs
surplus_no_tilt
surplus_tilt_norm_only
surplus_tilt_oriented
branch_defect
normalized_tilt_curvature
```

### Calculo 4: Transformar Em Upper Do Half-Disk

Alvo numerico:

```text
halfDiskUpper(s) >= ||1/2 - continuedOddDirichletChannel(s)||
```

Depois testar:

```text
2 * halfDiskUpper(s) <
  c2ExactGapAnchorFactorAllowance K M horizontalConstant horizontalScale horizontalRatio s
```

ou versao distorcida:

```text
2 * distortion(s) * halfDiskUpper(s) < allowance(s)
```

### Calculo 5: Separar Near-Axis De Middle

Registrar explicitamente:

```text
near-axis = |sigma - 1/2| < radius_near(t)
middle    = complemento dentro do strip, depois de remover near-axis/edge
```

Para os pontos problematicos:

```text
sigma ~= 0.737, 0.740, 0.750
|sigma - 1/2| ~= 0.237, 0.240, 0.250
```

Conclusao esperada:

```text
Esses pontos sao middle, salvo se a near-axis usar raio horizontal enorme.
O vestigio vertical do zero nao deve ser classificado automaticamente como
near-axis.
```

## Boletos Lean Da Rota Correta

### Boleto A: Unificar A Linguagem Do 1/2

Criar um arquivo pequeno se necessario:

```text
LeanC2/Route/HalfInvariantBridge.lean
```

Objetivo:

```text
registrar que os tres objetos usam o mesmo centro:
criticalOffset s = s.re - 1/2
branch barrier em sigma = 1/2
tilt delta = sigma - 1/2
half-disk center = 1/2
```

Nao precisa provar uma tese filosofica. Precisa apenas dar nomes reutilizaveis.

### Boleto B: Branch Defect Como Moeda

Definir uma moeda escalar:

```lean
branchDefectSigma sigma := |branchNormSqSigma sigma - 1|
```

ou versao orientada:

```lean
rightBranchContraction sigma := 1 - branchNormSqSigma sigma
```

Para `sigma > 1/2`, provar positividade usando:

```text
branchNormSq_lt_one_of_half_lt
```

Uso esperado:

```text
converter afastamento horizontal da linha critica em reserva/allowance.
```

### Boleto C: Tilt Curvature Como Refinamento Da Moeda

Conectar:

```text
delta = sigma - 1/2
normalizedTiltCurvature delta c
```

com a mesma orientacao da branch barrier.

Para `sigma > 1/2`:

```text
branch contrai;
tilt curvature positiva.
```

Para `0 < sigma < 1/2`:

```text
branch expande;
tilt curvature negativa.
```

### Boleto D: Levar Tilt Para O Quartet Upper

Em vez de apenas:

```text
tilt multiplica main ledger
```

formular:

```text
tilt/branch curvature reduz ou paga o upper residual horizontal/odd.
```

Alvo Lean:

```text
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge
```

e consumidor:

```text
C2ExactGapAnchorPhaseDiskBudgetOnMiddle
C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
C2ExactGapAnchorPhaseSavingOnMiddle_of_halfDiskBoundOnMiddle
```

### Boleto E: Certificado Numerico Consumidor

O certificado deve ter campos do tipo:

```text
sigma_range
t_range
halfDiskUpper
allowanceLower
distortionUpper
proof_grid_to_continuum
proof_roundoff_interval
```

e concluir:

```text
2 * distortionUpper * halfDiskUpper < allowanceLower
```

Esse e o boleto que substitui uma tentativa grosseira de estimar o middle inteiro.

## Ordem De Execucao

### Passo 1

Congelar esta rota como documento ativo.

Arquivo:

```text
ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE.md
```

### Passo 2

Criar/ajustar scanner Python para perfil em V e tres ledgers tilt-aware:

```text
operadores/c2_sigma_v_profile.py
```

Entradas:

```text
operador = center-gaussian | genuine | quartet-halfdisk
sigma_min, sigma_max, dsigma
t windows
```

Saidas:

```text
CSV com:
  min_abs
  argmin_t
  branch_defect
  tilt_profile
  half_disk_distance
  surplus_no_tilt
  surplus_tilt_norm_only
  surplus_tilt_oriented
```

### Passo 3

Rodar primeiro em janelas conhecidas:

```text
t perto de 14.13 / 14.29
t perto dos locked targets do center Gaussian
```

Sem usar zeta como input. Se usar alturas historicas, tratar apenas como
diagnostico de operador, nao como prova nem bound.

### Passo 4

Escolher a moeda que melhor paga o upper:

```text
branch_defect
tilt_curvature
combinacao branch*tilt
signed_tilt coletado no principal
```

### Passo 5

Formalizar a ponte pequena:

```text
HalfInvariantBridge
BranchDefect moeda positiva
Tilt curvature orientada pela branch
```

### Passo 6

Conectar ao half-disk/quartet:

```text
halfDiskUpper <= funcao(branch/tilt/certificado)
2 * halfDiskUpper < allowance
```

### Passo 7

So depois voltar ao fechamento global do middle.

## Guardrails

1. Nao trocar a rota por zeta.
2. Nao tratar `transverse-curvature` como ajuste arbitrario.
3. Nao confundir ressonancia vertical com pertencimento formal a near-axis.
4. Nao comecar pelo sigma mais fino.
5. Nao pagar bounds triangulares que destroem a fase.
6. Nao separar direct/bracket tomando normas antes da ponte correta.
7. Priorizar half-disk em torno de `1/2` sobre gap triangular bruto.

## Estado Final

Esta rota diz:

```text
O centro 1/2 deve ser usado como invariante geometrico comum.
O branch barrier explica a escala vertical.
O tilt/bracket explica a curvatura transversal.
O quartet/half-disk e o lugar correto para transformar isso em upper.
O center Gaussian tilt segue como laboratorio para achar constantes e janelas.
```

Proximo comando de trabalho recomendado:

```text
construir o scanner do perfil em V e gerar o primeiro CSV branch/tilt/half-disk
para as janelas t ~= 14.13 e t ~= 14.29.
```
