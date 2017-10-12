#!/bin/bash

find /etc/hive/conf.template -type f | while read i
do
    F=$(basename $i)
    envsubst \$METASTORE_HOST,\$S3_DEFAULT_BUCKET,\$DB_HOST,\$DB_PORT,\$HIVE_DB,\$HIVE_USER,\$HIVE_PASSWORD  < $i > /etc/hive/conf/$F
done

$@
