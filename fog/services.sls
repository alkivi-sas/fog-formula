# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

/opt/fog/log:
  file.directory

{% set service_dir = fog.install_dir ~ '/packages/service' %}
/opt/fog/service:
  file.copy:
    - source: {{ service_dir }}
    - makedirs: True
    - preserve: True

/opt/fog/service/etc/config.php:
  file.managed:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 640
    - makedirs: True
    - source: salt://fog/templates/config.php.jinja
    - template: jinja
    - context:
      config: {{ fog.config }}

{% set services = salt['file.find'](fog.install_dir ~ '/packages/systemd', type='f', print='name') %}

{% for service in services %}
systemd-{{ service }}:
  file.managed:
    - name: /lib/systemd/system/{{ service }}
    - user: root
    - group: root
    - mode: 644
    - source: salt://fog/files/systemd/{{ service }}
  service.running:
    - name: {{ service }}
    - enable: True
    - reload: True
    - require:
      - file: systemd-{{ service }}
{% endfor %}


/var/log/fog:
  file.symlink:
    - target: /opt/fog/log

/etc/fog:
  file.symlink:
    - target: /opt/fog/service/etc
