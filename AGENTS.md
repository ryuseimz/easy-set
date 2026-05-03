# Agent Instructions

このファイルは Claude Code、Codex、その他 coding agent が共通で読む作業規約です。

## Core Workflow

すべての中〜大規模作業は次の順で進めます。

1. Research: 関連 docs、コード、設定、制約を読む
2. Plan: 変更方針、影響範囲、検証方法を決める
3. Execute: 小さく実装する
4. Review: diff、リスク、テスト不足を確認する
5. Ship: lint/test/build、PR、残リスクをまとめる

小さな typo、単一行の修正、明確な設定変更は Plan を省略してよいです。

## Verification First

実装タスクでは、完了条件を必ず確認してください。

- Web: lint、typecheck、unit test、Playwright/ブラウザ確認、スクリーンショット比較
- iOS: `xcodebuild` build/test、Simulator 起動、スクリーンショット、UI 操作確認
- API/DB: focused tests、migration dry run、read-only inspection
- Design: Figma/スクショとの差分、responsive、accessibility、loading/empty/error state

検証できない変更は「未検証」と明記してください。

## Context Management

- unrelated task ごとに新しい session/thread を使う
- 大きな探索は subagent に任せ、main context を汚しすぎない
- 2 回以上同じ問題で修正に失敗したら、いったん整理して新しい plan を作る
- 長い常時ルールは避け、必要なら skills/rules/docs に分ける

## Safety

- secrets、tokens、cookies、authorization headers、service-role keys を出力しない
- `.env*`、`secrets/**`、credentials、production dumps は読まない
- production DB には原則接続しない
- Supabase などの MCP は development project、read-only、project scoped を基本にする
- destructive commands、broad database writes、credential rotation は明示承認なしに実行しない

## MCP Policy

MCP は「外部状態」「最新情報」「専用 tool が必要な操作」に限定します。

Recommended starting set:

- Figma MCP: design context
- Context7: latest library docs
- Playwright MCP or Playwright CLI: browser verification
- XcodeBuildMCP: iOS/macOS build, test, simulator
- Vercel MCP: deploy/log/project context
- Supabase MCP: dev DB schema/docs/logs
- GitHub MCP or `gh` CLI: PR, issue, CI
- Sentry MCP or `sentry-cli`: runtime errors
- Linear MCP: product issues/tasks

高頻度で schema が大きい MCP は、CLI + skill の方が token 効率がよい場合があります。

## Git

- unrelated user changes を戻さない
- 変更前に `git status` を確認する
- 大きな作業は branch/worktree を使う
- commit 前に relevant checks を実行する

## Documentation

この repo をテンプレートとして使う場合、プロジェクト固有の情報は次に書きます。

- `CLAUDE.md`: Claude Code 固有の入口
- `AGENTS.md`: agent 共通ルール
- `.claude/rules/*.md`: 領域別ルール
- `.claude/skills/*/SKILL.md`: 再利用ワークフロー
- `.mcp.json`: 共有 MCP
- `.codex/config.toml`: Codex 設定

