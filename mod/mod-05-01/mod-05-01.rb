#!/usr/bin/ruby

require 'line_containing'

puts 'Adding title helper test'
system('mv 05-01-application_helper_test.rb test/helpers/application_helper_test.rb')

puts 'Adding title helper'
system('mv 05-01-application_helper.rb app/helpers/application_helper.rb')

puts 'Making test/helpers/application_helper_test.rb exempt from Layout/LineLength cop'
LineContaining.add_before('# END: Layout/LineLength', '    - test/helpers/application_helper_test.rb', '.rubocop.yml')
