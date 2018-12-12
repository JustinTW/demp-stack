#!/bin/bash

docker exec -it mysql-db-1 mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY 'Moxa89191230' WITH GRANT OPTION; FLUSH PRIVILEGES;"

