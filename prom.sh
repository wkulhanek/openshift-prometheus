#!/bin/sh
oc new-project monitoring
oc create -f prometheus_3.5.yaml
oc new-app prometheus -p NAMESPACE=monitoring
