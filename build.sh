#!/bin/sh
rm -f package.tar && \
ioxclient docker package var-dev/iox-rsyslog . && \
ioxclient application install rsyslog package.tar && \
ioxclient application activate  --payload activation.json --debug on rsyslog 
