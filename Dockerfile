#FROM ashikm.jfrog.io/default-docker-virtual/ashik-mvn-build:latest AS maven

#WORKDIR /usr/src/app
#COPY . /usr/src/app

#RUN mvn package

FROM ashikm.jfrog.io/default-docker-remote/openjdk:11

WORKDIR /opt/app

COPY ./target/*.jar /opt/app/app.jar

ENTRYPOINT exec java -jar /opt/app/app.jar
