# AUDIT_C2_CENTER_GAUSSIAN_CENTER_CUTOFF_CONVERGENCE

## Escopo

Arquivo Lean atualizado:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Objetivo: formalizar a cofinalidade do corte por centro e conectar a familia
finita ao carrier infinito `c2CenterGaussianSeries`.

## Inclusao de retangulo finito

Foi provado:

```lean
c2CenterGaussianRectangle_index_mem_byCenterCutoff
```

Conteudo:

```text
se K0 <= K
e 2^K0 * M0 + 1 <= nmax,
entao todo indice k,m com
  2 <= k <= K0
  m impar
  m <= M0
pertence ao corte por centro nmax,K.
```

Este e o nucleo aritmetico da cofinalidade.

## Corte por centro em coordenadas de endereco

Foram criados:

```lean
c2CenterGaussianByCenterCutoffAddressSet
c2CenterGaussianByCenterCutoffAddressSum
```

A forma por endereco usa `p : Nat × Nat`:

```text
k = p.1 + 2
m = 2*p.2 + 1
```

e aplica a condicao:

```text
2^(p.1+2) * (2*p.2+1) + 1 <= nmax
```

Foi provado:

```lean
c2CenterGaussianByCenterCutoffAddressSet_mem_iff
```

## Cofinalidade diagonal

Foi provado:

```lean
tendsto_c2CenterGaussianByCenterCutoffAddressSet_diag
```

Isto diz que:

```text
N |-> c2CenterGaussianByCenterCutoffAddressSet N N
```

e uma familia cofinal de finsets de enderecos.

## Convergencia para o carrier infinito

Foi provado incondicionalmente:

```lean
tendsto_c2CenterGaussianByCenterCutoffAddressSum_diag
```

Forma:

```lean
Tendsto
  (fun N => c2CenterGaussianByCenterCutoffAddressSum X s N N)
  atTop
  (nhds (c2CenterGaussianSeries X s))
```

Hipoteses:

```text
0 < X
0 < s.re
```

## Forma k,m

Foi fechada a reindexacao finita entre a forma original `k,m` e a forma por
endereco. Foram criados/provados:

```lean
c2CenterGaussianByCenterCutoffKMSet
c2CenterGaussianByCenterCutoffKMSum
c2CenterGaussianByCenterCutoff_eq_kmSum
c2CenterGaussian_odd_reconstruct
c2CenterGaussianByCenterCutoffKMSum_eq_addressSum
c2CenterGaussianByCenterCutoff_eq_addressSum
```

A igualdade principal e:

```lean
c2CenterGaussianByCenterCutoff X s N N
  =
c2CenterGaussianByCenterCutoffAddressSum X s N N
```

e tambem foi provada na forma geral `nmax,K`.

O mapa finito usado foi:

```text
(k,m) |-> (k - 2, (m - 1) / 2)
```

com inverso:

```text
p |-> (p.1 + 2, 2*p.2 + 1)
```

O lemma `c2CenterGaussian_odd_reconstruct` paga a identidade:

```text
m odd -> 2 * ((m - 1) / 2) + 1 = m
```

## Convergencia da forma do script

Com a reindexacao fechada, foi provado incondicionalmente:

```lean
tendsto_c2CenterGaussianByCenterCutoff_diag
```

Forma:

```lean
Tendsto
  (fun N => c2CenterGaussianByCenterCutoff X s N N)
  atTop
  (nhds (c2CenterGaussianSeries X s))
```

Hipoteses:

```text
0 < X
0 < s.re
```

Assim, o finite carrier no formato do script converge para o carrier infinito
formal.

## Campo ainda aberto

Nenhum campo de convergencia/reindexacao ficou aberto nesta ponte. Os proximos
campos pertencem a analise/estabilidade do proprio carrier, nao a paridade
finita.

## Verificacao

Comando executado:

```text
lake env lean LeanC2/AuditC2CenterGaussianCarrier.lean
```

Resultado: passou.

## Proxima acao

Usar a ponte:

```text
script finite center cutoff
= Lean by-center cutoff
-> c2CenterGaussianSeries
```

como base para a proxima auditoria de estabilidade/minimos do carrier.
