FROM openestuary/centos:5.0

RUN  groupadd -r mysql && useradd -r -g mysql mysql
ENV  MYSQL_VERSION percona.5.6.22
ENV  PATH /u01/my3306/bin:/usr/local/bin:$PATH
COPY repo/estuary.repo /etc/yum.repos.d/estuary.repo
COPY repo/ESTUARY-GPG-KEY /etc/pki/rpm-gpg
RUN yum install -y  Percona-Server-server-56 || true
COPY  mysql_init.sh /usr/local/bin/
COPY  etc/my.conf /etc/my.conf
EXPOSE 3306
ENTRYPOINT ["/bin/bash", "/usr/local/bin/mysql_init.sh"]
CMD ["mysqld_safe", "--defaults-file=/etc/my.conf", "--datadir=/u01/my3306/data"]

