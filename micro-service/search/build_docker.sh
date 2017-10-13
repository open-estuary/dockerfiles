tag_num=""
if [ ! -z "${1}" ] ;  then
    tag_num=":${1}"
fi

yum install -y -q docker
service docker start

docker build -t openestuary/search${tag_num} .
