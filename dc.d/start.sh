#!/bin/bash

cd /toker/swag/
docker-compose up -d

cd /toker/code/
docker-compose up -d

cd /toker/deconz/
docker-compose up -d

cd /toker/homebridge/
docker-compose up -d

cd /toker/nodered/
docker-compose up -d

cd /toker/plex/
docker-compose up -d

cd /toker/transmission/
docker-compose up -d

cd /toker/unifi/
docker-compose up -d

cd /toker/

echo '
Docker containers started
'
