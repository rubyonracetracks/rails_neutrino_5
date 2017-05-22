#!/bin/bash

# Install and set up the Devise gem.

# AGENDA
# * Add the devise gem to the Gemfile.
# * Create the config/initializers/devise.rb and config/locales/devise.en.yml files.
# * Change the email address in config/initializers/devise.rb to somebody@rubyonracetracks.com

echo '####################################################'
echo 'Unit 5 Chapter 2: Creating the User and Admin Models'
echo '####################################################'

git checkout -b 05-02-create_models

echo '--------------------------'
echo 'rails generate devise USER'
rails generate devise USER
wait
echo '---------------------------'
echo 'rails generate devise ADMIN'
rails generate devise ADMIN
wait
echo '----------------'
echo 'rails db:migrate'
rails db:migrate

echo 'Making the user and admin test fixtures blank so that tests pass'
cp mod-05-02-test_fixtures_initial.yml test/fixtures/users.yml
cp mod-05-02-test_fixtures_initial.yml test/fixtures/admins.yml

ruby mod-05-02.rb

git add .
git commit -m "Created the user and admin models"
git checkout master
git merge 05-02-create_models
