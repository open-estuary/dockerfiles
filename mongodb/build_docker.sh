#!/bin/bash

#Notes:
# It needs to build and install mongodb firstly before building MongoDB docker image, 
#  
# Build and install MongoDB steps:
# 1) git clone https://github.com/sjtuhjh/applications.git
# 2) cd applications/apps/mongodb/mongodb_test
# 3) ./setup.sh server
#
# Please note that the MongoDB will be installed into /u01 directoy by default
# So please make sure that the /u01 directory is empty before building and installing it
#

tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

if [ ! -f /usr/local/mongodb/bin/mongod  ] ; then
    echo "Please build and install mongodb firstly according to above comment"
    exit 0
fi

#Since mongdb(3.4 or above) relies on gcc 5.3( or newer), so just copy latest gcc libs
mkdir -p ./usr/local/lib64
cp -fr /usr/local/lib64/libstdc* ./usr/local/lib64

mkdir -p ./usr/local/mongodb/bin
mkdir -p ./usr/local/mongodb/config
cp  /usr/local/mongodb/bin/mongod ./usr/local/mongodb/bin
cp  /usr/local/mongodb/bin/mongo ./usr/local/mongodb/bin
cp  ./mongod.conf ./usr/local/mongodb/config/
cp  ./mongod_init.sh ./usr/local/mongodb/bin/
cp  ./createuser.js ./usr/local/mongodb/bin/createuser.js

#Remove unnecessary files in order to reduce size

yum install -y -q docker
service docker start

docker build -t openestuary/mongodb${tag_num} .

