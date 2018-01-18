{% from "fog/map.jinja" import fog with context %}

{{ fog.config.storage_location }}:
  file.directory:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - dir_mode: 777
    - file_mode: 777
    - mode: 777
    - recurse:
      - user
      - group
      - mode
  

{{ fog.config.storage_location }}/.mntcheck:
  file.touch

{{ fog.config.storage_location }}/postdownloadscripts:
  file.directory:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 777

{{ fog.config.storage_location }}/postdownloadscripts/fog.postdownload:
  file.managed:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 777
    - source: salt://fog/files/fog.postdownload

{{ fog.config.storage_location_capture }}:
  file.directory:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - dir_mode: 777
    - file_mode: 777
    - mode: 777
    - recurse:
      - user
      - group
      - mode

{{ fog.config.storage_location_capture }}/.mntcheck:
  file.touch

{{ fog.config.storage_location }}/postinitscripts:
  file.directory:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 777

{{ fog.config.storage_location }}/postinitscripts/fog.postinit:
  file.managed:
    - user: {{ fog.user.name }}
    - group: {{ fog.group.name }}
    - mode: 777
    - source: salt://fog/files/fog.postinit

{{ fog.config.snapindir }}:
  file.directory:
    - mode: 777
    - user: {{ fog.user.name }}
    - group: www-data
    - recurse:
      - user
      - mode
      - group
