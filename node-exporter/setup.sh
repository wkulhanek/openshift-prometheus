#!/bin/sh

# you should set securityContext privileged true on container part of node-exporter.yaml file to collect filesystem metrics!
# Change into the Prometheus project
oc project prometheus

# The Service Account running the node selector pods needs the SCC `hostaccess`:

# oc adm policy add-scc-to-user privileged system:serviceaccount:<NAMESPACE>:<PROJECT>
oc adm policy add-scc-to-user privileged system:serviceaccount:prometheus:default 

# Import the template and create the DaemonSet
oc create -f node-exporter-template.yaml
oc new-app --template=node-exporter

