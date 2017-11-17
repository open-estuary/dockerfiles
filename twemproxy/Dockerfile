FROM openestuary/centos:5.0-full

ENV  TWEMPROXY_VERSION twemproxy_0.4.1

RUN yum install -y twemproxy && \
    mkdir -p /usr/sbin/conf && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

COPY twemproxy.yml /etc/

CMD  ["/usr/sbin/twemproxy", "/etc/twemproxy.yml"]

