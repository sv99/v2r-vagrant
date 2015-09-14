#!/bin/bash
# Update and prepare default ubuntu image
ECHO='echo -e'

${ECHO} "\033[1;34mSet default locale - ru\033[0m"
locale-gen ru_RU.UTF-8
locale-gen en_EN.UTF-8
echo LANG=ru_RU.UTF-8 > /etc/default/locale
export LANG="ru_RU.UTF-8"
export LC_ALL=

${ECHO} "\033[1;34mSet timezone\033[0m"
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# need for the oficial box ubuntu/precise
# on the box hashicorp/precise already removed
${ECHO} "\033[1;34mRemove unused packages\033[0m"
apt-get -y purge --auto-remove  puppet* landscape* cloud*
apt-get autoremove

${ECHO} "\033[1;34mSet apt from mirror.yandex.ru\033[0m"
# for hashicorp box
sed -i 's/us.archive.ubuntu.com/mirror.yandex.ru/' /etc/apt/sources.list
# for oficial ubuntu box
sed -i 's/archive.ubuntu.com/mirror.yandex.ru/' /etc/apt/sources.list

${ECHO} "\033[1;34mUpdate system\033[0m"
apt-get update && apt-get -y upgrade

${ECHO} "\033[1;34mInstall mc\033[0m"
apt-get -y install mc

${ECHO} "\033[1;34mInstall ntp\033[0m"
apt-get -y install ntp

${ECHO} "\033[1;34mAdd /vagrant to the PATH\033[0m"
VPATH="/vagrant:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
echo PATH=${VPATH} > /etc/environment
export PATH=${VPATH}


