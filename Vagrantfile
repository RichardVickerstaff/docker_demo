# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "fedora20"
  config.vm.network :private_network, ip: "10.0.0.100"
  config.vm.network :private_network, ip: "10.0.0.101"
  config.vm.network :private_network, ip: "10.0.0.102"
  config.vm.network :private_network, ip: "10.0.0.103"

  config.vm.provider :virtualbox do |vb|
    vb.name = "docker_demo"
    vb.cpus = 4
    vb.memory = 2048
  end

  host_data_dir = File.join(File.dirname(__FILE__), "shared")
  config.vm.synced_folder host_data_dir, "/var/host", create: true

  config.vm.provision "shell", path: "setup.sh"
end
