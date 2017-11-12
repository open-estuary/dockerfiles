#!/bin/bash

#Author :dingwei
#Date   :2017/11/12
#


tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
else
    echo "usage<./build_docker.sh tagnum>"
    exit 1
fi

yum install -y -q docker
service docker start

docker build -t openestuary/spark${tag_num} .
