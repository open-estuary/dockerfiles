FROM  openestuary/openjdk:1.8

ENV APIGATEWAY_VERSION micro-service-api-2.0

RUN yum clean all && \
    yum install -y micro-service-api && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8765

CMD  ["/opt/micro-services/microservice-zuul"]
