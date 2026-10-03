#!/usr/bin/env bash
set -euo pipefail

: "${PVE_HOST:?Set PVE_HOST}"
: "${CORE_HOST:?Set CORE_HOST}"
: "${CONTROLLER_HOST:?Set CONTROLLER_HOST}"

fails=0

probe() {
  local label="$1" host="$2" port="$3" expected="$4"
  local actual="closed"

  if timeout 2 bash -c "echo >/dev/tcp/$host/$port" >/dev/null 2>&1; then
    actual="open"
  fi

  if [[ "$actual" == "$expected" ]]; then
    printf 'PASS %-30s %s\n' "$label" "$actual"
  else
    printf 'FAIL %-30s expected=%s actual=%s\n' "$label" "$expected" "$actual"
    fails=$((fails+1))
  fi
}

probe "Hypervisor SSH"       "$PVE_HOST"        22   open
probe "Hypervisor web UI"    "$PVE_HOST"        8006 open
probe "Hypervisor rpcbind"   "$PVE_HOST"        111  closed

probe "Core SSH"             "$CORE_HOST"       22   open
probe "Source-control SSH"   "$CORE_HOST"       2222 open
probe "Source-control web"   "$CORE_HOST"       3000 open
probe "Management HTTPS"     "$CORE_HOST"       9443 open
probe "Database LAN access"  "$CORE_HOST"       5432 closed

probe "Controller SSH"       "$CONTROLLER_HOST" 22   open
probe "Controller rpcbind"   "$CONTROLLER_HOST" 111  closed

printf 'SUMMARY failures=%d\n' "$fails"
[[ "$fails" -eq 0 ]]