
include:
  - .master
{% if salt['grains.get']('civix:environment') == 'vagrant' -%}
  - .vagrant
{%- endif %}
