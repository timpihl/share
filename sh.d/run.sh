#!/bin/bash

name=$1
action=$2
current=$(pwd)

cd "/toker/$1"

if [ $2 == "up" ]; then
    docker-compose up -d;
fi
if [ $2 == "down" ]; then
    docker-compose down;
fi
if [ $2 == "log" ]; then
    docker-compose logs -f;
fi
if [ $2 == "re" ]; then
    docker-compose down;
    docker-compose up -d;
fi
if [ $2 == "rm" ]; then
    docker-compose down --remove-orphans --rmi all;
fi

cd "$current"