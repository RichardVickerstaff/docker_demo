#!/usr/bin/env bash

run() {
  update_yum
  add_jenkins_repo
  install_deps
  install_mongo
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
  yum install git java openssl-devel readline-devel zlib-devel gcc libxml2 libxml2-devel libxslt libxslt-devel gcc-c++ ruby-devel jenkins -y
}

install_mongo() {
  cat <<'EOF' > /etc/yum.repos.d/mongodb-org-3.0.repo
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF
  yum install -y mongodb-org

  service mongod start
  chkconfig mongod on
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

