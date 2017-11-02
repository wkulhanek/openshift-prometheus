#!/bin/bash
docker build . -t wkulhanek/prometheus:latest
docker tag wkulhanek/prometheus:latest wkulhanek/prometheus:2.0.0-rc.2
docker push wkulhanek/prometheus:latest
docker push wkulhanek/prometheus:2.0.0-rc.2
