# OpenAI Codex Setup

Codex can run as App, IDE extension, CLI, or Cloud. This repo focuses on CLI/App-compatible project setup.

## Install CLI

```bash
npm install -g @openai/codex
```

or:

```bash
brew install codex
```

## Start

```bash
codex
```

Sign in with ChatGPT account or OpenAI API key.

## Project Instructions

Codex reads `AGENTS.md`.

Recommended layers:

- `~/.codex/AGENTS.md`: personal global defaults
- `AGENTS.md`: project team rules
- nested `AGENTS.md` or `AGENTS.override.md`: local subproject rules

## Config

Personal defaults:

```text
~/.codex/config.toml
```

Project-specific settings:

```text
.codex/config.toml
```

Recommended defaults:

```toml
reasoning_effort = "medium"
sandbox_mode = "workspace-write"
approval_policy = "on-request"
```

Start with tighter sandbox/approvals. Loosen only for trusted repos and repeatable workflows.

## MCP

Example:

```bash
codex mcp add context7 -- npx -y @upstash/context7-mcp
codex mcp add playwright npx "@playwright/mcp@latest"
codex mcp add vercel --url https://mcp.vercel.com
```

Use `.codex/config.toml` only in trusted projects.

