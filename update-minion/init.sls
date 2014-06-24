# vim: sts=2 ts=2 sw=2 ai et
salt-minion:
  pkgrepo.managed:
    - name: deb http://aptcacher01.core.irknet.lan:3142/ppa.launchpad.net/saltstack/salt/ubuntu trusty main 
    - dist: trusty
  #  - human_name: ppa saltstack
  #  - ppa: saltstack/salt 
  #  - require:
  #    - pkg: python-software-properties
  #    - pkg: python-apt 
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: salt-minion

python-software-properties:
  pkg:
    - installed
    - pkgs:
      {% if grains['osrelease'] >= 14.04 %}
      - software-properties-common
      {% else %}
      - python-software-properties
      {% endif %}

python-apt:
  pkg.installed
