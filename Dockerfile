FROM openjdk:8-jre-alpine

LABEL org.opencontainers.image.authors="oliver@die-thomsens.de"

ARG H2_VERSION

RUN apk add --no-cache curl

ENV DOWNLOAD http://central.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar

RUN curl ${DOWNLOAD} -o h2.jar

WORKDIR /
ENTRYPOINT java $JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 -jar h2.jar -web -webAllowOthers -tcp -tcpAllowOthers -baseDir /h2-data

EXPOSE 8082 9092

VOLUME /h2-data
