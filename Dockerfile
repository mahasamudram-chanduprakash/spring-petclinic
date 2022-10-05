# syntax=docker/dockerfile:1

FROM eclipse-temurin:11-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN sed -i 's/\r$//' mvnw
RUN ./mvnw dependency:resolve

COPY src ./src
RUN ./mvnw spring-javaformat:apply
CMD ["./mvnw", "spring-boot:run"]