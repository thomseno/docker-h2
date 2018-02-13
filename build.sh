#!/bin/bash
H2_VERSION=1.4.196
docker build --force-rm=true --no-cache=true --tag=h2 --tag=h2:$H2_VERSION --build-arg H2_VERSION=$H2_VERSION .
