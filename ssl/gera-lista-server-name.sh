#!/bin/bash
HOME=/home/zabbix
ARQUIVO=$HOME/sites-temp.txt
FILE_DATA=$HOME/data.txt
touch $FILE_DATA && rm -f $FILE_DATA && touch $FILE_DATA
touch $ARQUIVO && rm -f $ARQUIVO && touch $ARQUIVO
chmod 777 $ARQUIVO
chmod 777 $FILE_DATA
APACHE_SITE_DIR=/etc/httpd/conf.d/

if [ -e /etc/debian_version ]; then
	APACHE_SITE_DIR=/etc/apache2/sites-enabled/
fi

for I in `grep ServerName $APACHE_SITE_DIR/* |cut -d: -f2|awk '{print $2}'|grep -v example.com|grep -v localhost|sort |uniq`; do 

curl -skI https://$I > /dev/null

	if [ $? -eq 0 ]; then
		echo $I >> $ARQUIVO
	fi

done


/etc/zabbix/scripts/ssl/discovery-ssl.py $ARQUIVO $FILE_DATA

cat $FILE_DATA

