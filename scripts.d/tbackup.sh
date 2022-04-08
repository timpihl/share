#!/bin/bash
#
# Toker
#

exclude=(
  downloads
  share
  development
  virtual
)

host="$(hostname)"
dest="internal:/toker/backup-${host,,}"
date=$(date +"%Y-%m-%d %T")

clear

cd /toker

echo "Backup in progress to Internal"

for d in */
do

  d=$(echo $d | sed 's/\///g')

  if [[ ! ${exclude[@]} =~ $d ]]
  then

    echo ""
    echo "${d^} ... "

    rsync \
	    --human-readable \
	    --stats \
	    --archive \
      --acls \
      --owner \
      --group \
	    --delete \
	    $d $dest
  fi

done

echo ""
echo "Backup complete"
echo ""