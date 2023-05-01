mysqld &

sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE_NAME;"
mysql -e "CREATE USER IF NOT EXISTS $SQL_USER_NAME@localhost IDENTIFIED BY '$SQL_USER_PASSWORD';"
mysql -e -uroot --skip-password "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER_NAME'@% IDENTIFIED BY '$SQL_USER_PASSWORD';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "ALTER USER root@localhost IDENTIFIED BY $SQL_ROOT_PASSWORD;"
mysql -e "FLUSH PRIVILEGES"

echo ta mere
service mysql stop
exec mysqld
echo ta mere
