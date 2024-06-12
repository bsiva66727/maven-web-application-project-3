
# Build Project Using Maven

Maven is java based build tool to generate executable 

packages(jar, ear,war) for java based projects.

```bash
mvn clean package
```

## Create Docker Image#####
Docker is a continerization tool.Using docker we can deploy our applications as 

containers using docker images. Containers contains application code and also the softwares,

config files whatever is required for our application to run.

Create docker image using Dockerfile


``` git clone https://github.com/chinni4321/maven-web-application-project-3.git
cd maven-web-application-project-3/
mvn clean package
docker build -t maven-web .
docker run -dt -p 9090:8080 maven-web
http://3.17.56.254:9090/maven-web-application/
```


