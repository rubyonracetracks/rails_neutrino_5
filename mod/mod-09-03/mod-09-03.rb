#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'
require 'gemfile_entry'

puts 'Adding pagination gems to the Gemfile'
InsertFromFile.add_end('mod-09-03-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'kaminari'", "#{GemfileEntry.active('kaminari')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Updating config/locales/en.yml'
InsertFromFile.add_end('mod-09-03-config_locales_en_yml.txt', 'config/locales/en.yml')

puts 'Updating the user controller tests'
InsertFromFile.add_after('mod-09-03-users_controller_test.txt', 'test/controllers/users_controller_test.rb', '# END: SHOW')

puts 'Updating config/routes.rb'
LineContaining.replace('resources :users', '  resources :users, only: [:show, :index]', "config/routes.rb")

puts 'Updating app/controllers/users_controller.rb'
LineContaining.add_before('# END: before_action section', '  before_action :may_index_user, only: [:index]', 'app/controllers/users_controller.rb')
InsertFromFile.add_before('mod-09-03-users_controller_index.txt', 'app/controllers/users_controller.rb', '# END: ACTION SECTION')
InsertFromFile.add_before('mod-09-03-users_controller_private.txt', 'app/controllers/users_controller.rb', '# END: private section')

puts 'touch app/views/users/index.html.erb'
system('touch app/views/users/index.html.erb')
