#!/bin/bash
#
# Toker
#

dist=$(cat /etc/os-release | awk -F "=" '/^ID=/ { print $2 }')

echo -e "\nSetting up network for $dist"

conf="/toker/share/conf.d/network.d"
network="/lib/systemd/network"
netplan="/etc/netplan"
etc="/etc/default"

echo -e "\nInstalling Network-Manager "
apt-get install network-manager -y &> /dev/null

echo -e "\nEdit GRUB "
sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub

echo -e "\nRemoving old files "
rm -rf $netplan/*

echo -e "\nCopying files "
#cp -f $conf/2*.link $network
cp -f $conf/00-netplan.yaml $netplan
#cp -f $conf/grub $etc

echo -e "\nRunning: grub-mkconfig "
grub-mkconfig &> /dev/null

echo -e "\nRunning: update-grub "
update-grub &> /dev/null

echo -e "\nRunning: update-grub2 "
update-grub2 &> /dev/null

echo -e "\nRunning: netplan apply "
netplan apply #&> /dev/null

echo -e '\nNetwork done \n'
