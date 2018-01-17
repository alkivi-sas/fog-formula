# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

fog-name:
  service.running:
    - name: {{ fog.service.name }}
    - enable: True
