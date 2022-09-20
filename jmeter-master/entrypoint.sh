#!/bin/bash

set -e
freeMem=$(awk '/MemFree/ { print int($2/1024) }' /proc/meminfo)
s=$(($freeMem / 10 * 8))
x=$(($freeMem / 10 * 8))
n=$(($freeMem / 10 * 2))

export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"
echo "JVM_ARGS=${JVM_ARGS}"


containerIp=$(hostname -i)
echo "Starting jmeter master on ${containerIp} at $(date +%T)"

jmeter \
    -n -t test.jmx \
    -l /jmeter-results/output.csv \
    -e -o /jmeter-results/ \
    -R$combined && echo "All done and current time: $(date +%T)"

echo "Finished load test"
