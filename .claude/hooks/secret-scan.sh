#!/usr/bin/env bash
set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  exit 0
fi

if git diff --cached --name-only >/dev/null 2>&1; then
  target="HEAD"
else
  target=""
fi

patterns='(sk-[A-Za-z0-9_-]{20,}|ANTHROPIC_API_KEY|OPENAI_API_KEY|SUPABASE_SERVICE_ROLE|BEGIN PRIVATE KEY|Authorization: Bearer)'

if git diff ${target:+$target} -- . ':!*.md' | grep -E "$patterns" >/dev/null 2>&1; then
  echo "Potential secret detected in diff. Review before continuing." >&2
  exit 2
fi

exit 0

