run install_nagios_server:
 cmd:
 - run
 - name: /home/jbakker/Linux-Services/Eindopdracht/install_nagios_server.sh

uncomment line:
 file.uncomment:
 - name: /usr/local/nagios/etc/nagios.cfg
 - regex: cfg_dir=/usr/local/nagios/etc/servers

restart nagios:
 service.running:
 - name: nagios
 - enable: True
 - restart: True
