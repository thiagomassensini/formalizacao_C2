# Claims Audit

Este arquivo existe para manter o paper honesto e revisavel.

## Claim A -- Sem placeholders Lean

**Formula segura:**

> The Lean development contains no `sorry`, `admit`, `axiom`, or new
> `constant` declarations in the `LeanC2` source tree.

**Evidencia local:**

```bash
rg -n "sorry\\b|admit\\b|axiom\\b|constant\\b" LeanC2 LeanC2.lean
```

Observacao: a busca textual encontra palavras em comentarios e nomes de
variaveis como `hconstant`; o ponto relevante e nao haver declaracoes Lean
`axiom`/`constant` nem placeholders de prova.

## Claim B -- Endpoint publico compilado

**Formula segura:**

> The public audit-facing endpoint is exposed in `LeanC2.PeerReview`.

**Nomes Lean:**

```lean
C2.PeerReview.ContinuationTerminalCertificate
C2.PeerReview.riemannHypothesis_of_continuationTerminalCertificate
C2.PeerReview.TerminalCertificate
C2.PeerReview.riemannHypothesis_of_terminalCertificate
```

**Build:**

```bash
lake build LeanC2.PeerReview
lake build LeanC2
```

## Claim C -- Natureza do endpoint

**Formula segura:**

> The endpoint proves mathlib's `RiemannHypothesis` from explicit terminal
> certificate data.

**Evitar por enquanto:**

> The paper proves the Riemann Hypothesis unconditionally.

Motivo: a API publica atual recebe um certificado:

```lean
riemannHypothesis_of_terminalCertificate
  (cert : TerminalCertificate) : RiemannHypothesis
```

e a versao comprimida recebe:

```lean
riemannHypothesis_of_continuationTerminalCertificate
  (cert : ContinuationTerminalCertificate) : RiemannHypothesis
```

Se posteriormente o workspace construir um `cert : TerminalCertificate` sem
hipoteses externas, a formulacao do paper pode ser fortalecida.

## Claim D -- Rota matematica

**Formula segura:**

> The development factors the C2 route into dyadic combinatorics, finite
> cancellation, C0/zeta algebra, continuation data, near/bulk/edge cover data,
> and transfer to mathlib's `RiemannHypothesis`.

**Arquivos principais:**

```text
LeanC2/Foundations/Basic.lean
LeanC2/Foundations/Dyadic.lean
LeanC2/Operators/FiniteCancellation.lean
LeanC2/Operators/TruncatedGenuine.lean
LeanC2/Identity/C0.lean
LeanC2/Route/FundamentalAlgebra.lean
LeanC2/Analytic/GenuineContinuation.lean
LeanC2/Roadmap.lean
LeanC2/Route/Transfer.lean
LeanC2/Analytic/GenuineBulkConcrete.lean
LeanC2/PeerReview.lean
```

## Claim E -- Arquivo grande classificado

**Formula segura:**

> The terminal concrete file is tagged to distinguish active route, optional
> refinements, formal barriers, and historical routes.

**Etiquetas:**

```lean
-- ROUTE_TAG: ACTIVE_MAIN_ROUTE
-- ROUTE_TAG: ACTIVE_OPTIONAL_REFINEMENT
-- ROUTE_TAG: FORMAL_BARRIER
-- ROUTE_TAG: DEPRECATED_HISTORICAL
```

