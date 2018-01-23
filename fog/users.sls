# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fog/map.jinja" import fog with context %}

fog_group:
  group.present:
    - name: {{ fog.group.name }}
    - gid: {{ fog.group.gid }}

fog_user:
  user.present:
    - name: {{ fog.user.name }}
    - fullname: FOG User
    - shell: /bin/bash
    - home: {{ fog.user.home }}
    - uid: {{ fog.user.uid }}
    - gid: {{ fog.group.gid }}
    - password: {{ salt['alkivi.password_hash']('fog') }}
