# Linux-Services

Scripts gemaakt door Jop Bakker (359423) voor de eindopdracht van Linux-Services

### Stappenplan:
```
Nagios monitor server installeren:
	Stap 1 (minion): oneline.txt
	Stap 2 (master): Add minion to salt master
	Stap 3 (master): Run install_nagios_server.sls for minion x
	stap 4: Done
```

```
Nagios client installeren:
	Stap 1 (Master): run install_nagios_client.sls for minion x
	Stap 2 (master): run nagios_change_hostip.sls
	stap 3: Done
```

```
Docker (master) installeren:
	Stap 1 (Master): run docker.sls for minion (master) x
	stap 2: Done
```





### Sources:
```
Voor het docker.sls bestand is gebruik gemaakt van:
https://git.osso.nl/salt/docker-systemd-formula/commit/b1cc8ffc12b08ab3f28740538a0f0eeb27aa0f38?view=parallel



```