#!/bin/sh
oc project prometheus
if [ "$?" != "0" ]; then
  oc new-project prometheus --display-name="Prometheus Monitoring"
  oc annotate namespace prometheus openshift.io/node-selector=""
fi
oc new-app -f prometheus.yaml --param ROUTER_PASSWORD=$(oc set env dc router -n default --list|grep STATS_PASSWORD|awk -F"=" '{print $2}')
oc adm policy add-scc-to-user privileged prometheus
