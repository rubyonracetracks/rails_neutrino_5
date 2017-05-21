#!/usr/bin/ruby

require 'insert_from_file'
require 'gemfile_entry'
require 'string_in_file'

puts 'Adding minitest and minitest-reporters to the Gemfile'
InsertFromFile.add_end('mod-03-01-add_to_Gemfile.txt', 'Gemfile')
StringInFile.replace("gem 'minitest'", "#{GemfileEntry.latest('minitest')}", 'Gemfile')
StringInFile.replace("gem 'minitest-reporters'", "#{GemfileEntry.latest('minitest-reporters')}", 'Gemfile')

puts 'Adding the use of minitest-reporters to test/test_helper.rb'
InsertFromFile.add_before('mod-03-01-add_to_test_helper.txt', 'test/test_helper.rb', 'class ActiveSupport::TestCase')

puts 'Adding the HTML test reports to .gitignore'
StringInFile.add_end("test/html_reports/\n", '.gitignore')

puts 'Adding test/rake_rerun_reporter.rb'
system('mv mod-03-01-rake_run_reporter.rb test/rake_rerun_reporter.rb')

system('sh kill_spring.sh')
puts 'Adding first integration test'
system('rails generate integration_test test1')
system('wait')
InsertFromFile.add_after('mod-03-01-test1.txt', 'test/integration/test1_test.rb', 'class Test1Test < ActionDispatch::IntegrationTest')

puts 'Making the first integration test pass'
system('mv mod-03-01-public_index.html public/index.html')