{% from "bind/map.jinja" import map with context %}

remove_rndc_key:
  file.absent
    - name: /etc/bind/rndc.key

bind:
  pkg.installed:
    - pkgs: {{ map.pkgs|json }}
  service.running:
    - name: {{ map.service }}
    - enable: True
    - reload: True
