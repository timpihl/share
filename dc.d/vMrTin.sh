#!/bin/bash

docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --ip-range=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 dockerNet

echo -e "\nDocker network v1 macvlan configured "