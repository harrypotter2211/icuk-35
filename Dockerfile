# Stage 1: Build the WAR using Maven
FROM maven:3.8.6-openjdk-8 AS build

# Set work directory inside the container
WORKDIR /app

# Copy your project files to the container
COPY . .

# Run the Maven build to generate the WAR
RUN mvn clean package -DskipTests

# Stage 2: Run the WAR in Tomcat
FROM tomcat:8-jre8

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from previous stage and rename it ROOT.war (to serve at /)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
