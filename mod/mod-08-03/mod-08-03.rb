#!/usr/bin/ruby

require 'line_containing'
require 'string_in_file'
require 'insert_from_file'

puts 'Generating integration test'
system('rails generate integration_test admin_login')
system('wait')

puts 'Filling in integration tests'
LineContaining.delete('  # end', 'test/integration/admin_login_test.rb')
LineContaining.delete_between('class AdminLoginTest < ActionDispatch::IntegrationTest', 'end', 'test/integration/admin_login_test.rb')
InsertFromFile.add_after('mod-08-03-admin_login_test.txt', 'test/integration/admin_login_test.rb', 'class AdminLoginTest < ActionDispatch::IntegrationTest')
StringInFile.add_beginning("# rubocop:disable Metrics/AbcSize", 'test/integration/admin_login_test.rb')
StringInFile.add_end("# rubocop:enable Metrics/AbcSize", 'test/integration/admin_login_test.rb')

puts 'Adding the login_admin function to test/test_helper.rb'
InsertFromFile.add_end('mod-08-03-test_helper.txt', 'test/test_helper.rb')

puts 'Updating the header'
InsertFromFile.add_after('mod-08-03-header.txt', 'app/views/layouts/_header.html.erb', '<%-# END: USER SECTION -%>')

puts 'Updating the user login page'
InsertFromFile.add_end('mod-08-03-users_sessions_new.txt', 'app/views/users/sessions/new.html.erb')

puts 'Updating config/routes.rb'
InsertFromFile.replace_between('mod-08-03-routes.txt', 'config/routes.rb', '# BEGIN: admin section', '# END: admin section')

puts 'Updating the admin login page'
system('mv mod-08-03-admins_sessions_new.html.erb app/views/admins/sessions/new.html.erb')

puts 'Removing the admin signup option'
LineContaining.delete('link_to "Sign up"', 'app/views/admins/shared/_links.html.erb')

# REFERENCE: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address

puts 'Updating app/models/admin.rb'
InsertFromFile.add_after('mod-08-03-admin.txt', 'app/models/admin.rb', '  # END: devise modules')

puts 'Updating app/views/static_pages/home.html.erb'
InsertFromFile.add_after('mod-08-03-home.txt', 'app/views/static_pages/home.html.erb', '<% # END: USER SECTION %>')

puts 'Making the admin model exempt from the Lint/AssignmentInCondition cop'
LineContaining.add_before('# END: Lint/AssignmentInCondition', '    - app/models/admin.rb', '.rubocop.yml')

puts 'Making the admin model exempt from the Lint/AssignmentInCondition cop'
LineContaining.add_before('# END: Metrics/LineLength', '    - app/models/admin.rb', '.rubocop.yml')
