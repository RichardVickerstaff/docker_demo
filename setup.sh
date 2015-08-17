#!/usr/bin/env bash

run() {
  update_yum
  install_docker
  add_vagrant_to_docker
  start_docker_at_boot
  start_docker
  install_docker_compose
  create_elastic_folder
}

update_yum() {
  yum update
}

install_syslog() {
  yum install rsyslog -y
}

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

start_docker() {
  service docker start
}

start_docker_at_boot() {
  chkconfig docker on
}

add_vagrant_to_docker() {
  usermod -aG docker vagrant
}

install_docker_compose() {
  curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

create_elastic_folder() {
  mkdir -p /data/elasticsearch
}

run

