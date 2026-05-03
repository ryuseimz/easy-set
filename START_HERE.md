# Start Here

このリポジトリを clone したあと、Codex または Claude Code にこのファイルを読ませてください。

## 使い方

1. このリポジトリを clone する
2. Codex または Claude Code でこのリポジトリを開く
3. AI に下記のプロンプトを投げる
4. AI の案内に従ってセットアップを進める

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

## AI がやること

AI は以下を進めます。

- ローカル環境を確認する
- Codex CLI が使えるか確認する
- GitHub / Vercel 連携方法を案内する
- MCP 設定案を作る
- 対象 MVP repo に入れる `AGENTS.md` / `CLAUDE.md` / `.codex/config.toml` / GitHub Actions を準備する
- レビュー運用を追加する

## 受講生がやること

受講生がやるのは基本的にこれだけです。

- ChatGPT / Claude / GitHub / Vercel にログインする
- ブラウザに出る認証画面を承認する
- 有料操作や公開操作の前に OK を出す

## 自動セットアップスクリプト

AI は必要に応じてこのスクリプトを実行します。

```bash
./scripts/setup-codex-mvp.sh
```

このスクリプトは、秘密情報を書き換えたり、勝手に deploy / push したりしません。
