#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
case "${1:-}" in
  plane) source=A_Dot_Product_Is_All_You_Need_Final; capstone=DotProduct.theorem1_table1_axioms ;;
  *) echo "Usage: $0 plane" >&2; exit 2 ;;
esac
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
original="$root/lean/$source.lean"
# Preserve the distributed source while compiling it and reporting its capstone's dependencies.
{ cat "$original"; printf '\n#print axioms %s\n' "$capstone"; } > "$work/$source.lean"
cd "${LEAN_PROJECT_DIR:-$root/lean}"
lake env lean "$work/$source.lean" 2>&1 | tee "$work/check.log"
if grep -E 'error:|warning:|sorryAx' "$work/check.log"; then exit 1; fi
python3 - "$work/check.log" "$capstone" <<'PY'
import pathlib, re, sys
log = pathlib.Path(sys.argv[1]).read_text()
cap = sys.argv[2]
reports = re.findall(r"^'" + re.escape(cap) + r"' depends on axioms: \[([^\]]*)\]", log, re.M)
if len(reports) != 1:
    raise SystemExit(f"Expected exactly one axiom report for {cap}")
allowed = {"propext", "Classical.choice", "Quot.sound"}
actual = {x.strip() for x in reports[0].split(",") if x.strip()}
if not actual <= allowed:
    raise SystemExit(f"Nonstandard axioms: {actual - allowed}")
PY
