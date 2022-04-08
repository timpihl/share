#!/bin/bash
#
# Toker
#

name="v20-shim"
host="10.10.20.99/24"
mac="aa:aa:aa:20:00:99"

addresses=$(docker network inspect v20 | jq -r '.[].Containers[].IPv4Address' | sort | sed 's/\/24//g')

if [ ! -d "/sys/class/net/$name" ] 
then
  ip link add $name link eth0 type macvlan mode bridge
  ip addr add $host dev $name
  ip link set dev $name address $mac
  ip link set $name up
  ip link set $name promisc on
fi

for i in $addresses
do
  ip route add $i dev $name
done
