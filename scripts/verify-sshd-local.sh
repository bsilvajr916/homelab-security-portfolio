#!/usr/bin/env bash
set -euo pipefail

effective="$(sshd -T 2>/dev/null)"

check() {
  local setting="$1" expected="$2"
  if grep -q "^$setting $expected$" <<<"$effective"; then
    printf 'PASS %-28s %s\n' "$setting" "$expected"
  else
    printf 'FAIL %-28s expected %s\n' "$setting" "$expected"
    return 1
  fi
}

fails=0
check pubkeyauthentication yes || fails=$((fails+1))
check passwordauthentication no || fails=$((fails+1))
check kbdinteractiveauthentication no || fails=$((fails+1))
check permitrootlogin prohibit-password || fails=$((fails+1))
check x11forwarding no || fails=$((fails+1))
check maxauthtries 3 || fails=$((fails+1))

printf 'SUMMARY failures=%d\n' "$fails"
[[ "$fails" -eq 0 ]]