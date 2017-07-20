#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'
require 'gemfile_entry'

puts 'Updating the admin controller tests'
InsertFromFile.add_after('mod-10-03-admins_controller_test.txt', 'test/controllers/admins_controller_test.rb', '# END: SHOW')

puts 'Updating config/routes.rb'
LineContaining.replace('resources :admins', '  resources :admins, only: [:show, :index]', "config/routes.rb")

puts 'Updating app/controllers/admins_controller.rb'
LineContaining.add_before('# END: before_action section', '  before_action :may_index_admin, only: [:index]', 'app/controllers/admins_controller.rb')
InsertFromFile.add_before('mod-10-03-admins_controller_index.txt', 'app/controllers/admins_controller.rb', '# END: ACTION SECTION')
InsertFromFile.add_before('mod-10-03-admins_controller_private.txt', 'app/controllers/admins_controller.rb', '# END: private section')

puts 'touch app/views/admins/index.html.erb'
system('touch app/views/admins/index.html.erb')
