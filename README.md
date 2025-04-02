# VT Java 学習用

## 環境構築

### 1. VSCodeの準備

以下のリンクからVSCodeをダウンロードし、インストールする

* VSCode
    * https://code.visualstudio.com/

### Extensionの追加

VSCodeを開き、拡張機能から以下を検索してインストールする

* 必須
    * Extension Pack for Java
* 任意
    * Japanese Language Pack for Visual Studio Code
    * Trailing Spaces
    * Better Comments

### 2. Gitリポジトリのインポート

* 以下の添付画像の手順に従い、自身のgithubページからリポジトリのインポートを行う
    * リポジトリURL:
        * `https://github.com/yuki-sato-1216/java-training`
    * リポジトリ名:
        * `java-training`
            * 重複するリポジトリが存在する場合、 末尾に数字（`-2`）やアルファベット（`-a`）をなど入力してください

1. メニューを開く

<img width="800" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3725756/e8229d78-dc07-151a-82f4-52796fba6257.png">

2. インポート内容を入力する

<img width="800" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3725756/56a33ae5-a81d-8726-41b5-40700666f562.png">

3. インポート完了まで待機する

押下後はページが変わり、ローディング中となる
（1分ほど待機する）

<img width="800" alt="import_loading" src="https://github.com/user-attachments/assets/a073b19a-4b7d-440c-81b3-39c7a8344480" />

ローディングが完了し、チェックマークが表示されたらインポート完了

<img width="800" alt="import_success" src="https://github.com/user-attachments/assets/462d855d-3535-42be-80fe-10b9a7a7cd64" />

### 3. 作業ディレクトリの作成
例）`/Vantan/Workspace` 直下にリポジトリを置く場合

```sh
# 任意のディレクトリに作業用ディレクトリを作成 & 移動
# - 任意のディレクトリ = /Users/ユーザー名/Vantan/Workspace
mkdir 任意のディレクトリ && cd 任意のディレクトリ
```

### 4. ブランチのチェックアウト

初期状態では3つのブランチが存在するため、以下の手順に従いそれぞれのブランチのチェックアウトを行ってください

```sh
# 自身の現在のディレクトリを確認し、作業場所にいない場合は移動する
pwd

# プロジェクトのディレクトリへ移動
cd java-training

# 1. gitの差分チェック（余計な差分などがないか念の為確認する）
git status
# 2. developブランチを作成してチェックアウト
git checkout -b develop
# 3. ブランチの確認
git branch
```

※VSCode上からも、コマンドではなくGUIによる操作も可能です

### 5. JDKの設定

Javaでアプリケーションを作成するために必要な道具の設定を行います

ターミナル（MacOS標準のターミナルや、VScode上のターミナル）、その他ターミナル機能を持つシェルツール等で実行してください

```sh
# 作業リポジトリに移動
# e.g.) ~/Users/ユーザー名/Workspace/java-training
cd java-training

# set_permissions.shの実行許可を付与
chmod +x Scripts/set_permissions.sh

# 実行許可スクリプトを実行
./Scripts/set_permissions.sh

# 使用するJavaのsetupを実行
./Scripts/setup.sh
```

### 6. JDK Runtimeの設定

VSCode上で使用するJDKを設定します

1.「Command + Shift + P」でコマンドパレットを開き、'Configure Java Runtime' と入力する
2. タブ「JDK Runtime」 を確認し、Javaバージョンが 'JavaSE-17' となっていることを確認する
3. 「JavaSE-17」となっていない場合、JavaSE-17を設定する
  * もし「JavaSE-17」となっていない場合は、手順4以降を実施する
4. Finderを開き、上部メニューの「移動」を選択する
5. 下部にある「フォルダへ移動」を選択し、setup.shでログ出力されたsdkmanのパスの一部を入力し移動する
  * `/Users/ユーザー名/.sdkman/candidates/`
6. Javaフォルダが表示されるので、Finder左側の「よく使う項目」にドラッグアンドドロップする
7. 再度、手順の1〜3実施する