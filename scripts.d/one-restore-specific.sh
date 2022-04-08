#!/bin/bash
#
# Toker
#

path="/toker/backup-one"
d="code"
dest="122:/toker"

rsync   --human-readable \
	--stats \
	--archive \
	--delete \
	$path/$d $dest | lolcat

