#!/bin/sh

DATE=$(date +%Y-%m-%d)
LOGFILE="/var/log/aide.${DATE}.txt"
REPORT="Aide-"$DATE.txt
EMAILMSG="AIDE Marcos AWS"
EMAILTO="msr.airborne@gmail.com"
DB="/var/lib/aide/aide.db.gz"

aide --check > ${LOGFILE}

mailx -s "$EMAILMSG" -A "$LOGFILE" -A $DB "$EMAILTO" < /dev/null
