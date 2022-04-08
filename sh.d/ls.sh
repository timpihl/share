#!/bin/bash
#
# Toker
#

if [ ! -z $2 ]
then

  ls "$1" "$2" | lolcat

elif [ ! -z "$1" ]
then

  ls -AFghlo "$1" | lolcat

else

  ls -AFghlo | lolcat

fi
