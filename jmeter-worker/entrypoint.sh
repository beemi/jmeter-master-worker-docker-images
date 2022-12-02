#!/bin/bash

#export JVM_ARGS="-Xmn4G -Xms4G -Xmx4g"
#echo "JVM_ARGS=${JVM_ARGS}"

containerIp=$(hostname -i)

echo "Test started on JMeter worker ${containerIp} at $(date +%T)"

jmeter-server \
  -JGmode=asych \
  -JGasynch.batch.queue.size=200 \
  -Dserver.rmi.ssl.disable=true \
  -Dserver.rmi.localport=50000 \
  -Dserver_port=1099 \
  -Dprometheus.ip=0.0.0.0 \
  -Ljmeter.engine=ERROR
