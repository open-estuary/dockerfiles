FROM openestuary/centos:v300

RUN groupadd -r apache && useradd -r --create-home -g apache apache

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH
RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown apache:apache "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX

# library for mod_http2
ENV NGHTTP2_VERSION 1.18.1-1
ENV OPENSSL_VERSION 1.0.2k-1~bpo8+1

# install httpd runtime dependencies
# https://httpd.apache.org/docs/2.4/install.html#requirements
RUN yum install -y  \
                apr \
                apr-util \
                apr-util-devel \
                apr-devel \
                apr-util-mysql \
                apr-util-openssl \
                lua-devel \
                lua \                
		libnghttp2-14=$NGHTTP2_VERSION \
		pcre \
                pcre-devel \
                libpcre++0 \
		libssl1.0.0=$OPENSSL_VERSION \
		libxml2 \
	&& rm -r /var/cache/yum/*

ENV HTTPD_VERSION 2.4.25
ENV HTTPD_SHA1 bd6d138c31c109297da2346c6e7b93b9283993d2

ENV HTTPD_BZ2_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=httpd/httpd-$HTTPD_VERSION.tar.bz2

# see https://httpd.apache.org/docs/2.4/install.html#requirements
RUN set -x \
	&& buildDeps=" \
		bzip2 \
		ca-certificates \
		gcc \
		libnghttp2-dev=$NGHTTP2_VERSION \
		liblua5.2-dev \
		libpcre++-dev \
		libssl-dev=$OPENSSL_VERSION \
		libxml2-dev \
		zlib1g-dev \
		make \
		wget \
	" \
	&& yum install -y $buildDeps \
	&& wget -O httpd.tar.bz2 "$HTTPD_BZ2_URL" \
	&& echo "$HTTPD_SHA1 *httpd.tar.bz2" | sha1sum -c - \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& mkdir -p src \
	&& tar -xf httpd.tar.bz2 -C src --strip-components=1 \
	&& rm httpd.tar.bz2 \
	&& cd src \
	\
	&& ./configure \
		--prefix="$HTTPD_PREFIX" \
		--enable-mods-shared=reallyall \
	&& make -j "$(nproc)" \
	&& make install \
	\
	&& cd .. \
	&& rm -r src man manual \
	\
	&& sed -ri \
		-e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
		"$HTTPD_PREFIX/conf/httpd.conf" \
	\
        && yum -y autoremove \
        && rm -r /var/cache/yum/*

COPY httpd-foreground /usr/local/bin/

EXPOSE 80
CMD ["httpd-foreground"]
