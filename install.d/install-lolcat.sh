#!/bin/bash
#
# Toker
#

app="Lolcat"

echo -e "Installing $app \n"

from="/toker/share/conf.d/lolcat.d"
to="/usr/bin/"

cp -v $from/* $to

echo -e "\n$app installed \n"