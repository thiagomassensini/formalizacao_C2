# Audit Projected J0 Valley47 Sample Lipschitz Scout

Data: 2026-07-08.

Rota: Genuine-First. Este scout testa um lower alternativo para `|M|` nas 7
caixas `valley47` que continuaram classificadas como `improve_main_lower`.

## Script

Criado:

```text
operadores/c2_projected_j0_sample_lipschitz_scout.py
```

Entrada:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv
```

Comando executado:

```bash
python3 operadores/c2_projected_j0_sample_lipschitz_scout.py \
  --boxes-csv audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv \
  --label valley47_improve_main_lower_s129_inflate4 \
  --box-id-list s0.5_t19,s0.5_t20,s0.5_t21,s0.5_t22,s0.5_t186,s0.5_t187,s0.5_t188 \
  --samples-t 129 --samples-sigma 1 --lipschitz-inflate 4.0
```

Saidas:

```text
audit_outputs/c2_projected_j0_sample_lipschitz_scout_valley47_improve_main_lower.csv
audit_outputs/c2_projected_j0_sample_lipschitz_scout_valley47_improve_main_lower.json
```

## Metodo

O lower testado foi:

```text
max(0, min_sample |M(s_i)| - L_M * radius)
```

Nesta rodada, `L_M` foi estimado por diferencas finitas complexas infladas.
Portanto, o resultado e diagnostico; ainda nao e certificado forte.

## Resultado

```text
caixas testadas: 7
would_recover: 2/7
```

Caixas que seriam recuperadas:

```text
s0.5_t19  new budget estimate = 8.263214e-03
s0.5_t20  new budget estimate = 1.477830e-03
```

Caixas ainda negativas:

```text
s0.5_t21   -5.279318e-03
s0.5_t22   -1.200601e-02
s0.5_t186  -1.367653e-02
s0.5_t187  -9.086956e-03
s0.5_t188  -4.591425e-03
```

## Leitura Do Bound

O termo `L_M * radius` ficou pequeno nesta rodada:

```text
media: 1.943058e-04
maximo: 2.139150e-04
```

Logo, o bound de Lipschitz por diferenca finita inflada nao foi o principal
fator de perda. O ganho veio de substituir o lower retangular por um lower
amostral corrigido. As caixas restantes continuam negativas porque a folga de
budget estimada ainda nao basta.

## Deve Virar Certifier Principal?

Ainda nao como certificado forte.

Como scout, o metodo e util: ele recupera 2 caixas e mostra que as 5 restantes
precisam de subdivisao adicional ou de uma cota de `M` mais estrutural.

Para promover ao certifier principal, o bound `L_M` deve deixar de ser apenas
diferenca finita inflada e passar a vir de:

```text
1. derivada intervalar direta de M;
2. bound por soma finita das derivadas;
3. outro argumento geometrico auditavel.
```

## Proximo Passo

1. Rodar subdivisao adicional em `s0.5_t188`, que ficou quase positiva.
2. Testar `sample-lipschitz` com derivada auditavel nas 5 caixas restantes.
3. Nao atacar as caixas `abandon_box_for_now` antes de estabilizar este metodo.
