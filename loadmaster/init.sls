/etc/hosts:
  file.managed:
    - template: jinja
    - source: salt://loadmaster/files/config/hosts
