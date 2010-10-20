#!/bin/bash

pid=$(ps ax | grep uniq_name_simple_daemon | grep -v grep | awk '{ print $1; }')

if [[ -n $pid ]]
then
  echo "stopping uniq_name_simple_daemon"
  kill -TERM $pid
else
  echo "nothing to stop"
fi
