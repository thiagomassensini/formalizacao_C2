# Mapa curto da rota formal ate a RH do mathlib

Escopo: esta versao resume a cadeia principal minima da formalizacao atual ate `RiemannHypothesis`. Ela omite ramificacoes paralelas e a maior parte dos lemas auxiliares de bounds.

## 1. Endpoint canonico

- `mathlibRiemannHypothesis_of_offCriticalStripNonvanishing` - `LeanC2/Foundations/Basic.lean:30` - endpoint canonico off-critical -> RH

## 2. Transferencia abstrata

- `FundamentalIdentityOnRightHalfPlane.toOffCriticalStrip` - `LeanC2/Route/Transfer.lean:23` - restringe a identidade ao strip
- `F_nonzero_iff_zeta_nonzero_of_identity` - `LeanC2/Route/Transfer.lean:30` - troca nao anulacao de F e zeta
- `zeta_nonzero_of_F_nonzero` - `LeanC2/Route/Transfer.lean:45` - passa de F para zeta
- `offCriticalStrip_zeta_nonvanishing_of_F_nonvanishing` - `LeanC2/Route/Transfer.lean:55` - produz nao anulacao off-critical
- `mathlibRiemannHypothesis_of_F_nonvanishing` - `LeanC2/Route/Transfer.lean:63` - fecha RH pela transferencia

## 3. Fecho abstrato por cover

- `offCriticalStripNonvanishing_of_coverData` - `LeanC2/Roadmap.lean:398` - cover global implica nao anulacao
- `mathlibRiemannHypothesis_of_coverData` - `LeanC2/Roadmap.lean:601` - cover abstrato fecha RH

## 4. Continuacao -> cover genuino

- `mathlibRiemannHypothesis_of_continuationFromOneLt_cover` - `LeanC2/Analytic/GenuineContinuation.lean:443` - ponte geral de continuacao
- `mathlibRiemannHypothesis_of_genuineFInfiniteContinuation_cover` - `LeanC2/Analytic/GenuineContinuation.lean:524` - versao genuina do fecho

## 5. Near-axis minimo

- `eventually_ne_zero_of_continuation` - `LeanC2/Analytic/GenuineG11.lean:68` - nao anulacao perfurada perto dos zeros
- `GenuineFInfiniteNearAxisData.of_continuation` (def) - `LeanC2/Analytic/GenuineG11.lean:78` - constroi dado near-axis
- `NearAxisCertificate.of_eventually_ne_zero` (def) - `LeanC2/Route/NearAxisTaylor.lean:353` - converte em certificado near-axis

## 6. Entrada concreta curta

- `mathlibRiemannHypothesis_of_oddTailBalancingSeedBulkModelContinuation_cover` - `LeanC2/Analytic/GenuineBulkConcrete.lean:2983` - continuacao concreta ja com cover
- `mathlibRiemannHypothesis_of_expandedScalarCoverData` - `LeanC2/Analytic/GenuineBulkConcrete.lean:9776` - cover escalar concreto

## 7. Pacote terminal

- `RiemannHypothesisTerminalData` (structure) - `LeanC2/Analytic/GenuineBulkConcrete.lean:14546` - pacote terminal final
- `offCriticalStripNonvanishing_of_terminalData` - `LeanC2/Analytic/GenuineBulkConcrete.lean:14570` - terminal data -> nao anulacao
- `mathlibRiemannHypothesis_of_terminalData` - `LeanC2/Analytic/GenuineBulkConcrete.lean:14578` - terminal data -> RH

## 8. Compressao final da rota concreta

- `RiemannHypothesisTerminalData.ofExplicitScalarExactZetaMiddleRegion` (def) - `LeanC2/Analytic/GenuineBulkConcrete.lean:15397` - empacota a regiao media explicita
- `mathlibRiemannHypothesis_of_genuineFInfiniteNearAxisAndExplicitScalarExactZetaMiddleRegion` - `LeanC2/Analytic/GenuineBulkConcrete.lean:15446` - near-axis + regiao media -> RH
- `RiemannHypothesisTerminalData.ofContinuationAndExplicitScalarExactZetaMiddleRegion` (def) - `LeanC2/Analytic/GenuineBulkConcrete.lean:25880` - versao terminal a partir da continuacao
- `mathlibRiemannHypothesis_of_continuationAndExplicitScalarExactZetaMiddleRegion` - `LeanC2/Analytic/GenuineBulkConcrete.lean:25911` - versao curta mais concreta

## Leitura minima sugerida

Se voce quiser a cadeia mais curta possivel, leia nesta ordem:

1. `mathlibRiemannHypothesis_of_continuationAndExplicitScalarExactZetaMiddleRegion` - `LeanC2/Analytic/GenuineBulkConcrete.lean:25911`
2. `RiemannHypothesisTerminalData.ofContinuationAndExplicitScalarExactZetaMiddleRegion` - `LeanC2/Analytic/GenuineBulkConcrete.lean:25880`
3. `mathlibRiemannHypothesis_of_terminalData` - `LeanC2/Analytic/GenuineBulkConcrete.lean:14578`
4. `offCriticalStripNonvanishing_of_terminalData` - `LeanC2/Analytic/GenuineBulkConcrete.lean:14570`
5. `mathlibRiemannHypothesis_of_offCriticalStripNonvanishing` - `LeanC2/Foundations/Basic.lean:30`