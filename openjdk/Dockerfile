FROM    openestuary/centos:5.0
MAINTAINER  Open-Estuary "sjtuhjh@hotmail.com"

ENV JAVA_VERSION 1.8.0
ENV JAVA_HOME /etc/alternatives/jre_1.8.0_openjdk

RUN yum install -y java-1.8.0-openjdk && \
    rm -fr /var/lib/yum/yumdb &&   \
    rm -fr /var/lib/yum/history

