FROM jefby/centos-arm64
ADD u01 /u01
ADD my.cnf /etc
ADD libstdc++.so.6.0.20 /lib64
RUN rm /lib64/libstdc++.so.6 && \
    ln -s libstdc++.so.6.0.20 libstdc++.so.6 && \
    yum install -y perl autoconf
ENV PATH /u01/my3306/bin:$PATH
ADD run.sh /root
EXPOSE 3306
CMD sh /root/run.sh
