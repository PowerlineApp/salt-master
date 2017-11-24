create-formulas-dir:
  file.directory:
    - name: /srv/formulas
    - user: root
    - group: root

clone-rabbitmq-formula:
  git.latest:
    - name: https://github.com/saltstack-formulas/rabbitmq-formula.git
    - target: /srv/formulas/rabbitmq-formula
    - user: root

clone-jenkins-formula:
  git.latest:
    - name: https://github.com/saltstack-formulas/jenkins-formula.git
    - target: /srv/formulas/jenkins-formula
    - user: root
