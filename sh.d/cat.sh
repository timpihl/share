#!/bin/bash

if [ ! -z $1 ]
then

  cat $1 | lolcat

else

  echo "Missing which file to cat" | lolcat

fi
