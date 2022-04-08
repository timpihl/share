#!/bin/bash

old=$PWD
postgresql="/toker/postgresql"
hassio="/toker/hassio"

cd $postgresql
chown --recursive root:root $postgresql/config
docker-compose kill
docker-compose up -d

cd $hassio
docker-compose kill
docker-compose up -d

cd $old