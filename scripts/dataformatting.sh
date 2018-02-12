#!/bin/bash

batchid=`cat /logs/current-batch.txt`
LOGFILE=/logs/log_batch_$batchid

echo "Placing data files from local to HDFS..." >> $LOGFILE

hadoop fs -rm -r /project/batch${batchid}/web/
hadoop fs -rm -r /project/batch${batchid}/formattedweb/
hadoop fs -rm -r /project/batch${batchid}/mob/

hadoop fs -mkdir -p /user/cloudera/project/batch${batchid}/web/
hadoop fs -mkdir -p /user/cloudera/project/batch${batchid}/mob/

hadoop fs -put /home/cloudera/project/data/web/* /user/acadgild/project/batch${batchid}/web/
hadoop fs -put /home/cloudera/project/data/mob/* /user/acadgild/project/batch${batchid}/mob/

echo "Running pig script for data formatting..." >> $LOGFILE

pig -param batchid=$batchid /home/cloudera/project/scripts/dataformatting.pig

echo "Running hive script for formatted data load..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/cloudera/project/scripts/formatted_hive_load.hql
