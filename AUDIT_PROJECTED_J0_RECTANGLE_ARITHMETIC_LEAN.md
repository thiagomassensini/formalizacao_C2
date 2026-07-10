# Audit Projected J0 Rectangle Arithmetic Lean

Data: 2026-07-09.

Rota: Genuine-First.

## Arquivo Lean

Criado:

```text
LeanC2/AuditProjectedJ0RectangleArithmetic.lean
```

Namespace:

```lean
C2.ProjectedJ0RectangleArithmetic
```

## Estruturas Criadas

Intervalos reais:

```lean
structure RealInterval where
  lo : ℝ
  hi : ℝ
```

Retangulos complexos:

```lean
structure ComplexRect where
  re : RealInterval
  im : RealInterval
```

Contratos abstratos:

```lean
structure MainLowerFromRect
structure RestUpperFromRect
structure ProjectedJ0SubboxRectangleContract
structure ProjectedJ0SubboxDerivedBounds
```

## Operacoes Formalizadas

Foram formalizadas:

- `RealInterval.Valid`
- `RealInterval.Contains`
- `RealInterval.add_contains`
- `RealInterval.neg`
- `RealInterval.neg_contains`
- `RealInterval.MulBoundsValid`
- `RealInterval.MulBoundsFunctional`
- `RealInterval.mul_contains_of_functional_bounds`
- `ComplexRect.Contains`
- `ComplexRect.add_contains`
- `ComplexRect.conj`
- `ComplexRect.conj_contains`

## Multiplicacao

O predicado endpoint foi definido:

```lean
RealInterval.MulBoundsValid I J K
```

Mas a prova endpoint completa nao foi forçada nesta camada. O consumidor
compilavel usa a forma funcional:

```lean
RealInterval.MulBoundsFunctional I J K
```

Leitura: isso preserva o contrato de bounds de multiplicacao sem abrir uma
prova por casos de sinal nesta etapa.

## D0NegReMain

Foi formalizada a identidade real usada pelo verificador retangular:

```lean
complex_mul_conj_re :
  (D * starRingEnd ℂ M).re = D.re * M.re + D.im * M.im
```

E o consumidor:

```lean
d0NegReMain_upper_of_rects
```

Ele transforma uma cota para o intervalo de

```text
-(D.re * M.re + D.im * M.im)
```

em:

```lean
-((D * starRingEnd ℂ M).re) ≤ upper
```

## O Que Ainda Fica Externo

Esta camada nao prova:

- os retangulos brutos produzidos pelo certifier;
- transcendentes ou somas finitas analiticas;
- geracao das enclosures;
- dados das 771 subcaixas;
- lower/upper automatico de modulo por cantos/sqrt.

## Verificacao

Passaram:

```bash
lake env lean LeanC2/AuditProjectedJ0RectangleArithmetic.lean
lake build LeanC2.AuditProjectedJ0RectangleArithmetic
```

## Proximo Passo

O proximo passo natural e formalizar a camada de modulo por retangulo:

```text
M rectangle -> lower de ||M||
Drest + RvecTail rectangle -> upper de ||Drest + RvecTail||
```

Depois disso, uma caixa sentinela pode ser conectada ao contrato abstrato sem
inserir ainda todos os 771 dados no Lean.
