# Paper C2 -- Guia de Trabalho

Este diretorio e o ponto de partida do paper.

## Arquivos

- `c2_formalization_draft.md`: rascunho principal em ingles.
- `claims_audit.md`: lista de claims e como eles devem ser formulados sem exagero.

## Estrategia

O primeiro paper deve ser escrito como um paper de formalizacao auditavel:

> We formalize a C2 terminal-certificate pipeline in Lean. A public certificate
> API proves mathlib's `RiemannHypothesis` from explicit continuation and middle
> region data.

Isso e mais defensavel do que abrir com "we prove RH" sem explicar a estrutura
dos certificados. O paper pode ficar mais forte se, no futuro, houver um
habitante concreto incondicional do certificado terminal.

## Regra de ouro

Sempre separar:

1. **provado diretamente em Lean sem hipoteses locais adicionais;**
2. **provado em Lean a partir de um certificado / estrutura / witness;**
3. **motivacao matematica ou rota planejada.**

Essa separacao evita que um revisor rejeite o texto por overclaim antes de
entender o codigo.

## Proximo passo natural

Depois deste rascunho, o melhor proximo passo e criar uma versao LaTeX:

```text
paper/main.tex
paper/references.bib
```

Mas primeiro vale estabilizar o texto em Markdown.

