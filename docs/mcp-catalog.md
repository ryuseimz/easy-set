# MCP Catalog

MCP connects agents to tools, data, and workflows. Use it when context lives outside the repository or changes frequently.

## Selection Rules

- Start with 3 to 5 MCP servers.
- Prefer official servers for SaaS tools.
- Prefer read-only and project-scoped settings.
- Avoid production data unless there is a clear approval process.
- Use CLI + skill when MCP schemas are too large or repeated calls are cheaper as shell commands.

## Recommended MCPs

| MCP | Best For | Scope | Notes |
| --- | --- | --- | --- |
| Figma | Design context, variables, components, Code Connect | project/user | Remote server preferred |
| Context7 | Current docs for fast-moving libraries | user/project | MCP or CLI + skill |
| Playwright | Browser automation and UI exploration | project | CLI + skill can be more token efficient |
| XcodeBuildMCP | iOS/macOS build, test, simulator, screenshots | project | Essential for serious iOS agent loops |
| Vercel | Deployments, logs, project context | project/user | Use OAuth |
| Supabase | Dev DB schema, logs, docs, generated types | project | Use `read_only=true` and `project_ref` |
| GitHub | PRs, issues, Actions, code security | user/project | Consider `gh` CLI for common tasks |
| Sentry | Runtime errors, stack traces, releases | project/user | Great for production debugging |
| Linear | Product tickets and planning | user/project | Useful for issue-driven teams |

## Claude Code Examples

```bash
claude mcp add --transport http vercel https://mcp.vercel.com
claude mcp add --transport http linear-server https://mcp.linear.app/mcp
claude mcp add playwright npx @playwright/mcp@latest
claude mcp add --transport stdio xcodebuildmcp -- npx -y xcodebuildmcp@latest mcp
```

## Codex Examples

```bash
codex mcp add vercel --url https://mcp.vercel.com
codex mcp add playwright npx "@playwright/mcp@latest"
codex mcp add context7 -- npx -y @upstash/context7-mcp
```

## Supabase Safe URL Pattern

```text
https://mcp.supabase.com/mcp?project_ref=<project_ref>&read_only=true&features=database,docs
```

## When Not To Use MCP

- The agent can read local files directly.
- A simple CLI command is clearer and cheaper.
- The tool requires broad production permissions.
- The MCP server is unofficial and not reviewed.
- The task is one-off and copy/paste is safer.

