#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

docker run --privileged -p 3055:22 --cap-add=ALL \
    -v /dev:/dev \
    -v /lib/modules:/lib/modules \
    -v /usr/src/linux-headers-3.19.0-25-generic:/usr/src/linux-headers-3.19.0-25-generic\
    -v /usr/src/linux-headers-3.19.0-25:/usr/src/linux-headers-3.19.0-25\
    -it -e USERID=$UID good5dog5/ubuntu_14_04:tmux /bin/bash
