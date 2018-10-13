#!/bin/bash
export VERSION=2.4.3
docker build . -t wkulhanek/prometheus:latest
docker tag wkulhanek/prometheus:latest wkulhanek/prometheus:${VERSION}
docker push wkulhanek/prometheus:latest
docker push wkulhanek/prometheus:${VERSION}
