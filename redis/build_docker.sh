#!/bin/bash

#Author :Huang Jinhua
#Date   :2017/01/25
#
#Notes:
# It needs to build and install Redis firstly before building Redis docker image, 
#  
# Build and install Redis steps:
# 1) git clone https://github.com/sjtuhjh/applications.git
# 2) cd applications/apps/redis/redis_test1/
# 3) setup.sh server
#
# Please note that the redis will be installed into /usr/local/redis directoy by default
# So please make sure that the /usr/local/redis directory is empty before building and installing it
#
tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

if [ ! -f /usr/local/redis/bin/redis-server  ] ; then
    echo "Please build and install redis firstly according to above comment"
    exit 0
fi

if [ ! -d "./redis" ] ; then
    mkdir ./redis
fi
cp -fr /usr/local/redis/* ./redis/

#Remove unnecessary files in order to reduce size
mv ./redis/config/redis_cpu0_port7000.conf redis.conf
rm ./redis/config/redis_cpu*.conf
sed -i 's/7000/6379/g' ./redis.conf
sed -i 's/dir\ .*/dir\ \/usr\/local\/redis\/db/g' ./redis.conf
sed -i 's/daemonize.*yes/daemonize\ no/g' ./redis.conf
mv ./redis.conf ./redis/config/redis.conf

#Build redis docker image 
yum install -y -q docker
service docker start

docker build -t openestuary/redis${tag_num} .

