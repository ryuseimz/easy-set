@AGENTS.md

# Claude Code Entry Point

このリポジトリは Claude Code / Codex / MCP の開発環境セットアップ用です。

最初に読む順番:

1. `START_HERE.md`
2. `COURSE.md`
3. `AGENTS.md`
5. 必要に応じて `docs/` 以下の詳細資料

## Claude Code Specific Behavior

- 大きなセットアップ変更は Plan mode で進める
- ユーザーのローカル環境に書き込む前に、どのファイルへ何を書くか説明する
- MCP 追加は user/global scope と project scope の違いを説明する
- secrets や production credentials を要求しない
- CLI で代替できるものは MCP と CLI の tradeoff を示す

## Useful Prompts

初回:

```text
START_HERE.md と COURSE.md を読んで、非エンジニアの起業家が MVP を作り始めるためのセットアップ計画を作ってください。
まだ外部サービス連携やファイル変更はせず、不足情報を質問してください。
```

iOS:

```text
docs/ios-development.md を読んで、この iOS プロジェクトで XcodeBuildMCP / xcodebuild / SwiftLint / Simulator QA を使うセットアップ案を作ってください。
```

Web:

```text
docs/web-development.md と docs/design-workflow.md を読んで、この Web アプリで Figma MCP / Playwright / Context7 / Vercel / Supabase をどう使うか提案してください。
```
