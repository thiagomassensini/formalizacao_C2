#!/usr/bin/env python3
"""
Cp Bracket Operator Audit
=========================

Script auditavel para o cancelamento local e global do bracket Cp.

Geometria canonica:

    p = 2:
        A_2 = {-1, +1}
        k0 = 2

    p impar:
        A_p = {-(p-1)/2, ..., -1, +1, ..., +(p-1)/2}
        k0 = 1

Centro:

    c = p^k m,  com gcd(m, p) = 1

Sequencia geral:

    b_n(s) = a_n n^(-s)

Soma direta local:

    D_c^{(p)}(s) = sum_{a in A_p} b_{c+a}(s)

Bracket local:

    B_c^{(p)}(s) = sum_{a in A_p} b_{c+a}(s) - |A_p| b_c(s)

Cancelamento local:

    D_c^{(p)}(s) - B_c^{(p)}(s) = |A_p| b_c(s)

Com peso vertical p^(-k), a soma global truncada satisfaz:

    D_{Cp}^{K,M}(s) - B_{Cp}^{K,M}(s)
      = |A_p| sum_{k=k0..K} sum_{m<=M, gcd(m,p)=1}
          p^(-k) a_{p^k m} (p^k m)^(-s)

Quando a_n separa localmente em p, como zeta ou Dirichlet nao ramificado:

    a_{p^k m} = a_{p^k} a_m

entao a soma central truncada separa em torre vertical x canal horizontal.

Dependencias: somente biblioteca padrao do Python.
"""

from __future__ import annotations

import argparse
import cmath
import math
from dataclasses import dataclass
from math import gcd
from typing import Callable


EPS = 1e-14


# -----------------------------------------------------------------------------
# Basicos Cp
# -----------------------------------------------------------------------------


def is_prime(p: int) -> bool:
    """Teste simples de primalidade para primos pequenos/medios."""
    if p < 2:
        return False
    if p == 2:
        return True
    if p % 2 == 0:
        return False
    d = 3
    while d * d <= p:
        if p % d == 0:
            return False
        d += 2
    return True


def parse_complex(text: str) -> complex:
    """Parseia complexo estilo Python, aceitando i como alias de j."""
    return complex(text.strip().replace("i", "j"))


def parse_int_list(text: str) -> list[int]:
    """Parseia '2,3,5' em [2, 3, 5]."""
    out: list[int] = []
    for part in text.split(','):
        part = part.strip()
        if part:
            out.append(int(part))
    return out


def cp_legs(p: int) -> tuple[int, ...]:
    """Ramos laterais canonicos A_p."""
    if not is_prime(p):
        raise ValueError(f"p precisa ser primo; recebido p={p}")
    if p == 2:
        return (-1, 1)
    h = (p - 1) // 2
    return tuple(range(-h, 0)) + tuple(range(1, h + 1))


def cp_k0(p: int, k_start: int | None = None) -> int:
    """Profundidade inicial canonica."""
    if k_start is not None:
        if k_start < 1:
            raise ValueError("k_start precisa ser >= 1")
        return int(k_start)
    return 2 if p == 2 else 1


def complex_power_n_minus_s(n: int, s: complex) -> complex:
    """n^(-s) para n positivo."""
    if n <= 0:
        raise ValueError(f"n precisa ser positivo; recebido n={n}")
    return cmath.exp(-s * math.log(float(n)))


def fmt_complex(z: complex) -> str:
    """Formato compacto e alinhavel para complexos."""
    return f"{z.real: .12e}{z.imag:+.12e}j"


def fmt_float(x: float) -> str:
    """Formato compacto para floats."""
    return f"{x:.12g}"


# -----------------------------------------------------------------------------
# Modelos de coeficientes a_n
# -----------------------------------------------------------------------------


@dataclass(frozen=True)
class CoefficientModel:
    """
    Modelo de coeficientes a_n.

    Para zeta: a_n = 1.
    Para caracteres por tabela: a_n = table[n mod q].
    """

    name: str
    func: Callable[[int], complex]
    modulus: int | None = None
    table: dict[int, complex] | None = None

    def __call__(self, n: int) -> complex:
        return self.func(n)

    def value_at_prime_power(self, p: int, k: int) -> complex:
        """Valor a_{p^k}."""
        return self(p ** k)

    def is_table_character(self) -> bool:
        return self.modulus is not None and self.table is not None

    def chi_p(self, p: int) -> complex | None:
        """Valor chi(p), quando o modelo e uma tabela modular."""
        if not self.is_table_character():
            return None
        return self(p)


def zeta_coefficients() -> CoefficientModel:
    return CoefficientModel(name="zeta/all-ones", func=lambda n: 1.0 + 0.0j)


def table_coefficients(name: str, modulus: int, table: dict[int, complex]) -> CoefficientModel:
    if modulus <= 0:
        raise ValueError("modulus precisa ser positivo")
    normalized = {r % modulus: complex(v) for r, v in table.items()}

    def _func(n: int) -> complex:
        return normalized.get(n % modulus, 0.0 + 0.0j)

    return CoefficientModel(name=name, func=_func, modulus=modulus, table=normalized)


def parse_residue_table(text: str, modulus: int) -> dict[int, complex]:
    """
    Parseia tabela modular.

    Exemplo:
        --mod 5 --values '0:0,1:1,2:i,3:-i,4:-1'
    """
    out: dict[int, complex] = {}
    for item in text.split(','):
        item = item.strip()
        if not item:
            continue
        if ':' not in item:
            raise ValueError("valores precisam ter formato residuo:valor")
        r_text, v_text = item.split(':', 1)
        r = int(r_text.strip()) % modulus
        out[r] = parse_complex(v_text.strip())
    return out


def known_coefficient_model(args: argparse.Namespace) -> CoefficientModel:
    coeff = args.coeff.lower().strip()

    if coeff in {"zeta", "ones", "1"}:
        return zeta_coefficients()

    if coeff in {"chi3", "mod3", "chi_mod3"}:
        return table_coefficients("chi3-real", 3, {0: 0, 1: 1, 2: -1})

    if coeff in {"chi4", "mod4", "chi_mod4"}:
        return table_coefficients("chi4-real", 4, {0: 0, 1: 1, 2: 0, 3: -1})

    if coeff in {"chi5quad", "chi5", "mod5quad"}:
        return table_coefficients("chi5-quadratic", 5, {0: 0, 1: 1, 2: -1, 3: -1, 4: 1})

    if coeff in {"chi5complex", "mod5complex"}:
        return table_coefficients(
            "chi5-complex",
            5,
            {0: 0, 1: 1, 2: 1j, 3: -1j, 4: -1},
        )

    if coeff == "custom":
        if args.mod is None or args.values is None:
            raise ValueError("coeff=custom exige --mod e --values")
        table = parse_residue_table(args.values, args.mod)
        return table_coefficients(f"custom-mod{args.mod}", args.mod, table)

    raise ValueError(
        "--coeff deve ser zeta, chi3, chi4, chi5quad, chi5complex ou custom"
    )


# -----------------------------------------------------------------------------
# Operador de bracket Cp
# -----------------------------------------------------------------------------


@dataclass(frozen=True)
class CpBracketOperator:
    """Bracket Cp local/global para uma sequencia b_n(s)=a_n n^(-s)."""

    p: int
    coeffs: CoefficientModel
    k_start: int | None = None

    def __post_init__(self) -> None:
        if not is_prime(self.p):
            raise ValueError(f"p precisa ser primo; recebido p={self.p}")
        if self.k_start is not None and self.k_start < 1:
            raise ValueError("k_start precisa ser >= 1")

    @property
    def legs(self) -> tuple[int, ...]:
        return cp_legs(self.p)

    @property
    def branch_count(self) -> int:
        return len(self.legs)

    @property
    def k0(self) -> int:
        return cp_k0(self.p, self.k_start)

    def center(self, k: int, m: int) -> int:
        self.validate_address(k, m)
        return (self.p ** k) * m

    def validate_address(self, k: int, m: int) -> None:
        if k < self.k0:
            raise ValueError(f"k={k} abaixo de k0={self.k0}")
        if m < 1:
            raise ValueError("m precisa ser positivo")
        if gcd(m, self.p) != 1:
            raise ValueError(f"m={m} nao e coprimo a p={self.p}")

    def b(self, n: int, s: complex) -> complex:
        """b_n(s)=a_n n^(-s)."""
        return self.coeffs(n) * complex_power_n_minus_s(n, s)

    def local_direct(self, k: int, m: int, s: complex) -> complex:
        """D_c^{(p)}(s)=sum_{a in A_p} b_{c+a}(s)."""
        c = self.center(k, m)
        total = 0.0 + 0.0j
        for a in self.legs:
            n = c + a
            if n <= 0:
                raise ValueError(f"perna nao positiva: c+a={n}")
            total += self.b(n, s)
        return total

    def local_bracket(self, k: int, m: int, s: complex) -> complex:
        """B_c^{(p)}(s)=sum lateral - |A_p| b_c(s)."""
        c = self.center(k, m)
        return self.local_direct(k, m, s) - self.branch_count * self.b(c, s)

    def local_center_survivor(self, k: int, m: int, s: complex) -> complex:
        """Centro que sobra: |A_p| b_c(s)."""
        c = self.center(k, m)
        return self.branch_count * self.b(c, s)

    def local_identity_error(self, k: int, m: int, s: complex) -> complex:
        """Erro local: (D-B)-|A_p|b_c."""
        return (self.local_direct(k, m, s) - self.local_bracket(k, m, s)) - self.local_center_survivor(k, m, s)

    def local_terms(self, k: int, m: int, s: complex) -> list[tuple[int, int, complex, complex]]:
        """Lista (a, n, a_n, b_n(s)) das pernas."""
        c = self.center(k, m)
        rows: list[tuple[int, int, complex, complex]] = []
        for a in self.legs:
            n = c + a
            rows.append((a, n, self.coeffs(n), self.b(n, s)))
        return rows

    def global_sums(self, K: int, M: int, s: complex) -> tuple[complex, complex, complex, int]:
        """
        Soma truncada global ponderada por p^(-k).

        Retorna:
            D, B, C, count_centers
        onde C = soma central sobrevivente.
        """
        if K < self.k0:
            raise ValueError(f"K={K} abaixo de k0={self.k0}")
        if M < 1:
            raise ValueError("M precisa ser positivo")

        D = 0.0 + 0.0j
        B = 0.0 + 0.0j
        C = 0.0 + 0.0j
        count = 0
        for k in range(self.k0, K + 1):
            w = self.p ** (-k)
            for m in range(1, M + 1):
                if gcd(m, self.p) != 1:
                    continue
                count += 1
                d = self.local_direct(k, m, s)
                b = self.local_bracket(k, m, s)
                c = self.local_center_survivor(k, m, s)
                D += w * d
                B += w * b
                C += w * c
        return D, B, C, count

    def global_identity_error(self, K: int, M: int, s: complex) -> complex:
        D, B, C, _ = self.global_sums(K, M, s)
        return (D - B) - C

    def separated_center_sum(self, K: int, M: int, s: complex) -> complex:
        """
        Soma central separada quando a_{p^k m}=a_{p^k}a_m.

        Para zeta e caracteres modulares multiplicativos nao ramificados, isso e a forma
        vertical x horizontal truncada.

        Nao checa multiplicatividade global; apenas calcula a expressao separada:

            |A_p| * (sum_k a_{p^k} p^{-k(1+s)})
                    * (sum_{m<=M, gcd(m,p)=1} a_m m^{-s})
        """
        vertical = 0.0 + 0.0j
        for k in range(self.k0, K + 1):
            vertical += self.coeffs.value_at_prime_power(self.p, k) * cmath.exp(
                -k * (1.0 + s) * math.log(float(self.p))
            )

        horizontal = 0.0 + 0.0j
        for m in range(1, M + 1):
            if gcd(m, self.p) == 1:
                horizontal += self.coeffs(m) * complex_power_n_minus_s(m, s)

        return self.branch_count * vertical * horizontal

    def infinite_normalizer(self, s: complex) -> complex | None:
        """
        Fator infinito c_{p,a}(s), quando modelavel como zeta ou tabela Dirichlet.

        Para zeta:
            c_p(s)=|A_p| q^k0/(1-q) (1-p^{-s}), q=p^{-1-s}

        Para tabela modular Dirichlet:
            c_{p,chi}(s)=|A_p| q^k0/(1-q) (1-chi(p)p^{-s}),
            q=chi(p)p^{-1-s}

        Retorna None se nao reconhecer o modelo.
        """
        logp = math.log(float(self.p))

        if self.coeffs.name == "zeta/all-ones":
            q = cmath.exp(-(1.0 + s) * logp)
            p_minus_s = cmath.exp(-s * logp)
            return self.branch_count * (q ** self.k0) / (1.0 - q) * (1.0 - p_minus_s)

        chi_p = self.coeffs.chi_p(self.p)
        if chi_p is None:
            return None

        q = chi_p * cmath.exp(-(1.0 + s) * logp)
        p_minus_s_twisted = chi_p * cmath.exp(-s * logp)
        return self.branch_count * (q ** self.k0) / (1.0 - q) * (1.0 - p_minus_s_twisted)

    def l_truncated(self, N: int, s: complex) -> complex:
        """Soma L_N(s)=sum_{n<=N} a_n n^(-s)."""
        if N < 1:
            raise ValueError("N precisa ser positivo")
        return sum(self.b(n, s) for n in range(1, N + 1))


# -----------------------------------------------------------------------------
# Relatorios
# -----------------------------------------------------------------------------


def print_header(title: str) -> None:
    print(title)
    print("=" * len(title))


def print_local_report(op: CpBracketOperator, k: int, m: int, s: complex, show_terms: bool) -> None:
    c = op.center(k, m)
    D = op.local_direct(k, m, s)
    B = op.local_bracket(k, m, s)
    C = op.local_center_survivor(k, m, s)
    err = (D - B) - C

    print("\nLocal bracket Cp")
    print(f"p={op.p}, A_p={op.legs}, |A_p|={op.branch_count}, k0={op.k0}")
    print(f"coefficients={op.coeffs.name}")
    print(f"s={s.real}+{s.imag}i, k={k}, m={m}, c=p^k*m={c}")
    print("\nObjetos locais:")
    print(f"D_c                 = {fmt_complex(D)}")
    print(f"B_c                 = {fmt_complex(B)}")
    print(f"D_c - B_c           = {fmt_complex(D - B)}")
    print(f"|A_p| b_c           = {fmt_complex(C)}")
    print(f"identity_error      = {fmt_complex(err)}")
    print(f"abs(identity_error) = {abs(err):.3e}")

    if show_terms:
        print("\nTermos laterais:")
        print(f"{'a':>4} {'n=c+a':>10} {'a_n':>30} {'b_n(s)=a_n n^-s':>34}")
        print("-" * 86)
        for a, n, an, bn in op.local_terms(k, m, s):
            print(f"{a:4d} {n:10d} {fmt_complex(an):>30} {fmt_complex(bn):>34}")
        print("\nCentro:")
        bc = op.b(c, s)
        print(f"a_c                 = {fmt_complex(op.coeffs(c))}")
        print(f"b_c                 = {fmt_complex(bc)}")


def print_global_report(op: CpBracketOperator, K: int, M: int, s: complex) -> None:
    D, B, C, count = op.global_sums(K, M, s)
    err = (D - B) - C

    print("\nGlobal truncated Cp")
    print(f"p={op.p}, A_p={op.legs}, |A_p|={op.branch_count}, k0={op.k0}")
    print(f"coefficients={op.coeffs.name}")
    print(f"s={s.real}+{s.imag}i, K={K}, M={M}, centers={count}")
    print("\nSomas truncadas ponderadas por p^(-k):")
    print(f"D_{{Cp}}^{{K,M}}       = {fmt_complex(D)}")
    print(f"B_{{Cp}}^{{K,M}}       = {fmt_complex(B)}")
    print(f"D - B                = {fmt_complex(D - B)}")
    print(f"central survivor C   = {fmt_complex(C)}")
    print(f"identity_error       = {fmt_complex(err)}")
    print(f"abs(identity_error)  = {abs(err):.3e}")


def print_factor_report(op: CpBracketOperator, K: int, M: int, s: complex, N: int) -> None:
    _D, _B, C, count = op.global_sums(K, M, s)
    Fsep = op.separated_center_sum(K, M, s)
    sep_err = C - Fsep
    normalizer = op.infinite_normalizer(s)

    print("\nVertical/horizontal factor audit")
    print(f"p={op.p}, coeffs={op.coeffs.name}, K={K}, M={M}, centers={count}")
    print(f"central survivor C       = {fmt_complex(C)}")
    print(f"separated expression     = {fmt_complex(Fsep)}")
    print(f"separation_error         = {fmt_complex(sep_err)}")
    print(f"abs(separation_error)    = {abs(sep_err):.3e}")

    if normalizer is None:
        print("\nnormalizer: nao reconhecido para este modelo de coeficientes")
        return

    print("\nInfinite formal normalizer:")
    print(f"c_p,a(s)                = {fmt_complex(normalizer)}")

    if N > 0:
        LN = op.l_truncated(N, s)
        print(f"L_N(s), N={N:<8d}        = {fmt_complex(LN)}")
        print(f"c_p,a(s) * L_N(s)       = {fmt_complex(normalizer * LN)}")
        print("obs: comparacao com L_N so e numericamente significativa em Re(s)>1 e N grande.")

    chi_p = op.coeffs.chi_p(op.p)
    if chi_p is not None:
        print("\nLocal Euler status:")
        print(f"chi(p)                  = {fmt_complex(chi_p)}")
        if abs(chi_p) < EPS:
            print("status                  = ramificado/cego: centros p^k m têm coeficiente zero")
        else:
            print("status                  = nao ramificado: torre vertical viva")


def run_demo(args: argparse.Namespace) -> None:
    s = complex(args.sigma, args.t)
    model = known_coefficient_model(args)
    print_header("Cp Bracket Operator Audit")

    for p in parse_int_list(args.primes):
        op = CpBracketOperator(p=p, coeffs=model, k_start=args.k_start)
        k = max(args.k, op.k0)
        m = args.m
        if gcd(m, p) != 1:
            # escolhe o primeiro m coprimo para o demo nao morrer por bobagem.
            m = 1
            while gcd(m, p) != 1:
                m += 1

        c = op.center(k, m)
        D = op.local_direct(k, m, s)
        B = op.local_bracket(k, m, s)
        C = op.local_center_survivor(k, m, s)
        err = (D - B) - C

        Dg, Bg, Cg, count = op.global_sums(args.K, args.M, s)
        errg = (Dg - Bg) - Cg
        Fsep = op.separated_center_sum(args.K, args.M, s)
        sep_err = Cg - Fsep

        print(
            f"p={p:2d} A={op.branch_count:2d} k0={op.k0:1d} "
            f"local_c={c:8d} local_err={abs(err):.3e} "
            f"global_centers={count:5d} global_err={abs(errg):.3e} "
            f"sep_err={abs(sep_err):.3e}"
        )

    print("\nLegenda:")
    print("local_err  = |(D_c-B_c)-|A_p|b_c|")
    print("global_err = |(D-B)-C| na soma truncada")
    print("sep_err    = |C - vertical*horizontal|; deve ser ~0 para zeta/Dirichlet compatível")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Auditoria do bracket Cp local/global.")
    parser.add_argument(
        "--mode",
        choices=("demo", "local", "global", "factor", "all"),
        default="demo",
        help="demo=tabela curta; local=um centro; global=soma truncada; factor=separacao; all=tudo.",
    )
    parser.add_argument("--p", type=int, default=5, help="Primo Cp para modos local/global/factor/all.")
    parser.add_argument("--primes", type=str, default="2,3,5,7,11", help="Lista de primos para --mode demo.")
    parser.add_argument("--k-start", type=int, default=None, help="Override de k0. Default: p=2 usa 2; p impar usa 1.")

    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--t", type=float, default=14.134725)
    parser.add_argument("--k", type=int, default=1)
    parser.add_argument("--m", type=int, default=1)
    parser.add_argument("--K", type=int, default=5)
    parser.add_argument("--M", type=int, default=25)
    parser.add_argument("--N", type=int, default=5000, help="Corte para L_N no modo factor.")

    parser.add_argument(
        "--coeff",
        type=str,
        default="zeta",
        help="zeta, chi3, chi4, chi5quad, chi5complex ou custom.",
    )
    parser.add_argument("--mod", type=int, default=None, help="Modulo para --coeff custom.")
    parser.add_argument("--values", type=str, default=None, help="Tabela para custom, ex: '0:0,1:1,2:-1'.")
    parser.add_argument("--show-terms", action="store_true", help="Mostra termos laterais no modo local/all.")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    model = known_coefficient_model(args)
    s = complex(args.sigma, args.t)

    if args.mode == "demo":
        run_demo(args)
        return

    op = CpBracketOperator(p=args.p, coeffs=model, k_start=args.k_start)
    print_header("Cp Bracket Operator Audit")

    if args.mode in {"local", "all"}:
        k = max(args.k, op.k0)
        print_local_report(op, k=k, m=args.m, s=s, show_terms=args.show_terms)

    if args.mode in {"global", "all"}:
        print_global_report(op, K=args.K, M=args.M, s=s)

    if args.mode in {"factor", "all"}:
        print_factor_report(op, K=args.K, M=args.M, s=s, N=args.N)


if __name__ == "__main__":
    try:
        main()
    except BrokenPipeError:
        pass
