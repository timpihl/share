#!/bin/bash

name="br0"
subnet="192.168.20.0/24"
ip_range="192.168.20.0/24"
gateway="192.168.20.1"
parent="eth0"

docker network create -d macvlan \
  --subnet=$subnet \
  --ip-range=$ip_range \
  --gateway=$gateway \
  -o parent=$parent $name

echo -e "\nDocker network $name macvlan configured "
