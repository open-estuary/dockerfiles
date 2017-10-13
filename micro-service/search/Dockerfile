FROM  openestuary/openjdk:1.8

ENV SEARCH_VERSION search-service-1.0

#RUN yum clean && \
RUN yum install -y micro-service-search.aarch64 && \
    pushd /usr/bin/jarfile/search > /dev/null && \ 
    tar -zxvf micro-service-1.0-search.tar.gz && \
    popd > /dev/null

EXPOSE 8002

CMD  ["java", "-jar", "/usr/bin/jarfile/search/target/htsat-search.jar"]
