#!/usr/bin/env python3
"""
Gera CSV com a decomposicao C_p de cada n.

Formato conceitual:
    n = p^k * m + a

onde:
    c = p^k * m = n - a
    p nao divide m
    a = 0  -> n e centro
    a != 0 -> n e perna do centro c

Para p impar, a e o residuo simetrico:
    a in {-(p-1)/2, ..., -1, +1, ..., +(p-1)/2}

Para C2, por padrao usamos o modo mod4:
    n par: centro, a=0, k=v2(n)
    n impar 1 mod 4: a=+1, c=n-1
    n impar 3 mod 4: a=-1, c=n+1
Isso encaixa os impares nas pernas de centros divisiveis por 4, exceto a borda n=1.

Exemplo:
    python3 cp_decomposicao_csv.py --limit 1000000 --out cp_decomposicao_1M.csv.gz

CSV compacto:
    n,c2,c3,c5,c7

CSV wide:
    n,c2_role,c2_k,c2_m,c2_a,c2_center,...
"""

from __future__ import annotations

import argparse
import csv
import gzip
from dataclasses import dataclass
from typing import Iterable, TextIO


@dataclass(frozen=True)
class CpAddress:
    p: int
    role: str       # C=center, L=leg, B=boundary
    k: int | None
    m: int | None
    a: int
    center: int

    def compact(self) -> str:
        if self.role == "B":
            return f"B:a={self.a};c={self.center}"
        return f"{self.role}:k={self.k};m={self.m};a={self.a};c={self.center}"


def vp(n: int, p: int) -> tuple[int, int]:
    """Retorna (k, m) com n = p^k * m e p nao divide m."""
    if n <= 0:
        raise ValueError("vp exige n positivo")
    k = 0
    while n % p == 0:
        n //= p
        k += 1
    return k, n


def symmetric_residue(n: int, p: int) -> int:
    """
    Residuo simetrico modulo p.
    Para p impar: retorna a em [-(p//2), ..., -1, 0, 1, ..., p//2].
    """
    r = n % p
    if r == 0:
        return 0
    half = p // 2
    if r <= half:
        return r
    return r - p


def decompose_cp(n: int, p: int, c2_mode: str = "mod4") -> CpAddress:
    if n <= 0:
        raise ValueError("n precisa ser positivo")

    # Centros: n ja e multiplo de p.
    if n % p == 0:
        k, m = vp(n, p)
        return CpAddress(p=p, role="C", k=k, m=m, a=0, center=n)

    # C2 tem ambiguidade natural para impares: todo impar esta entre dois pares.
    # O modo mod4 escolhe o centro divisivel por 4, que e o encaixe usual do bracket C2.
    if p == 2:
        if c2_mode == "mod4":
            if n == 1:
                # Borda: n=1 nao tem centro positivo divisivel por 4 com perna +/-1.
                return CpAddress(p=p, role="B", k=None, m=None, a=1, center=0)
            a = 1 if n % 4 == 1 else -1
        elif c2_mode == "right":
            a = 1
        elif c2_mode == "left":
            a = -1
        else:
            raise ValueError(f"c2_mode invalido: {c2_mode}")
    else:
        a = symmetric_residue(n, p)
        if a == 0:
            # Ja teria caido no caso centro.
            raise RuntimeError("residuo zero inesperado")

    c = n - a
    if c <= 0:
        return CpAddress(p=p, role="B", k=None, m=None, a=a, center=c)

    k, m = vp(c, p)
    if k == 0:
        raise RuntimeError(f"centro nao ficou divisivel por p: n={n}, p={p}, a={a}, c={c}")
    return CpAddress(p=p, role="L", k=k, m=m, a=a, center=c)


def open_text(path: str) -> TextIO:
    if path.endswith(".gz"):
        return gzip.open(path, "wt", newline="", encoding="utf-8")
    return open(path, "w", newline="", encoding="utf-8")


def generate(limit: int, out: str, primes: Iterable[int], wide: bool, c2_mode: str) -> None:
    primes = list(primes)
    with open_text(out) as f:
        writer = csv.writer(f)
        if wide:
            header = ["n"]
            for p in primes:
                tag = f"c{p}"
                header.extend([f"{tag}_role", f"{tag}_k", f"{tag}_m", f"{tag}_a", f"{tag}_center"])
            writer.writerow(header)

            for n in range(1, limit + 1):
                row: list[int | str] = [n]
                for p in primes:
                    d = decompose_cp(n, p, c2_mode=c2_mode)
                    row.extend([
                        d.role,
                        "" if d.k is None else d.k,
                        "" if d.m is None else d.m,
                        d.a,
                        d.center,
                    ])
                writer.writerow(row)
        else:
            writer.writerow(["n", *[f"c{p}" for p in primes]])
            for n in range(1, limit + 1):
                writer.writerow([n, *[decompose_cp(n, p, c2_mode=c2_mode).compact() for p in primes]])


def parse_primes(text: str) -> list[int]:
    primes = [int(x.strip()) for x in text.split(",") if x.strip()]
    allowed = {2, 3, 5, 7}
    bad = [p for p in primes if p not in allowed]
    if bad:
        raise argparse.ArgumentTypeError(f"por enquanto use apenas {sorted(allowed)}; invalidos: {bad}")
    return primes


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=1_000_000, help="maior n incluido no CSV")
    ap.add_argument("--out", default="cp_decomposicao_1M.csv.gz", help="arquivo de saida .csv ou .csv.gz")
    ap.add_argument("--primes", type=parse_primes, default=[2, 3, 5, 7], help="primos separados por virgula")
    ap.add_argument("--wide", action="store_true", help="gera colunas separadas role/k/m/a/center para cada C_p")
    ap.add_argument("--c2-mode", choices=["mod4", "right", "left"], default="mod4", help="como escolher a perna C2 dos impares")
    args = ap.parse_args()

    if args.limit < 1:
        raise SystemExit("--limit precisa ser >= 1")

    generate(args.limit, args.out, args.primes, args.wide, args.c2_mode)
    print(f"CSV gerado: {args.out}")
    print(f"linhas de dados: {args.limit}")
    print(f"primos: {args.primes}")
    print(f"modo: {'wide' if args.wide else 'compact'}")


if __name__ == "__main__":
    main()
