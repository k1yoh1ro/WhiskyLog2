# ベースイメージとしてNode.jsを使用
FROM node:18-alpine

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm ci

# ソースコードをコピー
COPY . .

# デバッグモードで実行するための環境変数設定
ENV NODE_OPTIONS="--inspect=0.0.0.0:9229"

# ビルド
RUN npm run build

# ポートを公開
EXPOSE 3000
EXPOSE 9230

# Next.jsアプリケーションをデバッグモードで実行
CMD ["npm", "run", "dev"]