FROM tomcat:8-jre8

MAINTAINER "valaxytech@gmail.com"

# Optional: clear default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR into Tomcat
COPY target/webapp.war /usr/local/tomcat/webapps/


EXPOSE 8080
