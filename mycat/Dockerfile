FROM openestuary/centos:5.0

ENV  MYCAT_VERSION mycat_1.6
ENV  MYCAT_HOME /usr/share/mycat
ENV  PATH /usr/local/bin:/usr/share/mycat/bin:$PATH

RUN  mkdir -p /usr/share/mycat

RUN yum install -y mycat && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

CMD  ["/usr/share/mycat/bin/mycat start"]

