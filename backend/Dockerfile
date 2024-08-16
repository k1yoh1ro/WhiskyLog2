# アプリ実行前の準備の為のベースイメージ
FROM maven:3.9.8-eclipse-temurin-21-alpine as deps

# 作業ディレクトリを作成し、そこに移動する
WORKDIR /app

# mavenのセットアップ
COPY .mvn .mvn

# Mavenプロジェクトのビルド(依存関係の解決)
COPY pom.xml .

# アプリのビルド
COPY src src
RUN mvn -B package

# アプリ実行するための軽量ベースイメージ
FROM openjdk:17-jdk-slim as builder

# アプリのJarファイルコピー
COPY --from=deps /app/target/*.jar /app/app.jar