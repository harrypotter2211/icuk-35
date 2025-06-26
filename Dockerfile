# ======== Stage 1: Build the WAR using Maven ========
FROM maven:3.8.6-openjdk-8 AS build

# Set working directory inside the container
WORKDIR /app

# Copy the entire project (POM + src)
COPY . .

# Build the WAR file (skipping tests if needed)
RUN mvn clean package -DskipTests


# ======== Stage 2: Deploy WAR in Tomcat ========
FROM tomcat:8-jre8

# Clean the default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR from Maven build and rename it to ROOT.war (for deployment at "/")
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
