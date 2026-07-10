# Audit Projected J0 Raw Enclosure Sentinel Check

Rota: Genuine-First. Este checker recomputa retangulos strict para subcaixas sentinela e compara com os retangulos brutos armazenados no certificado por subcaixa. Ele nao recomputa a cadeia inteira.

## Resultado

- Boxes checked: 5
- Subboxes checked: 10
- Objects checked: 40
- Contains: 40
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999355595678
- Worst subbox: `s0.84_t0__s00_t000:D0`
- Status: pass
- Tempo: 156.75 s

## Escopo

Boxes:

```text
s0.84_t7
s0.86_t0
s0.84_t0
s0.84_t1
s0.85_t0
```

Objetos:

```text
M
D0
Drest
RvecTail
```

Foram escolhidas duas subcaixas por box, priorizadas pelo maior
`D0NegReMain_upper` registrado.

## Leitura

Status `contains` significa que o retangulo armazenado contem a recomputacao strict. Status `strict_wider` significa que a recomputacao strict e mais larga, mas ainda sobrepoe o retangulo armazenado. Isso e auditavel, mas nao prova containment do fast pelo strict. `disjoint_fail` seria contradicao relevante.

## Limite

Esta e uma auditoria sentinela. Ela fortalece a fronteira dos retangulos brutos nos boxes selecionados, mas nao certifica todas as 771 subcaixas.

## Respostas

1. O checker sentinela foi criado e passou.
2. Objetos checados: `M`, `D0`, `Drest`, `RvecTail`.
3. Boxes checados: 5. Subcaixas checadas: 10.
4. Resultados: 40 `contains`, 0 `strict_wider`, 0 `inconclusive`, 0 `disjoint_fail`.
5. Leitura: nas sentinelas escolhidas, os retangulos fast/sub32 armazenados contem as recomputacoes strict localizadas.
