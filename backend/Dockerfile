# ベースイメージとして OpenJDK を使用
FROM openjdk:21-jdk-slim

# アプリケーション JAR ファイルの配置先を作成
WORKDIR /app

# JAR ファイルをコンテナにコピー
COPY target/backend-0.0.1-SNAPSHOT.jar app.jar

# デバッグ用のポートを公開（必要に応じて）
EXPOSE 8080
EXPOSE 5005

# デバッグモードで Java アプリケーションを実行
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
