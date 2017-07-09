#!/bin/sh
# Change into the Prometheus project
oc project prometheus

# Import the template and create the DaemonSet
oc create -f alertmanager.yaml
oc new-app --template=alertmanager -p VOLUME_CAPACITY=4Gi
