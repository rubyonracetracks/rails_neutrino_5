#!/bin/bash
DATE=`date +%Y%m%d-%H%M%S-%3N`
APP_NAME='tmp1'
DIR_APP=$PWD/$APP_NAME

mkdir -p log
bash exec-main.sh $APP_NAME 'no_outline' 2>&1 | tee log/log-$DATE.txt

echo '------------------------------------'
echo 'BEGIN: docker-compose build (SQLite)'
echo '------------------------------------'
cd $DIR_APP && docker-compose build
echo '---------------------------------------'
echo 'FINISHED: docker-compose build (SQLite)'
echo '---------------------------------------'

echo '----------------------------------------------------------------------------------------'
echo 'mkdir -p /home/winner/bundle/vendor && chown -R winner:winner /home/winner/bundle/vendor'
cd $DIR_APP && docker-compose run --rm -u root web bash -c 'mkdir -p /home/winner/bundle/vendor && chown -R winner:winner /home/winner/bundle/vendor'

echo '-------------------------------------------------------'
echo 'bundle install --quiet --path /home/winner/bundle/vendor'
cd $DIR_APP && docker-compose run --rm web bundle install --quiet --path /home/winner/bundle/vendor

echo '---------------------------'
echo 'bundle exec rake db:migrate'
cd $DIR_APP && docker-compose run --rm web bundle exec rake db:migrate

echo '------------------------------'
echo 'bundle exec rake test (SQLite)'
cd $DIR_APP && docker-compose run --rm web bundle exec rake test

cd $DIR_APP && bin/dbrakeman
cd $DIR_APP && bin/dsandi
cd $DIR_APP && bin/dcop
cd $DIR_APP && bin/drbp

echo '-----------------------------------------------------------'
echo "bash pg_setup_bash.sh 'neutrino' 'winner' 'long_way_stinks'"
cd $DIR_APP && docker-compose run --rm web bash pg_setup_bash.sh 'neutrino' 'winner' 'long_way_stinks'

echo '------------'
echo 'bash nuke.sh'
cd $DIR_APP && bash nuke.sh

echo '----------------------------------------'
echo 'BEGIN: docker-compose build (PostgreSQL)'
echo '----------------------------------------'
cd $DIR_APP && docker-compose build
echo '-------------------------------------------'
echo 'FINISHED: docker-compose build (PostgreSQL)'
echo '-------------------------------------------'

echo '-----------------------------------------------------------------------------------------------------'
echo 'mkdir -p /home/winner/bundle/vendor && chown -R winner:winner /home/winner/bundle/vendor (PostgreSQL)'
cd $DIR_APP && docker-compose run --rm -u root web bash -c 'mkdir -p /home/winner/bundle/vendor && chown -R winner:winner /home/winner/bundle/vendor'

echo '---------------------------------------------------------------------'
echo 'bundle install --quiet --path /home/winner/bundle/vendor (PostgreSQL)'
cd $DIR_APP && docker-compose run --rm web bundle install --quiet --path /home/winner/bundle/vendor

echo '-----------------------------------------------------'
echo 'bundle exec rake db:create db:migrate db:test:prepare'
cd $DIR_APP && docker-compose run --rm web bundle exec rake db:create db:migrate db:test:prepare

echo '----------------------------------'
echo 'bundle exec rake test (PostgreSQL)'
docker-compose run --rm web bundle exec rake test

cd $DIR_APP && bin/dbrakeman
cd $DIR_APP && bin/dsandi
cd $DIR_APP && bin/dcop
cd $DIR_APP && bin/drbp
