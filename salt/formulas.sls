
create-formulas-dir:
  file.directory:
    - name: /srv/formulas
    - user: root
    - group: root

# Currently always sync'ing latest commita
clone-rabbitmq-formula:
  git.latest:
    - name: https://github.com/saltstack-formulas/rabbitmq-formula.git
    - target: /srv/formulas/rabbitmq-formula
    - user: root
