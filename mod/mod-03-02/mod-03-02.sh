#!/bin/bash

# This chapter creates scripts for testing just a portion of the test suite.
# These portions include the helpers/mailers, the model tests, and the
# controller tests.

# AGENDA
# * Add testh.sh, testhl.sh, testm.sh, testml.sh, testc.sh, and testcl.sh.

echo '#######################################'
echo 'Unit 3 Chapter 2: Quick Testing Scripts'
echo '#######################################'

git checkout -b 03-02-quick_testing

# WICHTIG/LEGACY/scripts: add testh.sh, testm.sh, and testc.sh

mv mod-03-02-testh.sh testh.sh
mv mod-03-02-testhl.sh testhl.sh
mv mod-03-02-testm.sh testm.sh
mv mod-03-02-testml.sh testml.sh
mv mod-03-02-testc.sh testc.sh
mv mod-03-02-testcl.sh testcl.sh

git add .
git commit -m "Added quick testing scripts"
git checkout master
git merge 03-02-quick_testing
