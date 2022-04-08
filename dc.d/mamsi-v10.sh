#!/bin/bash

docker network create -d macvlan \
  --subnet=192.168.10.0/24 \
  --ip-range=192.168.10.0/24 \
  --gateway=192.168.10.1 \
  -o parent=eth0 v10

echo '
Docker network v10 macvlan configured
'
