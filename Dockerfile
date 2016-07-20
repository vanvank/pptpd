FROM centos:6.7
RUN yum -y update
RUN touch /var/lib/rpm/* ; yum -y install ppp* pptp* iptables
COPY pptpd-1.4.0-1.el6.x86_64.rpm /tmp/
RUN cd /tmp ;touch /var/lib/rpm/*; yum -y localinstall pptpd-1.4.0-1.el6.x86_64.rpm

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh
RUN touch /var/lib/rpm/*;yum -y install rsyslog
COPY pptpd.conf /etc/pptpd.conf
COPY options.pptpd /etc/ppp/options.pptpd
COPY chap-secrets /etc/ppp/chap-secrets

RUN touch /var/lib/rpm/*;yum install python-setuptools -y
RUN easy_install supervisor
COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord","-c","/etc/supervisord.conf"]
