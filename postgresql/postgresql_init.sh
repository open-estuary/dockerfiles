#!/bin/bash

BASE_DIR=$(cd ~; pwd)
PGHOME=/usr/local/postgresql
PGDATA=${PGDATA:-/u01/postgresql/data}
PGWALLOG=${PGWALLOG:-/u01/postgresql/log}
PGPORT=${PGPORT:-5432}
PGPASSWD=${PGPASSWD:-postgres}
PGUSER=${PGUSER:-postgres}
PGDB=${PGUSER:-postgres}
PGCONF=${PGCONF:-small}

##################################################################################################
# Define system variables 
##################################################################################################
if [ -z "$(grep 'PGHOME=' /etc/profile)" ] ; then
    echo "export PGHOME=${PGHOME}" >> /etc/profile
    echo "export PGDATA=${PGDATA}" >> /etc/profile
    echo 'export PATH=$PATH':"$PGHOME/bin" >> /etc/profile
    echo "export PGUSER=${PGUSER}" >> /etc/profile
    echo "export PGDB=${PGDB}" >> /etc/profile
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH':"${PGHOME}/lib" >> /etc/profile
fi

source /etc/profile

##################################################################################################
# Initialize database 
##################################################################################################

# Make sure that file system have been formatted and mounted properly
# 
# DISK=/dev/sda
# parted -s ${DISK} mklabel gpt
# parted -s ${DISK} mkpart primary 1MiB 100%
# mkfs.ext4 /dev/sda1 -m 0 -O extent,uninit_bg -E lazy_itable_init=1 -T largefile -L u01
# 
# vim /etc/fstab (mount)
# LABEL=u01 /u01     ext4        defaults,noatime,nodiratime,nodelalloc,barrier=0,data=writeback    0 0
#

if [ ! -d ${PGDATA} ] ; then
    mkdir -p ${PGDATA}
    chown -L -R ${PGUSER} ${PGDATA}
    chmod 700 ${PGDATA}
fi

if [ ! -d ${PGWALLOG} ] ; then
    mkdir -p ${PGWALLOG}
    chown -L -R ${PGUSER} ${PGWALLOG}
    chmod 700 ${PGWALLOG}
fi

if [ ! -f ${PGDATA}/postgresql.conf ] ; then
    echo "Begin to initalize database ......"
    su ${PGUSER} -c "${PGHOME}/bin/initdb -D ${PGDATA} -E UTF8 --locale=C -U ${PGUSER} -X ${PGWALLOG}"

    if [ x"${PGCONF}" == x"small" ] ; then
        cp ${PGHOME}/config/postgresql_small.conf ${PGDATA}/postgresql.conf
    else 
        cp ${PGHOME}/config/postgresql_large.conf ${PGDATA}/postgresql.conf
    fi

    cp ${PGHOME}/config/pg_hba.conf ${PGDATA}/pg_hba.conf
    sed -i 's/host.*all.*all.*md5/host\ all\ all\ 0\.0\.0\.0\/0\ trust/g' ${PGDATA}/pg_hba.conf

    su ${PGUSER} -c "${PGHOME}/bin/pg_ctl -D ${PGDATA} -o '-c listen_addresses=localhost' -w start"
    READY_STR="database system is ready to accept connections"
    index=0
    while [[ ${index} -lt 10 ]] ; do
        CHECK_READY=$(grep "${READY_STR}" ${PGDATA}/pg_log/postgresql*.csv)
        if [ ! -z "${CHECK_READY}" ] ; then
            break
        fi
        sleep 5
        let "index++"
    done

    su ${PGUSER} -c "${PGHOME}/bin/psql -h 127.0.0.1 -p ${PGPORT} -U ${PGUSER} << EOF
ALTER USER ${PGUSER} WITH SUPERUSER PASSWORD '${PGPASSWD}';
CREATE DATABASE ${PGUSER} WITH OWNER ${PGUSER} ENCODING 'UTF8';
CREATE EXTENSION pg_stat_statements;
EOF"

    su ${PGUSER} -c "${PGHOME}/bin/pg_ctl -D ${PGDATA} -m fast -w stop"
    sed -i 's/host.*all.*all.*trust/host\ all\ all\ 0\.0\.0\.0\/0\ md5/g' ${PGDATA}/pg_hba.conf
    echo "${PGDATA} has been initialzed successfully"
fi

exec "$@"

