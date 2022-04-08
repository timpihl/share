#!/bin/bash
#
# Toker
#

app="Hassio"

echo -e "Installing $app \n"

a='/toker/share/hassio-installer.sh'
b='/toker/hassio'

apt-get install \
        systemd \
        network-manager \
        apparmor \
        jq \
        dbus -y

curl -Lo $a https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh
bash $a --data-share $b
rm -rf $a

echo -e "\n$app installed \n"
