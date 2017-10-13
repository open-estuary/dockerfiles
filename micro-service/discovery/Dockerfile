FROM  openestuary/openjdk:1.8

ENV DISCOVERY_VERSION discovery-service-1.0

#RUN yum clean && \
RUN yum install -y micro-service-discovery.aarch64 && \
    pushd /usr/bin/jarfile/discovery > /dev/null && \ 
    tar -zxvf micro-service-1.0-discovery.tar.gz && \
    popd > /dev/null

EXPOSE 8761

CMD  ["java", "-jar", "/usr/bin/jarfile/discovery/target/eureka-server-0.0.1-SNAPSHOT.jar"]
