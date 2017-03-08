FROM openestuary/centos:v300

RUN  groupadd -r mysql && useradd -r -g mysql mysql
ENV  ALISQL_VERSION alisql.5.6
ENV  PATH /u01/my3306/bin:/usr/local/bin:$PATH

COPY usr /usr

#RUN  ln -s /usr/lib/libaio.so.1.0.1 /usr/lib/libaio.so  && \
#     ln -s /usr/lib/libaio.so.1.0.1 /usr/lib/libaio.so.1  && \
#     ln -s /lib64/libaio.so.1.0.1 /usr/lib64/libaio.so.1

ADD  u01 /u01
ADD  etc/my.conf /usr/local/mysql/config/my.conf
ADD  mysql_init.sh /usr/local/bin/

RUN  yum install -y perl && \
     yum install -y perl-Data-Peek

EXPOSE 3306
ENTRYPOINT ["/bin/bash", "/usr/local/bin/mysql_init.sh"]
CMD ["mysqld_safe", "--defaults-file=/etc/my.conf", "--basedir=/u01/my3306", "--datadir=/u01/my3306/data"]
