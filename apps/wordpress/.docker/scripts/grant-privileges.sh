#!/bin/bash

docker exec -it web-stack-mysql-db-1 chmod 777 /var/lib/mysql -R

# create db for wordpress
docker exec -it web-stack-mysql-db-1 mysql -uroot \
  -e "CREATE DATABASE wordpress;"  > /dev/null 2>&1
if [ $? -eq 0 ]; then
  docker exec -it web-stack-mysql-db-1 mysql -uroot \
    -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'web-stack-wordpress.web-stack' IDENTIFIED BY '123456' WITH GRANT OPTION; FLUSH PRIVILEGES;"

  # import db for phpmyadmin
  docker exec -i web-stack-mysql-db-1 mysql -uroot \
    wordpress < ./.docker/wordpress/wordpress.sql

  echo "grant-privileges success !!"
fi
