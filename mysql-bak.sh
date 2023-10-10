#!/bin/sh
host=24.43.158.51
user=root
password=cloudiip@1234
db_names="api-creator-fgc cloudiip cloudiip-rule data_turnback fgc-apis fgc_digit fgc_prod fgc_xxc nydaj_prod portal_fgc szls-api iot_szls"
bak_time=`date +%Y%m%d`
log_path=/data/disk02/log
bak_path=/data/disk02/backup
date_7=$(date -d -7day +%Y%m%d)
echo "$(date "+%Y-%m-%-d %H:%M:%S") 开始备份数据库 ${db_name} ..." >> ${log_path}/info.log
if [[ ! -d ${bak_path}/${bak_time} ]]; then
  mkdir ${bak_path}/${bak_time}
fi
for db_name in $db_names; do
    echo "$(date "+%Y-%m-%-d %H:%M:%S") 开始备份数据库 ${db_name} ..." >> ${log_path}/info.log
    mysqldump -h${host} -u${user} -p${password} ${db_name} > ${bak_path}/${bak_time}/${db_name}.sql
    rm -rf ${bak_path}/${date_7}
    if [ "$?" == 0 ];then
        echo "$(date "+%Y-%m-%-d %H:%M:%S") 数据库 ${db_name} 备份成功." >> ${log_path}/info.log
    else
        echo "$(date "+%Y-%m-%-d %H:%M:%S") 数据库 ${db_name} 备份失败 !!" >> ${log_path}/error.log
    fi
done
