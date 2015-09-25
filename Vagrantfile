# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "docker_demo" do |docker_demo|
    docker_demo.vm.box = 'opscode-fedora-20'
    docker_demo.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_fedora-20_chef-provisionerless.box'

    docker_demo.vm.network :private_network, ip: "10.0.0.100"
    docker_demo.vm.network :private_network, ip: "10.0.0.101"
    docker_demo.vm.network :private_network, ip: "10.0.0.102"
    docker_demo.vm.network :private_network, ip: "10.0.0.104"

    docker_demo.vm.provider :virtualbox do |vb|
      vb.name = "docker_demo"
      vb.cpus = 4
      vb.memory = 4096
    end

    host_data_dir = File.join(File.dirname(__FILE__), "shared")
    config.vm.synced_folder host_data_dir, "/var/host", create: true

    config.vm.provision "shell", path: "setup_docker_demo.sh"
  end


  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = 'opscode-fedora-20'
    jenkins.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_fedora-20_chef-provisionerless.box'
    jenkins.vm.network :private_network, ip: "10.0.0.103"

    jenkins.vm.provider :virtualbox do |vb|
      vb.name = "jenkins"
      vb.cpus = 2
      vb.memory = 2048
    end

    config.vm.provision "shell", path: "setup_jenkins.sh"
  end
end
