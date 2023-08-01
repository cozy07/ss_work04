#!/bin/bash

# 例外 スクリプトに正確に2つの引数が必要
if [[ $# -ne 2 ]]; then
    echo "Error: Two arguments are required."
    exit 1
fi

# 例外 引数は整数でなければならない
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "Error: Arguments must be integers."
    exit 1
fi

## 例外 引数は正の整数でなければならない
## 1つ上の例外処理で負の数値も処理が出来ているため不要であることがテスト実施結果からわかったためコメントアウト
# if [[ $1 -le 0 ]] || [[ $2 -le 0 ]]; then
#     echo "Error: Arguments must be positive integers."
#     exit 1
# fi

# 変数を設定する
if (( $1 > $2 )); then
    a=$1
    b=$2
else
    a=$2
    b=$1
fi

# ユークリッドの互除法を使用して最大公約数を求める
while (( $b != 0 )); do
    remainder=$(( a % b ))
    a=$b
    b=$remainder
done

echo $a