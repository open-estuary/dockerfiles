FROM arm64v8/ubuntu:16.04
COPY estuaryhttp_ubuntu.list /etc/apt/sources.list.d/estuary.list
COPY ESTUARY-GPG-KEY /tmp/ESTUARY-GPG-KEY
RUN cat /tmp/ESTUARY-GPG-KEY | apt-key add -
RUN apt-get update

