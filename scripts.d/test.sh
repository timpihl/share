#!/bin/bash
#
# Toker
#

hostname=$(hostname)

if [ $hostname == "internal.toker.ovh" ]
then
    echo "Working"
fi
