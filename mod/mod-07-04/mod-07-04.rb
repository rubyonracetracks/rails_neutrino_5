#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

puts 'Generating integration test'
system('bundle exec rails generate integration_test user_password_reset')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_password_reset_test.rb')
LineContaining.delete_between('class UserPasswordResetTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_password_reset_test.rb')
InsertFromFile.add_after('mod-07-04-user_password_reset_test.txt', 'test/integration/user_password_reset_test.rb', 'class UserPasswordResetTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/MethodLength\n", 'test/integration/user_password_reset_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize\n", 'test/integration/user_password_reset_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize\n", 'test/integration/user_password_reset_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/MethodLength\n", 'test/integration/user_password_reset_test.rb')

puts 'Updating test/test_helper.rb'
InsertFromFile.add_end('mod-07-04-test_helper.txt', 'test/test_helper.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-07-04-routes.txt', 'config/routes.rb', '# BEGIN: user section', '# END: user section')

puts 'Updating app/views/users/passwords/new.html.erb'
system('mv mod-07-04-new.html.erb app/views/users/passwords/new.html.erb')

puts 'Updating app/views/users/passwords/edit.html.erb'
system('mv mod-07-04-edit.html.erb app/views/users/passwords/edit.html.erb')

puts 'Updating .rubocop.yml'
InsertFromFile.add_end('mod-07-04-rubocop.txt', '.rubocop.yml')

puts 'Updating config/rails_best_practices.yml'
LineContaining.replace('RemoveTrailingWhitespaceCheck', "RemoveTrailingWhitespaceCheck: { ignored_files: ['config/routes.rb'] }", 'config/rails_best_practices.yml')
