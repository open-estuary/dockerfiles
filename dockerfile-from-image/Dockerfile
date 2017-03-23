#FROM alpine:3.2
FROM owlab/alpine-arm64:latest
MAINTAINER OpenEstuary <sjtuhjh@hotmail.com>

RUN apk --no-cache --update add ca-certificates openssl && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \  
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \ 
    apk add glibc-2.25-r0.apk

RUN apk --update add  make gcc ruby ruby-dev musl-dev && \
    gem install --no-rdoc --no-ri docker-api && \
    apk del ruby-dev ca-certificates && \
    apk add ruby ruby-json && \
    rm /var/cache/apk/*

ADD dockerfile-from-image.rb /usr/src/app/dockerfile-from-image.rb

ENTRYPOINT ["/usr/src/app/dockerfile-from-image.rb"]
CMD ["--help"]
