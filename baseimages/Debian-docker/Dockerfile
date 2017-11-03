FROM arm64v8/debian:8.9
COPY estuaryhttp_debian.list /etc/apt/sources.list.d/estuary.list
COPY ESTUARY-GPG-KEY /tmp/ESTUARY-GPG-KEY
RUN cat /tmp/ESTUARY-GPG-KEY | apt-key add -
RUN apt-get update

