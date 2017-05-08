nginx_configtest:
  module.wait:
    - name: nginx.configtest
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d
      - pkg: nginx

nginx:
  pkg:
    - installed
  service:
    - running
    - enable: true
    - restart: true
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d
      - module: nginx_configtest

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 640

/etc/nginx/conf.d:
  file.recurse:
    - source: salt://nginx/files/conf.d

/etc/nginx/sites-enabled/default:
  file:
    - absent
