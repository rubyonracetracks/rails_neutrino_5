#!/usr/bin/ruby

require 'line_containing'
require 'insert_from_file'
require 'string_in_file'

puts 'Generating integration test'
system('bundle exec rails generate integration_test admin_edit')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_edit_test.rb')
LineContaining.delete_between('class AdminEditTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_edit_test.rb')
InsertFromFile.add_after('mod-08-04-admin_edit_test.txt', 'test/integration/admin_edit_test.rb', 'class AdminEditTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/ClassLength\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/MethodLength\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/ParameterLists\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ClassLength\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/MethodLength\n", 'test/integration/admin_edit_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ParameterLists\n", 'test/integration/admin_edit_test.rb')

puts 'Updating test/test_helper.rb'
InsertFromFile.add_end('mod-08-04-test_helper_end.txt', 'test/test_helper.rb')

puts 'Updating the header'
InsertFromFile.replace_between('mod-08-04-header.txt', 'app/views/layouts/_header.html.erb', '<%-# BEGIN: ADMIN SECTION -%>', '<%-# END: ADMIN SECTION -%>')

puts 'Updating app/views/admins/registrations/edit.html.erb'
system('mv mod-08-04-edit.html.erb app/views/admins/registrations/edit.html.erb')

puts 'Updating app/controllers/admins/registrations_controller.rb'
LineContaining.replace('before_action :configure_account_update_params', '  before_action :configure_account_update_params, only: [:update]', 'app/controllers/admins/registrations_controller.rb')
InsertFromFile.add_before('mod-08-04-registrations_controller.txt', 'app/controllers/admins/registrations_controller.rb', '# def configure_account_update_params')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Style/SymbolArray', '    - app/controllers/admins/registrations_controller.rb', '.rubocop.yml')
