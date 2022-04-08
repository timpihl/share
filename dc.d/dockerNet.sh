#!/bin/bash

name="dockerNet"
subnet="10.10.0.0/24"
ip_range="10.10.0.0/24"
gateway="10.10.0.1"
parent="eth0"

docker network create -d macvlan \
  --subnet=$subnet \
  --ip-range=$ip_range \
  --gateway=$gateway \
  -o parent=$parent $name

echo -e "\nDocker network $name macvlan configured "
