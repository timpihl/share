#!/bin/bash

docker network create -d macvlan \
  --subnet=10.10.30.0/24 \
  --ip-range=10.10.30.0/24 \
  --gateway=10.10.30.254 \
  -o parent=toker1 v30

echo '
Docker network v30 macvlan configured
'
