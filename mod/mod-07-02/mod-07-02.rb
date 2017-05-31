#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('rails generate integration_test user_login')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_login_test.rb')
LineContaining.delete_between('class UserLoginTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_login_test.rb')
InsertFromFile.add_after('mod-07-02-user_login_test.txt', 'test/integration/user_login_test.rb', 'class UserLoginTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize", 'test/integration/user_login_test.rb')
StringInFile.add_end("\n# rubocop:enable Metrics/AbcSize", 'test/integration/user_login_test.rb')

puts 'Adding the login_user function to test/test_helper.rb'
InsertFromFile.add_end('mod-07-02-test_helper.txt', 'test/test_helper.rb')

puts 'Updating app/views/layouts/_header.html.erb'
system('mv mod-07-02-header.html.erb app/views/layouts/_header.html.erb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-07-02-routes.txt', 'config/routes.rb', '# BEGIN: user section', '# END: user section')

puts 'Updating app/views/users/sessions/new.html.erb'
system('mv mod-07-02-new.html.erb app/views/users/sessions/new.html.erb')

puts 'Updating app/views/static_pages/home.html.erb'
system('mv mod-07-02-home.html.erb app/views/static_pages/home.html.erb')

# REFERENCE: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address

puts 'Updating app/controllers/application_controller.rb'
InsertFromFile.add_before('mod-07-02-application_controller.txt', 'app/controllers/application_controller.rb', 'end')

puts 'Updating app/models/user.rb'
InsertFromFile.add_after('mod-07-02-user.txt', 'app/models/user.rb', 'class User < ApplicationRecord')

puts 'Updating config/initializers/devise.rb'
LineContaining.add_after('Devise.setup do |config|', '  config.authentication_keys = [:login]', 'config/initializers/devise.rb')

puts 'Updating config/rails_best_practices.yml'
InsertFromFile.replace('mod-07-02-rails_best_practices.txt', 'config/rails_best_practices.yml', 'RemoveUnusedMethodsInModelsCheck')
