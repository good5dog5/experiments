#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

# orig

main() {
    local files=$(ls /tmp | grep pid | grep -v daemon)
}

# better

temporary_files() {

    # print func name and args
    echo "$FUNCNAME" "$@"
    local dir=$1

    # start debug
    set -x
    ls "$dir" \
        | grep pid \
        | grep -v daemon
    set +x
    # end debug
}

main() {
    local files=$(temporary_files /tmp)
}

# better for testing

test_temporary_files() {
    local dir="/tmp"

    touch "$dir"/a-pid1232.tmp
    touch "$dir"/a-pid1232-daemon.tmp

    returns "$dir/a-pid1232.tmp" temporary_files "$dir"

    touch "$dir"/b-pid1534.tmp

    returns "$dir/a-pid1232.tmp $dir/b-pid1534.tmp" temporary_files "$dir"
}













