FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml /app
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn clean -e -B package

FROM tomcat:8-jre8 
# copy war file on to container 
COPY --from=build /app/target/sysinfo.war /usr/local/tomcat/webapps/
