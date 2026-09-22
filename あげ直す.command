#!/bin/zsh
# デスクトップの index.html を、公開ページに上げ直す。
# アドレスは変わらない → https://soranomoto.github.io/ishizumi-mie/
cd "$(dirname "$0")" || exit 1
cp ~/Desktop/index.html ./index.html || { echo "デスクトップに index.html が無い"; exit 1; }
git add -A
git -c user.name="飯島一郎" -c user.email="senteiyasora@gmail.com" \
    commit -q -m "本文を直した $(date '+%Y-%m-%d %H:%M')" || { echo "直したところがない"; exit 0; }
git push -q origin main || { echo "押し上げに失敗した"; exit 1; }
echo "上げ直した。反映まで1〜2分かかる"
echo "https://soranomoto.github.io/ishizumi-mie/"
