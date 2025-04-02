#!/bin/bash

echo "🔐 スクリプト実行権限を設定中..."

TARGET_FILES=("setup.sh" "sdkman_uninstall.sh")

for file in "${TARGET_FILES[@]}"; do
  full_path="./Scripts/$file"
  if [ -f "$full_path" ]; then
    if [ ! -x "$full_path" ]; then
      chmod +x "$full_path"
      echo "✅ 実行権限を付与しました：$file"
    else
      echo "🔁 すでに実行権限があります：$file"
    fi
  else
    echo "❌ ファイルが見つかりません：$file"
  fi
done

echo ""
echo "🎉 実行権限の設定が完了しました！"
echo "  ./Scripts/setup.sh や sdkman_uninstall.sh を直接実行できます ✅"