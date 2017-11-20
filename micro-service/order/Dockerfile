FROM  openestuary/openjdk:1.8

ENV ORDER_VERSION e-commerce-order-2.0

RUN yum clean all && \
    yum install -y micro-service-order.aarch64 && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8000

CMD  ["/opt/e-commerce/e-commerce-order"]
