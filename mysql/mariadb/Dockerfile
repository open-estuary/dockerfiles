FROM openestuary/centos:v300

RUN  groupadd -r mysql && useradd -r -g mysql mysql
ENV  MARIADB_VERSION mariadb.10.1.21
ENV  PATH /usr/local/mariadb/bin:$PATH

COPY usr/ /usr/

COPY etc/my_mariadb.conf /usr/local/mariadb/config/my.conf
COPY mysql_init.sh /usr/local/mariadb/bin/

#RUN  yum install -y perl && \
#     yum install -y perl-Data-Peek

EXPOSE 3306
ENTRYPOINT ["/bin/bash", "/usr/local/mariadb/bin/mysql_init.sh"]
CMD ["mysqld_safe", "--defaults-file=/etc/my_mariadb.conf", "--basedir=/usr/local/mariadb", "--datadir=/u01/mariadb/data"]
