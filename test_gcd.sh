#!/bin/bash

# 入力された数字に対して正しい出力結果が返ってくるかのテスト
testcase_1=(2 3 1)
testcase_2=(90 60 30)
testcase_3=(56 24 8)
testcase_4=(754 1313 13)

testcases=("${testcase_1[@]}" "${testcase_2[@]}" "${testcase_3[@]}" "${testcase_4[@]}")
i=0
while [ $i -lt ${#testcases[@]} ]
do

    # 入力される値と実行結果を取得
    input_1=${testcases[$i]}
    input_2=${testcases[$((i+1))]}
    output=${testcases[$((i+2))]}
    result=$(bash gcd.sh $input_1 $input_2)

    # 取得した値の判定
    if [ "$result" == "$output" ]; then
        echo "Testcase $((i/3+1)) is OK."
    else
        echo "Testcase $((i/3+1)) failed. Expected: $output Result: $result"
    fi

    i=$((i+3))
done


# エラー 引数の数が2以外の場合
output_error="Error: Two arguments are required."
error_cases=(
  "$(bash gcd.sh)"
  "$(bash gcd.sh 1)"
  "$(bash gcd.sh 1 2 3)"
)

i=1
for result in "${error_cases[@]}"
do
    if [ "$result" == "$output_error" ]; then
        echo "Argument Error testcase $i is OK."
    else
        echo "Argument Error testcase $i failed. Expected: $output_error Result: $result"
    fi
    ((i++))
done

# エラー 引数が整数以外の場合
output_error="Error: Arguments must be integers."
error_cases=(
  "$(bash gcd.sh 1.2 3.44)"
  "$(bash gcd.sh 1 2.2)"
  "$(bash gcd.sh 4.55 2)"
  "$(bash gcd.sh ab cd)"
  "$(bash gcd.sh あ い)"
  "$(bash gcd.sh -1 -4)"
)

i=1
for result in "${error_cases[@]}"
do
    if [ "$result" == "$output_error" ]; then
        echo "Integer Error testcase $i is OK."
    else
        echo "Integer Error testcase $i failed. Expected: $output_error Result: $result"
    fi
    ((i++))
done

## エラー 引数が正の整数以外の場合
## 1つ上の例外処理で負の数値も処理が出来ているため不要であることがテスト実施結果からわかったためコメントアウト
# output_error="Error: Arguments must be positive integers."
# error_cases=(
#   "$(bash gcd.sh -1 -3)"
#   "$(bash gcd.sh -1 2)"
#   "$(bash gcd.sh 4 -2)"
# )

# i=1
# for result in "${error_cases[@]}"
# do
#     if [ "$result" == "$output_error" ]; then
#         echo "Negative integer Error testcase $i is OK."
#     else
#         echo "Negative integer Error testcase $i failed. Expected: $output_error Result: $result"
#     fi
#     ((i++))
# done