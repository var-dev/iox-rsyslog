#!/bin/sh
rm -f package.tar && \
git clone --branch=master https://github.com/var-dev/iox-rsyslog.git \
ioxclient docker package var-dev/iox-rsyslog . && \
ioxclient application install rsyslog package.tar && \
ioxclient application activate  --payload activation.json --debug on rsyslog 
