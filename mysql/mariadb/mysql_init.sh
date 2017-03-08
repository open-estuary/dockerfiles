#!/bin/bash

MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-"mysql"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"Estuary12#$"}

check_startup_str() {
    expected_str=${1}
    max_retry_num=20
    cur_retry=0
    has_started=0
    while [[ ${cur_retry} -lt ${max_retry_num} ]] ;
    do
        echo "Check whether server has started yet or not ......"
        if [ -f "/u01/mariadb/log/alert.log" ] ; then 
            CHECK_STR=$(grep "${expected_str}" /u01/mariadb/log/alert.log)
            if [ "${CHECK_STR}" ] ; then
                let "has_started=1"
                echo "Percona Server has started successfully"
                break
            fi
        fi
        let "cur_retry++"
        sleep 5
    done

    if [ ${has_started} -eq 0 ]; then
        echo "Hmm...Please check alert.log manually to see why the server has not started yet"
    fi
}


start_mysql_server() {
    rm -fr /u01/mariadb/log/alert.log
    /usr/local/mariadb/bin/mysqld_safe --defaults-file=/etc/my_mariadb.conf \
                                --basedir=/usr/local/mariadb \
                                --datadir=/u01/mariadb/data &
    check_startup_str "ready for connection"
}

if [  ! -d "/u01/mariadb/data" ] ; then
    #Step1: Initialize Database
    mkdir -p /u01/mariadb/tmp
    mkdir -p /u01/mariadb/log
    mkdir -p /u01/mariadb/run
    
    chown -R mysql /u01/mariadb

    cp -f /usr/local/mariadb/config/my.conf /etc/my_mariadb.conf

    /usr/local/mariadb/bin/mysql_install_db --defaults-file=/etc/my_mariadb.conf  \
                                     --basedir=/usr/local/mariadb \
                                     --datadir=/u01/mariadb/data \
                                     --user=mysql

    #Step2: Start Database
    start_mysql_server

    #Step3: Set root rights
    /usr/local/mariadb/bin/mysql -uroot --socket=/u01/mariadb/run/mysql.sock << EOF
SET PASSWORD=PASSWORD("${MYSQL_PASSWORD}");
UPDATE mysql.user SET password=PASSWORD("${MYSQL_PASSWORD}") WHERE user='mysql';
GRANT ALL PRIVILEGES ON *.* TO mysql@localhost IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO mysql@"%" IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
flush privileges;
EOF
    #Step4: Stop MariaDB service firstly (which will be started later)
    /usr/local/mariadb/bin/mysqladmin -uroot --socket=/u01/mariadb/run/mysql.sock -p"${MYSQL_PASSWORD}" shutdown
    sleep 15
fi

exec "$@"

