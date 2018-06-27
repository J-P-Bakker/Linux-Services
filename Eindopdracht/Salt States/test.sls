Move file from client to master:
  file.managed:
    - name: salt://test.txt
    - source: /home/jbakker/test.txt
