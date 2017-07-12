#!/bin/sh

# Collect Docker Volume Group Space Information
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_size_bytes " substr($4, 1, length($4)-1)}' >/tmp/docker_info.prom
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_data_percent_full " $5}'                  >>/tmp/docker_info.prom
/sbin/lvs docker-vg --units b |grep docker-pool|awk -c '{print "node_docker_volume_meta_percent_full " $6}'                  >>/tmp/docker_info.prom
echo "node_docker_running_containers " $(docker ps -q |wc -l)                                                                >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_epoch `date +%s`"                                                                   >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_year `date +%Y`"                                                                    >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_month `date +%m`"                                                                   >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_day `date +%d`"                                                                     >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_hour `date +%H`"                                                                    >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_minute `date +%M`"                                                                  >>/tmp/docker_info.prom
echo "node_docker_last_successful_update_second `date +%S`"                                                                  >>/tmp/docker_info.prom

mv /tmp/docker_info.prom /var/lib/node_exporter/textfile_collector
