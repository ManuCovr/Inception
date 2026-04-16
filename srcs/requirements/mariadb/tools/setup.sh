#!/bin/bash
set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

# if DB is already initialized, just start and stay
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    exec mysqld --user=mysql
fi

# first time setup
mysqld_safe --user=mysql &
pid=$!

until mysqladmin ping -u root --silent 2>/dev/null; do
    sleep 1
done

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat /run/secrets/db_root_password)';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$(cat /run/secrets/db_root_password)" shutdown
wait "$pid"

exec mysqld --user=mysql