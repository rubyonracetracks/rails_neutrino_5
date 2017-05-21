#!/usr/bin/ruby

require 'insert_from_file'

InsertFromFile.add_after('mod-03-01-test1.txt', 'test/integration/test1_test.rb', 'class Test1Test < ActionDispatch::IntegrationTest')
