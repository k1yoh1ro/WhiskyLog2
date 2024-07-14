FROM eclipse-temurin:21 as builder

# JARファイルを作成するためにMavenを使用する
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Maven Wrapperを使ってプロジェクトをビルドする
RUN ./mvnw install

# JARファイルをコピーする
COPY target/backend-0.0.1-SNAPSHOT.jar app.jar

# アプリケーションを実行する
ENTRYPOINT ["java", "-jar", "/app.jar"]