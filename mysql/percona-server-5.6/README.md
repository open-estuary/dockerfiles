# MySQL Dockerfile

The Dockerfile is used to produce a Docker Image for [MySQL](http://www.mysql.com) on `ARM64`.

# MySQL version

[Percona-Server-5.6.22-72.0](http://www.percona.com/downloads/Percona-Server-5.6/)

# How to build the Image

You need to git pull mysql.git, then execute the following command under the `mysql` folder to 
create the image `bobsense/mysql`,

```
$ git pull https://github.com/bobsense/mysql.git
$ cd mysql
$ docker build -t bobsense/mysql .
```

# How to use this Image

## Run the image

The typical way to run the image as follows:

```
$ docker run -d -P 
    --name mysql \
    -e MYSQL_USER=bobsense \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=HelloWorld  \
    bobsense/mysql
```

* `MYSQL_USER` to set a specific username
* `MYSQL_PASSWORD` to set a specific password
* `MYSQL_DATABASE` to create a database

If you do simply use mysql, it offers you a default user `mysql` and related password `123456`. Type as follows:

```
$ docker run -d -P --name mysql bobsense/mysql
```

You should make sure which port on host is assigned to 3306 exposed on mysql container. Type as follows:

```
$ docker port mysql 3306
```

Then you will get like `0.0.0.0:32771`, so `32771` is the one assigned to 3306.

You can check the logs of the container by running:

```
$ docker logs mysql
```

You can use mysql service from the mysql container if you see an output like the following:

```
=================================================================
You have the MySQL configuration as follows:
MySQL_USER : "bobsense"
MySQL_PASSWORD : "123456"
MySQL_DATABASE : "HelloWorld"

160327 08:29:12 mysqld_safe Logging to '/u01/my3306/log/alert.log'
160327 08:29:13 mysqld_safe Starting mysqld daemon with databases from /u01/my3306/data
```

Then you can log on mysql server and run mysql as you want. Just type:

```
$ mysql -ubobsense -p123456 -P32771 -h127.0.0.1
```

## Persist database data

The MySQL server is configured to store data in the `/u01/my3306/data` directory inside the container. You can map the
container's `/u01/my3306/data` volume to a volume on the host so the data becomes independent of the running container:

```
$ mkdir -p /tmp/mysql
$ docker run -d -P 
    --name mysql \
    -e MYSQL_USER=bobsense \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=HelloWorld  \
    -v /tmp/mysql:/u01/my3306/data \
    bobsense/mysql
```

## Use your my.cnf

You are allowed to run mysql container based on your my.cnf instead of the default, you should do like:

```
$ docker run -d -P 
    --name mysql \
    -e MYSQL_USER=bobsense \
    -e MYSQL_PASSWORD=123456 \
    -e MYSQL_DATABASE=HelloWorld  \
    -v xxxx/my.cnf:/etc/my.cnf \
    bobsense/mysql
```

# DIY

In order to make Image smaller, I simply add mysql files which have been installed successfully to Dockerfile. If you want to make Image based on percona source code, you can do as follows:

```
$ cd percona-server-5.6.22-72.0
$ sh BUILD/autorun.sh
$ cmake -DCMAKE_INSTALL_PREFIX=/u01/my3306 -DMYSQL_DATADIR=/u01/my3306/data \
    -DMYSQL_USER=mysql -DSYSCONFDIR=/etc -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MEMORY_STORAGE_ENGINE=1 \
    -DMYSQL_UNIX_ADDR=/u01/my3306/run/mysql.sock -DMYSQL_TCP_PORT=3306 \
    -DENABLED_LOCAL_INFILE=1  -DWITH_PARTITION_STORAGE_ENGINE=1 -DWITH_EMBEDDED_SERVER=OFF \
    -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8  -DDEFAULT_COLLATION=utf8_general_ci
$ make && make install
```

# Special Declare
Refer to [frodenas/mysql](https://hub.docker.com/r/frodenas/mysql/).
And you are welcomed to make suggestions. I will try my best to make better.
