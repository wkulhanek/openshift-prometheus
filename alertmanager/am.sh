#!/bin/sh
# Change into the Prometheus project
oc project prometheus

oc create -f alertmanager.yaml
oc new-app --template=alertmanager -p VOLUME_CAPACITY=4Gi -p "WEBHOOK_URL="
