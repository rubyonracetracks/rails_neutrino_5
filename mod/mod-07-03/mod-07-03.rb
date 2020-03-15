#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'
require 'gemfile_entry'

puts 'Updating the Gemfile'
InsertFromFile.add_end('mod-07-03-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'jquery-rails'", "#{GemfileEntry.active('jquery-rails')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Generating integration test'
system('bundle exec rails generate integration_test user_edit')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_edit_test.rb')
LineContaining.delete_between('class UserEditTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_edit_test.rb')
InsertFromFile.add_after('mod-07-03-user_edit_test.txt', 'test/integration/user_edit_test.rb', 'class UserEditTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/ParameterLists\n", 'test/integration/user_edit_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/MethodLength\n", 'test/integration/user_edit_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize\n", 'test/integration/user_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize\n", 'test/integration/user_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/MethodLength\n", 'test/integration/user_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ParameterLists\n", 'test/integration/user_edit_test.rb')

puts 'Updating test/test_helper.rb'
InsertFromFile.add_before('mod-07-03-test_helper_setup.txt', 'test/test_helper.rb', '# Reset sessions and driver after each integration and controller test')
InsertFromFile.add_end('mod-07-03-test_helper_end.txt', 'test/test_helper.rb')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Style/MixinUsage', '    - test/test_helper.rb', '.rubocop.yml')

puts 'Updating app/views/layouts/_header.html.erb'
InsertFromFile.replace_between('mod-07-03-header.txt', 'app/views/layouts/_header.html.erb', '<%-# BEGIN: USER SECTION -%>', '<%-# END: USER SECTION -%>')

puts 'Updating app/assets/javascripts/application.js (for dropdown menus)'
system('mv mod-07-03-application.js app/assets/javascripts/application.js')

puts 'Updating app/views/users/registrations/edit.html.erb'
system('mv mod-07-03-edit.html.erb app/views/users/registrations/edit.html.erb')

puts 'Updating app/controllers/users/registrations_controller.rb'
LineContaining.replace('before_action :configure_account_update_params', '  before_action :configure_account_update_params, only: [:update]', 'app/controllers/users/registrations_controller.rb')
InsertFromFile.add_before('mod-07-03-registrations_controller.txt', 'app/controllers/users/registrations_controller.rb', '# def configure_account_update_params')

