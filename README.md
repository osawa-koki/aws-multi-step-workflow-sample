# aws-multi-step-workflow-sample

🫖🫖🫖 `AWS Step Functions`で複数のステップを実行するサンプルです！  

![成果物](./docs/images/fruit.gif)  

## 開発環境の構築方法

最初にAWS CLIをインストールします。  
<https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2.html>  

以下のコマンドを実行して、AWS CLIのバージョンが表示されればOKです。  

```shell
aws --version
```

認証情報を設定します。  

```shell
aws configure
```

以下のように聞かれるので、適宜入力してください。

```shell
AWS Access Key ID [None]: アクセスキーID
AWS Secret Access Key [None]: シークレットアクセスキー
Default region name [None]: リージョン名
Default output format [None]: json
```

これらの情報は、AWSのコンソール画面から確認できます。  
IAMのページから指定のユーザを選択肢、アクセスキーを発行してください。  

続いて、AWS SAMをインストールします。  
こちらはサーバレスアプリケーションを構築するためのツールです。  
<https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html>  

以下のコマンドを実行して、AWS SAMのバージョンが表示されればOKです。  

```shell
sam --version
```

### チェックコマンド

```shell
# テスト
python -m pytest ./tests/ -v

# Lint
python -m flake8 --ignore=E501 ./functions/ ./tests/

# # Formatter
# python -m black ./functions/ ./tests/

# Import Sort
python -m isort ./functions/ ./tests/

# Type Check
python -m mypy --ignore-missing-imports ./functions/ ./tests/
```

## 本番環境の準備

### GitHub Secretsの設定

| キー | バリュー |
| --- | --- |
| PROJECT_NAME | プロジェクト名(CloudFormationのスタック名) |
| AWS_ACCESS_KEY_ID | AWSのアクセスキーID |
| AWS_SECRET_ACCESS_KEY | AWSのシークレットアクセスキー |
| AWS_REGION | リージョン名 |

`v-*`の形式のタグをつけると、`GitHub Actions`が実行され、リソースのプロビジョニングが行われます。  
以下のコマンドで、デプロイされたAPIのURLを確認できます。  

また、以下のコマンドで手動でデプロイすることもできます。  

```shell
sam build --use-container
sam deploy --stack-name <プロジェクト名>
```

## 環境情報

| 環境 | バージョン |
| --- | --- |
| AWS CLI | 2.11.20 |
| SAM CLI | 1.83.0 |
