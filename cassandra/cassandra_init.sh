#!/bin/bash

CASSANDRA_HOME=/usr/local/cassandra
DATABASE_DIR=/u01/cassandra

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

SUBDIRS="data commitlog saved_caches hints tmp"

if [ ! -d ${DATABASE_DIR} ] ; then
    for dirname in ${SUBDIRS}
    do
        if [ ! -d "${DATABASE_DIR}/${dirname}" ] ; then
            mkdir -p ${DATABASE_DIR}/${dirname}
            chown -R cassandra:cassandra ${DATABASE_DIR}/${dirname}
            chmod 777 ${DATABASE_DIR}/${dirname}
        fi
    done

    chown -R cassandra:cassandra ${DATABASE_DIR}
    chmod 777 ${DATABASE_DIR}

    CASSANDRA_SEEDS="$(hostname --ip-address)"
    sed -ri 's/(- seeds:).*/\1 "'"$CASSANDRA_SEEDS"'"/' /etc/cassandra/cassandra.yaml
    sed -ri 's/(^listen_address:).*/\1 '"$CASSANDRA_SEEDS"'/' /etc/cassandra/cassandra.yaml 
    sed -ri 's/#\ (listen_address:).*/\1 '"$CASSANDRA_SEEDS"'/' /etc/cassandra/cassandra.yaml 
    sed -ri 's/(^broadcast_rpc_address:).*/\1 '"${CASSANDRA_SEEDS}"'/' /etc/cassandra/cassandra.yaml 
    sed -ri 's/^#\ (broadcast_rpc_address:).*/\1 '"$CASSANDRA_SEEDS"'/' /etc/cassandra/cassandra.yaml
    sed -ri 's/(^rpc_address:).*/\1 '"0.0.0.0"'/' /etc/cassandra/cassandra.yaml
    sed -ri 's/^#\ (rpc_address:).*/\1 '"0.0.0.0"'/' /etc/cassandra/cassandra.yaml
fi

exec "$@"

