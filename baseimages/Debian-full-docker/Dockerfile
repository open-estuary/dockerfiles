FROM openestuary/debian:5.0
RUN apt-get update && apt-get install -y wget apt-utils
RUN apt-get install -y expect automake dh-make devscripts equivs dh-systemd
RUN apt-get install -y libncurses-dev cmake chkconfig git
RUN apt-get install -y llvm-dev libclang-dev \
    libelf-dev bison flex libedit-dev zlib1g-dev \
    python-netaddr arping \
    iputils-ping iperf ethtool devscripts
RUN apt-get install -y debhelper dkms cmake gcc devscripts rpm librpm-dev
