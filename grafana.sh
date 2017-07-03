#!/bin/sh
oc new-app grafana/grafana
oc rollout pause dc/grafana

echo "apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: grafana-etc
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 4Gi" | oc create -f -

echo "apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: grafana-log
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 4Gi" | oc create -f -

echo "apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: grafana-lib
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 4Gi" | oc create -f -

# oc set volume dc/grafana --add --overwrite --name=grafana-volume-1 --mount-path=/etc/grafana --type persistentVolumeClaim --claim-name=grafana-etc
#oc set volume dc/grafana --add --overwrite --name=grafana-volume-2 --mount-path=/var/lib/grafana --type persistentVolumeClaim --claim-name=grafana-lib
#oc set volume dc/grafana --add --overwrite --name=grafana-volume-3 --mount-path=/var/log/grafana --type persistentVolumeClaim --claim-name=grafana-log

oc volume dc/grafana --remove --name=grafana-volume-1  #Some strange fix to make grafana work
oc volume dc/grafana --remove --name=grafana-volume-2  #Some strange fix to make grafana work

oc rollout resume dc grafana
oc expose svc grafana
