#!/bin/bash

docker exec -it mysql-db-2 mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.16.21.%' IDENTIFIED BY 'Moxa89191230' WITH GRANT OPTION; FLUSH PRIVILEGES;"

