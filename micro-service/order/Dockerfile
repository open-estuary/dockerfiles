FROM  openestuary/openjdk:1.8

ENV ORDER_VERSION order-service-1.0

#RUN yum clean && \
RUN yum install -y micro-service-order.aarch64 && \
    pushd /usr/bin/jarfile/order > /dev/null && \ 
    tar -zxvf micro-service-1.0-order.tar.gz && \
    popd > /dev/null && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8000

CMD  ["java", "-jar", "/usr/bin/jarfile/order/target/order-0.0.1-SNAPSHOT.jar"]
