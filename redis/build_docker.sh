#!/bin/bash

#Author :Huang Jinhua
#Date   :2017/01/25
#
#Notes:
#This script build docker only.
#
tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

#Build redis docker image 
yum install -y -q docker
service docker start

docker build -t openestuary/redis${tag_num} .

