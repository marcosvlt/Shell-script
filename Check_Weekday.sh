#!/bin/bash
# Script to check day of the week
# Marcos  11/2017 - V.0.1
# ###################################

DAYOFWEEK=$(date +"%u")

if [ $DAYOFWEEK -ge 1 ] && [ $DAYOFWEEK -le 5 ];then

        echo "Dia de semana"

else

        echo "Final de semana"

fi
