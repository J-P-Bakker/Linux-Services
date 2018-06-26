docker_prerequisites:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - bridge-utils
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
    - file: /etc/apt/sources.list.d/docker.list
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker-ce:
  pkg.latest: []
  require:
    - pkgrepo: docker_prerequisites
    - pkg: docker_prerequisites
  service.running:
    - name: docker
    - enable: True
    - restart: True
  {% if salt['pillar.get']('docker-systemd:servicefile') is defined %}
  file.managed:
    - name: /lib/systemd/system/docker.service
    - source: {{ salt['pillar.get']('docker-systemd:servicefile') }}
  {% endif %}

docker version check:
 cmd:
 - run
 - name: "docker -v"