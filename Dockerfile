FROM tomcat:8-jre8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080
