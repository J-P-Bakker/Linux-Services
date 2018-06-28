install_syslog-ng:
  pkg.installed:
    - pkgs:
      - syslog-ng
      - syslog-ng-core

create firewall_config:
 cmd:
 - run
 - name: /home/jbakker/Linux-Services/Eindopdracht/syslog-ng-firewall_config.sh

back-up old config:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf.BAK
 - source: /etc/syslog-ng/syslog-ng.conf
 - force: True

copy syslog-ng.conf:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf
 - source: /home/jbakker/Linux-Services/Eindopdracht/Config/syslog-ng_server.conf
 - force: True

Create logs file:
 file.touch:
 - name: /var/log/syslog-ng/logs.txt
 - makedirs: True

restart syslog-ng:
 cmd:
 - run
 - name: systemctl restart syslog-ng