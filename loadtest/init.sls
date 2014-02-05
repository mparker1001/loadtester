{% set loadtest = pillar.get('loadtest', {}) -%}
{% set user = loadtest.get('user', 'bench') -%}
{% set group = loadtest.get('group', user) -%}
{% set home = loadtest.get('home', '/home/bench') -%}

httpd-tools:
  pkg:
    - installed

siege:
  pkg:
    - installed

{{ user }}:
  user.present:
    - shell: /bin/bash
    - home: {{ home }}

{{ home }}/.ssh:
  file.directory:
    - user: {{ user }}
    - group: {{ group }}
    - mode: 700
    - require:
      - user: {{ user }}

{{ home }}/.ssh/authorized_keys:
  file.managed:
    - user: {{ user }}
    - group: {{ group }}
    - mode: 600
    - source:
      - salt://loadtest/files/publickeys/id_rsa.pub
    - require:
      - user: {{ user }}
      - file: {{ home }}/.ssh
