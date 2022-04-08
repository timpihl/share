#!/bin/bash

a=$1
b=$2

from=$(pwd)

if [ ! -z $2 ]
then

  cd $tf/$1.d
  bash $2.sh

else

  cd $tf
  bash $1.sh

fi

cd $from
