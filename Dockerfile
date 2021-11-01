FROM ashik.jfrog.io/default-docker-virtual/task/custommvn:latest AS maven

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mvn package

FROM ashik.jfrog.io/default-docker-remote/openjdk:11

WORKDIR /opt/app

COPY --from=maven /usr/src/app/target/*.jar /opt/app/app.jar

ENTRYPOINT exec java -jar /opt/app/app.jar
