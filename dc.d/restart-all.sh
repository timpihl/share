#!/bin/bash
#
# Toker
#

path=$PWD
active=$(docker ps --filter status=running --format "{{.Names}}" | sort)

#echo $1

for i in $active
do
  echo -n "Re-deploying: $i"
  cd "/toker/$i"
  echo -n "..."
  docker-compose down --remove-orphans --rmi all --volumes &> /dev/null
  docker-compose up -d &> /dev/null
  echo -e " done\n"
done

cd $path
