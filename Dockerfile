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
        cisco.resources.cpu=54 \
        cisco.resources.memory=64 \
        cisco.resources.disk=2 \
        cisco.resources.network.0.interface-name=eth0
RUN     yum -y install wget \
     && cd /etc/yum.repos.d/ \
     && wget http://rpms.adiscon.com/v8-stable/rsyslog.repo
RUN	    yum -y install rsyslog \
	      rsyslog-elasticsearch \
   	    rsyslog-imptcp \
	      rsyslog-imrelp \
	      rsyslog-mmjsonparse \
        rsyslog-omrelp \
	      rsyslog-omstdout \
	      rsyslog-pmciscoios \
     && rm /etc/rsyslog.d/listen.conf
COPY    rsyslog.conf /etc/rsyslog.conf
