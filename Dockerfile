# syntax=docker/dockerfile:1

FROM openjdk:jdk-11.0.8_10-alpine-slim

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]