#!/bin/bash
#
# Toker
#

OPTION=$1

SOURCE="/toker/virtual/hassos_ova-6.0.dev20210105.vdi"

NAME="Hassio"
FILE="/toker/virtual/Hassio/Hassio.vdi"
OSTYPE="Linux_64"
BASE="/toker/virtual"
RAM="4096"
CPU="2"
MAC="aaaaaa200020"
ADAPTER="toker0"
STATE=$(VBoxManage list runningvms | grep $NAME)
FOLDER="$BASE/$NAME"

vm_create() {
  echo -e "\nCreating $NAME"
  mkdir $FOLDER &> /dev/null
  cp $SOURCE $FILE &> /dev/null

  VBoxManage createvm \
    --name $NAME \
    --ostype $OSTYPE \
    --basefolder $BASE \
    --register
  
  VBoxManage storagectl $NAME \
    --name NVMe \
    --add pcie \
    --controller NVMe

  VBoxManage storageattach $NAME \
    --storagectl NVMe \
    --port 0 \
    --device 0 \
    --type hdd \
    --medium $FILE

  VBoxManage modifyvm $NAME \
    --memory $RAM \
    --cpus $CPU \
    --firmware efi \
    --nic1 bridged \
    --nictype1 82545EM \
    --macaddress1 $MAC \
    --nicpromisc1 allow-all \
    --bridgeadapter1 $ADAPTER
}
vm_modify() {
  echo -e "\nModifing $NAME"
  VBoxManage modifyvm $NAME \
    --memory $RAM \
    --cpus $CPU \
    --cpuhotplug on \
    --pae on \
    --longmode on \
    --hwvirtex on \
    --apic on \
    --paravirtprovider default \
    --nestedpaging on \
    --largepages on \
    --vtxvpid on \
    --vtxux on \
    --nested-hw-virt on \
    --firmware efi \
    --nic1 bridged \
    --nictype1 82545EM \
    --macaddress1 $MAC \
    --nicpromisc1 allow-all \
    --bridgeadapter1 $ADAPTER
}
vm_start() {
  echo -e "\nStarting $NAME"
  VBoxManage startvm $NAME \
    --type headless &> /dev/null
}
vm_stop() {
  echo -e "\nStopping $NAME"
  VBoxManage controlvm $NAME \
    poweroff &> /dev/null
}
vm_stop_clean() {
  echo -e "\nStopping $NAME cleanly"
  VBoxManage controlvm $NAME \
    acpipowerbutton &> /dev/null
}
vm_delete() {
  echo -e "\nDeleting $NAME"
  VBoxManage unregistervm $NAME \
    --delete #&> /dev/null
  rm -rf $FOLDER
}
vm_running() {
  echo -e "\nRunning VMs"
  VBoxManage list runningvms
}

if [ "$1" == "create" ]
then
  vm_create
fi

if [ "$1" == "modify" ]
then
  if [ "$1" == "$null" ]
  then
    vm_modify
  else
    vm_stop
    vm_modify
    vm_start
  fi
fi

if [ "$1" == "start" ]
then
  vm_start
fi

if [ "$1" == "stop" ]
then
  vm_stop
fi

if [ "$1" == "clean-stop" ]
then
  vm_stop_clean
fi

if [ "$1" == "delete" ]
then
  vm_stop
  vm_delete
fi

if [ "$1" == "running" ]
then
  vm_running
fi

if [ "$1" == "$null" ]
then
  echo -e "\nMissing command: \n\n  create \n  modify \n  stop \n  clean-stop"
fi

echo -e ""
