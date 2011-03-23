#!/bin/bash

if ps ax | grep uniq_name_simple_daemon | grep -vq grep
then
  echo "uniq_name_simple_daemon is already running"
else
  echo "starting uniq_name_simple_daemon"
  ./uniq_name_simple_daemon
fi
