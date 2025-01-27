FROM maven:3.9.5-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
CMD ["mvn", "test"]
