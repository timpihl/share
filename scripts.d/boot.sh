#!/bin/bash
#
# Toker
#

hostname=$(hostname)
mysql="/var/run/mysqld"

sleep 3

if [ -d "$mysql" ]
then
    chown 1000:1000 -hR /var/run/mysqld
fi

if [ $hostname == "internal" ]
then

    bash /toker/scripts/inotify.sh &> /dev/null

    sysctl -w net.ipv6.conf.all.disable_ipv6=1 &> /dev/null
    sysctl -w net.ipv6.conf.lo.disable_ipv6=1 &> /dev/null
    sysctl -w net.ipv6.conf.default.disable_ipv6=1 &> /dev/null

    chown 1001:1001 -hR /toker/mongodb/*

fi

if [ $hostname == "toker" ]
then

  ip link set eth0 promisc on

  bash /toker/share/scripts.d/dockerNet-shim.sh

  chown root:root /toker/share/conf.d/ssh.d/config

fi

if [ $hostname == "mamsi" ]
then

  ip link set eth0 promisc on

fi

if [ $hostname != "internal" ]
then

  chown --recursive root:root /toker/postgresql/config

fi

chown -R root:root /toker/share/
chown root:root /toker/share/conf.d/ssh.d/config

systemctl restart docker &> /dev/null
