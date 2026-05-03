# MCP Rules

- Add MCP servers only when they remove a repeated manual loop.
- Prefer remote MCP for SaaS tools with OAuth.
- Prefer local stdio MCP for local tools such as XcodeBuildMCP and Playwright.
- Scope database MCPs by project and use read-only mode by default.
- Keep shared MCP in project config; keep personal credentials in user/local config.

