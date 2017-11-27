FROM arm64v8/centos:7
COPY estuaryhttp.repo /etc/yum.repos.d/estuary.repo
RUN chmod +r /etc/yum.repos.d/estuary.repo ;\
rpm --import http://repo.estuarydev.org/releases/ESTUARY-GPG-KEY ;\
yum install -y epel-release ;\
yum clean all
