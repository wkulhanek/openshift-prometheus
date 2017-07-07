#!/bin/sh
oc new-project prometheus --display-name="Monitoring - Prometheus"
oc create -f prometheus_3.5.yaml
oc new-app prometheus -p NAMESPACE=prometheus -p VOLUME_CAPACITY=4Gi
