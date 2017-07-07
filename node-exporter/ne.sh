#!/bin/sh
# Create a new project - recommended because of the Node Selector
# that needs to be set
oc new-project exporter --display-name="Monitoring - Node Exporter"

# Next line is necessary to place pods not just on worker nodes but also
# on Infranodes and Masters
# If some pods don't start with a "MatchNodeSelector" error simply delete them
# and they will be recreated successfully
oc annotate namespace exporter openshift.io/node-selector=monitoring=true

# The Service Account running the node selector pods needs the SCC `hostaccess`:
oc adm policy add-scc-to-user hostaccess system:serviceaccount:exporter:default

# Label all nodes with the right label for the DaemonSet to place
# a node-exporter pod on each node
# Obviously replace these node DNS names with your configuration
oc label node node1.mon.internal      monitoring=true
oc label node node2.mon.internal      monitoring=true
oc label node infranode1.mon.internal monitoring=true
oc label node master1.mon.internal    monitoring=true

# Import the template and create the DaemonSet
oc create -f node-exporter-template.yaml
oc new-app node-exporter -p NAMESPACE=exporter

