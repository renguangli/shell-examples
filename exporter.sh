#!/bin/sh
codes=`cat codes.txt`
dir=szls
host=127.0.0.1
port=8086
username=cloudiip
password=cloudiip@1234
format=csv
database=iot_point
start='2022-08-01 00:00:00'
end='2023-09-01 00:00:00'
for code in $codes
do
influxSQL="select time,code,value from iot_fengguangchu where code ='$code' and time >= '$start' and time <= '$end' tz('Asia/Shanghai')"
echo $influxSQL
influx -precision rfc3339 -host $host -port $port -username $username -password $password -format $format -database $database -execute "$influxSQL" > $dir/${code}.csv
done
