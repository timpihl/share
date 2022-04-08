#!/bin/bash

cd /toker/swag/
docker-compose down

cd /toker/code/
docker-compose down

cd /toker/deconz/
docker-compose down

cd /toker/homebridge/
docker-compose down

cd /toker/nodered/
docker-compose down

cd /toker/plex/
docker-compose down

cd /toker/transmission/
docker-compose down

cd /toker/unifi/
docker-compose down

cd /toker/

echo '
Docker containers stoped
'
