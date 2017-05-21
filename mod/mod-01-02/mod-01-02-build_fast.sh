#!/bin/bash

echo '-----------------------------'
echo 'sudo service postgresql start'
sudo service postgresql start

# sh pg_setup.sh

sh kill_spring.sh
sh all.sh
