#!/usr/bin/env bash
set -e
# check that expected UDP ports are open
for p in 514 ; do
  if ! lsof -i udp:${p} -F c | grep rsyslogd; then
    exit 1;
  fi
done
