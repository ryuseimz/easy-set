# Quickstart

この手順は、非エンジニアの起業家が Codex に GitHub / Vercel を連携し、簡単なプロンプトで MVP の実装から公開まで進めるためのものです。

最初に [docs/mindset.md](mindset.md) を読んでください。

## 0. 前提

必要なもの:

- GitHub アカウント
- Vercel アカウント
- Claude Code デスクトップアプリ
- Codex デスクトップアプリ
- Git。ローカル確認や CLI を使う場合
- Node.js 18+。ローカル確認、MCP、CLI を使う場合
- Xcode。iOS/macOS 開発の場合
- ブラウザ。Web/デザイン QA の場合

## 1. Claude Code デスクトップアプリをインストール

公式ページから Claude デスクトップアプリをインストールし、Claude アカウントでサインインします。

- Claude ダウンロード: https://claude.com/download
- Claude Desktop インストール手順: https://support.claude.com/en/articles/10065433-install-claude-desktop

注意: 検索広告や非公式ミラーではなく、必ず公式リンクからダウンロードしてください。

ターミナル確認ができる人だけ、次も確認します。

```bash
claude --version
claude doctor
```

## 2. Codex デスクトップアプリをインストール

公式ページから Codex デスクトップアプリをインストールし、ChatGPT アカウントでサインインします。

- Codex 公式ページ: https://openai.com/codex/
- Codex getting started: https://openai.com/academy/codex-how-to-start/
- ChatGPT desktop app: https://chatgpt.com/features/desktop/

Codex の画面イメージ:

![Codex thread screen](https://images.ctfassets.net/kftzwdyauwt9/5a7uKTozmVeEuSwi3QdWAB/14acd3d814d1a3cf208eb3439d5a84e8/codexthread.png?fm=webp&q=90&w=1600)

![Codex project folder example](https://images.ctfassets.net/kftzwdyauwt9/tX1Csx6I3JfJYeJetPa0t/6e415a6c0efb94cab9ea3cb4395ad7e8/filestructure.png?fm=webp&q=90&w=1600)

## 3. Codex に GitHub / Vercel を連携する

Codex デスクトップアプリから GitHub と Vercel を連携します。

詳しい画面上の操作手順は [docs/codex-connections.md](codex-connections.md) を見てください。

連携するもの:

- GitHub: リポジトリ作成、commit、push、PR/merge のため
- Vercel: デプロイ、preview、production 公開のため

注意:

- 連携画面では、必要な権限だけ許可してください
- 最初の repo は Private 推奨です
- 講座中は本番課金や本番データを扱わないでください

## 4. Codex に MVP 開発をまとめて依頼する

```text
私は非エンジニアの起業家です。
Codex を使って、MVP を作って Vercel に公開したいです。

GitHub と Vercel は連携済みです。
必要なら新しい GitHub リポジトリを作ってください。

作りたいもの:
- 誰向け:
- 解決したい課題:
- 最初に必要な機能:
- 参考サービス:

やってほしいこと:
1. まず企画を短く整理して、確認質問をしてください
2. OK が出たら、最小構成で実装してください
3. ローカルで動かす方法を教えてください
4. GitHub に commit / push してください
5. Vercel にデプロイしてください
6. 最後に公開 URL と確認ポイントを教えてください

制約:
- まず動く MVP を優先してください
- スマホでも見られる画面にしてください
- 課金、本番データ、外部 API キーが必要な実装は避けてください
- 危険な操作や有料設定が必要な場合は、実行前に確認してください
```

## 5. Codex の質問に答える

```text
1. ターゲットユーザーは〇〇です
2. 最初の機能は〇〇だけで大丈夫です
3. デザインはシンプルで OK です
4. まずログインなしで作ってください
```

## 6. ローカル確認、GitHub、Vercel を進めてもらう

```text
続けてください。
ローカル確認、GitHub への push、Vercel デプロイまで順番に進めてください。
私が承認する必要がある操作があれば、その理由を短く説明してください。
```

エラーが出たら:

```text
このエラーが出ました。
原因を説明して、直してください。

エラー内容:
<ここにエラーを貼る>
```

## 7. 環境チェック

```bash
./scripts/check-setup.sh
```

## 8. Claude Code 初回プロンプト

```text
以下の GitHub リポジトリを開発環境セットアップ用の資料として読んでください。

<ここに GitHub リポジトリ URL を貼る>

まず README.md、CLAUDE.md、AGENTS.md、docs/quickstart.md を読んでください。
そのうえで、非エンジニアの起業家が MVP を作り始めるためのセットアップ計画を作ってください。

目的:
- 作りたい MVP:
- 誰向け:
- 使いたいサービス:
- GitHub/Vercel の利用経験:

まだファイル変更、MCP 追加、外部サービス連携はしないでください。
まず不足情報を質問してください。
```

## 9. 上級者向け CLI セットアップ

講座本編ではデスクトップアプリを使います。CLI は上級者向けのおまけです。

MVP 開発を速くするおすすめツールは [docs/recommended-tools.md](recommended-tools.md) にまとめています。

Claude Code CLI:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Codex CLI:

```bash
npm install -g @openai/codex
```

または:

```bash
brew install codex
```

CLI が向いている場面:

- ターミナル中心で開発する
- 複数 worktree や複数 agent を同時に動かす
- CI、自動化、script と組み合わせる
- cmux や Warp などの CLI 作業環境を使いたい

## 10. 自分のプロジェクトへ適用する順番

1. `templates/AGENTS.project.md` を対象 repo の `AGENTS.md` にする
2. `templates/CLAUDE.project.md` を対象 repo の `CLAUDE.md` にする
3. `.claude/rules/` から必要な rule をコピーする
4. `.claude/skills/` から必要な skill をコピーする
5. MCP を user scope と project scope に分けて設定する
6. `scripts/check-setup.sh` 相当の project-specific check を用意する

## 11. 最初に入れる MCP

最小構成:

- Context7: 最新 docs
- GitHub または `gh` CLI: issue/PR/CI
- Playwright: Web UI 確認

iOS:

- XcodeBuildMCP
- Sentry。crash/production triage が必要な場合

Web:

- Figma MCP
- Vercel MCP
- Supabase MCP。dev/read-only/project scoped
- Sentry MCP
- Linear MCP。タスク管理が Linear の場合

## 12. 完了条件

セットアップ完了とは、次が満たされた状態です。

- Claude Code が `CLAUDE.md` と `AGENTS.md` を読める
- Codex が `AGENTS.md` を読める
- secrets deny rules がある
- build/test/lint command が docs に明記されている
- iOS または Web の検証ループが動く
- MCP が必要最小限で接続されている
- production credentials を agent に渡していない
