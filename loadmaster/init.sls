gcc:
  pkg:
    - installed

openssl-devel:
  pkg:
    - installed

make:
  pkg:
    - installed

perl-ExtUtils-MakeMaker:
  pkg:
    - installed

perl-URI:
  pkg:
    - installed

/etc/hosts:
  file.managed:
    - template: jinja
    - source: salt://loadmaster/files/config/hosts
