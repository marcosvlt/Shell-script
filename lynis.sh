#!/bin/sh

DATE=$(date +%Y%m%d)
HOST=$(hostname)
LOGDIR="/var/log/lynis"
LOGFILE="$LOGDIR/report-${HOST}.${DATE}"
DATA="$LOGDIR/report-data-${HOST}.${DATE}.txt"
EMAILMSG="Lynis Marcos ";
EMAILTO="mail@mail.com.br";


#Check if lynis folder exists.
if [ -e $LOGDIR ]; then
        echo "$LOGDIR  exist" > ${LOGFILE}
else
        mkdir $LOGDIR
fi

# Run Lynis
lynis audit system --cronjob >> ${LOGFILE}


mailx -s "$EMAILMSG" -A "$LOGFILE"  "$EMAILTO" < /dev/null


