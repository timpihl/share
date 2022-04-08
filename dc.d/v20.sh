#!/bin/bash

docker network create -d macvlan \
  --subnet=10.10.20.0/24 \
  --ip-range=10.10.20.0/24 \
  --gateway=10.10.20.254 \
  -o parent=toker0 v20

echo '
Docker network v20 macvlan configured
'
