#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('bundle exec rails generate integration_test admin_signup')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_signup_test.rb')
LineContaining.delete_between('class AdminSignupTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_signup_test.rb')
InsertFromFile.add_after('mod-08-02-admin_signup_test.txt', 'test/integration/admin_signup_test.rb', 'class AdminSignupTest < ActionDispatch::IntegrationTest')

puts 'Updating config/routes.rb'
InsertFromFile.replace('mod-08-02-routes.txt', 'config/routes.rb', 'devise_for :admins')

puts 'bundle exec rails generate devise:controllers admins'
system('bundle exec rails generate devise:controllers admins')
system('wait')

puts 'Filtering /app/controllers/admins/omniauth_callbacks_controller.rb from SimpleCov'
LineContaining.add_after('SimpleCov.start :rails', "  add_filter '/app/controllers/admins/omniauth_callbacks_controller.rb'", 'test/test_helper.rb')

puts 'bundle exec rails generate devise:views admins'
system('bundle exec rails generate devise:views admins')
system('wait')

puts 'Updating the messages to admins in app/views/admins/mailer/*'
InsertFromFile.add_beginning('mod-08-02-message_start.txt', 'app/views/admins/mailer/confirmation_instructions.html.erb')
InsertFromFile.add_beginning('mod-08-02-message_start.txt', 'app/views/admins/mailer/email_changed.html.erb')
InsertFromFile.add_beginning('mod-08-02-message_start.txt', 'app/views/admins/mailer/password_change.html.erb')
InsertFromFile.add_beginning('mod-08-02-message_start.txt', 'app/views/admins/mailer/reset_password_instructions.html.erb')
InsertFromFile.add_beginning('mod-08-02-message_start.txt', 'app/views/admins/mailer/unlock_instructions.html.erb')

puts 'rm app/views/admins/registrations/new.html.erb'
system('rm app/views/admins/registrations/new.html.erb')

puts 'Updating app/controllers/admins/registrations_controller.rb'
InsertFromFile.add_before('mod-08-02-registrations_controller_new.txt', 'app/controllers/admins/registrations_controller.rb', '# def new')
LineContaining.add_before('class Admins::RegistrationsController < Devise::RegistrationsController', '#', 'app/controllers/admins/registrations_controller.rb')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Style/ClassAndModuleChildren', '    - app/controllers/admins/*', '.rubocop.yml')

puts 'Updating config/rails_best_practices.yml'
InsertFromFile.replace('mod-08-02-rails_best_practices.txt', 'config/rails_best_practices.yml', 'RemoveUnusedMethodsInControllersCheck')
