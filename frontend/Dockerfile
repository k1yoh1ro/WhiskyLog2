# ベースイメージを指定
FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとpackage-lock.jsonをコピーして依存関係をインストール
COPY package*.json ./
RUN npm install

# ソースコードをコピー
COPY . .

# ポートを公開
EXPOSE 3000

CMD ["npm", "run", "dev"]