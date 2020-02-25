FROM openjdk:8-jdk-alpine as build

LABEL "maintainer"="hongjc423@gmail.com"
LABEL "git"="https://github.com/hongjun423"

WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)


FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target
COPY --from=build ${DEPENDENCY} /app/lib
# COPY --from=build ${DEPENDENCY}/dependency/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/dependency/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/dependency/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]


# ARG DIR=/tmp/application
# ARG DIR=/tmp/application

# VOLUME ["./", "/tmp/application"]


# RUN ["./mvnw", "clean", "package"]

# ARG JAR_FILE=./target/*.jar
# COPY ${JAR_FILE} /tmp/app.jar

# EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/lib/d2-clone-0.0.1.jar"]