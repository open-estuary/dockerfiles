#!/bin/bash

#Notes:
# It needs to build and install percona server firstly before building Percona Server docker image, 
#  
# Build and install percona server steps:
# 1) git clone https://github.com/sjtuhjh/applications.git
# 2) cd applications/apps/mysql/percona_1/
# 3) setup.sh server
#
# Please note that the percona server will be installed into /u01 directoy by default
# So please make sure that the /u01 directory is empty before building and installing it
#

tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

if [ ! -f /u01/my3306/bin/mysqld  ] ; then
    echo "Please build and install percona server firstly according to above comment"
    exit 0
fi

mkdir -p usr/include
mkdir -p usr/lib
mkdir -p usr/lib64
mkdir -p u01
mkdir -p etc

cp -fr /usr/include/libaio* usr/include/
cp -fr /usr/lib/libaio* usr/lib/
cp -fr /usr/lib64/libaio* usr/lib64/

cp -fr /u01/* u01/
cp -fr /etc/my.conf etc/
cp -fr /usr/lib64/mysql usr/lib64


#Remove unnecessary files in order to reduce size
rm -fr u01/my3306/data
rm -fr u01/my3306/mysql-test
rm -fr u01/my3306/bin/mysql_client_test
rm -fr u01/my3306/bin/mysql_client_test_embedded
rm -fr u01/my3306/bin/mysqltest
rm -fr u01/my3306/bin/mysqltest_embedded
rm -fr u01/my3306/bin/ps_tokudb_admin
rm -fr u01/my3306/bin/resolve_stack_dump
rm -fr u01/my3306/bin/myisamchk
rm -fr u01/my3306/bin/myisam_ftdump
rm -fr u01/my3306/bin/myisamlog
rm -fr u01/my3306/bin/myisampack


yum install -y -q docker
service docker start

docker build -t openestuary/mysql${tag_num} .

