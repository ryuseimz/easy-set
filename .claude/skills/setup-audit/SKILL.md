---
name: setup-audit
description: Audit a local development environment for Claude Code, Codex, MCP, iOS, Web, and design-to-code readiness.
---

# Setup Audit

Use when a user wants to configure a machine or repository for agentic development.

## Checks

- Claude Code installed and authenticated
- Codex installed and authenticated if needed
- Git clean enough to work
- Node/npm/bun/pnpm as required
- Xcode and command line tools for iOS
- `xcodebuild`, `simctl`, SwiftLint/SwiftFormat when relevant
- Playwright browsers for Web QA
- MCP configuration split between shared project config and personal credentials
- secrets deny rules in place

## Output

Return:

- Ready
- Missing
- Recommended
- Risk
- Next actions

