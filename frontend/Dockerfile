#########################################################################################################
# このDockerFileの参考先 → https://cookin.dev/website/303/ 　　　　　                                     #
# versel提供の公式サイト　→ https://github.com/vercel/next.js/blob/canary/examples/with-docker/Dockerfile #
#########################################################################################################

# パッケージインストール用ベースイメージ
FROM node:18-alpine as deps

# 参考にして追加 → https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine
RUN apk add --no-cache libc6-compat

# 作業ディレクトリを作成し、そこに移動する(あれば移動するだけ)
WORKDIR /app

# package.json package-lock.jsonをコンテナにコピー
COPY package*.json ./

# npmをインストール
RUN \
if [ -f package-lock.json ]; then npm ci; \
else echo "Lockfile not found." && exit 1; \
fi

    
# アプリ実行するためのベースイメージ
FROM node:18-alpine as builder

# depsと同じディレクトリに移動
WORKDIR /app

# depsステージで作成されたnode_modulesフォルダをコピー
COPY --from=deps /app/node_modules ./node_modules

# ソースのコピー
COPY . .

# デバッグモードで実行するための環境変数設定
ENV NODE_OPTIONS="--inspect=0.0.0.0:9230"

# npmビルド
RUN npm run build

EXPOSE 3000
EXPOSE 9230

# 環境変数を使ってCMDを設定
CMD ["sh", "-c", "node $NODE_OPTIONS node_modules/.bin/next dev"]
