# Use official Tomcat base image with JDK 21
FROM tomcat:10.1-jdk21-temurin

# Maintainer info (optional)
LABEL maintainer="bsiva667@gmail.com"

# Remove default apps from webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from Maven target directory
# Adjust if your WAR name is different
COPY target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
