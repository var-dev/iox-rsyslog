FROM    centos:8
LABEL   maintainer="var-dev@github"
LABEL   cisco.descriptor-schema-version="2.6" \
        cisco.info.name="rsyslog" \
        cisco.info.description="Cisco iox rsyslog" \
        cisco.info.version="0.1" \
        cisco.info.author-link=" https://github.com/var-dev/iox-rsyslog " \
        cisco.info.author-name="var-dev" \
        cisco.type=docker \
        cisco.cpuarch=x86_64 \
        cisco.resources.profile=custom \
        cisco.resources.cpu=800 \
        cisco.resources.memory=2048 \
        cisco.resources.disk=10 \
        cisco.resources.network.0.interface-name=eth0 \
	cisco.resources.network.0.ports.udp=514 \
#	cisco.monitor.script="healthprobe.sh" \
	cisco.startup.rootfs="rootfs.tar" \
	cisco.startup.target="/bin/sh"
#	cisco.startup.target="/usr/sbin/rsyslogd"

RUN     curl http://rpms.adiscon.com/v8-stable/rsyslog.repo --output /etc/yum.repos.d/rsyslog.repo \
    &&  yum -y install \
        net-tools \
        rsyslog-8.2010.0-1.el8.x86_64 \
        rsyslog-elasticsearch-8.2010.0-1.el8.x86_64 \
	rsyslog-mmjsonparse-8.2010.0-1.el8.x86_64 \
        rsyslog-mmnormalize-8.2010.0-1.el8.x86_64 \
	rsyslog-pmciscoios-8.2010.0-1.el8.x86_64

COPY    rsyslog.conf /etc/rsyslog.conf
COPY    healthprobe.sh /bin/healthprobe.sh
COPY    runapp.sh /bin/runapp.sh
