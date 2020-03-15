#!/usr/bin/ruby

require 'line_containing'
require 'insert_from_file'
require 'string_in_file'

puts 'Generating integration test'
system('bundle exec rails generate integration_test admin_resend_conf')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_resend_conf_test.rb')
LineContaining.delete_between('class AdminResendConfTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_resend_conf_test.rb')
InsertFromFile.add_after('mod-08-06-admin_resend_conf_test.txt', 'test/integration/admin_resend_conf_test.rb', 'class AdminResendConfTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize\n", 'test/integration/admin_resend_conf_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/MethodLength\n", 'test/integration/admin_resend_conf_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/ParameterLists\n", 'test/integration/admin_resend_conf_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ParameterLists\n", 'test/integration/admin_resend_conf_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/MethodLength\n", 'test/integration/admin_resend_conf_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize\n", 'test/integration/admin_resend_conf_test.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-08-06-routes.txt', 'config/routes.rb', '# BEGIN: admin section', '# END: admin section')

puts 'Updating app/views/admins/confirmations/new.html.erb'
system('mv mod-08-06-new.html.erb app/views/admins/confirmations/new.html.erb')
