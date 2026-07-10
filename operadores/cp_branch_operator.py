#!/usr/bin/env python3
"""
Operador de Ramo Cp
===================

Este script implementa o operador de ramo da geometria Cp:

    W_{p,s}: C -> ell^2(A_p x {k0, k0+1, ...})
    (W_{p,s} z)_{a,k} = p^(-k s) z

Ele calcula:

    BranchMass_p(sigma) = ||W_{p,s}||^2
    BranchDefect_p(sigma) = BranchMass_p(sigma) - 1
    BranchMass_{p,K}(sigma) = massa truncada ate K
    Tail_{p,K}(sigma) = cauda depois de K

Convenções:

    p = 2:
        A_2 = {-1, +1}
        k0 = 2

    p impar:
        A_p = {-(p-1)/2, ..., -1, +1, ..., +(p-1)/2}
        k0 = 1

Na linha critica sigma = 1/2, a massa quadratica infinita vale 1
para todo primo p.

Dependências: somente biblioteca padrão do Python.
"""

from __future__ import annotations

import argparse
import cmath
import math
from dataclasses import dataclass
from typing import Iterable


EPS = 1e-15


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


def parse_int_list(text: str) -> list[int]:
    """Parseia '2,3,5' em [2, 3, 5]."""
    out: list[int] = []
    for part in text.split(','):
        part = part.strip()
        if part:
            out.append(int(part))
    return out


def parse_float_list(text: str) -> list[float]:
    """Parseia '0.25,0.5,1.0' em [0.25, 0.5, 1.0]."""
    out: list[float] = []
    for part in text.split(','):
        part = part.strip()
        if part:
            out.append(float(part))
    return out


def parse_complex(text: str) -> complex:
    """Parseia complexo em formato Python, aceitando 'i' como alias de 'j'."""
    clean = text.strip().replace('i', 'j')
    return complex(clean)


@dataclass(frozen=True)
class CpBranchOperator:
    """
    Operador de ramo Cp.

    Parameters
    ----------
    p:
        Primo da geometria Cp.
    k_start:
        Profundidade inicial. Se None, usa a convenção canonica:
        p=2 -> 2; p impar -> 1.
    """

    p: int
    k_start: int | None = None

    def __post_init__(self) -> None:
        if not is_prime(self.p):
            raise ValueError(f"p precisa ser primo; recebido p={self.p}")
        if self.k_start is not None and self.k_start < 1:
            raise ValueError("k_start precisa ser >= 1")

    @property
    def k0(self) -> int:
        """Profundidade inicial canonica."""
        if self.k_start is not None:
            return int(self.k_start)
        return 2 if self.p == 2 else 1

    @property
    def legs(self) -> tuple[int, ...]:
        """Ramos laterais A_p."""
        if self.p == 2:
            return (-1, 1)
        h = (self.p - 1) // 2
        return tuple(range(-h, 0)) + tuple(range(1, h + 1))

    @property
    def branch_count(self) -> int:
        """Numero de ramos laterais."""
        return len(self.legs)

    def q_branch(self, sigma: float) -> float:
        """
        Razao quadratica de ramo:

            q_br(sigma) = p^(-2 sigma).
        """
        self._check_sigma(sigma)
        return self.p ** (-2.0 * sigma)

    def coefficient(self, k: int, sigma: float, t: float = 0.0) -> complex:
        """
        Coeficiente de uma profundidade:

            p^(-k(sigma + i t)).
        """
        if k < self.k0:
            raise ValueError(f"k={k} abaixo de k0={self.k0}")
        self._check_sigma(sigma)
        s = complex(sigma, t)
        return cmath.exp(-k * s * math.log(self.p))

    def apply_finite(
        self,
        z: complex,
        sigma: float,
        t: float = 0.0,
        K: int = 12,
    ) -> dict[tuple[int, int], complex]:
        """
        Aplica o operador truncado ate a profundidade K.

        Retorna um dicionario:

            (a, k) -> p^(-k s) z

        onde a pertence a A_p e k0 <= k <= K.
        """
        if K < self.k0:
            raise ValueError(f"K={K} abaixo de k0={self.k0}")

        out: dict[tuple[int, int], complex] = {}
        for k in range(self.k0, K + 1):
            coeff = self.coefficient(k, sigma=sigma, t=t)
            for a in self.legs:
                out[(a, k)] = coeff * z
        return out

    def finite_mass(self, sigma: float, K: int) -> float:
        """
        Massa quadratica truncada:

            BranchMass_{p,K}(sigma)
            = |A_p| * sum_{k=k0}^K p^(-2 k sigma).
        """
        if K < self.k0:
            return 0.0
        q = self.q_branch(sigma)
        n_terms = K - self.k0 + 1
        if abs(1.0 - q) < EPS:
            # Fora do dominio sigma>0 isso poderia acontecer; fica por completude.
            return self.branch_count * n_terms
        return self.branch_count * (q ** self.k0) * (1.0 - q ** n_terms) / (1.0 - q)

    def tail_mass(self, sigma: float, K: int) -> float:
        """
        Cauda quadratica depois de K:

            Tail_{p,K}(sigma)
            = |A_p| * sum_{k=K+1}^infty p^(-2 k sigma).
        """
        self._check_sigma(sigma)
        q = self.q_branch(sigma)
        if K < self.k0:
            return self.mass(sigma)
        return self.branch_count * (q ** (K + 1)) / (1.0 - q)

    def mass(self, sigma: float) -> float:
        """
        Norma quadratica infinita:

            BranchMass_p(sigma) = ||W_{p,s}||^2
            = |A_p| * p^(-2 k0 sigma) / (1 - p^(-2 sigma)).
        """
        self._check_sigma(sigma)
        q = self.q_branch(sigma)
        return self.branch_count * (q ** self.k0) / (1.0 - q)

    def norm(self, sigma: float) -> float:
        """Norma ||W_{p,s}||."""
        return math.sqrt(self.mass(sigma))

    def defect(self, sigma: float) -> float:
        """
        Defeito de ramo:

            BranchDefect_p(sigma) = BranchMass_p(sigma) - 1.
        """
        return self.mass(sigma) - 1.0

    def regime(self, sigma: float, tol: float = 1e-12) -> str:
        """Classifica contração / saturação / expansão."""
        d = self.defect(sigma)
        if abs(d) <= tol:
            return "saturacao"
        if d < 0:
            return "contracao"
        return "expansao"

    def check_tail_identity(self, sigma: float, K: int) -> float:
        """
        Erro absoluto da identidade:

            finite_mass + tail_mass = mass.
        """
        return abs(self.finite_mass(sigma, K) + self.tail_mass(sigma, K) - self.mass(sigma))

    def _check_sigma(self, sigma: float) -> None:
        if sigma <= 0.0:
            raise ValueError("sigma precisa ser > 0 para a massa infinita convergir")


def print_report(primes: Iterable[int], sigmas: Iterable[float], K: int) -> None:
    """Imprime tabela de massas para varias bases primas e sigmas."""
    header = (
        f"{'p':>3} {'A_p':>5} {'k0':>3} {'sigma':>9} "
        f"{'mass':>18} {'norm':>14} {'defect':>14} "
        f"{'finite_K':>18} {'tail_K':>14} {'regime':>10}"
    )
    print(header)
    print('-' * len(header))

    for p in primes:
        op = CpBranchOperator(p)
        for sigma in sigmas:
            mass = op.mass(sigma)
            finite = op.finite_mass(sigma, K)
            tail = op.tail_mass(sigma, K)
            print(
                f"{p:3d} {op.branch_count:5d} {op.k0:3d} {sigma:9.5f} "
                f"{mass:18.12g} {op.norm(sigma):14.8g} {op.defect(sigma):14.6g} "
                f"{finite:18.12g} {tail:14.6g} {op.regime(sigma):>10}"
            )


def print_vector_sample(p: int, sigma: float, t: float, K: int, z: complex, limit: int) -> None:
    """Mostra algumas coordenadas do operador truncado."""
    op = CpBranchOperator(p)
    values = op.apply_finite(z=z, sigma=sigma, t=t, K=K)

    print(f"\nAmostra de W_{{p,s}} z para p={p}, sigma={sigma}, t={t}, K={K}, z={z}")
    print(f"A_p={op.legs}, k0={op.k0}")
    print(f"{'a':>4} {'k':>4} {'valor':>34} {'abs':>14}")
    print('-' * 62)

    for i, ((a, k), value) in enumerate(values.items()):
        if i >= limit:
            remaining = len(values) - limit
            if remaining > 0:
                print(f"... mais {remaining} coordenadas")
            break
        print(f"{a:4d} {k:4d} {value.real: .12e}{value.imag:+.12e}j {abs(value):14.6g}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Operador de Ramo Cp: massa quadratica e truncamentos.")
    parser.add_argument("--primes", default="2,3,5,7,11", help="Lista de primos, ex: 2,3,5,7")
    parser.add_argument("--sigmas", default="0.25,0.5,1.0", help="Lista de sigmas, ex: 0.25,0.5,1.0")
    parser.add_argument("--K", type=int, default=12, help="Profundidade final para truncamento")
    parser.add_argument("--vector", action="store_true", help="Mostrar amostra do vetor truncado W_{p,s} z")
    parser.add_argument("--p", type=int, default=3, help="Primo usado na amostra vetorial")
    parser.add_argument("--sigma", type=float, default=0.5, help="Sigma da amostra vetorial")
    parser.add_argument("--t", type=float, default=14.134725, help="Altura t da amostra vetorial")
    parser.add_argument("--z", default="1+0j", help="Entrada complexa z, ex: 1+0j ou 2-3i")
    parser.add_argument("--limit", type=int, default=20, help="Quantidade de coordenadas na amostra vetorial")

    args = parser.parse_args()

    primes = parse_int_list(args.primes)
    sigmas = parse_float_list(args.sigmas)

    print("Cp Branch Operator")
    print("==================")
    print_report(primes=primes, sigmas=sigmas, K=args.K)

    # Teste estrutural na linha critica.
    print("\nTeste da linha critica sigma=1/2")
    for p in primes:
        op = CpBranchOperator(p)
        print(
            f"p={p:2d}: mass(1/2)={op.mass(0.5):.16f}, "
            f"tail_identity_error(K={args.K})={op.check_tail_identity(0.5, args.K):.3e}"
        )

    if args.vector:
        print_vector_sample(
            p=args.p,
            sigma=args.sigma,
            t=args.t,
            K=args.K,
            z=parse_complex(args.z),
            limit=args.limit,
        )


if __name__ == "__main__":
    main()
