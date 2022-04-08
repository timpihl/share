#!/bin/bash
#
# Toker
#

run()
{

  path=$PWD
  active=$(docker ps --filter status=running --format "{{.Names}}" | sort)

  echo -e "Updating containers \n"

  for i in $active
  do

    cd "/toker/$i"
    echo "Pulling $i..."
    docker-compose pull &> /dev/null
    docker-compose up -d
    echo ""

  done

  if [ -d "/toker/postgresql" ]
  then

    bash /toker/share/dc.d/postgresql.sh

  fi

  cd $path
  docker system prune --all --force

}

run #| lolcat
