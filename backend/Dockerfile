FROM maven:latest
WORKDIR /workspace/backend
COPY . .
RUN mvn clean install
EXPOSE 8080
EXPOSE 5005
CMD ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]