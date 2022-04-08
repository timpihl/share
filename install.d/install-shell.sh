#!/bin/bash
#
# Toker
#

from="/toker/share/conf.d/shell.d"
to="/root"
c="bashrc"
d="zshrc"

echo -e "Updating $SHELL\n"

if [ $SHELL == '/bin/bash' ]
then

  cp -fv $from/bashrc $to/.bashrc

elif [ $SHELL == '/usr/bin/zsh' ]
then

  cp -fv $from/zshrc $to/.zshrc

fi