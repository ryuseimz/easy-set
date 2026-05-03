# MVP Project Agent Rules

このファイルは Codex、Claude Code、その他 coding agent が読むプロジェクトルールです。

## Goal

非エンジニアの起業家が MVP を素早く検証できるように、企画、実装、確認、GitHub、Vercel 公開までを小さく安全に進めます。

## Mindset

- 全部 AI に聞く。全部 AI にやらせる。
- 最新情報は必ず調べる。
- エンジニアにしかできないと思わない。

## Standard Flow

1. 企画を短く整理する
2. 今回作るもの / 作らないものを決める
3. 最小構成で実装する
4. ローカルで動作確認する
5. 変更内容をレビューする
6. lint / typecheck / test / build を実行する
7. GitHub に commit / push する
8. Vercel deploy を確認する
9. 公開 URL と確認ポイントをまとめる

## Implementation Rules

- まず動く MVP を優先する
- ログイン、決済、複雑な DB は最初から入れない
- UI はシンプルでよいが、スマホで崩れないようにする
- README に起動方法を書く
- ユーザーが次に何を確認すればよいか明記する

## Review Rules

コード変更後は必ず次を確認してください。

- 目的に対して余計な機能が増えていないか
- スマホ表示で崩れないか
- エラー画面や空状態が最低限あるか
- secrets や API key が混入していないか
- README の起動手順が正しいか
- Vercel deploy で失敗しそうな設定がないか

## Verification Commands

プロジェクトに存在するコマンドだけ実行してください。

```bash
npm run lint
npm run typecheck
npm test
npm run build
```

コマンドが存在しない場合は、無理に追加せず「未設定」と報告してください。

## Safety

- `.env`、`.env.*`、secrets、private keys を出力しない
- GitHub token、Vercel token、API key をチャットに貼らない
- 課金、有料 add-on、production database、外部 API key が必要な場合は実行前に確認する
- public repository にする前に確認する
- production deploy 前に公開してよい内容か確認する

## GitHub / Vercel

- 最初の repository は Private 推奨
- commit message は短く具体的にする
- push 前に diff と検証結果を要約する
- Vercel deploy 後は公開 URL を開き、主要フローを確認する

