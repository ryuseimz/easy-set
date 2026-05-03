# Claude Code Setup

## Install

Recommended native installer:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Homebrew:

```bash
brew install --cask claude-code
```

npm:

```bash
npm install -g @anthropic-ai/claude-code
```

Avoid `sudo npm install -g`.

## Verify

```bash
claude --version
claude doctor
```

## First Run

```bash
claude
```

Login in the browser when prompted.

## Recommended Project Files

- `CLAUDE.md`: Claude Code entry point
- `AGENTS.md`: shared agent instructions
- `.claude/settings.json`: permissions, deny list, hooks
- `.claude/rules/*.md`: scoped rules
- `.claude/skills/*/SKILL.md`: reusable workflows
- `.mcp.json`: shared MCP server config

## Permission Strategy

Start conservative:

- Ask before writes and shell commands
- Deny secrets and build artifacts
- Allow repeat-safe commands after observing real usage
- Use auto mode only after repository rules and verification are solid

## MCP Strategy

Use:

```bash
claude mcp add --transport http <name> <url>
```

or project-scoped `.mcp.json` for shared team tools.

Keep credentials in user/local config, not committed files.

