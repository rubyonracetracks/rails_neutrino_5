#!/bin/bash

# Set up Minitest Reporters to provide red/green displays, a list of the
# most time-consuming tests within your test suite, and commands for
# repeating the tests that failed.

# AGENDA
# * Add minitest and minitest-reporters to the Gemfile
# * Add test/rake_rerun_reporter.rb
# * Update test/test_helper.rb to run Minitest
# * Update .gitignore


echo '##################'
echo 'UNIT 3: TEST SETUP'
echo '##################'

echo '####################################'
echo 'Unit 3 Chapter 1: Minitest Reporters'
echo '####################################'

git checkout -b 03-01-minitest_reporters

echo 'Adding minitest and minitest-reporters to the Gemfile'
ruby mod-03-01A.rb
echo '----------------------'
echo 'bundle install --quiet'
bundle install --quiet

echo 'Adding test/rake_rerun_reporter.rb'
mv mod-03-01-rake_run_reporter.rb test/rake_rerun_reporter.rb

echo 'Adding minitest and minitest-reporters to test/test_helper.rb'
echo 'Adding test/html_reports/ to .gitignore'
ruby mod-03-01B.rb

wait
sh kill_spring.sh
rails test

echo 'Adding first test'
wait
sh kill_spring.sh
rails generate integration_test test1
wait
ruby mod-03-01C.rb

echo '----------------------'
echo 'rails db:migrate:reset'
rails db:migrate:reset
echo 'First test will fail'
rails test

echo 'Making the first test pass'
mv mod-03-01-public_index.html public/index.html
wait
echo '----------------------'
echo 'rails db:migrate:reset'
rails db:migrate:reset
rails test

git add .
git commit -m "Updated the Gemfile"
git checkout master
git merge 03-01-minitest_reporters
