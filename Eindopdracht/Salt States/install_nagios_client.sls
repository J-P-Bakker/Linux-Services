install_nagios_client:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-server
      - nagios-plugins

uncomment line:
 file.uncomment:
  - name: /etc/nagios/nrpe.cfg
  - regex: server_address=*

replace line:
 file.replace:
  - name: /home/jbakker/test.txt
  - pattern: server_address=
  - repl: server_address={{ grains['ip_interfaces']['eth0'][0] }}

restart nrpe:
  service.running:
    - name: nagios-nrpe-server
    - enable: True
    - restart: True
