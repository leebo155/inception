#!/bin/bash

# service start
/etc/init.d/mariadb start

# mariadb create database, user and grant
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > /root/sql
echo "CREATE USER IF NOT EXISTS $DB_ADMIN_NAME@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD' ;" >> /root/sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_ADMIN_NAME@'%' ;" >> /root/sql
echo "FLUSH PRIVILEGES;" >> /root/sql
mariadb < /root/sql

# service stop
/etc/init.d/mariadb stop

# service demon start
/usr/sbin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --skip-log-error --pid-file=/run/mysqld/mysqld.pid --socket=/run/mysqld/mysqld.sock --bind-address=0.0.0.0
