# Recommended Tools

講座本編では Codex デスクトップアプリ、GitHub、Vercel があれば十分です。

ここでは、MVP 開発をさらに速く進めたい人向けのおすすめツールを紹介します。

## 1. Typeless or Aqua Voice

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

## 2. cmux

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

## 3. CleanShot X

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

Codex に渡す例:

```text
このスクリーンショットの赤枠部分を直してください。
スマホ表示でも崩れないようにしてください。
修正後に確認する手順も教えてください。
```

## 講座での位置づけ

必須:

- Codex デスクトップアプリ
- GitHub
- Vercel

おすすめ:

- Typeless or Aqua Voice: プロンプト作成を速くする
- CleanShot X: エラーや UI 修正を伝えやすくする

上級者向け:

- cmux: 複数 agent / CLI 作業を並列化する
- Claude Code CLI / Codex CLI
- MCP

