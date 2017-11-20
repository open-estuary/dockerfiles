FROM  openestuary/openjdk:1.8

ENV SEARCH_VERSION e-commerce-search-2.0

RUN yum clean all && \
    yum install -y micro-service-search.aarch64 && \
    rm -rf /var/lib/yum/yumdb && \
    rm -rf /var/lib/yum/history

EXPOSE 8002

CMD  ["/opt/e-commerce/e-commerce-search"]
