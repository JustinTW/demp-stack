# SOP for recover db

```
clean or rename old database
docker exec -i pg-db-1 psql  -U root -d gitlabhq_production < /mnt/nas/backup/db/
```
