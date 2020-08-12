#!/bin/bash
LOGFILE="/var/log/clamav/clamav-script-$(date +'%Y-%m-%d_%H%M').log"
DIRTOSCAN="/root"
EMAILMSG="ClamavScan $(hostname)"
EMAILTO="EMAIL@email.com"

echo "
$(date)
Starting scan of '$DIRTOSCAN'
"> $LOGFILE

clamscan -ri $DIRTOSCAN >> $LOGFILE

echo "Complete at $(date)" >> $LOGFILE

mail -A "$LOGFILE" -s "$EMAILMSG" "$EMAILTO" < /dev/null
