#!/usr/bin/ruby

require 'insert_from_file'
require 'string_in_file'

InsertFromFile.add_before('mod-03-01-add_to_test_helper.txt', 'test/test_helper.rb', 'class ActiveSupport::TestCase')

StringInFile.add_end("test/html_reports/\n", '.gitignore')
