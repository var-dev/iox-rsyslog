#!/bin/sh

if [ -f /data/.env ]
then
    source /data/.env
fi

start_app() {
  while [ ${app_restart} ]; do
    echo "Starting rsyslogd"
    /usr/sbin/rsyslogd -n -f /etc/rsyslog.conf > /data/logs/rsyslog.log 2>&1 &
    pid=$!
    echo "PID=$pid"
    wait "$pid"
    sleep 1
  done
}

_term() {
  echo "Caught SIGTERM signal!"
  echo "Terminating!"
  app_restart=""
  pidof rsyslogd | xargs kill -TERM
}

trap _term SIGTERM

app_restart=true

start_app
echo "done. PID=$pid"

exit 0
