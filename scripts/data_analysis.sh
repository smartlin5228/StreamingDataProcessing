#!/bin/bash

batchid=`cat /home/cloudera/project/logs/current-batch.txt`
LOGFILE=/home/cloudera/project/logs/log_batch_$batchid

echo "Running hive script for data analysis..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/cloudera/project/scripts/data_analysis.hql

sh /home/cloudera/project/scripts/data_export.sh

echo "Incrementing batchid..." >> $LOGFILE

batchid=`expr $batchid + 1`
echo -n $batchid > /home/cloudera/project/logs/current-batch.txt
