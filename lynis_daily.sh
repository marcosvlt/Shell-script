#!/bin/sh

set -u
DATE=$(date +%Y%m%d)
HOST=$(hostname)
LOG_DIR="/var/log/lynis"
LOGFILE="$LOG_DIR/report-${HOST}.${DATE}"
DATA="$LOG_DIR/report-data-${HOST}.${DATE}.txt"
EMAILMSG="Lynis Marcos Notebook.";
EMAILTO="marcos.rosa@qualitor.com.br";


mkdir /var/log/lynis

# Run Lynis
lynis audit system --cronjob > ${LOGFILE}

# Optional step: Move report file if it exists
if [ -f /var/log/lynis-report.dat ]; then
    mv /var/log/lynis-report.dat ${DATA}
fi

mail -A "$LOGFILE" -s "$EMAILMSG" "$EMAILTO" < /dev/null



# The End
