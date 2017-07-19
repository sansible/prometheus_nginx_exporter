# Prometheus

Master: [![Build Status](https://travis-ci.org/sansible/prometheus_nginx_exporter.svg?branch=master)](https://travis-ci.org/sansible/prometheus_nginx_exporter)
Develop: [![Build Status](https://travis-ci.org/sansible/prometheus_nginx_exporter.svg?branch=develop)](https://travis-ci.org/sansible/prometheus_nginx_exporter)

* [ansible.cfg](#ansible-cfg)
* [Installation and Dependencies](#installation-and-dependencies)
* [Tags](#tags)
* [Example](#example)

This roles installs Prometheus Nginx Exporter.

For more information about Prometheus Nginx Exporter please visit
[https://github.com/discordianfish/nginx_exporter](https://github.com/discordianfish/nginx_exporter).


## ansible.cfg

This role is designed to work with merge "hash_behaviour". Make sure your
ansible.cfg contains these settings

```INI
[defaults]
hash_behaviour = merge
```


## Installation and Dependencies

This role will install `sansible.users_and_groups` for managing `prometheus_nginx_exporter`
user.

To install run `ansible-galaxy install sansible.prometheus` or add this to your
`roles.yml`

```YAML
- name: sansible.prometheus_nginx_exporter
  version: v1.0
```

and run `ansible-galaxy install -p ./roles -r roles.yml`


## Tags

This role uses two tags: **build** and **configure**

* `build` - Installs Prometheus Nginx Exporter and all it's dependencies.
* `configure` - Configure and ensures that the Prometheus Nginx Exporter service is running.


## Example

```YAML
- name: Install Prometheus Nginx Exporter
  hosts: sandbox

  pre_tasks:
    - name: Update apt
      become: yes
      apt:
        cache_valid_time: 1800
        update_cache: yes
      tags:
        - build

  roles:
    - name: sansible.prometheus_nginx_exporter
```
