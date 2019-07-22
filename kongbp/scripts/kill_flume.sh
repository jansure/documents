
#!/bin/sh
cd /usr/local/soft                                                                                                                                                                                                                    X 
while true
do
    sleep 10
    pid=`lsof -i:52020 |  awk 'NR==2{print $2}'`
    if [ -n "$pid" ]
    then
        echo "kill -9 pid:" $pid
        kill -9 $pid
        echo "flume stop ..."
        exit 0
    fi
done



#启动命令： nohup  ./check_flume.sh >check_flume.log 2>&1 &