# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$prep_ubuntu = <<SCRIPT
echo set default locale
locale-gen ru_RU.UTF-8
dpkg-reconfigure locales
update-locale LANG=ru_RU.UTF-8

echo remove unused packages
apt-get -y purge --auto-remove  puppet* landscape* cloud*

echo update system
apt-get update && apt-get -y upgrade

echo install mc
apt-get -y install mc

echo install requiments
apt-get -y install build-essential git subversion mercurial make flex bison gcc g++ gettext texinfo u-boot-tools ncurses-dev
apt-get -y install unzip groff bc dosfstools ccache

echo correct /bin/sh -> /bin/bash
rm /bin/sh
ln -s /bin/bash /bin/sh

mkdir /opt
chown vagrant /opt
SCRIPT

$install_sdk =  <<SCRIPT
if [ -d /opt/virt2real-sdk ] ; \
then \
  $(M_ECHO) "\033[32mvirt2real SDK found, skipping\033[0m" ; \
  $(M_ECHO) ""; \
else \
  $(M_ECHO) "" ; \
  $(M_ECHO) "\033[1;34mDownload virt2real SDK\033[0m" ;\
  $(M_ECHO) "" ;\
  git clone https://github.com/virt2real/install-sdk.git /opt/virt2real-sdk; \
  cd /opt/virt2real-sdk;
  make getsdk
  make defconfig
fi
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # use an Ubuntu precise 32 base image
  config.vm.box = "ubuntu/precise32"

  # bridge the VM into the host machine's network
  # you'll be prompted to select a network adapter at startup
  # choose whichever one you use for your home network
  # config.vm.network "public_network"

  config.vm.provider :virtualbox do |v|
      v.name = "v2rsdk_1"
      v.memory = 2048
      v.cpus = 2
      # v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      v.gui = true # debug
  end

  config.vm.hostname = "v2rsdk"

  config.vm.provision "shell", path: "prep_ubuntu.sh",
    keep_color: true

# wery bad outpput when downloading code sourcery and git clone!!
#  config.vm.provision "shell", path: "install_sdk.sh",
#    keep_color: true,
#    privileged: false

end
