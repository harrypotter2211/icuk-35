# Use official Tomcat 8 with JRE 8
FROM tomcat:8-jre8

# Remove default apps from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT.war so it's served at /
COPY target/webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port 8080
EXPOSE 8080
