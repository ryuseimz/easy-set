---
name: mvp-codex-setup
description: Use when a non-engineer founder wants to set up Codex for MVP development with GitHub, Vercel, project rules, review checks, and safe deployment workflow.
---

# MVP Codex Setup

Use this skill when the user says they want to use this course repository to set up Codex, GitHub, Vercel, and review workflow for an MVP project.

## What To Read

Read these files from the course repo:

1. `COURSE.md`
2. `templates/mvp-project/AGENTS.md`
3. `templates/mvp-project/CLAUDE.md`
4. `templates/mvp-project/codex.config.toml`
5. `templates/mvp-project/github-ci.yml`
6. `templates/mvp-project/pull_request_template.md`
7. `templates/mvp-project/REVIEW_PROMPT.md`

## Goal

Set up the user's target MVP repository so Codex can:

- clarify the MVP idea
- implement the smallest useful version
- run local checks
- review changes
- commit and push to GitHub
- deploy to Vercel
- stop before risky actions

## Setup Flow

1. Ask for the target MVP repository URL or local path.
2. Ask whether GitHub and Vercel are already connected in Codex.
3. If not connected, guide the user to connect them through the Codex app UI.
4. If the user prefers terminal setup, suggest:

```bash
codex mcp add vercel --url https://mcp.vercel.com
```

```bash
codex mcp add github --url https://api.githubcopilot.com/mcp/
```

5. Do not ask the user to paste secrets or tokens.
6. Propose copying the templates into the target MVP repo.
7. Wait for approval before writing files.

## Template Mapping

Use these mappings:

| Course repo file | Target MVP repo path |
| --- | --- |
| `templates/mvp-project/AGENTS.md` | `AGENTS.md` |
| `templates/mvp-project/CLAUDE.md` | `CLAUDE.md` |
| `templates/mvp-project/codex.config.toml` | `.codex/config.toml` |
| `templates/mvp-project/github-ci.yml` | `.github/workflows/mvp-checks.yml` |
| `templates/mvp-project/pull_request_template.md` | `.github/pull_request_template.md` |
| `templates/mvp-project/REVIEW_PROMPT.md` | `REVIEW_PROMPT.md` |

## Safety

Always stop before:

- making a public repository
- enabling paid features
- adding external API keys
- connecting production databases
- deploying production with sensitive data
- printing tokens, cookies, `.env`, or private keys

## Expected Handoff

Return:

- GitHub/Vercel connection status
- files to add or update
- review and verification flow
- commands to run
- next MVP development prompt
