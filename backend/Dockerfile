# アプリ実行前の準備の為のベースイメージ
FROM maven:3.9.8-eclipse-temurin-21-alpine as deps

# 作業ディレクトリを作成し、そこに移動する
WORKDIR /app

# 依存関係のみを先にインストールしてキャッシュを利用
COPY pom.xml .
RUN mvn dependency:go-offline -B

# アプリケーションのソースコードをコピー
COPY src ./src

# アプリケーションをビルド
RUN mvn install -DskipTests

# # ホットリロードとデバッグのためのCMDコマンド
# CMD ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-Dspring.devtools.remote.secret=mysecret", "-Dspring-boot.run.profiles=dev", "-cp", "target/classes:target/dependency/*", "com.whiskylog.backend.BackendApplication"]

# ポートの指定
EXPOSE 8080
EXPOSE 5005