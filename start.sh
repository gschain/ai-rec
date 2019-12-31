#!/bin/bash

MAIN_CLASS=com.mininglamp.ai.rec.server.APIServer
JAR_NAME=ai-rec.jar

SH_PATH=$(cd "$(dirname "$0")"; pwd)
SERVER_HOME=$SH_PATH/..
CONF_PATH=$SERVER_HOME/conf/config.properties
LOG4J_PATH=$SERVER_HOME/conf/log4j.properties

JAVA_OPTS="-server -Xms3G -Xmx3G -Xss256k -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+UseParallelOldGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=dump.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:$SERVER_HOME/logs/gc.log -XX:NewSize=1G -XX:MaxNewSize=1G"

java $JAVA_OPTS -DSERVER_HOME=$SERVER_HOME  -cp $SERVER_HOME/$JAR_NAME:$SERVER_HOME/lib/* $MAIN_CLASS $CONF_PATH  $LOG4J_PATH
