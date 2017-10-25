#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

# Refer: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-from-a-package

# Uninstall old version
sudo apt-get remove docker  docker.io

# Allow Docker to use the aufs storage drivers. 
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# Set stable repository
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" -y

# Install docker-ce
sudo apt-get update
sudo apt-get install docker-ce -y