# iOS Development

## Recommended Stack

- Xcode 26.3+
- Claude Code or Codex
- XcodeBuildMCP
- `xcodebuild`
- SwiftLint / SwiftFormat
- Sentry for crash triage
- GitHub CLI or GitHub MCP
- Figma MCP for design handoff

## Xcode Agentic Coding

Xcode 26.3 exposes more Xcode capabilities to agents and supports Claude Agent, Codex, and MCP-compatible tools. Use it for:

- Apple docs search
- file graph exploration
- project settings inspection
- Xcode Preview capture
- build/fix iteration

## XcodeBuildMCP

Use XcodeBuildMCP when the agent needs to:

- build and test
- run Simulator
- capture screenshots
- interact with UI
- inspect logs
- debug with LLDB
- test on physical devices

Example MCP:

```json
{
  "mcpServers": {
    "XcodeBuildMCP": {
      "command": "npx",
      "args": ["-y", "xcodebuildmcp@latest", "mcp"]
    }
  }
}
```

Project config example:

```yaml
schemaVersion: 1
enabledWorkflows:
  - simulator
  - ui-automation
  - debugging
sessionDefaults:
  scheme: MyApp
  projectPath: ./MyApp.xcodeproj
  simulatorName: iPhone 16
```

## `CLAUDE.md` / `AGENTS.md` Checklist

Include:

- Xcode project or workspace path
- scheme
- destination
- minimum iOS
- package manager
- Swift version
- architecture notes
- test command
- lint/format command
- simulator QA flow
- signing/provisioning rules

## Standard Prompt

```text
この iOS プロジェクトを調査してください。
scheme、workspace/project、test command、Simulator 検証方法を特定し、
XcodeBuildMCP を使うセットアップ案を作ってください。
署名、entitlements、bundle id、release lane は変更しないでください。
```

## Verification

```bash
xcodebuild -list
xcodebuild test -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 16'
```

If UI changed, launch in Simulator and capture screenshots.

