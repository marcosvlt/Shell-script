#!/bin/bash
# Script to check swap
# Marcos  10/2017 - V.0.1
# ###################################


SWAPOUT_ACTIVITY=$(vmstat 1 5 | tail -n 4 | awk '{ sum += $8 / 5 } END { print sum }' | awk -F "." '{print $1}')
#SWAPOUT_AVERAGE=$( $SWAPOUT_ACTIVITY)
#SWAP_WARNING=100
#SWAP_CRITICAL=1000

echo Swap out activity $SWAPOUT_ACTIVITY

# if [ $SWAPOUT_ACTIVITY -lt $SWAP_WARNING  ]; then
#       STATUS="0"
#    echo "OK - Swap abaixo de 100/s - $SWAPOUT_ACTIVITY"

#elif [ $LOAD -ge $PERCENT ] && [ $LOAD -lt $PROCS ]; then
#    STATUS="1"
#    echo "WARNING - Status Load Average - $LOAD de $PROCS"

#elif [ $LOAD -ge  $PROCS ]; then
#    STATUS="2"
#    echo "CRITICAL - Status Load Average - $LOAD de $PROCS"

#fi

#exit $STATUS
