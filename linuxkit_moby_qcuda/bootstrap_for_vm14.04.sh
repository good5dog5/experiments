#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

#sudo apt-get remove gnome-desktop3-data
#sudo apt-get install lubuntu-desktop
sudo add-apt-repository -y ppa:pi-rho/dev &&\
sudo apt-get update &&\
sudo apt-get install git tig tmux=2.0-1~ppa1~t vim curl silversearcher-ag cscope python-dev python3 lubuntu-desktop autojump wget curl openssh-server -y 

# 編譯qcu-device所需的packages
sudo apt-get install -y  pkg-config bridge-utils uml-utilities zlib1g-dev libglib2.0-dev autoconf automake libtool libsdl1.2-dev libsasl2-dev libcurl4-openssl-dev libsasl2-dev libaio-dev libvde-dev uuid-dev libcap-ng-dev cmake 


# Install Docker
wget https://raw.githubusercontent.com/good5dog5/experiments/master/linuxkit_moby_qcuda/install_docker_ce.sh
bash install_docker_ce.sh

# cuda 7.5
wget https://raw.githubusercontent.com/good5dog5/experiments/master/gdrive_download.py
python3 gdrive_download.py '0BxxZebzQjfaXX3owQWEwMVVSSVU' cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb && sudo apt-get update && sudo apt-get install cuda -y

# dotfile
git clone https://github.com/good5dog5/dotfile 
git clone https://github.com/good5dog5/qCUDA

