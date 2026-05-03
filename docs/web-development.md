# Web Development

## Recommended Stack

- Claude Code or Codex
- Context7 for current docs
- Playwright CLI or Playwright MCP
- Figma MCP
- Vercel MCP
- Supabase MCP for dev database projects
- Sentry MCP
- GitHub CLI or GitHub MCP
- Linear MCP when product work starts from tickets

## Browser Verification

Use Playwright for:

- route smoke tests
- screenshot comparison
- accessibility tree inspection
- regression tests
- reproducing user flows

Use MCP for exploratory browser control. Use CLI + skills for repeated deterministic checks.

## Vercel

Use Vercel MCP for:

- deployment lookup
- build logs
- project metadata
- preview URL verification

Setup:

```bash
claude mcp add --transport http vercel https://mcp.vercel.com
codex mcp add vercel --url https://mcp.vercel.com
```

## Supabase

Use only development or branch databases by default.

Recommended:

```text
https://mcp.supabase.com/mcp?project_ref=<project_ref>&read_only=true&features=database,docs
```

Do not connect production unless the workflow is read-only, scoped, and approved.

## Web Project Checklist

Put these in `AGENTS.md`:

- install command
- dev command
- lint command
- typecheck command
- unit test command
- e2e command
- build command
- routes and app structure
- component library
- styling system
- design tokens
- auth model
- database/project scope

