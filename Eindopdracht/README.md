# Eindopdracht

Scripts gemaakt door Jop Bakker (359423) voor de eindopdracht van Linux-Services

### Stappenplan:
```
Salt installeren op clients:
	sudo apt install git-core -y && git clone https://github.com/J-P-Bakker/Linux-Services.git && cd "Linux-Services/Salt Workshop" && sudo chmod +x salt.sh && sudo ./salt.sh

Salt installeren op master:
	sudo apt install git-core -y && git clone https://github.com/J-P-Bakker/Linux-Services.git && cd "Linux-Services/Salt Workshop" && sudo chmod +x salt.sh && sudo ./salt.sh
```

```
Nagios monitor server installeren:
	Stap 1 (master): Add master to salt master
		sudo salt-key -a <hostname>
	Stap 2 (master): Run install_nagios_server.sls for (master) x
		sudo salt '<hostname>' state.apply -t 1200 install_nagios_server
	stap 3: Done
```

```
Nagios client installeren:
	Stap 1 (Master): run install_nagios_client.sls for minion x
		sudo salt '<hostname>' state.apply -t 999 install_nagios_client
	stap 2: Done
```

```
Docker (master) installeren:
	Stap 1 (Master): run docker.sls for minion (master) x
		sudo salt '<hostname>' state.apply -t 500 docker
	stap 2: Done
```

### Sources:
```
Voor het docker.sls bestand is gebruik gemaakt van:
https://git.osso.nl/salt/docker-systemd-formula/commit/b1cc8ffc12b08ab3f28740538a0f0eeb27aa0f38?view=parallel



```