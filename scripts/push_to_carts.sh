#!/usr/bin/env bash
# Nahraje cart soubor na všechny nakonfigurované handheldy najednou (paralelně přes scp).
#
# Použití:
#   ./scripts/push_to_carts.sh ninja.p8
#   ./scripts/push_to_carts.sh ninja.p8 --dry-run   # jen ukáže, co by se poslalo
#
# Cíle se čtou z scripts/targets.conf (viz targets.example.conf pro formát a založení).

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
targets_file="${script_dir}/targets.conf"

cart="${1:-}"
dry_run=false
if [[ "${2:-}" == "--dry-run" ]]; then
  dry_run=true
fi

if [[ -z "$cart" ]]; then
  echo "Použití: $0 <cart.p8> [--dry-run]" >&2
  exit 1
fi

if [[ ! -f "$cart" ]]; then
  echo "Cart soubor nenalezen: $cart" >&2
  exit 1
fi

if [[ ! -f "$targets_file" ]]; then
  echo "Chybí ${targets_file}." >&2
  echo "Zkopíruj scripts/targets.example.conf jako scripts/targets.conf a vyplň handheldy." >&2
  exit 1
fi

ssh_opts=(-o ConnectTimeout=5 -o StrictHostKeyChecking=accept-new -o BatchMode=yes)

pids=()
names=()

while IFS= read -r line; do
  line="${line%%#*}"
  line="$(echo "$line" | xargs)"
  [[ -z "$line" ]] && continue

  name="$(echo "$line" | awk '{print $1}')"
  dest="$(echo "$line" | awk '{print $2}')"

  if [[ -z "$name" || -z "$dest" ]]; then
    echo "Přeskakuji neplatný řádek v ${targets_file}: ${line}" >&2
    continue
  fi

  if $dry_run; then
    echo "[dry-run] ${name}: scp ${cart} -> ${dest}"
    continue
  fi

  echo "-> ${name}: nahrávám ${cart} na ${dest} ..."
  scp "${ssh_opts[@]}" "$cart" "$dest" >/tmp/push_to_carts_"${name}".log 2>&1 &
  pids+=("$!")
  names+=("$name")
done < "$targets_file"

$dry_run && exit 0

fail=0
for i in "${!pids[@]}"; do
  if wait "${pids[$i]}"; then
    echo "OK   ${names[$i]}"
  else
    echo "FAIL ${names[$i]} (log: /tmp/push_to_carts_${names[$i]}.log)"
    fail=1
  fi
done

exit $fail
