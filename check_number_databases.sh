#!/bin/bash
# Script to check numbers of databases
# Marcos  11/2017 - V.0.1
# ###################################


BANCOS=`mysql -P3306 -USER -p'PASSWORD' -e "select count(*) from information_schema.SCHEMATA;" | grep -v  count`
OK_NUMBER=1800
WARNING=2000
if [ $? -eq 0 ]; then


        if [ $BANCOS -lt OK_NUMBER ]; then
              
              echo -e "OK - Numero de Banco de Dados. $BANCOS "

        elif [ $BANCOS -ge OK_NUMBER ] && [ $BANCOS -lt WARNING2 ]; then
              
                echo  "Warning - Numero de Banco de Dados: $BANCOS"
          else
              
                echo  "Critical - Numero de Banco de Dados: $BANCOS"
        fi

else

        
        echo "Critical - Problema de conexão  no script de verificação"

fi

exit $STATUS
