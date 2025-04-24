#!/bin/bash

echo "🚀 Java 17 Temurin 環境セットアップ中..."

# SDKMAN 初期化
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo "❌ SDKMAN が見つかりません。インストールしてから再実行してください。"
  echo 'インストールコマンドはこちら: 「curl -s "https://get.sdkman.io" | bash」'
  echo ""
  echo "🔁 インストール直後の方は、以下を実行してから再度このスクリプトを実行してください："
  echo "  source \"\$HOME/.sdkman/bin/sdkman-init.sh\""
  echo "  または、ターミナルを完全に閉じて、再起動してからやり直してください。"
  exit 1
fi

# 🔍 Java 17 Temurin の最新版識別子を取得
# Java 17 Temurin の最新バージョンを取得するコマンド（定義っぽく）
readonly GET_LATEST_JAVA_17_TEM='sdk list java | grep "|" | awk -F "|" '\''$3 ~ /^ *17\./ && $4 ~ /tem/ { gsub(/ /, "", $6); print $6 }'\'' | head -n 1'
latest_java17_tem=$(eval "$GET_LATEST_JAVA_17_TEM")

if [ -z "$latest_java17_tem" ]; then
  echo "❌ Java 17 Temurin のバージョンが見つかりませんでした。"
  echo "   手動で 'sdk list java' を実行して確認してください。"
  exit 1
fi

echo "📦 最新 Java 17 Temurin: $latest_java17_tem"

# Java が未インストールならインストール
if ! sdk list java | grep -q "$latest_java17_tem.*installed"; then
  echo "⬇️ Java $latest_java17_tem をインストールします..."
  sdk install java "$latest_java17_tem"
else
  echo "✅ Java $latest_java17_tem はすでにインストールされています。"
fi

# .java-version に書き込み
echo "$latest_java17_tem" > .java-version
echo "📝 「.java-version」 に '$latest_java17_tem' を書き込みました。"

# sdk env で切り替え（JAVA_HOMEが空の場合があるので念の為実施する）
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk env install

echo "✅ Java セットアップ完了！🎉"
echo "もし「Could not find .sdkmanrc in the current directory.」と出ても今回は無視で問題ないです！"
echo "その後「Run 'sdk env init' to create it.」と表示された場合も無視してください！"
echo "----------------------------------------------------"
echo ""

# === 環境情報の確認 ===
echo "🧾 Java 環境の確認"
echo "----------------------------------------------------"
echo "📦 使用中の Java バージョン:"
java --version
echo ""

echo "📍 java コマンドの場所:"
which java
echo ""

echo "🌍 JAVA_HOME の値:"
echo "$JAVA_HOME"
echo ""

echo "📁 SDKMAN にインストールされている Java 一覧:"
ls -la ~/.sdkman/candidates/java
echo "----------------------------------------------------"