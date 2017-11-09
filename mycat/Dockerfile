FROM openestuary/centos:3.1

ENV  MYCAT_VERSION mycat_1.6
ENV  MYCAT_HOME /usr/local/mycat
ENV  PATH /usr/local/bin:/usr/local/mycat/bin:$PATH

RUN  mkdir -p /usr/local/mycat

RUN yum install -y mycat && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

CMD  ["/usr/local/mycat/bin/mycat start"]

