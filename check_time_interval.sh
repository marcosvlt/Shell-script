#!/bin/bash
# Script to check time period
# Marcos  10/2017 - V.0.1
# ###################################

HOUR=$(date +%H)

echo $HOUR

if [ $HOUR -ge 10 ] && [ $HOUR -le 23 ]; then

        echo "Between 10 and 23"

else

        echo " Between 00 and 09"

fi
