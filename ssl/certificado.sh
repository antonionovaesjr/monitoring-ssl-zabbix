#!/bin/bash
A=`echo | openssl s_client -connect $1:443 -servername $1 2> /dev//null | openssl x509 -noout -dates | tail -1 | tr -s "" | cut -d"=" -f2 | cut -d "" -f1,2,4`
B=`date -d "$A" +%Y-%m-%d`
C=`date +%Y-%m-%d`
DATAATUAL=`date -d "$C" +%s`
DATAEXP=`date -d "$B" +%s`
VALOR=$(echo $(((${DATAEXP} - ${DATAATUAL})/24/60/60)))
if [ $VALOR -lt 0 ]; then
echo 0
else
echo $VALOR
fi

