{% set loadworker = pillar.get('loadworker', {}) -%}
{% set user = loadworker.get('user', 'bench') -%}
{% set group = loadworker.get('group', user) -%}
{% set home = loadworker.get('home', '/home/bench') -%}

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
      - salt://loadworker/files/publickeys/id_rsa.pub
    - require:
      - user: {{ user }}
      - file: {{ home }}/.ssh
