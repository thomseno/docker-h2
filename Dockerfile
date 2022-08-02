FROM openjdk:8-jre-alpine

LABEL org.opencontainers.image.authors="oliver@die-thomsens.de"

ARG H2_VERSION

RUN apk add --no-cache curl

ENV DOWNLOAD_URL https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar

RUN curl ${DOWNLOAD_URL} -o h2.jar

WORKDIR /
ENTRYPOINT java $JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 -cp h2.jar org.h2.tools.Server -web -webAllowOthers -tcp -tcpAllowOthers -ifNotExists -baseDir /h2-data

EXPOSE 8082 9092

VOLUME /h2-data
