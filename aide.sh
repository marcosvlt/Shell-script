#!/bin/sh

DATE=$(date +%Y-%m-%d)
LOGFILE="/var/log/aide.${DATE}.txt"
REPORT="Aide-"$DATE.txt
EMAILMSG="AIDE Marcos AWS"
EMAILTO="msr.airborne@gmail.com"
DB="/var/lib/aide/aide.db.gz"

aide --check > ${LOGFILE}

mailx -s "$EMAILMSG" -A "$LOGFILE" -A $DB "$EMAILTO" < /dev/null



# Ideia
# Since the database is stored on the root filesystem, attackers can easily modify it to cover their tracks if they compromise your system. You may want to copy the database to offline, read-only media and perform checks against this copy periodically. 
