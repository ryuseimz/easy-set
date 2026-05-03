# 受講生が最初に投げるプロンプト

Codex または Claude Code に、このリポジトリの GitHub URL と一緒に投げてください。

```text
以下の GitHub リポジトリを読んで、私の Codex 開発環境をセットアップしてください。

<ここに講座リポジトリの GitHub URL を貼る>

私は非エンジニアの起業家です。
Codex を使って MVP を開発し、GitHub と Vercel で公開したいです。

まず START_HERE.md、COURSE.md、AGENTS.md、CLAUDE.md、SETUP_PROMPT.md を読んでください。
この repo に `MVP Codex Setup` plugin が表示される場合は、それを使って進めてください。

目的:
- Codex から GitHub と Vercel を使えるようにしたい
- MVP の企画、実装、ローカル確認、GitHub push、Vercel deploy まで進めたい
- コードを書いたら、必ずレビュー、検証、修正提案まで回るようにしたい
- 危険な操作、課金、本番データ、外部 API key が必要な場合は実行前に止めてほしい

やってほしいこと:
1. 私の環境で必要なセットアップ項目を洗い出してください
2. GitHub / Vercel plugin または MCP の導入方法を案内してください
3. 対象 MVP リポジトリに追加すべき AGENTS.md / CLAUDE.md / Codex config / GitHub Actions を提案してください
4. templates/mvp-project/ の内容を参考に、実際のプロジェクト用に調整してください
5. 実装後に review / lint / typecheck / test / build / Vercel deploy 確認が回る運用ルールを作ってください
6. 最後に、私が次に Codex へ投げる MVP 開発プロンプトを作ってください

まだファイル変更、外部連携、deploy、push はしないでください。
まず不足情報を質問してください。
```

## 期待する返答

AI からは、だいたい次の内容が返ってくれば OK です。

- 必要なアカウント: ChatGPT / Claude / GitHub / Vercel
- GitHub / Vercel の連携方法
- Codex MCP またはアプリ連携の選択肢
- 対象 MVP repo に追加するファイル一覧
- `AGENTS.md` の開発ルール
- `CLAUDE.md` の Claude Code 用ルール
- `.codex/config.toml` の例
- GitHub Actions の review / build workflow
- Vercel deploy の確認手順
- MVP 開発を始めるための次のプロンプト

## テンプレート配置先

AI が対象 MVP リポジトリに設定を追加する場合は、次の対応で使います。

| この講座 repo のファイル | 対象 MVP repo の配置先 |
| --- | --- |
| `templates/mvp-project/AGENTS.md` | `AGENTS.md` |
| `templates/mvp-project/CLAUDE.md` | `CLAUDE.md` |
| `templates/mvp-project/codex.config.toml` | `.codex/config.toml` |
| `templates/mvp-project/github-ci.yml` | `.github/workflows/mvp-checks.yml` |
| `templates/mvp-project/pull_request_template.md` | `.github/pull_request_template.md` |
| `templates/mvp-project/REVIEW_PROMPT.md` | `REVIEW_PROMPT.md` |

まずは対象 repo にこれらを追加する計画を出してもらい、受講生が OK したら反映します。
