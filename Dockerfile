FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app

COPY server/pom.xml .
COPY server/src ./src

RUN mvn clean package -DskipTests

FROM tomcat:8-jre8
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
