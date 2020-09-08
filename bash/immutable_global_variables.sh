#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

# ref: https://web.archive.org/web/20180917174959/http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming

readonly PROGNAME="$(basename $0)"
readonly PROGDIR="$(readlink -m $(dirname %0))"
readonly ARGS="$@"

echo "$PROGNAME"
