# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

fog-webroot:
  file.copy:
    - name: {{ fog.config.webroot }}
    - source: {{ fog.install_dir }}/packages/web
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - makedirs: True

fog-webroot-perms:
  file.directory:
    - name: {{ fog.config.webroot }}
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: fog-webroot

fog-config:
  file.managed:
    - name: {{ fog.config.webroot }}/lib/fog/config.class.php
    - source: salt://fog/templates/config.class.php.jinja
    - template: jinja
    - mode: 640
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - context:
      config: {{ fog.config }}
    - require:
      - file: fog-webroot
