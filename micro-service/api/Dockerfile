FROM  openestuary/openjdk:1.8

ENV APIGATEWAY_VERSION apigateway-service-1.0

#RUN yum clean && \
RUN yum install -y micro-service-api.aarch64 && \
    pushd /usr/bin/jarfile/api > /dev/null && \ 
    tar -zxvf micro-service-1.0-api.tar.gz && \
    popd > /dev/null

EXPOSE 5555

CMD  ["java", "-jar", "/usr/bin/jarfile/api/target/api-gateway.jar"]
