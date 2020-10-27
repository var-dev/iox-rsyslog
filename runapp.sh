#!/bin/sh

if [ -f /data/.env ]
then
    source /data/.env
fi

start_app() {
    /usr/sbin/rsyslogd -n -f /etc/rsyslog.conf > /data/logs/rsyslog.log 2>&1
}

_term() {
  echo "Caught SIGTERM signal!"
  kill -TERM "$pid" 2>/dev/null
}                              

trap _term SIGTERM

case "$1" in
start)
        echo -n "Starting rsyslogd"
        start_app
        echo "done."
        ;;

stop)
        echo -n "Stopping rsyslogd"
        pidof rsyslogd | xargs kill -15
        : exit 0
        echo "done."
        ;;

force-reload|restart)
        echo "Reconfiguring rsyslogd"
        echo "done."
        ;;

*)
        echo "Usage: /bin/runapp.sh {start|stop|restart}"
        exit 1
        ;;
esac

exit 0
