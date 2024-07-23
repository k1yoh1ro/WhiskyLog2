FROM eclipse-temurin:21 as builder

WORKDIR /workspace

COPY . .

RUN ./mvnw clean package

CMD ["./mvnw", "spring-boot:run"]
