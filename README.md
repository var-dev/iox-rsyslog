# iox-rsyslog
## Build. Install. Start.
```
docker build -t iox-rsyslog . && \
rm -f package.* rootfs.tar && \
ioxclient docker package iox-rsyslog . && \
ioxclient application install rsyslog package.tar && \
ioxclient application activate  --payload activation.json rsyslog && \
ioxclient app appdata upload rsyslog ../rsyslog-include.conf rsyslog-include.conf && \
ioxclient application start rsyslog
```
## Uninstall.
```
ioxclient application stop rsyslog && \
ioxclient application deactivate rsyslog && \
ioxclient application uninstall rsyslog
```
## Upgrade.
```
docker build -t iox-rsyslog . && \
rm -f package.* rootfs.tar && \
ioxclient docker package iox-rsyslog . && \
ioxclient application stop rsyslog && \
ioxclient application deactivate rsyslog && \
ioxclient application upgrade rsyslog package.tar && \
ioxclient application activate  --payload activation.json rsyslog && \
ioxclient app appdata upload rsyslog ../rsyslog-include.conf rsyslog-include.conf && \
ioxclient application start rsyslog
```
