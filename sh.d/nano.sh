#!/bin/bash

a=$1
b=$2

from=$(pwd)

if [ ! -z $2 ]
then

  nano $tf/$1.d/$2

else

  nano $tf/$1

fi

cd $from
