# Eindopdracht

Scripts gemaakt door Jop Bakker (359423) voor de eindopdracht van Linux-Services

### Stappenplan:
#### Stap 1:
```
SALT:
	Master:
		Check IP
		
	Salt installeren op clients:
		sudo apt install git-core -y && git clone https://github.com/J-P-Bakker/Linux-Services.git && cd "Linux-Services/Eindopdracht" && sudo chmod +x salt.sh && sudo ./salt.sh

	Salt installeren op master:
		sudo apt install git-core -y && git clone https://github.com/J-P-Bakker/Linux-Services.git && cd "Linux-Services/Eindopdracht" && sudo chmod +x salt.sh && sudo ./salt.sh
	Add minions to master (als dit niet tijdens de installatie is gedaan):
		sudo salt-key -A
```
#### Stap 2:
```
Nagios monitor server installeren:
	Stap 1 (master): Run install_nagios_server.sls for (master) x
		sudo salt '*master' state.apply -t 1200 install_nagios_server
	stap 2: Done
```
#### Stap 3:
```
Nagios client installeren:
	Stap 1 (Master): run install_nagios_client.sls for minion x
		sudo salt '*minion*' state.apply -t 999 install_nagios_client
	stap 2: Done
```
#### Stap 4:
```
Nagios client toevoegen:
	Stap 1 (Master): run nagios_add_client.sh (for each client)
	Stap 2 (Master): Restart
		sudo systemctl restart nagios
	Stap 3 (Master): Check added hosts
		usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
	stap 4: Done
```
#### Stap 5:
```
Docker (master) installeren:
	Stap 1 (Master): run docker.sls for minion (master) x
		sudo salt '*master' state.apply -t 500 docker
	stap 2: Done
```
#### Stap 6:
```
Syslog-ng (master) installeren:
	Stap 1 (Master): run install_syslog-ng.sls for master
		sudo salt '*master' state.apply -t 500 install_syslog-ng_server
	stap 2: Done
```
#### Stap 7:
```
Syslog-ng (minion) installeren:
	Stap 1 (Master): Run client installer for client x
		 sudo salt '*minion*' state.apply -t 500 install_syslog-ng_client
	Stap 2 (Master): Check incomming logs
		sudo tail -f /var/log/syslog-ng/logs.txt
	Stap 3 (Master): Done
```

### Sources:
```
docker.sls:
https://git.osso.nl/salt/docker-systemd-formula/commit/b1cc8ffc12b08ab3f28740538a0f0eeb27aa0f38?view=parallel
```

### Guides:
```
Nagios:
https://www.howtoforge.com/tutorial/ubuntu-nagios/

Syslog-ng:
https://www.techrepublic.com/article/how-to-use-syslog-ng-to-collect-logs-from-remote-linux-machines/
```