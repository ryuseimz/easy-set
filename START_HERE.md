# Start Here

このリポジトリを clone したあと、Codex または Claude Code にこのファイルを読ませてください。

## 使い方

1. このリポジトリを clone する
2. Codex または Claude Code でこのリポジトリを開く
3. AI に `START_HERE.md` を読ませる
4. AI の案内に従ってセットアップを進める

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
