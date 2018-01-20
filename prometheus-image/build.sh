#!/bin/bash
docker build . -t wkulhanek/prometheus:latest
docker tag wkulhanek/prometheus:latest wkulhanek/prometheus:2.1.0
docker push wkulhanek/prometheus:latest
docker push wkulhanek/prometheus:2.1.0
