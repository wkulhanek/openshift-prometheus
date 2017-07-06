#!/bin/sh
oc new-project exporter --display-name="Monitoring - Node Exporter"
oc create -f node-exporter.yaml
oc new-app node-exporter -p NAMESPACE=exporter
oc adm policy add-scc-to-user privileged system:serviceaccount:exporter:default

# Next line is necessary to place pods not just on worker nodes but also
# on Infranodes and Masters
oc annotate namespace exporter openshift.io/node-selector=monitoring=true
oc label node node1.mon.internal monitoring-true
oc label node node2.mon.internal monitoring-true
oc label node infranode1.mon.internal monitoring-true
oc label node master1.mon.internal monitoring-true
