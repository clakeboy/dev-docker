#!/bin/sh
## 零点执行该脚本
## Nginx 日志文件所在的目录
LOGS_PATH=/var/log/nginx
## 获取昨天的 yyyy-MM-dd
YESTERDAY=$(date +"%Y-%m-%d")

#2.遍历子目录
for DIR in `ls $LOGS_PATH`
do
    if [ -d $LOGS_PATH/$DIR ]
    then
        ## 移动文件
        mv ${LOGS_PATH}/$DIR/access.log ${LOGS_PATH}/$DIR/access_${YESTERDAY}.log
    fi
done

## 移动文件
#mv ${LOGS_PATH}/access.log ${LOGS_PATH}/access_${YESTERDAY}.log
## 向 Nginx 主进程发送 USR1 信号。USR1 信号是重新打开日志文件
kill -USR1 $(cat /var/run/nginx.pid)