#!/usr/bin/env python3
# Jordan huang<good5dog5@gmail.com>

from os import path as p
from plumbum.cmd import grep, make
from plumbum import local, FG, BG
import os
import sys
import subprocess

root_dir = "/home/jordan/samples"
bench_dir = ['1_Utilities/bandwidthTest', '0_Simple/vectorAdd', '0_Simple/simpleStreams', '0_Simple/vectorAdd']

for bench in bench_dir:

    bench_name = bench.split('/')[1]
    arg = '--use_cuda_malloc_host' if bench_name == 'simpleStreams' else ''
    keyword = 'non-streamed' if bench_name == 'simpleStreams' else 'PASS*'

    local.cwd.chdir(p.join(root_dir, bench))
    print("In", bench_name)
    make['clean']()
    make['SMS=20']()
    print('Build up', bench_name)

    run_it = local['./' + bench_name] | grep[keyword]
    print('Running', bench_name, arg)
    run_it[arg] & FG



