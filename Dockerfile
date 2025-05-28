FROM maven:3.9.9-eclipse-temurin-11-alpine as build

COPY . /app

WORKDIR /app

RUN mvn clean package

FROM tomcat:11.0.6-jdk21-temurin-noble

# This is the particular port where the docker container will be listening on
EXPOSE 8080

# THis basically copies the result of the node container and paste it in the nginx html folder
COPY --from=build /app/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps