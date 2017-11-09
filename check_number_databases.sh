#!/bin/bash
# Script to check numbers of databases
# Marcos  11/2017 - V.0.1
# ###################################


BANCOS=`mysql -P3306 -USER -p'PASSWORD' -e "select count(*) from information_schema.SCHEMATA;" | grep -v  count`
if [ $? -eq 0 ]; then


        if [ $BANCOS -lt 1800 ]; then
                 STATUS="0"
                 echo -e "OK - Numero de Banco de Dados. $BANCOS "

        elif [ $BANCOS -ge 1800 ] && [ $BANCOS -lt 2000 ]; then
                STATUS="1"
                echo  "Warning - Numero de Banco de Dados: $BANCOS"
          else
                STATUS="2"
                echo  "Critical - Numero de Banco de Dados: $BANCOS"
        fi

else

        STATUS="2"
        echo "Critical - Problema de conexão  no script de verificação"

fi

exit $STATUS
