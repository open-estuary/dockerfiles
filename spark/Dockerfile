###### This dockerfile used to create a spark image ###### 
# Spark
#
# VERSION 0.0.1


FROM	        openestuary/centos:5.0

LABEL		Description="This image is used to start the deploy and start spark services" Vendor="Estuaryapp" Version="1.0"

# Install spark dependances(java > 1.8; scala > 2.1)

#RUN	     	mkdir -p /usr/lib/java; \
#		cd /tmp; \
#		/bin/bash -c `wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-arm64-vfp-hflt.tar.gz`; \
RUN yum check-update; yum install -y wget
#RUN wget http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-arm64-vfp-hflt.tar.gz
RUN	     	mkdir -p /usr/lib/java; \
		cd /tmp; \
		/bin/bash -c `wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"    http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-arm64-vfp-hflt.tar.gz`; \
		tar -zxvf jdk-8u151-linux-arm64-vfp-hflt.tar.gz -C /usr/lib/java/; \
		rm -rf jdk-8u151-linux-arm64-vfp-hflt.tar.gz

RUN             mkdir -p /usr/lib/scala \
                && cd /tmp \
                && wget https://downloads.lightbend.com/scala/2.11.11/scala-2.11.11.tgz \
                && tar -zxvf scala-2.11.11.tgz -C /usr/lib/scala \
                && rm -rf scala-2.11.11.tgz

RUN		mkdir -p /usr/local/spark \
		&& cd /tmp \
		&& wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz \
		&& tar -zxvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/spark \
		&& rm -rf spark-2.2.0-bin-hadoop2.7.tgz



ENV		JAVA_HOME=/usr/lib/java/jdk1.8.0_151
ENV		PATH=$PATH:$JAVA_HOME/bin
ENV             SCALA_HOME=/usr/lib/scala/scala-2.11.11
ENV             PATH=$PATH:$SCALA_HOME/bin


#CMD            	/usr/local/spark/spark-2.2.0-bin-hadoop2.7/sbin/start-all.sh
#CMD            /bin/bash/echo "hello-world"
CMD		/usr/local/spark/spark-2.2.0-bin-hadoop2.7/sbin/start-master.sh
