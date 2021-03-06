#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('bundle exec rails generate integration_test user_signup')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_signup_test.rb')
LineContaining.delete_between('class UserSignupTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_signup_test.rb')
InsertFromFile.add_after('mod-07-01-user_signup_test.txt', 'test/integration/user_signup_test.rb', 'class UserSignupTest < ActionDispatch::IntegrationTest')

puts 'Adding the sign_up_user to test/test_helper.rb'
InsertFromFile.add_end('mod-07-01-test_helper.txt', 'test/test_helper.rb')

puts 'Updating app/views/static_pages/home.html.erb'
system('mv mod-07-01-home.html.erb app/views/static_pages/home.html.erb')

puts 'Updating config/routes.rb'
InsertFromFile.replace('mod-07-01-routes.txt', 'config/routes.rb', 'devise_for :users')

puts 'bundle exec rails generate devise:controllers users'
system('bundle exec rails generate devise:controllers users')
system('wait')

puts 'Filtering /app/controllers/users/omniauth_callbacks_controller.rb from SimpleCov'
LineContaining.add_after('SimpleCov.start :rails', "  add_filter '/app/controllers/users/omniauth_callbacks_controller.rb'", 'test/test_helper.rb')

puts 'bundle exec rails generate devise:views users'
system('bundle exec rails generate devise:views users')
system('wait')

puts 'Updating the messages to users in app/views/users/mailer/*'
InsertFromFile.add_beginning('mod-07-01-message_start.txt', 'app/views/users/mailer/confirmation_instructions.html.erb')
InsertFromFile.add_beginning('mod-07-01-message_start.txt', 'app/views/users/mailer/email_changed.html.erb')
InsertFromFile.add_beginning('mod-07-01-message_start.txt', 'app/views/users/mailer/password_change.html.erb')
InsertFromFile.add_beginning('mod-07-01-message_start.txt', 'app/views/users/mailer/reset_password_instructions.html.erb')
InsertFromFile.add_beginning('mod-07-01-message_start.txt', 'app/views/users/mailer/unlock_instructions.html.erb')

puts 'Adding app/views/users/registrations/new.html.erb'
system('mv mod-07-01-new.html.erb app/views/users/registrations/new.html.erb')

puts 'Making the user controllers comply with Rubocop'
StringInFile.add_beginning("#\n", 'app/controllers/users/omniauth_callbacks_controller.rb')
StringInFile.add_beginning("#\n", 'app/controllers/users/confirmations_controller.rb')
StringInFile.add_beginning("#\n", 'app/controllers/users/sessions_controller.rb')
StringInFile.add_beginning("#\n", 'app/controllers/users/passwords_controller.rb')
StringInFile.add_beginning("#\n", 'app/controllers/users/unlocks_controller.rb')
LineContaining.add_before('class Users::RegistrationsController < Devise::RegistrationsController', '#', 'app/controllers/users/registrations_controller.rb')

puts 'Updating app/controllers/users/registrations_controller.rb'
StringInFile.replace('# before_action :configure_sign_up_params', 'before_action :configure_sign_up_params', 'app/controllers/users/registrations_controller.rb')
InsertFromFile.add_before('mod-07-01-registrations_controller.txt', 'app/controllers/users/registrations_controller.rb', '# def configure_sign_up_params')

puts 'Updating config/environments/development.rb and config/environments/test.rb'
InsertFromFile.add_after('mod-07-01-development.txt', 'config/environments/development.rb', 'Rails.application.configure do')
InsertFromFile.add_after('mod-07-01-development.txt', 'config/environments/test.rb', 'Rails.application.configure do')

puts 'Adding Bootstrap styling for forms, errors, and alerts'
InsertFromFile.add_end('mod-07-01-custom_scss.txt', 'app/assets/stylesheets/custom.scss')

puts 'Updating .rubocop.yml (Style/ClassAndModuleChildren)'
LineContaining.add_before('# END: Style/ClassAndModuleChildren', '    - app/controllers/users/*', '.rubocop.yml')

puts 'Updating .rubocop.yml (Style/SymbolArray)'
LineContaining.add_before('# END: Style/SymbolArray', '    - app/controllers/users/registrations_controller.rb', '.rubocop.yml')
