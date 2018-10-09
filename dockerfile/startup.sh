#!/bin/sh
if !(which java 2>/dev/null); then
    echo '请安装java环境'
    exit
fi
 
 
 
PROJECT_NAME="$1"
ENV="$2"
JAVALOG_DIR="/opt/project/logs"
DT=`date +"%Y%m%d_%H%M%S"`
MEM_OPTS="-Xms2048m -Xmx2048m -Xmn1024m"
#GC_OPTS="$GC_OPTS -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=60 -XX:CMSTriggerRatio=70"
#GC_OPTS="$GC_OPTS -Xloggc:${JAVALOG_DIR}/gc_${DT}.log"
#GC_OPTS="$GC_OPTS -XX:+PrintGCDateStamps -XX:+PrintGCDetails"
GC_OPTS="$GC_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${JAVALOG_DIR}/heapdump_${DT}.hprof"
START_OPTS="$START_OPTS -Djava.io.tmpdir=${JAVALOG_DIR}"
 
 
java $MEM_OPTS $GC_OPTS $JMX_OPTS $START_OPTS -Dcom.sun.management.jmxremote -Dspring.profiles.active=${ENV} -jar -server   ${PROJECT_NAME}.jar