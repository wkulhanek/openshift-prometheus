#!/bin/sh
oc project prometheus
if [ "$?" != "0" ]; then
  oc new-project prometheus --display-name="Prometheus Monitoring"
fi
oc create -f prometheus.yaml
oc new-app --template=prometheus
