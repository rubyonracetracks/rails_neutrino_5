#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating user controller'
system('rails generate controller Users new')
system('wait')
system('rm app/helpers/users_helper.rb')
system('rm app/views/users/new.html.erb')
StringInFile.replace('  end', '', 'test/controllers/users_controller_test.rb')
LineContaining.delete_between('UsersControllerTest < ActionDispatch::IntegrationTest', 'end', 'test/controllers/users_controller_test.rb')

puts 'Updating user controller test'
InsertFromFile.add_after('mod-09-01-users_controller_test.txt', 'test/controllers/users_controller_test.rb', 'class UsersControllerTest < ActionDispatch::IntegrationTest')

puts 'Updating test/test_helper.rb'
InsertFromFile.add_after('mod-09-01-test_helper.txt', 'test/test_helper.rb', 'include Capybara::Email::DSL')

puts 'Updating config/routes.rb'
InsertFromFile.add_before('mod-09-01-routes.txt', 'config/routes.rb', '# END: user section')

puts 'Updating app/controllers/users_controller.rb'
StringInFile.replace('  end', '', 'app/controllers/users_controller.rb')
LineContaining.delete_between('class UsersController < ApplicationController', 'end', 'app/controllers/users_controller.rb')
InsertFromFile.add_after('mod-09-01-users_controller.txt', 'app/controllers/users_controller.rb', 'class UsersController < ApplicationController')
LineContaining.add_before('class UsersController < ApplicationController', '#', 'app/controllers/users_controller.rb')

puts 'touch app/views/users/show.html.erb'
system('touch app/views/users/show.html.erb')
