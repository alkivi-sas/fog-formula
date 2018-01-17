# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

include:
  - .users

fog-git:
  git.latest:
    - name: https://github.com/fogproject/fogproject.git
    - user: {{ fog.user.name }}
    - rev: 1.4.4
    - target: {{ fog.install_dir }}
    - force_reset: True
