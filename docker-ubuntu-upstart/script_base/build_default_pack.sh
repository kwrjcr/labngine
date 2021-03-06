#!/bin/bash

# add script function
source /root/script_base.sh

# REPOS
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x4f4ea0aae5267a6c
echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" > /etc/apt/sources.list.d/php7.list

# php5.6
sudo add-apt-repository ppa:ondrej/php5-5.6 -y

# add packages
PACKAGES_DEFAULT="vim curl wget git zip unzip htop figlet supervisor build-essential \
                  software-properties-common python-software-properties language-pack-en-base"

# Env package to dockerfile
PACKAGES_ENV_DOCKERFILES=${PACKAGES_BUILDPACK}

# Update Ubuntu
update

# Install_packages
install_packages

# Upgrade ubuntu
upgrade

# Clean ubuntu
clean_ubuntu
