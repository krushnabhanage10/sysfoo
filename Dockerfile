FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM tomcat:8-jre8 
# copy war file on to container 
COPY --from=build /home/app/target/sysinfo.war /usr/local/tomcat/webapps/
