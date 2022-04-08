#!/bin/bash
#
# Toker
#

app="Speedtest"

echo -e "\nInstalling $app \n"

install()
{

  gpg_key_url="https://packagecloud.io/ookla/speedtest-cli/gpgkey"
  apt_source_path="/etc/apt/sources.list.d/speedtest.list"

  curl -L "$gpg_key_url" 2> /dev/null | apt-key add - &>/dev/null

  echo "deb https://packagecloud.io/ookla/speedtest-cli/ubuntu/ focal main" > $apt_source_path
  echo "deb-src https://packagecloud.io/ookla/speedtest-cli/ubuntu/ focal main" >> $apt_source_path

  apt-get update &> /dev/null
  apt-get install speedtest &> /dev/null

  echo "speedtest -s 34024 (Bahnhof)"

}

install

echo -e "\n$app installed \n"
