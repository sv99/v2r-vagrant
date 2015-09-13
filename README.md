# v2r-vagrant
Development image based on ubuntu/precise32

Need [vagrant](https://www.vagrantup.com/downloads.html), provision - shell script, for windows compatibility.

Recomeded vagrant plugins:
- [sahara](https://github.com/jedi4ever/sahara) - working with vm snapshot
- [vbguest](https://github.com/dotless-de/vagrant-vbguest) - for guest addons updating

```# plugin installation
vagrant plugin install sahara
vagrant plugin install vagrant-vbguest
```

hashicorp/precise32 current version 1.0.0 apt-get upgrade - 100Mb!

ubuntu/precise32 - updated, but need remove some packets

```vagrant up
vagrant ssh
install_sdk.sh

cd /opt/virt2real-sdk
make fsconfig
make kernelconfig
make build
```

