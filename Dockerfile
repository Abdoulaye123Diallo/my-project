# Étape 1 : Construction de l'application
FROM eclipse-temurin:17-jdk as builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# Étape 2 : Image finale pour exécuter l'application
FROM eclipse-temurin:17-jre
COPY --from=builder /app/target/my-project.jar /app/application.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/my-project.jar"]
