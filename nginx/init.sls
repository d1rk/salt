nginx:
  pkg:
    - installed
  service:
    - running
    - enable: true
    - restart: true
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default
      - file: /etc/nginx/conf.d/*
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/sites-available/default
    - user: root
    - group: root
    - mode: 640
