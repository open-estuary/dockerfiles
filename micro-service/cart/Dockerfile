FROM  openestuary/openjdk:1.8

ENV CART_VERSION e-commerce-cart-2.0

RUN yum clean all && \
    yum install -y micro-service-cart.aarch64 && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8001

CMD  ["/opt/e-commerce/e-commerce-cart"]
