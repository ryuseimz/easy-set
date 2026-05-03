#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_DIR="${HOME}/.codex"
CODEX_CONFIG="${CODEX_DIR}/config.toml"

say() {
  printf "\n==> %s\n" "$1"
}

ok() {
  printf "ok   %s\n" "$1"
}

miss() {
  printf "miss %s\n" "$1"
}

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

say "Checking local tools"

for cmd in git codex node npm; do
  if has_cmd "$cmd"; then
    ok "$cmd: $("$cmd" --version 2>/dev/null | head -n 1 || true)"
  else
    miss "$cmd"
  fi
done

if has_cmd vercel; then
  ok "vercel: $(vercel --version 2>/dev/null | head -n 1 || true)"
else
  miss "vercel CLI (optional)"
fi

if has_cmd gh; then
  ok "gh: $(gh --version 2>/dev/null | head -n 1 || true)"
else
  miss "GitHub CLI (optional)"
fi

say "Checking course files"

required_files=(
  "COURSE.md"
  "AGENTS.md"
  "CLAUDE.md"
  "templates/mvp-project/AGENTS.md"
  "templates/mvp-project/CLAUDE.md"
  "templates/mvp-project/codex.config.toml"
  "templates/mvp-project/github-ci.yml"
  "templates/mvp-project/pull_request_template.md"
  "templates/mvp-project/REVIEW_PROMPT.md"
  ".agents/plugins/marketplace.json"
  "plugins/mvp-codex-setup/.codex-plugin/plugin.json"
)

for file in "${required_files[@]}"; do
  if [ -f "${ROOT_DIR}/${file}" ]; then
    ok "$file"
  else
    miss "$file"
  fi
done

say "Preparing Codex config suggestion"

mkdir -p "$CODEX_DIR"

cat > "${ROOT_DIR}/codex-mvp-config.suggested.toml" <<'EOF'
# Suggested Codex config for MVP development.
# Review before copying into ~/.codex/config.toml or .codex/config.toml.

model = "gpt-5.5"
reasoning_effort = "medium"
sandbox_mode = "workspace-write"
approval_policy = "on-request"
project_doc_fallback_filenames = ["CLAUDE.md", "README.md", "COURSE.md"]
project_doc_max_bytes = 65536

[sandbox_workspace_write]
network_access = false

# Optional: Vercel MCP.
# Recommended command:
#   codex mcp add vercel --url https://mcp.vercel.com
#
# [mcp_servers.vercel]
# url = "https://mcp.vercel.com"

# Optional: GitHub MCP.
# Do not hardcode tokens. Use an environment variable.
#
# [mcp_servers.github]
# url = "https://api.githubcopilot.com/mcp/"
# bearer_token_env_var = "GITHUB_PAT_TOKEN"
EOF

ok "wrote ${ROOT_DIR}/codex-mvp-config.suggested.toml"

say "Next steps for the AI agent"

cat <<EOF
1. If Codex CLI is installed, run:
     codex

2. To connect Vercel MCP, ask the user for approval, then run:
     codex mcp add vercel --url https://mcp.vercel.com

3. To connect GitHub MCP, ask the user for approval, then run:
     codex mcp add github --url https://api.githubcopilot.com/mcp/

4. If GitHub token is required, do not ask the user to paste it into chat.
   Ask them to create a minimal token and set it as an environment variable:
     export GITHUB_PAT_TOKEN=...

5. For a target MVP repo, copy templates using this mapping:
     templates/mvp-project/AGENTS.md -> AGENTS.md
     templates/mvp-project/CLAUDE.md -> CLAUDE.md
     templates/mvp-project/codex.config.toml -> .codex/config.toml
     templates/mvp-project/github-ci.yml -> .github/workflows/mvp-checks.yml
     templates/mvp-project/pull_request_template.md -> .github/pull_request_template.md
     templates/mvp-project/REVIEW_PROMPT.md -> REVIEW_PROMPT.md

6. Stop before deploy, push, public repo changes, paid features, production data, or API keys.
EOF

say "Done"
