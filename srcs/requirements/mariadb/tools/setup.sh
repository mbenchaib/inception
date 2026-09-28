#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ -d /var/lib/mysql/mysql ]; then
	:
else
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

	mariadbd --user=mysql &

	until mariadb-admin ping --silent
	do
    		sleep 1
	done

	USER_PASSWORD=$(cat /run/secrets/db_password)
	DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

	mariadb << EOF
	CREATE DATABASE ${DB_NAME};
	CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${USER_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
EOF

fi
mariadb-admin -u root -p"$DB_ROOT_PASSWORD" shutdown
exec mariadbd --user=mysql


