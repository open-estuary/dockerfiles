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
        if [ -f "/u01/my3306/log/alert.log" ] ; then 
            CHECK_STR=$(grep "${expected_str}" /u01/my3306/log/alert.log)
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
    rm -fr /u01/my3306/log/alert.log
    /u01/my3306/bin/mysqld_safe --defaults-file=/etc/my.conf \
                                --basedir=/u01/my3306 \
                                --datadir=/u01/my3306/data &
    check_startup_str "ready for connection"
}

if [  ! -d "/u01/my3306/data/mysql" ] ; then
    #Step1: Initialize Database
    mkdir -p /u01/my3306/tmp
    mkdir -p /u01/my3306/log
    mkdir -p /u01/my3306/run
    ln -s /u01/my3306/share /u01/mysql/share
    chown -R mysql.root /u01

    /u01/my3306/scripts/mysql_install_db --defaults-file=/etc/my.conf  \
                                     --basedir=/u01/my3306 \
                                     --datadir=/u01/my3306/data \
                                     --user=mysql

    #Step2: Start Database
    start_mysql_server

    #Step3: Set root rights
    /u01/my3306/bin/mysql -uroot --socket=/u01/my3306/run/mysql.sock << EOF
SET PASSWORD=PASSWORD("${MYSQL_PASSWORD}");
UPDATE mysql.user SET password=PASSWORD("${MYSQL_PASSWORD}") WHERE user='mysql';
GRANT ALL PRIVILEGES ON *.* TO miysql@localhost IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO mysql@"%" IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "${MYSQL_PASSWORD}" WITH GRANT OPTION;
flush privileges;
EOF
    #Step4: Stop MySQL service firstly (which will be started later)
    /u01/my3306/bin/mysqladmin -uroot --socket=/u01/my3306/run/mysql.sock -p"${MYSQL_PASSWORD}" shutdown
    sleep 30
fi

exec "$@"

