#!/bin/bash

# Author : Huang Jinhua
# Date   : 05/04/2017
# Email  : sjtuhjh@hotmail.com
# Comments: it is to build Ceph docker image

# By default, it will build 'latest' tag

CUR_DIR=$(cd `dirname $0`; pwd)
tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

#################################################################################
#Build docker image function
#################################################################################
build_docker_image() {
    IMAGE_SRC=${1}
    IMAGE_NAME=${2}
    BUILD_DIR=${CUR_DIR}/build_${IMAGE_NAME}

    if [ ! -d ${BUILD_DIR} ] ; then
        mkdir -p ${BUILD_DIR}
    else 
        rm -fr ${BUILD_DIR}/*
    fi

    rsync -Lr ${IMAGE_SRC}/* ${BUILD_DIR}/
    cp ${CUR_DIR}/confd ${BUILD_DIR}/confd_bin
    cp ${CUR_DIR}/forego ${BUILD_DIR}/
    
    cd ${BUILD_DIR}
    docker build -t openestuary/${IMAGE_NAME}${tag_num} .
}


#Remove unnecessary files in order to reduce size

if [ ! -z "$(ps -aux | grep docker | grep -v docker)" ] ; then
    yum install -y -q docker
    service docker start
fi

if [ -z "$(which go 2>/dev/null)" ] ; then
    sudo yum install golang
fi

#Step1: Preapre submodules
cd ${CUR_DIR}/..
git submodule update --init --recursive

#Step2: Build confd and forego locally
cd ${CUR_DIR}/
export GOPATH=${CUR_DIR}/tmpbuild
if [ ! -f confd ] ; then
mkdir tmpbuild
    cd ${GOPATH}
    mkdir -p $GOPATH/src/github.com/kelseyhightower
    git clone https://github.com/kelseyhightower/confd.git $GOPATH/src/github.com/kelseyhightower/confd
    cd $GOPATH/src/github.com/kelseyhightower/confd
    ./build 
    cp ./bin/confd ${CUR_DIR}/
fi

if [ ! -f forego ] ; then
    cd ${GOPATH}
    go get -u github.com/ddollar/forego
    cp ${GOPATH}/bin/forego ${CUR_DIR}/
fi

#Step3: Build ceph-base(which only install ceph but would't run any tasks) 
#       and ceph(which will run specific daemon based on input parameter)

VERSION="kraken"
BASE_SRC_DIR=${CUR_DIR}/ceph-docker/ceph-releases/${VERSION}/centos/7/base
DAEMON_SRC_DIR=${CUR_DIR}/ceph-docker/ceph-releases/${VERSION}/centos/7/daemon

build_docker_image ${BASE_SRC_DIR} ceph-base
build_docker_image ${DAEMON_SRC_DIR} ceph

