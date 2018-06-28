install_syslog-ng:
  pkg.installed:
    - pkgs:
      - syslog-ng
      - syslog-ng-core

back-up old config:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf.BAK
 - source: /etc/syslog-ng/syslog-ng.conf
 - force: True

copy syslog-ng.conf:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf
 - source: /home/jbakker/Linux-Services/Eindopdracht/Config/syslog-ng_client.conf
 - force: True

set host ip:
 file.replace:
 - name: /etc/syslog-ng/syslog-ng.conf
 - pattern: HOST_IP
 - repl: {{ grains['master'] }}

restart syslog-ng:
 cmd:
 - run
 - name: systemctl restart syslog-ng