FROM amazonlinux AS lin
WORKDIR /linux
RUN git clone https://github.com/Nandakumarnk12/Application1.git /linux

FROM maven AS build
WORKDIR /linux
COPY --from=lin /linux /linux
RUN mvn clean install


FROM openjdk:17-alpine
WORKDIR /linux

COPY --from=build /linux/target/app-0.0.1-SNAPSHOT.war /linux

CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]

EXPOSE 8080
