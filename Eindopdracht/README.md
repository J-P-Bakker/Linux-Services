# Linux-Services

Scripts gemaakt door Jop Bakker (359423) voor de eindopdracht van Linux-Services

### Stappenplan:
```
Nagios monitor server installeren:
	Stap 1 (minion): oneline.txt
	Stap 2 (master): Add minion to salt master
	Stap 3 (master): Run install_nagios_server.sls for minion x
	stap 4 : Done
```

```
Nagios client installeren:
	Stap 1 (Master): run install_nagios_client.sls for minion x
	Stap 2 (master): run nagios_change_hostip.sls
	stap 3 : Done
```
