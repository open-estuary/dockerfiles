#!/bin/bash

BASE_DIR=$(cd ~; pwd)
MONGODBHOME=/usr/local/mongodb
MONGODBDATA=${MONGODBDATA:-/u01/mongodb/data}
MONGODBWALLOG=${MONGODBWALLOG:-/u01/mongodb/log}
MONGODBPASSWD=${MONGODBPASSWD:-Estuary12#$}
MONGODBUSER=${MONGODBUSER:-mongodb}

##################################################################################################
# Define system variables 
##################################################################################################
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64/

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

if [ ! -d ${MONGODBDATA} ] ; then
    mkdir -p ${MONGODBDATA}
    chown -L -R ${MONGODBUSER} ${MONGODBDATA}
    chmod 700 ${MONGODBDATA}
fi

if [ ! -d ${MONGODBWALLOG} ] ; then
    mkdir -p ${MONGODBWALLOG}
    chown -L -R ${MONGODBUSER} ${MONGODBWALLOG}
    chmod 700 ${MONGODBWALLOG}
fi

if [ ! -f ${MONGODBDATA}/WiredTiger ] ; then
    echo "Begin to initalize database ......"
    
    cp /usr/local/mongodb/config/mongod.conf /etc/mongod.conf
    sed -i 's/authorization:\ .*enabled/authorization:\ disabled/g' /etc/mongod.conf
    sed -i 's/fork:\ .*false/fork:\ true/g' /etc/mongod.conf
    ${MONGODBHOME}/bin/mongod -f /etc/mongod.conf
    ${MONGODBHOME}/bin/mongo admin ${MONGODBHOME}/bin/createuser.js

    sed -i 's/authorization:\ .*disabled/authorization:\ enabled/g' /etc/mongod.conf
    sed -i 's/fork:\ .*true/fork:\ false/g' /etc/mongod.conf
    echo "Now start MongoDB with authentication..."
fi

exec "$@"

