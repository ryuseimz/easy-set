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
5. 開発の大まかな流れを紹介する
6. 上級者向けに Claude Code、CLI、Warp、MCP を紹介する

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

### cmux

複数の coding agent やターミナル作業を並行して見たい人向けのターミナルアプリです。

- cmux: https://cmux.com/
- docs: https://www.cmux.dev/docs/getting-started

使いどころ:

- 複数の Codex / Claude Code / CLI agent を並行して動かす
- 実装、レビュー、テストを別 pane で進める
- agent が入力待ちになったタイミングに気づく
- terminal と browser を並べて確認する

## 5. 開発の大まかな流れ

インストールの説明が終わったら、Codex を使って何かしらのプロダクトを作り、Vercel にデプロイするところまでを実演します。

いきなりコードを書かせるのではなく、次の順番で進めると成功しやすいです。

### 5.0. Codex の使い方

まずは Codex の基本的な使い方を押さえます。

- プロジェクトは、いわゆるフォルダのようなものです。開発するサービスごとに分けましょう。
- 僕はフルアクセスを使っています。
- 音声入力をガンガン使いましょう。
- model は 5.5-high を使いましょう。

魔法の言葉:

- 作業を始める時: main をプルして
- 作業を反映させたい時: PR 作ってマージして
- 作ったものをネット上に反映させたい時: Vercel でデプロイして

### 5.1. アイデアを AI と壁打ちする

まず、作りたいプロダクトのアイデアを AI に理解してもらいます。

この段階では、きれいな仕様書を作る必要はありません。AI と会話しながら、最低限これらを整理します。

- 誰のためのプロダクトか
- どんな課題を解決するのか
- 既存の代替手段は何か
- 最初に検証したい仮説は何か
- MVP で作るもの / 作らないものは何か

### 5.2. プロダクトのデザインを決める

次に、プロダクトの見た目の方向性を決めます。

Figma を細かく作り込む前に、まずは GPT にデザインボードを作らせて、世界観を固めるのがおすすめです。

参考:

- https://x.com/mmmiyama_D/status/2049103907457278056

GPT に投げるプロンプト例:

```text
Create a premium design system board for a fictional Japanese web design studio based on this theme

[THEME]

ここに「遊び心のあるPOPなデザイン、ミヤマ クリエイティブ」みたいにテーマを入れてください。

One large smartphone mockup must be placed at the exact center as the main visual. Arrange desktop UI and design system modules around the phone. Include hero section, palette, typography, cards, buttons, inputs, icons, chips, and footer. Make it a polished Figma showcase board with rounded panels, clean spacing, elegant whitespace, modern Japanese taste, and readable Japanese labels. Do not make it a numbered spec sheet or plain grid.

Aspect ratio 4:5
```

テーマ例:

```text
個人起業家向けの、信頼感がありつつ親しみやすい、明るい SaaS ダッシュボード
```

作ったデザイン画像は、Codex に渡して「この雰囲気で UI を作って」と依頼します。

### 5.3. デザインをもとに、一度見た目を開発してもらう

最初から完璧な機能を作るのではなく、まずは見た目だけを作ります。

この段階の目的は、プロダクトの雰囲気、画面構成、スマホ表示を確認することです。

Codex への依頼例:

```text
このデザイン画像の雰囲気をもとに、Next.js でトップ画面を作ってください。

まだバックエンド、ログイン、DB は不要です。
まずは見た目と主要な画面構成を確認したいです。

スマホ表示も崩れないようにしてください。
```

### 5.4. ユーザージャーニーを AI と一緒に作り込む

見た目の方向性が決まったら、ユーザーがどの順番でプロダクトを使うのかを整理します。

このとき、参考になる競合プロダクトを自分でも触りながら、AI と議論します。

確認するポイント:

- 最初にユーザーは何を見るのか
- どこで価値を感じるのか
- 入力が面倒な箇所はどこか
- 離脱しそうなポイントはどこか
- 最初の成功体験は何か
- MVP ではどの画面まで必要か

Codex への依頼例:

```text
このプロダクトのユーザージャーニーを一緒に整理してください。

対象ユーザー:
[ここに対象ユーザーを書く]

解決したい課題:
[ここに課題を書く]

参考にしたい競合:
[ここに競合サービス名や URL を書く]

まず、初回訪問から価値を感じるまでの流れをステップごとに整理してください。
その上で、MVP で必要な画面、不要な画面、後回しにする機能を分けてください。
```

### 5.5. 開発計画を立てて、Codex に最後まで開発させる

ユーザージャーニーが決まったら、Codex に開発計画を作ってもらいます。

いきなり実装させるのではなく、まず次を整理してもらいます。

- 画面一覧
- 必要なコンポーネント
- 状態管理
- 保存方法
- 実装順序
- 動作確認方法
- Vercel デプロイ時の注意点

Codex への依頼例:

```text
ここまで整理した内容をもとに、MVP の開発計画を作ってください。

含めてほしいもの:
- 画面一覧
- ユーザーフロー
- 実装する機能
- 今回は実装しない機能
- ファイル構成
- 実装順序
- 動作確認方法
- Vercel にデプロイするまでの手順

計画を出したあと、私が OK したら実装に進んでください。
```

### 5.6. ローカルで動作確認する

実装が終わったら、ローカルで起動して確認します。

確認すること:

- 画面が表示されるか
- 主要な操作ができるか
- スマホ表示で崩れていないか
- エラーが出ていないか
- README の起動手順が正しいか

Codex への依頼例:

```text
ローカルで動作確認してください。

このプロジェクトに存在する lint / typecheck / test / build を実行し、開発サーバーを起動してください。
ブラウザで主要な画面とスマホ表示を確認し、問題があれば修正してください。
```

### 5.7. GitHub にリポジトリを作成して push する

ローカルで確認できたら、GitHub にリポジトリを作成して push します。

最初は Private repository 推奨です。

push 前に Codex に差分レビューを依頼します。

Codex への依頼例:

```text
GitHub に新しい private repository を作成して、このプロジェクトを push する準備をしてください。

push 前に差分をレビューし、secrets や不要なファイルが含まれていないか確認してください。
GitHub の認証やブラウザ操作が必要なところだけ、私に操作を依頼してください。
```

### 5.8. Vercel にデプロイする

最後に Vercel に接続してデプロイします。

デプロイ後は、公開 URL を開いて主要な操作を確認します。

確認できたら、Codex に次をまとめてもらいます。

- 公開 URL
- 実装した機能
- 未実装の機能
- 次に改善するなら何をするか

Codex への依頼例:

```text
Vercel にデプロイしてください。

production deploy や課金が発生する操作の前には必ず確認してください。
デプロイ後、公開 URL を開いて主要な操作を確認し、実装した機能、未実装の機能、次に改善することをまとめてください。
```

## 6. 上級者向け: CLI / Warp / MCP

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

## 7. 公式・一次情報リンク

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
