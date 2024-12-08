#! /bin/bash

echo "パスワードマネージャーへようこそ！" >&1
echo -n "サービス名を入力してください：" >&2
read service
echo -n "ユーザー名を入力してください：" >&2
read user_name
echo -n "パスワードを入力してください：" >&2
read password

# write file
storage_file="./storage/storage.txt"

pw_info="${service}:${user_name}:${password}"
echo $pw_info >>$storage_file

#
echo "Thank you!"
