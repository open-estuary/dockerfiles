FROM openestuary/centos:v300

RUN  groupadd -r postgres && useradd -r -g postgres postgres

ENV  POSTGRESQL_VERSION postgresql9.6
ENV  PATH /usr/local/postgresql/bin:$PATH
ENV  PGUSER ${PGUSER:-postgres}

ADD  usr/local/postgresql /usr/local/postgresql
RUN  mkdir /usr/local/postgresql/config
ADD  postgresql_small.conf /usr/local/postgresql/config
ADD  postgresql_large.conf /usr/local/postgresql/config
ADD  pg_hba.conf /usr/local/postgresql/config
ADD  postgresql_init.sh /usr/local/postgresql/bin/

EXPOSE 5432

ENTRYPOINT ["/bin/bash", "/usr/local/postgresql/bin/postgresql_init.sh"]

CMD ["sh", "-c", "su ${PGUSER} -c postgres"]
