# アプリ実行前の準備の為のベースイメージ
FROM maven:3.9.8-eclipse-temurin-21-alpine as deps

# 作業ディレクトリを作成し、そこに移動する
WORKDIR /app

# アプリのビルド
COPY .mvn .
COPY . .
RUN mvn -B install

# アプリケーションを実行するコマンドを指定
ENTRYPOINT ["java", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]

# # 開発時のホットリロード用コマンド
# CMD ["mvn", "spring-boot:run"]

# アプリ実行時にポート指定
EXPOSE 8080
