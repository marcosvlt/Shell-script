#!/bin/sh

DATE=$(date +%Y%m%d)
HOST=$(hostname)
LOGDIR="/var/log/lynis"
LOGFILE="$LOGDIR/report-${HOST}.${DATE}.txt"
DATA="$LOGDIR/report-data-${HOST}.${DATE}.txt"
EMAILMSG="Lynis $(hostname) ";
EMAILTO="mail@mail.com.br";


#Check if lynis folder exists.
if [ -e $LOGDIR ]; then
        echo "$LOGDIR  exist" > ${LOGFILE}
else
        mkdir $LOGDIR
fi

# Run Lynis
/usr/sbin/lynis audit system --cronjob >> ${LOGFILE}


mailx -s "$EMAILMSG" -A "$LOGFILE"  "$EMAILTO" < /dev/null


