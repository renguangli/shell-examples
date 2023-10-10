#!/bin/sh
source /etc/profile
pid=$(jps -l |grep com.bonc.datac.BootStrap | awk '{print $1}') 
if [[ $pid  ]]
then
 echo $pid
else
 cd /data/meter-datac
 sh start-server.sh 
fi
