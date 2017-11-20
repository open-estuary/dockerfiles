FROM  openestuary/openjdk:1.8

ENV DISCOVERY_VERSION micro-service-discovery-2.0

RUN yum clean all && \
    yum install -y micro-service-discovery.aarch64 && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8761

CMD  ["/opt/micro-services/microservice-eureka"]
