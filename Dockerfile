FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app

COPY pom.xml ./pom.xml
COPY server/pom.xml ./server/pom.xml
COPY server/src ./server/src

RUN mvn -f server/pom.xml clean package -DskipTests

FROM tomcat:8-jre8
COPY --from=build /app/server/target/*.war /usr/local/tomcat/webapps/
