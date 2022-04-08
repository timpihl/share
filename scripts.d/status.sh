#!/bin/bash
#
# Toker
#

run()
{
  clear

  dist=$(cat /etc/os-release | awk -F "=" '/^ID=/ {print $2}')
  host=$(hostname | awk -F . '{print $1}')
  kernel=$(uname -r | sed 's/-amd64//g; s/-generic//g')
  shell=$SHELL
  packages=$(dpkg --list | wc -l)
  running=$(ps -e --no-headers | wc -l)
  up=$(uptime -p | sed 's/^up //; s/ days/d/g; s/ day/d/g; s/ hours/h/g; s/ hour/h/g; s/ minutes/m/g; s/ minute/m/g')
  users=$(users | wc -w)
  cpu_load=$(cat /proc/loadavg | awk '{print $1}')
  ssd_load=$(df -h / | awk '/\// {print $(NF-1)}')
  ssd_cap=$(df -h / | awk '/\// {print $(NF-4)}')
  ram_load=$(free -m | awk '/Mem/ { printf("%3.1f%%", $3/$2*100) }')
  ram_cap=$(cat /proc/meminfo | awk '/MemTotal:/ {printf "%.0fG\n",$2/1020^2}')
  eth0=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
  eth1=$(ip -4 addr show eth1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
  wlan0=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
  external=$(curl -s4 ifconfig.co)
  lang=$LC_ALL
  echo "                                            █    "
  echo "             -+shdmNNNNmdhs+-               █    "
  echo "         .+hMNho/:..  ..:/ohNMh+.           █    "
  echo "       :hMdo.                .odMh:         █    "
  echo "     -dMy-  ****           *   -yMd-        █    OS:         ${dist^}"
  echo "    sMd-   *  *************      -dMs       █    Host:       ${host^}"
  echo "   hMy    *     *********          yMh      █    RAM:        $ram_load of $ram_cap"
  echo "  yMy     *     *  *                yMy     █    SSD:        $ssd_load of $ssd_cap"
  echo " :Mm       **  *  **                 mM:    █    CPU:        $cpu_load"
  echo " yM+          *  ***                 +My    █    Running:    $running"
  echo " mM-         **   **                 -Mm    █    Uptime:     $up"
  echo " mM-         **   **                 -Mm    █    Kernel:     $kernel"
  echo " yM+         **   **                 +My    █    Shell:      $shell"
  echo " :Mm         **   **                 mM:    █    Eth0:       $eth0"
  echo "  yMy         **  **                yMy     █    Eth1:       $eth1"
  echo "   hMy         ** *      *         yMh      █    Wlan0:      $wlan0"
  echo "    sMd-        ***     *        -dMs       █    External:   $external"
  echo "     -dMy-       *******       -yMd-        █    Locale:     $lang"
  echo "       :hMdo.      ***      .odMh:          █    "
  echo "         .+hMNho/:..  ..:/ohNMh+.           █    "
  echo "             -+shdmNNNNmdhs+-               █    "
  echo "                                            █    "
}

run | lolcat