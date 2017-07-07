#!/bin/sh

# Collect Docker Volume Group Space Information
docker info 2>/dev/null | grep "Data Space Total"     | awk '{print "node_docker_volume_size_bytes      "int($4*1024*1024)}'  >/tmp/docker_size.prom
docker info 2>/dev/null | grep "Data Space Used"      | awk '{print "node_docker_volume_used_bytes      "int($4*1024*1024)}' >>/tmp/docker_size.prom
docker info 2>/dev/null | grep "Data Space Available" | awk '{print "node_docker_volume_available_bytes "int($4*1024*1024)}' >>/tmp/docker_size.prom
mv /tmp/docker_size.prom /var/lib/node_exporter/textfile_collector

# Log last successful update - if "docker info" hangs this script will also hang and no update will be written
echo "node_docker_last_successful_update `date +%s`" >/var/lib/node_exporter/textfile_collector/docker_last_update.prom

