#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('rails generate integration_test admin_signup')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_signup_test.rb')
LineContaining.delete_between('class AdminSignupTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_signup_test.rb')
InsertFromFile.add_after('mod-08-02-admin_signup_test.txt', 'test/integration/admin_signup_test.rb', 'class AdminSignupTest < ActionDispatch::IntegrationTest')

puts 'Updating config/routes.rb'
InsertFromFile.replace('mod-08-02-routes.txt', 'config/routes.rb', 'devise_for :admins')

puts 'rails generate devise:controllers admins'
system('rails generate devise:controllers admins')
system('wait')

puts 'rails generate devise:views admins'
system('rails generate devise:views admins')
system('wait')

puts 'rm app/views/admins/registrations/new.html.erb'
system('rm app/views/admins/registrations/new.html.erb')

puts 'Updating app/controllers/admins/registrations_controller.rb'
InsertFromFile.add_before('mod-08-02-registrations_controller_new.txt', 'app/controllers/admins/registrations_controller.rb', '# def new')
InsertFromFile.add_before('mod-08-02-registrations_controller_create.txt', 'app/controllers/admins/registrations_controller.rb', '# def create')
StringInFile.add_beginning("#\n", 'app/controllers/admins/registrations_controller.rb')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Style/ClassAndModuleChildren', '    - app/controllers/admins/*', '.rubocop.yml')

puts 'Updating config/rails_best_practices.yml'
InsertFromFile.replace('mod-08-02-rails_best_practices.txt', 'config/rails_best_practices.yml', 'RemoveUnusedMethodsInControllersCheck')
