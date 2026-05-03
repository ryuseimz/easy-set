#!/usr/bin/env bash
set -euo pipefail

check() {
  local name="$1"
  local cmd="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "ok   %-18s %s\n" "$name" "$("$cmd" --version 2>/dev/null | head -n 1 || true)"
  else
    printf "miss %-18s install or configure %s\n" "$name" "$cmd"
  fi
}

echo "Agentic development setup check"
echo

check "git" "git"
check "claude" "claude"
check "codex" "codex"
check "node" "node"
check "npm" "npm"
check "rg" "rg"

if command -v xcodebuild >/dev/null 2>&1; then
  printf "ok   %-18s %s\n" "xcodebuild" "$(xcodebuild -version | tr '\n' ' ')"
else
  printf "miss %-18s install Xcode for iOS/macOS development\n" "xcodebuild"
fi

if command -v xcrun >/dev/null 2>&1; then
  printf "ok   %-18s available\n" "simctl"
else
  printf "miss %-18s install Xcode command line tools\n" "simctl"
fi

echo
echo "Recommended next step:"
echo "  claude"
echo "  Then ask Claude to read README.md, CLAUDE.md, AGENTS.md, and docs/quickstart.md."

