#!/bin/bash
# Script to check Load
# Marcos  10/2017 - V.0.1
# ###################################

PROCS=`grep -c ^processor /proc/cpuinfo`
LOAD=`cat /proc/loadavg|awk '{print $1}'|awk -F"." '{print $1}'`
PERCENT=` awk "BEGIN  {print $PROCS*0.8}" | awk -F "." '{print $1}'  `


echo procs $PROCS
echo load $LOAD
echo percent $PERCENT
echo ----------

if [ $LOAD -lt $PERCENT  ]; then
         
        echo "OK - Status Load Average - $LOAD de $PROCS"


elif [ $LOAD -ge $PERCENT ] && [ $LOAD -lt $PROCS ]; then
       
       echo "WARNING - Status Load Average - $LOAD de $PROCS"

elif [ $LOAD -ge  $PROCS ]; then
        
        echo "CRITICAL - Status Load Average - $LOAD de $PROCS"

fi
