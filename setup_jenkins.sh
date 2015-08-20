#!/usr/bin/env bash

run() {
  update_yum
  add_jenkins_repo
  install_deps
  install_docker
  add_users_to_docker
  start_docker
  start_jenkins
}

add_jenkins_repo() {
  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
  rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
}

update_yum() {
  yum update
}

install_deps() {
  yum install git java jenkins -y
}

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

start_docker() {
  service docker start
  chkconfig docker on
}

add_users_to_docker() {
  usermod -aG docker vagrant
  usermod -aG docker jenkins
}

start_jenkins() {
  service jenkins start
  chkconfig jenkins on
}

run

