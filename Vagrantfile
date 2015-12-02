# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # use an Ubuntu 32 base image
  # config.vm.box = "ubuntu/precise32"
  config.vm.box = "ubuntu/trusty32"

  # bridge the VM into the host machine's network
  # you'll be prompted to select a network adapter at startup
  # choose whichever one you use for your home network
  # config.vm.network "public_network"

  config.vm.provider :virtualbox do |v|
      v.name = "v2rsdk_1"
      v.memory = 2048
      v.cpus = 2
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      # v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      # v.gui = true # debug
  end

  config.vm.hostname = "v2rsdk"

  config.vm.provision "shell", path: "prep_ubuntu.sh",
    keep_color: true

end
