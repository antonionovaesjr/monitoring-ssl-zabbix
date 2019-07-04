# Monitoramento de URL SSL pelo Zabbix no Apache

Com git instalado e com usuário root, siga o procedimento abaixo:

```sh
cd /root

git clone https://github.com/antonionovaesjr/monitoring-ssl-zabbix.git

usermod -d /home/zabbix -m zabbix

mkdir /etc/zabbix/script/ssl -p

cp -v monitoring-ssl-zabbix/userparameter* /etc/zabbix/zabbix-agent.d/

cp -v monitoring-ssl-zabbix/ssl/* /etc/zabbix/script/ssl

chmod 755 /etc/zabbix/script/ssl

chown zabbix:zabbix -R /etc/zabbix

systemctl restart zabbix-agent
```

Importe o template no zabbix e aplique no host desejado
