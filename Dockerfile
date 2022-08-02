FROM eclipse-temurin:11-jre

LABEL org.opencontainers.image.authors="oliver@die-thomsens.de"

ARG H2_VERSION

ENV DOWNLOAD_URL https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar

RUN curl ${DOWNLOAD_URL} -o h2.jar

# set Java 11 memory settings
ENV JAVA_XOPTS -XshowSettings:vm -XX:MaxRAMPercentage=75

WORKDIR /
ENTRYPOINT java ${JAVA_XOPTS} $JAVA_OPTS -cp h2.jar org.h2.tools.Server -web -webAllowOthers -tcp -tcpAllowOthers -ifNotExists -baseDir /h2-data

EXPOSE 8082 9092

VOLUME /h2-data
