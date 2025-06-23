FROM tomcat:8-jre8

MAINTAINER "valaxytech@gmail.com"

# Remove default web apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY webapp.war /usr/local/tomcat/webapps/

# Tomcat runs by default on port 8080
EXPOSE 8080
