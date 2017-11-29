FROM docker.io/openestuary/centos:5.0
RUN yum install -y expect rpm-sign rpm-build which
RUN yum install -y gcc make cmake devtoolset-4
RUN yum install -y maven-local systemd chkconfig initscripts ant
RUN yum install -y ncurses-devel git gcc-c++
RUN echo -e "[linaro-overlay]\n\
name=Linaro Overlay packages for CentOS 7\n\
baseurl=http://repo.linaro.org/rpm/linaro-overlay/centos-7/repo\n\
gpgcheck = 0\n" > /etc/yum.repos.d/linaro-overlay.repo && yum install -y luajit golang
RUN yum install -y python2-pip openssl wget
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.el7_4.aarch64" 
