#!/usr/bin/ruby

require 'insert_from_file'
require 'gemfile_entry'

InsertFromFile.add_end('mod-03-01-add_to_Gemfile.txt', 'Gemfile')
StringInFile.replace("gem 'minitest'", "#{GemfileEntry.latest('minitest')}", 'Gemfile')
StringInFile.replace("gem 'minitest-reporters'", "#{GemfileEntry.latest('minitest-reporters')}", 'Gemfile')
