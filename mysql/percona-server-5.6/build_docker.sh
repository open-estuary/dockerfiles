#!/bin/bash
tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
else
   echo "please input the tag!";
   exit 0;
fi
command -v docker >/dev/null 2>&1 || { echo >&2 "I require docker but it's not installed. use 'yum install -y docker' and 'service docker start' "; exit 0; }
##you might want to install the docker	
#yum install -y -q docker
#service docker start

docker build -t openestuary/mysql${tag_num} .
