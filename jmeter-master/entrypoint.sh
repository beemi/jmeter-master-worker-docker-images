#!/bin/sh -e

run_file_if_present() {
  if [ -f $1 ]
  then
    echo "Running $1..."
    $1
  fi
}

on_exit() {
  TEST_FAILED=$?
  run_file_if_present /opt/jaitechltd/scripts/exit.sh
  [ $TEST_FAILED -eq 0 ] && exit
  echo "Load test failed. Exiting..."
  exit 1
}
trap on_exit 0

hostIp=$(hostname -i)
dateTime=$(date +%Y-%m-%d-%H-%M-%S)

echo "Starting load test from master... [${hostIp}] on ${dateTime}"

export JVM_ARGS="-Xmn512m -Xms512m -Xmx512m"
echo "JVM_ARGS=${JVM_ARGS}"

#run_file_if_present /opt/jaitechltd/scripts/pre-test.sh
run_file_if_present /opt/jaitechltd/scripts/test.sh
#run_file_if_present /opt/jaitechltd/scripts/post-test.sh

echo "Finished load test"
