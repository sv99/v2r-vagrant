#!/bin/bash
MY_ECHO='echo -e'

${MY_ECHO} "\033[1;34minstall requiments 1\033[0m"
sudo apt-get -y install build-essential git subversion mercurial make flex bison gcc g++ gettext texinfo u-boot-tools
${MY_ECHO} "\033[1;34minstall requiments 2\033[0m"
sudo apt-get -y install ncurses-dev unzip groff bc dosfstools ccache

${MY_ECHO} "\033[1;34mMake /opt directory\033[0m"
sudo mkdir /opt
sudo chown vagrant /opt

${MY_ECHO} "\033[1;34mCorrect /bin/sh -> /bin/bash\033[0m"
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh

if [ -d /opt/virt2real-sdk ]
then
  ${MY_ECHO} "\033[32mvirt2real SDK found, skipping\033[0m"
  ${MY_ECHO} ""
else
  ${MY_ECHO} ""
  ${MY_ECHO} "\033[1;34mDownload virt2real SDK\033[0m"
  ${MY_ECHO} ""
  git clone https://github.com/virt2real/install-sdk.git /opt/virt2real-sdk
  cd /opt/virt2real-sdk
  make getsdk
  make defconfig
fi

