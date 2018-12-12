#!/bin/bash

docker exec -it testlink-mysql mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY '54323013' WITH GRANT OPTION; FLUSH PRIVILEGES;"

docker exec -it hackpad-mysql mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY '54323013' WITH GRANT OPTION; FLUSH PRIVILEGES;"


#docker exec -it hackpad-mysql mysql -uroot -proot_password\
#      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.12' IDENTIFIED BY '54323013' WITH GRANT OPTION; FLUSH PRIVILEGES;"


docker exec -it redmine-mysql mysql -uroot \
      -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.18.0.%' IDENTIFIED BY '54323013' WITH GRANT OPTION; FLUSH PRIVILEGES;"

