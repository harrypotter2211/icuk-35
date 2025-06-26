# Use JDK-only image for runtime (smaller size)
FROM eclipse-temurin:17-jdk

# Create working directory
WORKDIR /app

# Copy built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
