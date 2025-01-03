FROM maven AS build
WORKDIR /maven
RUN git clone https://github.com/Nandakumarnk12/Application1.git /maven
RUN  mvn clean install

FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /maven/target/app-0.0.1-SNAPSHOT.war /app/app-0.0.1-SNAPSHOT.war
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
EXPOSE 8080
