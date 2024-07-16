# ベースイメージを指定します
FROM node:20-alpine

WORKDIR /app

# # src ディレクトリの全てのファイルをコピー
COPY . .

# npm の依存関係をインストール
RUN npm install -g next

RUN npm run build

CMD ["npm", "run", "dev"]