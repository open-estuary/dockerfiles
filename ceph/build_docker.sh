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

if [ ! -z "$(ps -aux | grep docker | grep -v docker)" ] ; then
    yum install -y -q docker
    service docker start
fi

if [ -z "$(which go 2>/dev/null)" ] ; then
    sudo yum install golang
fi

#Step1: Preapre submodules
CUR_DIR=$(cd `dirname $0`; pwd)
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

if [ ! -f forgo ] ; then
    cd ${GOPATH}
    go get -u github.com/ddollar/forego
    cp ${GOPATH}/bin/forego ${CUR_DIR}/
fi

#Step3:
VERSION="kraken"
BASE_IMAGE=${CUR_DIR}/ceph-docker/ceph-releases/${VERSION}/centos/7/base
DAEMON_IMAGE=${CUR_DIR}/ceph-docker/ceph-releases/${VERSION}/centos/7/daemon

pushd ${BASE_IMAGE} > /dev/null
cp ${CUR_DIR}/confd ${BASE_IMAGE}/
cp ${CUR_DIR}/forego ${BASE_IMAGE}/
docker build -t openestuary/ceph-base${tag_num} .
popd > /dev/null

echo "Build ceph Daemon image ..."
cp ${CUR_DIR}/confd ${BASE_IMAGE}/
cp ${CUR_DIR}/forego ${BASE_IMAGE}/
pushd ${BASE_IMAGE} > /dev/null
docker build -t openestuary/ceph${tag_num} .
popd > /dev/null

rm -fr tmpbuild
