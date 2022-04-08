#
# Toker
#

cd /

export LC_ALL=en_US.UTF-8
export ts="/toker/share"
export EDITOR=nano

alias lolcat="lolcat-c -h 0.3 -v 0.3"
alias lol="lolcat"

#alias reboot="reboot && exit"

alias ls="ls --group-directories-first -a1"
#alias ls="ls --color --group-directories-first -a1"

alias cdts="cd /toker/share"

alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcdrr="docker-compose down --remove-orphans --rmi all --volumes"
alias dcdr="docker-compose down --remove-orphans"
alias dcr="docker-compose restart"
alias dcps="bash /toker/share/dc.d/ps.sh"
alias dcra="bash /toker/share/dc.d/restart-all.sh"
alias dck="docker-compose kill"
alias hassio="cd /toker/hassio/"
alias myip="curl ifconfig.co"
alias status="bash /toker/share/scripts.d/status.sh"

alias speedtest="speedtest -s 34024"

alias clean="apt-get autoremove -y | lol && apt-get autoclean -y | lol"

alias update-system="bash /toker/share/scripts.d/update-system.sh"
alias update-containers="bash /toker/share/dc.d/update-containers.sh"
alias upgrade="upgrade-system"
#alias bash="bash $ts/run.sh"
alias hassio="bash /toker/hassio/hassio.sh"

. /toker/share/conf.d/shell.d/functions.sh

#clear

#echo -e "\nLogged in to $(hostname)\n"
