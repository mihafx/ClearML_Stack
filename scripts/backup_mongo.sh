#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
docker exec clearml-mongo \
  mongodump --archive=/data/db/backup_$TIMESTAMP.gz --gzip

echo "Backup completed: backup_$TIMESTAMP.gz"