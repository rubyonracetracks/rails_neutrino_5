#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('rails generate integration_test admin_password_reset')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_password_reset_test.rb')
LineContaining.delete_between('class AdminPasswordResetTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_password_reset_test.rb')
InsertFromFile.add_after('mod-08-05-admin_password_reset_test.txt', 'test/integration/admin_password_reset_test.rb', 'class AdminPasswordResetTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/MethodLength\n", 'test/integration/admin_password_reset_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize\n", 'test/integration/admin_password_reset_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize\n", 'test/integration/admin_password_reset_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/MethodLength\n", 'test/integration/admin_password_reset_test.rb')

puts 'Updating test/test_helper.rb'
InsertFromFile.add_end('mod-08-05-test_helper.txt', 'test/test_helper.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-08-05-routes.txt', 'config/routes.rb', '# BEGIN: admin section', '# END: admin section')

puts 'Updating app/views/admins/passwords/new.html.erb'
system('mv mod-08-05-new.html.erb app/views/admins/passwords/new.html.erb')

puts 'Updating app/views/users/passwords/edit.html.erb'
system('mv mod-08-05-edit.html.erb app/views/admins/passwords/edit.html.erb')
