#! /bin/bash

echo "パスワードマネージャーへようこそ！" >&1
echo -n "サービス名を入力してください：" >&2
read service
echo -n "ユーザー名を入力してください：" >&2
read user_name
echo -n "パスワードを入力してください：" >&2
read password

echo $service
echo $user_name
echo $password
