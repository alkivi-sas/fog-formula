# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

fog-init.xz:
  file.managed:
    - name: {{ fog.config.webroot }}/service/ipxe/init.xz
    - source: https://fogproject.org/inits/init.xz
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - source_hash: https://fogproject.org/inits/index.php

fog-init_32.xz:
  file.managed:
    - name: {{ fog.config.webroot }}/service/ipxe/init_32.xz
    - source: https://fogproject.org/inits/init_32.xz
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - source_hash: https://fogproject.org/inits/index.php

fog-bzImage:
  file.managed:
    - name: {{ fog.config.webroot }}/service/ipxe/bzImage
    - source: https://fogproject.org/kernels/bzImage
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - source_hash: https://fogproject.org/kernels/index.php

fog-bzImage32:
  file.managed:
    - name: {{ fog.config.webroot }}/service/ipxe/bzImage32
    - source: https://fogproject.org/kernels/bzImage32
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - source_hash: https://fogproject.org/kernels/index.php

client:
  file.managed:
    - name: {{ fog.config.webroot }}/client/FOGService.msi
    - source: https://github.com/FOGProject/fog-client/releases/download/{{ fog.client_version }}/FOGService.msi
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - skip_verify: True

smartinstaller:
  file.managed:
    - name: {{ fog.config.webroot }}/client/SmartInstaller.exe
    - source: https://github.com/FOGProject/fog-client/releases/download/{{ fog.client_version }}/SmartInstaller.exe
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 644
    - skip_verify: True
