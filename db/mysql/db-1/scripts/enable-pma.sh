#!/bin/bash

docker exec -it mysql-db-1 mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION; FLUSH PRIVILEGES;"

