{% set ver = pillar['salt_version'] %}

saltstack-apt-repo:
  pkgrepo.managed:
    - humanname: saltstack
    - name: deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/archive/{{ver}} xenial main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/ubuntu/16.04/amd64/archive/{{ver}}/SALTSTACK-GPG-KEY.pub
    - skip_verify: True

install_salt-master_core:
  pkg.installed:
    - pkgs:
      - salt-master: {{ ver }}
      - salt-minion: {{ ver }}
    - require:
      - pkgrepo: saltstack-apt-repo

manage_master_conf:
  file.managed:
    - name: /etc/salt/master
    - source: salt://{{slspath}}/files/master

manage_engines_conf:
  file.managed:
    - name: /etc/salt/master.d/engines.conf
    - source: salt://{{ slspath }}/files/engines.conf

manage_reactors_conf:
  file.managed:
    - name: /etc/salt/master.d/reactors.conf
    - source: salt://{{ slspath }}/files/reactors.conf

{% if salt['grains.get']('civix:environment') == 'vagrant' %}
# vagrant/testing needs key/id
manage_vagrant_s3_conf:
  file.managed:
    - name: /etc/salt/master.d/s3.conf
    - source: salt://{{ slspath }}/files/s3.conf.vagrant
    - template: jinja
    - context:
        keyid: {{ pillar['s3_keyid'] }}
        key: {{ pillar['s3_key'] }}
{% else %}
# prod uses iam roles
manage_s3_conf:
  file.managed:
    - name: /etc/salt/master.d/s3.conf
    - source: salt://{{ slspath }}/files/s3.conf
{% endif %}

salt-master-running:
  service.running:
    - name: salt-master

restart-salt-master:
  service.running:
    - name: salt-master
    - onchanges:
      - file: manage_master_conf
      - file: manage_reactors_conf

