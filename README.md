# LeanC2

[![Lean Build](https://github.com/thiagomassensini/lean/actions/workflows/lean-build.yml/badge.svg)](https://github.com/thiagomassensini/lean/actions/workflows/lean-build.yml)

Formalizacao em Lean 4 da rota C2 ate a `RiemannHypothesis` oficial do mathlib.

O estado atual do codigo ja exporta endpoints finais na superficie oficial do mathlib, isto e, o repositorio nao fecha em uma proposicao local separada para RH. Os wrappers correntes aparecem na forma `mathlibRiemannHypothesis_of_*`, e o pacote terminal atual e `RiemannHypothesisTerminalData`.

## Status Atual

- O alvo final atual e `RiemannHypothesis` do mathlib.
- A rota principal `near-axis -> bulk -> edge -> cover -> transfer` esta fechada no codigo atual.
- O alvo Lake padrao e a biblioteca `LeanC2`.
- O projeto depende de `mathlib` na revisao `v4.29.1`.
- O workflow de CI do GitHub constroi `LeanC2` em pushes para `main`, tags `v*`, PRs para `main` e releases publicadas.

Alguns endpoints representativos do estado atual:

- `mathlibRiemannHypothesis_of_offCriticalStripNonvanishing`
- `mathlibRiemannHypothesis_of_F_nonvanishing`
- `mathlibRiemannHypothesis_of_genuineRouteData`
- `mathlibRiemannHypothesis_of_continuationAndMiddleLocal`
- `mathlibRiemannHypothesis_of_continuationAndExpandedScalarMiddleRegionWithBounds`

## Estrutura do Repositorio

- `LeanC2.lean`: ponto de entrada da biblioteca.
- `LeanC2/Foundations`: definicoes basicas e a interface para RH no nivel fundamental.
- `LeanC2/Route`: abstrai o funil near-axis / bulk / edge / transfer.
- `LeanC2/Analytic`: camadas de continuacao, bulk concreto e endpoints finais.
- `REPORT.md`: relatorio detalhado do estado da formalizacao e historico do projeto.
- `rota_c_2_rh_referencia_lean.md`: roteiro de referencia da rota C2 em Lean.
- `notas/`: notas tecnicas e derivacoes auxiliares.
- `LEGADO/`: material historico que nao faz parte da superficie principal atual.

## Como Compilar

Requisitos:

- `elan`
- Lean toolchain `v4.29.1` (lida automaticamente via `lean-toolchain`)

Build completo da biblioteca:

```bash
lake build LeanC2
```

Build focado no endpoint analitico mais pesado:

```bash
lake build LeanC2.Analytic.GenuineBulkConcrete LeanC2
```

Se quiser puxar cache do mathlib antes do build:

```bash
lake exe cache get
```

## Leitura Recomendada

Para quem quer entender o estado atual sem entrar direto nos arquivos grandes:

1. `REPORT.md` para a visao normativa e o historico.
2. `LeanC2/Foundations/Basic.lean` para a interface basica ate `RiemannHypothesis`.
3. `LeanC2/Route/Transfer.lean` e `LeanC2/Roadmap.lean` para a composicao abstrata da rota.
4. `LeanC2/Analytic/GenuineBulkConcrete.lean` para os endpoints concretos e o pacote terminal.

## Nota Sobre Nomenclatura

Partes antigas da documentacao e do historico ainda podem mencionar nomes como `RiemannHypothesisC2`, `riemannHypothesisC2_of_*` ou `C2RiemannHypothesisTerminalData`. A superficie atual do codigo foi migrada para a nomenclatura oficial do mathlib:

- `RiemannHypothesis`
- `mathlibRiemannHypothesis_of_*`
- `RiemannHypothesisTerminalData`

## Releases

As releases publicadas no GitHub seguem tags `v*`. A linha canonica de publicacao atual e a branch `main`.
