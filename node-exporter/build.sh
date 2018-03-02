#!/bin/bash
docker build . -t wkulhanek/node-exporter:latest
docker tag wkulhanek/node-exporter:latest wkulhanek/node-exporter:0.15.2
docker push wkulhanek/node-exporter:latest
docker push wkulhanek/node-exporter:0.15.2
