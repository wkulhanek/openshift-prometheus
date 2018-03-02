#!/bin/bash
export VERSION=2.1.0
docker build . -t wkulhanek/prometheus:latest
docker tag wkulhanek/prometheus:latest wkulhanek/prometheus:${VERSION}
docker push wkulhanek/prometheus:latest
docker push wkulhanek/prometheus:${VERSION}
