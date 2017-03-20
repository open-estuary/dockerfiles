FROM openestuary/centos:v300

RUN  groupadd -r mongodb && useradd -r -g mongodb mongodb

ENV  MONGODB_VERSION mongodb3.4
ENV  PATH /usr/local/mongodb/bin:$PATH
ENV  MONGOUSER ${MONGOUSER:-mongodb}

COPY usr/local /usr/local/
RUN yum install -y numactl

EXPOSE 27017

ENTRYPOINT ["/bin/bash", "/usr/local/mongodb/bin/mongod_init.sh"]
CMD ["numactl", "--interleave=all", "/usr/local/mongodb/bin/mongod", "-f", "/etc/mongod.conf"]
