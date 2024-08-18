# アプリ実行前の準備の為のベースイメージ
FROM maven:3.9.8-eclipse-temurin-21-alpine as deps

# 作業ディレクトリを作成し、そこに移動する
WORKDIR /app

# アプリのビルド
COPY . .
RUN mvn -B install

# デバッグモード実行設定
ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"

# アプリケーションを実行するコマンドを指定
CMD ["sh", "-c", "java $JAVA_OPTS -jar target/backend-0.0.1-SNAPSHOT.jar"]

# アプリ実行時にポート指定
EXPOSE 8080
EXPOSE 5005
