#!/bin/bash
set -e

APP_NAME=$1
TOGGLE_OUTLINE=$2

DIR_MAIN=$PWD
DIR_PARENT="$(dirname "$DIR_MAIN")"

if [ "$GITLAB_CI" = 'true' ]
then
  DIR_PARENT=$DIR_MAIN
fi

DIR_APP=$DIR_PARENT/$APP_NAME

echo '-------'
echo 'ruby -v'
ruby -v

# 1-14-2019: bundler 2.0.1 is incompatible with many gems
echo '----------------'
echo 'gem list bundler'
gem list bundler

sh credentials.sh

gem uninstall capybara-slow_finder_errors
gem uninstall capybara-email
gem uninstall capybara

DATE_START=$(date +%s)

# Removing the old Rails app (if necessary)
if [ -d "$DIR_APP" ]; then
  rm -rf $DIR_APP
fi

echo '-----------------------------------------------'
echo 'BEGIN: installing gems needed by Rails Neutrino'
echo '-----------------------------------------------'
# 1-14-2019: bundler 2.0.1 is incompatible with many gems
# gem install bundler 
gem install insert_from_file
gem install line_containing
gem install gemfile_entry
gem install string_in_file
gem install replace_quotes
gem install remove_double_blank
echo '-----------------------------------------------'
echo 'FINISHED: installing gems needed by Rails Neutrino'
echo '-----------------------------------------------'

# Creating the new Rails app
echo '-------------------------------------'
echo "cd $DIR_PARENT && rails new $APP_NAME"
cd $DIR_PARENT && rails new $APP_NAME
wait

# Migration
echo '-------------------------------'
echo "cd $DIR_APP && rails db:migrate"
cd $DIR_APP && rails db:migrate
wait

# Copy credentials.sh to the new app's root directory
# WICHTIG/LEGACY/bash: add credentials.sh
echo '------------------------------------------------------------------------'
echo 'Copying credentials.sh, mod_app.sh, and the mod directory to the new app'
cp $DIR_MAIN/credentials.sh $DIR_APP

# Adding config/rails_neutrino_timestamp.txt
echo $APP_NAME > $DIR_APP/config/rails_neutrino_timestamp.txt

# Copy mod_app.sh to the new app's root directory
cp $DIR_MAIN/mod_app.sh $DIR_APP

# Copy the mod directory to the new app's root directory
cp -R $DIR_MAIN/mod $DIR_APP

# Modify the new app
cd $DIR_APP && bash mod_app.sh '01-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '01-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '01-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '01-04' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '02-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '02-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '02-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '02-04' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '03-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '03-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '03-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '03-04' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '04-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-05' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-06' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '04-07' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '05-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '05-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '05-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '05-04' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '06-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '06-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '06-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '06-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '06-05' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '07-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '07-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '07-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '07-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '07-05' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '07-06' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '08-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-05' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-06' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '08-07' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '09-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-05' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-06' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '09-07' $TOGGLE_OUTLINE

cd $DIR_APP && bash mod_app.sh '10-01' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '10-02' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '10-03' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '10-04' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '10-05' $TOGGLE_OUTLINE
cd $DIR_APP && bash mod_app.sh '10-06' $TOGGLE_OUTLINE

# Remove the mod* files from the new app
rm -rf $DIR_APP/mod
rm $DIR_APP/mod*

DATE_END=$(date +%s)

T_SEC=$((DATE_END-DATE_START))

echo '##########################################'
echo 'The new app has been created from scratch!'
echo ''
echo "It is located at: $DIR_APP"
echo ''
echo "Time used:"
echo "$((T_SEC/60)) minutes and $((T_SEC%60)) seconds"
echo ''
echo 'Things to check:'
echo '* The .ruby-version and Gemfile should specify the correct Ruby version.'
echo '* All gems in the Gemfile should be pinned.'
echo '* When you run the build_fast.sh script, there should be no errors,'
echo '  no test failures, and no offenses.'
echo ''
echo 'Further instructions on what to do next are in the'
echo 'README-to_do.txt file within your app.'

