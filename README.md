git clone https://github.com/chinni4321/maven-web-application-project-3.git
cd maven-web-application-project-3/
mvn clean package
docker build -t maven-web .
docker run -dt -p 9090:8080 maven-web
