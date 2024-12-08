#! /bin/bash

echo "パスワードマネージャーへようこそ！" >&1
storage_file="./storage/storage.txt"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：" >&2
  read option
  echo $option
  #
  if [ "$option" = "Add Password" ]; then
    #
    echo -n "サービス名を入力してください：" >&2
    read service
    echo -n "ユーザー名を入力してください：" >&2
    read user_name
    echo -n "パスワードを入力してください：" >&2
    read password

    # write file
    pw_info="${service}:${user_name}:${password}"
    echo $pw_info >>$storage_file

  elif [ "$option" = "Get Password" ]; then
    #
    echo .
  elif [ "$option" = "Exit" ]; then
    #
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
