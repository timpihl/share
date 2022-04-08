#!/bin/bash
#
# Toker
#

run()
{
  echo -e '\nRunning containers: \n'

  docker ps --format "{{.Names}}" | sort

  #echo ''
}
run | lolcat