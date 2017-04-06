#!/bin/bash

#Notes:
#  
# Please note that the Cassandra will be installed into /u01 directoy by default
# So please make sure that the /u01 directory is empty before building and installing it
#

tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

#Remove unnecessary files in order to reduce size

yum install -y -q docker
service docker start

docker build -t openestuary/cassandra${tag_num} .

