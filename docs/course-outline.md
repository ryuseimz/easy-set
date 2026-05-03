# Course Outline

Claude Code と Codex のセットアップ、MVP 開発、実務向け運用を教える講座用の進行台本です。

## ゴール

非エンジニアの起業家が、MVP 開発に着手できる状態になることを目指します。

- Claude Code をインストールしてサインインできる
- Codex をインストールしてサインインできる
- Codex に GitHub / Vercel アカウントを連携できる
- Codex に短いプロンプトで MVP 開発を依頼できる
- Codex の質問に答えながら、企画、実装、確認、GitHub、Vercel 公開まで進められる
- secrets や production credentials を agent に渡さない基本ルールを理解する

## 0. 導入

話すこと:

- Claude Code と Codex は「コードを書く AI」ではなく、開発環境の中で調査、設計、実装、検証、レビューを進める agent
- 重要なのは、良い model を使うことだけではなく、repo 側に良い説明書を置くこと
- この講座では、非エンジニアでも Codex に GitHub / Vercel を連携して「企画から公開」まで進める最短ルートを扱う

最初に [docs/mindset.md](mindset.md) を使って、次の前提を共有します。

- 全部 AI に聞く。全部 AI にやらせる。
- 最新情報は必ずリサーチする。
- AI 驚き屋の情報は玉石混交なので、自分で触る。
- 仲間と情報共有する。
- エンジニアにしかできないと思わない。
- AI に任せるが、公開、課金、本番データの判断は人間が持つ。

## 1. Claude Code デスクトップアプリのインストール

公式ページから Claude Code デスクトップアプリをインストールし、Claude アカウントでサインインします。

- Claude ダウンロード: https://claude.com/download
- Claude Desktop インストール手順: https://support.claude.com/en/articles/10065433-install-claude-desktop

講師メモ:

- 検索広告や非公式ミラーではなく、公式リンクから入れるように伝える
- Claude Desktop の Settings > Extensions から desktop extensions を確認できる
- Claude Code/Cowork は desktop app からローカル/リモート作業を扱える

確認できる人だけ、ターミナルでも確認します。

```bash
claude --version
claude doctor
```

## 2. Codex デスクトップアプリのインストール

公式ページから Codex デスクトップアプリをインストールし、ChatGPT アカウントでサインインします。

- Codex 公式ページ: https://openai.com/codex/
- Codex getting started: https://openai.com/academy/codex-how-to-start/
- ChatGPT desktop app: https://chatgpt.com/features/desktop/

講師メモ:

- Codex getting started では、Codex desktop app をダウンロードして ChatGPT アカウントでサインインする流れが案内されている
- Codex は project/thread 単位で作業する
- 受講者には最初に空の練習フォルダかこの repo を開かせる

画面イメージ:

![Codex thread screen](https://images.ctfassets.net/kftzwdyauwt9/5a7uKTozmVeEuSwi3QdWAB/14acd3d814d1a3cf208eb3439d5a84e8/codexthread.png?fm=webp&q=90&w=1600)

![Codex project folder example](https://images.ctfassets.net/kftzwdyauwt9/tX1Csx6I3JfJYeJetPa0t/6e415a6c0efb94cab9ea3cb4395ad7e8/filestructure.png?fm=webp&q=90&w=1600)

## 3. Codex に GitHub / Vercel を連携する

Codex デスクトップアプリから GitHub と Vercel を連携します。

受講者向けの詳しい画面手順は [docs/codex-connections.md](codex-connections.md) にあります。

連携するもの:

- GitHub: リポジトリ作成、commit、push、PR/merge のため
- Vercel: デプロイ、preview、production 公開のため

講師メモ:

- 受講者には細かい Git 操作を覚えさせすぎない
- 許可画面が出たら、何を許可するかだけ確認する
- 最初は Private repo 推奨
- 本番課金、本番データ、外部 API key は使わない

## 4. Codex に MVP 開発をまとめて依頼する

受講者は、まずこのプロンプトを Codex に送ります。

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

講師メモ:

- 受講者には「全部頼んでよい」と伝える
- ただし、課金、本番データ、外部 API key は避ける
- Codex の確認質問に答えることで、企画が自然に絞られる

## 5. Codex の質問に答える

```text
1. ターゲットユーザーは〇〇です
2. 最初の機能は〇〇だけで大丈夫です
3. デザインはシンプルで OK です
4. まずログインなしで作ってください
```

講師メモ:

- 非エンジニア向けには、短く答えてよいことを伝える
- 完璧な仕様書を書く必要はない
- 「今回は作らない」判断を大事にする

## 6. ローカル確認、GitHub、Vercel を進めてもらう

```text
続けてください。
ローカル確認、GitHub への push、Vercel デプロイまで順番に進めてください。
私が承認する必要がある操作があれば、その理由を短く説明してください。
```

講師メモ:

- Codex が手順を進める前提にする
- 受講者は承認画面、ローカル URL、公開 URL を確認する
- エラーが出たら、エラー文をそのまま Codex に渡す

エラー時プロンプト:

```text
このエラーが出ました。
原因を説明して、直してください。

エラー内容:
<ここにエラーを貼る>
```

講師メモ:

- Vercel は GitHub repo とつなぐだけでデプロイできることが多い
- 環境変数が必要なアプリでは、Vercel 側にも設定する
- デプロイ後は URL を開き、ローカルと同じ操作を確認する

## 7. Claude Code に GitHub リポジトリを読ませる

受講者には GitHub リポジトリ URL を渡します。

```text
以下の GitHub リポジトリを開発環境セットアップ用の資料として読んでください。

<ここに GitHub リポジトリ URL を貼る>

まず README.md、CLAUDE.md、AGENTS.md、docs/quickstart.md を読んでください。
そのうえで、非エンジニアの起業家が MVP を作り始めるためのセットアップ計画を作ってください。

まだファイル変更、MCP 追加、外部サービス連携はしないでください。
まず不足情報を質問してください。
```

講師メモ:

- Claude Code は補助教材として、この repo の説明書を読ませる
- まず計画を作らせる
- MCP 追加や外部連携は、認証と権限が絡むので勝手に進めない

## 8. 実務セットアップの説明

この repo の構成を説明します。

- `CLAUDE.md`: Claude Code の入口
- `AGENTS.md`: Codex と他 agent の共通ルール
- `.claude/settings.json`: permission、deny、hooks
- `.claude/rules/`: iOS、Web、design、security の領域別ルール
- `.claude/skills/`: 反復作業のワークフロー
- `.codex/config.toml`: Codex の設定例
- `docs/mcp-catalog.md`: 推奨 MCP の一覧
- `templates/`: 各プロジェクトへコピーする雛形
- `scripts/check-setup.sh`: 環境チェック

## 9. iOS / Web / Design / MCP の分岐

iOS 開発:

- Xcode 26.3+
- XcodeBuildMCP
- `xcodebuild`
- Simulator screenshot
- SwiftLint / SwiftFormat
- signing や entitlements は勝手に触らせない

Web 開発:

- Playwright
- Figma MCP
- Context7
- Vercel MCP
- Supabase MCP
- Sentry MCP

Design:

- Figma MCP で node、variables、components を取得
- 既存 component と token を使う
- Playwright または Simulator で screenshot 検証

MCP:

- まずは少数から
- official server を優先
- DB は dev/read-only/project scoped
- production credentials は渡さない

## 10. おすすめツール

詳しくは [docs/recommended-tools.md](recommended-tools.md) を見せます。

### Typeless or Aqua Voice

音声入力ツールです。

- Typeless: https://www.typeless.com/
- Aqua Voice: https://aquavoice.com/

紹介ポイント:

- プロンプトを声で作れる
- 企画や要望を長文で伝えやすい
- 非エンジニアにとって「考えを言語化する速度」が上がる

### CleanShot X

スクショ、注釈、画面録画ツールです。

- CleanShot X: https://cleanshot.com/

紹介ポイント:

- エラー画面を撮って Codex に渡せる
- UI の崩れを赤枠や矢印で伝えられる
- 画面録画で再現手順を共有できる

### cmux

複数 agent / CLI 作業を並列に見たい人向けです。

- cmux: https://cmux.com/

紹介ポイント:

- 上級者向け
- 複数の Codex / Claude Code / CLI agent を並べて動かせる
- 実装、レビュー、テストを別 pane で進めやすい

## 11. 上級者向けおまけ: CLI / Warp / MCP

講座本編はデスクトップアプリで十分です。最後に、上級者向けの拡張として CLI 周りを紹介します。

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

紹介するポイント:

- CLI はターミナル中心の開発者に向いている
- worktree と組み合わせると複数 agent を安全に並列化しやすい
- Warp は command history、AI 補助、terminal workflow を整理したい人向け
- 初学者はまずデスクトップアプリで「読ませる、計画させる、検証させる」を覚える

講師メモ:

- CLI は必須にしない
- インストールで詰まる人を減らすため、本編はデスクトップアプリに寄せる
- CLI の価値は「速さ」よりも「再現性、並列化、自動化」と説明する

## 12. まとめ

最後に伝えること:

- AI agent は repo の説明書があるほど強くなる
- `CLAUDE.md` と `AGENTS.md` はプロジェクトの運用知を蓄積する場所
- MCP は便利だが、権限設計が重要
- 非エンジニアは、Codex に大きく任せてよい
- ただし、課金、本番データ、外部連携の承認は自分で確認する
- 企画 → 実装 → ローカル確認 → GitHub → Vercel の流れを繰り返す
