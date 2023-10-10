#!/bin/bash
date=$(date)
pid=$(ps -ef|grep influxd|grep -v grep|grep -v listen.sh|awk '{print $2}')
if [[ $pid ]];then
  echo "$date the influxd is running, pid is $pid"
else
  echo "$date the influxd is stop, restarting"
  cd /data/disk01/influxdb/bin
  ./start.sh
fi

#echo "" > /data/disk01/influxdb/bin/logs/influxd.log

