# docker-h2

Dockerized H2 database.

## Features

* Inspired by [oscarfonts/h2](https://github.com/oscarfonts/docker-h2).
* Using [eclipse-temurin](https://hub.docker.com/_/eclipse-temurin).
* Only packing H2 jar-file into Docker image (retrieved from Maven Central).
* H2-DATA location on /h2-data
* Exposing default ports 8082 / 9092

## Builds

builds on [dockerhub](https://hub.docker.com/r/thomseno/h2/) and [GitHub Container Registry](https://github.com/thomseno/docker-h2/pkgs/container/h2) :

* `2.3.232 / latest`
* `2.2.224`
* `2.1.214`
* `2.0.206`
* `1.4.200`

## Running

Get the image:

```
docker pull thomseno/h2
```
or 
```
docker pull ghcr.io/thomseno/h2
```

Run as a service, exposing ports 9092 (TCP database server) and 8082 (web interface) and mapping data volume to host:

```
docker run -d -p 9092:9092 -p 8082:8082 -v /path/to/local/h2-data:/h2-data --name=myH2Server thomseno/h2
```

By setting the JAVA_OPTS environment variable you can for example set the memory parameters of the JVM:

```
docker run -d -e JAVA_OPTS='-Xmx256m -Xms256m' -p 9092:9092 -p 8082:8082 -v /path/to/local/h2-data:/h2-data --name=myH2Server thomseno/h2
```
