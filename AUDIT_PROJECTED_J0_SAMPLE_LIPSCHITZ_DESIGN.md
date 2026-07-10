# Audit Projected J0 Sample Lipschitz Design

Data: 2026-07-08.

Rota: Genuine-First. Este documento desenha uma proxima opcao para melhorar o
lower intervalar de `|M|` em caixas finas, sem implementar ainda a camada pesada.

## Objetivo

Substituir ou complementar o lower retangular de `|M|` por:

```text
mainNormLowerConst =
  max(0, min_sample |M(s_i)| - L_M * radius_box)
```

onde:

```text
s_i          = amostras dentro da caixa
L_M          = upper auditavel para a variacao de M na caixa
radius_box   = raio geometrico da caixa no plano (sigma,t)
```

Essa forma e util quando a enclosure retangular de `M` fica larga demais, mas
as amostras mostram que `M` permanece longe de zero.

## Objeto M

No modelo intervalar atual do certifier, a forma avaliada e:

```text
main = (q^2 + seed) * (1 + q + q^2 + q^3)
```

Em termos da rota adjusted quartet, isto corresponde ao main ajustado como
amplitude ajustada vezes `verticalQuartetPrefix(adjusted ratio)`.

Nao inventar formula nova: o metodo deve reutilizar exatamente as funcoes do
certifier/evaluator que ja constroem `M`.

## Dados Necessarios

Para cada caixa:

```text
1. grid de amostras s_i;
2. valores complexos M(s_i);
3. min_sample |M(s_i)|;
4. bound L_M para a variacao de M dentro da caixa;
5. raio da caixa usado na desigualdade.
```

O ponto critico e `L_M`. Ele precisa ser auditavel, nao apenas ajustado por
heuristica.

## Como Obter L_M

Opcoes em ordem de confiabilidade:

```text
1. Derivada intervalar direta de M:
   calcular enclosures para derivadas parciais em sigma e t, usando as mesmas
   somas finitas do certifier.

2. Bound por soma finita:
   cada termo exponencial recebe fator log/endereco na derivada; a soma dos
   modulos majorados da derivada da um L_M conservador.

3. Bound por diferencas finitas infladas:
   util como scout, mas nao deve ser tratado como certificado final se nao
   houver uma inflacao justificada.
```

Para uma caixa retangular, uma forma simples e:

```text
L_M = sqrt(L_sigma^2 + L_t^2)
radius_box = sqrt((width_sigma/2)^2 + (width_t/2)^2)
```

Se sigma for fixo, o termo em `width_sigma` some e o raio e basicamente
`width_t/2`.

## Integração No Certifier

Nova opcao futura:

```text
--main-lower-method sample-lipschitz
--main-samples-sigma N
--main-samples-t N
--main-derivative-bound interval|finite-sum
```

Fluxo:

```text
1. avaliar M em uma grade de amostras;
2. computar min_sample |M|;
3. computar L_M na caixa ou em subcaixas;
4. emitir campos:
   main_lower_method = sample-lipschitz
   main_sample_min_abs
   main_lipschitz_bound
   main_radius
   main_lower_rect
   main_lower_improved
   main_lower_gain
```

O `main_lower_improved` deve ser:

```text
max(main_lower_rect, min_sample |M| - L_M * radius_box)
```

## Alvos Imediatos

Aplicar primeiro nas 7 caixas `valley47` ainda classificadas como
`improve_main_lower`:

```text
s0.5_t19
s0.5_t20
s0.5_t21
s0.5_t22
s0.5_t186
s0.5_t187
s0.5_t188
```

Essas caixas sao melhores candidatas que as caixas `abandon_box_for_now`,
porque ainda tinham folga razoavel no scout, mas perderam budget para a
enclosure intervalar.

## Riscos

1. Se `L_M` for muito conservador, o metodo nao melhora o lower.
2. Se `L_M` vier de diferenca finita sem justificativa, o resultado volta a ser
   diagnostico numerico, nao certificado externo forte.
3. A derivada de `seed` pode dominar o custo; nesse caso pode ser melhor
   derivar diretamente o `main` montado pelo evaluator em vez de expandir
   manualmente todos os componentes.

## Recomendacao

Implementar primeiro um scout `sample-lipschitz` com bound conservador por soma
finita ou derivada intervalar direta em subcaixas. Se ele recuperar parte das 7
caixas restantes sem inflacao excessiva, promover o metodo para o certifier
principal com campos auditaveis no CSV/JSON.
