# ベースイメージとしてNode.jsを使用
FROM node:18-alpine as base

FROM base as deps

# これが必要な理由は→https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine
RUN apk add --no-cache libc6-compat
WORKDIR /app

# 依存関係をインストール
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

# ソースをコピー
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# next.jsはテレメトリデータを匿名で収集する。必要ないので機能をオフ。
# テレメトリデータに関しては検索して。
ENV NEXT_TELEMETRY_DISABLED 1

# アプリケーションをコンパイル
RUN \
  if [ -f yarn.lock ]; then yarn run build; \
  elif [ -f package-lock.json ]; then npm run build; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm run build; \
  else echo "Lockfile not found." && exit 1; \
  fi

# 本番イメージ
FROM base AS runner
WORKDIR /app

# 環境変数
ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

# コンテナ内のLinuxユーザーとグループを追加
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# next.svg→Next.jsのロゴ画像
# vercel.svg→Vercelのロゴ画像
COPY --from=builder /app/public ./public

# プリレンダリングキャッシュに適切な権限を付与
RUN mkdir .next
RUN chown nextjs:nodejs .next

# 出力トレースを自動的に活用して画像サイズを縮小
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT=3000

# server.js は、スタンドアロン出力から次のビルドによって作成される
# https://nextjs.org/docs/pages/api-reference/next-config-js/output
CMD HOSTNAME="0.0.0.0" node server.js