#!/bin/bash

if [ -f "/home/cloudera/project/logs/current-batch.txt" ]
then
 echo "Batch File Found!"
else
 echo -n "1" > "/home/cloudera/project/logs/current-batch.txt"
fi

chmod 775 /home/cloudera/project/logs/current-batch.txt
batchid=`cat /home/cloudera/project/logs/current-batch.txt`
LOGFILE=/home/cloudera/project/logs/log_batch_$batchid

echo "Starting daemons" >> $LOGFILE

start-all.sh
start-hbase.sh
mr-jobhistory-daemon.sh start historyserver

