#!/bin/sh

# build version 1.4.200
BUILD_VERSION=1.4.200
docker buildx build --push --build-arg H2_VERSION=$BUILD_VERSION --tag thomseno/h2:$BUILD_VERSION --platform=linux/amd64,linux/arm64 .

# build latest version 2.0.206
BUILD_VERSION=2.0.206
docker buildx build --push --build-arg H2_VERSION=$BUILD_VERSION --tag thomseno/h2:$BUILD_VERSION --platform=linux/amd64,linux/arm64 .

# build version 2.1.214
BUILD_VERSION=2.1.214
docker buildx build --push --build-arg H2_VERSION=$BUILD_VERSION --tag thomseno/h2:$BUILD_VERSION --platform=linux/amd64,linux/arm64 .

# build version 2.2.224 / latest
BUILD_VERSION=2.2.224
docker buildx build --push --build-arg H2_VERSION=$BUILD_VERSION --tag thomseno/h2:$BUILD_VERSION --tag thomseno/h2:latest --platform=linux/amd64,linux/arm64 .
