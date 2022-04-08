#!/bin/bash
#
# Toker
#

app="Docker"

echo -e "Installing $app \n"

dist=$(cat /etc/os-release | awk -F "=" '/^ID=/ { print $2 }')
apt_source="/etc/apt/sources.list.d/docker.list"

echo -e "Installing curl & gnupg1 \n"
apt-get install curl gnupg1 -y &> /dev/null

if [ $dist == debian ]
then

  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - &> /dev/null

  echo "#deb [arch=amd64] https://download.docker.com/linux/debian buster test" > $apt_source
  echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" >> $apt_source

elif [ $dist == ubuntu ]
then

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &> /dev/null

  echo "#deb [arch=amd64] https://download.docker.com/linux/ubuntu focal test" > $apt_source
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" >> $apt_source

fi

apt-get update #&> /dev/null
apt-get install -y docker-ce #&> /dev/null
apt-get autopurge -y &> /dev/null
apt-get autoclean -y &> /dev/null

echo -e "\n$app installed \n"