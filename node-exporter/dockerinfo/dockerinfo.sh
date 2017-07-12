#!/bin/sh

# Collect Docker Volume Group Space Information
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_size_bytes " substr($4, 1, length($4)-1)}' >/tmp/docker_info.prom
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_data_percent_full " $5}'                  >>/tmp/docker_info.prom
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_meta_percent_full " $6}'                  >>/tmp/docker_info.prom
echo "node_docker_running_containers " $(docker ps -q |wc -l)                                                                >>/tmp/docker_info.prom
echo "node_docker_last_successful_update{year=\"`date +%Y`\", month=\"`date +%m`\"}, day=\"`date +%d`\"}, hour=\"`date +%H`\"}, minute=\"`date +%M`\"}, second=\"`date +%S`\"} " `date +%s` >>/tmp/docker_info.prom

mv /tmp/docker_info.prom /var/lib/node_exporter/textfile_collector
