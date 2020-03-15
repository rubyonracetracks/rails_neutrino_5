#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('bundle exec rails generate integration_test admin_delete')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_delete_test.rb')
LineContaining.delete_between('class AdminDeleteTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_delete_test.rb')
InsertFromFile.add_after('mod-10-06-admin_delete_test.txt', 'test/integration/admin_delete_test.rb', 'class AdminDeleteTest < ActionDispatch::IntegrationTest')

puts 'Updating app/views/admins/show.html.erb'
InsertFromFile.add_before('mod-10-06-show.txt', 'app/views/admins/show.html.erb', '</section>')
