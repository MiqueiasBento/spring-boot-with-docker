FROM openjdk:17-jdk-alpine
WORKDIR /app

COPY . .

# Cria o .jar da aplicacao
RUN mvn clean install -DskipTests

WORKDIR /app

COPY target/*.jar /app/app.jar
EXPOSE 8080

CMD ["java", "-jar", "/app/app.jar"]
