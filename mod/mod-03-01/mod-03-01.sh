#!/bin/bash

# Set up Minitest Reporters to provide red/green displays, a list of the
# most time-consuming tests within your test suite, and commands for
# repeating the tests that failed.

# AGENDA
# * Add minitest and minitest-reporters to the Gemfile
# * Add test/rake_rerun_reporter.rb
# * Update test/test_helper.rb to run Minitest
# * Update .gitignore
# * Added first integration test and public/index.html


echo '##################'
echo 'UNIT 3: TEST SETUP'
echo '##################'

echo '####################################'
echo 'Unit 3 Chapter 1: Minitest Reporters'
echo '####################################'

git checkout -b 03-01-minitest_reporters

ruby mod-03-01.rb

git add .
git commit -m "Updated the Gemfile"
git checkout master
git merge 03-01-minitest_reporters
