FROM    centos:8
LABEL   maintainer="var-dev@github"
LABEL   cisco.descriptor-schema-version="2.12" \
        cisco.info.name="rsyslog" \
        cisco.info.description="Cisco iox rsyslog" \
        cisco.info.version="0.1" \
        cisco.info.author-link=" https://github.com/var-dev/iox-rsyslog " \
        cisco.info.author-name="var-dev" \
        cisco.type=docker \
        cisco.cpuarch=x86_64 \
        cisco.resources.profile=custom \
        cisco.resources.cpu=800 \
        cisco.resources.memory=256 \
        cisco.resources.disk=10 \
        cisco.resources.network.0.interface-name=eth0 \
	cisco.monitor.script="healthprobe.sh" \
	cisco.startup.rootfs="rootfs.tar" \
	cisco.startup.target=["/bin/runapp.sh start"]
	
RUN     yum -y install wget \
     && cd /etc/yum.repos.d/ \
     && wget http://rpms.adiscon.com/v8-stable/rsyslog.repo
RUN     yum -y install rsyslog \
        rsyslog-elasticsearch \
#        rsyslog-imptcp \
#	rsyslog-imrelp \
	rsyslog-mmjsonparse \
#        rsyslog-omrelp \
	rsyslog-omstdout \
	rsyslog-pmciscoios
#     && rm /etc/rsyslog.d/listen.conf
COPY    rsyslog.conf /etc/rsyslog.conf
COPY    healthprobe.sh /bin/healthprobe.sh
COPY    runapp.sh /bin/runapp.sh
