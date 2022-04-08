#!/bin/bash
#
# Toker
#

echo -e "Initiating... \n"

a='bash-completion curl gnupg2 nano upgrade-system'
b='/toker/share/install.d'

bash $b/install-lolcat.sh
bash $b/install-shell.sh
bash $b/install-network.sh

apt-get full-upgrade -y | lolcat
apt-get install $a -y | lolcat

echo -e '\nCreating folder toker' | lolcat
mkdir /toker &> /dev/null;

echo -e '\nConf ssh & pam ' | lolcat
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config &> /dev/null
sed -i 's/#PrintLastLog yes/PrintLastLog no/g' /etc/ssh/sshd_config &> /dev/null
sed -i '/^#\s/d' /etc/ssh/sshd_config &> /dev/null
sed -i 'N;/^\n/d' /etc/ssh/sshd_config &> /dev/null
sed -i 's/^session    optional   pam_motd.so motd=\/run\/motd.dynamic/#session    optional   pam_motd.so motd=\/run\/motd.dynamic/g' /etc/pam.d/login &> /dev/null
sed -i 's/^session    optional     pam_motd.so  motd=\/run\/motd.dynamic/#session    optional     pam_motd.so  motd=\/run\/motd.dynamic/g' /etc/pam.d/sshd &> /dev/null
sed -i 's/^session    optional   pam_lastlog.so/#session    option   pam_lastlog.so/g' /etc/pam.d/login &> /dev/null

echo -e '\nCleaning ' | lolcat
systemctl disable apt-daily-upgrade.timer &> /dev/null &> /dev/null
systemctl disable apt-daily.timer &> /dev/null &> /dev/null
rm -rf /etc/update-motd.d/ &> /dev/null
apt-get autopurge -y &> /dev/null
apt-get autoremove -y &> /dev/null
apt-get autoclean -y &> /dev/null

echo -e '\nInit completed. \n' | lolcat
