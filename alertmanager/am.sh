#!/bin/sh
oc new-project alertmanager --display-name="Monitoring - Alert Manager"
oc create -f alertmanager.yaml
oc new-app alertmanager -p NAMESPACE=alertmanager -p VOLUME_CAPACITY=4Gi
