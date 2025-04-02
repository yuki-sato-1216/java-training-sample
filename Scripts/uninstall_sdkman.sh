#!/bin/bash

echo "🧹 SDKMAN アンインストールスクリプトを実行中..."

# 1. ~/.sdkman ディレクトリを削除
if [ -d "$HOME/.sdkman" ]; then
  echo "📦 ~/.sdkman を削除します..."
  rm -rf "$HOME/.sdkman"
else
  echo "✅ ~/.sdkman はすでに存在しません"
fi

# 2. .zshrc / .bashrc に含まれる sdkman の記述を確認して削除
cat ~/.zshrc | grep sdkman
echo "----------------------------------------------------"

for file in "$HOME/.zshrc" "$HOME/.bashrc"; doset
  if [ -f "$file" ]; then
    echo ""
    echo "🔍 $file に含まれる sdkman 関連の記述を確認:"
    grep -i 'sdkman' "$file" || echo "（記述なし）"

    echo "🧼 $file から sdkman 設定行を削除します..."

    # sdkman に関係する行をすべて削除
    sed -i '' '/sdkman/d' "$file"
    sed -i '' '/SDKMAN_DIR/d' "$file"
    sed -i '' '/sdkman-init.sh/d' "$file"
  fi
done

# 3. 設定反映の案内
echo ""
echo "✅ SDKMAN 関連のファイルとシェル設定をすべて削除しました。"
echo "🔁 ターミナルを再起動するか、以下のコマンドで設定を反映してください："
echo ""
echo "  source ~/.zshrc  # または source ~/.bashrc"
echo ""
echo "🧼 アンインストール完了。"
echo "ターミナルを完全に閉じて、再起動してください。"