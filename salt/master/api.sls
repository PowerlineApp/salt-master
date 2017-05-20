{% set ver = pillar['salt_version'] %}

include:
  - .salt

install_salt-master_api:
  pkg.installed:
    - name: salt-api
    - version: {{ ver }}
    - require:
      - pkg: install_salt-master_core

