#!/bin/bash
ARQUIVO=/tmp/sites-temp.txt
rm -f $ARQUIVO
touch $ARQUIVO
chmod 777 /tmp/sites-temp.txt
APACHE_SITE_DIR=/etc/httpd/conf.d/

if [ -e /etc/debian_version ]; then
        APACHE_SITE_DIR=/etc/apache2/sites-enabled/
fi

for I in `grep ServerName $APACHE_SITE_DIR/* |cut -d: -f2|awk '{print $2}'|grep -v example.com|grep -v localhost|grep \.|sort |uniq`; do

curl -skI https://$I > /dev/null

        if [ $? -eq 0 ]; then
                echo $I >> $ARQUIVO
        fi

done
