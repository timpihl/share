#!/bin/bash

cd /toker/swag/
docker-compose down
docker-compose up -d

#cd /toker/code/
#docker-compose down
#docker-compose up -d

cd /toker/deconz/
docker-compose down
docker-compose up -d

cd /toker/homebridge/
docker-compose down
docker-compose up -d

cd /toker/nodered/
docker-compose down
docker-compose up -d

cd /toker/plex/
docker-compose down
docker-compose up -d

cd /toker/transmission/
docker-compose down
docker-compose up -d

cd /toker/unifi/
docker-compose down
docker-compose up -d

cd /toker/

echo '
Docker containers restarted
'
