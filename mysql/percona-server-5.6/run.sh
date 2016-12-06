#!/bin/bash
MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-"mysql"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"123456"}

groupadd mysql
useradd -g mysql mysql
chown -R mysql.root /u01

DATA_DIR=/u01/my3306/data/mysql
if [ -d $DATA_DIR ]; then
    /u01/my3306/bin/mysqld_safe --defaults-file=/etc/my.cnf --basedir=/u01/my3306 --datadir=/u01/my3306/data
    exit
fi
#Initialize Database
/u01/my3306/scripts/mysql_install_db --basedir=/u01/my3306 --datadir=/u01/my3306/data --user=mysql

#Start MySQL Service
/u01/my3306/bin/mysqld_safe --defaults-file=/etc/my.cnf --basedir=/u01/my3306 --datadir=/u01/my3306/data &
sleep 60
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION "
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@localhost IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION"

if [ "$MYSQL_DATABASE" ]; then
   mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`"
fi

#Stop MySQL Service
mysqladmin -uroot shutdown

#Output log
echo "======================================================="
echo "You have the MySQL configuration as follows:"
echo "MySQL_USER : \"${MYSQL_USER}\""
echo "MySQL PASSWORD : \"${MYSQL_PASSWORD}\""
echo "MySQL_DATABASE : \"${MYSQL_DATABASE}\"" 
echo ""

/u01/my3306/bin/mysqld_safe --defaults-file=/etc/my.cnf --basedir=/u01/my3306 --datadir=/u01/my3306/data
