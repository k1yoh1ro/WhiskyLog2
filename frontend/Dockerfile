# ベースイメージとしてNode.jsの公式イメージを使用
FROM node:18-alpine

# アプリケーションディレクトリを作成
WORKDIR /app

# package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# package.jsonとpackage-lock.jsonをコピー
COPY . .