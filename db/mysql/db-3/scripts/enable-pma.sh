#!/bin/bash

docker exec -it mysql-db-3 mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION; FLUSH PRIVILEGES;"

