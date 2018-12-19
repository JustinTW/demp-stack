#!/bin/bash
source ../../../.env/config.env

docker exec -it web-stack-mysql-db-1 chmod 777 /var/lib/mysql -R

# root for phpmyadmin
docker exec -it web-stack-mysql-db-1 mysql -uroot \
  -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'web-stack-pma.web-stack' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# create db for phpmyadmin
docker exec -it web-stack-mysql-db-1 mysql -uroot \
  -e "CREATE DATABASE phpmyadmin;"  > /dev/null 2>&1

if [ $? -eq 0 ]; then
  # pma for phpmyadmin
  docker exec -it web-stack-mysql-db-1 mysql -uroot \
    -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO '$PMA_USERNAME'@'web-stack-pma.web-stack' IDENTIFIED BY '$PMA_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

  # import db for phpmyadmin
  docker exec -i web-stack-mysql-db-1 mysql -uroot \
    phpmyadmin < ./data/shared/phpmyadmin.sql

  echo "grant-privileges success !!"
fi

docker exec -it web-stack-mysql-db-1 chmod 777 /var/lib/mysql -R
