# Projected J0 Positive Box Certificate Pack

This directory contains a reproducible external certificate pack for projected-j0 constant boxes.

Files:

- `config.json`: parameters, command, script hash, git head, and global summary.
- `boxes.csv`: per-box constants from the interval certifier.
- `boxes.json`: JSON rendering of `boxes.csv`.
- `commands.sh`: command recorded in the source run.
- `summary.md`: compact human-readable summary.

The pack conceptually supplies constants for `ProjectedJ0ConstantBoxData`, but it does not prove those constants in Lean and does not verify interval arithmetic inside Lean.
