#!/bin/sh
cd /usr/local/soft/hadoop
endTime=$(date -d "+60 seconds" +"%Y-%m-%d %H:%M:%S")
#转换成时间戳格式
t2=`date -d "$endTime" +%s`                                                                                                                                                                                                                X 
while true
do
    #检测flume状态 
    sleep 10
    pid=`lsof -i:52020 |  awk 'NR==2{print $2}'`
    if [ -n "$pid" ]
    then
        echo "kill -9 pid:" $pid
        kill -9 $pid
        echo "flume stop ..."
    fi

    #检测hadoop状态
    currentTime=$(date "+%Y-%m-%d %H:%M:%S")
    t1=`date -d "$currentTime" +%s`
    if [ $t1 -gt $t2 ] ; then
       sbin/stop-all.sh
       echo "hadoop stop..."
    else
       echo "hadoop running ...."
    fi
done

#启动命令： nohup  ./kill_flume_hdfs.sh >kill_flume_hdfs.log 2>&1 &



