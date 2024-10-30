# Étape 1 : Construction de l'application
FROM eclipse-temurin:17-jdk as builder
WORKDIR /app
COPY . .
# Donner les permissions d'exécution à mvnw
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Étape 2 : Image finale pour exécuter l'application
FROM eclipse-temurin:17-jre
COPY --from=builder /app/target/wokflow-project-1.0-SNAPSHOT.war /app/application.war
EXPOSE 8080
CMD ["java", "-jar", "/app/application.war"]
