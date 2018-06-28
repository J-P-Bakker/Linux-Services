base:
 '*master':
  - install_nagios_server
  - docker
  - install_syslog-ng_server
 '*minion*':
  - install_nagios_client
  - install_syslog-ng_client