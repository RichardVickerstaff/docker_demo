#!/usr/bin/env bash

run() {
  update_yum
  install docker
  start_docker
  start_docker_at_boot
  add_vagrant_to_docker
  install_docker_compose
}

update_yum() {
  yum update
}

instal_docker() {
  curl -sSL https://get.docker.com/ | sh
}

start_docker() {
  service docker start
}

start_docker_at_boot() {
  sudo chkconfig docker on
}

add_vagrant_to_docker() {
  usermod -aG docker vagrant
}

install_docker_compose() {
  curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

run

