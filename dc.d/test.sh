#!/bin/bash
#
# Toker
#

path=$PWD
active=$(docker ps --filter status=running --format "{{.Names}}" | sort)

#active="code deconz hassio homebridge nodered plex swag transmission"

check() {

  for i in $active
  do

#    echo "$i"
    cd "/toker/$i"
    docker-compose pull
    docker-compose up -d

  done

  cd $path

  echo ""
  docker system prune --all --force

}

check
