#!/bin/bash

exclude=(
  downloads
  share
  development
  virtual
)

host="$(hostname)"
path="/toker"
log="/toker/various/logs/backup.log"
dest="internal:/toker/backup-${host,,}"
date=$(date +"%Y-%m-%d %T")

cd $path

clear

echo -e "\nBackup in progress to Internal"

for d in */
do

  d=${d//\//}

  if [[ ! ${exclude[@]} =~ $d ]]
  then

    echo -e "\n${d^} ... "

    rsync \
      --human-readable \
      --stats \
      --archive \
      --acls \
      --owner \
      --group \
      --delete \
      --compress \
      --verbose \
      $path/$d $dest
      #--log-file=$log \
  fi

done

echo -e "\nBackup complete\n"

