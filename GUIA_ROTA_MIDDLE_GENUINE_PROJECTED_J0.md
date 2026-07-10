# Guia operacional da rota Middle Genuine — Adjusted Quartet Projected J0

Data: 2026-07-10  
Rota: **Genuine-First**  
Status: guia canônico após correção semântica do alvo raw e auditoria de
literalidade do produtor; middle aberto.  
Escopo: obstrução raw, continuação C2-native, modelo SG exato, produtor
binary64 e contabilidade projected-J0 preservada.

---

## Atualização canônica de 2026-07-10

### Obstrução de literalidade do produtor

A genealogia matemática foi fechada:

```text
projectedJ0SG_reference s
  = c2CenterGaussianRectangle 10661 s 17 16001
  = superGaussianFiniteGenuineRectangle 2 10661 s 17 16001.
```

Entretanto, o produtor dos retângulos não avalia literalmente essa soma
exata. `build_central_data` calcula os coeficientes em binary64 e aplica
`keep = coeffs != 0.0`. No reference há 128016 endereços matemáticos, mas
somente 33075 entram na lista do produtor; 94941 são omitidos. O primeiro
coeficiente completo omitido é `(k,m,c) = (5,9077,290464)`. O modo `strict`
trata ainda cada coeficiente binary64 retido como um decimal pontual, sem uma
enclosure do `Real.exp` exato.

Logo os retângulos atuais não podem alimentar memberships de
`projectedJ0SG_*` sem uma ponte adicional, kernel-checked, da implementação
binary64 truncada para o modelo SG exato. Esta divergência aciona o critério de
parada da sentinela: não executar enclosures SG nem transferência para a
continuação antes de reparar essa ponte.

A auditoria formal de `tsum` supersede a interpretação analítica anterior dos
aliases crus no middle:

```text
s.re <= 1 -> oddDirichletChannel s = 0;
s.re <= 1 -> genuineCentralDoubleSeries s = 0.
```

Esses são valores do `tsum` incondicional totalizado fora de seu domínio de
somabilidade, não uma continuação genuine. Em particular, não instanciar no
middle os quatro memberships do pack supergaussiano para
`adjustedProjectedJ0_M`, `D0`, `Drest` e `RvecTail`.

As camadas de projeção, atlas, cobertura, dados retangulares e aritmética
racional continuam preservadas e corretas nos respectivos contratos
condicionais. O que fica **supersedido como próximo passo** é:

```text
construir parallelUpper ou restUpper para os aliases crus;
criar novo atlas ou regenerar dados retangulares;
provar memberships SG contra os aliases crus;
usar totalFinite cru como endpoint nonzero do middle.
```

Ordem ativa a partir desta atualização:

```text
1. obstrução do raw tsum;
2. continuação paired genuine;
3. genealogia do modelo SG exato para o carrier Gaussian;
4. ponte produtor binary64 -> modelo SG exato na sentinela;
5. delta SG exato -> continuação na sentinela s0.84_t7;
6. somente então enclosures kernel-checked e expansão regional.
```

Relatório formal:

```text
AUDIT_GENUINE_RAW_TSUM_MIDDLE_OBSTRUCTION.md
```

Esta atualização não prova nonvanishing da continuação, não fecha o middle e
não conecta a frente ao `PeerReview`.

---

## 0. Para que este guia existe

Este arquivo existe para impedir perda de fio lógico.

A parte middle ficou fracionada em muitas camadas: diagnóstico numérico, decomposição de tilt, decomposição do defeito horizontal, ponte vetorial em Lean, shims abstratos, aliases reais, ledger exato, ledger bounded e, depois disso, bounds regionais. É fácil confundir um diagnóstico com uma prova, voltar para uma rota morta, ou interpretar estouro de orçamento como “a rota falhou” quando na verdade foi só uma conta grosseira demais.

Este guia consolida os relatórios recentes produzidos na rota. A geometria
projected-J0 permanece como ledger reutilizável, mas o roteiro analítico ativo
agora é:

```text
raw tsum obstruction
  -> paired genuine continuation
  -> exact-real super-Gaussian model and Gaussian genealogy
  -> checked producer-to-model bridge
  -> sentinel delta SG-to-continuation
  -> kernel-checked enclosures on the correct objects
  -> only then regional expansion
```

Este documento **não é uma prova da RH**, não fecha o middle inteiro, não transforma CSV em prova e não usa zeta como insumo analítico.

---

## 1. Regra de ouro

A rota ativa é **Genuine-First**.

Na prova local do middle, não usar como input analítico:

```text
zeta
riemannZeta
ExactZeta
zetaUpper
zetaDepthCore
equação funcional
fórmula explícita
comparação externa com zeros
alturas conhecidas de zeros como prova ou bound
```

Uso permitido:

```text
operador genuine/C2
geometria de centros/pernas/bracket
branch barrier
curvatura de tilt
quartet / half-disk
center Gaussian como diagnóstico intrínseco
certificados Lean genuine-first
certificados intervalares futuros, desde que não usem zeta como input analítico
```

Frase de controle:

```text
Provar não-cancelamento no operador genuine/C2 primeiro.
Depois, se necessário, usar ponte terminal.
```

---

## 2. Resumo executivo em uma página

### O que foi descoberto

1. O tilt não deve ser cobrado cedo demais por módulo. No center Gaussian/core, o experimento mostrou que:

```text
tilt norm-only      -> vira imposto
tilt orientado      -> vira margem
```

2. No adjusted quartet, o seed/tilt orientado também ajuda nos gargalos, mas a forma antiga ainda perde margem porque paga o defeito horizontal por norma bruta.

3. O defeito horizontal foi aberto por camada. Resultado decisivo:

```text
j0 domina o horizontal_defect em todos os pontos testados.
```

4. A conta antiga pagava:

```text
horizontal_defect_total_abs = |D0| + |D1| + |D2| + |D3|
```

mas a geometria indica que `D0` deve ser pago por componente destrutiva/projetiva contra o main, não por norma total.

5. A ponte vetorial foi formalizada em Lean:

```lean
radialLoss M D ≤ destructiveParallel M D
```

para `M ≠ 0`.

6. Os objetos reais do adjusted quartet já foram mapeados para a forma:

```text
M      = main seeded complex
D0     = horizontal defect layer j0
Drest  = horizontal defect layers j1 + j2 + j3
Rvec   = adjusted tail complex vector
total  = adjusted quartet ou finite model
```

7. A contabilidade vetorial projected-J0, preservada agora para o surrogate SG,
ficou reduzida a:

```text
0 < mainExactLower - parallelUpper - restUpper
```

com:

```text
mainExactLower = ‖M‖          sem perda
parallelUpper  ≥ destructiveParallel(M, D0)
restUpper      ≥ ‖Drest + Rvec‖
```

ou, na variante mais fácil de alimentar:

```text
restUpper ≥ ‖Drest‖ + ‖Rvec‖
```

8. Na positive-box setorial, `parallelUpper = 0`. A cobertura das 771
subboxes ja foi provada em Lean, e os quatro retangulos racionais por subbox
foram materializados com aritmetica exata. Esses artefatos permanecem válidos
como diagnóstico do surrogate, mas os memberships contra os aliases crus não
devem ser instanciados.

9. A auditoria semântica posterior provou no kernel que
`oddDirichletChannel` e `genuineCentralDoubleSeries` valem zero quando
`s.re <= 1`. Foi criada uma continuação pareada C2-native, um modelo SG exato
com nomes próprios e um lemma abstrato de transferência por erro.

10. A genealogia do modelo SG exato para o carrier Gaussian foi provada termo
a termo e em retângulos finitos. A auditoria do Python mostrou, porém, que o
pack existente mede uma lista binary64 truncada, não literalmente esse modelo.

### O que ainda falta

O primeiro boleto ainda aberto não é um membership dos aliases crus nem o
delta pareado. É reparar a ancestralidade computacional do pack:

```text
1. certificar o erro produtor binary64 -> modelo SG exato, ou regenerar o pack
   com coeficientes transcendentes interval-enclosed;
2. somente então provar o lower do modelo SG exato;
3. certificar o delta SG exato -> genuineCentralContinuationC2 em s0.84_t7;
4. comparar esse delta com o lower SG;
5. só depois considerar as 771 subboxes e expansão regional.
```

### O que não fazer agora

Não voltar para:

```text
canonical closed scaled local data
triangle residual shortcut
odd-anchor norm-only
positiveBox phase-cutoff triangular
AdjustedDefect = sum_j |Dj| como boleto final
cutoff como frente principal
zeta/ExactZeta/zetaUpper/zetaDepthCore como input
memberships do surrogate SG contra aliases crus
nonvanishing literal de genuineCentralDoubleSeries no middle
expansao para 771 subboxes antes do delta sentinela
```

---

## 3. Linha lógica histórica da contabilidade projected-J0

A cadeia abaixo deve ser preservada como ledger vetorial e como diagnóstico do
surrogate SG. Ela não define mais o alvo analítico raw do middle:

```text
A. Diagnóstico geométrico
   tilt orientado melhora core; norm-only piora.

B. Diagnóstico adjusted quartet
   seed ajuda, mas horizontal_defect e norm_tax comem ganho.

C. Decomposição horizontal
   D0 = j0 domina; pagar sum |Dj| é grosseiro.

D. Ponte vetorial
   perda radial de D0 ≤ componente destrutiva de D0 contra M.

E. Shim abstrato
   se mainLower, parallelUpper, restUpper fecham, então total ≠ 0.

F. RealMap/Aliases
   mapear M, D0, Drest, RvecTail e total reais do adjusted quartet.

G. Exact ledger
   projectedSurplus = ‖M‖ - destructiveParallel(M,D0) - restCost.
   Se projectedSurplus > 0, então total ≠ 0.

H. Bounded ledger
   mainExactLower = ‖M‖.
   Se parallelCost ≤ parallelUpper,
      restCost ≤ restUpper,
      0 < mainExactLower - parallelUpper - restUpper,
   então total ≠ 0.

I. Próxima fase
   provar/certificar parallelUpper e restUpper por região/atlas/geometria.
```

A desigualdade terminal local da rota atual é:

```text
0 < adjustedProjectedJ0_mainExactLower tiltSeed s
      - parallelUpper s
      - restUpper s
```

com:

```text
adjustedProjectedJ0_mainExactLower tiltSeed s = ‖adjustedProjectedJ0_M tiltSeed s‖
```

Essa é a moeda final da frente atual.

---

## 4. Relatórios consolidados, em ordem lógica

### 4.1. `AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md`

Objetivo: testar se o tilt deve ser tratado como boleto norm-only ou como contribuição orientada no principal.

Experimento comparou três livros-caixa:

```text
no_tilt:
  |main_0| - |rest_0|

tilt_norm_only:
  |main_0| - |rest_0| - (|tilt_main| + |tilt_rest|)

tilt_oriented:
  |main_0 + tilt_main| - |rest_0 + tilt_rest|
```

Resultado central no center Gaussian/core:

```text
sigma=0.737:
  no_tilt worst   < 0
  norm_only worst << 0
  oriented worst  > 0

sigma=0.740:
  no_tilt quase falha
  norm_only falha fortemente
  oriented passa

sigma=0.750:
  oriented passa com folga maior
```

Leitura:

```text
O tilt como módulo vira imposto.
O tilt orientado/coletado no principal vira margem.
```

Mas no adjusted quartet, a parametrização inicial ainda não fechou. O diagnóstico indicou que a coleta orientada do tilt é real, mas a forma adjusted ainda engolia essa contribuição.

Consequência para a rota:

```text
Não formalizar ainda o adjusted quartet antigo.
Abrir a contabilidade fina: seed, main, norm_tax, horizontal_defect, tail.
```

---

### 4.2. `AUDIT_ADJUSTED_QUARTET_TILT_BREAKDOWN.md`

Objetivo: abrir o adjusted quartet tilt-aware e classificar onde a margem orientada do seed/tilt estava sendo perdida.

Campos expostos:

```text
main_base
seed_complex
seed_prefix_norm_tax
main_seeded_oriented
oriented_gain
tail_without_tilt
tilt_tail_upper
horizontal_defect
cutoff_budget
vertical_tail
surplus_no_tilt
surplus_tilt_norm_only
surplus_tilt_oriented
norm_tax
net_oriented_gain
failure_class
```

Resultado total:

```text
seed_helps_but_norm_tax_eats : 3479
pass                         : 196
seed_hurts_phase             : 52
```

Leitura por janela:

```text
sigma=0.740, t=14.25..14.35:
  parte da janela tem seed_hurts_phase.

sigma=0.5, t=11.5..13.0:
  seed ajuda em todos os pontos,
  mas horizontal_defect domina e norm_tax come o ganho.

sigma=0.5, t=24.5..25.5:
  mesmo padrão.

sigma=0.5, t=47.5..48.5:
  parte passa, maioria ainda falha por defeito horizontal/taxação.

positive-box 0.84..0.86:
  tudo passa; região já estava folgada.
```

Conclusão:

```text
O seed/tilt orientado não está morto no adjusted quartet.
Ele aparece nos gargalos.
Mas a forma atual ainda joga margem fora:
  - por seed_hurts_phase em uma janela local;
  - por horizontal_defect grande;
  - por taxação norm-only do seed/tilt.
```

Próxima decisão tomada:

```text
Abrir horizontal_defect por camada e fase/projeção.
```

---

### 4.3. `AUDIT_ADJUSTED_QUARTET_HORIZONTAL_DEFECT_BREAKDOWN.md`

Objetivo: distinguir gargalo real de gargalo criado por pagar vetor complexo como módulo bruto.

As quatro camadas horizontais expostas:

```text
D_j = 2 * q^(j+2) * horizontal_delta,  j = 0,1,2,3
D   = D0 + D1 + D2 + D3
horizontal_defect_total_abs = |D0| + |D1| + |D2| + |D3|
```

Moedas comparadas:

```text
surplus_current_oriented =
  main_seeded_oriented
  - horizontal_defect_total_abs
  - tail_without_tilt
  - tilt_tail_upper

surplus_projected_parallel =
  main_seeded_oriented
  - destructive_parallel(D, main_seeded_complex)
  - tail_without_tilt
  - tilt_tail_upper

surplus_projected_phase_aware =
  main_seeded_oriented
  - max(0, |M| - |M + D|)
  - tail_without_tilt
  - tilt_tail_upper
```

Resultado decisivo:

```text
j0 domina em 3727/3727 linhas.
```

Passagens por janela:

```text
sigma 0.5, t=11.5..13.0:
  atual:       0 / 1501
  projetado: 784 / 1501
  phase-aware: 1501 / 1501

sigma 0.5, t=24.5..25.5:
  atual:        0 / 1001
  projetado:  571 / 1001
  phase-aware: 849 / 1001

sigma 0.5, t=47.5..48.5:
  atual:       73 / 1001
  projetado: 354 / 1001
  phase-aware: 944 / 1001

sigma 0.740, t=14.25..14.35:
  atual:        0 / 101
  projetado:   92 / 101
  phase-aware:101 / 101

positive-box:
  todos passam em todas as moedas.
```

Médias importantes:

```text
janela 11.5..13.0:
  norma bruta média            ≈ 1.9098
  paralelo destrutivo médio    ≈ 0.9970
  perda radial phase-aware     ≈ 0.6905
```

Conclusão:

```text
horizontal_defect é real, mas é pago caro demais por norma bruta.
O gargalo principal agora é falta de moeda de fase/projeção,
não cutoff e não simplesmente falta bruta de tamanho.
```

Rota escolhida:

```text
D0 = j0 dominante pago por projeção.
Drest = j1+j2+j3 pago por norma.
Rvec/tail pago por norma ou por certificado mais fino depois.
```

---

### 4.4. `AUDIT_ADJUSTED_QUARTET_HORIZONTAL_PROJECTION_LEAN.md`

Objetivo: criar uma camada Lean pequena, puramente vetorial, para substituir pagamento bruto do defeito horizontal por moeda radial/projetiva.

Vetores abstratos:

```lean
M D R D0 Drest : ℂ
```

Definições:

```lean
radialLoss M D := ‖M‖ - ‖M + D‖
radialLossPos M D := max 0 (radialLoss M D)

parallelCoord M D :=
  ((D * starRingEnd ℂ M).re) / ‖M‖

destructiveParallel M D :=
  max 0 (-(parallelCoord M D))
```

Lemas principais:

```lean
ne_zero_of_main_after_defect_lower
ne_zero_of_radialLoss_budget
ne_zero_of_radialLossPos_budget
ne_zero_of_projected_j0_and_rest
ne_zero_of_projected_j0_and_separate_rest
```

Ponte projetiva fechada:

```lean
norm_add_ge_norm_add_parallelCoord
radialLoss_le_neg_parallelCoord
radialLoss_le_destructiveParallel
projectionBridgeTarget_holds
```

Ideia geométrica:

```text
Re(((M + D) * conj M)) ≤ ‖M + D‖ * ‖M‖
```

Dividindo por `‖M‖` quando `M ≠ 0`:

```text
‖M‖ + parallelCoord(M,D) ≤ ‖M + D‖
```

Logo:

```text
radialLoss(M,D) ≤ -parallelCoord(M,D) ≤ destructiveParallel(M,D)
```

Consumidor direto:

```lean
ne_zero_of_projected_j0_and_rest_parallel
```

Forma:

```text
mainLower ≤ ‖M‖
destructiveParallel M D0 ≤ parallelUpper
‖Drest + R‖ ≤ restUpper
parallelUpper + restUpper < mainLower
------------------------------------------------
M + D0 + Drest + R ≠ 0
```

Conclusão:

```text
A falha por norma bruta ganhou uma substituição vetorial formal.
```

---

### 4.5. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_SHIM.md`

Objetivo: conectar a ponte vetorial ao formato abstrato do adjusted quartet, sem objetos reais ainda.

Estruturas criadas:

```lean
AdjustedQuartetProjectedJ0PointData
AdjustedQuartetProjectedJ0SeparateRestPointData
AdjustedQuartetProjectedJ0OnRegionData
```

Campos essenciais:

```lean
M : ℂ
D0 : ℂ
Drest : ℂ
R : ℂ
total : ℂ
mainLower : ℝ
parallelUpper : ℝ
restUpper : ℝ

total_eq : total = M + D0 + Drest + R
hM : M ≠ 0
hMain : mainLower ≤ ‖M‖
hParallel : destructiveParallel M D0 ≤ parallelUpper
hRest : ‖Drest + R‖ ≤ restUpper
hBudget : parallelUpper + restUpper < mainLower
```

Teoremas:

```lean
AdjustedQuartetProjectedJ0PointData.total_ne_zero
AdjustedQuartetProjectedJ0SeparateRestPointData.total_ne_zero
AdjustedQuartetProjectedJ0OnRegionData.total_ne_zero
```

Conclusão:

```text
Agora existe API abstrata que consome mainLower, parallelUpper, restUpper
concluindo total ≠ 0.
```

---

### 4.6. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_REAL_MAPPING.md`

Objetivo: mapear nomes Lean reais do adjusted quartet para o shim abstrato, sem provar bounds.

Mapeamento encontrado:

```text
M(s):
  c2ConcreteAntiMiracleAdjustedAmplitude tiltSeed s
  * verticalQuartetPrefix(c2ConcreteAntiMiracleAdjustedRatio s)

D0(s):
  c2ConcreteAntiMiracleAdjustedError0 coreCutoff s

Drest(s):
  E1 + E2 + E3

Rvec(s):
  c2ConcreteAntiMiracleAdjustedTail tiltSeed coreCutoff K M s

total(s):
  c2ConcreteAntiMiracleAdjustedQuartet tiltSeed coreCutoff s
  ou
  c2ConcreteAntiMiracleFiniteModel tiltSeed coreCutoff K M s

mainLower(s):
  c2ConcreteAntiMiracleAdjustedMain tiltSeed s
```

Identidades existentes encontradas:

```lean
c2ConcreteAntiMiracleAdjustedQuartet_eq_errorSplit
c2ConcreteAntiMiracleFiniteModel_eq_adjustedQuartet_add_tail
c2ConcreteAntiMiracleAdjustedTail_eq_expanded_of_re_pos
```

Aviso essencial:

```text
Rvec : ℂ é vetor complexo.
restUpper : ℝ é cota real.
Tails/cutoffs reais existentes entram em restUpper, não em Rvec.
```

Conclusão:

```text
Os objetos reais existem; faltavam aliases leves e identidades pequenas.
```

---

### 4.7. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_ALIASES.md`

Objetivo: criar aliases Lean para os componentes reais do adjusted quartet e provar identidades algébricas pequenas.

Aliases criados:

```lean
adjustedProjectedJ0_M
adjustedProjectedJ0_D0
adjustedProjectedJ0_D1
adjustedProjectedJ0_D2
adjustedProjectedJ0_D3
adjustedProjectedJ0_Drest
adjustedProjectedJ0_totalQuartet
adjustedProjectedJ0_RvecTail
adjustedProjectedJ0_totalFinite
```

Definição operacional:

```text
M      = adjusted amplitude * verticalQuartetPrefix(adjusted ratio)
D0     = adjusted horizontal error E0
Drest  = E1 + E2 + E3
Rvec   = adjusted tail complex vector
```

Identidades provadas:

```lean
adjustedProjectedJ0_totalQuartet_eq
```

Forma:

```text
AdjustedQuartet = M + D0 + Drest
```

```lean
adjustedProjectedJ0_totalFinite_eq
```

Forma:

```text
FiniteModel = M + D0 + Drest + RvecTail
```

Consumidores pointwise também compilam:

```lean
adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_bounds
adjustedProjectedJ0_totalFinite_ne_zero_of_projected_bounds
adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_separate_bounds
adjustedProjectedJ0_totalFinite_ne_zero_of_projected_separate_bounds
```

Conclusão:

```text
A ponte vetorial agora consome objetos reais do adjusted quartet.
```

---

### 4.8. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_EXACT_LEDGER.md`

Objetivo: criar ledger exato/no-loss com custos pointwise.

Custos criados:

```lean
adjustedProjectedJ0_parallelCost
```

Forma:

```text
destructiveParallel(M, D0)
```

```lean
adjustedProjectedJ0_restCostQuartet
adjustedProjectedJ0_restCostFinite
```

Formas:

```text
Quartet:      ‖Drest + 0‖
FiniteModel:  ‖Drest + RvecTail‖
```

Variantes separadas:

```lean
adjustedProjectedJ0_separateRestCostQuartet
adjustedProjectedJ0_separateRestCostFinite
```

Formas:

```text
Quartet:      ‖Drest‖ + ‖0‖
FiniteModel:  ‖Drest‖ + ‖RvecTail‖
```

Surplus exatos:

```lean
adjustedProjectedJ0_projectedQuartetSurplus
adjustedProjectedJ0_projectedFiniteSurplus
adjustedProjectedJ0_projectedQuartetSeparateSurplus
adjustedProjectedJ0_projectedFiniteSeparateSurplus
```

Forma comum:

```text
‖M‖ - parallelCost - restCost
```

Teoremas principais:

```lean
adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSurplus_pos
adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSurplus_pos
adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSeparateSurplus_pos
adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSeparateSurplus_pos
```

Remoção de `hM`:

```text
surplus positivo implica M ≠ 0,
porque parallelCost e restCost são não negativos.
```

Versões por região:

```lean
AdjustedProjectedJ0FiniteSurplusPositiveOnRegion
AdjustedProjectedJ0QuartetSurplusPositiveOnRegion
adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_projectedSurplus
adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_projectedSurplus
```

Conclusão:

```text
0 < ‖M‖ - destructiveParallel(M,D0) - restCost
------------------------------------------------
total ≠ 0
```

---

### 4.9. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_BOUNDED_LEDGER.md`

Objetivo: transformar bounds futuros em surplus positivo e depois em não-anulamento.

Main exact lower:

```lean
adjustedProjectedJ0_mainExactLower tiltSeed s :=
  c2ConcreteAntiMiracleAdjustedMain tiltSeed s
```

Teorema:

```lean
adjustedProjectedJ0_mainExactLower_eq_norm
```

Forma:

```text
adjustedProjectedJ0_mainExactLower tiltSeed s = ‖adjustedProjectedJ0_M tiltSeed s‖
```

Compila por `rfl`, portanto é exact/no-loss.

Bounded surplus lower:

```lean
adjustedProjectedJ0_projectedQuartetSurplusLower
adjustedProjectedJ0_projectedFiniteSurplusLower
adjustedProjectedJ0_projectedQuartetSeparateSurplusLower
adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
```

Forma comum:

```text
mainExactLower - parallelUpper - restUpper
```

Ponte bounded → exact surplus:

```lean
adjustedProjectedJ0_projectedQuartetSurplus_pos_of_bounded
adjustedProjectedJ0_projectedFiniteSurplus_pos_of_bounded
adjustedProjectedJ0_projectedQuartetSeparateSurplus_pos_of_bounded
adjustedProjectedJ0_projectedFiniteSeparateSurplus_pos_of_bounded
```

Consumidores bounded → nonzero:

```lean
adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSurplus
adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSurplus
adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSeparateSurplus
adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSeparateSurplus
```

Versões por região:

```lean
AdjustedProjectedJ0FiniteBoundedSurplusPositiveOnRegion
AdjustedProjectedJ0QuartetBoundedSurplusPositiveOnRegion
AdjustedProjectedJ0FiniteSeparateBoundedSurplusPositiveOnRegion
AdjustedProjectedJ0QuartetSeparateBoundedSurplusPositiveOnRegion
```

Consumidores por região:

```lean
adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSurplus
adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSurplus
adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSeparateSurplus
adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSeparateSurplus
```

Conclusão:

```text
A obrigação formal atual foi reduzida a:

0 < mainExactLower - parallelUpper - restUpper
```

com `mainExactLower = ‖M‖` sem perda.

---

### 4.10. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_D0_NUMERATOR_UPPER.md`

Objetivo: criar uma camada pequena que transforma bounds para a parte real
negativa de `D0 * conj M` em bounds para o numerador projetivo de `D0`.

Definições criadas:

```lean
adjustedProjectedJ0_D0NegReMain
adjustedProjectedJ0_D0DestructiveNumerator
```

Identidade central:

```text
adjustedProjectedJ0_D0DestructiveNumerator
  = max 0 adjustedProjectedJ0_D0NegReMain
```

Lema genérico:

```lean
destructiveNumerator_le_of_neg_re_le
```

Forma:

```text
0 ≤ U
-(D * conj M).re ≤ U
------------------------------------------------
destructiveNumerator M D ≤ U
```

Estrutura regional:

```lean
ProjectedJ0D0NegReUpperData
```

Ela consome:

```text
main_ne_zero
numerator_nonneg
adjustedProjectedJ0_D0NegReMain ≤ numeratorUpper
numeratorUpper ≤ parallelUpper * ‖M‖
parallelUpper ≥ 0
```

e gera:

```lean
ProjectedJ0ParallelUpperData
```

Consumidores regionais criados:

```lean
AdjustedProjectedJ0FiniteNegReBoundedData.total_ne_zero
AdjustedProjectedJ0QuartetNegReBoundedData.total_ne_zero
```

Expansão leve de `D0`:

```text
D0 = 2 * adjustedRatio^2 *
  (rectangularOddCoreSum(coreCutoff 0) - oddDirichletChannel)
```

Leitura:

```text
O próximo bound formal pode atacar diretamente
  -Re(D0 * conj M)
por atlas intervalar ou geometria branch/tilt/half-disk,
sem voltar a pagar D0 por norma.
```

Esta camada ainda não constrói `numeratorUpper` concreto, não prova
`restUpper`, não fecha positividade regional e não conecta ao middle público.

---

### 4.11. `AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_RATIO_UPPER.md`

Objetivo: converter um upper do numerador destrutivo de `D0` e um lower
positivo de `‖M‖` em uma cota `parallelUpper`.

Definição criada:

```lean
adjustedProjectedJ0_parallelUpperFromNumeratorLower
```

Forma:

```text
parallelUpper(s) = numeratorUpper(s) / mainNormLower(s)
```

Estrutura regional:

```lean
ProjectedJ0D0RatioUpperData
```

Ela consome:

```text
0 < mainNormLower(s)
mainNormLower(s) ≤ ‖M(s)‖
0 ≤ numeratorUpper(s)
adjustedProjectedJ0_D0NegReMain(s) ≤ numeratorUpper(s)
```

e gera:

```lean
ProjectedJ0ParallelUpperData
```

Lema real usado:

```text
0 ≤ a, 0 < b, b ≤ c
------------------------------------------------
a ≤ (a / b) * c
```

Consumidores regionais criados:

```lean
AdjustedProjectedJ0FiniteRatioBoundedData.total_ne_zero
AdjustedProjectedJ0QuartetRatioBoundedData.total_ne_zero
```

Tambem existe uma versão constante para caixas/atlas:

```lean
ProjectedJ0D0ConstantRatioUpperData
```

Leitura:

```text
Um certificado futuro deve fornecer:
  numeratorUpper    para -Re(D0 * conj M);
  mainNormLower > 0 para ‖M‖;
  restUpper         para o resto.

Esta camada apenas transforma os dois primeiros em parallelUpper.
```

Ela ainda não prova `numeratorUpper`, não prova `mainNormLower`, não prova
`restUpper`, não fecha positividade regional e não conecta ao middle público.

---

### 4.12. Scout de atlas e `ConstantAtlas`

Relatorios:

```text
AUDIT_PROJECTED_J0_ATLAS_SCOUT.md
AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_CONSTANT_ATLAS.md
```

Script diagnostico criado:

```text
operadores/c2_projected_j0_atlas_scout.py
```

Ele procura caixas onde constantes amostradas satisfaçam:

```text
0 < mainNormLowerConst
numeratorUpperConst ≥ max D0DestructiveNumerator
mainNormLowerConst ≤ min ‖M‖
restUpperConst ≥ max restCost
0 < mainNormLowerConst - numeratorUpperConst/mainNormLowerConst - restUpperConst
```

Leitura das rodadas iniciais:

```text
positive-box passa integralmente com constantes;
janela 47.5-48.5 tem bolsos positivos e melhora com subdivisao;
janelas 11.5-13.0 e 24.5-25.5 continuam dominadas por parallelUpper;
seed_hurts melhora com subdivisao, mas ainda pede seed/fase melhor.
```

Arquivo Lean criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0ConstantAtlas.lean
```

Estruturas principais:

```lean
ProjectedJ0ConstantBoxData
ProjectedJ0ConstantBoxSeparateRestData
ProjectedJ0ConstantAtlasData
```

Teoremas principais:

```lean
ProjectedJ0ConstantBoxData.total_ne_zero
ProjectedJ0ConstantBoxSeparateRestData.total_ne_zero
ProjectedJ0ConstantAtlasData.total_ne_zero
```

Esta camada consome constantes e cobertura de caixas. Ela nao prova as
constantes, nao prova a cobertura e nao transforma o scout numerico em prova.

---

### 4.13. Certificador intervalar externo por caixa

Relatorio:

```text
AUDIT_PROJECTED_J0_INTERVAL_BOX_CERTIFIER.md
```

Script criado:

```text
operadores/c2_projected_j0_interval_box_certifier.py
```

Objetivo:

```text
Ler caixas candidatas do scout e produzir constantes auditaveis:
  mainNormLowerConst
  numeratorUpperConst
  restUpperCombinedConst
  restUpperSeparateConst
  budgetCombinedConst
  budgetSeparateConst
```

Rodadas iniciais:

```text
positive-box: 27/27 combined e 27/27 separate certificados;
valley47 positivos: 11/41 combined e 10/41 separate certificados;
seed_hurts positivos: 6/6 combined e 5/6 separate certificados.
```

Modo usado:

```text
fast, interval-dps 50, inflate 1e-12
```

Subdivisoes internas:

```text
positive-box: subdiv-t=8
valley47: subdiv-t=64
seed_hurts: subdiv-t=512
```

Leitura:

```text
O maior fator de inflacao foi o lower de |M|.
combined rest preserva mais caixas que separate rest.
valley47 ainda precisa subdividir as caixas com fail_interval_inflation.
```

Atualizacao de pacote/certificacao:

```text
positive-box virou pacote externo reproduzivel:
  audit_outputs/projected_j0_positive_box_certificate_pack/

seed_hurts virou pacote externo menor:
  audit_outputs/projected_j0_seed_hurts_certificate_pack/
```

Tambem foi adicionada a opcao:

```text
--main-lower-method rect
--main-lower-method center-radius
```

Reprocessamento das 30 falhas `valley47` com `center-radius` e `subdiv-t=128`:

```text
12/30 recuperadas em combined;
11/30 recuperadas em separate;
18/30 ainda falham por inflacao.
```

Leitura nova: nas caixas reprocessadas, `center-radius` nao melhorou o lower
retangular de `|M|` por si so. A recuperacao veio da subdivisao mais fina, que
tambem estreitou `numeratorUpperConst` e `restUpperCombinedConst`. Para as
falhas restantes, a proxima tentativa natural e subdividir mais ou criar um
lower `sample-lipschitz`/geometrico para `|M|`.

Atualizacao de manifest/checker externo:

```text
AUDIT_PROJECTED_J0_EXTERNAL_CHECKER_PATH.md
AUDIT_PROJECTED_J0_EXTERNAL_CERTIFICATE_MANIFEST.md
LeanC2/AuditAdjustedQuartetProjectedJ0ExternalManifest.lean
```

Leitura: o positive-box pack e o primeiro bloco externo robusto verificado.
O caminho pratico recomendado e primeiro racionalizar os dados, depois decidir
entre verificador externo deterministico ou formalizacao parcial da algebra em
Lean. Nenhum numero do pack foi inserido como teorema.

Pack racionalizado positive-box:

```text
audit_outputs/projected_j0_positive_box_rationalized_pack/
AUDIT_PROJECTED_J0_POSITIVE_BOX_RATIONALIZED_PACK.md
LeanC2/AuditAdjustedQuartetProjectedJ0RationalizedCertificateSchema.lean
```

Resultado:

```text
27/27 caixas sobrevivem em combined;
27/27 caixas sobrevivem em separate;
min budget combined racionalizado = 0.041988183200;
min budget separate racionalizado = 0.041893943068.
```

Leitura: a racionalizacao preserva a margem positive-box e prepara um formato
de dados mais seguro para uma futura checagem algebraica. Ela ainda nao prova
as enclosures analiticas.

Positive-box rationalized Lean algebra data:

```text
operadores/c2_projected_j0_rationalized_pack_verifier.py
operadores/c2_projected_j0_generate_lean_rationalized_data.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_RATIONALIZED_PACK_VERIFICATION.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_RATIONALIZED_LEAN_DATA.md
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData.lean
```

Resultado:

```text
verificacao racionalizada: 27/27 combined, 27/27 separate;
checks failed = 0;
dados Lean: 27 certificados combined e 27 separate.
```

Leitura: o Lean agora checa a algebra racional dos budgets arredondados:

```text
0 < mainLower
0 <= numeratorUpper
0 <= restUpper
0 < mainLower - numeratorUpper/mainLower - restUpper
```

Isso ainda nao checa que as constantes minoram/majoram as funcoes analiticas.
E uma camada intermediaria segura entre o pacote externo auditavel e uma futura
formalizacao/verificacao das enclosures.

Rationalized bridge: algebra Lean + hypotheses externas:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedBridge.lean
AUDIT_PROJECTED_J0_RATIONALIZED_BRIDGE_LEAN.md
```

Leitura: a ponte condicional recebe um
`ProjectedJ0RationalizedBoxCertificate` e hipoteses analiticas externas:

```text
mainLower <= ||M(s)||
D0NegReMain(s) <= numeratorUpper
restCostFinite(s) <= restUpper
```

e entao produz `ProjectedJ0ConstantBoxData`, que por sua vez entrega:

```text
totalFinite(s) != 0
```

na caixa. A variante separate usa `separateRestCostFinite`. Tambem foi criada
uma estrutura de atlas condicional, com cobertura e hipoteses externas por
caixa. Esta camada nao prova as enclosures; ela apenas torna explicito o
contrato entre os dados racionalizados e o scaffold Lean.

Lei angular de D0/M:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0AngularRatio.lean
AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_ANGULAR_RATIO.md
operadores/c2_projected_j0_angular_ratio_scout.py
AUDIT_PROJECTED_J0_ANGULAR_RATIO_SCOUT.md
```

Leitura formal:

```text
destructiveParallel(M,D0) =
  ||M|| * max(0, -Re(D0/M)).
```

Assim, o custo paralelo pode ser pago por uma cota angular `lambda`:

```text
parallelUpper(s) = lambda(s) * mainExactLower(s)
```

e o budget regional vira:

```text
0 < mainExactLower(s) - lambda(s) * mainExactLower(s) - restUpper(s)
```

ou, conceitualmente:

```text
(1 - lambda(s)) * ||M(s)|| > restUpper(s).
```

O arquivo Lean tambem fatorou `D0/M` usando a identidade expandida ja existente
para `D0`. O scout angular mostrou:

```text
positive-box: lambda = 0 na malha testada, 27/27 caixas passam;
valley47: 43/201 caixas passam, falha principal e lambda grande;
seed_hurts: fronteira fina, lambda perto de 1;
t 11.5..13.0 e t 24.5..25.5: sem caixas passando no scout angular.
```

Essa camada nao prova uma cota concreta para `lambda`. Ela aponta a proxima
moeda: controle setorial de `D0/M`, por geometria branch/tilt/half-disk onde
possivel e por atlas intervalar nas janelas locais.

Positive-box sector certificate: numeratorUpper = 0:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0SectorUpper.lean
AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_SECTOR_UPPER.md
operadores/c2_projected_j0_sector_box_certifier.py
AUDIT_PROJECTED_J0_SECTOR_BOX_CERTIFIER.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_CERTIFICATE_PACK.md
audit_outputs/projected_j0_positive_box_sector_certificate_pack/
```

Leitura setorial:

```text
D0NegReMain(s) = -Re(D0(s) * conj(M(s))) <= 0.
```

Nesse setor:

```text
numeratorUpper = 0
parallelUpper = 0
```

e a caixa precisa apenas:

```text
0 < mainLower - restUpper.
```

Resultado do certifier externo positive-box:

```text
fast/sub8: 24/27 setoriais;
fast/sub32: 27/27 nondestructive, 27/27 combined, 27/27 separate;
pior caixa: s0.84_t7;
min sector budget combined = 0.054086045802;
strict/sub8 em s0.84_t7 tambem certificou.
```

Esse certificado e mais geometrico que o upper de numerador generico. Ele ainda
nao prova as enclosures dentro do Lean kernel, mas alimenta diretamente o
contrato `ProjectedJ0SectorConstantBoxData`.

Sector rationalized pack: numeratorUpper = 0:

```text
operadores/c2_projected_j0_sector_pack_verifier.py
operadores/c2_projected_j0_rationalize_sector_pack.py
operadores/c2_projected_j0_generate_lean_sector_rationalized_data.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_PACK_VERIFICATION.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_RATIONALIZED_PACK.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_RATIONALIZED_LEAN_DATA.md
AUDIT_PROJECTED_J0_SECTOR_RATIONALIZED_BRIDGE_LEAN.md
LeanC2/AuditAdjustedQuartetProjectedJ0SectorRationalizedCertificateSchema.lean
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedBridge.lean
audit_outputs/projected_j0_positive_box_sector_rationalized_pack/
```

Verificacao do pack setorial:

```text
checks failed = 0;
rerun exit code = 0;
max rerun diff = 0.
```

Racionalizacao setorial em 12 casas:

```text
27/27 nondestructive;
27/27 sector combined;
27/27 sector separate;
min sector budget combined racionalizado = 0.054086045801;
min sector budget separate racionalizado = 0.054031343484;
pior caixa = s0.84_t7.
```

O Lean agora checa a algebra racional:

```text
d0_neg_re_upper <= 0
0 < mainLower
0 <= restUpper
0 < mainLower - restUpper
```

Tambem existe uma ponte condicional:

```text
certificado racionalizado setorial
+ hipoteses analiticas externas
------------------------------------------------
ProjectedJ0SectorConstantBoxData
------------------------------------------------
totalFinite != 0 na caixa
```

Foi instanciado um exemplo condicional para a pior caixa
`s0.84_t7`. Esta camada ainda nao prova as enclosures analiticas no kernel; ela
checa a algebra racional e explicita as hipoteses externas restantes.

Positive-box sector chain verification:

```text
operadores/c2_projected_j0_sector_chain_verifier.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_CHAIN_VERIFICATION.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_SENTINEL_STRICT.md
audit_outputs/projected_j0_positive_box_sector_chain_verification.json
```

A cadeia verificada e:

```text
source interval output fast/sub32
  -> sector certificate pack
  -> sector rationalized pack
  -> Lean rational algebra data
  -> conditional bridge contract
```

Resultado do chain verifier:

```text
checks failed = 0;
source -> pack diff maximo = 0;
27/27 nondestructive;
27/27 sector combined;
27/27 sector separate;
27/27 rationalized nondestructive/combined/separate;
Lean data regenera byte a byte do pack racionalizado;
bridge condicional e exemplo s0.84_t7 encontrados.
```

O manifest externo agora marca:

```text
preferred_positive_box_pack =
  projected_j0_positive_box_sector_rationalized_pack
```

Justificativa: no positive-box setorial, `parallelUpper = 0`; o budget e maior
que no pack generico; a cadeia externa passa; e o bridge Lean condicional
consome exatamente as hipoteses analiticas restantes.

Cross-check strict:

```text
strict/sub8 em s0.86_t0: passou;
strict/sub8 em s0.84_t0, s0.84_t1, s0.85_t0:
  budgets positivos, mas falha nondestructive por inflacao.
strict/sub16 em s0.84_t0, s0.84_t1, s0.85_t0:
  3/3 nondestructive, 3/3 combined, 3/3 separate.
```

Leitura: `strict/sub8` e util como sentinela, mas e caro e grosseiro nas bordas.
`strict/sub16` recupera as bordas e confirma que a falha anterior era efeito de
subdivisao grosseira. O certificador primario do pack setorial continua sendo
`fast/sub32`, porque strict e muito mais caro.

Enclosure contract and subbox certificate:

```text
AUDIT_PROJECTED_J0_SECTOR_ENCLOSURE_CONTRACT.md
operadores/c2_projected_j0_sector_subbox_certificate.py
operadores/c2_projected_j0_sector_subbox_verifier.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_SUBBOX_VERIFICATION.md
audit_outputs/projected_j0_positive_box_sector_subbox_certificate/
audit_outputs/projected_j0_positive_box_sector_subbox_verification.json
```

A cadeia granular agora e:

```text
sector certifier fast/sub32
  -> subbox certificate
  -> subbox verifier
  -> rationalized pack
  -> Lean rational data
  -> conditional bridge
```

Contrato por caixa:

```text
mainLower <= ||M(s)||
D0NegReMain(s) <= d0NegReUpper <= 0
restCostFinite(s) <= restUpper
0 < mainLower - restUpper
```

Resultado do subbox verifier:

```text
checks failed = 0;
27 boxes;
771 subboxes;
max subbox D0NegReMain upper = -0.00019368049701349772;
min sector budget combined rat = 0.054086045801;
min sector budget separate rat = 0.054031343484;
worst box = s0.84_t7.
```

Leitura: o certificado por subcaixa nao formaliza a aritmetica intervalar, mas
torna auditavel a fronteira externa: cobertura de subcaixas, agregacao por box,
direcoes de arredondamento e budgets racionalizados.

Independent rectangle verifier:

```text
operadores/c2_projected_j0_sector_rect_verifier.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_RECT_VERIFICATION.md
audit_outputs/projected_j0_positive_box_sector_rect_verification.json
```

Este verificador nao recomputa as funcoes analiticas. Ele le os retangulos
brutos das subcaixas:

```text
M_box
D0_box
Drest_box
RvecTail_box
```

e recomputa apenas a algebra retangular derivada:

```text
D0NegReMain_upper
main_abs_lower
rest_combined_upper
rest_separate_upper
```

Resultado:

```text
checks failed = 0;
27 boxes;
771 subboxes;
max d0 upper recomputed = -0.0001936804971152741284057518107;
min main lower recomputed = 0.05862923979330284750172890456;
max rest upper recomputed = 0.004688785969652566538084689602;
min sector budget rat = 0.054086045801;
worst box = s0.84_t7.
```

Leitura: essa camada reduz a confianca necessaria no certifier para as
quantidades derivadas dos retangulos. Ainda falta verificar, por uma camada
confiavel ou formalizada, que os retangulos brutos sao enclosures corretas dos
objetos complexos.

Raw enclosure contract and strict sentinels:

```text
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_CONTRACT.md
operadores/c2_projected_j0_raw_enclosure_sentinel_checker.py
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_SENTINEL_CHECK.md
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_STRICT_COMPARISON.md
audit_outputs/projected_j0_raw_enclosure_sentinel_check.json
```

Contrato raw por subcaixa:

```text
M(s)        pertence a M_rectangle
D0(s)       pertence a D0_rectangle
Drest(s)    pertence a Drest_rectangle
RvecTail(s) pertence a RvecTail_rectangle
```

O raw checker recomputa strict os retangulos brutos em subcaixas sentinela e
compara com os retangulos armazenados.

Resultado atual:

```text
boxes checked = 5;
subboxes checked = 10;
objects checked = 40;
contains = 40;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0;
status = pass.
```

Strict comparison:

```text
s0.84_t7 strict/sub8: certified;
s0.86_t0 strict/sub8: certified;
s0.84_t0, s0.84_t1, s0.85_t0 strict/sub16: certified.
```

Leitura: nas sentinelas selecionadas, os retangulos fast/sub32 armazenados
contem as recomputacoes strict localizadas para `M`, `D0`, `Drest` e
`RvecTail`. Isso fortalece a cadeia externa, mas ainda nao substitui uma
certificacao de todas as 771 subcaixas nem formaliza as funcoes analiticas.

Raw enclosure batch check M,D0:

```text
operadores/c2_projected_j0_raw_enclosure_batch_checker.py
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_PARTIAL.md
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_PARALLEL_SMOKE.md
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_M_D0_ALL.md
AUDIT_PROJECTED_J0_RAW_ENCLOSURE_REST_SENTINELS.md
audit_outputs/projected_j0_raw_enclosure_batches/partial_M_D0_50_summary.json
audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_parallel_smoke.json
audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_all.json
audit_outputs/projected_j0_raw_enclosure_rest_sentinels.json
```

Objetivo: expandir a recomputacao strict para os objetos criticos `M,D0`, que
controlam diretamente o setor:

```text
D0NegReMain = -Re(D0 * conj(M)) <= 0.
```

Resultado parcial serial:

```text
subboxes checked = 50;
objects checked = 100;
contains = 100;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0;
max D0NegReMain upper strict = -0.00020839735578166672;
strict nondestructive subboxes = 50/50;
tempo por subcaixa ~= 15.98s.
```

Smoke paralelo:

```text
workers = 4;
subboxes checked = 50;
objects checked = 100;
contains = 100;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0;
max diff contra parcial serial = 0.0;
speedup ~= 2.54x.
```

Rodada completa `M,D0`:

```text
workers finais = 56;
boxes checked = 27;
subboxes checked = 771;
objects checked = 1542;
contains = 1542;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0;
batch done = 31/31;
max D0NegReMain upper strict = -0.00019368050160660985;
strict nondestructive subboxes = 771/771;
strict nondestructive boxes = 27/27;
worst box strict = s0.86_t0;
tempo wall-clock final = 506.37s.
```

Sentinelas ampliadas de resto:

```text
objects = Drest,RvecTail;
boxes checked = 5;
subboxes checked = 160;
objects checked = 320;
contains = 320;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0.
```

Leitura: o batch checker paralelo confirma a cadeia fast/sub32 para os objetos
criticos `M,D0` em todas as 771 subcaixas. A condicao setorial
`D0NegReMain <= 0` fica reforcada por recomputacao strict independente em todo
o positive-box. Os sentinelas de `Drest,RvecTail` tambem passaram nos cinco
boxes auditados, sem substituir `RvecTail` por upper real.

Lean rectangle arithmetic layer:

```text
LeanC2/AuditProjectedJ0RectangleArithmetic.lean
AUDIT_PROJECTED_J0_RECTANGLE_ARITHMETIC_LEAN.md
```

Objetivo: formalizar no Lean a algebra retangular abstrata que o rect verifier
ja isolou, sem tentar provar ainda a geracao analitica dos retangulos brutos.

Estruturas:

```text
RealInterval
ComplexRect
MainLowerFromRect
RestUpperFromRect
ProjectedJ0SubboxRectangleContract
ProjectedJ0SubboxDerivedBounds
```

Operacoes formalizadas:

```text
interval contains;
interval add;
interval neg;
functional multiplication bound;
complex rectangle add;
complex rectangle conj.
```

Ponto principal:

```text
Re(D0 * conj(M)) = D0.re * M.re + D0.im * M.im
```

e o consumidor:

```text
d0NegReMain_upper_of_rects
```

transforma um upper retangular para

```text
-(D0.re * M.re + D0.im * M.im)
```

em upper para

```text
-Re(D0 * conj(M)).
```

Leitura: esta camada formaliza a parte algebrica retangular. Ainda ficam
externos os retangulos brutos, os transcendentes, a geracao das enclosures, os
dados das 771 subcaixas e os bounds automaticos de modulo por retangulo.

Lean rectangle modulus bounds:

```text
LeanC2/AuditProjectedJ0RectangleModBounds.lean
AUDIT_PROJECTED_J0_RECTANGLE_MOD_BOUNDS_LEAN.md
```

Objetivo: formalizar bounds de modulo por certificado retangular abstrato.

Certificados reais:

```text
RealIntervalAbsLowerCert
RealIntervalAbsUpperCert
```

Certificados complexos:

```text
ComplexRectNormLowerCert
ComplexRectNormUpperCert
```

Teoremas principais:

```text
ComplexRectNormLowerCert.valid:
  z pertence ao retangulo -> lower <= ||z||

ComplexRectNormUpperCert.valid:
  z pertence ao retangulo -> ||z|| <= upper
```

Conexao subbox:

```text
ProjectedJ0SubboxModBounds.main_lower
ProjectedJ0SubboxModBounds.rest_upper
```

Leitura: esta camada formaliza o consumidor Lean para:

```text
M rectangle -> main lower
Drest + RvecTail rectangle -> rest combined upper
```

Ela ainda nao prova a geracao dos retangulos, nao insere os dados das 771
subcaixas e nao conecta automaticamente um pack externo ao kernel Lean.

Subbox-to-sector Lean bridge:

```text
LeanC2/AuditProjectedJ0SubboxToSectorBridge.lean
AUDIT_PROJECTED_J0_SUBBOX_TO_SECTOR_BRIDGE_LEAN.md
```

Objetivo: conectar a camada retangular abstrata ao consumidor setorial
racionalizado, ainda sem inserir dados concretos das 771 subcaixas.

Estruturas:

```text
ProjectedJ0SubboxSectorBridgeData
ProjectedJ0BoxSectorAnalyticFromSubboxes
ProjectedJ0SubboxCoverData
```

Teoremas principais:

```text
ProjectedJ0SubboxSectorBridgeData.main_lower
ProjectedJ0SubboxSectorBridgeData.d0_neg_re_upper
ProjectedJ0SubboxSectorBridgeData.rest_upper
ProjectedJ0SubboxCoverData.toExternalAnalyticBoxHypotheses
ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_subbox_cover
```

A cadeia Lean abstrata agora fica:

```text
retangulos por subcaixa
  -> bounds por subcaixa
  -> cobertura da caixa
  -> hipoteses analiticas externas da caixa
  -> certificado setorial racionalizado
  -> totalFinite != 0
```

Leitura: esta ponte formaliza como uma cobertura por subcaixas alimenta a
bridge setorial. Ainda ficam externos os dados das subcaixas, a prova de que
os objetos analiticos pertencem aos retangulos brutos, a cobertura concreta das
771 subcaixas e a geracao das enclosures.

Sector atlas from subboxes:

```text
LeanC2/AuditProjectedJ0SectorAtlasFromSubboxes.lean
AUDIT_PROJECTED_J0_SECTOR_ATLAS_FROM_SUBBOXES_LEAN.md
```

Objetivo: adicionar uma camada global por boxes acima de
`ProjectedJ0SubboxCoverData`.

Estrutura:

```text
ProjectedJ0SectorAtlasFromSubboxes
```

Ela registra:

```text
cover_boxes:
  cobertura da regiao global por boxes;

cert:
  certificado setorial racionalizado por box;

subbox_cover:
  cobertura por subcaixas dentro de cada box.
```

Teoremas:

```text
total_ne_zero_on_box_of_subbox_cover
ProjectedJ0SectorAtlasFromSubboxes.total_ne_zero
```

A cadeia formal fica:

```text
subbox rectangle data
  -> subbox bounds
  -> subbox cover per box
  -> rationalized sector certificate per box
  -> box nonzero
  -> box cover of global region
  -> global nonzero
```

Leitura: esta camada ainda nao insere os 27 boxes nem as 771 subcaixas. Ela
formaliza apenas o combinador global: se os boxes cobrem a regiao global e cada
box tem seu certificado setorial racionalizado alimentado por uma cobertura de
subcaixas, entao `totalFinite` nao zera na regiao global.

Positive-box Lean skeleton:

```text
LeanC2/AuditProjectedJ0PositiveBoxSkeleton.lean
AUDIT_PROJECTED_J0_POSITIVE_BOX_SKELETON_LEAN.md
```

Objetivo: criar o primeiro skeleton concreto do bloco positive-box setorial,
sem inserir ainda as 771 subcaixas nem as enclosures analiticas.

Componentes:

```text
PositiveBoxId:
  27 boxes, s084_t0..s086_t8;

positiveBoxes:
  Finset.univ;

RectRegion:
  sigmaMin, sigmaMax, tMin, tMax em Q;

positiveBoxRegion:
  regiao retangular de cada box;

positiveBoxCombinedCert:
  mapa box -> certificado setorial racionalizado combined.
```

A regiao global foi definida como uniao das 27 caixas certificadas:

```text
positiveGlobalRegion =
  union dos positiveBoxRegion b para b em positiveBoxes.
```

Leitura importante: esta nao e uma faixa continua em sigma. O pack externo
certifica tres linhas sigma:

```text
0.84, 0.85, 0.86.
```

Theorem condicional:

```text
positiveBox_totalFinite_ne_zero_of_subbox_covers
```

Ele consome:

```text
PositiveBoxSubboxCovers
```

e entrega:

```text
totalFinite != 0 na uniao positive-box certificada.
```

A cadeia local fica:

```text
27 box ids
  -> regioes dos boxes
  -> certificados combined por box
  -> subbox covers externos
  -> atlas from subboxes
  -> totalFinite != 0 na uniao certificada
```

Ainda ficam externos os dados das 771 subcaixas, os retangulos brutos, o
pertencimento dos objetos aos retangulos, a geracao das enclosures, a cobertura
de uma regiao continua em sigma e a conexao com o middle global.

Positive-box sentinel s0.84_t7 Lean skeleton:

```text
LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7.lean
AUDIT_PROJECTED_J0_POSITIVE_BOX_SENTINEL_S084T7_LEAN.md
```

Objetivo: criar a primeira caixa sentinela concreta acima do skeleton
positive-box, ainda de forma condicional.

Dados estruturais:

```text
S084T7SubboxId:
  32 subcaixas, sb0..sb31;

s084T7Subboxes:
  Finset.univ;

s084T7SubboxRect:
  intervalos racionais copiados do subbox certificate externo;

s084T7SubboxRegion:
  regiao de cada subcaixa;

s084T7CombinedCert:
  positiveBoxCombinedCert PositiveBoxId.s084_t7.
```

O certificado externo registra:

```text
source_box_id = s0.84_t7;
sigma_min = sigma_max = 0.84;
t_min = 32.855;
t_max = 32.859;
subboxes = 32.
```

A cobertura concreta das 32 subcaixas foi deixada como hipotese:

```text
S084T7SubboxCoverHypothesis
```

Bounds externos por subcaixa:

```text
S084T7SubboxBounds
```

Theorem condicional:

```text
s084T7_totalFinite_ne_zero_of_subbox_bounds
```

Leitura:

```text
bounds externos por subbox
  + cobertura externa das 32 subcaixas
  + certificado combined de s0.84_t7
  ------------------------------------------------
  totalFinite != 0 em positiveBoxRegion s084_t7.
```

Esta caixa serve como modelo para gerar as outras 26. Ainda ficam externos os
retangulos brutos, as provas de bounds analiticos por subbox, a cobertura
concreta por intervalos e a formalizacao das enclosures.

Positive-box all-subbox Lean skeleton:

```text
operadores/c2_generate_positive_box_subbox_skeleton.py
LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
AUDIT_PROJECTED_J0_POSITIVE_BOX_ALL_SUBBOX_SKELETON_LEAN.md
```

Objetivo: gerar automaticamente o skeleton Lean das subcaixas para todos os
27 boxes do bloco positive-box setorial.

Dados estruturais:

```text
PositiveBoxSubboxId:
  tipo global com 771 construtores;

positiveBoxSubboxesOf:
  mapa box -> Finset de subboxes daquele box;

positiveBoxSubboxRect:
  regioes racionais copiadas do subbox certificate externo;

positiveBoxSubboxRegion:
  regiao de cada subbox.
```

A cobertura por box continua como hipotese externa:

```text
PositiveBoxAllSubboxCoverHypotheses
```

Os bounds por subbox continuam como hipotese externa:

```text
PositiveBoxAllSubboxBounds
```

Theorem global condicional:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_bounds
```

Leitura:

```text
covers externos dos 771 subboxes
  + bounds externos por subbox
  + certificados setoriais combined dos 27 boxes
  ------------------------------------------------
  totalFinite != 0 na positiveGlobalRegion.
```

Importante: `positiveGlobalRegion` segue sendo a uniao das 27 caixas
certificadas. Esta camada nao afirma cobertura continua em sigma, nao insere
retangulos brutos e nao prova enclosures analiticas. Ela apenas torna concreta
a malha de subboxes que alimenta a ponte condicional ja existente.

Positive-box subbox coverage:

```text
operadores/c2_verify_positive_box_subbox_coverage.py
operadores/c2_generate_positive_box_subbox_coverage_lean.py
LeanC2/AuditProjectedJ0PositiveBoxSubboxCoverage.lean
AUDIT_PROJECTED_J0_POSITIVE_BOX_SUBBOX_COVERAGE_VERIFICATION.md
AUDIT_PROJECTED_J0_POSITIVE_BOX_SUBBOX_COVERAGE_LEAN.md
```

Objetivo: remover a hipotese externa de cobertura por subboxes no bloco
positive-box setorial.

Verificacao externa:

```text
27 boxes;
771 subboxes;
checks_failed = 0;
gaps = 0;
overlaps internos = 0;
sigma divergente = 0;
s0.84_t7 tem 32 subboxes.
```

Prova Lean gerada:

```text
positiveBox_subbox_cover_s084_t0
...
positiveBox_subbox_cover_s086_t8
positiveBox_all_subbox_cover
```

Theorem global sem hipotese de cobertura:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp
```

Leitura:

```text
bounds externos por subbox
  + cobertura dos 771 subboxes provada em Lean
  + certificados setoriais combined dos 27 boxes
  ------------------------------------------------
  totalFinite != 0 na positiveGlobalRegion.
```

Esta camada reduz uma hipotese do skeleton global. Ainda ficam externos os
bounds por subbox, os retangulos brutos, o pertencimento dos objetos aos
retangulos e a geracao das enclosures.

Positive-box all-subbox bounds from rectangles:

```text
LeanC2/AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles.lean
AUDIT_PROJECTED_J0_POSITIVE_BOX_ALL_SUBBOX_BOUNDS_FROM_RECTANGLES_LEAN.md
```

Objetivo: adaptar contratos retangulares por subbox ao unico pacote de bounds
consumido pelo theorem global positive-box, sem inserir dados numericos nem
provar a geracao analitica das enclosures.

Estrutura:

```text
PositiveBoxAllSubboxRectangleBounds
```

Ela exige um `ProjectedJ0SubboxSectorBridgeData` para cada box, subbox e ponto
da regiao da subbox. Esse bridge ja agrega:

```text
ProjectedJ0SubboxRectangleContract;
ProjectedJ0SubboxDerivedBounds;
ProjectedJ0SubboxModBounds;
comparacoes com mainLower, d0NegReUpper e restUpper da box.
```

Conversao:

```text
PositiveBoxAllSubboxRectangleBounds.toPositiveBoxAllSubboxBounds
```

Theorem final da camada:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_rectangle_bounds
```

A cadeia Lean agora fica:

```text
contratos retangulares por subbox
  -> PositiveBoxAllSubboxRectangleBounds
  -> PositiveBoxAllSubboxBounds
  -> cobertura provada por positiveBox_all_subbox_cover
  -> totalFinite != 0 em positiveGlobalRegion.
```

Logo, a cobertura nao e mais um insumo externo e os bounds por subbox passam a
ter um contrato retangular tipado. A conclusao da ilha positive-box fica
condicional apenas ao fornecimento desses contratos por subbox.

Nesse estagio ainda ficavam externos os dados retangulares concretos, o
pertencimento analitico de `M`, `D0`, `Drest` e `RvecTail`, os bounds
retangulares derivados, a geracao das enclosures, os transcendentes do produtor
e a materializacao dos 771 certificados concretos. A secao seguinte paga a
parte de dados e aritmetica, mas mantem o pertencimento analitico aberto.

Positive-box all-subbox rectangle data and explicit analytic membership:

```text
LeanC2/AuditProjectedJ0PositiveBoxRectangleCertificateSchema.lean
LeanC2/AuditProjectedJ0PositiveBoxRectangleExternalConfig.lean
LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7RectangleData.lean
LeanC2/Generated/ProjectedJ0PositiveBoxRectangleData/S084T0.lean
...
LeanC2/Generated/ProjectedJ0PositiveBoxRectangleData/S086T8.lean
LeanC2/AuditProjectedJ0PositiveBoxAllSubboxRectangleData.lean
operadores/c2_generate_positive_box_all_subbox_rectangle_data_lean.py
operadores/c2_verify_positive_box_all_subbox_rectangle_data.py
AUDIT_PROJECTED_J0_POSITIVE_BOX_ALL_SUBBOX_RECTANGLE_DATA_LEAN.md
```

Objetivo: materializar os quatro retangulos racionais de cada subbox sem
promover endpoints externos a prova de pertencimento analitico.

O schema racional guarda separadamente:

```text
MRect;
D0Rect;
DrestRect;
RvecTailRect;
validade e sinais dos endpoints;
certificado quadratico para o lower de ||M||;
upper de -Re(D0 * conj(M)) derivado dos endpoints;
certificado quadratico para o upper combined de ||Drest + RvecTail||.
```

Os tres bounds finais nao sao campos armazenados no certificado. Eles sao
derivados pela aritmetica retangular ja formalizada e pelas quatro hipoteses
primitivas de pertencimento:

```text
M(s) em MRect;
D0(s) em D0Rect;
Drest(s) em DrestRect;
RvecTail(s) em RvecTailRect.
```

A sentinela `s0.84_t7` foi materializada primeiro:

```text
sigma = 0.84;
t = [32.855, 32.859];
32 subboxes;
4 retangulos por subbox;
pertencimento somente como hipotese explicita.
```

Depois da sentinela, o gerador deterministico produziu 27 shards com:

```text
27 boxes;
771 subboxes;
zero ids ausentes, extras ou duplicados;
zero regioes divergentes;
zero endpoints invalidos;
zero falhas de sinal;
zero comparacoes racionais falhas;
resto combined em todos os casos.
```

Fontes principais:

```text
subboxes.jsonl:
  ef8298cb0c2b09354f90d3c272fe37fb58ab63dcc84d4566a3d455087c9923fe;

config.json:
  13ce28c0b4696297e9c25d0fde090e870fb531cabd014856d1a6f52a22b24f3d;

boxes_sector_rationalized.csv:
  7712949d582825faa70f6f6d362d697e15e6fa5f7f64a01a66570ccc5a0b8413;

all-subbox skeleton:
  f6cfce6ac124ef7f0161de797faa441ec1fbb99a1a20d0f1ccdb57c22afe40b3.
```

Configuracao externa registrada de forma tipada:

```text
target K/M = 16/12001;
reference K/M = 17/16001;
odd core/reference M = 12001/16001;
referencias supergaussian X = 10661, p = 2;
fast, dps = 80, inflate = 1e-13;
subdiv sigma/t = 1/32.
```

Essa configuracao descreve um surrogate finito. Ela fixa no Lean somente a
compatibilidade numerica de `coreCutoff`, `K` e `Midx`; nao identifica o seed
finito do produtor com um `tiltSeed` arbitrario.

A auditoria semantica abriu transitivamente os corpos de `M`, `D0`, `Drest`,
`RvecTail`, `totalFinite`, `D0NegReMain` e `restCostFinite`. Os aliases usam o
canal impar direto por `tsum` e a serie central genuine direta por `tsum`
duplo, sem dependencia definicional dos aliases terminais proibidos. Esta
conclusao e relativa ao parametro `tiltSeed`: a origem de uma funcao arbitraria
fornecida nesse parametro nao e certificada pela definicao.

Ha um mismatch que deve permanecer visivel:

```text
pack externo = surrogate finito supergaussiano;
aliases Lean = canais e series diretos por tsum;
igualdade entre os dois = nao provada;
pertencimento aos retangulos = hipotese explicita.
```

O cross-check strict externo agora tambem cobre `Drest,RvecTail` nas 771
subboxes:

```text
27 boxes;
1542 objetos;
contains = 1542;
strict_wider = 0;
inconclusive = 0;
disjoint_fail = 0.
```

Com a rodada full anterior de `M,D0`, os quatro retangulos possuem cross-check
strict externo completo. Isso aumenta a auditabilidade do pack, mas continua
fora do kernel.

A cadeia desta camada e:

```text
dados retangulares racionais
  + pertencimentos analiticos primitivos explicitos
  -> ProjectedJ0SubboxSectorBridgeData
  -> PositiveBoxAllSubboxRectangleBounds
  -> PositiveBoxAllSubboxBounds
  -> cobertura provada por positiveBox_all_subbox_cover
  -> totalFinite != 0 em positiveGlobalRegion.
```

API concreta:

```text
PositiveBoxAllSubboxRectangleCertificateData;
positiveBoxAllSubboxRectangleCertificateData;
PositiveBoxAllSubboxAnalyticEnclosureHypotheses data tiltSeed;
positiveBoxAllSubboxRectangleBounds_of_data_and_membership;
positiveBoxAllSubboxBounds_of_rectangle_data_and_membership;
positiveBox_totalFinite_ne_zero_of_rectangle_data_and_membership;
positiveBox_totalFinite_ne_zero_of_rectangle_data_and_compatible_parameters.
```

O ultimo theorem exige compatibilidade numerica explicita de `coreCutoff`, `K`
e `Midx` e apenas reescreve esses tres parametros. Ele nao prova correspondencia
entre o surrogate e os aliases Lean nem afirma compatibilidade do `tiltSeed`.

Sentinela, adapter e modulo agregado compilam por `lake env lean`; os targets
da sentinela e do agregado tambem passam por `lake build`. O rerun do gerador
retornou 27 shards unchanged, com digest identico antes/depois. O `#print
axioms` da cobertura, das pontes e dos consumidores finais retorna apenas:

```text
[propext, Classical.choice, Quot.sound]
```

Nao ha `sorryAx` nem axioma local na nova cadeia.

Lean checa os dados e a aritmética racional dos retângulos e reduz a positive-box a hipóteses explícitas de pertencimento analítico.

Leitura importante: a ilha continua condicional. `positiveGlobalRegion` e a
uniao de 27 boxes em apenas tres linhas degeneradas, `sigma = 0.84, 0.85,
0.86`. Esta camada nao prova faixa continua em sigma, middle inteiro,
nonvanishing do genuine infinito ou a ponte quantitativa do modelo finito para
o operador genuine.

Valley47 targeted subdivision e sample-lipschitz:

```text
AUDIT_PROJECTED_J0_VALLEY47_TARGETED_SUBDIVISION.md
AUDIT_PROJECTED_J0_SAMPLE_LIPSCHITZ_DESIGN.md
AUDIT_PROJECTED_J0_VALLEY47_SAMPLE_LIPSCHITZ_SCOUT.md
```

Subdivisao direcionada recuperou:

```text
subdiv-t=256: 5/5;
subdiv-t=512: 3/3.
```

Scout `sample-lipschitz` nas 7 caixas restantes:

```text
2/7 seriam recuperadas com lower amostral corrigido;
5/7 ainda precisam subdivisao adicional ou bound estrutural para |M|.
```

Schema Lean opcional criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0IntervalCertificateSchema.lean
```

Ele registra apenas o formato externo de constantes e budget positivo. Nao
verifica aritmetica intervalar e nao injeta numeros como prova Lean.

---

## 5. Status formal por camada

| Camada | Arquivo | Status |
|---|---|---|
| Obstrução raw `tsum` | `LeanC2/Analytic/GenuineRawTsumObstruction.lean` | collapse no middle pago em Lean |
| Continuação pareada C2 | `LeanC2/Analytic/GenuinePairedContinuation.lean` | Summable em `0 < re`; compatibilidade e closure pagas |
| Surrogate SG literal | `LeanC2/Analytic/ProjectedJ0SuperGaussianSurrogate.lean` | separado dos aliases raw |
| Transferência por delta | `LeanC2/Route/SurrogateTransfer.lean` | lemma abstrato e lower SG pagos |
| Delta sentinela | `AUDIT_PROJECTED_J0_SG_TO_PAIRED_SENTINEL.md` | diagnóstico em cinco pontos; enclosure aberta |
| Tilt orientado melhora core | `AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md` | diagnóstico numérico |
| Adjusted quartet tilt breakdown | `AUDIT_ADJUSTED_QUARTET_TILT_BREAKDOWN.md` | diagnóstico numérico |
| Horizontal defect por camada | `AUDIT_ADJUSTED_QUARTET_HORIZONTAL_DEFECT_BREAKDOWN.md` | diagnóstico numérico |
| Projected j0 atlas scout | `AUDIT_PROJECTED_J0_ATLAS_SCOUT.md` | diagnóstico numérico |
| Projected j0 interval certifier | `AUDIT_PROJECTED_J0_INTERVAL_BOX_CERTIFIER.md` | certificado externo auditável |
| Ponte vetorial projetiva | `LeanC2/AuditAdjustedQuartetHorizontalProjection.lean` | pago em Lean |
| Shim abstrato j0 | `LeanC2/AuditAdjustedQuartetProjectedJ0Shim.lean` | pago em Lean |
| RealMap leve | `LeanC2/AuditAdjustedQuartetProjectedJ0RealMap.lean` | pago em Lean |
| Aliases reais | `LeanC2/AuditAdjustedQuartetProjectedJ0Aliases.lean` | pago em Lean |
| Exact ledger | `LeanC2/AuditAdjustedQuartetProjectedJ0ExactLedger.lean` | pago em Lean |
| Bounded ledger | `LeanC2/AuditAdjustedQuartetProjectedJ0BoundedLedger.lean` | pago em Lean |
| ParallelUpper interface | `LeanC2/AuditAdjustedQuartetProjectedJ0ParallelUpper.lean` | pago em Lean |
| D0 neg-real/numerador projetivo | `LeanC2/AuditAdjustedQuartetProjectedJ0D0NumeratorUpper.lean` | pago em Lean |
| Ratio upper numerator/main lower | `LeanC2/AuditAdjustedQuartetProjectedJ0RatioUpper.lean` | pago em Lean |
| Constant atlas scaffold | `LeanC2/AuditAdjustedQuartetProjectedJ0ConstantAtlas.lean` | pago em Lean |
| Interval certificate schema | `LeanC2/AuditAdjustedQuartetProjectedJ0IntervalCertificateSchema.lean` | schema Lean |
| Rationalized certificate schema | `LeanC2/AuditAdjustedQuartetProjectedJ0RationalizedCertificateSchema.lean` | schema Lean |
| Positive-box rationalized algebra data | `LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData.lean` | algebra racional em Lean |
| Positive-box rationalized bridge | `LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedBridge.lean` | ponte condicional em Lean |
| Cobertura all-subbox | `LeanC2/AuditProjectedJ0PositiveBoxSubboxCoverage.lean` | 27/771, provada em Lean |
| Adapter retangular all-subbox | `LeanC2/AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles.lean` | pago em Lean |
| Schema racional de retangulos | `LeanC2/AuditProjectedJ0PositiveBoxRectangleCertificateSchema.lean` | pago em Lean |
| Sentinela retangular `s0.84_t7` | `LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7RectangleData.lean` | 32 subboxes; analise condicional |
| Dados retangulares all-subbox | `LeanC2/AuditProjectedJ0PositiveBoxAllSubboxRectangleData.lean` | 27/771; aritmetica racional em Lean |
| `parallelUpper = 0` setorial | dados e algebra pagos | reutilizar apenas para SG correto |
| `restUpper` combined | dados e algebra pagos | reutilizar apenas para SG correto |
| positividade regional positive-box | racionalmente paga | raw superseded; SG e delta ainda condicionais |
| conexão final com middle público | ainda condicional | aberto |

---

## 6. A contabilidade projected-J0 preservada para o surrogate SG

O ledger histórico foi definido para os aliases abaixo. Eles permanecem no
repositório, mas não devem receber os memberships SG no middle:

```text
M(s)      = adjustedProjectedJ0_M tiltSeed s
D0(s)     = adjustedProjectedJ0_D0 coreCutoff s
Drest(s)  = adjustedProjectedJ0_Drest coreCutoff s
Rvec(s)   = adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
total(s)  = adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s
```

Para a aplicação ativa ao surrogate, a especialização correta é:

```text
M(s)      = projectedJ0SG_M s
D0(s)     = projectedJ0SG_D0 s
Drest(s)  = projectedJ0SG_Drest s
Rvec(s)   = projectedJ0SG_RvecTail s
total(s)  = projectedJ0SG_totalFinite s.
```

Identidade:

```text
total(s) = M(s) + D0(s) + Drest(s) + Rvec(s)
```

Custo projetivo dominante:

```text
parallelCost(s) = destructiveParallel(M(s), D0(s))
```

Resto combinado:

```text
restCost(s) = ‖Drest(s) + Rvec(s)‖
```

Resto separado:

```text
separateRestCost(s) = ‖Drest(s)‖ + ‖Rvec(s)‖
```

Main exato:

```text
mainExactLower(s) = ‖M(s)‖
```

Obrigações bounded:

```text
parallelCost(s) ≤ parallelUpper(s)
restCost(s) ≤ restUpper(s)
0 < mainExactLower(s) - parallelUpper(s) - restUpper(s)
```

Conclusão pointwise:

```text
total(s) ≠ 0
```

Conclusão por região:

```text
∀ s ∈ Region, total(s) ≠ 0
```

Essa é a contabilidade vetorial reutilizável da rota projected-J0. Ela não
seleciona por si só o alvo analítico do middle.

---

## 7. Plano subsequente recomendado — ordem corrigida

O plano abaixo substitui a ordem histórica baseada em alimentar diretamente
os aliases raw do adjusted quartet.

### Etapa 1 — registrar e respeitar a obstrução raw

Estado: concluída no kernel.

```text
s.re <= 1
  -> famílias odd e central raw não são Summable
  -> oddDirichletChannel = 0
  -> genuineCentralDoubleSeries = 0.
```

Consumir `AUDIT_GENUINE_RAW_TSUM_MIDDLE_OBSTRUCTION.md` antes de trabalhar
nessa frente. Não tentar provar nonvanishing desses dois valores totalizados no
middle e não instanciar memberships do pack contra eles.

### Etapa 2 — usar a continuação pareada genuine

Objeto ativo:

```text
c2PairedOddEvenTerm
  -> c2PairedOddEvenChannel
  -> c2ContinuedOddChannel
  -> genuineCentralContinuationC2.
```

A somabilidade pareada para `0 < s.re`, os denominadores e as compatibilidades
em `1 < s.re` já compilam. As somabilidades auxiliares foram refeitas por
p-série direta, e a auditoria transitiva dos endpoints de compatibilidade não
encontrou os helpers históricos nem aliases terminais proibidos. A dependency
closure estrita desta etapa está paga.

### Etapa 3 — manter o surrogate SG como objeto separado

Objeto ativo do produtor:

```text
projectedJ0SG_tiltSeed;
projectedJ0SG_M;
projectedJ0SG_D0;
projectedJ0SG_Drest;
projectedJ0SG_RvecTail;
projectedJ0SG_totalFinite.
```

O surrogate fixa literalmente `K/M = 16/12001`, referência `17/16001`,
`X = 10661` e `p = 2`. A igualdade interna

```text
projectedJ0SG_totalFinite = projectedJ0SG_reference
```

não o identifica com a continuação pareada nem com os aliases raw.

### Etapa 4 — certificar o delta na sentinela

Primeiro alvo quantitativo:

```text
sup_{s em s0.84_t7}
  ‖genuineCentralContinuationC2 s - projectedJ0SG_totalFinite s‖
    < 0.054086045801.
```

O número à direita é a margem setorial racionalizada existente. O artefato
`AUDIT_PROJECTED_J0_SG_TO_PAIRED_SENTINEL.md`, com `N = 20000`, encontrou nos
cinco pontos um máximo tail-adjusted de `5.138170207791e-4`, ou cerca de
`0.00949999` da margem. O diagnóstico é favorável, mas ainda não é enclosure
da caixa. Produzir:

```text
soma pareada finita por intervalos;
cauda analítica provada;
arredondamento outward;
comparação racional com o lower SG.
```

Então aplicar somente o lemma abstrato:

```text
mu <= ‖Tsg‖
  + ‖Tcont - Tsg‖ < mu
  -> Tcont != 0.
```

Se o delta não fechar com bound confiável, manter o pack como diagnóstico SG e
regenerar o certifier diretamente para a continuação pareada. Não escolher um
epsilon por decreto.

### Etapa 5 — somente então enclosures e expansão regional

Depois de a sentinela decidir a rota:

```text
se transferência passar:
  provar memberships dos quatro retângulos para os aliases SG próprios
  + provar delta SG-to-continuation;

se transferência falhar:
  produzir retângulos diretamente para o canal pareado/continuado.
```

Somente depois expandir para as 771 subboxes, boxes com largura em sigma e
demais regiões do middle. Esta etapa não autoriza conexão ao `PeerReview`,
faixa contínua, nonvanishing global ou RH.

### Histórico supersedido — escolher qual total raw atacar primeiro

> Bloco histórico preservado para rastreabilidade. Todas as recomendações até
> a Seção 8 estão superseded pela ordem corrigida acima; não executá-las contra
> os aliases raw no middle.

Há duas escolhas:

#### 1. AdjustedQuartet

```text
totalQuartet = M + D0 + Drest
Rvec = 0
```

Vantagem: mais limpo, sem tail complexo.  
Desvantagem: ainda precisa ponte posterior para finite/infinite model.

#### 2. FiniteModel

```text
totalFinite = M + D0 + Drest + RvecTail
```

Vantagem: mais próximo do operador finito formal e dos tails.  
Desvantagem: `restUpper` precisa pagar `RvecTail` também.

Recomendação histórica (não executar):

```text
Trabalhar com FiniteModel como rota principal,
mas manter Quartet como laboratório interno.
```

Motivo: a rota formal já tem `RvecTail` separado corretamente; se o `restUpper` estourar, podemos voltar para Quartet para diagnosticar se o problema é realmente tail ou só bound grosseiro.

---

### Histórico supersedido — atacar `parallelUpper` raw

Esse é o próximo boleto mais importante.

Alvo:

```text
destructiveParallel(M, D0) ≤ parallelUpper
```

Por que começar aqui:

```text
D0 é a camada dominante em todos os diagnósticos.
A vantagem nova da rota vem exatamente de trocar |D0| por destructiveParallel(M,D0).
Se voltarmos para |D0|, perdemos o ganho geométrico.
```

Formas possíveis de construir `parallelUpper`:

#### 2.1. Atlas de fase por caixas

Certificar em uma caixa:

```text
Re(D0 * conj M) / ‖M‖ ≥ -parallelUpper
```

Equivalente:

```text
destructiveParallel(M,D0) ≤ parallelUpper
```

Precisa de:

```text
lower para ‖M‖
intervalo para Re(D0 * conj M)
controle de divisão por ‖M‖
```

#### 2.2. Bound radial direto

Usar:

```text
radialLoss(M,D0) = ‖M‖ - ‖M + D0‖
```

Mais forte numericamente, mas talvez mais pesado de certificar. Pode ser útil em subcaixas onde a projeção ainda perde margem.

#### 2.3. Half-disk/quartet/branch-tilt

Conectar a posição de `D0` à geometria branch/tilt e ao canal half-disk.

Essa é a rota conceitualmente mais fiel, mas provavelmente precisa mais preparação.

Recomendação prática:

```text
Começar por atlas de fase/projeção para D0.
Usar half-disk/branch-tilt como explicação e fonte de bounds mais estruturais depois.
```

---

### Histórico supersedido — atacar `restUpper` raw

Há duas moedas:

#### 3.1. Resto combinado

```text
restUpper ≥ ‖Drest + RvecTail‖
```

Vantagem: preserva cancelamento entre `Drest` e tail.  
Desvantagem: mais difícil de certificar.

#### 3.2. Resto separado

```text
restUpper ≥ ‖Drest‖ + ‖RvecTail‖
```

Vantagem: mais fácil de alimentar por bounds independentes.  
Desvantagem: mais grosso.

Recomendação:

```text
Primeiro criar bounds separados para Drest e RvecTail.
Depois testar se o orçamento fecha.
Se não fechar, abrir combined rest.
```

Drest deve ser menor que D0 por potências de `q`:

```text
Drest = D1 + D2 + D3
D_j = 2 * q^(j+2) * horizontal_delta
```

Como `j0` domina em todos os diagnósticos, há boa chance de `Drest` ser pagável por norma com folga.

`RvecTail` pode ser aberto por:

```text
vertical tail
horizontal tail
tilt tail
cutoff complex
```

Cuidado:

```text
RvecTail é vetor complexo.
vertical_tail_upper, horizontal_tail_upper, tilt_tail_upper, cutoff_budget são bounds reais.
Não confundir o vetor com os boletos.
```

---

### Histórico supersedido — positividade regional dos aliases raw

Depois de construir `parallelUpper` e `restUpper`, a obrigação por região é:

```lean
AdjustedProjectedJ0FiniteBoundedSurplusPositiveOnRegion
  Region tiltSeed coreCutoff K M parallelUpper restUpper
```

Forma matemática:

```text
∀ s ∈ Region,
  parallelCost(s) ≤ parallelUpper(s)
  restCost(s) ≤ restUpper(s)
  0 < mainExactLower(s) - parallelUpper(s) - restUpper(s)
```

Se isso fechar, já existe consumidor:

```lean
adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSurplus
```

---

### Histórico supersedido — conectar o raw à rota middle pública

Este guia não fecha essa etapa ainda.

A conexão esperada é substituir ou complementar a obrigação antiga:

```text
AdjustedQuartetAudit.PointwiseBounds.dominance
```

que hoje mede:

```text
AdjustedMain - AdjustedDefect - AdjustedTailScaledUpper > 0
```

por uma obrigação projetiva:

```text
mainExactLower - parallelUpper - restUpper > 0
```

com `AdjustedDefect = |E0|+|E1|+|E2|+|E3|` substituído por:

```text
destructiveParallel(M,D0) + restUpper
```

Cadeia futura desejada:

```text
boundedProjectedSurplusOnRegion
  -> totalFinite ≠ 0 on Region
  -> projected replacement for adjusted quartet dominance
  -> ClosureInputs / middle nonvanishing bridge
  -> [SUPERSEDED: impossível para o tsum raw] genuineCentralDoubleSeries s ≠ 0 no middle
```

A parte final ainda precisa ser desenhada com cuidado para não importar rotas terminais nem zeta como input.

---

## 8. Checklist quando aparecer estouro de orçamento

Use este checklist antes de concluir que a rota falhou.

### 8.1. O estouro veio de `horizontal_defect_total_abs`?

Se sim, provavelmente é conta antiga/grosseira.

Rota correta:

```text
D0 por destructiveParallel
Drest por norma
```

Não interpretar estouro de `sum_j |Dj|` como falha da rota projected j0.

---

### 8.2. O estouro veio de `parallelUpper`?

Verificar:

```text
A projeção está usando M seeded ou main base?
O seed está ferindo fase na janela?
A região precisa ser subdividida?
O bound de Re(D0 * conj M) está intervalarmente grosso?
O lower de ‖M‖ está muito fraco?
```

Se `seed_hurts_phase`, talvez seja necessário:

```text
ajustar seed
separar subjanela
usar main base em uma parte e main seeded em outra
```

---

### 8.3. O estouro veio de `restUpper` separado?

Verificar:

```text
Drest e RvecTail estão sendo pagos separados?
Há cancelamento entre Drest e RvecTail que o bound separado perdeu?
RvecTail foi confundido com soma real de uppers?
Drest foi pago como |D1|+|D2|+|D3| sem usar decay de q?
```

Se separado estourar, tentar combinado:

```text
‖Drest + RvecTail‖
```

---

### 8.4. O estouro veio de cutoff?

Nos diagnósticos recentes, cutoff não foi vilão.

Se aparecer cutoff grande, verificar antes:

```text
alvo e referência estão alinhados?
raw target está sendo comparado com superGaussian reference?
cutoff complexo foi confundido com cutoff upper de outra rota?
```

Não investir em cutoff como frente principal sem evidência nova.

---

### 8.5. O estouro veio de `mainExactLower`?

Lembrar:

```text
mainExactLower = ‖M‖
```

Se main é pequeno, o problema pode ser:

```text
fase do quartet prefix
seed mal orientado
região perto de vale real
necessidade de near-axis / subcobertura
```

Não resolver isso com norma bruta do horizontal.

---

### 8.6. A prova usou algum nome proibido?

Se aparecer:

```text
zeta
riemannZeta
ExactZeta
zetaUpper
zetaDepthCore
fórmula explícita
equação funcional
```

como insumo analítico, parar e remover.

Se aparecer apenas no guardrail/higiene, registrar.

---

### 8.7. A rota voltou para algo morto?

Não voltar para:

```text
C2CanonicalClosedScaledLocalData como alvo direto
constantCoreTriangleResidualUpper
raw triangle vertical sem saving
odd-anchor norm-only
odd-metric cleared slack com uppers naturais
PositiveBoxActiveExactDefectPhaseCutoffFrontier
bracket-decay como telescopia direta
q-ratio sozinho
continued-channel como prova middle sem compatibilidade genuine-first
```

---

## 9. Próximos prompts recomendados para agentes — ordem corrigida

Os prompts antigos para criar `parallelUpper`, `restUpper`, atlas e obrigação
regional contra os aliases raw estão **superseded**. Eles não devem ser
executados no middle.

### Prompt A — enclosure do delta na sentinela

```text
Objetivo: certificar em toda a box s0.84_t7 um upper para
  ‖genuineCentralContinuationC2 s - projectedJ0SG_totalFinite s‖.

Usar somente:
  canal pareado C2-native;
  soma finita intervalar;
  cauda derivada da estimativa de diferença já provada;
  arredondamento outward.

Comparar com mu = 0.054086045801.
Não usar valores pontuais como theorem.
Não expandir para as 771 subboxes.
Não usar zeta nem aliases raw como target.
```

### Prompt B — ligar os retângulos aos aliases SG corretos

```text
Objetivo: somente se o Prompt A fechar, formular memberships para
  projectedJ0SG_M;
  projectedJ0SG_D0;
  projectedJ0SG_Drest;
  projectedJ0SG_RvecTail.

Reutilizar os dados racionais existentes sem regenerar shards.
Provar que a fórmula Lean SG coincide com a fórmula literal do produtor.
Manter os quatro memberships como obrigações analíticas até serem pagos.
Nunca rebatizar SG como raw ou como continuação.
```

### Prompt C — transferência sentinela ou recertificação direta

```text
Se houver:
  mu <= ‖projectedJ0SG_totalFinite s‖
  ‖genuineCentralContinuationC2 s - projectedJ0SG_totalFinite s‖ < mu,
usar ne_zero_of_surrogate_norm_lower_and_error.

Se o delta não fechar com bound confiável:
  preservar o pack como diagnóstico SG;
  recertificar diretamente genuineCentralContinuationC2.

Não declarar nonvanishing regional, middle fechado, conexão PeerReview ou RH.
```

---

## 10. Glossário rápido

```text
M
  main seeded complex do adjusted quartet.

D0
  camada horizontal dominante j0.

Drest
  camadas horizontais j1+j2+j3.

RvecTail
  tail complexo do finite model após remover adjusted quartet.

parallelCost
  destructiveParallel(M,D0).

restCost
  ‖Drest + RvecTail‖.

separateRestCost
  ‖Drest‖ + ‖RvecTail‖.

mainExactLower
  c2ConcreteAntiMiracleAdjustedMain = ‖M‖.

projectedSurplus
  ‖M‖ - parallelCost - restCost.

boundedProjectedSurplusLower
  mainExactLower - parallelUpper - restUpper.

parallelUpper
  upper real para destructiveParallel(M,D0).

restUpper
  upper real para resto combinado ou separado.
```

---

## 11. Horizonte final desta frente

A geometria projected-J0 continua valiosa, mas agora tem papel semanticamente
delimitado. Para o surrogate SG ela troca a desigualdade grosseira:

```text
AdjustedMain - (|E0| + |E1| + |E2| + |E3|) - TailUpper > 0
```

por uma desigualdade orientada:

```text
‖M‖ - destructiveParallel(M,D0) - restUpper > 0
```

ou bounded:

```text
mainExactLower - parallelUpper - restUpper > 0
```

Essa contabilidade fornece um lower explícito de
`‖projectedJ0SG_totalFinite‖`; ela não identifica o surrogate com a série raw
ou com a continuação.

A cadeia analítica corrigida é:

```text
raw tsum obstruction
  -> genuineCentralContinuationC2
  -> projectedJ0SG_totalFinite definido separadamente
  -> lower explícito da norma SG
  -> delta SG-to-continuation certificado
  -> nonvanishing da continuação na sentinela
  -> eventual expansão regional.
```

Se o delta sentinela não fechar, a alternativa correta é recertificar
diretamente a continuação pareada. Não se deve voltar aos aliases raw nem
forçar uma igualdade SG/raw.

O horizonte desta frente permanece local:

```text
não há ainda enclosure contínua do delta;
não há nonvanishing kernel-checked da continuação no middle;
não há expansão para 771 subboxes;
não há faixa contínua, conexão PeerReview ou RH.
```

Se o trabalho futuro sair dessa ordem, este guia e
`AUDIT_GENUINE_RAW_TSUM_MIDDLE_OBSTRUCTION.md` devem ser usados para corrigir
o curso.
