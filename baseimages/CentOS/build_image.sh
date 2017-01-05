#!/bin/bash

#Step 1: Prepare for RootFS firstly
yum install -y -q wget
if [ ! -f "./CentOS_ARM64.tar.gz" ] ; then
    wget ftp://117.78.41.188/pre-releases/3.0/b3/linux/CentOS/CentOS_ARM64.tar.gz
fi

#Step 2: Start docker Service 
yum install -y -q docker
service docker start

#Step 3: Build docker base image
docker build -t estuary3.0-centos7 -f ./Dockerfile
