# ベースイメージを指定します
FROM node:20-alpine

WORKDIR /workspace/frontend
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]