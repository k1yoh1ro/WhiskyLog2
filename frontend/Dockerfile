# ベースイメージを指定します
FROM node:20-alpine

WORKDIR /workspace

# # src ディレクトリの全てのファイルをコピー
COPY . .

# npm の依存関係をインストール
RUN npm install -g next

CMD ["npm", "run", "dev"]