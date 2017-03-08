#!/bin/bash

#Notes:
# It needs to build and install mariadb server firstly before building MariaDB Server docker image, 
#  
# Build and install mariadb server steps:
# 1) git clone https://github.com/sjtuhjh/applications.git
# 2) cd applications/apps/mariadb/mariadb_1/
# 3) setup.sh server
#
# Please note that the mariadb server will be installed into /usr/local/mariadb directoy by default
# So please make sure that the /usr/local/mariadb directory is empty before building and installing it
#

tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

if [ ! -f /usr/local/mariadb/bin/mysql  ] ; then
    echo "Please build and install mariadb server firstly according to above comment"
    exit 0
fi

mkdir -p usr/local/mariadb
mkdir -p u01
mkdir -p etc
mkdir -p usr/include
mkdir -p usr/lib
mkdir -p usr/lib64

cp -fr /usr/include/libaio* usr/include/
cp -fr /usr/lib/libaio* usr/lib/
cp -fr /usr/lib64/libaio* usr/lib64/

cp -fr /usr/local/mariadb/* usr/local/mariadb/
cp -fr /etc/my_mariadb.conf etc/

#Remove unnecessary files in order to reduce size
rm -fr usr/local/mariadb/bin/mysql_client_test
rm -fr usr/local/mariadb/bin/mysql_client_test_embedded
rm -fr usr/local/mariadb/bin/mysqltest
rm -fr usr/local/mariadb/bin/mysqltest_embedded
rm -fr usr/local/mariadb/bin/ps_tokudb_admin
rm -fr usr/local/mariadb/bin/resolve_stack_dump
rm -fr usr/local/mariadb/bin/myisamchk
rm -fr usr/local/mariadb/bin/myisam_ftdump
rm -fr usr/local/mariadb/bin/myisamlog
rm -fr usr/local/mariadb/bin/myisampack
rm -fr usr/local/mariadb/share/mysql-test

yum install -y -q docker
service docker start

docker build -t openestuary/mariadb${tag_num} .

