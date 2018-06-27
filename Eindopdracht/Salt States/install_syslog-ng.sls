install_syslog_server:
  pkg.installed:
    - pkgs:
      - syslog-ng
      - syslog-ng-core

run install_nagios_server:
 cmd:
 - run
 - name: /home/jbakker/Linux-Services/Eindopdracht/syslog-ng-firewall_config.sh
