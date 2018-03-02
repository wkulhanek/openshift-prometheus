#!/bin/bash
export VERSION=0.15.2
docker build . -t wkulhanek/node-exporter:latest
docker tag wkulhanek/node-exporter:latest wkulhanek/node-exporter:${VERSION}
docker push wkulhanek/node-exporter:latest
docker push wkulhanek/node-exporter:${VERSION}
