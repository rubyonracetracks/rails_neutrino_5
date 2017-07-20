#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'string_in_file'

system('rails generate integration_test admin_show')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_show_test.rb')
LineContaining.delete_between('class AdminShowTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_show_test.rb')
InsertFromFile.add_after('mod-10-02-admin_show_test.txt', 'test/integration/admin_show_test.rb', 'class AdminShowTest < ActionDispatch::IntegrationTest')

puts 'Filling in app/views/admins/show.html.erb'
system('mv mod-10-02-show.html.erb app/views/admins/show.html.erb')

puts 'Updating app/views/layouts/_header.html.erb'
InsertFromFile.add_before('mod-10-02-header.txt', 'app/views/layouts/_header.html.erb', 'edit_admin_registration_path(current_admin)')
