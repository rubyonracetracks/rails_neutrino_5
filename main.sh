#!/bin/bash
DATE=`date +%Y-%m%d-%H%M-%S`

mkdir -p log
sh exec-main.sh 2>&1 | tee log/log-$DATE.txt
