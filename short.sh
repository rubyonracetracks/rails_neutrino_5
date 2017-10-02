#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`

mkdir -p log
sh exec-main.sh 'tmp1' 'no_outline' 2>&1 | tee log/log-$DATE.txt
