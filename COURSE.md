# Codex / Claude Code で MVP を作る講座

非エンジニアの起業家が、Codex と Claude Code を使って MVP 開発に着手し、GitHub と Vercel で公開するための講座資料です。

## この講座のゴール

この講座では、受講者が次の状態になることを目指します。

- Codex デスクトップアプリを使える
- Claude Code デスクトップアプリを使える
- Codex に GitHub / Vercel を連携できる
- Codex に短いプロンプトで MVP 開発を依頼できる
- Codex の質問に答えながら、企画、実装、確認、GitHub、Vercel 公開まで進められる
- エラーや画面崩れを AI に伝えて直せる
- 最新情報を自分で調べ、仲間と共有する姿勢を持てる

## まず持つべきマインドセット

- 全部 AI に聞く。全部 AI にやらせる。
- とにかく最新情報をリサーチする。AI 驚き屋の情報は玉石混交なので、自分で触ってみたり、仲間と情報共有するしかない。
- エンジニアにしかできないと思わない。

## 講座の全体像

本編はこの流れです。

1. Claude Code デスクトップアプリをインストールする
2. Codex デスクトップアプリをインストールする
3. Codex に GitHub アカウントを連携する
4. Codex に Vercel アカウントを連携する
5. Codex に MVP 開発を依頼する
6. Codex が企画、実装、ローカル確認、GitHub push、Vercel deploy を進める
7. 受講者は許可画面、確認事項、デプロイ URL をチェックする
8. おすすめツールを紹介する
9. 上級者向けに Claude Code、CLI、Warp、MCP を紹介する

## 1. Claude Code デスクトップアプリをインストールする

下記のリンクからダウンロードしてください。

- Claude ダウンロード: https://claude.com/download
- Claude Desktop インストール手順: https://support.claude.com/en/articles/10065433-install-claude-desktop

## 2. Codex デスクトップアプリをインストールする

下記のリンクからダウンロードしてください。

- Codex 公式ページ: https://openai.com/codex/
- Codex getting started: https://openai.com/academy/codex-how-to-start/
- ChatGPT desktop app: https://chatgpt.com/features/desktop/

## 3. Codex に GitHub / Vercel を連携する

Codex デスクトップアプリから GitHub と Vercel を連携します。

連携するもの:

- GitHub: リポジトリ作成、commit、push、PR/merge のため
- Vercel: デプロイ、preview、production 公開のため

注意:

- 連携画面では、必要な権限だけ許可してください
- 最初の repo は Private 推奨です
- 講座中は本番課金や本番データを扱わないでください

### ターミナルから連携する場合

Codex CLI を使う場合は、MCP 設定を `~/.codex/config.toml` に入れるか、`codex mcp add` コマンドで追加できます。

Vercel:

```bash
codex mcp add vercel --url https://mcp.vercel.com
```

追加時に OAuth が検出されると、ブラウザで Vercel 認可画面が開きます。

GitHub:

```bash
codex mcp add github --url https://api.githubcopilot.com/mcp/
```

GitHub は token が必要になる場合があります。`~/.codex/config.toml` に書く場合は、token を直接書かず、環境変数で渡します。

```toml
[mcp_servers.github]
url = "https://api.githubcopilot.com/mcp/"
bearer_token_env_var = "GITHUB_PAT_TOKEN"
```

Vercel を config に書く場合:

```toml
[mcp_servers.vercel]
url = "https://mcp.vercel.com"
```

確認:

```bash
codex
/mcp
```

注意:

- token は `config.toml` に直書きしない
- `GITHUB_PAT_TOKEN` は `.env` や shell の環境変数で管理する
- GitHub token は最小権限にする
- Vercel は project-specific URL も使える

Vercel project を固定したい場合:

```toml
[mcp_servers.vercel]
url = "https://mcp.vercel.com/<teamSlug>/<projectSlug>"
```

講座では、非エンジニア向けの本編はアプリ UI 連携で進め、詰まった人や上級者向けにこのターミナル連携を紹介します。

### Codex アプリ上で GitHub を連携する流れ

UI 名称は Codex アプリの更新で変わることがあります。

次の場所を探してください。

- 左サイドバー
- `Settings`
- `Tools`
- `Connectors`
- `Integrations`
- `Accounts`

手順:

1. Codex デスクトップアプリを起動する
2. ChatGPT アカウントでサインインする
3. 左サイドバーを確認する
4. `Settings` または歯車アイコンを開く
5. `Connectors`、`Tools`、`Integrations`、または `Accounts` を開く
6. `GitHub` を選ぶ
7. `Connect` または `Sign in with GitHub` を押す
8. ブラウザで GitHub の認可画面が開く
9. 連携する GitHub アカウントを選ぶ
10. repo 権限を確認する
11. 講座では、最初は必要最小限の repo だけ許可する
12. Codex アプリに戻り、GitHub が `Connected` になっていることを確認する

確認プロンプト:

```text
GitHub 連携ができているか確認してください。
新しい private repository を作れる状態か、または既存 repo に push できる状態かを教えてください。
まだ repo 作成や push はしないでください。
```

### Codex アプリ上で Vercel を連携する流れ

手順:

1. `Settings` を開く
2. `Connectors`、`Tools`、`Integrations`、または `Accounts` を開く
3. `Vercel` を選ぶ
4. `Connect` または `Sign in with Vercel` を押す
5. ブラウザで Vercel の認可画面が開く
6. Vercel アカウントまたは team を選ぶ
7. 許可する scope / team / project を確認する
8. Codex アプリに戻り、Vercel が `Connected` になっていることを確認する

確認プロンプト:

```text
Vercel 連携ができているか確認してください。
GitHub repo から新しい Vercel project を作って deploy できる状態か教えてください。
まだ deploy はしないでください。
```

### Vercel が Codex アプリ内に見つからない場合

Codex アプリの UI に `Vercel` が見つからない場合は、次のどちらかで進めます。

Codex に接続方法を案内させる:

```text
Vercel にデプロイしたいです。
この Codex アプリから Vercel を連携する場所が見つかりません。
今の UI でどこを開けばよいか案内してください。
もしアプリ内連携が使えない場合は、Vercel 側で GitHub repo を import する手順を案内してください。
```

Vercel 側で GitHub repo を import する:

1. https://vercel.com/ を開く
2. GitHub アカウントでサインインする
3. `Add New` または `New Project` を押す
4. GitHub repo を import する
5. framework / build command / output directory を確認する
6. `Deploy` を押す
7. 公開 URL を開いて確認する

この場合も、Codex には次のように頼みます。

```text
Vercel 側で GitHub repo を import して deploy します。
このアプリの framework、build command、output directory、必要な環境変数を確認してください。
Vercel の画面で何を選べばよいか、順番に教えてください。
```

## 4. Codex に MVP 開発をまとめて依頼する

最初のプロンプト:

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

Codex が確認質問をしてきたら、短く答えます。

```text
1. ターゲットユーザーは〇〇です
2. 最初の機能は〇〇だけで大丈夫です
3. デザインはシンプルで OK です
4. まずログインなしで作ってください
```

非エンジニア向けには、短く答えてよいことを伝えてください。

完璧な仕様書を書く必要はありません。

## 6. ローカル確認、GitHub、Vercel を進めてもらう

途中で止まったら、こう依頼します。

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

スクリーンショットを渡す場合:

```text
このスクリーンショットの赤枠部分を直してください。
スマホ表示でも崩れないようにしてください。
修正後に確認する手順も教えてください。
```

## 7. Claude Code にこの repo を読ませる

Claude Code は補助教材として使います。

GitHub に置いたこのリポジトリの URL を Claude Code に渡して、次のプロンプトを使います。

```text
以下の GitHub リポジトリを開発環境セットアップ用の資料として読んでください。

<ここに GitHub リポジトリ URL を貼る>

まず COURSE.md、CLAUDE.md、AGENTS.md を読んでください。
そのうえで、非エンジニアの起業家が MVP を作り始めるためのセットアップ計画を作ってください。

まだファイル変更、MCP 追加、外部サービス連携はしないでください。
まず不足情報を質問してください。
```

ポイント:

- Claude Code は「この repo の説明書を読ませる」用途にする
- まず計画を作らせる
- MCP 追加や外部連携は、認証と権限が絡むので勝手に進めない

## 8. おすすめツール

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

## 9. 上級者向け: CLI / Warp / MCP

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

## 10. 実務での安全ルール

全部 AI に頼んでよいですが、次の操作は人間が確認してください。

- GitHub / Vercel の OAuth 権限
- public repository にするかどうか
- production deploy
- 有料 add-on
- 課金
- 本番データ
- 外部 API key
- 個人情報や顧客情報

基本ルール:

- 最初の repo は Private
- ログインや決済は最初の MVP では避ける
- 本番データを使わない
- `.env` や API key をチャットに貼らない
- deploy 前に公開 URL で見えてよい内容か確認する

## 11. 迷ったら使うプロンプト

```text
私は非エンジニアの起業家です。
MVP を作りたいですが、次に何をすればいいかわかりません。

今の状況:
- やりたいこと:
- できていること:
- 詰まっていること:

次にやるべきことを、初心者でも実行できる手順に分解してください。
できる作業はあなたが進めてください。
私の承認が必要な操作だけ、理由を説明して止まってください。
```

## 12. 公式・一次情報リンク

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
