{% if grains['os'] == 'Debian' %}
debmon_repo_required_packages:
  pkg.installed:
    - name: python-apt

icinga_repo:
  pkgrepo.managed:
    - humanname: debmon
    - name: deb http://debmon.org/debmon debmon-wheezy main
    - file: /etc/apt/sources.list.d/debmon.list
    - key_url: http://debmon.org/debmon/repo.key
    - require:
      - pkg: debmon_repo_required_packages


{% elif grains['os'] == 'Ubuntu' %}

icinga_repo:
  pkgrepo.managed:
    #- ppa: formorer/icinga
    - humanname: icinga_official
    - name: deb http://packages.icinga.org/ubuntu icinga-precise main
    - key_url: http://packages.icinga.org/icinga.key
#    - require:
#      - pkg: debmon_repo_required_packages

{% elif grains['os'] == 'CentOS' %}

icinga_repo:
  pkgrepo.managed:
    - humanname: ICINGA (stable release for epel)
    - name: icinga-stable-release
    - baseurl: http://packages.icinga.org/epel/$releasever/release/
    - gpgkey: http://packages.icinga.org/icinga.key
    - gpgcheck: 1

{% endif %}
