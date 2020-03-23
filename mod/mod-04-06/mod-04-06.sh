#!/bin/bash
set -e

# Adding a script that updates the gems with "bundle update"

# AGENDA
# * Add upgrade_gems.sh

echo '####################################'
echo 'Unit 4 Chapter 6: Gem Upgrade Script'
echo '####################################'

git checkout -b 04-06-upgrade_gems

# WICHTIG/LEGACY/bash: add bin/dupdate
mv mod-04-06-bin-dupdate bin/dupdate

# WICHTIG/LEGACY/bash: add upgrade_gems.sh
mv mod-04-06-upgrade_gems.sh upgrade_gems.sh

git add .
git commit -m "Added the gem upgrade script"
git checkout master
git merge 04-06-upgrade_gems
