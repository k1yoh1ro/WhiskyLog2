# syntax=docker/dockerfile:1

# ベースイメージを指定します
FROM postgres:13-alpine
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

# データベースの初期設定を行うためのSQLファイルをコピーします
COPY ./init/*.sql /docker-entrypoint-initdb.d/