# v2r-vagrant
Development image based on ubuntu/trusty32. ubuntu/precise32 have some problems with https get certificate.

Need:
- [vagrant](https://www.vagrantup.com/downloads.html), provision - shell script, for windows compatibility.
- [virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [git](http://git-scm.com/downloads)
- [notepad++ - Windows only](https://notepad-plus-plus.org/) - for editing configuration files.

Recomeded vagrant plugins:
- [sahara](https://github.com/jedi4ever/sahara) - working with vm snapshot
- [vbguest](https://github.com/dotless-de/vagrant-vbguest) - for guest addons updating

## On Windows install git-scm

On windows need install git-scm.

Adjusting your PATH environment: default **Use Git from Git Bash only**

Configuring the line ending conversions: Need set to **Checkout as-is, commit as-is**

Before cloning check param core.autocrlf.

## Prepare vagrant

```
vagrant plugin install sahara
vagrant plugin install vagrant-vbguest
```

Run Git CMD:
```
git config --global core.autocrlf
>false
```

Must be False, if not then run:
```
git config --global core.autocrlf false
```

## vagrant up and install

For prepare vm run Git Bash terminal in working folder:
```
git clone https://github.com/sv99/v2r-vagrant.git
cd v2r-vagrant
vagrant up
vagrant ssh
install_sdk.sh
```

## Builds sdk
```
cd /opt/virt2real-sdk
make defconfig
make fsconfig
make kernelconfig
time make build
```

## make image
```
make img_install
make img_umount
```

