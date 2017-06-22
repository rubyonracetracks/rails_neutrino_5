#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

puts 'Generating integration test'
system('rails generate integration_test admin_lock')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_lock_test.rb')
LineContaining.delete_between('class AdminLockTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_lock_test.rb')
InsertFromFile.add_after('mod-08-07-admin_lock_test.txt', 'test/integration/admin_lock_test.rb', 'class AdminLockTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("require 'timecop'\n", 'test/integration/admin_lock_test.rb')
StringInFile.add_beginning("# rubocop:disable Metrics/ClassLength\n", 'test/integration/admin_lock_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/ClassLength\n", 'test/integration/admin_lock_test.rb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-08-07-routes.txt', 'config/routes.rb', '# BEGIN: admin section', '# END: admin section')

puts 'Updating app/views/admins/unlocks/new.html.erb'
system('mv mod-08-07-new.html.erb app/views/admins/unlocks/new.html.erb')
