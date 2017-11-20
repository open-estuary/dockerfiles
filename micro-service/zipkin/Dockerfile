FROM  openestuary/openjdk:1.8

ENV ZIPKINSERVER_VERSION micro-service-zipkin-2.0

RUN yum clean all && \
    yum install -y micro-service-zipkin && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8765

CMD  ["/opt/micro-services/microservice-zipkin"]
