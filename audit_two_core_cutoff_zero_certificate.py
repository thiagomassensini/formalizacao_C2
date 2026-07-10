#!/usr/bin/env python3
"""Numerical audit for the finite C2 genuine two-core cutoff obstruction.

This is not proof evidence.  It is a reproducible sanity check showing that the
unrestricted statement

    rectangularExponentialGenuine s 5 3 X != 0

for all Re(s) > 0 and X > 0 is not a safe Lean target.  The computation uses
the exact finite prefix isolated in Lean as
`GenuineMiddleAudit.twoCoreCutoffFiberPrefix`.
"""

from __future__ import annotations

import sys

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover - audit environment check
    raise SystemExit("mpmath is required for this audit script") from exc


mp.mp.dps = 90

SIGMA = mp.mpf(
    "0.0000000030194247128036203561501360761502444091951103676256028679195137886407318536631797"
)
T = mp.mpf(
    "168021.5681646169889802475354446413458822734703419614965793993461764136166896686"
)
X = mp.mpf("81444144.70071535")


def two_core_cutoff_fiber_prefix(sigma: mp.mpf, t: mp.mpf, cutoff: mp.mpf) -> mp.mpc:
    """Exact normalized `K=5, M=3` fiber prefix from the Lean audit.

    With `r = exp(-4 / X)`, `q = 1/2 * 2^(-s)`, and `c = 3^(-s)`, the prefix is

        sum_{j=0}^3 q^j r^(2^j - 1) (1 + c r^(2^(j+1))).
    """

    s = mp.mpc(sigma, t)
    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    c = mp.exp(-s * mp.log(3))
    r = mp.exp(-mp.mpf(4) / cutoff)
    total = mp.mpc(0)
    for j in range(4):
        total += q**j * r ** (2**j - 1) * (1 + c * r ** (2 ** (j + 1)))
    return total


def rectangular_exponential_genuine_scalar(sigma: mp.mpf, t: mp.mpf, cutoff: mp.mpf) -> mp.mpc:
    """The nonzero scalar removed by the Lean factorization."""

    s = mp.mpc(sigma, t)
    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    w4 = mp.exp(-mp.mpf(4) / cutoff)
    return 2 * q**2 * w4


def main() -> int:
    prefix = two_core_cutoff_fiber_prefix(SIGMA, T, X)
    scalar = rectangular_exponential_genuine_scalar(SIGMA, T, X)
    block = scalar * prefix

    print("finite genuine two-core cutoff audit")
    print(f"sigma = {mp.nstr(SIGMA, 80)}")
    print(f"t     = {mp.nstr(T, 80)}")
    print(f"X     = {mp.nstr(X, 80)}")
    print(f"prefix      = {mp.nstr(prefix, 80)}")
    print(f"|prefix|    = {mp.nstr(abs(prefix), 30)}")
    print(f"block       = {mp.nstr(block, 80)}")
    print(f"|block|     = {mp.nstr(abs(block), 30)}")
    print(f"|scalar|    = {mp.nstr(abs(scalar), 30)}")

    if SIGMA <= 0 or X <= 0:
        print("invalid certificate: sigma and X must be positive", file=sys.stderr)
        return 2

    # This threshold is deliberately loose relative to the displayed residual.
    # It is a numerical tripwire, not a mathematical certificate.
    return 0 if abs(prefix) < mp.mpf("1e-50") else 1


if __name__ == "__main__":
    raise SystemExit(main())
