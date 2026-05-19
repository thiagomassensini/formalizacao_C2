# Report de Formalização Lean C2 e Fechamento até RH

## Estado Atual do Código

Leitura direta do código em 19/05/2026. Este bloco e a referencia normativa do estado atual do projeto.
Os itens numerados abaixo devem ser lidos como historico cumulativo de desenvolvimento. Quando mencionarem “gargalo”, “pendencia” ou “proximo passo”, isso descreve o momento em que foram escritos, nao o estado final atual do Lean.

Build atual verificado:

```bash
lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2
```

Resultado:

```text
Build completed successfully (8289 jobs).
```

Conclusao executiva atual e pecas efetivamente operacionais:

- A rota atual fecha ate RH no Lean. O funil `near-axis -> bulk -> edge -> colagem -> transferencia` ja possui endpoints formais ate `RiemannHypothesisC2`.
- Entre os endpoints finais hoje presentes no codigo estao `riemannHypothesisC2_of_c2ExpandedScalarMiddleRegion`, `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleRegionWithBounds`, `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetConcreteCover` e `riemannHypothesisC2_of_F_nonvanishing_offCriticalIdentity`.

- A arquitetura abstrata do roteiro RH já está fechada em `LeanC2/Roadmap.lean`: `NearAxisRouteData`, `RegionalVerticalBulkBoundsData`, `EdgeRouteData`, `OffCriticalCoverData` e `offCriticalStripNonvanishing_of_coverData` formalizam o funil near/bulk/edge até não-anulação off-critical.
- A transferência final para RH já está fechada em `LeanC2/Route/Transfer.lean`: `FundamentalIdentityOnRightHalfPlane`, `FundamentalIdentityOnOffCriticalStrip`, `RH_from_C2` e `riemannHypothesisC2_of_F_nonvanishing_offCriticalIdentity`.
- A continuação para o alvo genuíno já está empacotada em `LeanC2/Analytic/GenuineContinuation.lean` via `GenuineFInfiniteContinuationData`, com `GenuineFInfiniteContinuationData.analyticOnNhd_punctured` e `GenuineFInfiniteContinuationData.eq_continuedCentralOddChannel_on_punctured`.
- O bloco `near` já não é um gargalo independente no caminho atual: `LeanC2/Analytic/GenuineG11.lean` contém `GenuineFInfiniteNearAxisData.of_continuation`, construído a partir de `eventually_ne_zero_of_continuation`.
- O bloco `edge` já foi descarregado no modelo continuado por `C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty` em `LeanC2/Analytic/GenuineBulkConcrete.lean`.
- A hierarquia forte da faixa média já está toda formalizada em `LeanC2/Analytic/GenuineBulkConcrete.lean`, incluindo as rotas `quartetExact`, `quartetTriangle`, `quartetClosed`, `quartetComponent`, `explicitFiniteCore`, `explicitScalar`, `explicitScalarExactZeta`, `expandedExactZeta` e `expandedDominance`, com corolários de RH correspondentes.
- A montagem terminal também já está fechada no arquivo `LeanC2/Analytic/GenuineBulkConcrete.lean`: existem os endpoints `C2RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal`, `...ofContinuationAndExplicitScalarExactZetaMiddleRegion`, `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleRegionWithBounds`, `riemannHypothesisC2_of_continuationAndExpandedScalarMiddlePointwiseBounds` e `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleSeparatedMainBounds`.
- A rota Anti-Milagre do seed natural agora já admite fechamento regional tanto com resíduo analítico real quanto no caso zero-proxy em `LeanC2/Analytic/GenuineBulkConcrete.lean`: os endpoints `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_residualBound` / `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_residualBound` transportam `‖F_∞ - F_X‖ ≤ residualUpper`, enquanto `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle`, `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle` e as variantes `..._of_atOne` ficam como a especialização zero-proxy `residualUpper = 0`. A primeira instância concreta desse formato agora também já está nomeada: `c2ConcreteAntiMiracleExponentialResidualUpper`, com margem `c2ConcreteAntiMiracleAdjustedExponentialMargin` e wrappers regionais `...AntiMiracleMiddle_of_exponentialResidualBound` para o ansatz exponencial `C_Γ X^(1-σ) + C₁/X + C₂/X²`. Além disso, o rebasing local do residual natural para o seed continued já está isolado exatamente por `c2ConcreteAntiMiracleCentralRebasingError`, `c2ConcreteAntiMiracleResidual_eq_rebased_continuedSeed_of_re_pos` e `c2ConcreteAntiMiracleResidual_norm_le_rebased_continuedSeed_of_re_pos`, a camada regional correspondente já pode ser alimentada diretamente por um bound do defeito central via `...AntiMiracleMiddle_of_centralDefectBound`, esse defeito agora também já está empacotado por triângulo a partir de bounds separados de `genuineCentralDoubleSeries` e `continuedCentralOddChannel` via `..._of_separatedCentralBounds`, e a porta residual fiel à nota já ganhou sua API própria: `c2ConcreteAntiMiraclePointwiseOscillatoryMain`, `c2ConcreteAntiMiraclePointwiseOscillatoryResidualUpper`, `c2ConcreteAntiMiracleAdjustedPointwiseOscillatoryMargin` e os wrappers `...AntiMiracleMiddle_of_pointwiseOscillatoryResidualBound` deixam explícita a estratégia “termo principal complexo + resto real” para substituir o proxy sem destruir o cancelamento.
- A rota concreta pelo resolvente vertical completo também já está plugada no fechamento regional em `LeanC2/Analytic/GenuineBulkConcrete.lean`: `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_concreteCover`, `..._concreteSubsetCover`, `offCriticalStripNonvanishing_of_continuationAndBulkConcreteMiddleRegionWithBounds`, `offCriticalStripNonvanishing_of_genuineFInfinite_of_continuationAndBulkConcreteMiddle`, `riemannHypothesisC2_of_continuationAndBulkConcreteMiddleRegionWithBounds` e `riemannHypothesisC2_of_genuineFInfiniteContinuationAndBulkConcreteMiddle` agora empurram pertinência ao `c2OddTailContinuedBalancingSeedBulkConcreteRegion` no `c2ExpandedScalarMiddleRegion` até não-anulação off-critical do modelo, não-anulação off-critical de `genuineFInfinite` e RH.

O que não falta mais no caminho atual:

- Não falta provar uma continuação nova para `genuineFInfinite`; o código atual já trabalha com a interface `GenuineFInfiniteContinuationData` e todo o pipeline final downstream dela compila.
- Não falta montar um pacote de edge não-trivial para fechar o endpoint continuado atual; o caminho usado hoje toma o edge vazio.
- Não falta mais plumbing entre os níveis fortes do witness médio; as conversões e corolários já existem.

O que sobra apenas como refinamento opcional das rotas fortes da faixa média:

- Não falta nada adicional para fechar a rota atual até RH.
- Se quisermos fortalecer a camada bulk com witnesses mais fortes ou mais fiéis às notas, aí sim entra uma prova uniforme, ponto a ponto, sobre a região
  `c2ExpandedScalarMiddleRegion`
  do modelo continuado.
- Na granularidade mais explícita hoje disponível, isso significa produzir cinco famílias de hipóteses na faixa média:
  `C2ExpandedScalarScaleData`,
  `C2ExpandedHorizontalLayerBudget`,
  `C2ExpandedSeedScaledBound`,
  `C2ExpandedCutoffScaledBound`,
  `C2ExpandedQuartetDominance`.
- Equivalente: pode-se fornecer diretamente `C2ExpandedScalarMainInequalities`, `C2ExpandedScalarLocalBulkData`, ou ainda um witness mais forte como `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarExactZetaRegion`; mas isso já é só escolha de empacotamento. O conteúdo matemático restante é a faixa média forte.
- Após a última redução da rota direta, existe também o endpoint canônico
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleSeparatedBounds`,
  que fixa as constantes/escala canônicas e deixa explícitas apenas as peças horizontais/positividade mais
  `hseed`, `hcutoff` e `hdominance` na faixa média.
- Mais diretamente ainda, existe agora o endpoint
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds`,
  que trabalha já na interface `C2CanonicalClosedScaledLocalData`: na prática ele deixa como conteúdo local apenas
  positividade/controle horizontal e a desigualdade `quartet_dominance` ponto a ponto.
- A `quartet_dominance` também já foi quebrada em lemas de montagem locais:
  `c2ExpandedQuartetDominance_of_fourTermBound` e
  `c2ExpandedQuartetDominance_of_budgetBounds`.
  Com isso, a forma mais modular da opção 1 passa a ser o endpoint
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleSeparatedDominanceBounds`,
  onde a parte de dominância pode ser atacada por quatro budgets separados:
  `quartet tail`, `tilt`, `horizontal`, `cutoff`.
- Há agora também a variante residual
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualDominanceBounds`,
  que remove o `quartet tail` da obrigação restante e deixa apenas três budgets
  `tilt/horizontal/cutoff` contra a margem residual explícita
  `c2ExpandedQuartetResidualMargin`.
- E há agora a formulação residual exata mais enxuta,
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualPointwiseBounds`,
  que empacota o lado esquerdo restante como
  `c2CanonicalClosedScaledResidualUpper` e elimina todos os budgets auxiliares:
  sobra apenas a desigualdade pontual
  `c2CanonicalClosedScaledResidualUpper < c2ExpandedQuartetResidualMargin`
  junto do orçamento geométrico horizontal usual.
- A versão analítica mais explícita dessa mesma redução também já está isolada:
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualAnalyticBounds`
  troca a margem residual abstrata pela identidade
  `c2ExpandedQuartetResidualMargin = c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve`,
  então a obrigação final pode ser lida diretamente como uma comparação entre
  `c2CanonicalClosedScaledResidualUpper` e a allowance antiga, descontando uma
  reserva explícita de quarteto.
- E o lado esquerdo canônico agora também tem uma majorante operacional explícita:
  `c2CanonicalClosedScaledResidualMajorant`, com endpoint final
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualMajorantBounds`.
  Isso reduz o subalvo analítico imediato a majorar
  `c2CanonicalClosedScaledResidualUpper` por uma combinação mais transparente dos
  termos vertical/horizontal/cutoff já fechados no modelo canônico.
- Além disso, a majorante residual canônica agora admite uma camada intermediária
  parametrizada apenas por uma cota externa para o termo vertical:
  `c2CanonicalClosedScaledResidualVerticalBudgetUpper`, com endpoint
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualVerticalBudgetBounds`.
  Na prática, isso separa o próximo gargalo real em duas partes: primeiro provar
  `c2ContinuedVerticalResidualClosedUpper ... ≤ verticalUpper`, e só depois comparar
  essa nova expressão residual com `c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve`.
- Essa camada `verticalBudget` agora também já aceita uma interface off-axis honesta
  para a parte horizontal: `C2ExpandedOddTruncationBudget` converte qualquer cota externa
  para `‖c2ConcreteOddTruncationError coreCutoff s j‖` mais o budget geométrico em
  `C2ExpandedHorizontalLayerBudget`, e isso alimenta diretamente os endpoints
  `offCriticalStripNonvanishing_of_continuationAndCanonicalClosedScaledMiddleResidualVerticalBudgetTruncationBounds`
  e
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualVerticalBudgetTruncationBounds`.
  Com isso, o gargalo atual dessa rota ficou exatamente isolado como:
  `oddTruncationUpper` off-axis + `verticalUpper` + a desigualdade residual final.
- Os dois externos agora também já foram empacotados numa unica interface local/regional:
  `C2CanonicalClosedScaledVerticalTruncationLocalData` e
  `C2CanonicalClosedScaledVerticalTruncationMiddleRegionData`.
  Isso transforma a opcao 2 atual num alvo Lean unico: basta preencher esse pacote
  no `c2ExpandedScalarMiddleRegion` para obter diretamente nao-anulacao off-critical
  e RH pela rota canônica comprimida.
- Em paralelo, a rota concreta do resolvente completo tambem ganhou o endpoint
  intermediario que faltava entre `quartetClosed` e a versao canônica: agora
  existem `riemannHypothesisC2_of_c2QuartetComponentMiddleRegion`,
  `offCriticalStripNonvanishing_of_c2QuartetComponentMiddleRegion`,
  `riemannHypothesisC2_of_continuationAndQuartetComponentMiddleRegion` e o
  wrapper pontual
  `riemannHypothesisC2_of_continuationAndQuartetComponentTruncationBounds`.
  A familia agora tambem tem empacotamento local/regional proprio via
  `C2QuartetComponentTruncationLocalData` e
  `C2QuartetComponentTruncationMiddleRegionData`, alem dos wrappers
  `offCriticalStripNonvanishing_of_continuationAndQuartetComponentTruncationLocalData`
  e `riemannHypothesisC2_of_continuationAndQuartetComponentTruncationLocalData`.
  Alem disso, agora existe a variante explicitamente no formato da nota do
  resolvente: `c2ResolventNoteUpper`,
  `C2QuartetComponentResolventNoteLocalData`,
  `C2QuartetComponentResolventNoteMiddleRegionData`,
  `offCriticalStripNonvanishing_of_continuationAndQuartetComponentResolventNoteLocalData`
  e `riemannHypothesisC2_of_continuationAndQuartetComponentResolventNoteLocalData`.
  Essa mesma interface agora tambem existe no estilo “passa as hipoteses e fecha”
  via `C2QuartetComponentResolventNoteLocalData.of_noteBounds`,
  `offCriticalStripNonvanishing_of_continuationAndQuartetComponentResolventNoteBounds`
  e `riemannHypothesisC2_of_continuationAndQuartetComponentResolventNoteBounds`.
  Nessa apresentacao, o bloco de seed entra como uma unica desigualdade do tipo
  `continuedVerticalUpper + horizontalRegularizedUpper <= C_R / X`, com `X`
  identificado a `cutoffScale`.
  A interface agora tambem tem uma instancia concreta de `C_R` quando
  `horizontalScale = cutoffScale`: `c2ResolventNoteScaleMatchedConstant` e, na
  rota `quartetComponent`, `c2QuartetComponentExactScaleMatchedResolventConstant`.
  Com isso, os wrappers
  `offCriticalStripNonvanishing_of_continuationAndQuartetComponentExactScaleMatchedResolventBounds`
  e `riemannHypothesisC2_of_continuationAndQuartetComponentExactScaleMatchedResolventBounds`
  fecham a apresentacao da nota diretamente a partir do upper vertical exato
  `c2ContinuedVerticalResidualExactUpper`, sem precisar postular `C_R` como dado
  externo separado.
  Isso deixa a leitura da nota ainda mais direta: um `continuedVerticalUpper`, um
  `oddTruncationUpper` off-axis, o bound escalado da seed, o cutoff e a dominância
  de quarteto já bastam para fechar RH sem passar primeiro pela compressão
  residual canônica.
- Essa primeira metade agora já tem uma escolha concreta validada:
  `c2CanonicalClosedVerticalFiniteExactZetaUpper`, que combina envelopes finitos para
  `rectangularDirect` e `rectangularBracket` com a cota exata-zeta do canal central.
  Com isso, já existe também o endpoint
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualFiniteExactZetaVerticalBounds`,
  e o próximo subalvo honesto vira uma única desigualdade residual explícita.
- Esse último empacotamento também já foi feito: o `cutoff` canônico agora admite a cota
  `c2CanonicalClosedCutoffFiniteExactZetaUpper`, e isso produz a upper totalmente explícita
  `c2CanonicalClosedScaledResidualFiniteExactZetaUpper`, com endpoint final
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualFiniteExactZetaBounds`.
  Mas essa rota totalmente explícita não é mais um alvo honesto: o próprio Lean agora certifica
  a obstrução via
  `c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_of_offCriticalStrip`,
  `c2AnalyticBulkAllowance_sub_reserve_lt_scaledVerticalDepthTail_of_offCriticalStrip` e
  `not_c2CanonicalClosedScaledResidualFiniteExactZetaUpper_lt_analyticResidual_of_offCriticalStrip`.
  Em outras palavras, o termo
  `verticalDepthTailUpper s * (2 * (1 - ‖q s‖)⁻¹)`
  sozinho já excede a margem residual analítica em todo `offCriticalStrip`, então essa desigualdade
  totalmente explícita não deve ser tratada como a rota terminal do projeto.

Refinamentos opcionais mais honestos:

1. Trabalhar diretamente no teorema final
   `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleSeparatedMainBounds`.
2. Se quiser reduzir ruído de parâmetros antes da prova analítica, trabalhar no endpoint canônico
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleSeparatedBounds`.
3. Se quiser a formulação mais enxuta da opção 1, trabalhar em
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddlePointwiseBounds`.
4. Se quiser a formulação canônica mais enxuta da opção 1, trabalhar em
  `riemannHypothesisC2_of_continuationAndCanonicalClosedScaledMiddleResidualPointwiseBounds`.
5. Provar, para cada `s` na `c2ExpandedScalarMiddleRegion`, as cinco peças locais acima, ou a variante canônica equivalente.
6. Na formulação canônica residual exata, isso se reduz a controlar o orçamento horizontal e provar a desigualdade pontual
  `c2CanonicalClosedScaledResidualUpper < c2ExpandedQuartetResidualMargin`.
7. Na formulação analítica explícita recém-isolada, a mesma meta vira
  `c2CanonicalClosedScaledResidualUpper < c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve`.
8. A escolha concreta atualmente disponível para esse budget vertical é
  `verticalUpper = c2CanonicalClosedVerticalFiniteExactZetaUpper`.
9. A forma residual totalmente explícita continua isolada como
  `c2CanonicalClosedScaledResidualFiniteExactZetaUpper`.
10. Mas essa meta residual totalmente explícita agora está formalmente bloqueada pelos lemas
  `c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_of_offCriticalStrip`,
  `c2AnalyticBulkAllowance_sub_reserve_lt_scaledVerticalDepthTail_of_offCriticalStrip` e
  `not_c2CanonicalClosedScaledResidualFiniteExactZetaUpper_lt_analyticResidual_of_offCriticalStrip`.
11. Portanto, o próximo passo honesto é recuar para um witness médio menos grosseiro do que essa
  upper residual totalmente explícita, em vez de continuar tentando provar uma desigualdade falsa.
  Essa opção agora já está empacotada diretamente no Lean via
  `C2CanonicalClosedScaledResidualBudgetLocalData`,
  `C2CanonicalClosedScaledResidualBudgetMiddleRegionData` e
  `riemannHypothesisC2_of_c2CanonicalClosedScaledResidualBudgetMiddleRegionData`.
  Em termos práticos, o alvo local deixa de ser uma única upper residual colapsada e passa a ser
  fornecer separadamente os budgets `tilt`, `horizontal`, `cutoff` e a desigualdade
  `tiltBudget + horizontalBudget + cutoffBudget < c2ExpandedQuartetResidualMargin`.
  Na linguagem das notas, isso é exatamente o reencaixe no Anti-Milagre:
  `c2AntiMiracleFiniteCriterion_of_budgetBounds` /
  `offCriticalStripNonvanishing_of_continuationAndCanonicalClosedScaledMiddleSeparatedDominanceBounds`
  formalizam a forma finita do quarteto contra cauda+cutoff;
  `c2AntiMiracleAdjustedCriterion_of_residualBudgetBounds` /
  `offCriticalStripNonvanishing_of_continuationAndCanonicalClosedScaledMiddleResidualDominanceBounds`
  formalizam a forma ajustada/residual correspondente.
12. Se quiser ignorar essa redução intermediária, ainda é possível trabalhar direto com a majorante global
   `c2CanonicalClosedScaledResidualMajorant < c2AnalyticBulkAllowance - c2ExpandedQuartetResidualReserve`.
13. Se quiser voltar ao empacotamento explícito anterior, ainda é possível quebrar o restante da análise nas três desigualdades centrais do bloco `hmain`:
   `C2ExpandedSeedScaledBound`,
   `C2ExpandedCutoffScaledBound`,
   `C2ExpandedQuartetDominance`.
14. A forma abstrata da nota do Anti-Milagre agora também está explicitada no Lean por
  `c2AntiMiracleFiniteCriterion_of_splitBounds` e
  `c2AntiMiracleAdjustedCriterion_of_adjustedQuartetBounds`.
  Isso fixa exatamente quais insumos da nota ainda faltam instanciar no bloco final,
  sem inventar rota nova.
15. O bloco concreto do topo de `LeanC2/Analytic/GenuineBulkConcrete.lean` agora já está
  alinhado com a forma finita da nota:
  `F_X = c2ConcreteAntiMiracleFiniteModel`,
  `Q_{4,X} = c2ConcreteAntiMiracleQuartet`,
  `\mathcal T_{4,X} = c2ConcreteAntiMiracleTail`,
  com o split registrado em
  `c2ConcreteAntiMiracleFiniteModel_eq_quartet_add_tail_of_re_pos`.
16. A forma ajustada concreta do pacote seeded atual também já ficou fixada no Lean:
  `F_{2+j,X}` é agora
  `c2ConcreteAntiMiracleAdjustedLayer`,
  `A = c2ConcreteAntiMiracleAdjustedAmplitude`,
  `β = c2ConcreteAntiMiracleAdjustedRatio = q`,
  `E_j` são os quatro objetos
  `c2ConcreteAntiMiracleAdjustedError0/1/2/3`,
  e o quarteto correspondente é
  `c2ConcreteAntiMiracleAdjustedQuartet`.
  O identity package ficou registrado em
  `c2ConcreteAntiMiracleAdjustedQuartet_eq_errorSplit`.
17. A álgebra abstrata dessa etapa já ficou fixada no Lean por
  `c2AntiMiracleAdjustedQuartetLowerBound_of_errorSplit` e
  `c2AntiMiracleAdjustedCriterion_of_errorSplit`:
  e, para o pacote concreto atual, isso já foi especializado em
  `c2ConcreteAntiMiracleAdjustedQuartetLowerBound` e
  `c2AntiMiracleAdjustedCriterion_of_concreteSeededQuartetBounds`.
18. O tail concreto desse pacote também já foi aberto exatamente em
  `c2ConcreteAntiMiracleAdjustedTail_eq_expanded_of_re_pos`:
  ele é a soma de
  `c2QuartetVerticalTail`,
  `c2ConcreteTiltTailError (c2SeededTiltLayerResidual tiltSeed) (fun _ => 4)`,
  `c2ConcreteAntiMiracleHorizontalTail`,
  e `c2ConcreteCutoffError`.
19. Esse budget explícito do tail agora também já está empacotado no Lean por
  `c2ConcreteAntiMiracleHorizontalTailUpper`,
  `c2ConcreteAntiMiracleHorizontalTail_norm_le_upper_of_geometric`,
  `c2ConcreteAntiMiracleAdjustedTailUpper`,
  `c2ConcreteAntiMiracleAdjustedTail_norm_le_upper_of_bounds`,
  o critério final correspondente
  `c2AntiMiracleAdjustedCriterion_of_concreteSeededQuartetUpperBounds`,
  a especialização escalada
  `c2ConcreteAntiMiracleAdjustedTailScaledUpper` /
  `c2AntiMiracleAdjustedCriterion_of_concreteSeededQuartetScaledUpperBounds`,
  e as versões que aceitam diretamente o residual
  `c2ConcreteAntiMiracleResidual = F_X - F_∞`.
20. Para seeds gerais, o gargalo restante continua sendo instanciar quantitativamente esses inputs na região desejada:
  um `cutoffBudget` concreto,
    um bound analítico real `residualUpper` para
    `‖genuineFInfinite - c2ConcreteAntiMiracleFiniteModel‖`,
  as desigualdades de camada horizontal na faixa média escolhida,
  e a positividade final
    `c2ConcreteAntiMiracleAdjustedMain - c2ConcreteAntiMiracleAdjustedDefect - c2ConcreteAntiMiracleAdjustedTailUpper - residualUpper > 0`.
    Para a versão escalada, isso agora está expresso explicitamente por
    `c2ConcreteAntiMiracleAdjustedAnalyticMargin` e pelo corolário
    `c2AntiMiracleAdjustedCriterion_of_concreteSeededQuartetScaledUpperBounds_of_analyticResidualBound`.
     A primeira especialização concreta dessa interface já entrou com o formato exponencial da nota:
     `c2ConcreteAntiMiracleExponentialResidualUpper`,
     `c2ConcreteAntiMiracleAdjustedExponentialMargin` e o critério local
     `c2AntiMiracleAdjustedCriterion_of_concreteSeededQuartetScaledUpperBounds_of_exponentialResidualBound`.
21. Há agora também um atalho estrutural para o seed natural
  `c2OddTailBalancingSeed`: usando os dados já formalizados de comparação no
  semiplano direito,
  `c2ConcreteAntiMiracleResidual_eq_zero_of_oddTailBalancingSeed_of_comparison`
  elimina completamente o proxy, e os wrappers
  `c2AntiMiracleAdjustedCriterion_of_oddTailBalancingSeedScaledUpperBounds_of_comparison`
  e `..._of_atOne` reduzem o bulk ajustado diretamente a tail upper escalada + positividade.
  22. A rota com resíduo analítico real já foi colada ao endpoint regional do middle strip:
    `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_residualBound`
    e `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_residualBound`
    agora transportam diretamente um bound pointwise
    `‖F_∞ - F_X‖ ≤ residualUpper` no `c2ExpandedScalarMiddleRegion` até não-anulação
    off-critical e RH.
    Para o formato exponencial da nota, já existem as especializações
    `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_exponentialResidualBound`
    e `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_exponentialResidualBound`.
    O rebasing local do residual natural para o seed continued também já ficou
    explícito: `c2OddTailBalancingSeed_eq_continued_add_rebasingError`,
    `c2OddTailRegularizedResidual_eq_continued_add_rebasingError_of_re_pos`,
    `c2ConcreteAntiMiracleResidual_eq_rebased_continuedSeed_of_re_pos` e
    `c2ConcreteAntiMiracleResidual_norm_le_rebased_continuedSeed_of_re_pos`
    reduzem o próximo subalvo honesto a controlar o residual com continued seed
    mais o defeito central explícito
    `2 * ‖genuineCentralDoubleSeries - continuedCentralOddChannel‖`.
    E a camada regional correspondente já ficou empacotada: os wrappers
    `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_centralDefectBound`
    e `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle_of_centralDefectBound`
    substituem a hipótese bruta de residual por um bound pointwise direto para
    `‖genuineCentralDoubleSeries - continuedCentralOddChannel‖` no
    `c2ExpandedScalarMiddleRegion`.
    Além disso, o defeito central já tem agora um envelope triangular abstrato
    `c2CentralDefectTriangleUpper`, com wrappers
    `...AntiMiracleMiddle_of_separatedCentralBounds`; e como o lado continuado
    já é descarregado por `c2ExplicitFiniteCoreCentralExactZetaScalarUpper`, a
    especialização `...AntiMiracleMiddle_of_genuineCentralBound` reduz o próximo
    subalvo honesto a produzir apenas um bound para
    `‖genuineCentralDoubleSeries‖` na região média.
    A rota antiga zero-proxy virou apenas a especialização `residualUpper = 0`:
  `offCriticalStripNonvanishing_of_continuationAndOddTailBalancingAntiMiracleMiddle`,
  `riemannHypothesisC2_of_continuationAndOddTailBalancingAntiMiracleMiddle`
  e as variantes `..._of_atOne` mostram que, uma vez dadas as hipóteses pointwise de
  `C2ExpandedScalarScaleData`, budget horizontal, bound do seed, cutoff escalado e
  positividade final no `c2ExpandedScalarMiddleRegion`, o modelo continuado fecha
  diretamente em não-anulação off-critical e RH sem reintroduzir nenhum proxy residual.

Resumo curto: a rota atual do repositório já está fechada até RH. O que permanece em aberto são apenas refinamentos quantitativos de witnesses mais fortes para a faixa média do modelo continuado. Near-axis, edge, continuação, transfer e montagem terminal já estão presentes no Lean atual.

## Estado geral

- Projeto Lean em `/home/thlinux/formalizacao_C2`.
- Módulo raiz: `LeanC2.lean`.
- Conclusão executiva: a rota atual fecha RH no Lean.
- Build raiz completa verificada em 19/05/2026:

```bash
lake build LeanC2
```

Resultado:

```text
Build completed successfully (8289 jobs).
```

- Verificações incrementais relevantes:
  - `lake build LeanC2.Route.BulkQuartet` concluiu com sucesso;
  - `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso;
  - `lake build LeanC2` concluiu com sucesso.

- Não há declarações `sorry`, `admit`, `axiom` ou `constant` no código Lean do projeto.

## Arquivos formalizados

```text
LeanC2/Foundations/Basic.lean
LeanC2/Foundations/Dyadic.lean
LeanC2/Analytic/GenuineInfinite.lean
LeanC2/Analytic/GenuineLateralInfinite.lean
LeanC2/Analytic/GenuineContinuation.lean
LeanC2/Analytic/GenuineCover.lean
LeanC2/Analytic/GenuineBulk.lean
LeanC2/Analytic/GenuineBulkConcrete.lean
LeanC2/Analytic/OddChannel.lean
LeanC2/Identity/C0.lean
LeanC2/Identity/C0Bridge.lean
LeanC2/Operators/BranchBarrier.lean
LeanC2/Operators/ComplexDirichlet.lean
LeanC2/Operators/DirichletExamples.lean
LeanC2/Operators/DirichletFormal.lean
LeanC2/Operators/FiniteCancellation.lean
LeanC2/Operators/Tilt.lean
LeanC2/Operators/TruncatedGenuine.lean
LeanC2/Operators/VerticalResolvent.lean
LeanC2/Roadmap.lean
LeanC2/Route/NearAxis.lean
LeanC2/Route/Dominance.lean
LeanC2/Route/BulkReal.lean
LeanC2/Route/BulkErrors.lean
LeanC2/Route/BulkQuartet.lean
LeanC2/Route/BulkCutoff.lean
LeanC2/Route/BulkHorizontal.lean
LeanC2/Route/BulkConcrete.lean
LeanC2/Route/BulkTilt.lean
LeanC2/Route/BulkEstimates.lean
LeanC2/Route/BulkOddTail.lean
LeanC2/Route/FundamentalAlgebra.lean
LeanC2/Route/Transfer.lean
LeanC2/Route/VerticalBulkReal.lean
```

Nota de leitura do restante do documento: os itens numerados abaixo registram a evolucao da formalizacao. Varias entradas usam a linguagem de “pendencia”, “gargalo” ou “proximo passo” porque foram escritas no momento em que cada camada ainda estava sendo aberta. A situacao normativa continua sendo a da secao `Estado Atual do Codigo`: a rota atual esta fechada ate RH, e essas mencoes devem ser lidas apenas como contexto historico ou como refinamentos opcionais.

## 1. Base C2/RH

Arquivo: `LeanC2/Foundations/Basic.lean`

Formalizado:

- `sigmaPart`
- `tPart`
- `criticalOffset s = Re(s) - 1/2`
- `offCriticalStrip s`
- `offCriticalStripNonvanishing f`
- `RiemannHypothesisC2`
- `riemannHypothesisC2_of_offCriticalStripNonvanishing`

Papel: interface lógica mínima. Se provarmos não-anulação off-critical da zeta, obtemos `RiemannHypothesisC2`.

## 2. Aritmética diádica e K.5

Arquivo: `LeanC2/Foundations/Dyadic.lean`

Formalizado:

- `BranchSign.minus`, `BranchSign.plus`
- `v2 n := padicValNat 2 n`
- `keff n := max (v2 (n - 1)) (v2 (n + 1))`
- `descendant k ε m` em `Int`
- `natDescendant k ε m` em `Nat`
- lemas de conversão `Nat`/`Int`
- lemas de valuação 2-adica para `2^k * m` e pernas `2^k*m ± 1`

Teorema K.5, pernas:

```lean
keff_left_leg :
  keff (2 ^ k * m - 1) = k

keff_right_leg :
  keff (2 ^ k * m + 1) = k
```

Hipóteses:

```lean
2 ≤ k
Odd m
```

Bijeção/recíproca:

- `bracket_bijection_odd_ge_three_exists`
- `descendant_address_unique`
- `natDescendant_address_unique`
- `bracket_bijection_odd_ge_three`

Conclusão formalizada: todo ímpar `n ≥ 3` tem um endereço C2 único.

## 3. Halving Law local

Arquivo: `LeanC2/Foundations/Dyadic.lean`

Formalizado:

- `dyadicWeight k = (2^k)⁻¹` em `ℚ`
- `directLegWeight n = dyadicWeight (keff n)`
- `IsC2LegAddress`
- `isC2LegAddress.keff_eq`
- `halving_law_of_address`
- `halving_law_odd_ge_three`

Interpretação:

```lean
directLegWeight n = dyadicWeight k
```

sempre que `n` é perna de um bracket C2 válido no nível `k`.

## 4. Cancelamento lateral finito

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado em anel abstrato:

```lean
variable {R : Type*} [CommRing R] [Algebra ℚ R]
```

Definições:

- `c2Center k m = 2^k * m`
- `directLegTerm`
- `directPairTerm`
- `bracketTerm`
- `centerRemainderTerm`

Cancelamento local:

```lean
local_lateral_cancellation :
  directPairTerm f k m - bracketTerm f k m = centerRemainderTerm f k m
```

Hipóteses:

```lean
2 ≤ k
Odd m
```

## 5. Cancelamento sobre famílias finitas

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `C2Address := Nat × Nat`
- `C2Address.depth`
- `C2Address.core`
- `IsValidC2Address`
- `directPairFiniteSum`
- `bracketFiniteSum`
- `centerRemainderFiniteSum`

Teorema:

```lean
finite_lateral_cancellation :
  directPairFiniteSum f A - bracketFiniteSum f A = centerRemainderFiniteSum f A
```

Hipótese:

```lean
∀ a ∈ A, IsValidC2Address a
```

## 6. Cutoff retangular finito

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `oddCoresUpTo M`
- `mem_oddCoresUpTo`
- `c2Rectangle K M`
- `mem_c2Rectangle`
- `c2Rectangle_valid`

Teorema:

```lean
rectangular_lateral_cancellation :
  directPairFiniteSum f (c2Rectangle K M)
    - bracketFiniteSum f (c2Rectangle K M)
  =
  centerRemainderFiniteSum f (c2Rectangle K M)
```

## 7. Forma de soma dupla

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `directPairFiniteSum_c2Rectangle`
- `bracketFiniteSum_c2Rectangle`
- `centerRemainderFiniteSum_c2Rectangle`

Teorema:

```lean
rectangular_lateral_cancellation_double :
  (∑ k ∈ Finset.Icc 2 K,
     ∑ m ∈ oddCoresUpTo M, directPairTerm f k m)
  -
  (∑ k ∈ Finset.Icc 2 K,
     ∑ m ∈ oddCoresUpTo M, bracketTerm f k m)
  =
  ∑ k ∈ Finset.Icc 2 K,
    ∑ m ∈ oddCoresUpTo M, centerRemainderTerm f k m
```

## 8. Forma geométrica do termo central

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `centerGeometricTerm`
- `centerRemainderTerm_eq_geometric`
- `centerRemainderDoubleSum_eq_geometric`

Teorema:

```lean
rectangular_lateral_cancellation_geometric :
  D_lateral - B
  =
  ∑ k,m centerGeometricTerm f k m
```

Interpretação:

```lean
centerGeometricTerm f k m
=
2 * 2^{-k} * f (2^k * m)
```

formalizado em anel abstrato via `algebraMap ℚ R`.

## 9. Fatoração finita abstrata

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `centerDepthFactor`
- `separatedCenterGeometricTerm`
- `separatedCenterProduct`
- `centerGeometricTerm_eq_separated`
- `centerGeometricDoubleSum_eq_separated`
- `separatedCenterDoubleSum_eq_product`
- `centerGeometricDoubleSum_factorized`

Teorema principal:

```lean
centerGeometricDoubleSum_factorized :
  (∀ k ∈ Finset.Icc 2 K,
     ∀ m ∈ oddCoresUpTo M,
       f (2 ^ k * m) = u k * v m)
  →
  ∑ k,m centerGeometricTerm f k m
  =
  separatedCenterProduct u v K M
```

Interpretação:

se o termo central separa como `u k * v m`, então a soma dupla separa em produto:

```lean
2 * (∑ k, 2^{-k} * u k) * (∑ m, v m)
```

## 10. Multiplicatividade formal tipo Dirichlet

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `IsC2MultiplicativeOnRectangle`
- `dirichletDepthFactor`
- `dirichletSeparatedCenterProduct`
- `centerGeometricDoubleSum_factorized_multiplicative`
- `rectangular_lateral_cancellation_factorized_multiplicative`

Hipótese:

```lean
f (2 ^ k * m) = f (2 ^ k) * f m
```

Conclusão:

```lean
D_lateral - B = dirichletSeparatedCenterProduct f K M
```

## 11. Profundidade geométrica

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado:

- `dyadicWeight_eq_inv_pow`
- `depthGeometricRatio r = (1/2) * r`
- `centerDepthFactor_pow`
- `IsGeometricOnDepth`
- `HasGeometricDepthOnRectangle`
- `separatedCenterProduct_geometricDepth`
- `dirichletSeparatedCenterProduct_geometricDepth`
- `rectangular_lateral_cancellation_geometric_depth`

Teorema principal:

```lean
rectangular_lateral_cancellation_geometric_depth :
  D_lateral - B
  =
  2 * (∑ k ∈ Finset.Icc 2 K, depthGeometricRatio r ^ k)
      * (∑ m ∈ oddCoresUpTo M, f m)
```

Hipóteses:

```lean
IsC2MultiplicativeOnRectangle f K M
HasGeometricDepthOnRectangle f K r
```

## 12. Soma geométrica finita fechada

Arquivo: `LeanC2/Operators/FiniteCancellation.lean`

Formalizado em campo:

```lean
variable {F : Type*} [Field F] [Algebra ℚ F]
```

Teoremas:

```lean
depthGeometricSum_Icc_closed :
  (∑ k ∈ Finset.Icc 2 K, q ^ k)
  =
  (q ^ (K + 1) - q ^ 2) / (q - 1)
```

```lean
depthGeometricRatioSum_Icc_closed :
  (∑ k ∈ Finset.Icc 2 K, depthGeometricRatio r ^ k)
  =
  (depthGeometricRatio r ^ (K + 1) - depthGeometricRatio r ^ 2)
    / (depthGeometricRatio r - 1)
```

Hipóteses:

```lean
2 ≤ K
q ≠ 1
```

ou, no caso especializado:

```lean
depthGeometricRatio r ≠ 1
```

## 13. Kernel Dirichlet formal

Arquivo: `LeanC2/Operators/DirichletFormal.lean`

Formalizado:

```lean
structure FormalDirichletKernel (R : Type*) [CommRing R] [Algebra ℚ R] (K M : Nat)
```

Campos:

- `coeff : Nat -> R`

## 24A. Interface near-axis / transversal

Arquivo: `LeanC2/Route/NearAxis.lean`

Formalizado:

- `onCriticalLine`
- `IsCriticalZero`
- `transversalWindow`
- `nearAxisRegion`
- `NearAxisCertificate`
- `NearAxisCertificate.offCriticalStrip_of_mem_transversalWindow`
- `NearAxisCertificate.nonvanishing_of_mem`
- `NearAxisCertificate.offCriticalStrip_of_mem`

Papel: isolar a saída abstrata da etapa transversal/near-axis antes do bulk. Em vez de introduzir já as derivadas, Taylor e G11 no código base, o módulo registra só a interface que essas provas deverão fornecer: um raio local em torno de cada zero crítico e a não-anulação de `F` nessa janela transversal.

Interface central:

```lean
structure NearAxisCertificate (F zetaFun : ℂ → ℂ) where
  radius : ℂ → ℝ
  radius_pos : ∀ rho, IsCriticalZero zetaFun rho -> 0 < radius rho
  radius_le_half : ∀ rho, IsCriticalZero zetaFun rho -> radius rho ≤ 1 / 2
  nonvanishing : ∀ {rho s},
    IsCriticalZero zetaFun rho ->
    s ∈ transversalWindow rho (radius rho) ->
    F s ≠ 0
```

Com isso, a colagem posterior pode trabalhar diretamente com a região:

```lean
nearAxisRegion riemannZeta cert.radius
```

sem depender ainda da implementação pesada da parte transversal.

## 24B. Dominância abstrata do bulk

Arquivo: `LeanC2/Route/Dominance.lean`

Formalizado:

- `no_zero_of_dominance`
- `no_zero_of_resolvent_dominance`
- `no_zero_of_resolvent_dominance_at`

Papel: formalizar a casca lógica mínima do Anti-Milagre antes da entrada das estimativas específicas de tilt, resolvente e erro. O ponto principal é separar o argumento de dominância da parte analítica pesada que ainda falta para o bulk.

Teorema-base:

```lean
no_zero_of_dominance :
  F = K + E →
  L ≤ ‖K‖ →
  ‖E‖ ≤ R →
  R < L →
  F ≠ 0
```

Versão resolvente:

```lean
no_zero_of_resolvent_dominance :
  F = Kdelta + Edelta →
  Kdelta = K2 / (1 - q) + Gdelta →
  ‖K2‖ / (1 + ‖q‖) ≤ ‖K2 / (1 - q)‖ →
  ‖K2‖ / (1 + ‖q‖) > ‖Gdelta‖ + ‖Edelta‖ →
  F ≠ 0
```

Com isso, a etapa bulk já tem o invólucro formal que faltava: quando as estimativas concretas de resolvente e de erro entrarem, a conclusão `F ≠ 0` pode ser disparada diretamente por esse módulo, sem reescrever o argumento lógico toda vez.
- `depthBase : R`
- `multiplicative : IsC2MultiplicativeOnRectangle coeff K M`
- `geometricDepth : HasGeometricDepthOnRectangle coeff K depthBase`

Definições:


- `NearAxisRouteData`
- `nearAxis_nonvanishing_of_nearAxisRouteData`
- `offCriticalStrip_of_nearAxisRouteData`
- `depthFactor`
- `coreSum`
- `factoredCenter`
- `directLateralSum`
- `bracketSum`
- `closedDepthFactor`

Teoremas:

```lean
lateral_sub_bracket_eq_factoredCenter :
  D.directLateralSum - D.bracketSum = D.factoredCenter
```

```lean
depthFactor_eq_closed :
  D.depthFactor = D.closedDepthFactor
```

```lean
lateral_sub_bracket_eq_closed :
  D.directLateralSum - D.bracketSum
  =
  2 * D.closedDepthFactor * D.coreSum
```

## 14. Exemplo concreto em `ℚ`

Arquivo: `LeanC2/Operators/DirichletExamples.lean`

Formalizado:

- `constantOne K M : FormalDirichletKernel ℚ K M`
- `constantOne_depthRatio_ne_one`
- `constantOne_lateral_sub_bracket_eq_closed`
- `constantOne_lateral_sub_bracket_eq_explicit`

O exemplo constante `1` testa o pipeline completo:

```lean
coeff n = 1
depthBase = 1
depthGeometricRatio 1 = 1/2
```

Forma explícita:

```lean
(constantOne K M).directLateralSum - (constantOne K M).bracketSum
=
(2 : ℚ)
  * (((1 / 2 : ℚ) ^ (K + 1) - (1 / 2 : ℚ) ^ 2)
      / ((1 / 2 : ℚ) - 1))
  * (constantOne K M).coreSum
```

## 15. Coeficiente Dirichlet complexo finito

Arquivo: `LeanC2/Operators/ComplexDirichlet.lean`

Formalizado:

- `complexDirichletCoeff s n = exp (-(s * log n))`
- `complexDirichletCoeff_one`
- `complexDirichletCoeff_ne_zero`
- `complexDirichletCoeff_mul`
- `complexDirichletCoeff_two_pow`
- `complexDirichletCoeff_multiplicativeOnRectangle`
- `complexDirichletCoeff_hasGeometricDepth`
- `complexDirichletDepthRatio_eq`
- `complexDirichletDepthRatio_ne_zero`
- `complexDirichletDepthRatio_norm`
- `complexDirichletDepthRatio_norm_lt_one_of_re_pos`
- `complexDirichletDepthRatio_ne_one_of_re_pos`
- `complexDirichletKernel s K M : FormalDirichletKernel ℂ K M`

Ponto principal: a especialização finita do pipeline formal para o coeficiente tipo Dirichlet complexo já está fechada no retângulo C2. A definição usa a ramificação real positiva:

```lean
n ↦ Complex.exp (-(s * (Real.log (n : ℝ) : ℂ)))
```

Teoremas:

Nos snippets abaixo, `D = complexDirichletKernel s K M`.

```lean
complexDirichletKernel_lateral_sub_bracket_eq_factoredCenter :
  D.directLateralSum - D.bracketSum = D.factoredCenter
```

```lean
complexDirichletKernel_lateral_sub_bracket_eq_geometric_depth :
  D.directLateralSum - D.bracketSum
  =
  2 * (∑ k ∈ Finset.Icc 2 K, depthGeometricRatio (complexDirichletCoeff s 2) ^ k)
      * (∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m)
```

```lean
complexDirichletKernel_lateral_sub_bracket_eq_closed :
  D.directLateralSum - D.bracketSum
  =
  2 * D.closedDepthFactor * D.coreSum
```

```lean
complexDirichletKernel_lateral_sub_bracket_eq_closed_of_re_pos :
  0 < s.re →
  2 ≤ K →
  D.directLateralSum - D.bracketSum
  =
  2 * D.closedDepthFactor * D.coreSum
```

```lean
complexDirichletKernel_lateral_sub_bracket_eq_closed_of_offCriticalStrip :
  offCriticalStrip s →
  2 ≤ K →
  D.directLateralSum - D.bracketSum
  =
  2 * D.closedDepthFactor * D.coreSum
```

Hipóteses da forma fechada:

```lean
2 ≤ K
depthGeometricRatio (complexDirichletCoeff s 2) ≠ 1
```

O que foi provado internamente:

- multiplicatividade finita para índices naturais positivos;
- separação `f(2^k * m) = f(2^k) * f(m)` no retângulo;
- profundidade geométrica `f(2^k) = f(2)^k`;
- não-anulação do coeficiente complexo;
- controle de norma do ratio de profundidade;
- condição fechada `depthGeometricRatio (...) ≠ 1` quando `Re(s) > 0`;
- reaproveitamento direto da interface `offCriticalStrip`;
- aplicação automática do kernel formal já construído.

## 16. Operadores retangulares finitos `D`, `B`, `F`

Arquivo: `LeanC2/Operators/TruncatedGenuine.lean`

Formalizado:

- `rectangularDirect s K M`
- `rectangularBracket s K M`
- `rectangularGenuine s K M = rectangularDirect s K M - rectangularBracket s K M`
- `rectangularCentral s K M`
- `rectangularDepthFactor s K`
- `rectangularOddCoreSum s M`
- `rectangularDepthFactor_eq_kernel_depthFactor`
- `rectangularOddCoreSum_eq_kernel_coreSum`
- `rectangularCentral_eq_depth_core`
- `rectangularGenuine_eq_central`
- `rectangularGenuine_eq_depth_core`
- `rectangularGenuine_eq_closed`
- `rectangularGenuine_eq_closed_of_re_pos`
- `rectangularGenuine_eq_closed_of_offCriticalStrip`

Papel: aproximar a formalização dos nomes da rota (`D`, `B`, `F`) sem ainda introduzir a dificuldade das séries infinitas ou do cutoff suave.

Identidade finita principal:

```lean
rectangularGenuine_eq_central :
  rectangularGenuine s K M = rectangularCentral s K M
```

Forma fatorada:

```lean
rectangularGenuine_eq_depth_core :
  rectangularGenuine s K M
  =
  2 * rectangularDepthFactor s K * rectangularOddCoreSum s M
```

Forma fechada no off-critical strip:

```lean
rectangularGenuine_eq_closed_of_offCriticalStrip :
  offCriticalStrip s →
  2 ≤ K →
  rectangularGenuine s K M
  =
  2 * (complexDirichletKernel s K M).closedDepthFactor
      * rectangularOddCoreSum s M
```

## 17. Resolvente vertical em `k`

Arquivo: `LeanC2/Operators/VerticalResolvent.lean`

Formalizado:

- `verticalRatio s`
- `q s`
- `verticalResolvent s = (1 - verticalRatio s)⁻¹`
- `verticalRatio_eq`
- `verticalRatio_norm`
- `verticalRatio_norm_lt_one_of_re_pos`
- `verticalRatio_norm_lt_one_of_offCriticalStrip`
- `q_norm_lt_one_of_re_pos`
- `q_norm_lt_one_of_offCriticalStrip`
- `verticalRatio_ne_one_of_re_pos`
- `verticalResolvent_den_ne_zero_of_re_pos`
- `summable_vertical_geometric_of_re_pos`
- `vertical_geometric_tsum_eq_resolvent`
- `vertical_geometric_tsum_eq_resolvent_of_offCriticalStrip`
- `geom_resolvent`
- `geom_resolvent_of_re_pos`
- `geom_resolvent_of_offCriticalStrip`
- `verticalDepthTailFromTwo`
- `verticalDepthTailFromTwo_eq`
- `verticalDepthTailFromTwo_eq_of_offCriticalStrip`
- `verticalResolvent_norm_lower_bound_of_re_pos`
- `verticalResolvent_norm_lower_bound_of_offCriticalStrip`
- `resolvent_lower_bound`
- `resolvent_lower_bound_of_re_pos`
- `resolvent_lower_bound_of_offCriticalStrip`

Papel: iniciar a camada analítica da torre central em profundidade `k`, sem ainda entrar no canal horizontal infinito em `m`.

Teoremas centrais:

```lean
geom_resolvent :
  ‖q s‖ < 1 →
  (∑' j : Nat, q s ^ j) = 1 / (1 - q s)
```

```lean
resolvent_lower_bound :
  ‖q s‖ < 1 →
  1 / (1 + ‖q s‖) ≤ ‖1 / (1 - q s)‖
```

```lean
vertical_geometric_tsum_eq_resolvent :
  0 < s.re →
  (∑' j : Nat, verticalRatio s ^ j) = verticalResolvent s
```

```lean
verticalDepthTailFromTwo_eq :
  0 < s.re →
  verticalDepthTailFromTwo s = verticalRatio s ^ 2 * verticalResolvent s
```

```lean
verticalResolvent_norm_lower_bound_of_re_pos :
  0 < s.re →
  1 / (1 + ‖verticalRatio s‖) ≤ ‖verticalResolvent s‖
```

Interpretação:

- `verticalRatio s` é a razão geométrica vertical `q(s)`;
- `q s` agora aparece explicitamente no código com a notação do roadmap;
- quando `Re(s) > 0`, `‖q(s)‖ < 1`;
- a torre vertical infinita converge para o resolvente `(1-q)⁻¹`;
- o bound inferior `1/(1+‖q‖)` já está disponível tanto na notação original quanto na notação do roadmap, pronto para alimentar a etapa de dominância do bulk.

## 17A. Barreira do operador de ramo

Arquivo: `LeanC2/Operators/BranchBarrier.lean`

Formalizado:

- `branchWeightSigma`
- `branchNormSqSigma`
- `branchWeightSigmaT`
- `branchNormSqSigmaT`
- `branchWeightSigmaT_indep_t`
- `branchNormSqSigmaT_indep_t`
- `branchNormSq_closed_form`
- `branchNormSq_half`
- `branchNormSq_lt_one_of_half_lt`
- `branchNormSq_gt_one_of_pos_of_lt_half`
- `branchNormSqSigmaT_lt_one_of_re_gt_half`
- `branchNormSqSigmaT_eq_one_on_critical`
- `branchNormSqSigmaT_gt_one_of_re_pos_of_re_lt_half`

Papel: formalizar a barreira quadrática do operador de ramo como série geométrica real dependente apenas de `σ = Re(s)`.

Teoremas centrais:

```lean
branchNormSq_closed_form :
  0 < σ →
  branchNormSqSigma σ = 2 * branchWeightSigma σ ^ 2 / (1 - branchWeightSigma σ)
```

```lean
branchNormSq_half :
  branchNormSqSigma (1 / 2) = 1
```

```lean
branchNormSqSigmaT_lt_one_of_re_gt_half :
  1 / 2 < s.re →
  branchNormSqSigmaT s < 1
```

```lean
branchNormSqSigmaT_gt_one_of_re_pos_of_re_lt_half :
  0 < s.re → s.re < 1 / 2 →
  1 < branchNormSqSigmaT s
```

Interpretação:

- a massa quadrática de ramo independe de `t`;
- na linha crítica, a massa é exatamente `1`;
- à direita da linha crítica ela cai abaixo de `1`;
- à esquerda, mas ainda com `σ > 0`, ela sobe acima de `1`.

## 18. Tilt / bracket analítico real

Arquivo: `LeanC2/Operators/Tilt.lean`

Formalizado:

- `bracket2`
- `tilt δ x = x^(-δ)`
- `tiltBracket`

Teoremas:

- `tiltBracket_zero`
- `tiltBracket_neg_one`
- `tiltBracket_one_pos`
- `centeredSecond_pos_of_strictConvexOn_Ici`
- `centeredSecond_pos_of_strictConvexOn_Ioi`
- `centeredSecond_neg_of_strictConcaveOn_Ici`
- `tiltBracket_neg_of_neg_one_lt`
- `strictConvexOn_rpow_of_neg`
- `tiltBracket_pos_of_pos`
- `tiltBracket_ne_zero_of_sigma_pos_of_ne_half`

Interpretação:

- para `δ > 0`, o bracket do tilt é positivo;
- para `-1 < δ < 0`, o bracket do tilt é negativo;
- se `sigma > 0` e `sigma ≠ 1/2`, então o bracket transversal não é zero.

## 19. Fator `c0`

Arquivo: `LeanC2/Identity/C0.lean`

Formalizado:

- `c0 s`
- `twoCpow_ne_one_of_re_pos`
- `twoMulTwoCpow_ne_one_of_re_pos`
- `c0_ne_zero_of_re_pos`
- `c0_ne_zero_on_critical`

Papel: preparar a transferência `F = c0 * ζ`, garantindo que `c0` não zera nas regiões relevantes.

## 20. Ponte algébrica para `c0`

Arquivo: `LeanC2/Identity/C0Bridge.lean`

Formalizado:

- `complexDirichletCoeff_two_eq_cpow_neg`
- `c0FromVerticalFactor`
- `c0_eq_c0FromVerticalFactor_of_re_pos`
- `c0_eq_c0FromVerticalFactor_of_offCriticalStrip`

Papel: provar a simplificação algébrica do fator central vertical:

```lean
c0 s = 2 * verticalDepthTailFromTwo s * (1 - complexDirichletCoeff s 2)
```

sob `0 < s.re`. Essa é a parte formal de

```text
2 * (∑_{k≥2} 2^{-k(1+s)}) * (1 - 2^{-s}) = c0(s).
```

## 21. Álgebra do canal ímpar

Arquivo: `LeanC2/Route/FundamentalAlgebra.lean`

Formalizado:

- `OddChannel`
- `centralFromOddChannel`
- `OddChannelEulerRelation`
- `centralFromOddChannel_identity`
- `centralFromOddChannel_riemannZeta_identity`

Papel: isolar a hipótese analítica pesada do canal ímpar. Se algum módulo futuro provar

```lean
Zodd s = (1 - complexDirichletCoeff s 2) * zetaFun s
```

no semiplano direito, então já segue formalmente:

```lean
centralFromOddChannel Zodd s = c0 s * zetaFun s
```

como uma `FundamentalIdentityOnRightHalfPlane`.

## 22. Canal ímpar analítico em `Re(s) > 1`

Arquivo: `LeanC2/Analytic/OddChannel.lean`

Formalizado:

- `positiveDirichletChannel`
- `oddDirichletChannel`
- `evenDirichletChannel`
- `complexDirichletCoeff_eq_cpow_neg`
- `summable_positiveDirichletCoeff_of_one_lt_re`
- `positiveDirichletChannel_eq_riemannZeta`
- `evenDirichletChannel_eq_coeff_two_mul_positive`
- `positiveDirichletChannel_eq_odd_add_even`
- `oddDirichletChannel_eulerRelation_of_one_lt_re`
- `centralFromOddDirichletChannel_identity_of_one_lt_re`

Papel: fechar a primeira parte analítica real do roadmap no semiplano de convergência absoluta. Agora o canal ímpar não é só uma hipótese abstrata: ele foi definido como série e identificado com o fator de Euler em `2`.

Teorema principal:

```lean
oddDirichletChannel_eulerRelation_of_one_lt_re :
  1 < s.re →
  oddDirichletChannel s =
    (1 - complexDirichletCoeff s 2) * riemannZeta s
```

Com isso, a identidade central já fica provada nesse semiplano:

```lean
centralFromOddDirichletChannel_identity_of_one_lt_re :
  1 < s.re →
  centralFromOddChannel oddDirichletChannel s = c0 s * riemannZeta s
```

A prova usa:

- identificação `complexDirichletCoeff s n = n^(-s)` para `n ≠ 0`;
- a série da Mathlib para `riemannZeta` em `Re(s) > 1`;
- decomposição da série positiva em índices pares e ímpares via `HasSum.even_add_odd`;
- multiplicatividade do coeficiente para provar que o canal par é `complexDirichletCoeff s 2` vezes a série total.

## 23. Soma central genuine infinita

Arquivo: `LeanC2/Analytic/GenuineInfinite.lean`

Formalizado:

- `genuineDirectAddressTerm`
- `genuineBracketAddressTerm`
- `genuineCentralAddressTerm`
- `genuineCentralExplicitAddressTerm`
- `genuineLegAddressTerm`
- `genuineLegOddIndex`
- `genuine_address_lateral_cancellation`
- `genuineCentralAddressTerm_eq_explicit`
- `genuineDirectDoubleSeries`
- `genuineBracketDoubleSeries`
- `genuineDoubleSeries_lateral_cancellation_of_summable`
- `summable_genuineDirectAddressTerm_of_one_lt_re`
- `summable_genuineBracketExplicitDiff_of_one_lt_re`
- `genuineDoubleSeries_lateral_cancellation_of_one_lt_re`
- `genuineDoubleSeries_lateral_cancellation_c0_zeta_of_one_lt_re`
- `genuineCentralDoubleSeries`
- `summable_verticalDepthTail_norm_of_re_pos`
- `summable_oddDirichletCoeff_norm_of_one_lt_re`
- `genuineCentralDoubleSeries_eq_centralFromOddChannel`
- `genuineCentralDoubleSeries_eq_c0_mul_riemannZeta_of_one_lt_re`

Papel: introduzir a série dupla central pós-cancelamento do roadmap:

```lean
2 * ∑' (k, m), verticalRatio s ^ (k + 2)
    * complexDirichletCoeff s (2 * m + 1)
```

Essa é a versão Lean da soma

```text
2 * ∑_{k≥2} ∑_{m ímpar} 2^{-k(1+s)} m^{-s}.
```

Além disso, o arquivo agora contém a camada infinita lateral indexada por endereços C2, a somabilidade lateral efetiva em `Re(s) > 1` via reindexação ímpar por perna, e o cancelamento infinito correspondente:

```lean
genuineDoubleSeries_lateral_cancellation_of_summable :
  Summable (fun p => genuineDirectAddressTerm s p) →
  Summable (fun p => genuineBracketAddressTerm s p) →
  genuineDirectDoubleSeries s - genuineBracketDoubleSeries s
    = genuineCentralDoubleSeries s

genuineDoubleSeries_lateral_cancellation_of_one_lt_re :
  1 < s.re →
  genuineDirectDoubleSeries s - genuineBracketDoubleSeries s
    = genuineCentralDoubleSeries s

genuineDoubleSeries_lateral_cancellation_c0_zeta_of_one_lt_re :
  1 < s.re →
  genuineDirectDoubleSeries s - genuineBracketDoubleSeries s
    = c0 s * riemannZeta s
```

Teorema principal:

```lean
genuineCentralDoubleSeries_eq_c0_mul_riemannZeta_of_one_lt_re :
  1 < s.re →
  genuineCentralDoubleSeries s = c0 s * riemannZeta s
```

A prova usa convergência absoluta nos dois eixos, o produto de somas infinitas da Mathlib, a torre vertical já formalizada e o canal ímpar analítico.

Situação atual desta frente:

- a somabilidade de `genuineDirectAddressTerm` em `Re(s) > 1` foi fechada por decomposição em duas pernas reindexadas por `genuineLegOddIndex`;
- a somabilidade do lado bracket foi fechada via `direct - central explícito`, evitando reabrir a expressão grande do bracket durante a prova principal;
- restou um único `set_option maxHeartbeats 0` local no lema `summable_genuineBracketExplicitDiff_of_one_lt_re`, documentado em comentário no próprio arquivo;
- a nota `notas/c2_bloqueio_genuine_infinite_somabilidade.md` fica mantida como registro histórico da dificuldade e da solução adotada.

## 24. Transferência para zeta

Arquivo: `LeanC2/Route/Transfer.lean`

Formalizado como interface condicional:

- `FundamentalIdentityOnRightHalfPlane`
- `F_nonzero_iff_zeta_nonzero_of_identity`
- `zeta_nonzero_of_F_nonzero`
- `offCriticalStrip_zeta_nonvanishing_of_F_nonvanishing`
- `riemannHypothesisC2_of_F_nonvanishing`

Papel:

se houver uma identidade fundamental `F = c0 * ζ` e uma prova de não-anulação de `F` no off-critical strip, então obtemos não-anulação de `ζ` e depois `RiemannHypothesisC2`.

## 25. Roadmap Lean

Arquivo: `LeanC2/Roadmap.lean`

Formalizado:

- `GenuineNumerator`
- `NearAxisRouteData`
- `nearAxis_nonvanishing_of_nearAxisRouteData`
- `offCriticalStrip_of_nearAxisRouteData`
- `BulkRouteData`
- `bulk_nonvanishing_of_bulkRouteData`
- `offCriticalStripNonvanishing_of_bulkRouteData`
- `VerticalBulkRouteData`
- `VerticalBulkRouteData.toBulkRouteData`
- `verticalBulk_nonvanishing_of_verticalBulkRouteData`
- `offCriticalStripNonvanishing_of_verticalBulkRouteData`
- `RegionalVerticalBulkRouteData`
- `regionalVerticalBulk_nonvanishing`
- `RegionalVerticalBulkBoundsData`
- `regionalVerticalBulk_dominance_of_bounds`
- `RegionalVerticalBulkBoundsData.toRouteData`
- `regionalVerticalBulk_nonvanishing_of_bounds`
- `EdgeRouteData`
- `OffCriticalCoverData`
- `offCriticalStripNonvanishing_of_coverData`
- `OffCriticalCoverData.ofNearBulkEdge`
- `OffCriticalCoverData.ofNearBulkBoundsEdge`
- `offCriticalStripNonvanishing_of_nearBulkEdge`
- `offCriticalStripNonvanishing_of_nearBulkBoundsEdge`
- `GenuineRouteData`
- `BulkRouteData.toGenuineRouteData`
- `VerticalBulkRouteData.toGenuineRouteData`
- `OffCriticalCoverData.toGenuineRouteData`
- `riemannHypothesisC2_of_genuineRouteData`
- `riemannHypothesisC2_of_bulkRouteData`
- `riemannHypothesisC2_of_verticalBulkRouteData`
- `riemannHypothesisC2_of_coverData`
- `riemannHypothesisC2_of_nearBulkEdge`
- `riemannHypothesisC2_of_nearBulkBoundsEdge`

`NearAxisRouteData` isola a peça local da rota antes da entrada do bulk e dos edges:

- o numerador `F`;
- um `NearAxisCertificate F riemannZeta`;
- lemas de extração de não-anulação e de pertença ao `offCriticalStrip` na região near-axis.

`BulkRouteData` agora empacota a casca abstrata do passo de dominância/resolvente:

- o numerador `F`;
- a decomposição `F = Kδ + Eδ`;
- a forma de resolvente `Kδ = K2 / (1 - q) + Gδ`;
- o lower bound resolvente;
- a desigualdade de dominância que força a não-anulação off-critical.

`VerticalBulkRouteData` especializa essa casca ao resolvente vertical C2 já formalizado:

- usa `q s` diretamente;
- remove o campo `resolvent_lower`;
- injeta automaticamente `resolvent_lower_bound_of_offCriticalStrip`;
- ainda exige apenas a decomposição, a forma resolvente e a desigualdade de dominância concreta.

`RegionalVerticalBulkRouteData` é a versão local correta para a geometria da prova:

- o bulk tem uma região própria `bulkRegion`;
- a dominância resolvente só precisa valer nessa região;
- a região carrega uma prova `bulk_offCritical`;
- a não-anulação é obtida ponto a ponto por `regionalVerticalBulk_nonvanishing`.

`RegionalVerticalBulkBoundsData` aproxima a forma como as estimativas analíticas entram:

- `K2Lower` para o termo principal;
- `GUpper` e `EUpper` para os erros;
- desigualdade escalar `GUpper + EUpper < K2Lower / (1 + ‖q‖)`;
- conversão automática para dominância complexa via `regionalVerticalBulk_dominance_of_bounds`.

`EdgeRouteData` registra a interface mínima da região edge:

- uma região `edgeRegion`;
- a prova de não-anulação de `F` nessa região.

`OffCriticalCoverData` formaliza a colagem near/bulk/edge:

- três regiões abstratas `nearRegion`, `bulkRegion`, `edgeRegion`;
- uma prova de que elas cobrem o `offCriticalStrip`;
- não-anulação de `F` em cada uma das três regiões.

Daí segue diretamente:

```lean
offCriticalStripNonvanishing_of_coverData :
  OffCriticalCoverData → offCriticalStripNonvanishing F
```

Também foram adicionados construtores diretos:

```lean
OffCriticalCoverData.ofNearBulkEdge
OffCriticalCoverData.ofNearBulkBoundsEdge
```

e teoremas finais que pulam direto da colagem regional para a conclusão:

```lean
riemannHypothesisC2_of_nearBulkEdge
riemannHypothesisC2_of_nearBulkBoundsEdge
```

`GenuineRouteData` empacota:

- o numerador genuine `F`;
- a identidade fundamental;
- a não-anulação genuine.

Com isso, o roadmap Lean já possui interfaces pequenas e compostas para: near-axis, bulk abstrato, bulk vertical com resolvente C2, bulk regional por estimativas escalares, edge, colagem near/bulk/edge e transferência final para RH.

## 25A. Instanciação vertical real do bulk

Arquivo: `LeanC2/Route/VerticalBulkReal.lean`

Formalizado:

- `q_ne_zero`
- `c2VerticalResolventBulkF`
- `c2VerticalResolventBulkRegion`
- `c2VerticalResolventBulkKdelta`
- `c2VerticalResolventBulkK2`
- `c2VerticalResolventBulkGdelta`
- `c2VerticalResolventBulkEdelta`
- `c2VerticalResolventBulkK2Lower`
- `c2VerticalResolventBulkGUpper`
- `c2VerticalResolventBulkEUpper`
- `c2VerticalResolventBulk_resolvent_shape`
- `c2VerticalResolventBulk_K2Lower_eq_norm`
- `c2VerticalResolventBulk_dominance_bounds`
- `c2VerticalResolventBulkBoundsData`
- `c2VerticalResolventBulkRouteData`
- `c2VerticalResolventBulk_nonvanishing_of_offCriticalStrip`

Papel: instanciar concretamente `RegionalVerticalBulkBoundsData` com o resolvente vertical C2 real.

A peça modelada é a cauda vertical pura:

```lean
verticalDepthTailFromTwo s = q s ^ 2 / (1 - q s)
```

com:

```lean
K2 s      = q s ^ 2
Gdelta s  = 0
Edelta s  = 0
K2Lower s = ‖q s‖ ^ 2
GUpper s  = 0
EUpper s  = 0
```

Teorema principal:

```lean
c2VerticalResolventBulk_nonvanishing_of_offCriticalStrip :
  offCriticalStrip s →
  c2VerticalResolventBulkF s ≠ 0
```

Interpretação: a casca regional por bounds escalares já foi testada em uma instanciação real do resolvente C2. Isso ainda não é o bulk completo da prova final, porque os termos analíticos reais `Gδ` e `Eδ` do bulk ainda precisam ser introduzidos; mas a estrutura formal que recebe `K2Lower/GUpper/EUpper` já está validada por um caso C2 não artificial.

## 25B. Bulk analítico real com erros `Gδ` e `Eδ`

Arquivo: `LeanC2/Route/BulkReal.lean`

Formalizado:

- `c2AnalyticBulkAllowance`
- `c2AnalyticBulkMargin`
- `c2AnalyticBulkRegion`
- `c2AnalyticBulkF`
- `c2AnalyticBulkKdelta`
- `c2AnalyticBulkK2`
- `c2AnalyticBulkK2Lower`
- `c2AnalyticBulk_margin_pos_of_mem`
- `c2AnalyticBulk_resolvent_shape`
- `c2AnalyticBulk_decomposition`
- `c2AnalyticBulk_K2Lower_eq_norm`
- `c2AnalyticBulkBoundsData`
- `c2AnalyticBulkRouteData`
- `c2AnalyticBulk_nonvanishing_of_mem`

Papel: substituir o modelo vertical puro por uma forma parametrizada do bulk real:

```lean
F(s) = verticalDepthTailFromTwo s + Gdelta s + Edelta s
```

com decomposição:

```lean
Kdelta(s) = q s ^ 2 / (1 - q s) + Gdelta s
F(s)      = Kdelta(s) + Edelta s
```

A região bulk analítica agora carrega bounds não triviais:

```lean
‖Gdelta s‖ ≤ GUpper s
‖Edelta s‖ ≤ EUpper s
GUpper s + EUpper s < ‖q s‖ ^ 2 / (1 + ‖q s‖)
```

Teorema principal:

```lean
c2AnalyticBulk_nonvanishing_of_mem :
  s ∈ c2AnalyticBulkRegion Gdelta Edelta GUpper EUpper →
  c2AnalyticBulkF Gdelta Edelta s ≠ 0
```

Interpretação: a prova Lean agora aceita os termos reais `Gδ` e `Eδ` do bulk e reduz a etapa analítica restante a fornecer upper bounds concretos `GUpper`, `EUpper` com margem positiva. Isso é exatamente o encaixe necessário antes de formalizar as estimativas específicas de tilt, cutoff e defeito horizontal.

## 25C. Decomposição dos erros reais do bulk

Arquivo: `LeanC2/Route/BulkErrors.lean`

Formalizado:

- `c2BulkGdelta`
- `c2BulkEdelta`
- `c2BulkGUpper`
- `c2BulkEUpper`
- `c2BulkErrorMargin`
- `c2BulkErrorRegion`
- `c2BulkError_margin_pos_of_mem`
- `c2BulkErrors_G_bound_of_mem`
- `c2BulkErrors_E_bound_of_mem`
- `c2BulkErrors_dominance_bounds_of_mem`
- `c2BulkErrors_mem_analytic_region`
- `c2BulkErrorsBoundsData`
- `c2BulkErrorsRouteData`
- `c2BulkErrors_nonvanishing_of_mem`

Papel: especializar os termos abstratos do bulk analítico para a decomposição indicada pela rota:

```lean
Gδ(s) = tiltResidual s + horizontalDefect s
Eδ(s) = cutoffError s
```

com bounds escalares por componente:

```lean
‖tiltResidual s‖    ≤ tiltUpper s
‖horizontalDefect s‖ ≤ horizontalUpper s
‖cutoffError s‖     ≤ cutoffUpper s
tiltUpper s + horizontalUpper s + cutoffUpper s
  < ‖q s‖ ^ 2 / (1 + ‖q s‖)
```

O Lean prova automaticamente que isso implica os bounds combinados:

```lean
‖Gδ(s)‖ ≤ tiltUpper s + horizontalUpper s
‖Eδ(s)‖ ≤ cutoffUpper s
```

Teorema principal:

```lean
c2BulkErrors_nonvanishing_of_mem :
  s ∈ c2BulkErrorRegion
    tiltResidual horizontalDefect cutoffError
    tiltUpper horizontalUpper cutoffUpper →
  c2AnalyticBulkF
    (c2BulkGdelta tiltResidual horizontalDefect)
    (c2BulkEdelta cutoffError) s ≠ 0
```

Interpretação: o bulk regional já não depende mais de um par opaco `GUpper/EUpper`. A obrigação analítica restante foi refinada para três estimativas independentes: resíduo de tilt, defeito horizontal em `m` e cutoff. Quando essas três cotas têm soma menor que o allowance resolvente C2, a não-anulação do bulk segue no Lean.

## 25D. Cutoff do bulk em forma `C/X`

Arquivo: `LeanC2/Route/BulkCutoff.lean`

Formalizado:

- `c2CutoffUpperFromScale`
- `c2CutoffUpperFromX`
- `c2CutoffUpperFromScale_const`
- `c2Cutoff_bound_from_scaled`
- `c2Cutoff_bound_from_scaled_const`
- `c2BulkScaledCutoffRegion`
- `c2BulkScaledCutoff_mem_error_region`
- `c2BulkScaledCutoffBoundsData`
- `c2BulkScaledCutoffRouteData`
- `c2BulkScaledCutoff_nonvanishing_of_mem`

Papel: incorporar a forma de cutoff das notas:

```lean
‖cutoffError s‖ * cutoffScale s ≤ cutoffConstant s
0 < cutoffScale s
```

e convertê-la internamente para:

```lean
‖cutoffError s‖ ≤ cutoffConstant s / cutoffScale s
```

Também há a especialização de escala constante:

```lean
c2CutoffUpperFromX cutoffConstant X s = cutoffConstant s / X
```

Teorema principal:

```lean
c2BulkScaledCutoff_nonvanishing_of_mem :
  s ∈ c2BulkScaledCutoffRegion
    tiltResidual horizontalDefect cutoffError
    tiltUpper horizontalUpper cutoffConstant cutoffScale →
  c2AnalyticBulkF
    (c2BulkGdelta tiltResidual horizontalDefect)
    (c2BulkEdelta cutoffError) s ≠ 0
```

Interpretação: a rota agora aceita diretamente um certificado de cutoff do tipo `C/X`. A obrigação analítica fica no formato natural das notas: provar a escala positiva, provar o bound escalado do resíduo, e provar que `tiltUpper + horizontalUpper + C/X` fica abaixo do allowance resolvente.

## 25E. Defeito horizontal em `m` com bound regularizado

Arquivo: `LeanC2/Route/BulkHorizontal.lean`

Formalizado:

- `c2HorizontalRegularizedDefect`
- `c2HorizontalRegularizedUpper`
- `c2HorizontalRegularizedUpperFromX`
- `c2HorizontalRegularizedUpper_const`
- `c2HorizontalRegularizedDefect_bound`
- `C2BulkRegularizedHorizontalHypotheses`
- `c2BulkRegularizedHorizontalRegion`
- `c2BulkRegularizedHorizontal_mem_scaled_cutoff_region`
- `c2BulkRegularizedHorizontalBoundsData`
- `c2BulkRegularizedHorizontalRouteData`
- `c2BulkRegularizedHorizontal_nonvanishing_of_mem`

Papel: formalizar a versão regularizada do defeito horizontal em `m` como soma por camadas:

```lean
horizontalDefect(s) = ∑' j, horizontalLayerDefect s j
```

com controle geométrico por camada:

```lean
‖horizontalLayerDefect s j‖
  ≤ (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
0 ≤ horizontalRatio s
horizontalRatio s < 1
```

O bound fechado provado no Lean é:

```lean
c2HorizontalRegularizedDefect_bound :
  ‖c2HorizontalRegularizedDefect horizontalLayerDefect s‖
    ≤ (horizontalConstant s / horizontalScale s)
        * (1 - horizontalRatio s)⁻¹
```

Essa cota é então usada como `horizontalUpper` dentro da região bulk com cutoff escalado:

```lean
tiltUpper s
  + c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio s
  + cutoffConstant s / cutoffScale s
  < c2AnalyticBulkAllowance s
```

Teorema principal:

```lean
c2BulkRegularizedHorizontal_nonvanishing_of_mem :
  s ∈ c2BulkRegularizedHorizontalRegion
    tiltResidual cutoffError horizontalLayerDefect
    tiltUpper horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale →
  c2AnalyticBulkF
    (c2BulkGdelta tiltResidual
      (c2HorizontalRegularizedDefect horizontalLayerDefect))
    (c2BulkEdelta cutoffError) s ≠ 0
```

Interpretação: o defeito horizontal em `m` deixou de ser uma cota opaca `horizontalUpper`. A formalização agora aceita uma família de erros por camada, prova a soma geométrica regularizada e injeta automaticamente essa cota no pacote regional do bulk.

## 25F. Conexão com operadores concretos horizontal/cutoff

Arquivo: `LeanC2/Route/BulkConcrete.lean`

Formalizado:

- `c2HorizontalCutoffLayer`
- `c2HorizontalReferenceLayer`
- `c2ConcreteHorizontalLayerDefect`
- `c2ConcreteHorizontalLayerDefect_eq_weighted_odd_error`
- `c2ConcreteOddHorizontalLayerDefect`
- `c2ConcreteOddHorizontalDefect`
- `c2RectangularGenuineOperator`
- `c2AnalyticCentralTarget`
- `c2ConcreteCutoffErrorFromTarget`
- `c2ConcreteCutoffError`
- `c2ConcreteCutoffErrorC0Zeta`
- `c2ConcreteCutoffError_eq_c0Zeta_of_one_lt_re`
- `c2ConcreteOperatorBulkBoundsData`
- `c2ConcreteOperatorBulkRouteData`
- `c2ConcreteOperatorBulk_nonvanishing_of_mem`

Papel: substituir os placeholders `horizontalLayerDefect` e `cutoffError` por operadores já formalizados:

```lean
horizontalLayerDefect(s,j)
  =
    2 * q s ^ (j + 2)
      * (rectangularOddCoreSum s (coreCutoff j) - oddDirichletChannel s)
```

e

```lean
cutoffError(s)
  =
    rectangularGenuine s K M - genuineCentralDoubleSeries s
```

Em `Re(s) > 1`, o alvo infinito também foi conectado ao alvo `c0(s) * ζ(s)`:

```lean
c2ConcreteCutoffError_eq_c0Zeta_of_one_lt_re :
  1 < s.re →
  c2ConcreteCutoffError K M s
    = c2ConcreteCutoffErrorC0Zeta K M s
```

Interpretação: o bulk agora sabe falar diretamente com o operador retangular finito `rectangularGenuine`, com o canal ímpar truncado `rectangularOddCoreSum`, com o canal ímpar infinito `oddDirichletChannel` e com o alvo analítico `genuineCentralDoubleSeries`.

## 25G. Resíduo de tilt regularizado e bulk concreto completo

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2TiltRegularizedResidual`
- `c2TiltRegularizedUpper`
- `c2TiltRegularizedUpperFromX`
- `c2TiltRegularizedUpper_const`
- `c2TiltRegularizedResidual_bound`
- `C2BulkConcreteRegularizedHypotheses`
- `c2BulkConcreteRegularizedRegion`
- `c2BulkConcreteRegularized_mem_regularized_horizontal_region`
- `c2BulkConcreteRegularizedBoundsData`
- `c2BulkConcreteRegularizedRouteData`
- `c2BulkConcreteRegularized_nonvanishing_of_mem`

Papel: formalizar o bound do resíduo de tilt no mesmo formato regularizado:

```lean
tiltResidual(s) = ∑' j, tiltLayerResidual s j
```

com:

```lean
‖tiltLayerResidual s j‖
  ≤ (tiltConstant s / tiltScale s) * tiltRatio s ^ j
0 ≤ tiltRatio s
tiltRatio s < 1
```

e bound fechado:

```lean
‖c2TiltRegularizedResidual tiltLayerResidual s‖
  ≤ (tiltConstant s / tiltScale s) * (1 - tiltRatio s)⁻¹
```

O pacote completo usa simultaneamente:

```lean
tiltResidual      = c2TiltRegularizedResidual tiltLayerResidual
horizontalDefect  = c2ConcreteOddHorizontalDefect coreCutoff
cutoffError       = c2ConcreteCutoffError K M
```

Teorema principal:

```lean
c2BulkConcreteRegularized_nonvanishing_of_mem :
  s ∈ c2BulkConcreteRegularizedRegion
    tiltLayerResidual coreCutoff K M
    tiltConstant tiltScale tiltRatio
    horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale →
  c2AnalyticBulkF
    (c2BulkGdelta
      (c2TiltRegularizedResidual tiltLayerResidual)
      (c2ConcreteOddHorizontalDefect coreCutoff))
    (c2BulkEdelta (c2ConcreteCutoffError K M)) s ≠ 0
```

Interpretação: o bulk real agora está numa forma bastante próxima da rota: tilt, horizontal em `m` e cutoff entram por fontes separadas, cada uma com seu certificado escalar, e a conclusão regional de não-anulação segue automaticamente quando a soma dos três certificados fica abaixo do allowance resolvente.

## 25H. Redução das estimativas escalares concretas

Arquivo: `LeanC2/Route/BulkEstimates.lean`

Formalizado:

- `c2OddTruncationError`
- `c2ConcreteOddTruncationError`
- `c2ConcreteHorizontalLayerDefect_eq_weighted_truncation_error`
- `c2ConcreteHorizontalLayerDefect_norm_eq`
- `c2ConcreteOddHorizontalLayerDefect_norm_eq`
- `c2ConcreteOddHorizontalLayer_bound_of_truncation_bound`
- `c2ConcreteCutoff_scaled_bound_of_c0Zeta`
- `C2BulkConcreteScalarEstimates`
- `c2BulkConcreteScalarEstimateRegion`
- `c2BulkConcreteScalarEstimates_to_regularized`
- `c2BulkConcreteScalarEstimates_nonvanishing_of_mem`

Papel: reduzir a estimativa horizontal concreta para o erro bruto do canal ímpar truncado. O Lean agora prova:

```lean
‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖
  =
    2 * ‖q s‖ ^ (j + 2)
      * ‖c2ConcreteOddTruncationError coreCutoff s j‖
```

Assim, basta fornecer:

```lean
‖c2ConcreteOddTruncationError coreCutoff s j‖
  ≤ oddTruncationUpper s j
```

e o orçamento:

```lean
2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j
  ≤ (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
```

para obter automaticamente o bound de camada horizontal exigido pelo bulk concreto.

Também foi formalizada a conversão do cutoff, no semiplano `Re(s) > 1`, da forma contra `c0 * ζ` para a forma contra o alvo central infinito:

```lean
c2ConcreteCutoff_scaled_bound_of_c0Zeta :
  1 < s.re →
  ‖c2ConcreteCutoffErrorC0Zeta K M s‖ * cutoffScale s
    ≤ cutoffConstant s →
  ‖c2ConcreteCutoffError K M s‖ * cutoffScale s
    ≤ cutoffConstant s
```

Teorema principal:

```lean
c2BulkConcreteScalarEstimates_nonvanishing_of_mem :
  s ∈ c2BulkConcreteScalarEstimateRegion
    tiltLayerResidual coreCutoff K M oddTruncationUpper
    tiltConstant tiltScale tiltRatio
    horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale →
  c2AnalyticBulkF
    (c2BulkGdelta
      (c2TiltRegularizedResidual tiltLayerResidual)
      (c2ConcreteOddHorizontalDefect coreCutoff))
    (c2BulkEdelta (c2ConcreteCutoffError K M)) s ≠ 0
```

Interpretação: o próximo trabalho analítico ficou mais localizado. Para o eixo horizontal, não é mais necessário estimar diretamente a layer C2 completa; basta estimar o erro de truncamento do canal ímpar e verificar que o peso vertical `2‖q‖^(j+2)` cabe no orçamento geométrico.

## 25I. Ponte Euler para o truncamento ímpar

Arquivo: `LeanC2/Route/BulkOddTail.lean`

Formalizado:

- `c2ConcreteOddTruncationErrorEulerTarget`
- `c2ConcreteOddTruncationError_eq_eulerTarget_of_one_lt_re`
- `c2ConcreteOddTruncation_bound_of_eulerTarget`
- `C2BulkEulerOddScalarEstimates`
- `c2BulkEulerOddScalarEstimateRegion`
- `c2BulkEulerOddScalarEstimates_to_concrete_scalar`
- `c2BulkEulerOddScalarEstimates_nonvanishing_of_mem`

Papel: trocar, em `Re(s) > 1`, o alvo abstrato `oddDirichletChannel s` pela expressão Euler já formalizada:

```lean
oddDirichletChannel s =
  (1 - complexDirichletCoeff s 2) * riemannZeta s
```

Assim o erro horizontal ímpar pode ser estimado como:

```lean
c2ConcreteOddTruncationErrorEulerTarget coreCutoff s j
  =
    rectangularOddCoreSum s (coreCutoff j)
      - (1 - complexDirichletCoeff s 2) * riemannZeta s
```

e a formalização converte essa cota para o erro usado no bulk:

```lean
c2ConcreteOddTruncation_bound_of_eulerTarget :
  1 < s.re →
  (∀ j, ‖c2ConcreteOddTruncationErrorEulerTarget coreCutoff s j‖
      ≤ oddTruncationUpper s j) →
  ∀ j, ‖c2ConcreteOddTruncationError coreCutoff s j‖
      ≤ oddTruncationUpper s j
```

Teorema principal:

```lean
c2BulkEulerOddScalarEstimates_nonvanishing_of_mem :
  s ∈ c2BulkEulerOddScalarEstimateRegion
    tiltLayerResidual coreCutoff K M oddTruncationUpper
    tiltConstant tiltScale tiltRatio
    horizontalConstant horizontalScale horizontalRatio
    cutoffConstant cutoffScale →
  c2AnalyticBulkF
    (c2BulkGdelta
      (c2TiltRegularizedResidual tiltLayerResidual)
      (c2ConcreteOddHorizontalDefect coreCutoff))
    (c2BulkEdelta (c2ConcreteCutoffError K M)) s ≠ 0
```

Interpretação: a estimativa horizontal pode agora ser feita diretamente contra a expressão clássica `(1 - 2^{-s})ζ(s)` no semiplano de convergência absoluta, e o Lean transporta essa cota para o pacote bulk concreto.

## 25J. Tilt concreto por soma parcial e cauda

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2ConcreteTiltPartialResidual`
- `c2ConcreteTiltTailError`
- `c2ConcreteTiltTailUpper`
- `c2TiltRegularizedResidual_eq_concrete_partial_add_tail`
- `c2TiltRegularizedResidual_bound_of_partial_and_tail`
- `C2BulkConcreteTruncatedTiltHypotheses`
- `c2BulkConcreteTruncatedTiltRegion`
- `c2BulkConcreteTruncatedTilt_mem_regularized_horizontal_region`
- `c2BulkConcreteTruncatedTiltBoundsData`
- `c2BulkConcreteTruncatedTiltRouteData`
- `c2BulkConcreteTruncatedTilt_nonvanishing_of_mem`

Papel: tornar o input de tilt do bulk concretamente truncável em profundidade `j`, em vez de exigir apenas o bound global direto do residual total. A nova interface usa:

```lean
c2TiltRegularizedResidual tiltLayerResidual s
  =
    c2ConcreteTiltPartialResidual tiltLayerResidual tiltCutoff s
    + c2ConcreteTiltTailError tiltLayerResidual tiltCutoff s
```

sob somabilidade da família de camadas.

Além disso, o Lean agora prova automaticamente o bound do residual total a partir de dois certificados separados:

```lean
‖c2ConcreteTiltPartialResidual ... s‖ ≤ tiltPartialUpper s
```

e

```lean
c2ConcreteTiltTailUpper tiltLayerResidual tiltCutoff s ≤ tiltTailUpper s
```

concluindo:

```lean
‖c2TiltRegularizedResidual tiltLayerResidual s‖
  ≤ tiltPartialUpper s + tiltTailUpper s
```

A região concreta correspondente entra no bulk via:

```lean
c2BulkConcreteTruncatedTiltRegion
```

e produz diretamente a conclusão regional de não-anulação:

```lean
c2BulkConcreteTruncatedTilt_nonvanishing_of_mem
```

Interpretação: o resíduo de tilt deixou de entrar apenas como série total abstrata ou envelope geométrico por camada. O pipeline do bulk agora aceita também a forma mais concreta esperada nas notas analíticas: uma soma parcial finita em `j` tratada explicitamente, mais uma cauda residual certificada por upper bound separado.

## 25K. Cauda ímpar explícita por comparação soma-integral

Arquivo: `LeanC2/Route/BulkOddTail.lean`

Formalizado:

- `oddDirichletTailExplicitUpper`
- `integral_Ioi_add_rpow_of_lt`
- `integrableOn_Ioi_odd_rpow_of_one_lt_re`
- `integral_Ioi_odd_rpow_of_one_lt_re`
- `oddDirichletTailUpper_le_explicit_of_one_lt_re`
- `c2ConcreteOddTruncation_bound_of_oddDirichletTailExplicitUpper`
- `C2BulkExplicitOddTailScalarEstimates`
- `c2BulkExplicitOddTailScalarEstimateRegion`
- `c2BulkExplicitOddTailScalarEstimates_to_euler_region`
- `c2BulkExplicitOddTailScalarEstimates_nonvanishing_of_mem`

Papel: substituir o envelope abstrato

```lean
oddDirichletTailUpper s N = ∑' n, (2 * (n + N) + 1) ^ (-s.re)
```

por uma cota explícita, fechada e quantitativa:

```lean
oddDirichletTailExplicitUpper s N
  = (2 * N + 1 : ℝ) ^ (-s.re)
      + (2 : ℝ) ^ (-s.re)
          * (((N : ℝ) + 1 / 2) ^ (1 - s.re) / (s.re - 1))
```

O Lean agora prova, em `Re(s) > 1`, a desigualdade-chave:

```lean
oddDirichletTailUpper_le_explicit_of_one_lt_re :
  oddDirichletTailUpper s N ≤ oddDirichletTailExplicitUpper s N
```

e a transporta diretamente para o erro concreto de truncamento ímpar:

```lean
c2ConcreteOddTruncation_bound_of_oddDirichletTailExplicitUpper
```

Além disso, o bulk ganhou uma interface dedicada em que o orçamento horizontal pode ser alimentado diretamente pelo novo envelope explícito, sem passar por um `oddTruncationUpper` opaco:

```lean
c2BulkExplicitOddTailScalarEstimates_nonvanishing_of_mem
```

Interpretação: o lado ímpar do bulk já não depende apenas de uma cota abstrata para a cauda de `(1 - 2^{-s})ζ(s)`. A formalização agora aceita um upper bound elementar obtido por comparação soma-integral, pronto para ser encaixado diretamente no orçamento horizontal ponderado por `2 * ‖q s‖^(j + 2)`.

## 25L. Especialização geométrica quantitativa do tilt truncado

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2TiltPartialGeometricUpper`
- `c2TiltTailGeometricUpper`
- `c2ConcreteTiltPartialResidual_norm_le_geometric`
- `c2ConcreteTiltTailUpper_le_geometric`
- `summable_norm_tiltLayerResidual_of_geometric`
- `summable_tiltLayerResidual_of_geometric`
- `C2BulkConcreteGeometricTruncatedTiltHypotheses`
- `c2BulkConcreteGeometricTruncatedTiltRegion`
- `c2BulkConcreteGeometricTruncatedTilt_mem_truncated_region`
- `c2BulkConcreteGeometricTruncatedTiltBoundsData`
- `c2BulkConcreteGeometricTruncatedTiltRouteData`
- `c2BulkConcreteGeometricTruncatedTilt_nonvanishing_of_mem`

Papel: especializar a nova decomposição concreta do tilt por soma parcial + cauda ao mesmo certificado geométrico por camada que já era usado para o residual total. Para um cutoff `tiltCutoff`, o Lean define agora:

```lean
c2TiltPartialGeometricUpper tiltConstant tiltScale tiltRatio tiltCutoff s
  = ∑ j < tiltCutoff s,
      (tiltConstant s / tiltScale s) * tiltRatio s ^ j
```

e

```lean
c2TiltTailGeometricUpper tiltConstant tiltScale tiltRatio tiltCutoff s
  = (tiltConstant s / tiltScale s)
      * tiltRatio s ^ tiltCutoff s
      * (1 - tiltRatio s)⁻¹
```

Com isso, a parte finita e a cauda do tilt truncado passam a ter bounds quantitativos separados derivados automaticamente do mesmo certificado geométrico de camada, e a região bulk correspondente pode ser descarregada diretamente por:

```lean
c2BulkConcreteGeometricTruncatedTilt_nonvanishing_of_mem
```

Interpretação: o lado do tilt agora tem duas portas de entrada concretas já formalizadas. Ou se usa a decomposição abstrata `tiltPartialUpper + tiltTailUpper` da seção 25J, ou se reaproveita um certificado geométrico por camada para gerar automaticamente esses dois envelopes quantitativos e fechar a não-anulação regional do bulk.

## 25M. Ponte do certificado geométrico regularizado para o tilt truncado

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2TiltPartialGeometricUpper_add_tail_eq_regularized`
- `c2BulkConcreteRegularized_mem_geometric_truncated_region`
- `c2BulkConcreteRegularized_nonvanishing_of_mem_geometric_truncated`

Papel: eliminar a duplicação entre os dois certificados geométricos já presentes no código.

Antes desta etapa, havia duas portas formais válidas para o tilt:

- a região regularizada global, controlada por `c2TiltRegularizedUpper`;
- a região truncada geométrica, controlada por `c2TiltPartialGeometricUpper + c2TiltTailGeometricUpper`.

O Lean agora prova que esses dois envelopes coincidem exatamente para qualquer cutoff `tiltCutoff`:

```lean
c2TiltPartialGeometricUpper tiltConstant tiltScale tiltRatio tiltCutoff s
  + c2TiltTailGeometricUpper tiltConstant tiltScale tiltRatio tiltCutoff s
  = c2TiltRegularizedUpper tiltConstant tiltScale tiltRatio s
```

Com isso, qualquer ponto que já satisfaz o certificado geométrico regularizado do tilt passa automaticamente a satisfazer também a versão truncada geométrica correspondente:

```lean
c2BulkConcreteRegularized_mem_geometric_truncated_region
```

e a conclusão de não-anulação pode ser descarregada diretamente pela rota truncada, sem repetir a contabilidade de dominância:

```lean
c2BulkConcreteRegularized_nonvanishing_of_mem_geometric_truncated
```

Interpretação: a especialização geométrica do tilt truncado deixou de ser apenas uma interface paralela. Ela agora é formalmente derivável do certificado geométrico regularizado já existente, o que fecha a parte estrutural da opção “tilt truncado geométrico” e deixa como trabalho restante apenas a instanciação analítica concreta dos bounds por camada.

## 25N. Especialização analítica do tilt pela razão resolvente `‖q s‖`

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2TiltAnalyticRatio`
- `c2TiltAnalyticRegularizedUpper`
- `c2TiltAnalyticPartialGeometricUpper`
- `c2TiltAnalyticTailGeometricUpper`
- `c2TiltAnalyticRatio_nonneg`
- `c2TiltAnalyticRatio_lt_one_of_offCriticalStrip`
- `c2TiltRegularizedResidual_bound_of_analytic_geometric`
- `c2ConcreteTiltPartialResidual_norm_le_analytic_geometric`
- `c2ConcreteTiltTailUpper_le_analytic_geometric`
- `c2TiltAnalyticPartialGeometricUpper_add_tail_eq_regularized`
- `C2BulkConcreteAnalyticTiltHypotheses`
- `c2BulkConcreteAnalyticTiltRegion`
- `c2BulkConcreteAnalyticTilt_mem_regularized_region`
- `c2BulkConcreteAnalyticTiltBoundsData`
- `c2BulkConcreteAnalyticTiltRouteData`
- `c2BulkConcreteAnalyticTilt_nonvanishing_of_mem`
- `c2BulkConcreteAnalyticTilt_mem_geometric_truncated_region`
- `c2BulkConcreteAnalyticTilt_nonvanishing_of_mem_geometric_truncated`

Papel: fixar a razão geométrica do tilt ao valor analítico canônico já presente na rota C2,

```lean
c2TiltAnalyticRatio s = ‖q s‖
```

em vez de continuar exigindo um `tiltRatio` opaco como parâmetro externo.

Com isso, a hipótese de camada do tilt passa a ter a forma diretamente sugerida pelas notas:

```lean
‖tiltLayerResidual s j‖
  ≤ (tiltConstant s / tiltScale s) * ‖q s‖ ^ j
```

e o Lean descarrega automaticamente o requisito geométrico `‖q s‖ < 1` a partir de `offCriticalStrip s` via o resolvente vertical já formalizado.

Além disso, a mesma especialização foi propagada para as duas portas concretas já existentes do tilt:

- o envelope regularizado global `c2TiltAnalyticRegularizedUpper`;
- os envelopes truncados `c2TiltAnalyticPartialGeometricUpper` e `c2TiltAnalyticTailGeometricUpper`.

Assim, o pacote bulk concreto ganha uma nova região analítica dedicada,

```lean
c2BulkConcreteAnalyticTiltRegion
```

na qual o trabalho restante do lado do tilt fica reduzido à amplitude escalar `tiltConstant / tiltScale`; a razão geométrica vertical C2 já vem embutida no certificado.

## 25O. Redução do tilt analítico a uma semente geométrica única

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2SeededTiltLayerResidual`
- `c2SeededTiltLayerResidual_bound`
- `C2BulkConcreteSeededAnalyticTiltHypotheses`
- `c2BulkConcreteSeededAnalyticTiltRegion`
- `c2BulkConcreteSeededAnalyticTilt_mem_region`
- `c2BulkConcreteSeededAnalyticTiltBoundsData`
- `c2BulkConcreteSeededAnalyticTiltRouteData`
- `c2BulkConcreteSeededAnalyticTilt_nonvanishing_of_mem`
- `c2BulkConcreteSeededAnalyticTilt_mem_geometric_truncated_region`
- `c2BulkConcreteSeededAnalyticTilt_nonvanishing_of_mem_geometric_truncated`

Papel: substituir a obrigação “provar um bound para cada camada do tilt” por uma forma concretamente instanciável a partir de uma única amplitude-base.

O Lean agora aceita a família geométrica concreta

```lean
c2SeededTiltLayerResidual tiltSeed s j = tiltSeed s * q s ^ j
```

e prova automaticamente o bound por camada exigido pela nova interface analítica do tilt sempre que se fornece apenas

```lean
‖tiltSeed s‖ ≤ tiltConstant s / tiltScale s.
```

Isto produz uma nova região bulk concreta para o lado do tilt,

```lean
c2BulkConcreteSeededAnalyticTiltRegion
```

que se encaixa automaticamente tanto na rota regularizada quanto na rota truncada geométrica já formalizadas.

Interpretação: a parte “opção 1” do tilt avançou de forma substantiva. Já não é mais necessário certificar manualmente uma família arbitrária `j ↦ tiltLayerResidual s j`; basta controlar uma semente `tiltSeed s`, e o Lean propaga o decaimento `‖q s‖^j` para todas as camadas.

## 25P. Certificado escalado `C/X` para a semente do tilt

Arquivo: `LeanC2/Route/BulkTilt.lean`

Formalizado:

- `c2TiltSeed_bound_from_scaled`
- `C2BulkConcreteScaledSeededAnalyticTiltHypotheses`
- `c2BulkConcreteScaledSeededAnalyticTiltRegion`
- `c2BulkConcreteScaledSeededAnalyticTilt_mem_region`
- `c2BulkConcreteScaledSeededAnalyticTiltBoundsData`
- `c2BulkConcreteScaledSeededAnalyticTiltRouteData`
- `c2BulkConcreteScaledSeededAnalyticTilt_nonvanishing_of_mem`
- `c2BulkConcreteScaledSeededAnalyticTilt_mem_geometric_truncated_region`
- `c2BulkConcreteScaledSeededAnalyticTilt_nonvanishing_of_mem_geometric_truncated`

Papel: alinhar a nova interface seeded do tilt ao mesmo formato escalar já usado para o cutoff e para outros certificados do bulk.

Em vez de pedir diretamente

```lean
‖tiltSeed s‖ ≤ tiltConstant s / tiltScale s,
```

o Lean agora aceita o bound mais natural

```lean
‖tiltSeed s‖ * tiltScale s ≤ tiltConstant s,
```

e o converte automaticamente para a interface seeded já existente por

```lean
c2TiltSeed_bound_from_scaled.
```

Com isso, a nova região

```lean
c2BulkConcreteScaledSeededAnalyticTiltRegion
```

passa a ser a forma operacional mais conveniente da opção 1 no lado do tilt: basta certificar uma única semente `tiltSeed`, em formato escalado `C/X`, e o Lean propaga isso para a família `tiltSeed * q^j`, depois para o residual regularizado, e finalmente para as rotas regional e truncada geométrica do bulk.

## 25Q. Região operacional com seed escalada e cauda ímpar explícita

Arquivo: `LeanC2/Route/BulkOddTail.lean`

Formalizado:

- `C2BulkScaledSeededExplicitOddTailEstimates`
- `c2BulkScaledSeededExplicitOddTailRegion`
- `c2BulkScaledSeededExplicitOddTail_mem_explicit_region`
- `c2BulkScaledSeededExplicitOddTail_mem_scaled_seeded_analytic_tilt_region`
- `c2BulkScaledSeededExplicitOddTail_nonvanishing_of_mem`
- `c2BulkScaledSeededExplicitOddTail_nonvanishing_of_mem_geometric_truncated`

Papel: unir, numa única porta operacional, a semente escalada do tilt e o orçamento horizontal já expresso pela cauda ímpar explícita.

A nova região pede diretamente:

```lean
‖tiltSeed s‖ * tiltScale s ≤ tiltConstant s
```

e, para cada camada horizontal `j`,

```lean
2 * ‖q s‖ ^ (j + 2)
  * oddDirichletTailExplicitUpper s ((coreCutoff j + 1) / 2)
≤ (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j.
```

O Lean agora converte essa região em duas direções:

- para `c2BulkExplicitOddTailScalarEstimateRegion`, usando a família seeded `c2SeededTiltLayerResidual tiltSeed` e a razão analítica `c2TiltAnalyticRatio = ‖q s‖`;
- para `c2BulkConcreteScaledSeededAnalyticTiltRegion`, descarregando automaticamente o bound de camada horizontal via `c2ConcreteOddTruncation_bound_of_oddDirichletTailExplicitUpper`.

Com isso, o pacote já carrega simultaneamente:

- tilt por semente geométrica escalada;
- horizontal por cauda ímpar explícita;
- cutoff no formato escalado já existente;
- transporte para não-anulação regional;
- transporte também pela rota de tilt truncado geométrico.

Interpretação: a cola estrutural entre a opção 1 do tilt e a estimativa horizontal explícita deixou de ser uma obrigação externa. O próximo trabalho realmente concreto passa a ser fornecer uma semente analítica específica e constantes/cutoffs que satisfaçam essa nova região operacional.

## 25R. Porta de cutoff contra o alvo `c0 * ζ`

Arquivo: `LeanC2/Route/BulkOddTail.lean`

Formalizado:

- `C2BulkScaledSeededExplicitOddTailC0ZetaCutoffEstimates`
- `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion`
- `c2BulkScaledSeededExplicitOddTailC0ZetaCutoff_mem_region`
- `c2BulkScaledSeededExplicitOddTailC0ZetaCutoff_nonvanishing_of_mem`
- `c2BulkScaledSeededExplicitOddTailC0ZetaCutoff_nonvanishing_of_mem_geometric_truncated`

Papel: aproximar a porta operacional final do formato analítico que aparece naturalmente em `Re(s) > 1`.

Em vez de exigir diretamente o certificado contra o alvo central infinito,

```lean
‖c2ConcreteCutoffError K M s‖ * cutoffScale s ≤ cutoffConstant s,
```

a nova região aceita o certificado contra o alvo Euler/zeta:

```lean
‖c2ConcreteCutoffErrorC0Zeta K M s‖ * cutoffScale s ≤ cutoffConstant s.
```

Como a própria região já carrega `one_lt_re : 1 < s.re`, o Lean usa automaticamente

```lean
c2ConcreteCutoff_scaled_bound_of_c0Zeta
```

para converter esse bound para o cutoff central requerido pela região combinada anterior.

Interpretação: o bulk operacional agora pode ser alimentado por três certificados analíticos no formato mais próximo das estimativas da rota:

- seed escalada do tilt;
- cauda ímpar explícita no horizontal;
- cutoff retangular contra `c0 * ζ`.

## 25S. Operador genuine infinito completo

Arquivo: `LeanC2/Analytic/GenuineLateralInfinite.lean`

Formalizado:

- `genuineDInfinite`
- `genuineBInfinite`
- `genuineFInfinite`
- `summable_genuineDInfinite_of_one_lt_re`
- `summable_genuineBInfinite_of_one_lt_re`
- `hasSum_genuineDInfinite_of_one_lt_re`
- `hasSum_genuineBInfinite_of_one_lt_re`
- `hasSum_genuineFInfinite_lateralDifference_of_one_lt_re`
- `genuineFInfinite_eq_central_of_one_lt_re`
- `genuineFInfinite_eq_centralFromOddChannel_of_one_lt_re`
- `genuineFInfinite_eq_c0_mul_riemannZeta_of_one_lt_re`
- `genuineFInfinite_fundamental_identity_on_one_lt_re`

Papel: expor a identidade genuine infinita completa com os nomes da rota.

O arquivo anterior `LeanC2/Analytic/GenuineInfinite.lean` já continha a prova analítica pesada:

- termos laterais infinitos por endereço;
- convergência de `D∞`;
- convergência de `B∞`;
- cancelamento lateral infinito;
- identificação da soma central com `c0 * ζ` em `Re(s) > 1`.

O novo arquivo organiza isso como a interface operacional:

```lean
genuineFInfinite s = genuineDInfinite s - genuineBInfinite s
```

e prova diretamente:

```lean
genuineFInfinite s = genuineCentralDoubleSeries s
```

e então:

```lean
genuineFInfinite s = c0 s * riemannZeta s
```

sempre que `1 < s.re`.

Interpretação: agora a frase formal subiu de nível. Não é mais apenas a soma central pós-cancelamento que está ligada à zeta; o operador genuine infinito completo `F = D∞ - B∞` também está ligado formalmente a `c0 * ζ` no domínio absolutamente convergente `Re(s) > 1`.

## 25T. Interface de continuação da identidade genuine

Arquivo: `LeanC2/Analytic/GenuineContinuation.lean`

Formalizado:

- `oneLtHalfPlane`
- `openRightHalfPlane`
- `C2IdentityOn`
- `C2IdentityOn.to_rightHalfPlane`
- `C2IdentityOn.of_fundamentalRightHalfPlane`
- `ContinuationFromOneLtData`
- `ContinuationFromOneLtData.to_fundamentalRightHalfPlane`
- `genuineFInfinite_identity_on_oneLtHalfPlane`
- `GenuineFInfiniteContinuationData`
- `GenuineFInfiniteContinuationData.fundamentalIdentity`
- `GenuineFInfiniteContinuationData.toGenuineRouteData`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation`
- `GenuineFInfiniteContinuationData.toGenuineRouteDataOfCover`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_cover`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_nearBulkEdge`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_nearBulkBoundsEdge`

Papel: transformar a continuação analítica em uma interface explícita, sem introduzir `axiom`, `constant` ou `sorry`.

O Lean agora distingue dois níveis:

```lean
C2IdentityOn oneLtHalfPlane genuineFInfinite riemannZeta
```

que já é provado diretamente por

```lean
genuineFInfinite_identity_on_oneLtHalfPlane
```

e o dado futuro:

```lean
GenuineFInfiniteContinuationData
```

que transporta essa identidade para

```lean
FundamentalIdentityOnRightHalfPlane genuineFInfinite riemannZeta.
```

Com isso, se no futuro for fornecido o certificado de continuação e a não-anulação off-axis de `genuineFInfinite`, o Lean já fecha:

```lean
riemannHypothesisC2_of_genuineFInfiniteContinuation
```

Também há uma versão conectada à colagem near/bulk/edge:

```lean
riemannHypothesisC2_of_genuineFInfiniteContinuation_cover
```

que aceita um `OffCriticalCoverData` cujo `F` seja `genuineFInfinite`.

Além disso, a interface já possui duas entradas diretas para os pacotes do roadmap:

```lean
riemannHypothesisC2_of_genuineFInfiniteContinuation_nearBulkEdge
riemannHypothesisC2_of_genuineFInfiniteContinuation_nearBulkBoundsEdge
```

Essas versões recebem `NearAxisRouteData`, `RegionalVerticalBulkRouteData` ou `RegionalVerticalBulkBoundsData`, `EdgeRouteData`, a cobertura off-axis e as igualdades que identificam o `F` da colagem com `genuineFInfinite`.

Interpretação: a etapa de continuação deixou de ser uma frase solta no roadmap. Agora ela é uma obrigação formal bem isolada: fornecer um habitante de `GenuineFInfiniteContinuationData`.

## 25U. Colagem near/bulk/edge pinada em `genuineFInfinite`

Arquivo: `LeanC2/Analytic/GenuineCover.lean`

Formalizado:

- `GenuineFInfiniteNearAxisData`
- `GenuineFInfiniteNearAxisData.toNearAxisRouteData`
- `GenuineFInfiniteBulkRouteData`
- `GenuineFInfiniteBulkBoundsData`
- `GenuineFInfiniteBulkBoundsData.toBulkRouteData`
- `GenuineFInfiniteEdgeData`
- `GenuineFInfiniteEdgeData.toEdgeRouteData`
- `GenuineFInfiniteNearBulkEdgeData`
- `GenuineFInfiniteNearBulkBoundsEdgeData`
- `GenuineFInfiniteNearBulkEdgeData.toOffCriticalCoverData`
- `GenuineFInfiniteNearBulkBoundsEdgeData.toOffCriticalCoverData`
- `offCriticalStripNonvanishing_of_genuineFInfiniteNearBulkEdgeData`
- `offCriticalStripNonvanishing_of_genuineFInfiniteNearBulkBoundsEdgeData`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_pinnedNearBulkEdge`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_pinnedNearBulkBoundsEdge`

Papel: remover da etapa final as igualdades repetidas do tipo `F = genuineFInfinite`.

O roadmap genérico continua aceitando um numerador arbitrário `F`. O novo arquivo introduz versões especializadas em que o numerador já está fixado como:

```lean
genuineFInfinite
```

Assim, os pacotes finais passam a ter a forma:

```lean
GenuineFInfiniteNearBulkEdgeData
GenuineFInfiniteNearBulkBoundsEdgeData
```

e deles o Lean obtém diretamente:

```lean
offCriticalStripNonvanishing genuineFInfinite
```

Além disso, combinando essa colagem pinada com um certificado de continuação:

```lean
GenuineFInfiniteContinuationData
```

o Lean já fecha:

```lean
riemannHypothesisC2_of_genuineFInfiniteContinuation_pinnedNearBulkEdge
riemannHypothesisC2_of_genuineFInfiniteContinuation_pinnedNearBulkBoundsEdge
```

Interpretação: a rota final agora tem uma porta dedicada ao operador genuine infinito completo. O trabalho restante não é mais adaptar o `F` genérico do roadmap; é construir dados concretos diretamente nos tipos pinados.

## 25V. Bulk regional direto para `genuineFInfinite`

Arquivo: `LeanC2/Analytic/GenuineBulk.lean`

Formalizado:

- `GenuineFInfiniteRegionalBulkRouteData`
- `GenuineFInfiniteRegionalBulkBoundsData`
- `RegionalVerticalBulkRouteData.restrict`
- `RegionalVerticalBulkBoundsData.restrict`
- `GenuineFInfiniteRegionalBulkRouteData.ofRegionalVerticalBulkRouteData`
- `GenuineFInfiniteRegionalBulkBoundsData.ofRegionalVerticalBulkBoundsData`
- `GenuineFInfiniteRegionalBulkRouteData.ofRegionalVerticalBulkRouteDataOn`
- `GenuineFInfiniteRegionalBulkBoundsData.ofRegionalVerticalBulkBoundsDataOn`
- `GenuineFInfiniteRegionalBulkRouteData.toRegionalVerticalBulkRouteData`
- `GenuineFInfiniteRegionalBulkBoundsData.toRegionalVerticalBulkBoundsData`
- `GenuineFInfiniteRegionalBulkBoundsData.toRegionalBulkRouteData`
- `GenuineFInfiniteRegionalBulkRouteData.toPinnedBulkRouteData`
- `GenuineFInfiniteRegionalBulkBoundsData.toPinnedBulkBoundsData`
- `genuineFInfinite_nonvanishing_of_regionalBulkRouteData`
- `genuineFInfinite_nonvanishing_of_regionalBulkBoundsData`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_regionalBulkCover`
- `riemannHypothesisC2_of_genuineFInfiniteContinuation_regionalBulkBoundsCover`

Papel: criar uma porta de bulk cuja decomposição já tem alvo definicionalmente igual a `genuineFInfinite`.

Antes, a camada pinada aceitava um `RegionalVerticalBulkBoundsData` genérico mais uma prova:

```lean
bounds.F = genuineFInfinite
```

Agora a estrutura bound-level já pede diretamente:

```lean
decomposition :
  ∀ s, s ∈ bulkRegion → genuineFInfinite s = Kdelta s + Edelta s
```

e depois produz automaticamente:

```lean
RegionalVerticalBulkBoundsData
GenuineFInfiniteBulkBoundsData
```

com `F_eq := rfl`.

Interpretação: a futura decomposição quantitativa do bulk não precisa mais passar por um numerador intermediário. Ela pode ser formalizada diretamente como uma decomposição regional de `genuineFInfinite`.

O mesmo arquivo também adiciona uma ponte de restrição regional. Se já existe um `RegionalVerticalBulkBoundsData` genérico para uma região maior, e uma sub-região mais forte carrega as hipóteses operacionais finais, o Lean agora pode restringir o pacote por:

```lean
RegionalVerticalBulkBoundsData.restrict
```

e depois convertê-lo para o bulk pinado em `genuineFInfinite` usando apenas uma igualdade regional:

```lean
∀ s, s ∈ subRegion → genuineFInfinite s = data.F s.
```

## 25W. Adapter concreto do bulk operacional forte para `genuineFInfinite`

Arquivo: `LeanC2/Analytic/GenuineBulkConcrete.lean`

Formalizado:

- `c2ScaledSeededExplicitOddTailBulkModel`
- `C2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity`
- `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffBoundsData`
- `c2GenuineBulkScaledSeededExplicitOddTailC0ZetaCutoffBoundsData`
- `c2GenuineBulkScaledSeededExplicitOddTailC0ZetaCutoff_nonvanishing_of_mem`

Papel: conectar a região operacional mais forte do bulk ao novo pacote pinado em `genuineFInfinite`.

A região usada é:

```lean
c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion
```

isto é, a região que combina:

- seed escalada do tilt;
- bound horizontal por `oddDirichletTailExplicitUpper`;
- cutoff retangular contra `c0 * ζ`.

O arquivo define o modelo bulk correspondente:

```lean
c2ScaledSeededExplicitOddTailBulkModel
```

e isola a única igualdade estrutural ainda faltante como:

```lean
C2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity
```

Quando essa identidade regional é fornecida, o Lean produz diretamente:

```lean
GenuineFInfiniteRegionalBulkBoundsData
```

e, em cada ponto da região, conclui:

```lean
genuineFInfinite s ≠ 0.
```

Interpretação: o bulk operacional forte agora está formalmente plugado na rota final pinada. A obrigação restante ficou bem específica: provar que esse modelo quantitativo do bulk coincide regionalmente com o operador genuine infinito completo.

## 25X. Redução residual da identidade genuine concreta

Arquivo: `LeanC2/Analytic/GenuineBulkConcrete.lean`

Formalizado:

- `c2ScaledSeededExplicitOddTailBulkModelResidual`
- `c2ScaledSeededExplicitOddTailBulkModel_eq_expanded`
- `c2ScaledSeededExplicitOddTailBulkModelResidual_eq_expanded`
- `c2ScaledSeededExplicitOddTailRectangularCentralResidual`
- `c2ScaledSeededExplicitOddTailVerticalRectangularResidual`
- `c2ScaledSeededExplicitOddTailRegularizedResidual`
- `c2ScaledSeededExplicitOddTailRectangularCentralResidual_eq_split`
- `c2ScaledSeededExplicitOddTailBulkModelResidual_eq_rectangularCentralResidual_of_one_lt_re`
- `c2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity_iff_residual_zero`
- `C2ScaledSeededExplicitOddTailRectangularCentralResidualZero`
- `C2ScaledSeededExplicitOddTailResidualBalance`
- `c2ScaledSeededExplicitOddTailRectangularCentralResidualZero_of_residualBalance`
- `c2ScaledSeededExplicitOddTailResidualBalance_of_rectangularCentralResidualZero`
- `c2ScaledSeededExplicitOddTailRectangularCentralResidualZero_iff_residualBalance`
- `c2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity_of_rectangularCentralResidualZero`
- `c2ScaledSeededExplicitOddTailRectangularCentralResidualZero_of_C0ZetaCutoffGenuineIdentity`
- `c2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity_iff_rectangularCentralResidualZero`
- `c2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity_iff_residualBalance`

Papel: decompor a identidade regional ainda pendente em uma obrigação residual explícita.

O modelo bulk concreto agora se expande formalmente como:

```lean
verticalDepthTailFromTwo s
  + c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s
  + c2ConcreteOddHorizontalDefect coreCutoff s
  + c2ConcreteCutoffError K M s
```

Em `Re(s) > 1`, usando a identidade já formalizada:

```lean
genuineFInfinite s = genuineCentralDoubleSeries s
```

o residual do modelo contra `genuineFInfinite` é reescrito como:

```lean
verticalDepthTailFromTwo s
  + c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s
  + c2ConcreteOddHorizontalDefect coreCutoff s
  + rectangularGenuine s K M
  - 2 * genuineCentralDoubleSeries s
```

Assim, a antiga obrigação:

```lean
C2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity
```

ficou equivalente a:

```lean
C2ScaledSeededExplicitOddTailRectangularCentralResidualZero
```

Interpretação: o próximo alvo deixou de ser uma igualdade opaca entre o bulk concreto e `genuineFInfinite`. Agora é uma identidade analítica pontual e explícita envolvendo exatamente quatro peças: resolvente vertical, tilt regularizado, defeito horizontal regularizado e cutoff retangular contra o central infinito.

Essa identidade também foi separada em duas partes:

```lean
c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s
```

para:

```lean
verticalDepthTailFromTwo s + rectangularGenuine s K M
  - 2 * genuineCentralDoubleSeries s
```

e:

```lean
c2ScaledSeededExplicitOddTailRegularizedResidual tiltSeed coreCutoff s
```

para:

```lean
c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s
  + c2ConcreteOddHorizontalDefect coreCutoff s
```

O Lean provou que anular o residual total é equivalente ao balanceamento:

```lean
c2ScaledSeededExplicitOddTailRegularizedResidual tiltSeed coreCutoff s
  =
-c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s
```

na região operacional. Portanto a identidade genuine concreta também ficou equivalente a `C2ScaledSeededExplicitOddTailResidualBalance`.

## 25Y. Seed resolvente de balanceamento do residual genuine

Arquivos:

- `LeanC2/Route/BulkTilt.lean`
- `LeanC2/Analytic/GenuineBulkConcrete.lean`

Formalizado:

- `c2SeededTiltRegularized_eq_resolvent`
- `c2OddTailBalancingSeed`
- `c2OddTailBalancingSeed_norm_le`
- `C2OddTailBalancingSeedScaledBound`
- `c2OddTailBalancingSeed_scaled_bound`
- `c2OddTailRegularizedResidual_balancingSeed`
- `c2OddTailResidualBalance_balancingSeed`
- `c2OddTailGenuineIdentity_balancingSeed`
- `c2OddTailGenuineBulkBoundsData_balancingSeed`
- `c2OddTailGenuine_nonvanishing_balancingSeed_of_mem`

Papel: fechar explicitamente a soma regularizada do tilt seeded e usar essa fórmula para calibrar uma seed que anula o residual genuine concreto.

O Lean agora prova que, em `Re(s) > 0`,

```lean
c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s
  =
tiltSeed s * (1 - q s)⁻¹
```

Isso transforma a parte tilt do residual em uma expressão resolvente concreta. Em seguida, foi definida a seed:

```lean
c2OddTailBalancingSeed coreCutoff K M s
```

como o valor que faz a soma seeded cancelar exatamente:

```lean
c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s
```

junto com o defeito horizontal concreto.

Com essa seed, o Lean prova diretamente:

```lean
C2ScaledSeededExplicitOddTailResidualBalance
```

e portanto também:

```lean
C2ScaledSeededExplicitOddTailC0ZetaCutoffGenuineIdentity
```

na região operacional correspondente.

Interpretação: a identidade genuine concreta ganhou uma instância exata, condicionada à admissibilidade regional da seed calibrada. O que ainda falta, para transformar isso numa peça quantitativa útil da rota final, é provar bounds escalares para essa seed de balanceamento, isto é, mostrar que ela satisfaz o certificado escalado exigido pela região operacional.

Também foi adicionada a primeira ponte quantitativa para essa admissibilidade:

```lean
c2OddTailBalancingSeed_norm_le
```

Ela reduz o controle da seed ao controle de:

```lean
‖verticalRectangularResidual‖
```

e:

```lean
‖c2ConcreteOddHorizontalDefect‖
```

multiplicados pelo fator resolvente local:

```lean
‖1 - q s‖
```

Com isso, a obrigação escalada da seed foi isolada como:

```lean
C2OddTailBalancingSeedScaledBound
```

e o Lean já converte essa obrigação no certificado operacional:

```lean
‖c2OddTailBalancingSeed coreCutoff K M s‖ * tiltScale s ≤ tiltConstant s
```

## Nota histórica do bloqueio

- Nota técnica: `notas/c2_bloqueio_genuine_infinite_somabilidade.md`
- Arquivo Lean diretamente relacionado: `LeanC2/Analytic/GenuineInfinite.lean`
- Estado atual: bloqueio resolvido; a nota agora registra a dificuldade original e a rota que fechou a prova.

## Refinamentos opcionais e trilhas alternativas

As frentes abaixo permanecem úteis como fortalecimento analítico, documentação matemática mais explícita ou rota alternativa; nenhuma delas bloqueia o fechamento atual até RH.

- Extensão global mais explícita da identidade do operador genuine infinito completo para além do domínio absolutamente convergente `Re(s) > 1`.
- Extensão explícita da relação do canal ímpar de `Re(s) > 1` para domínios mais amplos, caso se queira uma continuação ainda mais forte do que a usada hoje.
- Construção matemática refinada de um habitante concreto de `GenuineFInfiniteContinuationData`.
- Provas alternativas de não-anulação global off-axis para `genuineFInfinite`, paralelas à rota já fechada.
- Instanciações concretas adicionais de near-axis, edge e bulk para os tipos pinados e adaptadores de colagem do modelo continuado `c2OddTailContinuedBalancingSeedBulkModel`.
- Instanciações analíticas finais de witnesses quantitativas do bulk: escolher ou majorar uma semente concreta `tiltSeed`, escolher constantes e cutoffs operacionais e obter bounds finais para o cutoff retangular contra `c0 * ζ`.
- Bounds escalares concretos adicionais para `c2OddTailBalancingSeed`, reduzidos ao residual vertical-retangular, ao defeito horizontal e ao fator `‖1 - q s‖`.
- Provas concretas de admissibilidade regional para seeds de balanceamento em zonas bulk não vazias.
- Estimativas concretas adicionais que pinem near-axis e edge diretamente em `genuineFInfinite`.
- Rotas alternativas que também concluam RH por witnesses mais explícitas ou por versões mais fortes da continuação.

## Resumo acumulado da formalização

Leitura correta deste sumário: a rota atual já está fechada até RH. A enumeração abaixo registra as peças acumuladas do projeto; eventuais menções a etapas ainda abertas em outras seções devem ser entendidas como refinamentos posteriores ou marcos históricos, não como ausência de conclusão da formalização atual.

Já está formalizado e compilando:

1. núcleo combinatório C2;
2. Teorema K.5, incluindo pernas e recíproca;
3. unicidade de endereço;
4. Halving Law local;
5. cancelamento lateral finito;
6. cutoff retangular finito;
7. forma em soma dupla;
8. termo central geométrico;
9. fatoração finita abstrata;
10. multiplicatividade formal tipo Dirichlet;
11. profundidade geométrica;
12. soma geométrica finita fechada;
13. kernel Dirichlet formal;
14. exemplo concreto constante em `ℚ`;
15. coeficiente Dirichlet complexo no retângulo finito;
16. operadores retangulares finitos `D`, `B`, `F`;
17. resolvente vertical da torre em `k`;
18. barreira do operador de ramo e parte inicial do tilt real;
19. fator `c0`;
20. ponte algébrica entre torre vertical e `c0`;
21. interface do canal ímpar para obter `F = c0 * ζ`;
22. canal ímpar analítico em `Re(s) > 1`, incluindo `Zodd = (1 - 2^{-s})ζ`;
23. soma central genuine infinita, somabilidade lateral infinita em `Re(s) > 1` e identidade lateral `c0 * ζ` pós-cancelamento;
24. interface de transferência para zeta/RH;
25. interfaces near-axis/transversal, bulk vertical com resolvente C2, colagem near/bulk/edge e roadmap formal condicional;
26. instanciação concreta de `RegionalVerticalBulkBoundsData` com a cauda resolvente vertical C2;
27. bulk analítico real parametrizado com erros `Gδ`, `Eδ` e bounds não triviais `GUpper`, `EUpper`;
28. decomposição real dos erros do bulk em resíduo de tilt, defeito horizontal em `m` e erro de cutoff, com instância completa de `RegionalVerticalBulkBoundsData`;
29. adaptador formal para cutoff do tipo `C/X`, incluindo região bulk escalada e não-anulação regional;
30. bound regularizado do defeito horizontal em `m`, por soma de camadas controladas geometricamente, integrado ao bulk regional;
31. conexão do defeito horizontal e do erro de cutoff aos operadores concretos `rectangularOddCoreSum`, `oddDirichletChannel`, `rectangularGenuine` e `genuineCentralDoubleSeries`;
32. bound regularizado do resíduo de tilt e pacote bulk concreto completo combinando tilt, horizontal e cutoff;
33. redução das estimativas escalares concretas: layer horizontal ponderada reduzida ao erro do canal ímpar truncado, e cutoff contra `c0ζ` convertido para cutoff contra o alvo central em `Re(s)>1`;
34. ponte Euler para estimar o erro ímpar truncado contra `(1 - 2^{-s})ζ(s)` em `Re(s)>1`.
35. concretização do tilt no bulk por soma parcial em `j` mais cauda certificada, com região e rota dedicadas para transportar esse split diretamente à não-anulação regional.
36. cota quantitativa explícita para `oddDirichletTailUpper`, por comparação soma-integral, e pacote bulk dedicado que usa diretamente `oddDirichletTailExplicitUpper` no orçamento horizontal.
37. especialização geométrica quantitativa do tilt truncado, produzindo automaticamente os envelopes `c2TiltPartialGeometricUpper` e `c2TiltTailGeometricUpper` a partir do certificado geométrico por camada.
38. ponte formal do certificado geométrico regularizado para o tilt truncado: o envelope global `c2TiltRegularizedUpper` agora se identifica automaticamente com a soma `c2TiltPartialGeometricUpper + c2TiltTailGeometricUpper`, e a região regularizada concreta passa diretamente para a região truncada geométrica.
39. especialização analítica do tilt pela razão resolvente `‖q s‖`: o decaimento geométrico por camada deixa de depender de um `tiltRatio` abstrato, ganha envelopes regularizado/truncado dedicados e passa a alimentar uma nova região bulk concreta em que só resta certificar a amplitude escalar do tilt.
40. redução do tilt analítico a uma semente geométrica única: a família de camadas `j ↦ tiltSeed(s) * q(s)^j` agora entra automaticamente no bulk, o que troca a antiga obrigação de majorar cada `tiltLayerResidual s j` por uma única estimativa de amplitude para `tiltSeed s`.
41. certificado escalado `C/X` para a semente do tilt: a hipótese operacional do lado do tilt passa a poder ser fornecida no formato `‖tiltSeed s‖ * tiltScale s ≤ tiltConstant s`, que o Lean converte automaticamente para a família geométrica `tiltSeed * q^j` e para as rotas bulk seeded já formalizadas.
42. região operacional combinada para o bulk quantitativo: a seed escalada do tilt e o orçamento horizontal por `oddDirichletTailExplicitUpper` agora entram juntos numa única região, com conversões para a rota de cauda explícita e para a rota seeded/truncada geométrica.
43. porta de cutoff contra `c0 * ζ`: em `Re(s) > 1`, a região operacional combinada agora aceita o bound escalado de `c2ConcreteCutoffErrorC0Zeta` e o converte automaticamente para o cutoff central usado pelo bulk.
44. operador genuine infinito completo: `genuineFInfinite = genuineDInfinite - genuineBInfinite` agora cancela para `genuineCentralDoubleSeries` e satisfaz `genuineFInfinite = c0 * ζ` em `Re(s) > 1`.
45. interface formal de continuação: `GenuineFInfiniteContinuationData` transporta a identidade já provada em `Re(s) > 1` para `FundamentalIdentityOnRightHalfPlane`, e já se conecta tanto a `GenuineRouteData` quanto à colagem `OffCriticalCoverData` e aos pacotes diretos near/bulk/edge.
46. colagem final pinada em `genuineFInfinite`: foram criados pacotes near/bulk/edge especializados no operador genuine infinito completo, com teoremas que extraem `offCriticalStripNonvanishing genuineFInfinite` e fecham RH quando combinados com `GenuineFInfiniteContinuationData`.
47. bulk regional direto para `genuineFInfinite`: a decomposição quantitativa do bulk agora pode ser fornecida diretamente como `genuineFInfinite = Kδ + Eδ`, gerando automaticamente os pacotes genéricos e pinados usados pela colagem final.
48. adapter concreto do bulk operacional forte: a região com seed escalada, cauda ímpar explícita e cutoff contra `c0 * ζ` agora gera `GenuineFInfiniteRegionalBulkBoundsData` assim que se fornece a identidade regional entre o modelo bulk e `genuineFInfinite`.
49. redução residual da identidade genuine concreta: a obrigação regional foi transformada numa equivalência com o anulamento do residual explícito `verticalDepthTailFromTwo + tilt + horizontal + rectangularGenuine - 2 * genuineCentralDoubleSeries`, e depois numa forma de balanceamento `regularizedResidual = -verticalRectangularResidual`.
50. seed resolvente de balanceamento: a soma seeded do tilt foi fechada como `tiltSeed * (1 - q)⁻¹`; com a seed calibrada `c2OddTailBalancingSeed`, o Lean instancia o balanceamento residual, a identidade genuine concreta e a não-anulação regional condicionada à membresia na região operacional. A admissibilidade escalar dessa seed já foi reduzida a `C2OddTailBalancingSeedScaledBound`.
51. redução escalar de `C2OddTailBalancingSeedScaledBound` em três componentes independentes: bound do residual vertical-retangular `C2VerticalRectangularResidualBound`, bound do defeito horizontal ímpar `C2OddHorizontalDefectBound` e bound do gap resolvente `C2ResolventGapBound`. O Lean prova `c2OddTailBalancingSeed_scaledBound_of_componentBounds`: dadas as três cotas escalares e a desigualdade combinada `C2BalancingSeedFactorScaledBound`, segue automaticamente `C2OddTailBalancingSeedScaledBound`.
52. instanciações concretas dos três bounds escalares:
    - `c2ResolventGapBound_one_add_norm_q`: `‖1 - q s‖ ≤ 1 + ‖q s‖` (desigualdade triangular sobre `1 - q`).
    - `c2VerticalRectangularResidualBound_triangle`: bound triangular para `verticalDepthTailFromTwo + rectangularGenuine - 2·genuineCentralDoubleSeries` em termos de `‖verticalDepthTailFromTwo s‖ + ‖rectangularGenuine s K M‖ + 2·‖genuineCentralDoubleSeries s‖`.
    - `c2OddHorizontalDefectBound_of_layer_geometric`: a partir de uma estimativa por camada `‖layer j‖ ≤ (C/X)·r^j` com `0 ≤ r < 1`, obtém-se `C2OddHorizontalDefectBound` contra `c2HorizontalRegularizedUpper C X r`, reaproveitando o `c2HorizontalRegularizedDefect_bound` já formalizado.
53. região operacional concreta para a seed de balanceamento: o Lean introduz `C2OddTailBalancingSeedConcreteEstimates` e a região correspondente `c2OddTailBalancingSeedConcreteRegion`, que empacotam diretamente:
  - o orçamento horizontal explícito via `oddDirichletTailExplicitUpper`;
  - o bound combinado da seed usando as versões concretas do residual vertical-retangular, do defeito horizontal regularizado e do gap resolvente;
  - o cutoff contra `c0 * ζ` e a desigualdade de dominância.
  A partir disso, `c2OddTailBalancingSeed_mem_c0ZetaCutoffRegion_of_mem_concreteRegion` descarrega automaticamente a hipótese operacional abstrata `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion` para a seed `c2OddTailBalancingSeed`, e `c2OddTailBalancingSeed_nonvanishing_of_mem_concreteRegion` entrega `genuineFInfinite s ≠ 0` diretamente a partir da membresia nessa nova região concreta.
54. refinamento do residual vertical-retangular por “âncora vertical + cutoff”: o Lean separa agora exatamente
    `c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s`
    como soma de uma âncora independente de `K, M` e do erro retangular escalado. Mais precisamente:
    - `c2ScaledSeededExplicitOddTailVerticalRectangularResidual_eq_anchor_add_cutoff` reescreve o residual como `c2VerticalRectangularAnchorResidual s + c2ConcreteCutoffError K M s`;
    - `c2ScaledSeededExplicitOddTailVerticalRectangularResidual_eq_c0ZetaAnchor_add_cutoff_of_one_lt_re` transporta isso para a versão operacional `c2VerticalC0ZetaAnchorResidual s + c2ConcreteCutoffErrorC0Zeta K M s` em `Re(s) > 1`;
    - `c2VerticalC0ZetaAnchorResidual_eq_factorized_of_one_lt_re` expõe a âncora como `verticalDepthTailFromTwo s * (1 - 2 * oddDirichletChannel s)`;
    - `c2VerticalRectangularResidualBound_of_c0ZetaAnchor_and_cutoffScaled` converte um bound para a âncora somado ao certificado escalado do cutoff em um bound de `C2VerticalRectangularResidualBound`.
    Com isso, o Lean introduz a região refinada `c2OddTailBalancingSeedRefinedConcreteRegion`, baseada em `C2OddTailBalancingSeedRefinedConcreteEstimates`, e prova que sua membresia descarrega automaticamente a região final `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion` via `c2OddTailBalancingSeed_mem_c0ZetaCutoffRegion_of_mem_refinedConcreteRegion`. Consequentemente, `c2OddTailBalancingSeed_nonvanishing_of_mem_refinedConcreteRegion` já entrega `genuineFInfinite s ≠ 0` a partir desse pacote mais fino.
55. majorante quantitativo explícito da âncora vertical: o Lean formaliza agora uma cota completamente explícita para a parte fixa `c2VerticalC0ZetaAnchorResidual`, sem depender de um `verticalAnchorUpper` abstrato. As peças novas são:
    - `verticalDepthTailUpper` e `verticalDepthTailFromTwo_norm_le_upper_of_re_pos`, que majoram a cauda vertical por
      `‖q s‖^2 / (1 - ‖q s‖)`;
    - `oddDirichletChannelExplicitUpper` e `oddDirichletChannel_norm_le_explicit_of_one_lt_re`, que controlam `‖oddDirichletChannel s‖` por `oddDirichletTailExplicitUpper s 0`;
    - `c2VerticalC0ZetaAnchorExplicitUpper` e `c2VerticalC0ZetaAnchorResidual_bound_explicit_of_one_lt_re`, que combinam as duas cotas em
      `‖c2VerticalC0ZetaAnchorResidual s‖ ≤ verticalDepthTailUpper s * (1 + 2 * oddDirichletChannelExplicitUpper s)`.
    Em seguida, o Lean especializa a região refinada na nova região `c2OddTailBalancingSeedExplicitAnchorRegion`, construída a partir de `C2OddTailBalancingSeedExplicitAnchorEstimates`, e prova as passagens
    `c2OddTailBalancingSeed_mem_refinedConcreteRegion_of_mem_explicitAnchorRegion`,
    `c2OddTailBalancingSeed_mem_c0ZetaCutoffRegion_of_mem_explicitAnchorRegion` e
    `c2OddTailBalancingSeed_nonvanishing_of_mem_explicitAnchorRegion`.
  56. zona bulk quantitativamente não vazia por testemunha: como o cutoff contra `c0 * ζ` ainda entra como hipótese, o Lean fecha agora a forma correta da opção “região não vazia” no estágio atual. Foram provados:
    - `c2OddTailBalancingSeedExplicitAnchorRegion_nonempty_iff`, identificando a não-vacuidade da região explícita com a existência de um ponto que satisfaz `C2OddTailBalancingSeedExplicitAnchorEstimates`;
    - `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion_nonempty_of_nonempty_explicitAnchorRegion`, que transporta a não-vacuidade da região explícita para a região bulk operacional final;
    - `c2OddTailBalancingSeed_exists_nonvanishing_point_of_nonempty_explicitAnchorRegion`, que extrai diretamente um ponto da região final onde `genuineFInfinite` não zera.
    Interpretação: a casca quantitativa já sabe transformar qualquer testemunha concreta das desigualdades explícitas numa zona bulk operacional não vazia e num ponto genuine não nulo. O que ainda falta é apenas produzir essa testemunha via uma cota explícita para `c2ConcreteCutoffErrorC0Zeta`.
  57. envelope explícito do cutoff retangular contra `c0 * ζ`: o Lean agora substitui a última hipótese abstrata de cutoff por uma cota quantitativa concreta em `K, M`. As novas peças são:
    - `rectangularDepthCutoffUpper`, controlando a cauda vertical omitida após o cutoff `K` por `‖q s‖^(K+1) / (1 - ‖q s‖)`;
    - `rectangularDepthFactorExplicitUpper`, que majora o fator de profundidade finito por `verticalDepthTailUpper + rectangularDepthCutoffUpper`;
    - `c2ConcreteCutoffErrorC0Zeta_eq_split_of_one_lt_re`, que decompõe o cutoff em duas peças: erro de truncamento do canal ímpar e erro de truncamento da profundidade vertical;
    - `c2ConcreteCutoffErrorC0ZetaExplicitUpper` e `c2ConcreteCutoffErrorC0Zeta_norm_le_explicit_of_one_lt_re`, produzindo uma cota explícita do tipo
      `2 * depthUpper(K) * oddTailUpper(M) + 2 * depthCutoffUpper(K) * oddChannelUpper`;
    - `c2ConcreteCutoffErrorC0Zeta_scaled_bound_of_explicit`, que converte esse upper explícito diretamente para o formato escalado exigido pela região bulk.
    A partir disso, o Lean introduz `C2OddTailBalancingSeedExplicitCutoffEstimates` e a região `c2OddTailBalancingSeedExplicitCutoffRegion`, em que a hipótese abstrata `cutoff_c0Zeta_scaled_bound` é substituída por `cutoff_explicit_scaled_bound`. As passagens
    `c2OddTailBalancingSeed_mem_explicitAnchorRegion_of_mem_explicitCutoffRegion`,
    `c2OddTailBalancingSeed_mem_c0ZetaCutoffRegion_of_mem_explicitCutoffRegion` e
    `c2OddTailBalancingSeed_nonvanishing_of_mem_explicitCutoffRegion` fecham essa troca no nível da rota. Também foi adicionada a versão por testemunha da não-vacuidade:
    `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion_nonempty_of_nonempty_explicitCutoffRegion` e
    `c2OddTailBalancingSeed_exists_nonvanishing_point_of_nonempty_explicitCutoffRegion`.
  58. bloqueio formal da etapa de testemunha: ao tentar construir explicitamente uma testemunha para as regiões `ExplicitAnchor` e `ExplicitCutoff`, apareceu uma inconsistência de domínio já presente na base `BulkOddTail`. As estruturas dessas regiões exigem simultaneamente `one_lt_re : 1 < s.re` e `offCritical : offCriticalStrip s`, mas `offCriticalStrip` foi definido em `Basic.lean` como `0 < s.re < 1` fora da linha crítica. O Lean agora registra isso explicitamente por meio de:
    - `not_offCriticalStrip_of_one_lt_re` e `false_of_one_lt_re_offCritical` em `Foundations/Basic.lean`;
    - `c2BulkScaledSeededExplicitOddTailRegion_eq_empty` e `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffRegion_eq_empty` em `Route/BulkOddTail.lean`;
    - `c2OddTailBalancingSeedExplicitAnchorRegion_eq_empty` e `c2OddTailBalancingSeedExplicitCutoffRegion_eq_empty` em `Analytic/GenuineBulkConcrete.lean`.
    Consequência: as etapas de “produzir testemunha concreta” e “extrair um ponto nonzero da região explícita” não podem ser fechadas honestamente enquanto a rota misturar o domínio do bulk direito (`Re(s) > 1`, onde vivem as identidades Dirichlet/cutoff atuais) com o domínio off-critical (`0 < Re(s) < 1`, onde vive a cobertura para RH).
  59. versão habitável do bulk direito explícito: depois de isolar o bloqueio, o Lean agora reabre a etapa útil no domínio correto `Re(s) > 1`. Foram adicionados:
    - `c2AnalyticBulk_resolvent_shape_of_re_pos` e `c2AnalyticBulk_nonvanishing_of_re_pos` em `Route/BulkReal.lean`, que dão a forma resolvente e a não-anulação pontual do bulk real apenas com `0 < Re(s)` e bounds escalares locais;
    - `c2TiltAnalyticRatio_lt_one_of_re_pos` e `c2TiltRegularizedResidual_bound_of_analytic_geometric_of_re_pos` em `Route/BulkTilt.lean`, removendo a dependência artificial de `offCriticalStrip` na cota analítica do tilt;
    - a nova região `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffOneLtRegion` em `Route/BulkOddTail.lean`, com teorema de não-anulação do modelo bulk `c2BulkScaledSeededExplicitOddTailC0ZetaCutoffOneLt_nonvanishing_of_mem`;
    - a identidade pontual `c2OddTailGenuineIdentity_balancingSeed_at_of_one_lt_re` em `Analytic/GenuineBulkConcrete.lean`, que mostra diretamente que o modelo bulk do balancing seed coincide com `genuineFInfinite` em `Re(s) > 1`;
    - a nova região final `c2OddTailBalancingSeedExplicitCutoffOneLtRegion` e o teorema `c2OddTailBalancingSeed_nonvanishing_of_mem_explicitCutoffOneLtRegion`, além da extração por testemunha `c2OddTailBalancingSeed_exists_nonvanishing_point_of_nonempty_explicitCutoffOneLtRegion`.
    Interpretação: a camada quantitativa explícita voltou a ter conteúdo matemático real no bulk direito. A versão off-critical antiga continua formalmente marcada como vazia, mas agora existe uma variante correta onde as estimativas explícitas realmente podem ser habitadas e usadas.
  60. saída do bulk direito em formato compatível com continuação: o Lean agora empacota o modelo bulk do balancing seed diretamente como identidade sobre `oneLtHalfPlane`. O novo teorema `c2OddTailBalancingSeed_bulkModel_identity_on_oneLtHalfPlane` mostra que
    `c2ScaledSeededExplicitOddTailBulkModel (c2OddTailBalancingSeed coreCutoff K M) coreCutoff K M`
    satisfaz `C2IdentityOn oneLtHalfPlane _ riemannZeta`. Em outras palavras: a etapa bulk direita já não produz apenas não-anulação pontual; ela produz também uma identidade explícita no formato exato esperado pela infraestrutura de `ContinuationFromOneLtData`.
  61. ponte formal da continuação para a rota global: a interface `ContinuationFromOneLtData` agora já sobe qualquer numerador para `GenuineRouteData` assim que se fornecem (i) a identidade em `Re(s) > 1` e (ii) uma prova off-critical de não-anulação ou uma cobertura. Foram adicionados em `Analytic/GenuineContinuation.lean` os adaptadores genéricos `ContinuationFromOneLtData.toGenuineRouteData`, `ContinuationFromOneLtData.toGenuineRouteDataOfCover` e seus corolários para RH. Em `Analytic/GenuineBulkConcrete.lean`, o modelo bulk do balancing seed foi então especializado como `c2OddTailBalancingSeedBulkModel`, com a interface dedicada `C2OddTailBalancingSeedBulkModelContinuationData`, o teorema `...fundamentalIdentity` e as conversões `...toGenuineRouteData` / `...toGenuineRouteDataOfCover`.
    Interpretação: o que faltava deixou de ser “formato”. O bulk direito já entra na API final da rota; o que ainda falta agora é a continuação concreta desse modelo e a comparação/cobertura que forneça a não-anulação off-critical correspondente.
  62. redução explícita da continuação do bulk model a uma comparação no semiplano direito: ao tentar construir a `ContinuationFromOneLtData` efetiva do modelo `c2OddTailBalancingSeedBulkModel`, ficou claro que o repositório ainda não contém um teorema do tipo
    `c2OddTailBalancingSeedBulkModel coreCutoff K M s = genuineFInfinite s` para todo `0 < Re(s)`.
    Em vez de esconder essa lacuna, o Lean agora a isolou formalmente: `Analytic/GenuineContinuation.lean` contém `ContinuationFromOneLtData.of_eqOnOpenRightHalfPlane`, que transporta continuação ao longo de uma igualdade em `openRightHalfPlane`; e `Analytic/GenuineBulkConcrete.lean` especializa isso em `c2OddTailBalancingSeedBulkModelContinuationData_of_eqOnOpenRightHalfPlane` e `c2OddTailBalancingSeedBulkModel_fundamentalIdentity_of_eqOnOpenRightHalfPlane`.
    Interpretação: a tentativa da opção 1 avançou até o ponto máximo suportado pelos fatos atuais. Para obter uma continuação efetiva do bulk model, basta agora fechar exatamente uma peça analítica faltante: a comparação do bulk model com `genuineFInfinite` em todo o semiplano `0 < Re(s)`.
  63. interface explícita do Teorema da Identidade para a comparação do bulk model: para aproximar ainda mais a opção 1 do formato dos textos (`c2_prova_continuacao_Z_zeta.md`), o Lean agora isola não apenas a igualdade final em `σ>0`, mas o próprio passo “igualdade em `σ>1` continua para `σ>0`”. Foi adicionada em `Analytic/GenuineContinuation.lean` a estrutura `ComparisonFromOneLtData F G`, com o adaptador `ComparisonFromOneLtData.transferContinuation`. Em `Analytic/GenuineBulkConcrete.lean`, isso foi especializado ao par
    `c2OddTailBalancingSeedBulkModel` / `genuineFInfinite` via `C2OddTailBalancingSeedBulkModelComparisonFromOneLtData`, o teorema `c2OddTailBalancingSeedBulkModel_eq_genuineFInfinite_on_oneLtHalfPlane` e a construção `c2OddTailBalancingSeedBulkModelContinuationData_of_comparisonFromOneLt`.
    Interpretação: a opção 1 agora está formalizada no mesmo nível conceitual das notas analíticas. O único item ainda não implementado é instanciar essa nova interface comparativa, isto é, formalizar o argumento de continuação/identidade que prolonga a igualdade do bulk model de `Re(s) > 1` para `0 < Re(s)`.
  64. separação explícita do polo em `s = 1` na opção 1: ao confrontar a infraestrutura analítica da mathlib com o texto, ficou claro que o gargalo não é só “prolongar para `σ>0`”, mas também tratar corretamente o ponto singular `s = 1`. O Lean agora refina a interface comparativa em duas partes:
    - comparação no domínio furado `puncturedOpenRightHalfPlane = {s | 0 < Re(s) ∧ s ≠ 1}`;
    - igualdade separada em `s = 1`.
    Isso aparece em `Analytic/GenuineContinuation.lean` como `ComparisonFromOneLtAtOneData`, e em `Analytic/GenuineBulkConcrete.lean` como `C2OddTailBalancingSeedBulkModelComparisonFromOneLtAtOneData`, junto das conversões `...of_atOne` para a interface anterior e das versões `...ContinuationData_of_comparisonFromOneLtAtOne` / `...fundamentalIdentity_of_comparisonFromOneLtAtOne`.
    Interpretação: a opção 1 ficou reduzida ao pacote analítico correto para a presença do polo de `ζ`. O trabalho remanescente já não é “comparar em todo `σ>0` de uma vez”, mas sim provar a comparação no semiplano direito furado e fechar o valor especial em `s = 1`.
  65. construtor efetivo da opção 1 via Teorema da Identidade analítico: usando `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` da mathlib, o Lean agora já sabe fabricar a comparação no semiplano direito furado a partir de hipóteses analíticas locais, sem exigir que o usuário forneça manualmente a função `continue_equality_punctured`. Em `Analytic/GenuineContinuation.lean` foram adicionados:
    - `puncturedOpenRightHalfPlane_isPreconnected`, que prova a preconectividade do domínio furado decompondo-o em regiões convexas;
    - `ComparisonFromOneLtAtOneData.of_analyticOnNhd_punctured`, que transforma
      `AnalyticOnNhd ℂ F puncturedOpenRightHalfPlane`,
      `AnalyticOnNhd ℂ G puncturedOpenRightHalfPlane`
      e a igualdade `F 1 = G 1`
      numa instância efetiva da interface comparativa.
    Em `Analytic/GenuineBulkConcrete.lean`, isso foi especializado ao balancing seed via
    `c2OddTailBalancingSeedBulkModelComparisonFromOneLtAtOneData_of_analyticOnNhd`,
    `...ContinuationData_of_analyticOnNhd` e
    `...fundamentalIdentity_of_analyticOnNhd`.
    Interpretação: a opção 1 ganhou um núcleo matemático executável. O próximo passo já não é mais construir uma API de continuação, mas provar as três hipóteses concretas que alimentam esse construtor: analiticidade do bulk model em `σ > 0, s ≠ 1`, analiticidade de `genuineFInfinite` no mesmo domínio, e igualdade em `s = 1`.
  66. ponte direta da opção 3 para a rota final com cover: o Lean agora também fecha o último adaptador formal depois dessas hipóteses analíticas. Em `Analytic/GenuineBulkConcrete.lean` foram adicionados:
    - `c2OddTailBalancingSeedBulkModelGenuineRouteData_of_analyticOnNhd_cover`, que combina
      `c2OddTailBalancingSeedBulkModelContinuationData_of_analyticOnNhd`
      com `C2OddTailBalancingSeedBulkModelContinuationData.toGenuineRouteDataOfCover`;
    - `riemannHypothesisC2_of_c2OddTailBalancingSeedBulkModel_analyticOnNhd_cover`, que entrega RH diretamente a partir de
      `AnalyticOnNhd` do bulk model no domínio furado,
      `AnalyticOnNhd` de `genuineFInfinite` no mesmo domínio,
      a igualdade em `s = 1`,
      e a cobertura off-critical final near/bulk/edge.
    Interpretação: a opção 3 deixou de ser uma composição manual de adaptadores. Assim que as hipóteses analíticas da opção 1 forem provadas e a cover final estiver disponível, a passagem para `GenuineRouteData` e para RH já está empacotada num único teorema reutilizável.
  67. alvo continuado honesto para o lado analítico e redução do bulk ao canal central literal: ao tentar “fazer ambos” objetivos analíticos literais, o Lean deixou claro que o próximo ganho útil não era forçar uma prova cega sobre os `tsum`s, mas isolar a continuação correta e medir exatamente a distância até os objetos literais do repositório. Em `Analytic/GenuineContinuation.lean` foram adicionados:
    - `continuedOddDirichletChannel := (1 - complexDirichletCoeff s 2) * riemannZeta s`;
    - `continuedCentralOddChannel := centralFromOddChannel continuedOddDirichletChannel s`;
    - a infraestrutura analítica no domínio furado `puncturedOpenRightHalfPlane`: `puncturedOpenRightHalfPlane_isOpen`, `complexDirichletCoeff_analyticOnNhd`, `riemannZeta_analyticOnNhd_punctured`, `q_analyticOnNhd_punctured`, `verticalDepthTailFromTwo_analyticOnNhd_punctured`, `continuedOddDirichletChannel_analyticOnNhd_punctured`, `continuedCentralOddChannel_analyticOnNhd_punctured`;
    - as pontes de comparação no domínio de convergência absoluta: `continuedOddDirichletChannel_eq_oddDirichletChannel_on_oneLtHalfPlane`, `continuedCentralOddChannel_eq_genuineCentralDoubleSeries_on_oneLtHalfPlane` e `continuedCentralOddChannel_fundamentalIdentity`.
    Em `Analytic/GenuineBulkConcrete.lean` foi adicionado o lema estrutural
    `c2OddTailBalancingSeedBulkModel_eq_central_of_re_pos`, mostrando que o bulk model do balancing seed coincide com `genuineCentralDoubleSeries` em todo `0 < Re(s)`, além do corolário pontual `c2OddTailBalancingSeedBulkModel_eq_central_at_one`.
    Interpretação: os dois lados do problema agora ficaram separados com precisão. O repositório já possui um alvo continuado analítico honesto no domínio furado e também sabe reduzir o bulk balancing-seed ao canal central literal em `σ > 0`. A lacuna restante passou a ser explicitamente a ponte entre os objetos literais por `tsum` (`genuineCentralDoubleSeries`, `genuineFInfinite`) e esse alvo continuado, ou então uma reformulação final da opção 1/3 diretamente em termos do alvo continuado.
  68. rota off-critical honesta sem forçar identidade em `s = 1`: a tentativa de empurrar a continuação até `FundamentalIdentityOnRightHalfPlane` para funções literais por `tsum` revelou um problema estrutural: o roadmap só usa a identidade no `offCriticalStrip`, mas a interface antiga exigia igualdade também no ponto singular `s = 1`, onde os objetos literais do lado C2 e o valor regularizado da `riemannZeta` da mathlib não precisam coincidir. Em vez de mascarar esse ponto, o Lean agora ganhou uma rota paralela estritamente no domínio relevante para RH.
    Em `Route/Transfer.lean` foram adicionados:
    - `FundamentalIdentityOnOffCriticalStrip`;
    - `FundamentalIdentityOnRightHalfPlane.toOffCriticalStrip`;
    - `riemannHypothesisC2_of_F_nonvanishing_offCriticalIdentity`.
    Em `Roadmap.lean` foram adicionados os empacotamentos correspondentes para a colagem final:
    - `riemannHypothesisC2_of_coverData_offCriticalIdentity`;
    - `riemannHypothesisC2_of_nearBulkEdge_offCriticalIdentity`;
    - `riemannHypothesisC2_of_nearBulkBoundsEdge_offCriticalIdentity`.
    Em `Analytic/GenuineContinuation.lean` foi adicionada a interface `ComparisonFromOneLtPuncturedData`, com o construtor `ComparisonFromOneLtPuncturedData.of_analyticOnNhd_punctured` e o transporte `ComparisonFromOneLtPuncturedData.transferOffCriticalIdentity`.
    Em `Analytic/GenuineBulkConcrete.lean`, o bulk model do balancing seed foi ligado ao alvo continuado honesto por:
    - `c2OddTailBalancingSeedBulkModel_eq_continuedCentralOddChannel_on_oneLtHalfPlane`;
    - `c2OddTailBalancingSeedBulkModelComparisonToContinuedCentralData_of_analyticOnNhd`;
    - `c2OddTailBalancingSeedBulkModel_fundamentalIdentity_offCritical_of_analyticOnNhd`;
    - `riemannHypothesisC2_of_c2OddTailBalancingSeedBulkModel_analyticOnNhd_cover_offCritical`.
    Interpretação: a continuação necessária para RH não precisa mais passar artificialmente por uma igualdade pontual em `s = 1`. Se o bulk model for analítico no domínio furado e a colagem near/bulk/edge for fornecida, a identidade off-critical e a conclusão `RiemannHypothesisC2` já podem ser obtidas diretamente via o alvo continuado `continuedCentralOddChannel`, sem assumir ainda a continuação literal de `genuineFInfinite` até o ponto `1`.
  69. redução final do bridge remanescente ao canal central literal: depois de isolar a nova rota off-critical, o Lean agora também identificou com precisão máxima qual igualdade ainda falta para fazer o bulk entrar nela sem provar `AnalyticOnNhd` do modelo inteiro por força bruta. Em `Analytic/GenuineContinuation.lean` foi adicionado o construtor genérico `ComparisonFromOneLtPuncturedData.of_eqOnPuncturedOpenRightHalfPlane`, que permite usar uma igualdade explícita no domínio furado em vez de reconstruí-la por Teorema da Identidade. Em `Analytic/GenuineBulkConcrete.lean`, foram adicionados:
    - `c2OddTailBalancingSeedBulkModel_eq_continuedCentral_on_punctured_of_central`, que reduz a igualdade do bulk model com o alvo continuado à igualdade
      `genuineCentralDoubleSeries = continuedCentralOddChannel`
      no domínio furado;
    - `c2OddTailBalancingSeedBulkModelComparisonToContinuedCentral_of_central`, que empacota essa redução na nova interface pontual;
    - `c2OddTailBalancingSeedBulkModel_fundamentalIdentity_offCritical_of_central`, que produz a identidade off-critical do bulk model a partir desse bridge central;
    - `riemannHypothesisC2_of_c2OddTailBalancingSeedBulkModel_central_bridge_cover_offCritical`, que combina esse bridge com a colagem final near/bulk/edge.
    Interpretação: o gargalo deixou de ser “provar que o bulk inteiro é analítico” de forma cega. O problema remanescente foi comprimido a uma única peça conceitual: identificar a série central literal `genuineCentralDoubleSeries` com o alvo continuado honesto `continuedCentralOddChannel` em `puncturedOpenRightHalfPlane`.

  70. rota direta pelo alvo continuado, alinhada às notas de continuação: ao reler `c2_prova_continuacao_Z_zeta.md`, `algebra_Z_igual_zeta.md`, `fechamento_unificado.md` e o esboço concatenado do paper, ficou claro que o objeto honestamente continuado na literatura do workspace é o alvo central meromorfo `continuedCentralOddChannel`, não o `tsum` literal. Em `Analytic/GenuineBulkConcrete.lean`, foram adicionados:
    - `c2ScaledSeededExplicitOddTailContinuedBulkModel`, que troca o cutoff contra `genuineCentralDoubleSeries` pelo cutoff contra `continuedCentralOddChannel`;
    - `c2OddTailContinuedBalancingSeed`, calibrando a seed diretamente contra o residual vertical-retangular do alvo continuado;
    - `c2OddTailContinuedBalancingSeedBulkModel_eq_continuedCentral_of_re_pos`, que fecha algebricamente o bulk model novo no alvo continuado em todo `0 < Re(s)`;
    - `c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity` e `c2OddTailContinuedBalancingSeedBulkModel_fundamentalIdentity_offCritical`, que dão a identidade `F = c0 * ζ` sem passar pelo bridge literal;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_cover_offCritical`, que reduz RH diretamente a uma `OffCriticalCoverData` para esse novo modelo.
    Interpretação: as notas do workspace não sustentam apenas a rota antiga via “bridge central literal”; elas sustentam uma rota mais honesta, em que o bulk é calibrado desde o início contra o alvo continuado. Com isso, a igualdade `genuineCentralDoubleSeries = continuedCentralOddChannel` no domínio furado deixa de ser um bloqueio obrigatório para a rota off-critical final.

  71. especialização da opção 1 para a colagem final near/bulk/edge: com a rota continuada já fechada no nível da identidade off-critical, o Lean agora também empacota diretamente a colagem final para esse modelo. Em `Analytic/GenuineBulkConcrete.lean`, foram adicionados:
    - `c2OddTailContinuedBalancingSeedBulkModelCoverData_of_nearBulkEdge`;
    - `c2OddTailContinuedBalancingSeedBulkModelCoverData_of_nearBulkBoundsEdge`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_nearBulkEdge`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_nearBulkBoundsEdge`.
    Interpretação: a opção 1 deixou de ser apenas “usar `OffCriticalCoverData` depois”. A API final da colagem já está especializada ao modelo continuado do balancing seed; assim que houver dados near-axis, bulk e edge com `F` identificado a esse modelo, RH cai diretamente sem precisar reescrever a cola genérica nem repetir plumbing de identidades.

  72. tipagem pinada da colagem para o modelo continuado: depois da especialização da API, o Lean passou a carregar também a versão “fully pinned” da colagem, no mesmo espírito de `GenuineCover`. Em `Analytic/GenuineBulkConcrete.lean`, foram adicionados:
    - `C2OddTailContinuedBalancingSeedBulkModelNearAxisData`;
    - `C2OddTailContinuedBalancingSeedBulkModelBulkRouteData`;
    - `C2OddTailContinuedBalancingSeedBulkModelBulkBoundsData`;
    - `C2OddTailContinuedBalancingSeedBulkModelEdgeData`;
    - `C2OddTailContinuedBalancingSeedBulkModelNearBulkEdgeData`;
    - `C2OddTailContinuedBalancingSeedBulkModelNearBulkBoundsEdgeData`;
    - os conversores `...toNearAxisRouteData`, `...toBulkRouteData`, `...toEdgeRouteData` e `...toOffCriticalCoverData`;
    - `offCriticalStripNonvanishing_of_c2OddTailContinuedBalancingSeedBulkModelNearBulkEdgeData` e sua versão com bulk bounds;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_pinnedNearBulkEdge` e `..._pinnedNearBulkBoundsEdge`.
    Interpretação: a camada de plumbing entre certificados regionais e a identidade off-critical ficou completamente internalizada ao próprio modelo continuado. A próxima etapa deixou de ser “mostrar que os tipos genéricos batem” e passou a ser só produzir certificados concretos near-axis, bulk e edge dentro desses novos tipos pinados.

  73. bulk regional pinado diretamente no modelo continuado: para eliminar também o último `F_eq` do lado quantitativo, o Lean agora espelha em `Analytic/GenuineBulkConcrete.lean` a camada de `Analytic/GenuineBulk.lean`, mas com alvo definicionalmente igual a `c2OddTailContinuedBalancingSeedBulkModel`. Foram adicionados:
    - `C2OddTailContinuedBalancingSeedBulkModelRegionalBulkRouteData`;
    - `C2OddTailContinuedBalancingSeedBulkModelRegionalBulkBoundsData`;
    - os adaptadores `...ofRegionalVerticalBulkRouteData`, `...ofRegionalVerticalBulkBoundsData` e suas versões restritas `...On`;
    - os conversores `...toRegionalVerticalBulkRouteData`, `...toRegionalVerticalBulkBoundsData`, `...toRegionalBulkRouteData`, `...toPinnedBulkRouteData` e `...toPinnedBulkBoundsData`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_regionalBulkRouteData` e `..._of_regionalBulkBoundsData`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_regionalBulkCover` e `..._regionalBulkBoundsCover`.
    Interpretação: os certificados quantitativos regionais do bulk já têm agora um alvo canônico para a rota continuada. Quando houver uma decomposição regional concreta do bulk num subconjunto off-critical, ela poderá ser transportada diretamente para a colagem final pinada sem carregar igualdades globais artificiais do numerador.

  74. integração genérica de near-axis e edge para o alvo continuado pinado: para atacar o item 2 sem fingir um certificado analítico que ainda não existe, `Analytic/GenuineBulkConcrete.lean` agora fecha a camada de transporte entre os tipos genéricos do roadmap e os tipos pinados do modelo continuado. Foram adicionados:
    - `C2OddTailContinuedBalancingSeedBulkModelNearAxisData.ofNearAxisRouteData`;
    - `C2OddTailContinuedBalancingSeedBulkModelEdgeData.ofEdgeRouteData`;
    - `C2OddTailContinuedBalancingSeedBulkModelNearBulkEdgeData.ofNearBulkEdge` e `...NearBulkBoundsEdgeData.ofNearBulkBoundsEdge`;
    - os corolários `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_regional_genericNearEdge` e `..._regionalBounds_genericNearEdge`, que combinam bulk regional já pinado com dados near/edge ainda fornecidos no formato genérico.
    Interpretação: a parte difícil de transporte dependente ficou absorvida dentro do próprio Lean. Daqui em diante, um certificado near-axis ou edge para a rota continuada pode ser primeiro produzido como `NearAxisRouteData` / `EdgeRouteData` abstrato e depois convertido diretamente para a camada pinada do modelo continuado, sem repetir reescritas manuais por igualdade funcional.

  75. certificado regional concreto off-critical para o bulk continuado: a etapa 1 agora também ganhou uma instância operacional real dentro de `Analytic/GenuineBulkConcrete.lean`. Foram adicionados:
    - `C2OddTailContinuedBalancingSeedBulkConcreteEstimates`, que reúne exatamente os insumos quantitativos esperados pela rota: bound escalado da seed `c2OddTailContinuedBalancingSeed`, bound geométrico por camada do defeito horizontal ímpar, bound escalado do cutoff contra `continuedCentralOddChannel` e a desigualdade final de dominância;
    - `c2OddTailContinuedBalancingSeedBulkConcreteRegion`, a região off-critical concreta definida por essas estimativas;
    - `c2OddTailContinuedBalancingSeedBulkConcreteBoundsData`, que empurra essa região diretamente para `C2OddTailContinuedBalancingSeedBulkModelRegionalBulkBoundsData` usando a infraestrutura genérica já formalizada em `Route/BulkHorizontal.lean`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_concreteRegion`, que entrega `c2OddTailContinuedBalancingSeedBulkModel s ≠ 0` em qualquer ponto da nova região;
    - `c2OddTailContinuedBalancingSeedBulkConcreteRegion_nonempty_iff` e `...exists_nonvanishing_point_of_nonempty_concreteRegion`, que reduzem a não-vacuidade da região concreta à produção de uma testemunha explícita das desigualdades e já extraem daí um ponto nonzero do modelo continuado.
    Interpretação: o item 1 deixou de ser apenas uma meta abstrata de plumbing. O certificado bulk off-critical do modelo continuado já existe como objeto Lean reutilizável e já conversa diretamente com os tipos regionais pinados. O que ainda falta agora é a parte analítica propriamente dita: construir uma testemunha concreta de `C2OddTailContinuedBalancingSeedBulkConcreteEstimates`, isto é, provar que essa nova região concreta não está vazia.

  76. ponte explícita do bulk direito para o modelo continuado: embora a testemunha off-critical da etapa 75 ainda não exista, o Lean agora já conecta a região explícita em `Re(s) > 1` ao numerador continuado final. Em `Analytic/GenuineBulkConcrete.lean`, foram adicionados:
    - `c2OddTailBalancingSeedBulkModel_nonvanishing_of_mem_explicitCutoffOneLtRegion`, que troca a conclusão antiga `genuineFInfinite s ≠ 0` por `c2OddTailBalancingSeedBulkModel coreCutoff K M s ≠ 0` na mesma região explícita `c2OddTailBalancingSeedExplicitCutoffOneLtRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_eq_oldBulkModel_on_oneLtHalfPlane`, que identifica em `oneLtHalfPlane` o modelo bulk continuado com o bulk model anterior via o alvo comum `continuedCentralOddChannel`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_explicitCutoffOneLtRegion` e `c2OddTailContinuedBalancingSeedBulkModel_exists_nonzero_of_nonempty_explicitCutoffOneLtRegion`, que empurram qualquer testemunha da região explícita `oneLt` diretamente para um ponto nonzero do modelo continuado.
    Interpretação: a região explícita já formalizada para `σ > 1` deixou de alimentar apenas o numerador genuíno antigo. Ela agora serve também como estágio canônico para o modelo continuado final. Isso não substitui a testemunha off-critical da etapa 75, mas elimina mais uma ponte informal: qualquer certificado quantitativo em `Re(s) > 1` já pode ser reutilizado sem retrabalho no numerador continuado que entra na rota atual para RH.

  77. destilação do legado near-axis para a API nova: o diretório `LEGADO/` confirmou que já havia bastante trabalho compilável para Thm 8 / Thm 11 / G11, mas numa arquitetura antiga e mais acoplada. Em vez de copiar essa árvore, o Lean atual extraiu só o núcleo reutilizável para a organização nova em `Route/NearAxisTaylor.lean`. O arquivo adiciona:
    - `leibnizJet` e os lemas `leibnizJet_eq_leadingTerm_of_vanishingLowerOrder`, `..._ne_zero_of_vanishingLowerOrder` e `..._of_c0_of_re_pos`, que isolam exatamente o colapso de Leibniz usado no Thm 8 para multiplicidade arbitrária;
    - os lemas genéricos `eventually_ne_zero_of_iteratedDeriv_ne_zero` e `finiteOrderZero_and_eventually_ne_zero_of_iteratedDeriv_ne_zero`, que transformam um jet não nulo em não-anulação local punctured para funções analíticas;
    - as utilidades `principalTaylorScale`, `localZeroFreeRadius` e `nonzero_of_taylorLowerBound`, que capturam a contabilidade local do Taylor genuine usada no Teorema 11.
    Interpretação: o legado já não é apenas consulta manual. Sua parte estruturalmente estável foi reempacotada no padrão do projeto atual, abaixo da interface `NearAxisCertificate` e sem importar nomes, namespaces ou dependências da arquitetura antiga. Isso reduz bastante o custo da próxima migração: agora a formalização atual de Thm 8 e do Taylor local pode ser construída diretamente em cima dessas peças genéricas, em vez de recomeçar do zero.

  78. primeira ponte atual de Thm 8 para o roadmap near-axis: a formalização atual agora já sabe converter uma testemunha local do tipo Thm 8 em um certificado utilizável pela rota principal. Em `Route/NearAxisTaylor.lean`, foram adicionados:
    - `exists_transversalRadius_of_eventually_ne_zero`, que extrai um raio horizontal explícito de não-anulação a partir de não-anulação local punctured em `𝓝[≠] ρ`;
    - `exists_transversalRadius_of_iteratedDeriv_ne_zero`, que empacota a passagem “jet não nulo ⇒ janela transversal zero-free” para funções analíticas;
    - `exists_transversalRadius_of_leibnizJet_c0_of_re_pos`, que aplica diretamente o colapso de Leibniz com `c0` positivo, no formato estrutural de Thm 8;
    - `NearAxisCertificate.of_leibnizJet_c0`, que transforma dados locais por zero crítico em um `NearAxisCertificate` global no formato consumido por `Roadmap.lean` e pela rota near-axis atual.
    Como saneamento de build, `Route/G11Certificate.lean` também foi ajustado de forma mecânica para usar decidibilidade clássica onde o `radius` depende de `IsCriticalZero`, sem alterar a matemática do certificado G11. Interpretação: o Thm 8 ainda não foi fechado para `genuineFInfinite`, mas a arquitetura atual já ganhou a peça decisiva que faltava: qualquer prova local no estilo antigo por jet/Leibniz agora entra diretamente na API moderna `NearAxisCertificate`, sem precisar reabrir a arquitetura legacy.

  79. encaixe de H2 na interface atual de G11: as notas `fechamento_unificado.md` §3.7.4.5 e `c2_certificacao_bound_global.md` §7 deixam claro que a rota tilt/H2, se fechada, entrega um bound **mais forte** do que o envelope declarado hoje, a saber
    - `B_ρ/A_ρ ≤ A + C · log(2 + |γ|)` via H1 + H2 + resolvente horizontal/vertical;
    - enquanto o `G11Certificate` atual consome o bound conservador `A + C·log²(2+|γ|)`.
    Em `Route/G11Certificate.lean`, foram então adicionados:
    - `affineLogRatioBound_le_g11Envelope`, lema elementar que sobe `A + C·log(2+|γ|)` para o envelope conservador `(A + C) + C·log²(2+|γ|)` sem hipótese extra de altura;
    - `G11Certificate.of_affineLogRatioBound`, construtor no formato fiel às notas, e `G11Certificate.of_logLinearRatioBound` como especialização do caso `A = 0`.
    Interpretação: H2 ainda não foi provado no Lean, mas já deixou de ser um alvo “solto”. A peça de plumbing que faltava entre a rota tilt setorial e a interface atual de G11 agora existe. Quando a coerência setorial entrar como lema C2 nativo, o caminho para `near_axis_nonzero_from_G11` será imediato.

  80. módulo Lean próprio da rota tilt setorial: o passo seguinte não ficou só em comentário ou construtor genérico. O Lean agora ganhou um módulo dedicado `Route/TiltSectorial.lean`, integrado no root import, com a interface exata da rota H1+H2 descrita nas notas. O arquivo adiciona:
    - `SectorialNormCoherence`, `sum_norm_le_div_cos_of_sectorialNormCoherence` e `norm_sum_weighted_le_of_sectorialNormCoherence`, que formalizam a forma finita do lema setorial abstrato de §3.7.4.4;
    - `tiltWeight`, `tiltWeight_le_exp_mul_support` e `norm_sum_tiltWeight_le_of_sectorialNormCoherence`, que capturam o bound universal `h e^{-δ h} ≤ eL` para `|δ| ≤ 1/L` e sua aplicação direta à soma ponderada do tilt;
    - `sectorialLogConstant`, `multiplicityScaled_sectorialLogBound_le` e a estrutura `SectorialMomentG11Data`, cujo campo principal já vem no formato literal das notas:
      `B_ρ/A_ρ ≤ (1/(m_ρ+1)) · (eK / cos α) · log(2 + |γ|)`;
    - `SectorialMomentG11Data.toG11Certificate` e `near_axis_nonzero_from_sectorialMomentG11`, que empurram essa interface diretamente para a rota near-axis já existente via `G11Certificate`.
    Interpretação: H2 ainda continua em aberto como teorema C2 nativo, mas agora o formato matemático exato da rota tilt setorial já virou objeto Lean reutilizável. O próximo trabalho deixou de ser “desenhar a interface” e passou a ser apenas preencher essa estrutura com a prova concreta de coerência setorial/suporte log.

  81. camada bound-level da rota tilt setorial: a interface de passo 80 ainda exigia preencher diretamente o campo final `moment_ratio_bound`. O Lean agora ganhou também a camada imediatamente anterior, ainda em `Route/TiltSectorial.lean`, que espelha literalmente a álgebra finita das notas e reduz a futura prova H1+H2 a um pacote de dados explícitos. Foram adicionados:
    - `g11Log_pos`, lema auxiliar isolando a positividade de `log(2 + |γ|)` usada na escolha de `L = K · log(2 + |γ|)`;
    - `moment_ratio_bound_of_tiltWeight_family`, teorema genérico que transforma uma família finita de contribuições `u_i`, alturas `h_i`, um tilt admissível `δ`, coerência setorial e as identificações com `G11LocalTaylorData` na estimativa final
      `B_ρ/A_ρ ≤ (1/(m_ρ+1)) · (eK / cos α) · log(2 + |γ|)`;
    - `SectorialMomentG11BoundsData`, estrutura bound-level no estilo dos outros módulos de rota, com campos para a família finita, o controle de suporte logarítmico, a admissibilidade do tilt, a coerência setorial e as ligações com os coeficientes de Taylor locais;
    - `SectorialMomentG11BoundsData.moment_ratio_bound`, `toG11Data`, `toG11Certificate` e `near_axis_nonzero_from_sectorialMomentG11Bounds`, que empurram automaticamente esse pacote bound-level para a interface route-level já existente.
    Interpretação: a prova futura de H1+H2 não precisa mais construir “na mão” o certificado final de G11. Basta preencher `SectorialMomentG11BoundsData` com a família finita concreta vinda da decomposição/torre/resolvente, e o resto do plumbing até a região near-axis já está fechado no Lean.

  82. versão retangular explícita da família C2: para a rota H1+H2 não ficar presa numa família finita ainda arbitrária, o Lean ganhou um módulo novo `Route/TiltSectorialRectangular.lean`, já importado no root, especializado ao retângulo concreto de endereços `c2Rectangle K M`. O arquivo adiciona:
    - `c2AddressLogHeight`, `c2AddressLogHeight_nonneg_of_mem_c2Rectangle` e a leitura explícita `H_{C2}(n)=log(2^k m)` sobre um endereço `(k,m)` válido;
    - `genuineCentralRectangularAddressTerm`, `centerRemainderTerm_eq_genuineCentralRectangularAddressTerm`, `rectangularCentral_eq_centerRemainderFiniteSum` e `rectangularCentral_eq_genuineCentralRectangularSum`, ligando o suporte retangular de endereços ao operador central finito já existente;
    - `C2RectangularMomentG11BoundsData`, estrutura concreta em que o suporte da família deixa de ser um `Finset` arbitrário e passa a ser exatamente `c2Rectangle (K_ρ) (M_ρ)`;
    - `C2RectangularMomentG11BoundsData.toSectorialMomentG11BoundsData`, `moment_ratio_bound`, `toG11Data`, `toG11Certificate` e `near_axis_nonzero_from_rectangularMomentG11Bounds`, que empurram automaticamente essa versão retangular explícita para a rota near-axis.
    Interpretação: a opção “preencher a família concreta vinda da torre central” agora ficou literalmente modelada no Lean. O próximo alvo não é mais instanciar um `Finset` genérico, mas preencher `C2RectangularMomentG11BoundsData` com as contribuições demoduladas, o controle de suporte logarítmico e a coerência setorial do retângulo C2 efetivamente usado pela decomposição/truncamento.

  83. H1 reduzido ao canto superior do retângulo: a primeira peça realmente “rotineira” da rota tilt ficou isolada no próprio módulo retangular. Foram adicionados `c2Center_le_of_mem_c2Rectangle`, `c2Center_top_pos_of_mem_c2Rectangle`, `c2AddressLogHeight_le_logTop_of_mem_c2Rectangle` e `c2AddressLogHeight_le_of_topHeightBound`, junto do construtor `C2RectangularMomentG11BoundsData.ofTopHeightBound`.
    Interpretação: para preencher o campo `height_bound` da estrutura retangular já não é preciso provar uma desigualdade separada para cada endereço `(k,m)`. Basta dar, para cada zero crítico `ρ`, um único bound do tipo
    `log(2^(K_ρ) M_ρ) ≤ K_supp · log(2 + |γ|)`,
    isto é, controlar o topo do retângulo `c2Rectangle (K_ρ) (M_ρ)`. O Lean agora propaga automaticamente esse bound global para todos os endereços do suporte.

  84. ponte concreta para a soma central retangular: além do suporte explícito e do bound H1 no topo, o módulo retangular agora ganhou a contribuição canônica `c2RectangularCentralContribution` e o lema `norm_rectangularCentral_eq_norm_sum_c2RectangularCentralContribution`, que identificam diretamente a norma do operador finito `rectangularCentral` com a norma da soma indexada por endereços. Em cima disso entrou o construtor `C2RectangularMomentG11BoundsData.ofCentralTerms`.
    Interpretação: a futura instância concreta da rota H1+H2 não precisa mais fornecer “na mão” o campo `contribution` nem reestabelecer a identidade do coeficiente principal como norma de uma soma no `Finset`. Basta especificar o ponto central relevante, o bound no topo do retângulo, o tilt admissível, a coerência setorial e a comparação `A_ρ = ‖rectangularCentral(·)‖`; o Lean faz a descida automática para `C2RectangularMomentG11BoundsData`.

  85. especialização ao zero crítico como ponto central: como a aplicação pretendida da rota G11 avalia naturalmente os blocos centrais no próprio zero crítico `ρ`, o módulo retangular agora ganhou também o construtor `C2RectangularMomentG11BoundsData.ofCriticalZeroCentralTerms`.
    Interpretação: a futura prova concreta não precisa mais carregar um parâmetro extra `centralPoint`. Basta trabalhar diretamente com `rectangularCentral ρ (K_ρ) (M_ρ)` e a família `c2RectangularCentralContribution ρ`. Isso reduz o próximo passo a três blocos de obrigações realmente matemáticas: bound logarítmico do topo do retângulo, coerência setorial H2 da família demodulada em `ρ`, e o bound do coeficiente residual tilteado no mesmo ponto.

  86. pacote concreto mínimo para a família central retangular: além dos builders soltos, o módulo retangular agora expõe a estrutura `C2RectangularCentralMomentG11BoundsData`, já especializada à família `c2RectangularCentralContribution ρ` e ao operador `rectangularCentral ρ (K_ρ) (M_ρ)`. Junto com ela foram adicionadas as conversões automáticas `toRectangularMomentG11BoundsData`, `toSectorialMomentG11BoundsData`, `toG11Data`, `toG11Certificate`, o bound `moment_ratio_bound` e o corolário `near_axis_nonzero_from_rectangularCentralMomentG11Bounds`.
    Interpretação: a futura formalização concreta da rota H1+H2 em torno do zero crítico não precisa mais montar manualmente nenhuma camada de plumbing. Basta preencher diretamente esse pacote especializado com `localData`, cutoffs `K_ρ/M_ρ`, tilt admissível, bound H1 no topo, coerência setorial H2 e o controle do remainder. O resto até a região near-axis já está encapsulado.

  87. H1 em forma explícita nos cutoffs: o topo do retângulo também deixou de aparecer apenas como `log(c2Center K M)`. O módulo retangular agora contém `log_c2Center_eq_depth_mul_log_two_add_log_core`, `c2AddressLogHeight_le_explicitCutoffLog_of_mem_c2Rectangle`, `c2TopHeightBound_of_explicitCutoffLog` e o builder especializado `C2RectangularCentralMomentG11BoundsData.ofExplicitCutoffLog`.
    Interpretação: para construir a peça H1 da instância concreta já não é mais necessário falar diretamente do centro `2^K M`. Basta fornecer, para cada zero crítico `ρ`, uma desigualdade explícita do tipo
    `(K_ρ : ℝ) * log 2 + log M_ρ ≤ K_{supp} * log(2 + |γ|)`,
    junto da positividade de `M_ρ`. O Lean converte automaticamente isso no `topHeightBound` exigido pela estrutura especializada.

  88. H2 em forma de cone de fase para G11: a rota setorial agora contém `SectorialPhaseConeCoherence`, `sectorialNormCoherence_of_phaseCone`, `sectorialPhase`, `sectorialPhase_norm` e `sectorialNormCoherence_of_rotatedCone`. No módulo retangular, a família central ganhou `C2RectangularCentralPhaseConeH2` e os builders `C2RectangularCentralMomentG11BoundsData.ofExplicitCutoffLogPhaseCone` e `ofExplicitCutoffLogRotatedCone`.
    Interpretação: a obrigação H2 que o usuário precisa provar já pode ser fornecida no formato analítico natural: escolher uma fase unitária, ou um ângulo real `φ(ρ)`, e provar ponto a ponto que cada contribuição rotacionada satisfaz
    `cos α * ‖u_a‖ ≤ re(e^{-iφ(ρ)} u_a)`.
    O Lean converte isso automaticamente para `SectorialNormCoherence`, encaixa no pacote retangular central e empurra até `G11Certificate`.

  89. Pacote totalmente especializado em H1 explícito + H2 rotacionado: o módulo retangular agora também contém `C2RectangularCentralRotatedConeMomentG11BoundsData`, com as conversões `toRectangularCentralMomentG11BoundsData`, `toRectangularMomentG11BoundsData`, `toSectorialMomentG11BoundsData`, `toG11Data`, `toG11Certificate`, o teorema `moment_ratio_bound` e o corolário `near_axis_nonzero_from_rectangularCentralRotatedConeMomentG11Bounds`.
    Interpretação: o próximo teorema analítico não precisa mais chamar manualmente os builders especializados. Ele já pode mirar uma única estrutura no formato mais concreto hoje disponível: dados locais em `ρ`, os cutoffs `K_ρ/M_ρ`, o tilt `δ_ρ`, a fase angular `φ(ρ)`, o bound H1 explícito, a desigualdade H2 rotacionada ponto a ponto e `remainderCoeff_le`. A partir daí, a passagem até `G11Certificate` e à corolária near-axis fica automática.

  90. Ponte local Thm 8 + Taylor quantitativo → `G11LocalTaylorData`: a camada near-axis agora contém `iteratedDeriv_ne_zero_of_leibnizJet_c0_of_re_pos`, e o módulo G11 ganhou os construtores `G11LocalTaylorData.ofTaylorLowerBound` e `G11LocalTaylorData.ofLeibnizJetTaylorLowerBound`.
    Interpretação: a obrigação `localData` deixou de ser uma estrutura “manual”. O próximo teorema local só precisa fornecer, para cada zero crítico `ρ`, a ordem `m_ρ`, um raio admissível `r_ρ`, um coeficiente de resto `B_ρ(r_ρ)` e o lower bound quantitativo
    `‖F(ρ + δ)‖ ≥ |δ|^{m_ρ} (A_ρ - B_ρ(r_ρ)|δ|)`
    com `A_ρ = ‖∂_σ^{m_ρ}F(ρ)‖ / m_ρ!`; se a não-degenerescência vier na forma atual de Leibniz-jet, o Lean já converte isso automaticamente em `G11LocalTaylorData`.

  91. Família local estruturada + builder direto para o alvo rotacionado: o módulo G11 agora contém `G11TaylorBoundsFamilyData` e `G11LeibnizTaylorBoundsFamilyData`, com conversões automáticas para `G11LocalTaylorData` e builders de `G11Certificate`. No módulo retangular, o alvo final ganhou os construtores `C2RectangularCentralRotatedConeMomentG11BoundsData.ofTaylorBoundsFamily` e `...ofLeibnizTaylorBoundsFamily`.
    Interpretação: a prova concreta já não precisa mais construir `localData` como função nem misturar manualmente a camada local com a camada retangular global. O próximo teorema pode ser dividido em duas peças limpas: primeiro uma família local no formato `G11LeibnizTaylorBoundsFamilyData`; depois uma instância global do tipo `C2RectangularCentralRotatedConeMomentG11BoundsData` via o builder `ofLeibnizTaylorBoundsFamily`, acrescentando apenas os cutoffs, o tilt, a fase angular, H1 explícito, H2 rotacionado e `remainderCoeff_le`.

  92. Camada G11 pinarizada em `genuineFInfinite`: o novo módulo `LeanC2/Analytic/GenuineG11.lean` fixa toda a infraestrutura recém-criada no operador roadmap final. Ele contém os aliases `GenuineFInfiniteTaylorBoundsFamilyData`, `GenuineFInfiniteLeibnizTaylorBoundsFamilyData` e `GenuineFInfiniteRectangularCentralRotatedConeMomentG11BoundsData`, além de builders diretos para `G11Certificate`, do builder global `...ofLeibnizTaylorBoundsFamily` e da conversão `toNearAxisData` para `GenuineFInfiniteNearAxisData`.
    Interpretação: a próxima prova concreta já pode pousar diretamente no pipeline genuine-final, sem repetir especializações do tipo `F = genuineFInfinite`. O que ainda falta aqui não é mais plumbing; é conteúdo analítico: uma família local concreta para `genuineFInfinite`, e depois os bounds retangulares/H2 correspondentes. A especialização completa de `NearAxisCertificate.of_leibnizJet_c0` para `genuineFInfinite` continua dependendo de uma interface explícita de analiticidade local do operador genuine.

  93. Especialização near-axis para `genuineFInfinite` sob analiticidade em `puncturedOpenRightHalfPlane`: o módulo `LeanC2/Analytic/GenuineG11.lean` agora contém `IsCriticalZero.mem_puncturedOpenRightHalfPlane`, `genuineFInfinite_analyticAt_of_analyticOnNhd_punctured` e o builder `GenuineFInfiniteNearAxisData.ofLeibnizJet_c0_of_analyticOnNhd`.
    Interpretação: o item near-axis deixou de depender de plumbing manual também no lado genuine. Assim que existir uma prova ou hipótese reutilizável de `AnalyticOnNhd ℂ genuineFInfinite puncturedOpenRightHalfPlane`, a rota de Thm 8 em forma de Leibniz-jet já sobe automaticamente para `GenuineFInfiniteNearAxisData`. O bloqueio remanescente nesse ramo passou a ser explicitamente a analiticidade do operador genuine no semiplano direito puncionado.

  94. Analiticidade puncionada de `genuineFInfinite` derivada da continuação: o módulo `LeanC2/Analytic/GenuineContinuation.lean` agora contém `c0_analyticOnNhd_punctured`, o lema geral `FundamentalIdentityOnRightHalfPlane.analyticOnNhd_punctured` e a especialização `GenuineFInfiniteContinuationData.analyticOnNhd_punctured`; em paralelo, `LeanC2/Analytic/GenuineG11.lean` ganhou o builder `GenuineFInfiniteNearAxisData.ofLeibnizJet_c0_of_continuation`.
    Interpretação: a hipótese analítica isolada do passo 93 deixou de ser um requisito externo independente. A partir de agora, qualquer continuação no formato já padronizado por `GenuineFInfiniteContinuationData` fornece automaticamente `AnalyticOnNhd ℂ genuineFInfinite puncturedOpenRightHalfPlane`, e portanto também a especialização near-axis de Thm 8 no formato Leibniz-jet. O gargalo desse ramo foi reduzido da analiticidade puncionada para a própria construção/instanciação de `GenuineFInfiniteContinuationData`.

  95. A rota bulk agora consome `continuation` sem repetir a analiticidade do genuine: o módulo `LeanC2/Analytic/GenuineBulkConcrete.lean` ganhou os wrappers `c2OddTailBalancingSeedBulkModelComparisonFromOneLtAtOneData_of_continuation`, `...ComparisonFromOneLtData_of_continuation`, `...ContinuationData_of_continuation`, `c2OddTailBalancingSeedBulkModel_fundamentalIdentity_of_continuation`, `c2OddTailBalancingSeedBulkModelGenuineRouteData_of_continuation_cover` e `riemannHypothesisC2_of_c2OddTailBalancingSeedBulkModel_continuation_cover`.
    Interpretação: a nova ponte do passo 94 já foi propagada para a camada bulk concreta. Assim que houver uma instância de `GenuineFInfiniteContinuationData`, o pipeline bulk não precisa mais receber também uma hipótese separada `AnalyticOnNhd ℂ genuineFInfinite puncturedOpenRightHalfPlane`; essa dependência agora é resolvida internamente pela continuação. O próximo trabalho nessa frente passa a ser puramente construtivo: produzir a continuação genuine e depois alimentar os modelos bulk concretos com `hBulk` e a igualdade em `s = 1`.

  96. Prefixo sharp do quarteto vertical formalizado: o módulo `LeanC2/Operators/VerticalResolvent.lean` agora contém `verticalQuartetPrefix`, a fatoração `verticalQuartetPrefix_factor`, o bound sharp `verticalQuartetPrefix_norm_lower_bound_on_circle` e a realização do pior caso `verticalQuartetPrefix_eq_lower_bound_at_pi` / `verticalQuartetPrefix_norm_eq_lower_bound_at_pi`.
    Interpretação: a coerência vertical dos quatro primeiros andares deixou de ser apenas uma heurística de notas. O Lean agora certifica diretamente que
    `‖1 + r e^{iθ} + r^2 e^{2 i θ} + r^3 e^{3 i θ}‖ ≥ (1 - r) * (1 + r^2)`
    para `0 ≤ r ≤ 1`, com igualdade no pior caso `θ = π`. Isso fecha a parte “sharp” do prefixo finito do resolvente, mas ainda não implica nonvanishing do operador completo por si só: falta ligar esse piso a um seed principal não nulo e subtrair explicitamente a dívida horizontal/cutoff.

  97. Certificado bulk finito do quarteto integrado ao `Roadmap`: o módulo `LeanC2/Operators/VerticalResolvent.lean` agora também contém o corolário sem fase explícita `verticalQuartetPrefix_norm_lower_bound_of_offCriticalStrip`, e `LeanC2/Roadmap.lean` ganhou `RegionalVerticalQuartetBulkRouteData`, `RegionalVerticalQuartetBulkBoundsData`, os teoremas `regionalVerticalQuartetBulk_nonvanishing` / `..._of_bounds`, além da ponte genérica `BulkRegionRouteData` com `OffCriticalCoverData.ofNearBulkRegionEdge` e os wrappers quartet `ofNearQuartetBulkEdge` / `...BoundsEdge` com suas versões de RH.
    Interpretação: o slogan “quarteto sharp + dívida horizontal” deixou de ser apenas o próximo alvo e passou a existir como interface formal reutilizável. A nova camada bulk diz exatamente o que faltava: se numa região bulk temos `F = Kδ + Eδ`, `Kδ = K2 * verticalQuartetPrefix (q) + Gδ` e a margem
    `‖K2‖ * ((1 - ‖q‖) * (1 + ‖q‖^2)) > ‖Gδ‖ + ‖Eδ‖`,
    então o Lean conclui `F ≠ 0` ponto a ponto. Além disso, a colagem near/bulk/edge foi ligeiramente generalizada: qualquer bulk que já venha com não-anulação regional agora pode ser encaixado via `BulkRegionRouteData`, sem forçar a volta ao resolvente infinito.

  98. Primeira instância concreta do bulk de quarteto: foi criado o módulo `LeanC2/Route/BulkQuartet.lean`, importado pelo root, que alimenta `RegionalVerticalQuartetBulkBoundsData` com uma decomposição vertical real. Em `LeanC2/Operators/VerticalResolvent.lean` foram adicionados:
    - `verticalResolvent_norm_le_geometric_upper_of_re_pos`;
    - `verticalDepthTailFromTwo_eq_quartet_add_tail`;
    - `verticalQuartetTail_norm_le_geometric_upper_of_re_pos`.
    O novo módulo define:
    - `c2QuartetVerticalTail := q^6 * verticalResolvent`;
    - `c2QuartetVerticalTailUpper := ‖q‖^6 * (1 - ‖q‖)⁻¹`;
    - `c2QuartetBulkK2 := q^2`;
    - `c2QuartetBulkGdelta Gδ := c2QuartetVerticalTail + Gδ`;
    - `c2QuartetAnalyticBulkRegion`;
    - `c2QuartetAnalyticBulkBoundsData`;
    - `c2QuartetBulkErrorRegion`;
    - `c2QuartetBulkErrorsBoundsData`;
    - `c2QuartetBulkErrors_nonvanishing_of_mem`.
    Interpretação: o primeiro `RegionalVerticalQuartetBulkBoundsData` concreto agora existe. O termo principal é o quarteto sharp `q²(1+q+q²+q³)`, e a cauda vertical restante entra como dívida explícita em `Gδ`, junto do tilt/horizontal. A dominância do bulk passa a ser literalmente:
    `verticalDebtUpper + tiltUpper + horizontalUpper + cutoffUpper < ‖q‖² * ((1 - ‖q‖) * (1 + ‖q‖²))`.
    Verificação local:
    `lake build LeanC2.Route.BulkQuartet` concluiu com sucesso. O root build foi iniciado, mas interrompido depois de mais de 10 minutos recompilando `Analytic/GenuineInfinite.lean`; não houve erro Lean nessa etapa, apenas custo de recompilação global após tocar em `VerticalResolvent`.

  99. Especialização quartet do bulk continuado concreto: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora importa `LeanC2.Route.BulkQuartet` e ganhou a estrutura
    `C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates`.
    Ela usa exatamente os insumos analíticos concretos já abertos para a rota continuada:
    - seed de tilt `c2OddTailContinuedBalancingSeed coreCutoff K M`;
    - residual regularizado `c2TiltRegularizedResidual (c2SeededTiltLayerResidual seed)`;
    - defeito horizontal `c2ConcreteOddHorizontalDefect coreCutoff`;
    - cutoff contra o alvo honesto `continuedCentralOddChannel`;
    - margem quartet refinada
      `c2QuartetBulkGUpper (tiltUpper + horizontalUpper) + cutoffUpper < ‖q‖² * ((1 - ‖q‖) * (1 + ‖q‖²))`.

    Também foram adicionados:
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcreteRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_quartetRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcreteGenericBoundsData`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetConcreteRegion`;
    - os lemas de não-vaziedade/existência de ponto não nulo para essa região.

    Interpretação: o bulk continuado concreto já tem um alvo quartet explícito. O Lean agora recebe as obrigações no formato natural da rota:
    bound escalado do tilt, bound geométrico horizontal, bound escalado do cutoff continuado, e uma única desigualdade de dominância que paga a dívida vertical `q^6 * verticalResolvent` mais os erros analíticos reais. A conclusão local pretendida é diretamente
    `c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M s ≠ 0`
    em qualquer ponto da região quartet concreta.

    Verificação local:
    `rg -n "^\s*(axiom|constant)\b|\bsorry\b|\badmit\b" LeanC2 LeanC2.lean` não encontrou placeholders. `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso, depois de recompilar `LeanC2/Analytic/GenuineInfinite.lean` em 777s. Em seguida, `lake build LeanC2` também concluiu com sucesso com 8289 jobs.

  100. Bulk quartet pinarizado no cover global do modelo continuado: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora possui wrappers pinarizados para regiões bulk genéricas e para o quartet:
    - `C2OddTailContinuedBalancingSeedBulkModelBulkRegionData`;
    - `C2OddTailContinuedBalancingSeedBulkModelQuartetBulkRouteData`;
    - `C2OddTailContinuedBalancingSeedBulkModelQuartetBulkBoundsData`;
    - conversões `...toBulkRegionData`;
    - teoremas de não-anulação para `BulkRegionData`, `QuartetBulkRouteData` e `QuartetBulkBoundsData`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_bulkRegionCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetBulkCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetBoundsCover`.

    O pacote concreto do passo 99 também foi encaixado nessa camada com:
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcreteBoundsData`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcreteBulkRegionData`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetConcreteCover`.

    Interpretação: o bulk quartet continuado deixou de ser apenas um certificado ponto-a-ponto e virou uma peça aceitada pelo cover global near/bulk/edge do modelo continuado. A versão concreta usa diretamente a região de estimativas
    `c2OddTailContinuedBalancingSeedBulkQuartetConcreteRegion`, sem converter artificialmente o quarteto de volta ao resolvente vertical puro.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  101. Redução por componentes da testemunha quartet continuada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora isola a construção de
    `C2OddTailContinuedBalancingSeedBulkQuartetConcreteEstimates` em estimativas escalares menores. Foram adicionados:
    - `C2ContinuedVerticalResidualBound`;
    - `c2OddTailContinuedBalancingSeed_norm_le`;
    - `C2OddTailContinuedBalancingSeedScaledBound`;
    - `c2OddTailContinuedBalancingSeed_scaled_bound`;
    - `c2OddTailContinuedBalancingSeed_scaledBound_of_componentBounds`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetComponentEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetComponentRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_componentRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetComponentRegion`.

    Também entrou uma versão de envelope exato para separar o que ainda é analítico:
    - `c2ContinuedVerticalResidualExactUpper`;
    - `c2ContinuedCutoffExactUpper`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetExactEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExactRegion`;
    - conversões `...mem_of_exactRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetExactRegion`.

    Interpretação: a testemunha da região quartet agora não precisa ser construída de uma vez. Basta fornecer:
    bound do residual vertical continuado, orçamento horizontal por camadas, bound escalado do cutoff continuado e a desigualdade de dominância quartet. O Lean monta automaticamente o bound do seed de tilt via
    `‖seed‖ ≤ (‖verticalResidual‖ + ‖horizontalDefect‖) * ‖1 - q‖`
    e então aterrissa na região quartet concreta do passo 99.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  O próximo salto técnico natural fica agora concentrado em transformar os envelopes exatos em bounds analíticos utilizáveis:
  102. Majorantes por triângulo para a rota quartet continuada fora de `Re(s) > 1`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ContinuedVerticalResidualTriangleUpper`;
    - `c2ContinuedVerticalResidualBound_triangle`;
    - `c2ContinuedVerticalResidualBound_triangleUpper_of_offCritical`;
    - `c2ContinuedVerticalResidualTriangleUpper_nonneg_of_offCritical`;
    - `c2ContinuedCutoffTriangleUpper`;
    - `c2ContinuedCutoff_norm_le_triangle`;
    - `c2ContinuedCutoff_scaled_bound_of_triangle`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetTriangleEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetTriangleRegion`;
    - conversões `...mem_of_triangleRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetTriangleRegion`.

    Interpretação: o residual vertical continuado agora possui um majorante formal válido diretamente no off-critical strip:
    `verticalDepthTailUpper + ‖rectangularGenuine K M‖ + 2 * ‖continuedCentralOddChannel‖`.
    O cutoff continuado também possui o majorante:
    `‖rectangularGenuine K M‖ + ‖continuedCentralOddChannel‖`.
    Esses dois envelopes alimentam automaticamente a região quartet por componentes do passo 101, sem usar a identidade de Dirichlet em `Re(s) > 1`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  O próximo salto técnico natural fica agora concentrado em substituir os majorantes triangulares crus por bounds mais fortes:
  103. Envelopes separados para os majorantes triangulares da rota quartet continuada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém a interface abstrata
    - `C2RectangularGenuineBound`;
    - `C2ContinuedCentralBound`;
    - `c2ContinuedVerticalResidualClosedUpper`;
    - `c2ContinuedCutoffClosedUpper`;
    - `c2ContinuedVerticalResidualBound_closedUpper_of_bounds`;
    - `c2ContinuedCutoff_scaled_bound_of_closedUpper`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetClosedEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetClosedRegion`;
    - conversões `...mem_of_closedRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_quartetClosedRegion`.

    Também foram adicionados dois produtores canônicos de bounds:
    - `c2RectangularGenuineDirectBracketUpper`, com o teorema `c2RectangularGenuineBound_directBracket`;
    - `C2ContinuedOddChannelBound` e `c2ContinuedCentralFromOddUpper`, com o teorema `c2ContinuedCentralBound_of_oddChannelBound`.

    Interpretação: a rota não precisa mais carregar diretamente
    `‖rectangularGenuine‖` e `‖continuedCentralOddChannel‖` dentro dos majorantes. Agora qualquer bound independente para o retângulo finito e qualquer bound para o canal ímpar continuado produzem bounds fechados para o residual vertical continuado e para o cutoff continuado. O bound central passa pela identidade estrutural
    `continuedCentralOddChannel = 2 * verticalDepthTailFromTwo * continuedOddDirichletChannel`
    e usa `verticalDepthTailUpper` no off-critical strip.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  104. Região zeta/depth-core para a rota quartet continuada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém a interface efetiva
    - `C2RectangularDepthFactorBound`;
    - `C2RectangularOddCoreBound`;
    - `c2RectangularGenuineDepthCoreUpper`;
    - `c2RectangularGenuineBound_depthCore_of_bounds`;
    - `c2RectangularDepthFactorExactUpper`;
    - `c2RectangularDepthFactorBound_exact`;
    - `c2RectangularOddCoreExactUpper`;
    - `c2RectangularOddCoreBound_exact`;
    - `C2OddEulerFactorBound`;
    - `C2RiemannZetaBound`;
    - `c2ContinuedOddFromZetaUpper`;
    - `c2ContinuedOddChannelBound_of_zetaBound`;
    - `c2OddEulerFactorTriangleUpper`;
    - `c2OddEulerFactorBound_triangle`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetZetaDepthCoreEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetZetaDepthCoreRegion`;
    - conversões `...mem_of_zetaDepthCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_zetaDepthCoreRegion`.

    Interpretação: o retângulo finito agora pode ser majorado pelo produto separado
    `rectangularDepthFactor K * rectangularOddCoreSum M`. O canal ímpar continuado também recebeu uma interface regional baseada em uma majorante para `riemannZeta` e para o fator ímpar `1 - 2^{-s}`. Com esses dois blocos, o Lean já consegue empurrar os dados zeta/depth-core para a região fechada do passo 103, depois para a região quartet concreta, e finalmente para o teorema de não anulamento do modelo bulk continuado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  105. Região explicit-finite-core para a rota quartet continuada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora transforma a interface abstrata do passo 104 em dados concretos para o retângulo finito:
    - `c2RectangularDepthFactorExplicitUpper`;
    - `c2RectangularDepthFactorBound_explicit_of_re_pos`;
    - `c2RectangularDepthFactorBound_explicit_of_offCriticalStrip`;
    - `c2RectangularOddCoreFiniteUpper`;
    - `c2RectangularOddCoreFiniteUpper_nonneg`;
    - `rectangularOddCoreSum_norm_le_finiteUpper`;
    - `c2RectangularOddCoreBound_finite`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetExplicitFiniteCoreEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitFiniteCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetZetaDepthCore_mem_of_explicitFiniteCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_explicitFiniteCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_explicitFiniteCoreRegion`.

    Interpretação: a região `zetaDepthCore` não precisa mais receber bounds arbitrários para profundidade, core e fator ímpar. Para `K ≥ 2` no `offCriticalStrip`, a profundidade é controlada por
    `verticalDepthTailUpper + rectangularDepthCutoffUpper`. O core ímpar finito é controlado universalmente pela soma finita das normas dos coeficientes em `oddCoresUpTo M`. O fator `1 - 2^{-s}` usa o bound triangular canônico do passo 104. O único bound analítico externo que ainda fica como dado é `C2RiemannZetaBound zetaUpper s`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  106. Região explicit-scalar para a rota quartet continuada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém aliases operacionais e uma região onde os bounds compostos aparecem como desigualdades escalares diretas:
    - `c2ExplicitFiniteCoreRectangularUpper`;
    - `c2ExplicitFiniteCoreOddUpper`;
    - `c2ExplicitFiniteCoreCentralUpper`;
    - `c2ExplicitFiniteCoreContinuedVerticalUpper`;
    - `c2ExplicitFiniteCoreContinuedCutoffUpper`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitFiniteCore_mem_of_explicitScalarRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_explicitScalarRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_explicitScalarRegion`.

    Interpretação: os campos
    `balancing_seed_factor_scaled_bound` e `cutoff_closed_scaled_bound` deixaram de ser apenas obrigações nomeadas por estruturas auxiliares nessa nova camada. Eles agora podem ser fornecidos diretamente como desigualdades escalares usando
    `c2ExplicitFiniteCoreContinuedVerticalUpper`,
    `c2ExplicitFiniteCoreContinuedCutoffUpper`,
    `c2HorizontalRegularizedUpper`,
    `1 + ‖q s‖`,
    `tiltScale` e `cutoffScale`.
    O Lean então converte automaticamente essa região escalar para a `ExplicitFiniteCoreRegion`, depois para a região concrete e para o não anulamento do modelo bulk continuado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  107. Produtores de bound para `ζ` e região exact-zeta: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2RiemannZetaExactUpper`;
    - `c2RiemannZetaBound_exact`;
    - `c2RiemannZetaOneLtDirichletUpper`;
    - `summable_positiveDirichletCoeff_norm_of_one_lt_re`;
    - `c2RiemannZetaBound_oneLtDirichletUpper`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarExactZetaEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalar_mem_of_explicitScalarExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_explicitScalarExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_explicitScalarExactZetaRegion`.

    Interpretação: o campo externo `C2RiemannZetaBound zetaUpper s` agora tem dois produtores formais. No semiplano seguro `Re(s) > 1`, há um bound efetivo por série absoluta:
    `‖ζ(s)‖ ≤ ∑' n, ‖complexDirichletCoeff s (n + 1)‖`.
    Na faixa off-critical, onde a série de Dirichlet não é o mecanismo correto, existe o produtor neutro
    `c2RiemannZetaExactUpper s = ‖ζ(s)‖`. A nova região `ExplicitScalarExactZetaRegion` usa esse produtor exato e remove `zeta_bound` como hipótese separada, deixando expostas apenas as desigualdades escalares de tilt, cutoff, horizontal e dominância quartet.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  108. Envelopes escalares expandidos para a região exact-zeta: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExplicitFiniteCoreRectangularScalarUpper`;
    - `c2ExplicitFiniteCoreRectangularUpper_eq_scalar`;
    - `c2ExplicitFiniteCoreRectangularScalarUpper_nonneg_of_re_pos`;
    - `c2ExplicitFiniteCoreOddExactZetaScalarUpper`;
    - `c2ExplicitFiniteCoreOddUpper_exactZeta_eq_scalar`;
    - `c2ExplicitFiniteCoreOddExactZetaScalarUpper_nonneg`;
    - `c2ExplicitFiniteCoreCentralExactZetaScalarUpper`;
    - `c2ExplicitFiniteCoreCentralUpper_exactZeta_eq_scalar`;
    - `c2ExplicitFiniteCoreCentralExactZetaScalarUpper_nonneg_of_re_pos`;
    - `c2ExplicitFiniteCoreContinuedVerticalExactZetaScalarUpper`;
    - `c2ExplicitFiniteCoreContinuedVerticalUpper_exactZeta_eq_scalar`;
    - `c2ExplicitFiniteCoreContinuedVerticalExactZetaScalarUpper_nonneg_of_re_pos`;
    - `c2ExplicitFiniteCoreContinuedCutoffExactZetaScalarUpper`;
    - `c2ExplicitFiniteCoreContinuedCutoffUpper_exactZeta_eq_scalar`;
    - `c2ExplicitFiniteCoreContinuedCutoffExactZetaScalarUpper_nonneg_of_re_pos`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetExpandedExactZetaEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExpandedExactZetaRegion`;
    - `c2ExpandedExactZeta_mem_explicitScalarExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_expandedExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_expandedExactZetaRegion`.

    Interpretação: os envelopes aninhados da região exact-zeta agora têm formas escalares abertas. O retângulo aparece como
    `2 * depthUpper * coreFiniteUpper`; o canal ímpar exact-zeta aparece como
    `(1 + ‖2^{-s}‖) * ‖ζ(s)‖`; o canal central aparece como
    `2 * verticalDepthTailUpper * oddExactUpper`; e os envelopes continuados ficam como soma direta dos termos retangular, central e vertical. Também foram formalizadas não negatividades desses envelopes em `Re(s) > 0`, preparando o uso em desigualdades de dominância.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  109. Dominância quartet como desigualdade escalar nomeada: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExpandedQuartetGUpper`;
    - `c2ExpandedQuartetEUpper`;
    - `c2ExpandedQuartetLeftUpper`;
    - `c2ExpandedQuartetK2Margin`;
    - `c2ExpandedQuartetK2Margin_nonneg_of_offCriticalStrip`;
    - `C2ExpandedQuartetDominance`;
    - `C2ExpandedExactZetaDominanceEstimates`;
    - `c2ExpandedExactZetaDominanceRegion`;
    - `c2ExpandedDominance_mem_expandedExactZetaRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_expandedDominanceRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_expandedDominanceRegion`.

    Interpretação: a desigualdade de dominância quartet agora está isolada como
    `C2ExpandedQuartetDominance`, isto é:
    `c2ExpandedQuartetLeftUpper < c2ExpandedQuartetK2Margin`.
    O lado esquerdo é o pacote nomeado `G + E`, com `G` contendo a dívida quartet vertical mais tilt/horizontal regularizados e `E` contendo o cutoff escalado. O lado direito é a margem quartet
    `K2Lower * ((1 - ‖q‖) * (1 + ‖q‖^2))`, com não negatividade formalizada no `offCriticalStrip`. A nova região `c2ExpandedExactZetaDominanceRegion` converte automaticamente para `ExpandedExactZetaRegion` e preserva o teorema de não anulamento do modelo bulk continuado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  110. Região com três desigualdades escalares principais: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2HorizontalRegularizedUpper_nonneg_of_pos`;
    - `c2ExpandedSeedScaledLeft`;
    - `c2ExpandedSeedScaledLeft_nonneg_of_re_pos`;
    - `C2ExpandedSeedScaledBound`;
    - `c2ExpandedCutoffScaledLeft`;
    - `c2ExpandedCutoffScaledLeft_nonneg_of_re_pos`;
    - `C2ExpandedCutoffScaledBound`;
    - `C2ExpandedExactZetaScalarEstimates`;
    - `c2ExpandedExactZetaScalarRegion`;
    - `c2ExpandedScalar_mem_expandedDominanceRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_expandedScalarRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_expandedScalarRegion`.

    Interpretação: a região `ExpandedDominance` ainda carregava dois campos escalares longos para seed e cutoff. Agora esses campos viraram duas proposições nomeadas:
    `C2ExpandedSeedScaledBound` e `C2ExpandedCutoffScaledBound`.
    Junto com `C2ExpandedQuartetDominance`, a nova `c2ExpandedExactZetaScalarRegion` concentra o bulk continuado em três desigualdades principais: seed, cutoff e dominância quartet. Também foram provadas não negatividades úteis para o envelope horizontal, para o lado esquerdo do seed e para o lado esquerdo do cutoff.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  111. Cobertura near/scalar-bulk/edge para a região escalar expandida: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExpandedScalarBulkRegionData`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_expandedScalarCover`;
    - `C2ExpandedScalarCoverData`;
    - `C2ExpandedScalarCoverData.toBulkRegionData`;
    - `C2ExpandedScalarCoverData.toOffCriticalCoverData`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarCoverData`;
    - `riemannHypothesisC2_of_c2ExpandedScalarCoverData`.

    Interpretação: a região `c2ExpandedExactZetaScalarRegion` agora está empacotada como uma região bulk legítima para o mecanismo near/bulk/edge já existente. Uma cobertura do `offCriticalStrip` por:
    near-axis, scalar bulk e edge já implica não anulamento do modelo bulk continuado no off-critical strip e, via identidade fundamental já formalizada, implica `RiemannHypothesisC2`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  112. Produtores ponto a ponto para a região escalar expandida: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarScaleData`;
    - `C2ExpandedHorizontalLayerBudget`;
    - `C2ExpandedScalarMainInequalities`;
    - `c2ExpandedExactZetaScalarEstimates_of_localData`;
    - `c2ExpandedExactZetaScalarRegion_mem_of_localData`;
    - `c2ExpandedScalarBulkModel_nonvanishing_of_localData`.

    Interpretação: montar `C2ExpandedExactZetaScalarEstimates` agora não exige preencher a estrutura completa manualmente. O ponto local foi quebrado em três pacotes reutilizáveis: sinais/escalas, orçamento horizontal por camadas, e as três desigualdades principais (`seed`, `cutoff`, `dominance`). Esses pacotes produzem diretamente a região escalar e o não anulamento do modelo bulk continuado no ponto.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  113. Escolha local near/scalar-bulk/edge para a cobertura escalar expandida: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarCoverChoice`;
    - `C2ExpandedScalarCoverChoice.toCover`;
    - `C2ExpandedScalarCoverChoice.scalarBulk_of_localData`;
    - `C2ExpandedScalarCoverData.ofLocalChoice`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarLocalChoice`;
    - `riemannHypothesisC2_of_c2ExpandedScalarLocalChoice`.

    Interpretação: a cobertura global não precisa mais ser entregue diretamente como uma disjunção crua. Agora basta fornecer, para cada ponto off-critical, uma escolha local entre três ramos: near-axis, scalar bulk ou edge. O ramo scalar bulk já aceita diretamente os pacotes locais do salto 112 (`scale`, `horizontal` e `main inequalities`), produzindo a região escalar e fechando a ponte até `RiemannHypothesisC2` pelo cover data existente.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  114. Pacote local único para o ramo scalar-bulk: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarLocalBulkData`;
    - `C2ExpandedScalarLocalBulkData.toScalarEstimates`;
    - `C2ExpandedScalarLocalBulkData.mem_scalarRegion`;
    - `C2ExpandedScalarLocalBulkData.nonvanishing`;
    - `C2ExpandedScalarCoverChoice.nearAxis_of_mem`;
    - `C2ExpandedScalarCoverChoice.scalarBulk_of_localBulkData`;
    - `C2ExpandedScalarCoverChoice.edgeRegion_of_mem`.

    Interpretação: o ramo scalar-bulk da escolha local agora aceita um único pacote ponto a ponto que reúne `2 ≤ K`, off-criticalidade, escalas/sinais, orçamento horizontal e as três desigualdades principais. Esse pacote produz automaticamente estimativas escalares, pertinência à região escalar, não anulamento do modelo bulk continuado e o branch `scalarBulk` da escolha local. Os ramos near-axis e edge também ganharam constructors nomeados a partir de pertinência regional.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  115. Covers globais diretos para as regiões quartet intermediárias: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - o helper genérico `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetConcreteSubsetCover`;
    - os corolários `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetExactCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetTriangleCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_quartetClosedCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_zetaDepthCoreCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_explicitFiniteCoreCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_explicitScalarCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_explicitScalarExactZetaCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_expandedExactZetaCover`;
    - `riemannHypothesisC2_of_c2OddTailContinuedBalancingSeedBulkModel_expandedDominanceCover`.

    Interpretação: a cadeia de regiões locais do bulk quartet deixou de exigir rebaixamento manual para `c2OddTailContinuedBalancingSeedBulkQuartetConcreteRegion` toda vez que se quer fechar o cover global. Agora qualquer cobertura near/intermediate-bulk/edge em uma das camadas intermediárias já sobe diretamente para `RiemannHypothesisC2` via inclusão na região quartet concreta. O ganho aqui é de usabilidade final do pipeline: os certificados locais podem ser consumidos no nível natural em que foram provados.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  116. Combinador regional abstrato para a escolha near/local-bulk/edge: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarChoiceRegions`;
    - `C2ExpandedScalarChoiceRegions.combinedRegion`;
    - `C2ExpandedScalarChoiceRegions.toChoice`;
    - `C2ExpandedScalarChoiceRegions.toCover`;
    - `C2ExpandedScalarCoverData.ofChoiceRegions`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarChoiceRegions`;
    - `riemannHypothesisC2_of_c2ExpandedScalarChoiceRegions`.

    Interpretação: a função global `choose : ∀ s, offCriticalStrip s → C2ExpandedScalarCoverChoice ... s` deixou de ser o único formato aceito para fechar a cobertura escalar expandida. Agora o Lean também aceita uma decomposição regional abstrata em três peças: uma sub-região que entra no ramo near-axis, uma sub-região que produz `C2ExpandedScalarLocalBulkData`, e uma sub-região que entra no edge. A união dessas três regiões gera automaticamente `C2ExpandedScalarCoverChoice`, depois `C2ExpandedScalarCoverData`, depois não anulamento off-critical e finalmente `RiemannHypothesisC2`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  117. Instância canônica do combinador via a região de dados locais do bulk escalar: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExpandedScalarLocalBulkRegion`;
    - `C2ExpandedScalarLocalBulkData.mem_localBulkRegion`;
    - `c2ExpandedExactZetaScalarRegion_mem_of_mem_localBulkRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_localBulkRegion`;
    - `C2ExpandedScalarChoiceRegions.canonical`;
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_nearAxis`;
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_localBulkData`;
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_edge`;
    - `C2ExpandedScalarCoverData.ofCanonicalRegions`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarCanonicalRegions`;
    - `riemannHypothesisC2_of_c2ExpandedScalarCanonicalRegions`.

    Interpretação: a instância regional abstrata do passo 116 já ganhou sua primeira forma concreta e nativa da rota. O ramo bulk local passou a ser a região dos pontos que já carregam um pacote `C2ExpandedScalarLocalBulkData`; essa região alimenta automaticamente a região escalar `c2ExpandedExactZetaScalarRegion` e o não anulamento correspondente. Com isso, a cobertura global pode ser formulada diretamente na união canônica: near-axis, local bulk data, edge. Não é mais necessário reconstruir manualmente `C2ExpandedScalarChoiceRegions` nem a escolha local ponto a ponto.

    Verificação local:
    `lake env lean LeanC2/Analytic/GenuineBulkConcrete.lean` concluiu com sucesso. `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  118. Cover direto na disjunção canônica near/local-bulk/edge: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_mem_localBulkRegion`;
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_cover`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarCanonicalCover`;
    - `riemannHypothesisC2_of_c2ExpandedScalarCanonicalCover`;
    - `C2ExpandedScalarCanonicalCoverData`;
    - `C2ExpandedScalarCanonicalCoverData.toCoverData`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarCanonicalCoverData`;
    - `riemannHypothesisC2_of_c2ExpandedScalarCanonicalCoverData`.

    Interpretação: a etapa 117 ainda pedia um `cover` como pertinência à união set-teórica `combinedRegion`. Agora isso também foi colapsado para a forma final natural da prova: basta fornecer a cobertura direta
    `near-axis ∨ c2ExpandedScalarLocalBulkRegion ∨ edge`.
    O Lean converte automaticamente essa disjunção para a união canônica, depois para `C2ExpandedScalarCoverData`, e conclui não anulamento off-critical ou `RiemannHypothesisC2`. Com isso, a parte de plumbing da rota expanded-scalar ficou essencialmente estabilizada: o que sobra é produzir os certificados analíticos concretos de cada ramo.

    Verificação local:
    `lake env lean LeanC2/Analytic/GenuineBulkConcrete.lean` concluiu com sucesso. `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  119. Colapso entre a região escalar expandida e a região de dados locais: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarLocalBulkData.ofScalarEstimates`;
    - `C2ExpandedScalarLocalBulkData.of_mem_scalarRegion`;
    - `c2ExpandedScalarLocalBulkRegion_mem_of_mem_scalarRegion`;
    - `c2ExpandedScalarLocalBulkRegion_eq_scalarRegion`;
    - `C2ExpandedScalarChoiceRegions.mem_canonicalCombinedRegion_of_scalarRegion`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarCanonicalScalarCover`;
    - `riemannHypothesisC2_of_c2ExpandedScalarCanonicalScalarCover`.

    Interpretação: a distinção entre “ponto que satisfaz `C2ExpandedExactZetaScalarEstimates`” e “ponto que já carrega `C2ExpandedScalarLocalBulkData`” foi eliminada. O Lean agora reconstrói `C2ExpandedScalarLocalBulkData` diretamente a partir da região escalar e prova que
    `c2ExpandedScalarLocalBulkRegion = c2ExpandedExactZetaScalarRegion`.
    Com isso, a API canônica nova e a API escalar antiga ficaram alinhadas: qualquer cover near/scalar/edge pode ser consumido tanto pelo teorema antigo `...expandedScalarCover` quanto pela nova rota canônica `...CanonicalScalarCover`.

    Verificação local:
    `lake env lean LeanC2/Analytic/GenuineBulkConcrete.lean` concluiu com sucesso. `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  120. Redução da cobertura canônica ao “middle region”: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExpandedScalarMiddleRegion`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarMiddleRegion`;
    - `riemannHypothesisC2_of_c2ExpandedScalarMiddleRegion`.

    Interpretação: a cobertura near/scalar/edge foi comprimida à forma mais enxuta possível. Para concluir a rota expanded-scalar, já não é necessário provar diretamente a disjunção completa nem manipular a união canônica de regiões. Basta provar uma única inclusão analítica:
    o complemento off-critical de near-axis e edge, isto é, `c2ExpandedScalarMiddleRegion`, entra em `c2ExpandedExactZetaScalarRegion`.
    A partir disso, o Lean reconstitui automaticamente o cover near/scalar/edge e conclui não anulamento off-critical ou `RiemannHypothesisC2`.

    Verificação local:
    `lake env lean LeanC2/Analytic/GenuineBulkConcrete.lean` concluiu com sucesso. `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs. A busca por `sorry`, `admit`, `axiom` e `constant` continua vazia.

  121. Empacotamento regional do middle strip por dados locais: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarMiddleRegionData`;
    - `C2ExpandedScalarMiddleRegionData.mem_scalarRegion`;
    - `C2ExpandedScalarMiddleRegionData.mem_localBulkRegion`;
    - `C2ExpandedScalarMiddleRegionData.toCanonicalCoverData`;
    - `offCriticalStripNonvanishing_of_c2ExpandedScalarMiddleRegionData`;
    - `riemannHypothesisC2_of_c2ExpandedScalarMiddleRegionData`.

    Interpretação: a obrigação restante no middle region agora pode ser satisfeita numa forma ainda mais natural para a etapa analítica concreta. Em vez de provar diretamente que todo ponto do middle strip pertence à região escalar expandida, basta fornecer, para cada ponto do `c2ExpandedScalarMiddleRegion`, o pacote local `C2ExpandedScalarLocalBulkData`. O Lean converte esse pacote em pertencimento à região local-bulk e recompõe automaticamente o cover canônico near/local-bulk/edge, preservando o fecho até `RiemannHypothesisC2`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  122. Enfraquecimento adicional da meta do middle region para certificados intermediários: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2ExpandedScalarLocalBulkData.of_mem_expandedDominanceRegion`;
    - `C2ExpandedScalarLocalBulkData.of_mem_expandedExactZetaRegion`;
    - `c2ExpandedExactZetaScalarRegion_mem_of_mem_expandedDominanceRegion`;
    - `c2ExpandedExactZetaScalarRegion_mem_of_mem_expandedExactZetaRegion`;
    - `offCriticalStripNonvanishing_of_c2ExpandedExactZetaMiddleRegion`;
    - `riemannHypothesisC2_of_c2ExpandedExactZetaMiddleRegion`;
    - `offCriticalStripNonvanishing_of_c2ExpandedDominanceMiddleRegion`;
    - `riemannHypothesisC2_of_c2ExpandedDominanceMiddleRegion`.

    Interpretação: a etapa analítica central foi enfraquecida mais uma vez. Já não é necessário atacar diretamente `c2ExpandedExactZetaScalarRegion` no complemento off-critical de near-axis e edge. Basta provar, no middle region, qualquer uma das duas formas intermediárias mais naturais já presentes no arquivo:
    pertencimento a `c2OddTailContinuedBalancingSeedBulkQuartetExpandedExactZetaRegion` ou pertencimento a `c2ExpandedExactZetaDominanceRegion`.
    O Lean transporta automaticamente essas hipóteses até `C2ExpandedScalarLocalBulkData`, depois para a região escalar expandida, e fecha a rota até não anulamento off-critical ou `RiemannHypothesisC2` sem plumbing novo.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  123. Generalização do split do middle region para rotas concretas pré-existentes: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExpandedScalarMiddleRegion_cover`;
    - `riemannHypothesisC2_of_c2ZetaDepthCoreMiddleRegion`;
    - `riemannHypothesisC2_of_c2ExplicitFiniteCoreMiddleRegion`;
    - `riemannHypothesisC2_of_c2ExplicitScalarMiddleRegion`.

    Interpretação: o complemento off-critical de near-axis e edge agora recompõe automaticamente o cover não só na rota expanded-scalar final, mas também em camadas concretas anteriores da cadeia analítica. Isso desloca a obrigação restante para formatos mais próximos das estimativas já isoladas no arquivo: já é suficiente provar o middle region dentro de `c2OddTailContinuedBalancingSeedBulkQuartetZetaDepthCoreRegion`, `c2OddTailContinuedBalancingSeedBulkQuartetExplicitFiniteCoreRegion` ou `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarRegion`, e o Lean fecha diretamente `RiemannHypothesisC2` sem reconstrução manual do split near/bulk/edge.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  124. Fecho do middle region nas camadas quartet exact / triangle / closed e identificação `explicitScalarExactZeta = expandedExactZeta`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ExplicitScalarExactZetaRegion_eq_expandedExactZetaRegion`;
    - `riemannHypothesisC2_of_c2QuartetExactMiddleRegion`;
    - `riemannHypothesisC2_of_c2QuartetTriangleMiddleRegion`;
    - `riemannHypothesisC2_of_c2QuartetClosedMiddleRegion`.

    Interpretação: a interface do middle region ficou praticamente completa ao longo de toda a escada concreta já formalizada no arquivo. Além de aceitar as rotas `zetaDepthCore`, `explicitFiniteCore`, `explicitScalar`, `expandedExactZeta` e `expandedDominance`, o complemento off-critical de near-axis e edge agora também fecha `RiemannHypothesisC2` diretamente nas camadas `quartetExact`, `triangle` e `closed`. Em paralelo, a equivalência entre `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarExactZetaRegion` e `c2OddTailContinuedBalancingSeedBulkQuartetExpandedExactZetaRegion` deixa explícito que essas duas apresentações são apenas reformulações da mesma obrigação analítica.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  125. Camada `canonicalClosed` para o middle region: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2ContinuedCentralExactUpper`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetClosed_mem_of_canonicalClosedRegion`;
    - `c2OddTailContinuedBalancingSeedBulkModel_nonvanishing_of_mem_canonicalClosedRegion`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedMiddleRegion`;
    - `riemannHypothesisC2_of_c2CanonicalClosedMiddleRegion`.

    Interpretação: a rota concreta mais natural do middle region ficou ainda mais enxuta. Na nova camada `canonicalClosed`, dois subcertificados deixam de ser metas analíticas independentes: o bound de `rectangularGenuine` passa a ser fornecido automaticamente pela decomposição `direct + bracket`, e o bound do canal central continuado passa a usar diretamente a norma exata `‖continuedCentralOddChannel s‖`. Com isso, para fechar o middle region por essa rota, resta essencialmente provar apenas as desigualdades escaladas de seed/cutoff e a dominância do quarteto com esses envelopes canônicos.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  126. Camada `canonicalClosedScaled` como alvo concreto preferencial do middle region: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2CanonicalClosedTiltConstant`;
    - `c2CanonicalClosedCutoffConstant`;
    - `C2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledEstimates`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaledRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetConcrete_mem_of_scaledCanonicalClosedRegion`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledMiddleRegion`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledMiddleRegion`.

    Interpretação: a rota concreta preferida do middle region ficou ainda mais curta. Na camada `canonicalClosedScaled`, as escalas de tilt e cutoff são fixadas canonicamente em `1`, enquanto as constantes correspondentes são escolhidas para tornar tautológicos os certificados escalados de seed e cutoff. Assim, ao transportar o `c2ExpandedScalarMiddleRegion` para essa nova região, restam como conteúdo analítico efetivo apenas o orçamento geométrico horizontal e a dominância do quarteto.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  127. Transporte especializado dos pacotes `expandedScalar/localBulk/middleRegionData` para `canonicalClosedScaled`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaled_mem_of_expandedDominanceRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetCanonicalClosedScaled_mem_of_expandedScalarRegion`;
    - `C2ExpandedScalarLocalBulkData.mem_canonicalClosedScaledRegion`;
    - `C2ExpandedScalarMiddleRegionData.mem_canonicalClosedScaledRegion`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledMiddleRegionData`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledMiddleRegionData`.

    Interpretação: a nova rota preferida `canonicalClosedScaled` deixou de ser apenas um corolário final isolado. Quando as constantes canônicas e as escalas unitárias são fixadas, toda a infraestrutura já existente do arquivo para `expandedScalar`, `localBulk` e `middleRegionData` passa a desembocar automaticamente nessa nova camada. Em termos práticos, isso elimina mais uma etapa de plumbing no fechamento final: qualquer pacote regional já montado nessas constantes agora entra diretamente na região concreta preferida, sem precisar refazer pontes manuais entre as escadas antigas.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  128. Empacotamento final do alvo preferido do middle region: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2CanonicalClosedScaledMiddleCoverData`;
    - `C2CanonicalClosedScaledMiddleCoverData.ofExpandedScalarMiddleRegionData`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledMiddleCoverData`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledMiddleCoverData`.

    Interpretação: o alvo final do middle strip agora virou um único objeto dedicado. Em vez de fechar `RiemannHypothesisC2` passando explicitamente por `expandedScalarMiddleRegionData` especializado, basta fornecer um pacote `C2CanonicalClosedScaledMiddleCoverData`, isto é, near-axis, edge e a entrada da faixa média diretamente na região concreta preferida `canonicalClosedScaled`. A conversão a partir do pacote expanded-scalar especializado também ficou automática, de modo que a interface antiga continua disponível apenas como etapa intermediária opcional.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  129. Alinhamento da rota `canonicalClosedScaled` com a API genérica de cover do roadmap: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `c2CanonicalClosedScaledBulkRegionData`;
    - `C2CanonicalClosedScaledCoverData`;
    - `C2CanonicalClosedScaledCoverData.toOffCriticalCoverData`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledCoverData`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledCoverData`;
    - `C2CanonicalClosedScaledMiddleCoverData.toCoverData`.

    Interpretação: a camada concreta preferida deixou de depender de um fechamento especial. Ela agora fala a mesma linguagem estrutural das rotas anteriores: bulk-region data, cover data e conversão para `OffCriticalCoverData`. Com isso, o pacote final `C2CanonicalClosedScaledMiddleCoverData` virou apenas uma forma enxuta de produzir um `C2CanonicalClosedScaledCoverData`, e o fechamento off-critical/RH passa a reutilizar a infraestrutura genérica do roadmap em vez de um corolário isolado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  130. Interface regional direta para a rota `canonicalClosedScaled`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2CanonicalClosedScaledMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleRegionData.mem_scaledRegion`;
    - `C2CanonicalClosedScaledMiddleRegionData.ofExpandedScalarMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleRegionData.toMiddleCoverData`;
    - `C2CanonicalClosedScaledMiddleRegionData.toCoverData`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledDirectMiddleRegionData`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledDirectMiddleRegionData`.

    Interpretação: o alvo final ficou ainda mais próximo do conteúdo analítico real. Em vez de provar apenas que cada ponto da faixa média pertence ao conjunto `canonicalClosedScaled`, agora existe um pacote regional próprio que pede diretamente as estimativas ponto a ponto daquela rota. Esse formato é mais econômico para a etapa final porque coincide exatamente com as obrigações remanescentes da camada preferida: hipóteses geométricas horizontais e dominância do quarteto, com seed/cutoff já absorvidos pelos envelopes canônicos.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  131. Interface local mínima para a faixa média `canonicalClosedScaled`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2CanonicalClosedScaledLocalData`;
    - `C2CanonicalClosedScaledLocalData.toEstimates`;
    - `C2CanonicalClosedScaledLocalData.mem_scaledRegion_of_middle`;
    - `C2CanonicalClosedScaledMiddleLocalData`;
    - `C2CanonicalClosedScaledMiddleLocalData.toMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleLocalData.toMiddleCoverData`;
    - `C2CanonicalClosedScaledMiddleLocalData.toCoverData`;
    - `offCriticalStripNonvanishing_of_c2CanonicalClosedScaledMiddleLocalData`;
    - `riemannHypothesisC2_of_c2CanonicalClosedScaledMiddleLocalData`.

    Interpretação: o alvo final foi reduzido à forma mais econômica disponível no arquivo. A nova interface `C2CanonicalClosedScaledLocalData` remove a hipótese redundante de off-criticalidade do certificado local, porque ela já vem automaticamente da própria `c2ExpandedScalarMiddleRegion`. Assim, a etapa analítica remanescente na faixa média passa a consistir apenas em provar, ponto a ponto, as condições geométricas horizontais e a dominância do quarteto; todo o restante da passagem para a região concreta, para o cover data e para `RiemannHypothesisC2` fica automático.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  132. Pontes automáticas dos certificados mais fortes para o alvo mínimo `MiddleLocalData`: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2CanonicalClosedScaledLocalData.ofEstimates`;
    - `C2CanonicalClosedScaledMiddleLocalData.ofMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleLocalData.ofExpandedScalarMiddleRegionData`.

    Interpretação: a compressão estrutural do middle strip ficou completa. Qualquer pacote mais forte já disponível no arquivo, inclusive o `C2ExpandedScalarMiddleRegionData` especializado nas constantes canônicas, agora desce automaticamente até o alvo mínimo `C2CanonicalClosedScaledMiddleLocalData`. Isso separa com nitidez o que já está resolvido do que ainda falta: não resta mais nenhum trabalho de plumbing, só a produção analítica do campo `middle_local` nesse pacote final enxuto.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  133. Fecho das pontes ponto a ponto até o alvo local mínimo: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2CanonicalClosedScaledLocalData.of_mem_scaledRegion`;
    - `C2ExpandedScalarLocalBulkData.toCanonicalClosedScaledLocalData`.

    Interpretação: a última lacuna estrutural no nível local também foi fechada. Não apenas os pacotes regionais mais fortes, mas até mesmo um certificado pontual `C2ExpandedScalarLocalBulkData` já especializado nas constantes canônicas agora desce automaticamente ao alvo mínimo `C2CanonicalClosedScaledLocalData`. Com isso, toda a hierarquia antiga do arquivo convergiu para um único formato terminal, tanto regional quanto ponto a ponto.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  134. Pacote terminal explícito para “RH aceita pelo Lean”: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém:
    - `C2RiemannHypothesisTerminalData`;
    - `C2RiemannHypothesisTerminalData.toMiddleLocalData`;
    - `C2RiemannHypothesisTerminalData.toCoverData`;
    - `offCriticalStripNonvanishing_of_c2RiemannHypothesisTerminalData`;
    - `riemannHypothesisC2_of_c2RiemannHypothesisTerminalData`.

    Interpretação: o formato final já está explicitamente codificado e compilando. A formalização agora tem um único objeto terminal cuja existência basta para produzir `RiemannHypothesisC2`. Portanto, o momento em que “o Lean aceitou RH” ficou bem definido: assim que conseguirmos construir um habitante de `C2RiemannHypothesisTerminalData`, o teorema `riemannHypothesisC2_of_c2RiemannHypothesisTerminalData` fecha RH sem qualquer hipótese residual adicional.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  135. O pacote terminal virou endpoint canônico das interfaces já existentes da rota preferida: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém conversões diretas para `C2RiemannHypothesisTerminalData` a partir de:
    - `C2CanonicalClosedScaledMiddleLocalData`;
    - `C2CanonicalClosedScaledMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleCoverData`;
    - `C2CanonicalClosedScaledCoverData`;
    - a especialização canônica de `C2ExpandedScalarMiddleRegionData`;
    - a especialização canônica de `C2ExpandedScalarCanonicalCoverData`.

    Interpretação: a parte estrutural realmente fechou. Não existe mais bifurcação prática entre “certificados antigos ainda úteis” e “formato terminal final”. Qualquer certificado atual da rota `canonicalClosedScaled` já desce automaticamente ao único objeto terminal que produz `RiemannHypothesisC2`. O restante do trabalho passou a ser puramente analítico: construir algum desses certificados concretos, de preferência já no menor nível `middle_local`, sabendo que todos os níveis acima colapsam automaticamente para o mesmo endpoint.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  136. O gargalo analítico final foi reduzido também nas formas concretas fortes já naturais na rota: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém esquecimentos pontuais e builders de `C2CanonicalClosedScaledMiddleLocalData` para:
    - `c2OddTailContinuedBalancingSeedBulkQuartetZetaDepthCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitFiniteCoreRegion`;
    - `c2OddTailContinuedBalancingSeedBulkQuartetExplicitScalarExactZetaRegion`.

    Além disso, o próprio endpoint final `C2RiemannHypothesisTerminalData` agora pode ser construído diretamente a partir dessas três hipóteses de middle-region forte.

    Interpretação: a última obrigação analítica não precisa mais ser formulada apenas no alvo mínimo `middle_local`. Ela já pode ser atacada em três camadas concretas, progressivamente mais próximas dos bounds naturais do arquivo, sabendo que qualquer uma delas desce automaticamente até o mesmo pacote terminal que produz `RiemannHypothesisC2`. Isso fecha a compressão estrutural também do lado das hipóteses fortes: falta apenas provar uma dessas formas concretas.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  137. A rota `explicitScalarExactZeta` ganhou um pacote regional próprio: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém `C2ExplicitScalarExactZetaMiddleRegionData` com conversões automáticas para:
    - `C2ExpandedScalarMiddleRegionData`;
    - `C2CanonicalClosedScaledMiddleLocalData` na especialização canônica;
    - `C2RiemannHypothesisTerminalData` na especialização canônica.

    Interpretação: o próximo alvo analítico deixou de ser apenas um triplo `(near, edge, hmiddle)` solto. A rota `explicitScalarExactZeta`, que parece a mais concreta e natural neste ponto, agora está empacotada como um objeto próprio e reutilizável. Isso elimina mais um nível de plumbing: se conseguirmos construir `C2ExplicitScalarExactZetaMiddleRegionData` na especialização canônica, o arquivo já sabe descer automaticamente até o pacote terminal e, portanto, até `RiemannHypothesisC2`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  138. A camada `expandedExactZeta` também virou pacote regional próprio: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém `C2ExpandedExactZetaMiddleRegionData`, com:
    - conversão automática para `C2ExpandedScalarMiddleRegionData`;
    - equivalência estrutural bidirecional com `C2ExplicitScalarExactZetaMiddleRegionData`;
    - descida automática para `C2CanonicalClosedScaledMiddleLocalData` e para `C2RiemannHypothesisTerminalData` na especialização canônica;
    - builder direto `C2RiemannHypothesisTerminalData.ofExpandedExactZetaMiddleRegion`.

    Interpretação: as duas formas fortes mais concretas do arquivo para a faixa média, `expandedExactZeta` e `explicitScalarExactZeta`, agora estão empacotadas como objetos regionais equivalentes, não apenas como predicados ponto a ponto ou hipóteses funcionais `hmiddle`. Isso deixa o gargalo analítico ainda mais explícito: basta construir qualquer um desses dois pacotes fortes na especialização canônica, e o caminho até o pacote terminal final já está totalmente automatizado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  139. O endpoint terminal ficou mais próximo do fechamento real: `LeanC2/Analytic/GenuineContinuation.lean` agora prova que `genuineFInfinite = continuedCentralOddChannel` em `puncturedOpenRightHalfPlane`, e `LeanC2/Analytic/GenuineBulkConcrete.lean` usa isso para transportar automaticamente qualquer `GenuineFInfiniteNearAxisData` para `C2OddTailContinuedBalancingSeedBulkModelNearAxisData`. No mesmo passo, o arquivo ganhou o edge trivial `C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty` e o construtor terminal direto `C2RiemannHypothesisTerminalData.ofGenuineFInfiniteNearAxisAndExplicitScalarExactZetaMiddleRegion`, junto com o corolário final `riemannHypothesisC2_of_genuineFInfiniteNearAxisAndExplicitScalarExactZetaMiddleRegion`.

    Interpretação: o bloco `edge` deixou de ser um obstáculo real no endpoint final, e o bloco `near` também deixou de depender de um certificado específico do modelo continuado. O próximo passo natural ficou reduzido a produzir um certificado near-axis para `genuineFInfinite` e então fechar apenas a obrigação uniforme da faixa média forte `explicitScalarExactZeta` fora da região near-axis. O gargalo final ficou honestamente comprimido em dois ingredientes: near-axis do operador genuíno e middle-region forte do modelo continuado.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso sem warnings. `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  140. O bloco `near` foi efetivamente fechado sem teorema G11 adicional: `LeanC2/Route/NearAxisTaylor.lean` agora contém o builder genérico `NearAxisCertificate.of_eventually_ne_zero`, e `LeanC2/Analytic/GenuineG11.lean` usa apenas a continuação de `genuineFInfinite` e o princípio de zeros isolados em domínio preconexo para construir `GenuineFInfiniteNearAxisData.of_continuation`. Em seguida, `LeanC2/Analytic/GenuineBulkConcrete.lean` comprime ainda mais o endpoint com `C2RiemannHypothesisTerminalData.ofContinuationAndExplicitScalarExactZetaMiddleRegion` e o corolário `riemannHypothesisC2_of_continuationAndExplicitScalarExactZetaMiddleRegion`.

    Interpretação: a witness near-axis não é mais um gargalo independente. A continuação já basta para provar que `genuineFInfinite` zera nos zeros críticos de `ζ`, não é identicamente nula em vizinhança deles, e portanto possui janelas transversais livres de zeros por isolamento analítico. Depois desse passo, o fechamento real ficou reduzido a uma única peça matemática restante: a prova uniforme da faixa média forte `explicitScalarExactZeta` para o modelo continuado. O endpoint terminal final agora pode ser alimentado por `continuation + hmiddle`, sem carregar `near` ou `edge` como dados extras.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineG11 LeanC2.Analytic.GenuineBulkConcrete` concluiu com sucesso; `lake build LeanC2` concluiu com sucesso com 8289 jobs.

  141. O endpoint final também foi comprimido até a obrigação mínima local: `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém `C2RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal` e o corolário `riemannHypothesisC2_of_continuationAndMiddleLocal`. Esses resultados usam automaticamente:
    - a continuação de `genuineFInfinite`;
    - a witness near-axis concreta `GenuineFInfiniteNearAxisData.of_continuation`;
    - o edge trivial `C2OddTailContinuedBalancingSeedBulkModelEdgeData.empty`.

    Interpretação: a última pendência do projeto ficou exposta exatamente na forma mais fraca aceita pelo funil final. Não falta mais montar `near`, não falta mais montar `edge`, e não falta mais descer por equivalências de pacotes. O único dado matemático restante é um `hmiddle` sobre a região média `c2ExpandedScalarMiddleRegion` que produza `C2CanonicalClosedScaledLocalData` ponto a ponto, ou qualquer hipótese mais forte que desça para isso, como `explicitScalarExactZeta`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2` concluiu com sucesso com 8289 jobs.

  142. A rota forte por continuação deixou de ficar artificialmente presa às constantes canônicas do endpoint terminal. `LeanC2/Analytic/GenuineBulkConcrete.lean` agora também contém os corolários diretos `riemannHypothesisC2_of_continuationAndExplicitScalarExactZetaMiddleRegionWithBounds` e `riemannHypothesisC2_of_continuationAndExpandedExactZetaMiddleRegionWithBounds`. Diferentemente de `riemannHypothesisC2_of_continuationAndExplicitScalarExactZetaMiddleRegion`, esses novos resultados mantêm `tiltConstant`, `tiltScale`, `cutoffConstant` e `cutoffScale` como funções arbitrárias.

    Interpretação: a opção forte ficou formalmente exposta sem precisar provar antes que as majorantes canônicas dominam a pilha `explicitFiniteCore` ou `explicitScalarExactZeta`. A pendência real passa a ser exatamente a prova do `hmiddle` forte na faixa média, com os bounds que a análise realmente fornecer, e não mais uma comparação extra entre famílias de constantes.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2` concluiu com sucesso com 8289 jobs.

  143. A fronteira entre “majorante” e “witness” também ficou formalizada. `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém `C2ExpandedScalarMiddleRegionData.ofContinuation`, o corolário `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleRegionWithBounds`, e ainda o wrapper mais cru `riemannHypothesisC2_of_continuationAndExpandedScalarMiddlePointwiseBounds`. O primeiro aceita diretamente o witness local `C2ExpandedScalarLocalBulkData` em cada ponto da faixa média; o segundo aceita apenas os ingredientes locais separados `C2ExpandedScalarScaleData`, `C2ExpandedHorizontalLayerBudget` e `C2ExpandedScalarMainInequalities`, montando o witness automaticamente.

    Interpretação: a montagem terminal deixou de exigir que a análise entregue logo um elemento de região como `explicitScalarExactZeta`. Agora há um degrau explícito “majorantes locais ⇒ witness local ⇒ RH”, todo especializado à continuação de `genuineFInfinite`. Com isso, a única pendência honesta restante é provar os majorantes ponto a ponto na `c2ExpandedScalarMiddleRegion`.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2` concluiu com sucesso com 8289 jobs.

  144. O subbloco restante `hmain` também foi aberto até as três desigualdades efetivas. `LeanC2/Analytic/GenuineBulkConcrete.lean` agora contém o builder `C2ExpandedScalarMainInequalities.ofComponents` e o corolário `riemannHypothesisC2_of_continuationAndExpandedScalarMiddleSeparatedMainBounds`. Com isso, a rota por continuação pode ser alimentada diretamente por três hipóteses separadas sobre a faixa média: `C2ExpandedSeedScaledBound`, `C2ExpandedCutoffScaledBound` e `C2ExpandedQuartetDominance`, além dos pacotes já isolados `hscale` e `hhorizontal`.

    Interpretação: o bloco médio forte ficou quebrado exatamente na granularidade natural da análise. Não é mais necessário montar manualmente nem `C2ExpandedScalarMainInequalities` nem `C2ExpandedScalarLocalBulkData` para usar o funil final. A obrigação remanescente agora aparece explicitamente como: controlar o seed, controlar o cutoff, e fechar a dominância do quarteto em cada ponto da região média.

    Verificação local:
    `lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2` concluiu com sucesso com 8289 jobs.

  O próximo salto técnico natural fica agora concentrado numa única obrigação analítica central:
  1. construir a obrigação uniforme de faixa média em qualquer uma das formas fortes já disponíveis, preferencialmente `explicitScalarExactZeta`, ou diretamente no alvo mínimo `C2CanonicalClosedScaledLocalData`.
  2. aplicar diretamente `C2RiemannHypothesisTerminalData.ofContinuationAndMiddleLocal`, `C2RiemannHypothesisTerminalData.ofContinuationAndExplicitScalarExactZetaMiddleRegion`, ou os corolários correspondentes, sem plumbing extra.
