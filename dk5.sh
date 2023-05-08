docker network create zabbix-net

docker run \
--name zabbix-postgres \
--network zabbix-net \
-v /var/lib/zabbix/timezone:/etc/timezone \
-v /var/lib/zabbix/localtime:/etc/localtime \
-d taderr/jesusisgay:postgres

docker run \
--name zabbix-server \
--network zabbix-net \
-v /var/lib/zabbix/alertscripts:/usr/lib/zabbix/alertscripts \
-v /var/lib/zabbix/timezone:/etc/timezone \
-v /var/lib/zabbix/localtime:/etc/localtime \
-p 10051:10051 \
-d taderr/jesusisgay:serv

docker run \
--name zabbix-web \
-p 80:8080 \
-p 443:8443 \
--network zabbix-net \
-v /var/lib/zabbix/timezone:/etc/timezone \
-v /var/lib/zabbix/localtime:/etc/localtime \
-e PHP_TZ="Europe/Kiev" \
-d taderr/jesusisgay:zweb

