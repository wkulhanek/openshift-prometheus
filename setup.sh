#!/bin/sh
oc project prometheus
if [ "$?" != "0" ]; then
  oc new-project prometheus --display-name="Prometheus Monitoring"
fi
oc new-app -f prometheus.yaml --param ROUTER_PASSWORD=$(oc set env dc router -n default --list|grep STATS_PASSWORD|awk -F"=" '{print $2}')
