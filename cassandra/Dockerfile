FROM openestuary/centos:v300

RUN  groupadd -r cassandra && useradd -r -g cassandra cassandra

ENV CASSANDRA_VERSION 3.10
ENV CASSANDRA_HOME /usr/local/cassandra
ENV CASSANDRA_CONF /etc/cassandra

ENV JAVA_HOME /usr/local/jdk8u
ENV CLASSPATH .:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar

#Step 1: Install JAVA
RUN yum install -y wget xz && \
    wget -O /tmp/jdk8u-server-release-1609.tar.xz  http://openjdk.linaro.org/releases/jdk8u-server-release-1609.tar.xz && \
    cd /tmp/ && xz -d jdk8u-server-release-1609.tar.xz && tar -xvf jdk8u-server-release-1609.tar -C /usr/local/ && \
    mv /usr/local/jdk*-server* /usr/local/jdk8u && \
    rm -fr /tmp/jdk8u*.tar.xz 

#Step 2: Install jmalloc
RUN yum install -y autoconf gcc make && \
    wget -O /tmp/jemalloc.tar.gz https://github.com/jemalloc/jemalloc/archive/4.5.0.tar.gz && \
    cd /tmp/ && tar -zxvf jemalloc*.tar.gz && \
    cd jemalloc*/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    (make install; echo 0) && \
    cd .. && rm -fr jemalloc* && \
    echo "/usr/local/lib" >> /etc/ld.so.conf.d/jemalloc.conf && ldconfig && \
    yum remove -y autoconf gcc make
    
#Step 3: Install Cassandra
RUN yum install -y numactl && \
    wget -O /tmp/apache-cassandra-3.10-bin.tar.gz http://archive.apache.org/dist/cassandra/3.10/apache-cassandra-3.10-bin.tar.gz && \
    tar -zxvf /tmp/apache-cassandra-3.10-bin.tar.gz -C /usr/local && \
    mv /usr/local/apache-cassandra-* /usr/local/cassandra && \
    rm -fr /tmp/apache-cassandra-*.tar.gz && \
    yum remove -y wget && \ 
    yum autoremove -y

COPY cassandra_init.sh ${CASSANDRA_HOME}/bin/
COPY jna*.rpm /tmp/
RUN rpm -i --nodeps /tmp/jna*.rpm && \
    cp /usr/share/java/jna*.jar ${CASSANDRA_HOME}/lib/jna-*.jar && \
    rm -fr /tmp/jna*.rpm

ENV PATH ${JAVA_HOME}/bin:${CASSANDRA_HOME}/bin:$PATH

RUN mkdir -p ${CASSANDRA_CONF} && \ 
    cp -fr ${CASSANDRA_HOME}/conf/* ${CASSANDRA_CONF}/
COPY config/* ${CASSANDRA_CONF}/

RUN chown -R cassandra:cassandra ${CASSANDRA_CONF} && \
    chmod 777 ${CASSANDRA_CONF} && \
    sed -i "s/\${cassandra\.logdir}/\/u01\/cassandra\/logs/g" ${CASSANDRA_CONF}/logback.xml

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

ENTRYPOINT ["/bin/bash", "/usr/local/cassandra/bin/cassandra_init.sh"]
CMD ["su", "cassandra", "-c", "cassandra -f"]
