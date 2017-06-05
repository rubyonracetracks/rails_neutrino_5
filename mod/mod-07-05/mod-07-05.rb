#!/usr/bin/ruby

require 'line_containing'
require 'insert_from_file'
require 'string_in_file'

puts 'Generating integration test'
system('rails generate integration_test user_resend_conf')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/user_resend_conf_test.rb')
LineContaining.delete_between('class UserResendConfTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/user_resend_conf_test.rb')
InsertFromFile.add_after('mod-07-05-user_resend_conf_test.txt', 'test/integration/user_resend_conf_test.rb', 'class UserResendConfTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/BlockLength\n", 'test/integration/user_resend_conf_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/BlockLength\n", 'test/integration/user_resend_conf_test.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-07-05-routes.txt', 'config/routes.rb', '# BEGIN: user section', '# END: user section')

puts 'Updating app/views/users/confirmations/new.html.erb'
system('mv mod-07-05-new-html.erb app/views/users/confirmations/new.html.erb')
