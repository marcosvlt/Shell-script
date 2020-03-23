#!/bin/bash -x
LOGFILE="/var/log/clamav/clamav-script-$(date +'%Y-%m-%d_%H%M').log";
DIRTOSCAN="/";
INFECTEDDIR="/etc/clamav/infected"

echo "
$(date)
Starting scan of '$DIRTOSCAN'
"> $LOGFILE


#Create a quarentine folder
if [ -e $INFECTEDDIR ]; then
    echo "Infected folder already exist" >> $LOGFILE
else
    mkdir $INFECTEDDIR
    echo "Created infected folder" >> $LOGFILE
fi

clamscan -ri  --exclude-dir=$INFECTEDDIR --move=$INFECTEDDIR $DIRTOSCAN  >> $LOGFILE


#Remove infected files permissions
if [ "$(ls -A $INFECTEDDIR)" ]; then
    echo "-------------------------" >> $LOGFILE
    echo "Removing infected files permissions" >> $LOGFILE
    chmod -R 000 $INFECTEDDIR
else
    echo "Infected folder empty" >> $LOGFILE
fi

echo "Complete at $(date)" >> $LOGFILE
