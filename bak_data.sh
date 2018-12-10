#!/bin/bash

datename=$(date +%Y%m%d-%H%M%S)
# $1 is db container name, $2,$3 is db user and password, $4 is table or db name
docker exec -it $1  mysqldump -u$2 -p$3 $4 > /opt/sql_bak/$datename.sql
