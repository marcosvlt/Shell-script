#!/bin/sh

ORIGEM=$1
DESTINO=$2
NOME=$3

if [ "$ORIGEM" == "" -o "$DESTINO" == "" -o "$NOME" == "" ]; then
        echo "Ferramenta de backup"
        echo "Uso Origem Destino Nome"
        echo -e "Erro: Script sem argumentos\nUso Origem Destino Nome\nBackup NOK
        " >  /var/log/backup_fedora.log
        exit 1
  fi

if [ ! -d $ORIGEM ]; then

        echo "Erro:Pasta de origem \"$ORIGEM\" inexistente" > /var/log/backup_fedora.log
        exit 1
fi

if [ ! -d $DESTINO ]; then
        echo "Erro: Pasta de destino \"$DESTINO\" inexistente" > /var/log/backup_fedora.log
        exit 1
fi

tar cvzf  /$DESTINO/$NOME.$(date +%Y%m%d-%H%M%S).tar.gz  $ORIGEM > /var/log/backup_fedora.log 2>&1
        if [[ $? = 0 ]]; then
                echo "Backup OK" >> /var/log/backup_fedora.log
        else
                echo "Backup NOK" >> /var/log/backup_fedora.log
        fi

# Deleta arquivos com mais de 5 dias
find /$DESTINO/ -mindepth 1 -mtime +5 -delete
