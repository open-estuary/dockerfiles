FROM  openestuary/openjdk:1.8

ENV CART_VERSION cart-service-1.0

#RUN yum clean && \
RUN yum install -y micro-service-cart.aarch64 && \
    pushd /usr/bin/jarfile/cart > /dev/null && \ 
    tar -zxvf micro-service-1.0-cart.tar.gz && \
    popd > /dev/null && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8001

CMD  ["java", "-jar", "/usr/bin/jarfile/cart/target/cart-0.0.1-SNAPSHOT.jar"]
