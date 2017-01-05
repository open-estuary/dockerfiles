FROM openestuary/centos

RUN  groupadd -r mysql && useradd -r -g mysql mysql
ENV  MYSQL_VERSION percona.5.6.22
ENV  PATH /u01/my3306/bin:/usr/local/bin:$PATH

ADD  usr/include/libaio* /usr/include
ADD  usr/lib/libaio.a /usr/lib/
ADD  usr/lib/libaio.so.1.0.1 /usr/lib/
RUN  ln -s /usr/lib/libaio.so.1.0.1 /usr/lib/libaio.so
RUN  ln -s /usr/lib/libaio.so.1.0.1 /usr/lib/libaio.so.1
ADD  usr/lib64/libaio.so.1.0.1 /usr/lib64/
RUN  ln -s /lib64/libaio.so.1.0.1 /usr/lib64/libaio.so.1

ADD  u01 /u01
ADD  etc/my.conf /etc/

ADD  mysql_init.sh /usr/local/bin/

RUN  yum install -y perl
RUN  yum install -y perl-Data-Peek

EXPOSE 3306
ENTRYPOINT ["/bin/bash", "/usr/local/bin/mysql_init.sh"]
CMD ["mysqld_safe", "--defaults-file=/etc/my.conf", "--basedir=/u01/my3306", "--datadir=/u01/my3306/data"]
