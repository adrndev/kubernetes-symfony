#!/bin/bash

# Assign dump name to variable
export DUMP_FILE=/backup_`date +%Y%m%d_%H%M%S`.pgdump

# Create dump file
PGPASSWORD=$POSTGRES_PASSWORD pg_dump -d $POSTGRES_DB -U $POSTGRES_USER -h postgres-service -f $DUMP_FILE

# Compress dump file
bzip2 $DUMP_FILE

# Encrypt dump file
echo $BACKUP_PASSWORD | gpg --batch --passphrase-fd 0 --symmetric --cipher-algo AES256 ${DUMP_FILE}.bz2

# Send dump file to AWS
aws s3 cp ${DUMP_FILE}.bz2.gpg $BACKUP_PATH