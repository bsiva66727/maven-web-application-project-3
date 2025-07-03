# Base image
FROM ubuntu:20.04

# Set environment variables
ENV MAVEN_VERSION=3.3.9
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common curl unzip git openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Maven
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    | tar -xz -C /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven

# Create working directory
WORKDIR /app

# Clone Git repository (update with your repo URL)
RUN git clone https://github.com/bsiva66727/maven-web-application-project-3.git

# Run Maven build and SonarQube analysis (update details as needed)
RUN mvn clean verify sonar:sonar \
    -Dsonar.host.url=http://10.128.0.5:9000
    
FROM tomcat:8.0.20-jre8
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
