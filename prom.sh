#!/bin/sh
oc new-project prometheus --display-name="Prometheus"
oc create -f prometheus_3.5.yaml
oc new-app --template=prometheus
