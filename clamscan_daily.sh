#!/bin/bash
# Script to configure daily scam clamav
# Marcos  02/2018 - V.0.1
# ###################################



SCANDIR="/home"

LOG_FILE="/var/log/clamscan_daily.log"

echo "------DATE: `date` ------" >> $LOG_FILE
clamscan -i -r $SCANDIR >> $LOG_FILE
echo " ----- END -----" >> $LOG_FILE
