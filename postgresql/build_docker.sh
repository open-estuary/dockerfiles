#!/bin/bash

#Notes:
# It needs to build and install postgresql firstly before building PostgreSQL docker image, 
#  
# Build and install PostgreSQL steps:
# 1) git clone https://github.com/sjtuhjh/applications.git
# 2) cd applications/apps/postgresql/postgresql_test1
# 3) ./setup.sh server
#
# Please note that the PostgreSQL will be installed into /u01 directoy by default
# So please make sure that the /u01 directory is empty before building and installing it
#

tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

if [ ! -f /usr/local/postgresql/bin/postgres  ] ; then
    echo "Please build and install postgresql firstly according to above comment"
    exit 0
fi

mkdir -p ./usr/local/postgresql

cp -fr /usr/local/postgresql/* ./usr/local/postgresql/

#Remove unnecessary files in order to reduce size

yum install -y -q docker
service docker start

docker build -t openestuary/postgresql${tag_num} .

