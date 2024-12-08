#! /bin/bash

echo "パスワードマネージャーへようこそ！" >&1
storage_file="./storage/storage.txt"

while true; do
  echo
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：" >&2
  read option

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
    echo -n "サービス名を入力してください：" >&2
    read target_service

    while read line; do
      service_in_line=$(echo "$line" | cut -d ":" -f1)

      if [ "$target_service" = "$service_in_line" ]; then
        echo "サービスが見つかりました。"
        user_name=$(echo "$line" | cut -d ":" -f2)
        password=$(echo "$line" | cut -d ":" -f3)
        echo "サービス名：$target_service"
        echo "ユーザー名：$user_name"
        echo "パスワード：$password"
        break
      fi
    done <"${storage_file}"

    if [ "$target_service" != "$service_in_line" ]; then
      echo "そのサービスは登録されていません。"
    fi

  elif [ "$option" = "Exit" ]; then
    #
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
