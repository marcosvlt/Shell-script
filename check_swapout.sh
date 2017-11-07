#!/bin/bash
# Script to check swap
# Marcos  11/2017 - V.0.1
# ###################################


SWAPOUT_ACTIVITY=$(vmstat 1 5 | tail -n 4 | awk '{ sum += $8 / 5 } END { print sum }' | awk -F "." '{print $1}')
SWAP_CRITICAL=1000

echo Swap out activity $SWAPOUT_ACTIVITY

if [ $SWAPOUT_ACTIVITY -lt $SWAP_CRITICAL  ]; then
    STATUS="0"
    echo "OK - Swap abaixo de 1/Mbs - $SWAPOUT_ACTIVITY"

elif [ $SWAPOUT_ACTIVITY -ge $SWAP_CRITICAL ]; then

    STATUS="2"
    echo "CRITICAL - Swap acima de 1Mbs - - $SWAPOUT_ACTIVITY"

fi

exit $STATUS
