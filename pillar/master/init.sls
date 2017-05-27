
include:
  - master.core
{% if salt['grains.get']('civix:environment') == 'vagrant' -%}
  - master.vagrant
{%- endif %}
