#!/bin/bash
#
# Toker
#

image=$(cat /toker/hassio/docker-compose.yaml | awk -F "home-assistant:" '/home-assistant:/{print $2}')

current=$(cat /toker/hassio/config/.HA_VERSION)

ha_check() {

  echo -e "\n$(date +"%Y-%m-%d %T")"

  if [ $image = 'beta' ]
  then

    url="https://raw.githubusercontent.com/home-assistant/version/master/beta.json"
    new=$(curl -s "https://raw.githubusercontent.com/home-assistant/version/master/beta.json" | awk -F '"' '/default/ {print $4}')

  fi

  if [ $image = 'dev' ]
  then

    url="https://raw.githubusercontent.com/home-assistant/version/master/dev.json"
    new=$(curl -s "https://raw.githubusercontent.com/home-assistant/version/master/dev.json" | awk -F '"' '/default/ {print $4}')

  fi

  if [ $new != $current ]
  then

    echo "Updating from $current to $new"

    cd /toker/hassio

    /usr/local/bin/docker-compose down --remove-orphans --rmi all --volumes &> /dev/null
    /usr/local/bin/docker-compose up -d &> /dev/null

  else

    echo "No update available"

  fi

}

ha_check
