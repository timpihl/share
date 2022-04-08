#!/bin/bash
#
# Toker
#

run()
{

  echo -e "Updating system \n"

  apt-get update

  apt-get full-upgrade -y

  apt-get autopurge -y

  apt-get autoclean -y

  echo ""

}

run #| lolcat
