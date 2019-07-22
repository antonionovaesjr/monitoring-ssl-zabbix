# Monitoramento de URL SSL pelo Zabbix no Apache

Com git instalado e com usuário root, siga o procedimento abaixo:

```sh
yum install git -y

cd /root

git clone https://github.com/antonionovaesjr/monitoring-ssl-zabbix.git

mkdir -p /home/zabbix

chown zabbix:zabbix -R /home/zabbix

usermod -d /home/zabbix zabbix

mkdir /etc/zabbix/script/ssl -p

cp -v monitoring-ssl-zabbix/userparameter_ssl.conf /etc/zabbix/zabbix-agent.d/

cp -v monitoring-ssl-zabbix/ssl/* /etc/zabbix/script/ssl/

chmod 755 -R /etc/zabbix/script/ssl

chown zabbix:zabbix -R /etc/zabbix

systemctl restart zabbix-agent
```

Importe o template no zabbix e aplique no host desejado
