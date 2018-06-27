install_syslog_server:
  pkg.installed:
    - pkgs:
      - syslog-ng
      - syslog-ng-core

create firewall_config:
 cmd:
 - run
 - name: /home/jbakker/Linux-Services/Eindopdracht/syslog-ng-firewall_config.sh
