# Codex App Connections

Codex デスクトップアプリ上で GitHub / Vercel を連携する手順です。

UI 名称は Codex アプリの更新で変わることがあります。講座では、完全なボタン名を暗記させるより、次の場所を探すように案内してください。

- 左サイドバー
- `Settings`
- `Tools`
- `Connectors`
- `Integrations`
- `Accounts`

## 1. Codex アプリを開く

1. Codex デスクトップアプリを起動する
2. ChatGPT アカウントでサインインする
3. 左サイドバーを確認する
4. `Settings` または歯車アイコンを開く

Codex の基本 UI は、左サイドバーに projects / conversation history、中央に thread / chat がある構成です。

## 2. GitHub を連携する

Codex アプリ内で次の流れを探します。

1. `Settings` を開く
2. `Connectors`、`Tools`、`Integrations`、または `Accounts` を開く
3. `GitHub` を選ぶ
4. `Connect` または `Sign in with GitHub` を押す
5. ブラウザで GitHub の認可画面が開く
6. 連携する GitHub アカウントを選ぶ
7. repo 権限を確認する
8. 講座では、最初は必要最小限の repo だけ許可する
9. Codex アプリに戻り、GitHub が `Connected` になっていることを確認する

確認プロンプト:

```text
GitHub 連携ができているか確認してください。
新しい private repository を作れる状態か、または既存 repo に push できる状態かを教えてください。
まだ repo 作成や push はしないでください。
```

## 3. Vercel を連携する

Codex アプリ内で次の流れを探します。

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

## 4. Vercel が Codex アプリ内に見つからない場合

Codex アプリの UI に `Vercel` が見つからない場合は、次のどちらかで進めます。

### A. Codex に接続方法を案内させる

```text
Vercel にデプロイしたいです。
この Codex アプリから Vercel を連携する場所が見つかりません。
今の UI でどこを開けばよいか案内してください。
もしアプリ内連携が使えない場合は、Vercel 側で GitHub repo を import する手順を案内してください。
```

### B. Vercel 側で GitHub repo を import する

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

## 5. 講座での注意点

- GitHub / Vercel の連携は OAuth 画面で権限を確認する
- 最初は Private repo 推奨
- Vercel team を使う場合、個人 account と team を間違えない
- 課金、有料 add-on、production database、外部 API key は講座中に扱わない
- Codex に deploy や push を頼むときは、必要に応じて承認画面を確認する

