#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

# Ref https://stackoverflow.com/questions/33013539/docker-loading-kernel-modules

# 起因於發現build qcu-driver時會找不到/lib/moudles/linux-xxx-headers，原本的想法是裝linux-headers
# 但用掛載host dir to container的方法更優雅的解決這個問題

docker run --privileged -p 3055:22 --cap-add=ALL \
    -v /dev:/dev \
    -v /lib/modules:/lib/modules \
    -v /usr/src/linux-headers-3.19.0-25-generic:/usr/src/linux-headers-3.19.0-25-generic\
    -v /usr/src/linux-headers-3.19.0-25:/usr/src/linux-headers-3.19.0-25\
    -it -e USERID=$UID good5dog5/ubuntu_14_04:tmux /bin/bash
