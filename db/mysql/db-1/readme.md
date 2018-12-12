# SOP for recover db

```
clean or rename old database
docker exec -i mysql-db-1 mysql -u root redmine_production < /mnt/nas/backup/db/
```
