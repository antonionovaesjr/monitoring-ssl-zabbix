# Monitoramento de URL SSL pelo Zabbix no Apache

Com git instalado, prossiga:

```sh
usermod -d /home/zabbix -m zabbix
mkdir /etc/zabbix/script/ssl -p
cp -v userparameter* /etc/zabbix/zabbix-agent.d/
cp -v ssl/* /etc/zabbix/script/ssl
chmod 755 /etc/zabbix/script/ssl
chown zabbix:zabbix -R /etc/zabbix
systemctl restart zabbix-agent
```
