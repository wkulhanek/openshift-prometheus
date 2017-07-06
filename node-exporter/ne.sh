#!/bin/sh
oc new-project exporter --display-name="Monitoring - Node Exporter"
oc create -f node-exporter-template.yaml
oc new-app node-exporter -p NAMESPACE=exporter
oc adm policy add-scc-to-user hostaccess system:serviceaccount:exporter:default

# Next line is necessary to place pods not just on worker nodes but also
# on Infranodes and Masters
# If there are still pods with a "MatchNodeSelector" error simply delete them
# and they will be recreated successfully
oc annotate namespace exporter openshift.io/node-selector=monitoring=true

# Now label all nodes with the right label for the DaemonSet to place
# a node-exporter pod on each node
oc label node node1.mon.internal monitoring-true
oc label node node2.mon.internal monitoring-true
oc label node infranode1.mon.internal monitoring-true
oc label node master1.mon.internal monitoring-true
