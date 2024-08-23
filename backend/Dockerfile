# アプリ実行前の準備の為のベースイメージ
FROM maven:3.9.8-eclipse-temurin-21-alpine as deps

# 作業ディレクトリを作成し、そこに移動する
WORKDIR /app

# アプリのビルド
COPY . .
RUN mvn -B install

# アプリケーションを実行するコマンドを指定
# CMD ["sh", "-c", "java $JAVA_OPTS -jar target/backend-0.0.1-SNAPSHOT.jar"]
CMD ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-cp", "target/classes:target/dependency/*", "com.whiskylog.backend.BackendApplication"]

# アプリ実行時にポート指定
EXPOSE 8080
EXPOSE 5005
