# Codex / Claude Code で MVP を作る講座

非エンジニアの起業家が、Codex と Claude Code を使って MVP 開発に着手し、GitHub と Vercel で公開するための講座資料です。

## まず持つべきマインドセット

- 全部 AI に聞く。全部 AI にやらせる。
- とにかく最新情報をリサーチする。AI 驚き屋の情報は玉石混交なので、自分で触ってみたり、仲間と情報共有するしかない。
- エンジニアにしかできないと思わない。

## 講座の全体像

本編はこの流れです。

1. Claude Code デスクトップアプリをインストールする
2. Codex デスクトップアプリをインストールする
3. Codex に下記のプロンプトを投げる
4. おすすめツールを紹介する
5. 上級者向けに Claude Code、CLI、Warp、MCP を紹介する

## 1. Claude Code デスクトップアプリをインストールする

下記のリンクからダウンロードしてください。

- Claude ダウンロード: https://claude.com/download
- Claude Desktop インストール手順: https://support.claude.com/en/articles/10065433-install-claude-desktop

## 2. Codex デスクトップアプリをインストールする

下記のリンクからダウンロードしてください。

- Codex 公式ページ: https://openai.com/codex/
- Codex getting started: https://openai.com/academy/codex-how-to-start/
- ChatGPT desktop app: https://chatgpt.com/features/desktop/

## 3. Codex に下記のプロンプトを投げる

Codex デスクトップアプリで、このリポジトリを開いて下記のプロンプトを投げます。

```text
この GitHub リポジトリを clone して、Codex のセットアップを進めたいです。

https://github.com/ryuseimz/easy-set

まず START_HERE.md、COURSE.md、AGENTS.md、CLAUDE.md を読んでください。

やってほしいこと:
1. 私の環境で足りないものを確認してください
2. scripts/setup-codex-mvp.sh を使ってセットアップを進めてください
3. GitHub / Vercel のログインや認証が必要なところだけ、私に操作を依頼してください
4. GitHub / Vercel plugin または MCP を使える状態にしてください
5. 対象の MVP リポジトリに templates/mvp-project/ の設定を入れる準備をしてください
6. コード開発後に review / lint / typecheck / test / build / Vercel deploy 確認が回るようにしてください

危険な操作、課金、本番データ、外部 API key、public repository 化、production deploy は、実行前に必ず確認してください。

まず現在の環境確認から始めてください。
```

## 4. おすすめツール

講座本編では Codex デスクトップアプリ、GitHub、Vercel があれば十分です。

ここでは、MVP 開発をさらに速く進めたい人向けのおすすめツールを紹介します。

### Typeless or Aqua Voice

音声入力ツールです。非エンジニアの起業家にはかなり相性が良いです。

- Typeless: https://www.typeless.com/
- Aqua Voice: https://aquavoice.com/

使いどころ:

- Codex へのプロンプトを声で作る
- 企画メモを一気に書く
- エラー状況や改善要望を自然文で説明する
- 長い仕様をキーボードで打たずに作る

講座での紹介文:

```text
プロンプトを毎回キーボードで丁寧に書く必要はありません。
Typeless や Aqua Voice のような音声入力を使うと、
自分の考えを話すだけで Codex に渡せる文章になります。
非エンジニアが MVP を作るなら、実はコードを書く力より「考えを素早く言語化する力」の方が大事です。
```

おすすめプロンプト例:

```text
今から話す内容を、Codex に渡す MVP 開発プロンプトとして整理してください。
ターゲット、課題、最初の機能、作らないもの、確認質問に分けてください。
```

### CleanShot X

スクリーンショット、注釈、画面録画のための Mac アプリです。

- CleanShot X: https://cleanshot.com/

使いどころ:

- エラー画面を撮って Codex に見せる
- UI の崩れをスクショで伝える
- Vercel に公開した画面を記録する
- 画面録画で「ここがうまく動かない」を説明する
- 注釈や矢印を付けて、修正してほしい場所を伝える

講座での紹介文:

```text
非エンジニアが AI に開発を頼むとき、スクショは最強の説明手段です。
「この赤枠の部分が変」「このボタンを押すと落ちる」のように、
CleanShot X で撮ってそのまま Codex に見せると、説明が一気に楽になります。
```

### cmux

複数の coding agent やターミナル作業を並行して見たい人向けのターミナルアプリです。

- cmux: https://cmux.com/
- docs: https://www.cmux.dev/docs/getting-started

使いどころ:

- 複数の Codex / Claude Code / CLI agent を並行して動かす
- 実装、レビュー、テストを別 pane で進める
- agent が入力待ちになったタイミングに気づく
- terminal と browser を並べて確認する

講座での紹介文:

```text
cmux は上級者向けです。
最初は Codex デスクトップアプリだけで十分ですが、
慣れてきて複数の agent や複数の作業を同時に進めたいときに便利です。
```

## 5. 上級者向け: CLI / Warp / MCP

講座本編はデスクトップアプリで十分です。

最後に、上級者向けの拡張として CLI 周りを紹介します。

### Claude Code CLI

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

確認:

```bash
claude --version
claude doctor
```

### Codex CLI

```bash
npm install -g @openai/codex
```

または:

```bash
brew install codex
```

`sudo npm install -g` は避けてください。権限問題とセキュリティリスクの原因になります。

CLI が向いている場面:

- ターミナル中心で開発する
- 複数 worktree や複数 agent を同時に動かす
- CI、自動化、script と組み合わせる
- cmux や Warp などの CLI 作業環境を使いたい

### Warp

Warp は command history、AI 補助、terminal workflow を整理したい人向けです。

初学者はまずデスクトップアプリで「頼む、答える、確認する」を覚えれば十分です。

### MCP

MCP は、Codex / Claude を外部ツールと接続する仕組みです。

代表例:

- Figma: デザイン情報を読む
- Playwright: ブラウザ操作と UI 確認
- Vercel: deployment / logs / project context
- Supabase: dev DB schema / docs / logs
- GitHub: PR / issue / CI
- Sentry: runtime errors
- Linear: product tickets

MCP は便利ですが、権限設計が重要です。

最初は少数から始め、production data や有料操作にはつながないでください。

## 6. 公式・一次情報リンク

- Claude Code docs: https://code.claude.com/docs
- Claude Code MCP: https://code.claude.com/docs/en/mcp
- Claude Code best practices: https://code.claude.com/docs/en/best-practices
- OpenAI Codex docs: https://developers.openai.com/codex
- Codex best practices: https://developers.openai.com/codex/learn/best-practices
- Codex AGENTS.md: https://developers.openai.com/codex/guides/agents-md
- Codex getting started: https://openai.com/academy/codex-how-to-start/
- MCP official docs: https://modelcontextprotocol.io/docs/getting-started/intro
- Figma MCP: https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server
- XcodeBuildMCP: https://www.xcodebuildmcp.com/
- Playwright MCP: https://github.com/microsoft/playwright-mcp
- Supabase MCP: https://supabase.com/docs/guides/getting-started/mcp
- GitHub MCP: https://github.com/github/github-mcp-server
