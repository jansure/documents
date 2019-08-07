#!/bin/sh
cd /usr/local/soft/hadoop
endTime=$(date -d "+60 seconds" +"%Y-%m-%d %H:%M:%S")
#转换成时间戳格式
t2=`date -d "$endTime" +%s`

while true
do
    sleep 10
    currentTime=$(date "+%Y-%m-%d %H:%M:%S")
    t1=`date -d "$currentTime" +%s`
    if [ $t1 -gt $t2 ] ; then
       sbin/stop-all.sh
       exit 0
       echo "hadoop stop..."
    else
       echo "hadoop running ...."
    fi
done



#启动命令： nohup  ./check_hadoop.sh >check_hadoop.log 2>&1 &

#参考资料----------------------------------------------------------------
#一月前
historyTime=$(date "+%Y-%m-%d %H" +d '1 month ago')
echo ${historyTime}
historyTimeStamp=$(date -d "$historyTime" +%s)
echo ${historyTimeStamp}
#一周前
$(date "+%Y-%m-%d %H" -d '7 day ago')
 
#本月一月一日
date_this_month=`date +%Y%m01`
 
#一天前
date_today=`date -d '1 day ago' +%Y%m%d`
 
#一小时前
$(date "+%Y-%m-%d %H" -d '-1 hours')