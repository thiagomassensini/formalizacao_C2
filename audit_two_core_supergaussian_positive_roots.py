#!/usr/bin/env python3
"""Refine positive-cutoff collisions for super-Gaussian two-core prefixes.

This is a numerical audit helper, not proof evidence.  Its purpose is to keep
the proof target honest: the super-Gaussian finite two-core prefix should not
be claimed nonzero on the unrestricted region `Re(s) > 0, X > 0`.

The script fixes the same small positive sigma used by the near-collision
certificate and refines positive `X` roots for p = 2, 4, 8 from deterministic
starting guesses found by the local audit.
"""

from __future__ import annotations

import sys

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover - audit environment check
    raise SystemExit("mpmath is required for this audit script") from exc


DEFAULT_DPS = 90
DEFAULT_SIGMA = (
    "3.0194247128036203561501360761502444091951103676256028679195137886407318536631797e-9"
)

ROOT_GUESSES = {
    2: ("168021.56816465463", "551878.3902479507"),
    4: ("168021.17186748315", "20.28857758155745"),
    8: ("168021.56816465652", "836.1188857981548"),
}


def cutoff_weight(n: int, cutoff: mp.mpf, power: int) -> mp.mpf:
    return mp.exp(-((mp.mpf(n) / cutoff) ** power))


def address_prefix(s: mp.mpc, cutoff: mp.mpf, power: int, address: int) -> mp.mpc:
    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    w4 = cutoff_weight(4, cutoff, power)
    total = mp.mpc(0)
    for j in range(4):
        total += q**j * cutoff_weight(address * (2**j), cutoff, power) / w4
    return total


def two_core_prefix(sigma: mp.mpf, t: mp.mpf, log_cutoff: mp.mpf, power: int) -> mp.mpc:
    cutoff = mp.exp(log_cutoff)
    s = mp.mpc(sigma, t)
    core3 = mp.exp(-s * mp.log(3))
    return (
        address_prefix(s, cutoff, power, 4)
        + core3 * address_prefix(s, cutoff, power, 12)
    )


def fmt(value: mp.mpf | mp.mpc, digits: int = 40) -> str:
    return mp.nstr(value, digits)


def main() -> int:
    mp.mp.dps = DEFAULT_DPS
    sigma = mp.mpf(DEFAULT_SIGMA)

    print("positive-cutoff super-Gaussian two-core collision refinement")
    print(f"sigma = {fmt(sigma, 70)}")
    print("object = A_4(s,X) + 3^(-s) A_12(s,X)")
    print()
    print("p  t                                      X                                      |prefix|")
    print("-" * 110)

    failed = False
    for power, (t_guess_raw, cutoff_guess_raw) in ROOT_GUESSES.items():
        t_guess = mp.mpf(t_guess_raw)
        log_cutoff_guess = mp.log(mp.mpf(cutoff_guess_raw))
        try:
            t_root, log_cutoff_root = mp.findroot(
                lambda t, log_cutoff: (
                    mp.re(two_core_prefix(sigma, t, log_cutoff, power)),
                    mp.im(two_core_prefix(sigma, t, log_cutoff, power)),
                ),
                (t_guess, log_cutoff_guess),
                tol=mp.mpf("1e-55"),
                maxsteps=50,
            )
        except Exception as exc:  # pragma: no cover - numerical audit failure
            print(f"{power:<2} refinement failed: {exc}", file=sys.stderr)
            failed = True
            continue

        cutoff_root = mp.exp(log_cutoff_root)
        value = two_core_prefix(sigma, t_root, log_cutoff_root, power)
        print(
            f"{power:<2} "
            f"{fmt(t_root, 38):>38} "
            f"{fmt(cutoff_root, 38):>38} "
            f"{fmt(abs(value), 18):>24}"
        )
        if cutoff_root <= 0 or abs(value) > mp.mpf("1e-40"):
            failed = True

    print()
    print("notes:")
    print("- These positive-X roots rule out the unrestricted global cutoff target.")
    print("- They do not rule out a large-cutoff or middle-region separation theorem.")
    print("- The active Lean route is address closeness implying norm separation.")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
