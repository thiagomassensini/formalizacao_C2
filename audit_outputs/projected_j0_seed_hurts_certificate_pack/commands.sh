#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
operadores/c2_projected_j0_interval_box_certifier.py --boxes-csv audit_outputs/c2_projected_j0_atlas_scout_seed_hurts_sigma0740_t14p25_14p35_w002_boxes.csv --label interval_seed_hurts_sigma0740_t14p25_14p35_w002_pass_fast_sub512 --only-pass-combined --K 16 --M 12001 --ref-K 17 --ref-M 16001 --reference-mode supergaussian --reference-X 10661 --reference-p 2 --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 --odd-reference-mode supergaussian --odd-ref-M 16001 --odd-reference-X 10661 --odd-reference-p 2 --interval-dps 50 --inflate 1e-12 --mode fast --subdiv-t 512 --top 8
