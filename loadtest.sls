httpd-tools:
  pkg:
    - installed

siege:
  pkg:
    - installed

bench:
  user.present:
    - shell: /bin/bash
    - home: /home/bench

/home/bench/.ssh:
  file.directory:
    - user: bench
    - group: bench
    - mode: 700
    - require:
      - user: bench

/home/bench/.ssh/authorized_keys:
  file.managed:
    - user: bench
    - group: bench
    - mode: 600
    - source:
      - salt://loadtest/keys/id_rsa.pub
    - require:
      - user: bench
      - file: /home/bench/.ssh
